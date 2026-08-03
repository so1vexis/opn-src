local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local Workspace = game:GetService('Workspace')
local GuiService = game:GetService('GuiService')
local TweenService = game:GetService('TweenService')
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Config = {
    ESP_Enabled = true,
    ESP_Boxes = true,
    ESP_Names = true,
    ESP_Distance = true,
    ESP_Skeleton = true,
    ESP_Health = true,
    ESP_TeamCheck = true,
    ESP_MaxDist = 2000,
    ESP_AimDir = true,
    ESP_LookingAtYou = true,
    ESP_Tracers = false,
    ESP_FPV = false,
    RADAR_Enabled = true,
    RADAR_Size = 120,
    AIM_Enabled = false,
    AIM_FOV = 150,
    AIM_ShowFOV = true,
    AIM_TeamCheck = true,
    AIM_VisibilityCheck = true,
    AIM_Prediction = true,
    AIM_PredictionAmount = 0.13,
    AIM_ForceHeadshots = true,
    AIM_Hitbox = 'Head',
    AIM_FPV = false,
    AIM_LegitMode = true,
    AIM_HumanError = 0.05,
    AIM_MissChance = 5,
    AIM_RandomSmooth = true,
    AIM_RandomDelay = true,
    AIM_FOVJitter = true,
    DESYNC_Enabled = false,
    DESYNC_Amount = 2,
    TRIGGER_Enabled = false,
    TRIGGER_Delay = 50,
    TRIGGER_TeamCheck = true,
    MENU_Open = true,
    MENU_Tab = 1,
}
local Tuning = {
    TargetRefreshRate = 0.3,
    VisibilityRefreshRate = 0.2,
    TeamRefreshRate = 3,
    FPVRefreshRate = 2,
    BoxWidthRatio = 0.6,
    HealthBarWidth = 4,
    HealthBarOffset = 6,
    NameOffset = 18,
    DistOffset = 4,
    AimLineLength = 15,
    LookingThreshold = 0.85,
    FPVClusterDist = 100,
    RadarRange = 150,
    RadarDotSize = 6,
    TriggerRadius = 50,
}
local Palette = {
    Enemy = Color3.fromRGB(255, 50, 50),
    EnemyVisible = Color3.fromRGB(0, 255, 0),
    Team = Color3.fromRGB(0, 150, 255),
    Skeleton = Color3.fromRGB(255, 255, 255),
    SkeletonVisible = Color3.fromRGB(0, 255, 0),
    LookingAtYou = Color3.fromRGB(255, 255, 0),
    AimDir = Color3.fromRGB(255, 150, 0),
    FPV = Color3.fromRGB(255, 0, 255),
    Tracer = Color3.fromRGB(255, 100, 100),
    HealthHigh = Color3.fromRGB(0, 255, 0),
    HealthMid = Color3.fromRGB(255, 255, 0),
    HealthLow = Color3.fromRGB(255, 0, 0),
    HealthBg = Color3.fromRGB(40, 40, 40),
    RadarBg = Color3.fromRGB(20, 20, 20),
    RadarBorder = Color3.fromRGB(255, 50, 50),
    RadarYou = Color3.fromRGB(0, 255, 0),
    RadarEnemy = Color3.fromRGB(255, 50, 50),
    MenuBg = Color3.fromRGB(15, 15, 20),
    MenuPanel = Color3.fromRGB(22, 22, 30),
    MenuBorder = Color3.fromRGB(60, 60, 75),
    MenuAccent = Color3.fromRGB(110, 140, 255),
    MenuText = Color3.fromRGB(230, 230, 240),
    MenuTextDim = Color3.fromRGB(150, 150, 165),
    MenuOn = Color3.fromRGB(100, 220, 120),
    MenuOff = Color3.fromRGB(60, 60, 70),
    MenuTab = Color3.fromRGB(18, 18, 24),
    FOV_Circle = Color3.fromRGB(255, 255, 255),
    FOV_Active = Color3.fromRGB(255, 50, 50),
}
local Timers = {
    lastTargetRefresh = 0,
    lastVisRefresh = 0,
    lastTeamRefresh = 0,
    lastFPVRefresh = 0,
    lastAimUpdate = 0,
}
local Cache = {
    targets = {},
    humanoids = {},
    teamStatus = {},
    visibility = {},
    lookingAtYou = {},
    drones = {},
    names = {},
    myRoot = nil,
}
local Bones = {
    {
        'Head',
        'Torso',
    },
    {
        'Torso',
        'Left Arm',
    },
    {
        'Torso',
        'Right Arm',
    },
    {
        'Torso',
        'Left Leg',
    },
    {
        'Torso',
        'Right Leg',
    },
}
local Connections = {}
local Unloaded = false
local UI = {}

UI.ScreenGui = Instance.new('ScreenGui')
UI.ScreenGui.Name = 'LostFrontXeno'
UI.ScreenGui.ResetOnSpawn = false
UI.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UI.ScreenGui.DisplayOrder = 999
UI.ScreenGui.IgnoreGuiInset = true

pcall(function()
    UI.ScreenGui.Parent = game:GetService('CoreGui')
end)

if not UI.ScreenGui.Parent then
    UI.ScreenGui.Parent = LocalPlayer:WaitForChild('PlayerGui')
end

local Team = {}

function Team.isTeammate(char)
    if not LocalPlayer.Character then
        return false
    end
    if not char or not char.Parent then
        return false
    end

    local localParent = LocalPlayer.Character.Parent
    local charParent = char.Parent

    if not localParent or not charParent then
        return false
    end

    return localParent == charParent
end
function Team.isSpectator(char)
    if not char or not char.Parent then
        return true
    end

    local parentName = char.Parent.Name:lower()

    return parentName:find('spectator') or parentName:find('dead') or parentName:find('observer') or false
end

local Util = {}

function Util.isVisible(character)
    if not character then
        return false
    end

    local cam = Workspace.CurrentCamera

    if not cam then
        return false
    end

    local origin = cam.CFrame.Position
    local parts = {
        'Head',
        'Torso',
        'HumanoidRootPart',
    }
    local rayParams = RaycastParams.new()

    rayParams.FilterType = Enum.RaycastFilterType.Exclude

    local filter = {cam}

    if LocalPlayer.Character then
        table.insert(filter, LocalPlayer.Character)
    end

    table.insert(filter, character)

    rayParams.FilterDescendantsInstances = filter

    for _, partName in pairs(parts)do
        local part = character:FindFirstChild(partName)

        if part then
            local dir = (part.Position - origin)
            local result = Workspace:Raycast(origin, dir.Unit * dir.Magnitude, rayParams)

            if not result or (result.Position - part.Position).Magnitude < 5 then
                return true
            end
        end
    end

    return false
end
function Util.isLookingAtYou(char)
    if not LocalPlayer.Character then
        return false
    end

    local myHead = LocalPlayer.Character:FindFirstChild('Head')
    local head = char:FindFirstChild('Head')

    if not myHead or not head then
        return false
    end

    local toYou = (myHead.Position - head.Position).Unit

    return toYou:Dot(head.CFrame.LookVector) > Tuning.LookingThreshold
end
function Util.getName(char)
    if Cache.names[char] then
        return Cache.names[char]
    end

    for _, p in pairs(Players:GetPlayers())do
        if p.Character == char then
            Cache.names[char] = p.Name

            return p.Name
        end
    end

    local name = (not char.Name:match('^[Il]+')) and char.Name or 'Player'

    Cache.names[char] = name

    return name
end

local Targets = {}

function Targets.refresh()
    local new, newTeam, newNames, newHum = {}, {}, {}, {}
    local myChar = LocalPlayer.Character

    Cache.myRoot = myChar and myChar:FindFirstChild('HumanoidRootPart')

    for _, plr in ipairs(Players:GetPlayers())do
        if plr ~= LocalPlayer and plr.Character then
            local char = plr.Character

            if Team.isSpectator(char) then
                continue
            end

            local root = char:FindFirstChild('HumanoidRootPart')
            local hum = char:FindFirstChild('Humanoid')

            if root and hum and hum.Health > 0 and root.Position.Y > -50 then
                new[root] = char
                newHum[root] = hum
                newTeam[root] = Team.isTeammate(char)

                if Cache.names[char] then
                    newNames[char] = Cache.names[char]
                end
            end
        end
    end

    Cache.targets = new
    Cache.humanoids = newHum
    Cache.teamStatus = newTeam
    Cache.names = newNames
end
function Targets.refreshVisibility()
    local count = 0

    for root, char in pairs(Cache.targets)do
        count = count + 1

        if count > 20 then
            Cache.visibility[root] = false
            Cache.lookingAtYou[root] = false
        else
            local vis = Util.isVisible(char)

            Cache.visibility[root] = vis
            Cache.lookingAtYou[root] = vis and Util.isLookingAtYou(char) or false
        end
    end
end

local ESP = {cache = {}}

