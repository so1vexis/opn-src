--[[
    ROBLOX FPS OPTIMIZER / BOOSTER
    PERFORMANCE OPTIMIZER

    PURPOSE:
        This script boosts FPS in Roblox by culling invisible and distant
        objects, effects, and avatars, as well as removing the frame rate cap.

    OPERATING MODES:
        EXEC    - Extended mode (requires exploit functions: sethiddenproperty,
                  hookfunction, getgc, setfpscap, etc.)
        VANILLA - Standard mode (works with public API only)

    WHAT GETS OPTIMIZED:

        1. FPS UNLOCK
           • Removes frame cap via setfpscap, UserSettings, Rendering
           • Target value: 9999 FPS (or CONFIG.MaxFps)

        2. TINY DECORATIVE OBJECTS (Tiny Decor)
           • Finds BaseParts smaller than 2 studs with no collisions
           • Hides them (LocalTransparencyModifier = 1) beyond 90 studs
           • Restores visibility within 70 studs
           • Skips objects with important children (GUI, lights, particles)

        3. PARTICLES (ParticleEmitter)
           • Disables Enabled beyond 160 studs
           • Re-enables within 130 studs

        4. TRAILS AND BEAMS (Trail, Beam)
           • Disables Enabled beyond 160 studs
           • Re-enables within 130 studs

        5. LEGACY EFFECTS (Fire, Smoke, Sparkles, Explosion)
           • Disables Enabled / Visible beyond 130 studs
           • Re-enables within 100 studs

        6. LIGHT SOURCES (Light - PointLight, SpotLight, SurfaceLight)
           • Disables Enabled beyond 220 studs
           • Re-enables within 180 studs

        7. WORLD GUI (SurfaceGui, BillboardGui)
           • Disables Enabled beyond 140 studs
           • Re-enables within 110 studs

        8. OTHER PLAYERS' AVATARS
           • Fully hides characters (LocalTransparencyModifier = 1)
           • Beyond 110 studs - hides, within 85 studs - shows
           • Own character is NEVER touched

        9. RUNTIME FFLAGS
           • Forces hidden Roblox engine flags:
             - CSG mesh LOD switching distances
             - Culling pixel thresholds
             - Local light update limits
             - TaskScheduler target FPS

    HOW SCANNING WORKS:
        • Recursively scans Workspace and Lighting
        • Works in chunks (~1.4ms per frame) to avoid lag
        • Tracks new objects via DescendantAdded
        • All found objects enter the managed list (ML)

    HOW CULLING WORKS:
        • Every 0.06 seconds (CONFIG.CullInterval) checks distance to camera
        • Processes objects in chunks (~1.4ms) - ring buffer style
        • Accounts for frustum (off-screen objects get culled sooner)
        • Every 24 cycles cleans dead entries (compact)

    PROTECTED OBJECTS:
        • Objects tagged "Optimize.Never" (CollectionService) are ignored
        • Objects inside such parents are also ignored

    CLEANUP ON DESTRUCTION:
        • When script is destroyed (script.Destroying) restores EVERYTHING:
          - Visibility of parts, effects, lights, GUI
          - Visibility of other players' avatars
          • Disconnects all connections (Heartbeat, DescendantAdded, etc.)

    DATA STRUCTURES:
        • ML / MP     - managed objects list and index map
        • charList    - list of other players' characters
        • scanStack   - stack for recursive scanning
        • connections - all created Connect connections (for cleanup)

    CONFIGURATION (CONFIG):
        All parameters (distances, intervals, budgets) are set in the CONFIG
        table at the top of the script. Setting Enabled = false fully disables
        the script.

--]]

local RunService = game:GetService('RunService')

if not RunService:IsClient() then
    return
end