local function DrawLine(frame, x1, y1, x2, y2, color, thickness)
    thickness = thickness or 1

    local dx = x2 - x1
    local dy = y2 - y1
    local length = math.sqrt(dx * dx + dy * dy)

    if length < 1 then
        frame.Visible = false

        return
    end

    local cx = (x1 + x2) / 2
    local cy = (y1 + y2) / 2
    local angle = math.atan2(dy, dx) * (180 / math.pi)

    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.new(0, cx, 0, cy)
    frame.Size = UDim2.new(0, length, 0, thickness)
    frame.Rotation = angle

    if color then
        frame.BackgroundColor3 = color
    end

    frame.Visible = true
end

function ESP.Create(root)
    if ESP.cache[root] then
        return
    end

    local box = Instance.new('Frame')

    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.Visible = false
    box.Parent = UI.ScreenGui

    local boxStroke = Instance.new('UIStroke')

    boxStroke.Thickness = 1
    boxStroke.Parent = box

    local name = Instance.new('TextLabel')

    name.BackgroundTransparency = 1
    name.Font = Enum.Font.RobotoMono
    name.TextSize = 13
    name.TextColor3 = Color3.new(1, 1, 1)
    name.TextStrokeTransparency = 0
    name.Size = UDim2.new(0, 200, 0, 16)
    name.TextXAlignment = Enum.TextXAlignment.Center
    name.Visible = false
    name.Parent = UI.ScreenGui

    local dist = Instance.new('TextLabel')

    dist.BackgroundTransparency = 1
    dist.Font = Enum.Font.RobotoMono
    dist.TextSize = 11
    dist.TextColor3 = Color3.fromRGB(180, 180, 180)
    dist.TextStrokeTransparency = 0
    dist.Size = UDim2.new(0, 200, 0, 14)
    dist.TextXAlignment = Enum.TextXAlignment.Center
    dist.Visible = false
    dist.Parent = UI.ScreenGui

    local healthBg = Instance.new('Frame')

    healthBg.BackgroundColor3 = Palette.HealthBg
    healthBg.BorderSizePixel = 0
    healthBg.Visible = false
    healthBg.Parent = UI.ScreenGui

    local healthBar = Instance.new('Frame')

    healthBar.BackgroundColor3 = Palette.HealthHigh
    healthBar.BorderSizePixel = 0
    healthBar.Visible = false
    healthBar.Parent = UI.ScreenGui

    local skel = {}

    for i = 1, 5 do
        local line = Instance.new('Frame')

        line.BackgroundColor3 = Palette.Skeleton
        line.BorderSizePixel = 0
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.Visible = false
        line.Parent = UI.ScreenGui
        skel[i] = line
    end

    local aimLine = Instance.new('Frame')

    aimLine.BackgroundColor3 = Palette.AimDir
    aimLine.BorderSizePixel = 0
    aimLine.AnchorPoint = Vector2.new(0.5, 0.5)
    aimLine.Visible = false
    aimLine.Parent = UI.ScreenGui

    local lookingText = Instance.new('TextLabel')

    lookingText.BackgroundTransparency = 1
    lookingText.Font = Enum.Font.RobotoMono
    lookingText.TextSize = 13
    lookingText.TextColor3 = Palette.LookingAtYou
    lookingText.TextStrokeTransparency = 0
    lookingText.Text = '[!] LOOKING'
    lookingText.Size = UDim2.new(0, 150, 0, 16)
    lookingText.TextXAlignment = Enum.TextXAlignment.Center
    lookingText.Visible = false
    lookingText.Parent = UI.ScreenGui

    local tracer = Instance.new('Frame')

    tracer.BackgroundColor3 = Palette.Tracer
    tracer.BorderSizePixel = 0
    tracer.AnchorPoint = Vector2.new(0.5, 0.5)
    tracer.Visible = false
    tracer.Parent = UI.ScreenGui
    ESP.cache[root] = {
        Box = box,
        BoxStroke = boxStroke,
        Name = name,
        Dist = dist,
        HealthBg = healthBg,
        HealthBar = healthBar,
        Skel = skel,
        AimLine = aimLine,
        LookingText = lookingText,
        Tracer = tracer,
    }
end
function ESP.Hide(esp)
    if not esp then
        return
    end

    esp.Box.Visible = false
    esp.Name.Visible = false
    esp.Dist.Visible = false
    esp.HealthBg.Visible = false
    esp.HealthBar.Visible = false

    for _, l in ipairs(esp.Skel)do
        l.Visible = false
    end

    esp.AimLine.Visible = false
    esp.LookingText.Visible = false
    esp.Tracer.Visible = false
end
function ESP.Destroy(esp)
    if not esp then
        return
    end

    pcall(function()
        esp.Box:Destroy()
    end)
    pcall(function()
        esp.Name:Destroy()
    end)
    pcall(function()
        esp.Dist:Destroy()
    end)
    pcall(function()
        esp.HealthBg:Destroy()
    end)
    pcall(function()
        esp.HealthBar:Destroy()
    end)

    for _, l in ipairs(esp.Skel)do
        pcall(function()
            l:Destroy()
        end)
    end

    pcall(function()
        esp.AimLine:Destroy()
    end)
    pcall(function()
        esp.LookingText:Destroy()
    end)
    pcall(function()
        esp.Tracer:Destroy()
    end)
end
function ESP.HideAll()
    for _, esp in pairs(ESP.cache)do
        ESP.Hide(esp)
    end
end
function ESP.Cleanup()
    local toRemove = {}

    for root, esp in pairs(ESP.cache)do
        if not Cache.targets[root] then
            ESP.Hide(esp)
            ESP.Destroy(esp)

            toRemove[#toRemove + 1] = root
        end
    end
    for _, root in ipairs(toRemove)do
        ESP.cache[root] = nil
    end
end
function ESP.Render(esp, root, char, hum, cam, screenSize, screenCenter, dist)
    local head = char:FindFirstChild('Head')
    local headPos = head and head.Position or (root.Position + Vector3.new(0, 2, 0))
    local feetPos = root.Position - Vector3.new(0, 3, 0)
    local topPos = headPos + Vector3.new(0, 0.5, 0)
    local rs, ron = cam:WorldToViewportPoint(root.Position)
    local hs = cam:WorldToViewportPoint(topPos)
    local fs = cam:WorldToViewportPoint(feetPos)
    local onScreen = ron and rs.Z > 0
    local isTeam = Cache.teamStatus[root] or false
    local visible = Cache.visibility[root] or false
    local col = isTeam and Palette.Team or (visible and Palette.EnemyVisible or Palette.Enemy)
    local skelCol = isTeam and Palette.Team or (visible and Palette.SkeletonVisible or Palette.Skeleton)
    local lookingAtYou = Cache.lookingAtYou[root] or false

    if onScreen then
        local boxTop, boxBottom = hs.Y, fs.Y
        local boxHeight = math.abs(boxBottom - boxTop)
        local boxWidth = boxHeight * Tuning.BoxWidthRatio
        local cx = rs.X

        if Config.ESP_Boxes then
            esp.Box.Position = UDim2.new(0, cx - boxWidth / 2, 0, boxTop)
            esp.Box.Size = UDim2.new(0, boxWidth, 0, boxHeight)
            esp.BoxStroke.Color = col
            esp.Box.Visible = true
        else
            esp.Box.Visible = false
        end
        if Config.ESP_Names then
            esp.Name.Text = Util.getName(char)
            esp.Name.Position = UDim2.new(0, cx - 100, 0, hs.Y - Tuning.NameOffset)
            esp.Name.TextColor3 = col
            esp.Name.Visible = true
        else
            esp.Name.Visible = false
        end
        if Config.ESP_Distance then
            esp.Dist.Text = math.floor(dist) .. 'm'
            esp.Dist.Position = UDim2.new(0, cx - 100, 0, fs.Y + Tuning.DistOffset)
            esp.Dist.Visible = true
        else
            esp.Dist.Visible = false
        end
        if Config.ESP_Health then
            local pct = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
            local barX = cx - boxWidth / 2 - Tuning.HealthBarOffset

            esp.HealthBg.Position = UDim2.new(0, barX - 1, 0, boxTop - 1)
            esp.HealthBg.Size = UDim2.new(0, Tuning.HealthBarWidth + 2, 0, boxHeight + 2)
            esp.HealthBg.Visible = true

            local hh = boxHeight * pct

            esp.HealthBar.Position = UDim2.new(0, barX, 0, boxBottom - hh)
            esp.HealthBar.Size = UDim2.new(0, Tuning.HealthBarWidth, 0, hh)
            esp.HealthBar.BackgroundColor3 = pct > 0.6 and Palette.HealthHigh or pct > 0.3 and Palette.HealthMid or Palette.HealthLow
            esp.HealthBar.Visible = true
        else
            esp.HealthBg.Visible = false
            esp.HealthBar.Visible = false
        end
        if Config.ESP_Skeleton then
            for i, b in ipairs(Bones)do
                local p1, p2 = char:FindFirstChild(b[1]), char:FindFirstChild(b[2])

                if p1 and p2 then
                    local s1, o1 = cam:WorldToViewportPoint(p1.Position)
                    local s2, o2 = cam:WorldToViewportPoint(p2.Position)

                    if o1 and o2 and s1.Z > 0 and s2.Z > 0 then
                        DrawLine(esp.Skel[i], s1.X, s1.Y, s2.X, s2.Y, skelCol, 1)
                    else
                        esp.Skel[i].Visible = false
                    end
                else
                    esp.Skel[i].Visible = false
                end
            end
        else
            for _, l in ipairs(esp.Skel)do
                l.Visible = false
            end
        end
        if Config.ESP_AimDir and head then
            local aimEnd = head.Position + head.CFrame.LookVector * Tuning.AimLineLength
            local headScreen, headOn = cam:WorldToViewportPoint(head.Position)
            local aimScreen, aimOn = cam:WorldToViewportPoint(aimEnd)

            if headOn and aimOn and headScreen.Z > 0 and aimScreen.Z > 0 then
                DrawLine(esp.AimLine, headScreen.X, headScreen.Y, aimScreen.X, aimScreen.Y, Palette.AimDir, 2)
            else
                esp.AimLine.Visible = false
            end
        else
            esp.AimLine.Visible = false
        end
        if Config.ESP_LookingAtYou and lookingAtYou then
            esp.LookingText.Position = UDim2.new(0, cx - 75, 0, hs.Y - 35)
            esp.LookingText.Visible = true
        else
            esp.LookingText.Visible = false
        end
        if Config.ESP_Tracers then
            local tracerCol = visible and Palette.EnemyVisible or Palette.Tracer

            DrawLine(esp.Tracer, screenCenter.X, screenSize.Y, cx, fs.Y, tracerCol, 1)
        else
            esp.Tracer.Visible = false
        end
    else
        ESP.Hide(esp)
    end
end
function ESP.Step(cam, screenSize, screenCenter)
    if not Config.ESP_Enabled then
        ESP.HideAll()

        return
    end

    ESP.Cleanup()

    local myRoot = Cache.myRoot

    for root, char in pairs(Cache.targets)do
        if not root or not root.Parent or not char then
            if ESP.cache[root] then
                ESP.Hide(ESP.cache[root])
            end
        else
            local hum = Cache.humanoids[root]

            if not hum or not hum.Parent or hum.Health <= 0 then
                if ESP.cache[root] then
                    ESP.Hide(ESP.cache[root])
                end
            elseif Config.ESP_TeamCheck and Cache.teamStatus[root] then
                if ESP.cache[root] then
                    ESP.Hide(ESP.cache[root])
                end
            else
                if not ESP.cache[root] then
                    ESP.Create(root)
                end

                local esp = ESP.cache[root]
                local dist = myRoot and (root.Position - myRoot.Position).Magnitude or 0

                if dist > Config.ESP_MaxDist then
                    ESP.Hide(esp)
                else
                    ESP.Render(esp, root, char, hum, cam, screenSize, screenCenter, dist)
                end
            end
        end
    end
end

local FPV = {
    cache = {},
    partNames = {
        'Blade_BL',
        'Blade_BR',
        'Blade_FL',
        'Blade_FR',
        'Explosive',
        'Explosive1',
        'Rotator_BL',
        'Rotator_BR',
        'Rotator_FL',
        'Rotator_FR',
        'FPV',
    },
}
local fpvNameSet = {}

for _, n in ipairs(FPV.partNames)do
    fpvNameSet[n] = true
end

function FPV.Create(drone)
    if FPV.cache[drone] then
        return
    end

    local box = Instance.new('Frame')

    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.Visible = false
    box.Parent = UI.ScreenGui

    local boxStroke = Instance.new('UIStroke')

    boxStroke.Thickness = 2
    boxStroke.Color = Palette.FPV
    boxStroke.Parent = box

    local name = Instance.new('TextLabel')

    name.BackgroundTransparency = 1
    name.Font = Enum.Font.RobotoMono
    name.TextSize = 13
    name.TextColor3 = Palette.FPV
    name.TextStrokeTransparency = 0
    name.Text = '[FPV DRONE]'
    name.Size = UDim2.new(0, 150, 0, 16)
    name.TextXAlignment = Enum.TextXAlignment.Center
    name.Visible = false
    name.Parent = UI.ScreenGui

    local dist = Instance.new('TextLabel')

    dist.BackgroundTransparency = 1
    dist.Font = Enum.Font.RobotoMono
    dist.TextSize = 11
    dist.TextColor3 = Palette.FPV
    dist.TextStrokeTransparency = 0
    dist.Size = UDim2.new(0, 100, 0, 14)
    dist.TextXAlignment = Enum.TextXAlignment.Center
    dist.Visible = false
    dist.Parent = UI.ScreenGui
    FPV.cache[drone] = {
        Box = box,
        BoxStroke = boxStroke,
        Name = name,
        Dist = dist,
    }
end
function FPV.Hide(esp)
    if not esp then
        return
    end

    esp.Box.Visible = false
    esp.Name.Visible = false
    esp.Dist.Visible = false
end
function FPV.Destroy(esp)
    if not esp then
        return
    end

    pcall(function()
        esp.Box:Destroy()
    end)
    pcall(function()
        esp.Name:Destroy()
    end)
    pcall(function()
        esp.Dist:Destroy()
    end)
end
function FPV.Scan()
    if not Config.ESP_FPV then
        return Cache.drones or {}
    end

    local drones, seen, count = {}, {}, 0
    local camRef = Workspace.CurrentCamera
    local plrs = Players:GetPlayers()

    for _, obj in ipairs(Workspace:GetDescendants())do
        if count >= 10 then
            break
        end
        if obj:IsA('BasePart') and fpvNameSet[obj.Name] then
            local model = obj.Parent

            if model and model:IsA('Model') and not seen[model] then
                local skip = false

                if camRef and model:IsDescendantOf(camRef) then
                    skip = true
                end
                if not skip then
                    for i = 1, #plrs do
                        if plrs[i].Character and model:IsDescendantOf(plrs[i].Character) then
                            skip = true

                            break
                        end
                    end
                end
                if not skip then
                    seen[model] = true

                    local center = model:FindFirstChild('Explosive') or model:FindFirstChild('FPV') or obj

                    drones[model] = center
                    count = count + 1
                end
            end
        end
    end

    return drones
end
function FPV.Step(cam)
    if not Config.ESP_Enabled or not Config.ESP_FPV then
        for _, esp in pairs(FPV.cache)do
            FPV.Hide(esp)
        end

        return
    end

    local screenPos, toShow = {}, {}

    for drone, part in pairs(Cache.drones)do
        local sp, on = cam:WorldToViewportPoint(part.Position)

        if on and sp.Z > 0 then
            local tooClose = false

            for _, ex in pairs(screenPos)do
                if math.sqrt((sp.X - ex.X) ^ 2 + (sp.Y - ex.Y) ^ 2) < Tuning.FPVClusterDist then
                    tooClose = true

                    break
                end
            end

            if not tooClose then
                screenPos[drone] = sp
                toShow[drone] = part
            end
        end
    end
    for drone, esp in pairs(FPV.cache)do
        if not toShow[drone] then
            FPV.Hide(esp)
            FPV.Destroy(esp)

            FPV.cache[drone] = nil
        end
    end

    local myRoot = Cache.myRoot

    for drone, part in pairs(toShow)do
        if not FPV.cache[drone] then
            FPV.Create(drone)
        end

        local esp = FPV.cache[drone]
        local sp = screenPos[drone]
        local dist = myRoot and (part.Position - myRoot.Position).Magnitude or 0

        if dist < Config.ESP_MaxDist then
            local size = math.clamp(1000 / sp.Z, 20, 100)

            esp.Box.Position = UDim2.new(0, sp.X - size / 2, 0, sp.Y - size / 2)
            esp.Box.Size = UDim2.new(0, size, 0, size)
            esp.Box.Visible = true
            esp.Name.Position = UDim2.new(0, sp.X - 75, 0, sp.Y - size / 2 - 18)
            esp.Name.Visible = true
            esp.Dist.Position = UDim2.new(0, sp.X - 50, 0, sp.Y + size / 2 + 4)
            esp.Dist.Text = math.floor(dist) .. 'm'
            esp.Dist.Visible = true
        else
            FPV.Hide(esp)
        end
    end
end

local radarDots = {}
local RadarFrame = Instance.new('Frame')

RadarFrame.Name = 'Radar'
RadarFrame.BackgroundColor3 = Palette.RadarBg
RadarFrame.BackgroundTransparency = 0.15
RadarFrame.BorderSizePixel = 0
RadarFrame.AnchorPoint = Vector2.new(1, 0)
RadarFrame.Parent = UI.ScreenGui

local RadarStroke = Instance.new('UIStroke')

RadarStroke.Color = Palette.RadarBorder
RadarStroke.Thickness = 2
RadarStroke.Parent = RadarFrame

local RadarCross1 = Instance.new('Frame')

RadarCross1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RadarCross1.BorderSizePixel = 0
RadarCross1.AnchorPoint = Vector2.new(0.5, 0)
RadarCross1.Parent = RadarFrame

local RadarCross2 = Instance.new('Frame')

RadarCross2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RadarCross2.BorderSizePixel = 0
RadarCross2.AnchorPoint = Vector2.new(0, 0.5)
RadarCross2.Parent = RadarFrame

local RadarCenter = Instance.new('Frame')

RadarCenter.BackgroundColor3 = Palette.RadarYou
RadarCenter.BorderSizePixel = 0
RadarCenter.AnchorPoint = Vector2.new(0.5, 0.5)
RadarCenter.Size = UDim2.new(0, 8, 0, 8)
RadarCenter.Parent = RadarFrame
Instance.new('UICorner', RadarCenter).CornerRadius = UDim.new(0, 2)

for i = 1, 50 do
    local dot = Instance.new('Frame')

    dot.BackgroundColor3 = Palette.RadarEnemy
    dot.BorderSizePixel = 0
    dot.AnchorPoint = Vector2.new(0.5, 0.5)
    dot.Size = UDim2.new(0, Tuning.RadarDotSize, 0, Tuning.RadarDotSize)
    dot.Visible = false
    dot.Parent = RadarFrame
    Instance.new('UICorner', dot).CornerRadius = UDim.new(0, 2)
    radarDots[i] = dot
end

local fpvRadarDots = {}

for i = 1, 10 do
    local dot = Instance.new('Frame')

    dot.BackgroundColor3 = Palette.FPV
    dot.BorderSizePixel = 0
    dot.AnchorPoint = Vector2.new(0.5, 0.5)
    dot.Size = UDim2.new(0, 8, 0, 8)
    dot.Visible = false
    dot.Parent = RadarFrame
    Instance.new('UICorner', dot).CornerRadius = UDim.new(1, 0)
    fpvRadarDots[i] = dot
end

local function UpdateRadar(cam)
    if not Config.RADAR_Enabled then
        RadarFrame.Visible = false

        return
    end

    local myRoot = Cache.myRoot

    if not myRoot or not myRoot.Parent then
        RadarFrame.Visible = false

        return
    end

    local size = Config.RADAR_Size

    RadarFrame.Position = UDim2.new(1, -10, 0, 10)
    RadarFrame.Size = UDim2.new(0, size, 0, size)
    RadarFrame.Visible = true
    RadarCross1.Position = UDim2.new(0.5, 0, 0, 10)
    RadarCross1.Size = UDim2.new(0, 1, 1, -20)
    RadarCross2.Position = UDim2.new(0, 10, 0.5, 0)
    RadarCross2.Size = UDim2.new(1, -20, 0, 1)
    RadarCenter.Position = UDim2.new(0.5, 0, 0.5, 0)

    local myLook = cam.CFrame.LookVector
    local myAngle = math.atan2(-myLook.X, -myLook.Z)
    local cosA, sinA = math.cos(myAngle), math.sin(myAngle)
    local scale = (size / 2 - 10) / Tuning.RadarRange
    local idx = 1

    for root, _ in pairs(Cache.targets)do
        if idx > #radarDots then
            break
        end
        if root and root.Parent then
            local isTeam = Cache.teamStatus[root]

            if not (Config.ESP_TeamCheck and isTeam) then
                local rx, rz = root.Position.X - myRoot.Position.X, root.Position.Z - myRoot.Position.Z
                local dist2D = math.sqrt(rx ^ 2 + rz ^ 2)

                if dist2D < Tuning.RadarRange then
                    local rotX = rx * cosA - rz * sinA
                    local rotZ = rx * sinA + rz * cosA
                    local radarX, radarY = rotX * scale, rotZ * scale
                    local maxD = size / 2 - 8
                    local rDist = math.sqrt(radarX ^ 2 + radarY ^ 2)

                    if rDist > maxD then
                        radarX, radarY = radarX / rDist * maxD, radarY / rDist * maxD
                    end

                    radarDots[idx].Position = UDim2.new(0.5, radarX, 0.5, radarY)
                    radarDots[idx].BackgroundColor3 = isTeam and Palette.Team or Palette.RadarEnemy
                    radarDots[idx].Visible = true
                    idx = idx + 1
                end
            end
        end
    end

    for i = idx, #radarDots do
        radarDots[i].Visible = false
    end

    local fpvIdx = 1

    if Config.ESP_FPV then
        for _, part in pairs(Cache.drones)do
            if fpvIdx > #fpvRadarDots then
                break
            end

            local rx, rz = part.Position.X - myRoot.Position.X, part.Position.Z - myRoot.Position.Z
            local dist2D = math.sqrt(rx ^ 2 + rz ^ 2)

            if dist2D < Tuning.RadarRange then
                local rotX = rx * cosA - rz * sinA
                local rotZ = rx * sinA + rz * cosA
                local radarX, radarY = rotX * scale, rotZ * scale
                local maxD = size / 2 - 8
                local rDist = math.sqrt(radarX ^ 2 + radarY ^ 2)

                if rDist > maxD then
                    radarX, radarY = radarX / rDist * maxD, radarY / rDist * maxD
                end

                fpvRadarDots[fpvIdx].Position = UDim2.new(0.5, radarX, 0.5, radarY)
                fpvRadarDots[fpvIdx].Visible = true
                fpvIdx = fpvIdx + 1
            end
        end
    end

    for i = fpvIdx, #fpvRadarDots do
        fpvRadarDots[i].Visible = false
    end
end

local FOVCircle = Instance.new('Frame')

FOVCircle.BackgroundTransparency = 1
FOVCircle.BorderSizePixel = 0
FOVCircle.AnchorPoint = Vector2.new(0.5, 0.5)
FOVCircle.Parent = UI.ScreenGui

local FOVStroke = Instance.new('UIStroke')

FOVStroke.Color = Palette.FOV_Circle
FOVStroke.Thickness = 1
FOVStroke.Parent = FOVCircle
Instance.new('UICorner', FOVCircle).CornerRadius = UDim.new(1, 0)

local Aimbot = {
    aiming = false,
    lockedTarget = nil,
    lockedFPV = false,
}

Connections.mb2down = Mouse.Button2Down:Connect(function()
    Aimbot.aiming = true
    Aimbot.lockedTarget = nil
    Aimbot.lockedFPV = false
end)
Connections.mb2up = Mouse.Button2Up:Connect(function()
    Aimbot.aiming = false
    Aimbot.lockedTarget = nil
    Aimbot.lockedFPV = false
end)

local function getAimPart(char)
    if Config.AIM_ForceHeadshots then
        return char:FindFirstChild('Head')
    end
    if Config.AIM_Hitbox == 'Torso' then
        return char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso') or char:FindFirstChild('HumanoidRootPart')
    end

    return char:FindFirstChild('Head')
end

function Aimbot.FindBestTarget(cam)
    local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    local bestDist = math.huge
    local bestTarget = nil
    local bestIsFPV = false

    for root, char in pairs(Cache.targets)do
        if not root or not root.Parent or not char then
            continue
        end
        if Config.AIM_TeamCheck and Cache.teamStatus[root] then
            continue
        end
        if Config.AIM_VisibilityCheck and not Cache.visibility[root] then
            continue
        end

        local aimPart = getAimPart(char)

        if not aimPart then
            continue
        end

        local aimPos = aimPart.Position

        if Config.AIM_Prediction and aimPart.Velocity then
            aimPos = aimPos + aimPart.Velocity * Config.AIM_PredictionAmount
        end
        if Config.AIM_LegitMode and Config.AIM_HumanError > 0 then
            local offset = Vector3.new((math.random() - 0.5) * 2 * Config.AIM_HumanError, (math.random() - 0.5) * 2 * Config.AIM_HumanError, (math.random() - 0.5) * 2 * Config.AIM_HumanError)

            aimPos = aimPos + offset
        end

        local sp, on = cam:WorldToViewportPoint(aimPos)

        if on and sp.Z > 0 then
            local sDist = (Vector2.new(sp.X, sp.Y) - center).Magnitude

            if sDist <= Config.AIM_FOV and sDist < bestDist then
                bestDist = sDist
                bestTarget = {
                    char = char,
                    aimPos = aimPos,
                }
                bestIsFPV = false
            end
        end
    end

    if Config.AIM_FPV then
        for drone, part in pairs(Cache.drones)do
            if not drone or not part or not part.Parent then
                continue
            end

            local sp, on = cam:WorldToViewportPoint(part.Position)

            if on and sp.Z > 0 then
                local sDist = (Vector2.new(sp.X, sp.Y) - center).Magnitude

                if sDist <= Config.AIM_FOV and sDist < bestDist then
                    bestDist = sDist
                    bestTarget = {
                        drone = drone,
                        aimPos = part.Position,
                    }
                    bestIsFPV = true
                end
            end
        end
    end

    return bestTarget, bestIsFPV
end
function Aimbot.Step(cam, screenCenter)
    local guiInset = GuiService:GetGuiInset()

    if Config.AIM_Enabled and Config.AIM_ShowFOV then
        local jitterX, jitterY = 0, 0

        if Config.AIM_FOVJitter and Aimbot.aiming and Aimbot.lockedTarget then
            jitterX = (math.random() - 0.5) * 2
            jitterY = (math.random() - 0.5) * 2
        end

        FOVCircle.Position = UDim2.new(0, screenCenter.X + jitterX, 0, screenCenter.Y + guiInset.Y + jitterY)
        FOVCircle.Size = UDim2.new(0, Config.AIM_FOV * 2, 0, Config.AIM_FOV * 2)
        FOVStroke.Color = (Aimbot.aiming and Aimbot.lockedTarget) and Palette.FOV_Active or Palette.FOV_Circle
        FOVCircle.Visible = true
    else
        FOVCircle.Visible = false
    end
end

RunService:BindToRenderStep('AimbotCore', Enum.RenderPriority.Camera.Value + 1, function()
    if Unloaded or not Config.AIM_Enabled then
        return
    end
    if not (Aimbot.aiming or UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)) then
        Aimbot.lockedTarget = nil
        Aimbot.lockedFPV = false

        return
    end

    local cam = Workspace.CurrentCamera

    if not cam then
        return
    end
    if Config.AIM_LegitMode and Config.AIM_RandomDelay and not Aimbot.lockedTarget then
        task.wait(math.random() * 0.005)
    end

    local targetValid = false

    if Aimbot.lockedTarget then
        if Aimbot.lockedFPV then
            targetValid = Aimbot.lockedTarget.drone and Aimbot.lockedTarget.drone.Parent and Aimbot.lockedTarget.aimPos
        else
            local char = Aimbot.lockedTarget.char

            targetValid = char and char.Parent and char:FindFirstChild('Humanoid') and char.Humanoid.Health > 0

            if targetValid then
                local aimPart = getAimPart(char)

                if aimPart then
                    local newPos = aimPart.Position

                    if Config.AIM_Prediction and aimPart.Velocity then
                        local pred = Config.AIM_PredictionAmount

                        if Config.AIM_LegitMode then
                            pred = pred + (math.random() - 0.5) * 0.02
                        end

                        newPos = newPos + aimPart.Velocity * pred
                    end

                    Aimbot.lockedTarget.aimPos = newPos
                else
                    targetValid = false
                end
            end
        end
    end
    if not targetValid then
        local newTarget, isFPV = Aimbot.FindBestTarget(cam)

        Aimbot.lockedTarget = newTarget
        Aimbot.lockedFPV = isFPV or false
    end
    if not Aimbot.lockedTarget then
        return
    end

    local aimPos = Aimbot.lockedTarget.aimPos

    if not aimPos then
        return
    end
    if Config.AIM_LegitMode and Config.AIM_MissChance > 0 then
        if math.random(1, 100) <= Config.AIM_MissChance then
            aimPos = aimPos + Vector3.new((math.random() - 0.5) * 0.5, (math.random() - 0.5) * 0.5, (math.random() - 0.5) * 0.5)
        end
    end

    local smoothFactor = 1

    if Config.AIM_RandomSmooth and Config.AIM_LegitMode then
        smoothFactor = 0.98 + math.random() * 0.02
    end

    local goalCF = CFrame.lookAt(cam.CFrame.Position, aimPos)

    cam.CFrame = cam.CFrame:Lerp(goalCF, smoothFactor)

    pcall(function()
        local vm = cam:FindFirstChild('ViewModel')

        if vm then
            local cb = vm:FindFirstChild('CameraBone')

            if cb then
                cb.CFrame = cam.CFrame
            end

            local hrp = vm:FindFirstChild('HRP')

            if hrp then
                hrp.CFrame = cam.CFrame
            end
        end
    end)
    pcall(function()
        local net = game.ReplicatedStorage:FindFirstChild('network')

        if net then
            local lv = net:FindFirstChild('characterLookvector')

            if lv then
                lv:FireServer(cam.CFrame.LookVector)
            end
        end
    end)
end)