local Players = game:GetService('Players')
local Lighting = game:GetService('Lighting')
local Workspace = game:GetService('Workspace')
local CollectionService = game:GetService('CollectionService')
local LocalPlayer = Players.LocalPlayer
local EXEC = (type(sethiddenproperty) == 'function') or (type(gethiddenproperty) == 'function') or (type(setfflag) == 'function') or (type(getconnections) == 'function') or (type(getgc) == 'function') or (type(hookfunction) == 'function') or (type(setfpscap) == 'function') or (type(getrawmetatable) == 'function')
local CONFIG = {
    Enabled = true,
    FpsUnlock = true,
    MaxFps = 9999,
    CullTinyDecor = true,
    TinyDecorMaxSize = 2,
    TinyDecorCull = 90,
    TinyDecorRestore = 70,
    CullParticles = true,
    ParticleCull = 160,
    ParticleRestore = 130,
    CullTrailsBeams = true,
    TrailCull = 160,
    TrailRestore = 130,
    CullLegacy = true,
    LegacyCull = 130,
    LegacyRestore = 100,
    CullLights = true,
    LightCull = 220,
    LightRestore = 180,
    CullWorldGui = true,
    GuiCull = 140,
    GuiRestore = 110,
    CullAvatars = true,
    AvatarCull = 110,
    AvatarRestore = 85,
    FrustumMinDistance = 70,
    HealthDisplayZero = true,
    ApplyRuntimeFFlags = true,
    CullInterval = 0.06,
    CullBudgetMs = 1.4,
    ScanBudgetMs = 1.4,
    CompactEvery = 24,
    MaxManaged = 80000,
}

if CONFIG.Enabled == false then
    return
end
if not CONFIG.CullInterval or CONFIG.CullInterval < 0.02 then
    CONFIG.CullInterval = 0.02
end
if not CONFIG.CullBudgetMs or CONFIG.CullBudgetMs < 0.2 then
    CONFIG.CullBudgetMs = 0.2
end

local ML = {}
local MP = {}
local cursor = 1
local compactCounter = 0
local charList = {}
local charMap = {}
local ownCharRoots = {}
local otherCharRoots = setmetatable({}, {
    __mode = 'k',
})
local scanStack = {}
local scanTop = 0
local scanConnection = nil
local cullConnection = nil
local connections = {}
local destroyed = false
local cullAccumulator = 0
local RUNTIME_FLAGS = {
    DFIntTaskSchedulerTargetFps = '9999',
    FFlagGameBasicSettingsFramerateCap5 = 'true',
    FFlagFastGPULightCulling3 = 'true',
    FIntRenderLocalLightUpdatesMax = '2',
    FIntRenderLocalLightUpdatesMin = '1',
    DFIntCullFactorPixelThresholdMainViewHighQuality = '80',
    DFIntCullFactorPixelThresholdMainViewLowQuality = '40',
    DFIntCullFactorPixelThresholdShadowMapHighQuality = '160',
    DFIntCullFactorPixelThresholdShadowMapLowQuality = '80',
    DFIntCSGLevelOfDetailSwitchingDistance = '150',
    DFIntCSGLevelOfDetailSwitchingDistanceL12 = '110',
    DFIntCSGLevelOfDetailSwitchingDistanceL23 = '70',
    DFIntCSGLevelOfDetailSwitchingDistanceL34 = '40',
}

local function connect(signal, fn)
    local c = signal:Connect(fn)

    table.insert(connections, c)

    return c
end
local function hasTag(inst, tag)
    local ok, v = pcall(function()
        return CollectionService:HasTag(inst, tag)
    end)

    return ok and v
end
local function isProtected(inst)
    if not inst then
        return false
    end
    if hasTag(inst, 'Optimize.Never') then
        return true
    end

    local p = inst.Parent

    if p and hasTag(p, 'Optimize.Never') then
        return true
    end

    return false
end
local function inSetWalk(inst, set)
    local node = inst

    for _ = 1, 16 do
        if not node then
            return false
        end
        if set[node] then
            return true
        end

        node = node.Parent
    end

    return false
end
local function setLTM(inst, value)
    inst.LocalTransparencyModifier = value
end
local function setHiddenOrSet(inst, prop, value)
    if EXEC and type(sethiddenproperty) == 'function' then
        pcall(function()
            sethiddenproperty(inst, prop, value)
        end)
    else
        pcall(function()
            inst[prop] = value
        end)
    end