local Desync = {active = false}

function Desync.Run()
    Desync.active = true

    while Desync.active and Config.DESYNC_Enabled and not Unloaded do
        pcall(function()
            if not LocalPlayer.Character then
                return
            end

            local root = LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

            if not root then
                return
            end

            local a = Config.DESYNC_Amount
            local cf = root.CFrame

            root.CFrame = cf * CFrame.new(math.random(-a, a) * 0.1, 0, math.random(-a, a) * 0.1)

            task.wait(0.01)

            root.CFrame = cf
        end)
        task.wait(0.1 + 0.3 / math.max(Config.DESYNC_Amount, 1))
    end

    Desync.active = false
end

task.spawn(function()
    while not Unloaded do
        if Config.DESYNC_Enabled and not Desync.active then
            task.spawn(Desync.Run)
        end

        task.wait(0.5)
    end
end)

local Trigger = {
    active = false,
    lastShot = 0,
}

function Trigger.Check(cam)
    local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)

    for root, char in pairs(Cache.targets)do
        if root and char then
            if Config.TRIGGER_TeamCheck and Cache.teamStatus[root] then
                continue
            end

            local hum = char:FindFirstChild('Humanoid')

            if not hum or hum.Health <= 0 then
                continue
            end

            for _, pn in pairs({
                'Head',
                'Torso',
                'HumanoidRootPart',
            })do
                local p = char:FindFirstChild(pn)

                if p then
                    local sp, on = cam:WorldToViewportPoint(p.Position)

                    if on and sp.Z > 0 and (Vector2.new(sp.X, sp.Y) - center).Magnitude < Tuning.TriggerRadius then
                        return true
                    end
                end
            end
        end
    end

    return false
end
function Trigger.Shoot()
    pcall(function()
        if mouse1click then
            mouse1click()
        end
    end)
    pcall(function()
        local vim = game:GetService('VirtualInputManager')

        vim:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(0.01)
        vim:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end)
end
function Trigger.Run()
    Trigger.active = true

    while Config.TRIGGER_Enabled and not Unloaded do
        pcall(function()
            local cam = Workspace.CurrentCamera

            if cam and Trigger.Check(cam) then
                local now = tick() * 1000

                if now - Trigger.lastShot >= Config.TRIGGER_Delay then
                    Trigger.Shoot()

                    Trigger.lastShot = now
                end
            end
        end)
        task.wait(0.016)
    end

    Trigger.active = false
end

task.spawn(function()
    while not Unloaded do
        if Config.TRIGGER_Enabled and not Trigger.active then
            task.spawn(Trigger.Run)
        end

        task.wait(0.3)
    end
end)

local Tabs = {
    {
        name = 'ESP',
    },
    {
        name = 'AIM',
    },
    {
        name = 'MISC',
    },
}
local MenuItems = {
    {
        tab = 1,
        name = 'VISUALS',
        type = 'label',
    },
    {
        tab = 1,
        name = 'Enable ESP',
        key = 'ESP_Enabled',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Boxes',
        key = 'ESP_Boxes',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Names',
        key = 'ESP_Names',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Distance',
        key = 'ESP_Distance',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Skeleton',
        key = 'ESP_Skeleton',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Health Bar',
        key = 'ESP_Health',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Aim Direction',
        key = 'ESP_AimDir',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Looking At You',
        key = 'ESP_LookingAtYou',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Tracers',
        key = 'ESP_Tracers',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'FPV Drones',
        key = 'ESP_FPV',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Team Check',
        key = 'ESP_TeamCheck',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Max Distance',
        key = 'ESP_MaxDist',
        type = 'slider',
        min = 500,
        max = 5000,
        step = 100,
    },
    {
        tab = 1,
        name = 'RADAR',
        type = 'label',
    },
    {
        tab = 1,
        name = 'Enable Radar',
        key = 'RADAR_Enabled',
        type = 'toggle',
    },
    {
        tab = 1,
        name = 'Radar Size',
        key = 'RADAR_Size',
        type = 'slider',
        min = 80,
        max = 200,
        step = 10,
    },
    {
        tab = 2,
        name = 'AIMBOT',
        type = 'label',
    },
    {
        tab = 2,
        name = 'Enable Aimbot',
        key = 'AIM_Enabled',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'FOV',
        key = 'AIM_FOV',
        type = 'slider',
        min = 50,
        max = 500,
        step = 25,
    },
    {
        tab = 2,
        name = 'Show FOV',
        key = 'AIM_ShowFOV',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'Team Check',
        key = 'AIM_TeamCheck',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'Visibility Check',
        key = 'AIM_VisibilityCheck',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'Prediction',
        key = 'AIM_Prediction',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'Pred. Amount',
        key = 'AIM_PredictionAmount',
        type = 'slider',
        min = 0,
        max = 0.3,
        step = 0.01,
    },
    {
        tab = 2,
        name = 'Force Headshots',
        key = 'AIM_ForceHeadshots',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'Hitbox (backup)',
        key = 'AIM_Hitbox',
        type = 'dropdown',
        options = {
            'Head',
            'Torso',
        },
    },
    {
        tab = 2,
        name = 'Target FPV',
        key = 'AIM_FPV',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'ANTI\u{2011}BAN',
        type = 'label',
    },
    {
        tab = 2,
        name = 'Legit Mode',
        key = 'AIM_LegitMode',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'Human Error (\u{b0})',
        key = 'AIM_HumanError',
        type = 'slider',
        min = 0,
        max = 0.5,
        step = 0.01,
    },
    {
        tab = 2,
        name = 'Miss Chance (%)',
        key = 'AIM_MissChance',
        type = 'slider',
        min = 0,
        max = 20,
        step = 1,
    },
    {
        tab = 2,
        name = 'Random Smooth',
        key = 'AIM_RandomSmooth',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'Random Delay',
        key = 'AIM_RandomDelay',
        type = 'toggle',
    },
    {
        tab = 2,
        name = 'FOV Jitter',
        key = 'AIM_FOVJitter',
        type = 'toggle',
    },
    {
        tab = 3,
        name = 'DESYNC',
        type = 'label',
    },
    {
        tab = 3,
        name = 'Enable Desync',
        key = 'DESYNC_Enabled',
        type = 'toggle',
    },
    {
        tab = 3,
        name = 'Strength',
        key = 'DESYNC_Amount',
        type = 'slider',
        min = 1,
        max = 10,
        step = 1,
    },
    {
        tab = 3,
        name = 'TRIGGERBOT',
        type = 'label',
    },
    {
        tab = 3,
        name = 'Enable Trigger',
        key = 'TRIGGER_Enabled',
        type = 'toggle',
    },
    {
        tab = 3,
        name = 'Delay (ms)',
        key = 'TRIGGER_Delay',
        type = 'slider',
        min = 0,
        max = 200,
        step = 10,
    },
    {
        tab = 3,
        name = 'Team Check',
        key = 'TRIGGER_TeamCheck',
        type = 'toggle',
    },
}
local GUI = {
    Frame = nil,
    Dragging = false,
    DragOffset = Vector2.zero,
    Items = {},
    TabButtons = {},
    ContentFrame = nil,
    originalSize = nil,
    isAnimating = false,
    shadow = nil,
}