end
local function resolveType(anchor)
    if not anchor then
        return 0, nil
    end
    if anchor:IsA('BasePart') then
        return 1, anchor
    end
    if anchor:IsA('Attachment') then
        return 2, anchor
    end
    if anchor:IsA('Model') then
        return 3, anchor
    end

    return 0, nil
end
local function anchorPos(at, anchor)
    if at == 1 then
        return anchor.Position
    elseif at == 2 then
        return anchor.WorldPosition
    elseif at == 3 then
        return anchor:GetPivot().Position
    end

    return nil
end
local function removeManaged(inst)
    local i = MP[inst]

    if not i then
        return
    end

    local n = #ML

    if i ~= n then
        local last = ML[n]

        ML[i] = last
        MP[last.inst] = i
    end

    ML[n] = nil
    MP[inst] = nil

    if cursor > #ML then
        cursor = 1
    end
end
local function registerEntry(inst, kind, orig, extra)
    if destroyed or MP[inst] then
        return
    end
    if #ML >= (CONFIG.MaxManaged or 80000) then
        return
    end

    local e = {
        inst = inst,
        kind = kind,
        orig = orig,
        culled = false,
        dead = false,
    }

    if extra then
        for k, v in extra do
            e[k] = v
        end
    end

    ML[#ML + 1] = e
    MP[inst] = #ML
end
local function hasImportantChild(inst)
    if inst:FindFirstChildOfClass('SurfaceGui') then
        return true
    end
    if inst:FindFirstChildOfClass('BillboardGui') then
        return true
    end
    if inst:FindFirstChildOfClass('ProximityPrompt') then
        return true
    end
    if inst:FindFirstChildOfClass('ClickDetector') then
        return true
    end
    if inst:FindFirstChildOfClass('Light') then
        return true
    end
    if inst:FindFirstChildOfClass('ParticleEmitter') then
        return true
    end
    if inst:FindFirstChildOfClass('Trail') then
        return true
    end
    if inst:FindFirstChildOfClass('Beam') then
        return true
    end
    if inst:FindFirstChildOfClass('Fire') then
        return true
    end
    if inst:FindFirstChildOfClass('Smoke') then
        return true
    end
    if inst:FindFirstChildOfClass('Sparkles') then
        return true
    end

    return false
end
local function processGeometry(inst)
    if not CONFIG.CullTinyDecor then
        return
    end
    if not inst:IsA('BasePart') then
        return
    end
    if MP[inst] then
        return
    end
    if inSetWalk(inst, otherCharRoots) then
        return
    end

    local size = inst.Size
    local mx = size.X

    if size.Y > mx then
        mx = size.Y
    end
    if size.Z > mx then
        mx = size.Z
    end
    if not (mx < (CONFIG.TinyDecorMaxSize or 2)) then
        return
    end
    if inst.CanCollide then
        return
    end
    if hasImportantChild(inst) then
        return
    end

    local orig = inst.LocalTransparencyModifier

    if type(orig) ~= 'number' then
        orig = 0
    end

    registerEntry(inst, 'part', orig, nil)
end
local function processParticles(inst)
    if not CONFIG.CullParticles then
        return
    end
    if not inst:IsA('ParticleEmitter') then
        return
    end
    if MP[inst] then
        return
    end
    if inst.Enabled ~= true then
        return
    end

    registerEntry(inst, 'particle', true, nil)
end
local function processTrailBeam(inst)
    if not CONFIG.CullTrailsBeams then
        return
    end
    if not (inst:IsA('Trail') or inst:IsA('Beam')) then
        return
    end
    if MP[inst] then
        return
    end
    if inst.Enabled ~= true then
        return
    end

    registerEntry(inst, 'trailbeam', true, nil)
end
local function processLegacy(inst)
    if not CONFIG.CullLegacy then
        return
    end
    if inst:IsA('Explosion') then
        if MP[inst] then
            return
        end

        registerEntry(inst, 'legacy', true, {isExplosion = true})

        return
    end
    if inst:IsA('Fire') or inst:IsA('Smoke') or inst:IsA('Sparkles') then
        if MP[inst] then
            return
        end
        if inst.Enabled ~= true then
            return
        end

        registerEntry(inst, 'legacy', true, {isExplosion = false})
    end
end
local function processLight(inst)
    if not CONFIG.CullLights then
        return
    end
    if not inst:IsA('Light') then
        return
    end
    if MP[inst] then
        return
    end
    if inst.Enabled ~= true then
        return
    end

    local at, anchor = resolveType(inst.Parent)

    if at == 0 then
        return
    end

    registerEntry(inst, 'light', true, {
        at = at,
        anchor = anchor,
    })
end
local function processWorldGui(inst)
    if not CONFIG.CullWorldGui then
        return
    end
    if not (inst:IsA('SurfaceGui') or inst:IsA('BillboardGui')) then
        return
    end
    if MP[inst] then
        return
    end
    if inst.Enabled ~= true then
        return
    end

    local target = inst.Adornee or inst.Parent
    local at, anchor = resolveType(target)

    if at == 0 then
        return
    end

    registerEntry(inst, 'gui', true, {
        at = at,
        anchor = anchor,
    })
end
local function processInstance(inst)
    if not inst or isProtected(inst) then
        return false
    end
    if inSetWalk(inst, ownCharRoots) then
        return false
    end

    processGeometry(inst)
    processParticles(inst)
    processTrailBeam(inst)
    processLegacy(inst)
    processLight(inst)
    processWorldGui(inst)

    return true
end
local function pushScan(inst)
    if destroyed or not inst then
        return
    end

    scanTop = scanTop + 1
    scanStack[scanTop] = inst
end
local function stepScan(budgetMs)
    local t0 = tick()

    while scanTop > 0 do
        local inst = scanStack[scanTop]

        scanStack[scanTop] = nil
        scanTop = scanTop - 1

        if inst and inst.Parent then
            local ok = pcall(processInstance, inst)

            if ok then
                local ch = inst:GetChildren()

                for _, c in ch do
                    pushScan(c)
                end
            end
        end
        if (tick() - t0) * 1000 >= budgetMs then
            break
        end
    end
end
local function startScan()
    if destroyed or scanConnection then
        return
    end

    scanConnection = RunService.Heartbeat:Connect(function()
        if destroyed then
            pcall(function()
                scanConnection:Disconnect()
            end)

            scanConnection = nil

            return
        end

        pcall(function()
            stepScan(CONFIG.ScanBudgetMs or 1.4)
        end)

        if scanTop == 0 and not destroyed then
            pcall(function()
                scanConnection:Disconnect()
            end)

            scanConnection = nil
        end
    end)
end
local function setOff(e)
    if e.culled then
        return
    end

    local inst = e.inst

    if e.kind == 'part' then
        setLTM(inst, 1)
    elseif e.kind == 'legacy' and e.isExplosion then
        setHiddenOrSet(inst, 'Visible', false)
    else
        setHiddenOrSet(inst, 'Enabled', false)
    end

    e.culled = true
end
local function setOn(e)
    if not e.culled then
        return
    end

    local inst = e.inst

    if e.kind == 'part' then
        setLTM(inst, e.orig)
    elseif e.kind == 'legacy' and e.isExplosion then
        setHiddenOrSet(inst, 'Visible', e.orig)
    else
        setHiddenOrSet(inst, 'Enabled', e.orig)
    end

    e.culled = false
end
local function wantCullEffect(distSq, cullD, restD, frustumMin, cam, pos)
    if distSq > cullD * cullD then
        return true
    end
    if distSq > frustumMin * frustumMin then
        local _, onScreen = cam:WorldToScreenPoint(pos)

        return not onScreen
    end

    return false
end
local function processEntry(e, camPos, cam)
    local inst = e.inst

    if not inst or not inst.Parent then
        e.dead = true

        return
    end
    if e.kind == 'part' then
        local pos = inst.Position
        local dx = pos.X - camPos.X
        local dy = pos.Y - camPos.Y
        local dz = pos.Z - camPos.Z
        local distSq = dx * dx + dy * dy + dz * dz
        local cullD = CONFIG.TinyDecorCull or 90
        local restD = CONFIG.TinyDecorRestore or 70

        if e.culled then
            if distSq < restD * restD then
                setOn(e)
            end
        else
            if distSq > cullD * cullD then
                setOff(e)
            end
        end

        return
    end

    local pos

    if e.kind == 'light' or e.kind == 'gui' then
        if not e.anchor or not e.anchor.Parent then
            if e.culled then
                setOn(e)
            end

            return
        end

        pos = anchorPos(e.at, e.anchor)
    else
        local at, anchor = resolveType(inst.Parent)

        if at == 0 then
            if e.culled then
                setOn(e)
            end

            return
        end

        pos = anchorPos(at, anchor)
    end
    if not pos then
        if e.culled then
            setOn(e)
        end

        return
    end

    local dx = pos.X - camPos.X
    local dy = pos.Y - camPos.Y
    local dz = pos.Z - camPos.Z
    local distSq = dx * dx + dy * dy + dz * dz
    local cullD, restD

    if e.kind == 'light' then
        cullD = CONFIG.LightCull or 220
        restD = CONFIG.LightRestore or 180
    elseif e.kind == 'gui' then
        cullD = CONFIG.GuiCull or 140
        restD = CONFIG.GuiRestore or 110
    elseif e.kind == 'particle' then
        cullD = CONFIG.ParticleCull or 160
        restD = CONFIG.ParticleRestore or 130
    elseif e.kind == 'trailbeam' then
        cullD = CONFIG.TrailCull or 160
        restD = CONFIG.TrailRestore or 130
    else
        cullD = CONFIG.LegacyCull or 130
        restD = CONFIG.LegacyRestore or 100
    end

    local frustumMin = CONFIG.FrustumMinDistance or 70
    local want = wantCullEffect(distSq, cullD, restD, frustumMin, cam, pos)

    if want then
        setOff(e)
    else
        setOn(e)
    end
end
local function compactML()
    local n = #ML
    local w = 0

    for i = 1, n do
        local e = ML[i]

        if not e.dead and e.inst and e.inst.Parent then
            w = w + 1
            ML[w] = e
            MP[e.inst] = w
        else
            if e and e.inst then
                MP[e.inst] = nil
            end
        end
    end
    for i = w + 1, n do
        ML[i] = nil
    end

    if cursor > #ML then
        cursor = 1
    end
end
local function updateCulling()
    local cam = Workspace.CurrentCamera

    if not cam then
        return
    end

    local camPos = cam.CFrame.Position
    local t0 = tick()
    local budget = CONFIG.CullBudgetMs or 1.4
    local n = #ML

    if n > 0 then
        local processed = 0

        repeat
            local e = ML[cursor]

            if e then
                processEntry(e, camPos, cam)
            end

            cursor = cursor + 1

            if cursor > n then
                cursor = 1
            end

            processed = processed + 1
        until processed >= n or (tick() - t0) * 1000 >= budget
    end

    compactCounter = compactCounter + 1

    if compactCounter >= (CONFIG.CompactEvery or 24) then
        compactCounter = 0

        compactML()
    end
    if CONFIG.CullAvatars then
        local avCull = CONFIG.AvatarCull or 110
        local avRest = CONFIG.AvatarRestore or 85

        for _, ce in charList do
            local root = ce.root

            if not root or not root.Parent then
                ce.dead = true
            else
                if not ce.hrp or not ce.hrp.Parent then
                    ce.hrp = root:FindFirstChild('HumanoidRootPart')
                end

                local hrp = ce.hrp

                if not hrp then
                    if ce.culled then
                        for _, pe in ce.parts do
                            if not pe.dead and pe.inst and pe.inst.Parent then
                                setLTM(pe.inst, pe.orig)
                            end
                        end

                        ce.culled = false
                    end
                else
                    local p = hrp.Position
                    local dx = p.X - camPos.X
                    local dy = p.Y - camPos.Y
                    local dz = p.Z - camPos.Z
                    local distSq = dx * dx + dy * dy + dz * dz

                    if ce.culled then
                        if distSq < avRest * avRest then
                            for _, pe in ce.parts do
                                if not pe.dead and pe.inst and pe.inst.Parent then
                                    setLTM(pe.inst, pe.orig)
                                end
                            end

                            ce.culled = false
                        end
                    else
                        if distSq > avCull * avCull then
                            for _, pe in ce.parts do
                                if not pe.dead and pe.inst and pe.inst.Parent then
                                    setLTM(pe.inst, 1)
                                end
                            end

                            ce.culled = true
                        end
                    end
                end
            end
        end
    end
end
local function addCharPart(ce, inst)
    if destroyed or not inst or ce.dead then
        return
    end
    if isProtected(inst) then
        return
    end
    if not inst:IsA('BasePart') then
        return
    end

    local t = inst.Transparency

    if type(t) ~= 'number' or t >= 1 then
        return
    end
    if MP[inst] then
        removeManaged(inst)
    end

    local orig = inst.LocalTransparencyModifier

    if type(orig) ~= 'number' then
        orig = 0
    end

    local pe = {
        inst = inst,
        orig = orig,
        dead = false,
    }

    ce.parts[#ce.parts + 1] = pe

    if ce.culled then
        setLTM(inst, 1)
    end
end
local function cleanupChar(ce)
    if not ce then
        return
    end

    ce.dead = true
    otherCharRoots[ce.root] = nil

    for _, pe in ce.parts do
        if pe and pe.inst and pe.inst.Parent and ce.culled then
            setLTM(pe.inst, pe.orig)
        end
    end

    if ce.connDesc then
        pcall(function()
            ce.connDesc:Disconnect()
        end)
    end

    charMap[ce.root] = nil
end
local function compactCharList()
    local nl = {}

    for _, ce in charList do
        if not ce.dead then
            nl[#nl + 1] = ce
        end
    end

    charList = nl
end
local function setupChar(player)
    if player == LocalPlayer then
        return
    end

    local root = player.Character

    if not root then
        return
    end
    if charMap[root] then
        return
    end

    otherCharRoots[root] = true

    local ce = {
        root = root,
        hrp = root:FindFirstChild('HumanoidRootPart'),
        parts = {},
        culled = false,
        dead = false,
        connDesc = nil,
    }

    charMap[root] = ce
    charList[#charList + 1] = ce

    local desc = root:GetDescendants()

    for _, d in desc do
        addCharPart(ce, d)
    end

    ce.connDesc = root.DescendantAdded:Connect(function(d)
        addCharPart(ce, d)
    end)
end
local function onCharacterAdded(player, root)
    if player == LocalPlayer then
        ownCharRoots = {}
        ownCharRoots[root] = true

        return
    end

    for _, ce in charList do
        if ce.root ~= root and ce.root and ce.root:IsDescendantOf(player) then
            cleanupChar(ce)
        end
    end

    setupChar(player)
    compactCharList()
end
local function onPlayerRemoving(player)
    if player == LocalPlayer then
        return
    end

    for _, ce in charList do
        if ce.root and ce.root:IsDescendantOf(player) then
            cleanupChar(ce)
        end
    end

    compactCharList()
end
local function restoreAll()
    for _, e in ML do
        if e and e.inst and e.inst.Parent and e.culled then
            if e.kind == 'part' then
                setLTM(e.inst, e.orig)
            elseif e.kind == 'legacy' and e.isExplosion then
                pcall(function()
                    e.inst.Visible = e.orig
                end)
            else
                pcall(function()
                    e.inst.Enabled = e.orig
                end)
            end
        end
    end

    ML = {}
    MP = {}
    cursor = 1

    for _, ce in charList do
        for _, pe in ce.parts do
            if pe and pe.inst and pe.inst.Parent and ce.culled then
                setLTM(pe.inst, pe.orig)
            end
        end

        if ce.connDesc then
            pcall(function()
                ce.connDesc:Disconnect()
            end)
        end
    end

    charList = {}
    charMap = {}
    otherCharRoots = setmetatable({}, {
        __mode = 'k',
    })
end
local function applyRuntimeFlags()
    if not CONFIG.ApplyRuntimeFFlags then
        return
    end
    if type(setfflag) ~= 'function' then
        return
    end

    for k, v in RUNTIME_FLAGS do
        pcall(function()
            setfflag(k, v)
        end)
    end
end
local function unlockFps()
    if CONFIG.FpsUnlock == false then
        return
    end
    if type(setfpscap) == 'function' then
        pcall(function()
            setfpscap(CONFIG.MaxFps or 9999)
        end)
    end

    pcall(function()
        local ugs = UserSettings():GetService('UserGameSettings')
        local applied = false
        local enumOk, fe = pcall(function()
            return Enum.FramerateCap
        end)

        if enumOk and fe then
            for _, name in {
                'None',
                'Cap360',
                'Cap240',
                'Cap144',
                'Cap120',
                'Cap60',
            }do
                local iok, item = pcall(function()
                    return fe[name]
                end)

                if iok and item then
                    if pcall(function()
                        ugs.FramerateCap = item
                    end) then
                        applied = true

                        break
                    end
                end
            end
        end
        if not applied then
            for _, v in {
                CONFIG.MaxFps or 9999,
                9999,
                360,
                240,
                144,
                120,
                60,
            }do
                if pcall(function()
                    ugs.FramerateCap = v
                end) then
                    break
                end
            end
        end
    end)
    pcall(function()
        settings().Rendering.FramerateCap = CONFIG.MaxFps or 9999
    end)
end
local function applyDisplay()
    if CONFIG.HealthDisplayZero then
        pcall(function()
            Players.HealthDisplayDistance = 0
        end)
    end
end

pcall(applyRuntimeFlags)
pcall(unlockFps)
pcall(applyDisplay)

if LocalPlayer.Character then
    ownCharRoots[LocalPlayer.Character] = true
end

connect(LocalPlayer.CharacterAdded, function(root)
    ownCharRoots = {}
    ownCharRoots[root] = true
end)

for _, player in Players:GetPlayers()do
    if player ~= LocalPlayer then
        if player.Character then
            setupChar(player)
        end

        connect(player.CharacterAdded, function(root)
            onCharacterAdded(player, root)
        end)
    end
end

connect(Players.PlayerAdded, function(player)
    connect(player.CharacterAdded, function(root)
        onCharacterAdded(player, root)
    end)
end)
connect(Players.PlayerRemoving, onPlayerRemoving)
pushScan(Workspace)
pushScan(Lighting)
startScan()
connect(Workspace.DescendantAdded, function(inst)
    if destroyed or not inst then
        return
    end

    pushScan(inst)
    startScan()
end)
connect(Lighting.DescendantAdded, function(inst)
    if destroyed or not inst then
        return
    end

    pushScan(inst)
    startScan()
end)

cullConnection = RunService.Heartbeat:Connect(function(dt)
    if destroyed then
        return
    end

    cullAccumulator = cullAccumulator + dt

    if cullAccumulator < (CONFIG.CullInterval or 0.06) then
        return
    end

    cullAccumulator = 0

    pcall(updateCulling)
end)

task.delay(3, function()
    if destroyed then
        return
    end

    local tiny = 0
    local fx = 0

    for _, e in ML do
        if e.kind == 'part' then
            tiny = tiny + 1
        else
            fx = fx + 1
        end
    end

    print(string.format('[OPT] mode=%s tinyDecor=%d effectsLightsGui=%d avatars=%d', EXEC and 'EXEC' or 'VANILLA', tiny, fx, #charList))
end)
pcall(function()
    script.Destroying:Connect(function()
        destroyed = true

        if scanConnection then
            pcall(function()
                scanConnection:Disconnect()
            end)

            scanConnection = nil
        end
        if cullConnection then
            pcall(function()
                cullConnection:Disconnect()
            end)

            cullConnection = nil
        end

        restoreAll()

        for _, c in connections do
            pcall(function()
                c:Disconnect()
            end)
        end

        connections = {}
        scanStack = {}
        scanTop = 0
        ownCharRoots = {}
    end)
end)