function GUI.Create()
    local menuW, menuH = 300, 550
    local titleH, tabH, footerH = 30, 34, 24

    GUI.originalSize = UDim2.new(0, menuW, 0, menuH)

    local shadow = Instance.new('Frame')

    shadow.Name = 'Shadow'
    shadow.BackgroundColor3 = Color3.new(0, 0, 0)
    shadow.BackgroundTransparency = 0.7
    shadow.BorderSizePixel = 0
    shadow.Size = UDim2.new(0, 0, 0, 0)
    shadow.Position = UDim2.new(0, 20, 0.5, -menuH / 2)
    shadow.Visible = false
    shadow.Parent = UI.ScreenGui
    Instance.new('UICorner', shadow).CornerRadius = UDim.new(0, 12)
    GUI.shadow = shadow

    local main = Instance.new('Frame')

    main.Name = 'Menu'
    main.BackgroundColor3 = Palette.MenuBg
    main.BackgroundTransparency = 0.02
    main.BorderSizePixel = 0
    main.Size = UDim2.new(0, 0, 0, 0)
    main.Position = UDim2.new(0, 20, 0.5, -menuH / 2)
    main.Active = true
    main.ClipsDescendants = true
    main.Parent = UI.ScreenGui
    GUI.Frame = main

    local mainGradient = Instance.new('UIGradient')

    mainGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 26)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 16)),
    }
    mainGradient.Rotation = 135
    mainGradient.Parent = main

    local mainCorner = Instance.new('UICorner')

    mainCorner.CornerRadius = UDim.new(0, 12)
    mainCorner.Parent = main

    local stroke = Instance.new('UIStroke')

    stroke.Color = Color3.fromRGB(80, 80, 100)
    stroke.Thickness = 1
    stroke.Transparency = 0.4
    stroke.Parent = main

    local title = Instance.new('Frame')

    title.Name = 'Title'
    title.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
    title.BorderSizePixel = 0
    title.Size = UDim2.new(1, 0, 0, titleH)
    title.Parent = main

    local titleGrad = Instance.new('UIGradient', title)

    titleGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 28, 38)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 18, 26)),
    }
    titleGrad.Rotation = 90

    local titleCorner = Instance.new('UICorner', title)

    titleCorner.CornerRadius = UDim.new(0, 8)

    local titleText = Instance.new('TextLabel')

    titleText.BackgroundTransparency = 1
    titleText.Position = UDim2.new(0, 14, 0, 0)
    titleText.Size = UDim2.new(0, 180, 1, 0)
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 15
    titleText.TextColor3 = Color3.fromRGB(130, 160, 255)
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Text = 'Lua Roblox Script'
    titleText.Parent = title

    local xenoTag = Instance.new('TextLabel')

    xenoTag.BackgroundTransparency = 1
    xenoTag.Position = UDim2.new(0, 195, 0, 0)
    xenoTag.Size = UDim2.new(0, 60, 1, 0)
    xenoTag.Font = Enum.Font.RobotoMono
    xenoTag.TextSize = 11
    xenoTag.TextColor3 = Color3.fromRGB(120, 255, 120)
    xenoTag.TextXAlignment = Enum.TextXAlignment.Left
    xenoTag.Text = 'XENO'
    xenoTag.Parent = title

    local hotkeyText = Instance.new('TextLabel')

    hotkeyText.BackgroundTransparency = 1
    hotkeyText.Position = UDim2.new(1, -100, 0, 0)
    hotkeyText.Size = UDim2.new(0, 90, 1, 0)
    hotkeyText.Font = Enum.Font.RobotoMono
    hotkeyText.TextSize = 11
    hotkeyText.TextColor3 = Palette.MenuTextDim
    hotkeyText.TextXAlignment = Enum.TextXAlignment.Right
    hotkeyText.Text = '[INS] [HOME]'
    hotkeyText.Parent = title

    local tabFrame = Instance.new('Frame')

    tabFrame.Name = 'Tabs'
    tabFrame.BackgroundTransparency = 1
    tabFrame.Position = UDim2.new(0, 0, 0, titleH)
    tabFrame.Size = UDim2.new(1, 0, 0, tabH)
    tabFrame.Parent = main

    local tabW = menuW / #Tabs

    for i, tab in ipairs(Tabs)do
        local btn = Instance.new('TextButton')

        btn.Name = tab.name
        btn.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
        btn.BackgroundTransparency = 0.3
        btn.BorderSizePixel = 0
        btn.Position = UDim2.new(0, (i - 1) * tabW + 3, 0, 3)
        btn.Size = UDim2.new(0, tabW - 6, 1, -6)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 13
        btn.TextColor3 = Palette.MenuTextDim
        btn.Text = tab.name
        btn.AutoButtonColor = false
        btn.Parent = tabFrame

        local btnCorner = Instance.new('UICorner', btn)

        btnCorner.CornerRadius = UDim.new(0, 6)

        local indicator = Instance.new('Frame')

        indicator.Name = 'Indicator'
        indicator.BackgroundColor3 = Palette.MenuAccent
        indicator.BorderSizePixel = 0
        indicator.Position = UDim2.new(0, 10, 1, -3)
        indicator.Size = UDim2.new(1, -20, 0, 3)
        indicator.Visible = (i == 1)
        indicator.Parent = btn
        Instance.new('UICorner', indicator).CornerRadius = UDim.new(0, 2)

        btn.MouseEnter:Connect(function()
            if Config.MENU_Tab ~= i then
                btn.BackgroundTransparency = 0.1
                btn.TextColor3 = Color3.new(1, 1, 1)
            end
        end)
        btn.MouseLeave:Connect(function()
            if Config.MENU_Tab ~= i then
                btn.BackgroundTransparency = 0.3
                btn.TextColor3 = Palette.MenuTextDim
            end
        end)
        btn.MouseButton1Click:Connect(function()
            if Config.MENU_Tab == i then
                return
            end

            Config.MENU_Tab = i

            GUI.UpdateTabs()
            GUI.UpdateContent()
        end)

        GUI.TabButtons[i] = {
            Button = btn,
            Indicator = indicator,
        }
    end

    local contentFrame = Instance.new('ScrollingFrame')

    contentFrame.Name = 'Content'
    contentFrame.BackgroundTransparency = 1
    contentFrame.Position = UDim2.new(0, 12, 0, titleH + tabH + 8)
    contentFrame.Size = UDim2.new(1, -24, 1, -titleH - tabH - footerH - 16)
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentFrame.ScrollBarThickness = 3
    contentFrame.ScrollBarImageColor3 = Palette.MenuAccent
    contentFrame.BorderSizePixel = 0
    contentFrame.Parent = main
    GUI.ContentFrame = contentFrame

    local layout = Instance.new('UIListLayout')

    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = contentFrame

    local footer = Instance.new('Frame')

    footer.Name = 'Footer'
    footer.BackgroundTransparency = 1
    footer.Position = UDim2.new(0, 0, 1, -footerH)
    footer.Size = UDim2.new(1, 0, 0, footerH)
    footer.Parent = main

    local creditBtn = Instance.new('TextButton')

    creditBtn.BackgroundTransparency = 1
    creditBtn.Position = UDim2.new(0, 10, 0, 0)
    creditBtn.Size = UDim2.new(1, -20, 1, 0)
    creditBtn.Font = Enum.Font.RobotoMono
    creditBtn.TextSize = 10
    creditBtn.TextColor3 = Palette.MenuTextDim
    creditBtn.TextXAlignment = Enum.TextXAlignment.Right
    creditBtn.Text = 't.me/LuaRobloxScripts  (click to copy)'
    creditBtn.Parent = footer

    creditBtn.MouseButton1Click:Connect(function()
        pcall(function()
            setclipboard('https://t.me/LuaRobloxScripts')
        end)

        creditBtn.TextColor3 = Palette.MenuAccent

        task.wait(0.2)

        creditBtn.TextColor3 = Palette.MenuTextDim
    end)
    title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and not GUI.isAnimating then
            GUI.Dragging = true

            local mouse = UserInputService:GetMouseLocation()

            GUI.DragOffset = mouse - Vector2.new(main.AbsolutePosition.X, main.AbsolutePosition.Y)
        end
    end)
    title.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            GUI.Dragging = false
        end
    end)

    GUI.AnimateOpen = function()
        if GUI.isAnimating then
            return
        end

        GUI.isAnimating = true
        GUI.Frame.Visible = true
        shadow.Visible = true
        GUI.Frame.BackgroundTransparency = 1
        shadow.BackgroundTransparency = 1

        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local goals = {
            Size = GUI.originalSize,
            BackgroundTransparency = 0.02,
        }
        local shadowGoals = {
            Size = GUI.originalSize + UDim2.new(0, 8, 0, 8),
            Position = UDim2.new(0, 16, 0.5, -(menuH / 2) - 4),
            BackgroundTransparency = 0.7,
        }
        local tween = TweenService:Create(GUI.Frame, tweenInfo, goals)
        local shadowTween = TweenService:Create(shadow, tweenInfo, shadowGoals)

        tween:Play()
        shadowTween:Play()
        tween.Completed:Connect(function()
            GUI.isAnimating = false
            GUI.Frame.Size = GUI.originalSize
            GUI.Frame.BackgroundTransparency = 0.02
            shadow.Size = GUI.originalSize + UDim2.new(0, 8, 0, 8)
            shadow.Position = UDim2.new(0, 16, 0.5, -(menuH / 2) - 4)
            shadow.BackgroundTransparency = 0.7
        end)
    end
    GUI.AnimateClose = function()
        if GUI.isAnimating then
            return
        end

        GUI.isAnimating = true

        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        local goals = {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
        }
        local shadowGoals = {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
        }
        local tween = TweenService:Create(GUI.Frame, tweenInfo, goals)
        local shadowTween = TweenService:Create(shadow, tweenInfo, shadowGoals)

        tween:Play()
        shadowTween:Play()
        tween.Completed:Connect(function()
            GUI.isAnimating = false
            GUI.Frame.Visible = false
            shadow.Visible = false
            GUI.Frame.Size = UDim2.new(0, 0, 0, 0)
            shadow.Size = UDim2.new(0, 0, 0, 0)
        end)
    end

    if Config.MENU_Open then
        GUI.Frame.Size = UDim2.new(0, 0, 0, 0)
        shadow.Size = UDim2.new(0, 0, 0, 0)
        GUI.Frame.BackgroundTransparency = 1
        shadow.BackgroundTransparency = 1
        GUI.Frame.Visible = true
        shadow.Visible = true

        GUI.AnimateOpen()
    else
        GUI.Frame.Visible = false
        shadow.Visible = false
    end

    GUI.UpdateContent()
end
function GUI.UpdateTabs()
    for i, tab in ipairs(GUI.TabButtons)do
        local isSelected = i == Config.MENU_Tab

        tab.Button.BackgroundTransparency = isSelected and 0.05 or 0.3
        tab.Button.TextColor3 = isSelected and Color3.new(1, 1, 1) or Palette.MenuTextDim
        tab.Indicator.Visible = isSelected
    end
end
function GUI.UpdateContent()
    for _, child in ipairs(GUI.ContentFrame:GetChildren())do
        if child:IsA('Frame') then
            child:Destroy()
        end
    end

    GUI.Items = {}

    local order = 0

    for _, menuItem in ipairs(MenuItems)do
        if menuItem.tab == Config.MENU_Tab then
            order = order + 1

            local itemH = menuItem.type == 'slider' and 42 or (menuItem.type == 'dropdown' and 36 or 30)
            local item = Instance.new('Frame')

            item.Name = menuItem.name
            item.BackgroundColor3 = menuItem.type == 'label' and Color3.fromRGB(0, 0, 0) or Palette.MenuPanel
            item.BackgroundTransparency = menuItem.type == 'label' and 1 or 0.25
            item.BorderSizePixel = 0
            item.Size = UDim2.new(1, 0, 0, itemH)
            item.LayoutOrder = order
            item.Parent = GUI.ContentFrame

            local itemCorner = Instance.new('UICorner', item)

            itemCorner.CornerRadius = UDim.new(0, 6)

            if menuItem.type ~= 'label' then
                local origTrans = item.BackgroundTransparency

                item.MouseEnter:Connect(function()
                    item.BackgroundTransparency = origTrans - 0.1
                end)
                item.MouseLeave:Connect(function()
                    item.BackgroundTransparency = origTrans
                end)
            end

            local label = Instance.new('TextLabel')

            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0, 12, 0, 0)
            label.Size = UDim2.new(0.65, 0, 0, itemH)
            label.Font = Enum.Font.Gotham
            label.TextSize = menuItem.type == 'label' and 14 or 12
            label.TextColor3 = menuItem.type == 'label' and Palette.MenuAccent or Palette.MenuText
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Text = menuItem.name
            label.Parent = item

            if menuItem.type == 'toggle' then
                local toggle = Instance.new('Frame')

                toggle.Name = 'Toggle'
                toggle.BackgroundColor3 = Config[menuItem.key] and Palette.MenuOn or Palette.MenuOff
                toggle.BorderSizePixel = 0
                toggle.Position = UDim2.new(1, -42, 0.5, -9)
                toggle.Size = UDim2.new(0, 32, 0, 18)
                toggle.Parent = item
                Instance.new('UICorner', toggle).CornerRadius = UDim.new(1, 0)

                local knob = Instance.new('Frame')

                knob.Name = 'Knob'
                knob.BackgroundColor3 = Color3.new(1, 1, 1)
                knob.BorderSizePixel = 0
                knob.Position = Config[menuItem.key] and UDim2.new(1, -15, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
                knob.Size = UDim2.new(0, 14, 0, 14)
                knob.Parent = toggle
                Instance.new('UICorner', knob).CornerRadius = UDim.new(1, 0)

                local btn = Instance.new('TextButton')

                btn.BackgroundTransparency = 1
                btn.Size = UDim2.new(1, 0, 1, 0)
                btn.Text = ''
                btn.Parent = item

                btn.MouseButton1Click:Connect(function()
                    Config[menuItem.key] = not Config[menuItem.key]
                    toggle.BackgroundColor3 = Config[menuItem.key] and Palette.MenuOn or Palette.MenuOff

                    local targetPos = Config[menuItem.key] and UDim2.new(1, -15, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
                    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

                    TweenService:Create(knob, tweenInfo, {Position = targetPos}):Play()
                end)
            elseif menuItem.type == 'slider' then
                local val = Config[menuItem.key]
                local valText = menuItem.step < 1 and string.format('%.2f', val) or tostring(math.floor(val))
                local valLabel = Instance.new('TextLabel')

                valLabel.Name = 'Value'
                valLabel.BackgroundTransparency = 1
                valLabel.Position = UDim2.new(1, -50, 0, 0)
                valLabel.Size = UDim2.new(0, 45, 0, 24)
                valLabel.Font = Enum.Font.RobotoMono
                valLabel.TextSize = 11
                valLabel.TextColor3 = Palette.MenuTextDim
                valLabel.TextXAlignment = Enum.TextXAlignment.Right
                valLabel.Text = valText
                valLabel.Parent = item

                local track = Instance.new('Frame')

                track.Name = 'Track'
                track.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
                track.BorderSizePixel = 0
                track.Position = UDim2.new(0, 12, 0, 28)
                track.Size = UDim2.new(1, -24, 0, 8)
                track.Parent = item
                Instance.new('UICorner', track).CornerRadius = UDim.new(1, 0)

                local pct = (val - menuItem.min) / (menuItem.max - menuItem.min)
                local fill = Instance.new('Frame')

                fill.Name = 'Fill'
                fill.BackgroundColor3 = Palette.MenuAccent
                fill.BorderSizePixel = 0
                fill.Size = UDim2.new(pct, 0, 1, 0)
                fill.Parent = track
                Instance.new('UICorner', fill).CornerRadius = UDim.new(1, 0)

                local dragging = false

                track.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                    end
                end)
                track.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

                Connections['slider_' .. menuItem.key] = RunService.RenderStepped:Connect(function()
                    if dragging then
                        local mx = UserInputService:GetMouseLocation().X
                        local tx = track.AbsolutePosition.X
                        local tw = track.AbsoluteSize.X
                        local p = math.clamp((mx - tx) / tw, 0, 1)
                        local v = menuItem.min + p * (menuItem.max - menuItem.min)

                        v = math.floor(v / menuItem.step + 0.5) * menuItem.step
                        Config[menuItem.key] = math.clamp(v, menuItem.min, menuItem.max)
                        fill.Size = UDim2.new((Config[menuItem.key] - menuItem.min) / (menuItem.max - menuItem.min), 0, 1, 0)
                        valLabel.Text = menuItem.step < 1 and string.format('%.2f', Config[menuItem.key]) or tostring(math.floor(Config[menuItem.key]))
                    end
                end)
            elseif menuItem.type == 'dropdown' then
                local current = Config[menuItem.key]
                local options = menuItem.options or {}
                local valLabel = Instance.new('TextLabel')

                valLabel.BackgroundTransparency = 1
                valLabel.Position = UDim2.new(1, -70, 0, 0)
                valLabel.Size = UDim2.new(0, 65, 0, itemH)
                valLabel.Font = Enum.Font.RobotoMono
                valLabel.TextSize = 12
                valLabel.TextColor3 = Palette.MenuAccent
                valLabel.TextXAlignment = Enum.TextXAlignment.Right
                valLabel.Text = current
                valLabel.Parent = item

                local btn = Instance.new('TextButton')

                btn.BackgroundTransparency = 1
                btn.Size = UDim2.new(1, 0, 1, 0)
                btn.Text = ''
                btn.Parent = item

                btn.MouseButton1Click:Connect(function()
                    local curIdx = 1

                    for i, opt in ipairs(options)do
                        if opt == current then
                            curIdx = i

                            break
                        end
                    end

                    local nextIdx = (curIdx % #options) + 1

                    Config[menuItem.key] = options[nextIdx]
                    valLabel.Text = options[nextIdx]
                end)
            end

            GUI.Items[#GUI.Items + 1] = item
        end
    end

    local totalH = 0

    for _, item in ipairs(GUI.Items)do
        totalH = totalH + item.AbsoluteSize.Y + 5
    end

    GUI.ContentFrame.CanvasSize = UDim2.new(0, 0, 0, totalH)
end
function GUI.Step()
    if GUI.Dragging and not GUI.isAnimating then
        local mouse = UserInputService:GetMouseLocation()
        local newPos = mouse - GUI.DragOffset

        GUI.Frame.Position = UDim2.new(0, newPos.X, 0, newPos.Y)

        if GUI.shadow and GUI.shadow.Visible then
            GUI.shadow.Position = UDim2.new(0, newPos.X - 4, 0, newPos.Y - 4)
        end
    end
end

local ToggleButton = Instance.new('TextButton')

ToggleButton.Name = 'ToggleButton'
ToggleButton.Size = UDim2.new(0, 40, 0, 40)
ToggleButton.AnchorPoint = Vector2.new(0, 0)
ToggleButton.Position = UDim2.new(1, -60, 1, -60)
ToggleButton.BackgroundColor3 = Palette.MenuBg
ToggleButton.BackgroundTransparency = 0.1
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = '</>'
ToggleButton.Font = Enum.Font.Code
ToggleButton.TextSize = 20
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Parent = UI.ScreenGui

local toggleStroke = Instance.new('UIStroke', ToggleButton)

toggleStroke.Color = Palette.MenuAccent
toggleStroke.Thickness = 1
Instance.new('UICorner', ToggleButton).CornerRadius = UDim.new(0, 8)

local ToggleDrag = {
    pending = false,
    startPos = Vector2.zero,
    offset = Vector2.zero,
    dragging = false,
}

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ToggleDrag.pending = true
        ToggleDrag.startPos = UserInputService:GetMouseLocation()
        ToggleDrag.offset = ToggleDrag.startPos - Vector2.new(ToggleButton.AbsolutePosition.X, ToggleButton.AbsolutePosition.Y)
        ToggleDrag.dragging = false
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if ToggleDrag.pending then
            if not ToggleDrag.dragging then
                Config.MENU_Open = not Config.MENU_Open

                if Config.MENU_Open then
                    GUI.AnimateOpen()
                else
                    GUI.AnimateClose()
                end
            end

            ToggleDrag.pending = false
            ToggleDrag.dragging = false
        end
    end
end)
RunService.RenderStepped:Connect(function()
    if ToggleDrag.pending then
        local mousePos = UserInputService:GetMouseLocation()

        if (mousePos - ToggleDrag.startPos).Magnitude > 5 then
            ToggleDrag.dragging = true
        end
        if ToggleDrag.dragging then
            local newX = mousePos.X - ToggleDrag.offset.X
            local newY = mousePos.Y - ToggleDrag.offset.Y
            local screenSize = Workspace.CurrentCamera.ViewportSize
            local btnSize = ToggleButton.AbsoluteSize

            newX = math.clamp(newX, 0, screenSize.X - btnSize.X)
            newY = math.clamp(newY, 0, screenSize.Y - btnSize.Y)
            ToggleButton.Position = UDim2.new(0, newX, 0, newY)
        end
    end
end)

Connections.input = UserInputService.InputBegan:Connect(function(input, gp)
    if input.KeyCode == Enum.KeyCode.Home then
        Unload()

        return
    end
    if input.KeyCode == Enum.KeyCode.Insert and not gp then
        Config.MENU_Open = not Config.MENU_Open

        if Config.MENU_Open then
            GUI.AnimateOpen()
        else
            GUI.AnimateClose()
        end
    end
end)
Connections.inputUp = UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        GUI.Dragging = false
    end
end)
Connections.render = RunService.RenderStepped:Connect(function()
    if Unloaded then
        return
    end

    local cam = Workspace.CurrentCamera

    if not cam then
        return
    end

    local screenSize = cam.ViewportSize
    local screenCenter = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
    local now = tick()
    local myChar = LocalPlayer.Character

    Cache.myRoot = myChar and myChar:FindFirstChild('HumanoidRootPart')

    if now - Timers.lastTargetRefresh > Tuning.TargetRefreshRate then
        Timers.lastTargetRefresh = now

        Targets.refresh()
    end
    if now - Timers.lastVisRefresh > Tuning.VisibilityRefreshRate then
        Timers.lastVisRefresh = now

        Targets.refreshVisibility()
    end
    if now - Timers.lastFPVRefresh > Tuning.FPVRefreshRate then
        Timers.lastFPVRefresh = now
        Cache.drones = FPV.Scan()
    end

    pcall(function()
        ESP.Step(cam, screenSize, screenCenter)
    end)
    pcall(function()
        FPV.Step(cam)
    end)
    pcall(function()
        UpdateRadar(cam)
    end)
    pcall(function()
        Aimbot.Step(cam, screenCenter)
    end)
    pcall(GUI.Step)
end)

function Unload()
    if Unloaded then
        return
    end

    Unloaded = true
    Config.DESYNC_Enabled = false
    Config.TRIGGER_Enabled = false
    Desync.active = false
    Trigger.active = false

    pcall(function()
        RunService:UnbindFromRenderStep('AimbotCore')
    end)

    for _, c in pairs(Connections)do
        pcall(function()
            c:Disconnect()
        end)
    end
    for _, esp in pairs(ESP.cache)do
        ESP.Destroy(esp)
    end
    for _, esp in pairs(FPV.cache)do
        FPV.Destroy(esp)
    end

    pcall(function()
        UI.ScreenGui:Destroy()
    end)
end

GUI.Create()
GUI.UpdateTabs()
