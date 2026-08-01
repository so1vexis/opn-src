local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local HttpService = game:GetService('HttpService')
local TeleportService = game:GetService('TeleportService')
local lp = Players.LocalPlayer
local roleCache = {}
local leapDebounce = false
local killAuraConnection = nil
local ghostLoopConnection = nil
local flingDetectionCon = nil
local flingNeutralizerCon = nil
local antiFlingEnabled = false
local detectedPlayers = {}
local layTrack = nil
local layAnim = Instance.new('Animation')

layAnim.AnimationId = 'rbxassetid://4686922869'

local ExodusBlue = Color3.fromRGB(0, 162, 255)
local ScreenGui = Instance.new('ScreenGui', game.CoreGui)

ScreenGui.Name = 'ExodusFloatingUI'
ScreenGui.ResetOnSpawn = false
_G.LockAll = false
_G.ESPEnabled = false
_G.AutoCoins = false
_G.AutoGrabGun = false
_G.AutoLeap = false
_G.DesiredSpeed = 16
_G.DesiredJump = 50
_G.SpeedGlitchEnabled = false
_G.SpeedGlitchValue = 40
_G.RoleNotify = false
_G.KillAuraEnabled = false
_G.KillAllEnabled = false
_G.AuraRange = 10
_G.SilentAimEnabled = false
_G.SilentAimWallCheck = false
_G.ShootingMethod = 'New (blatant)'
_G.PredictionMultiplier = 0.125
_G.SafeAutoFarm = false
_G.WebhookURL = ''
_G.CoinTween = nil
_G.HasReportedCoins = false
_G.BindShoot = Enum.KeyCode.Q
_G.BindGun = Enum.KeyCode.R
_G.BindThrow = Enum.KeyCode.E
_G.BindBomb = Enum.KeyCode.B

local DefaultShootPos = UDim2.new(1, -190, 1, -180)
local DefaultGunPos = UDim2.new(1, -100, 1, -190)
local DefaultThrowPos = UDim2.new(1, -195, 1, -100)
local DefaultBombPos = UDim2.new(1, -100, 0, 100)

local function CreateFloatingButton(config)
    config = config or {}

    local name = config.Name or 'Button'
    local text = config.Text or 'BUTTON'
    local pos = config.Position or UDim2.new(0.5, 0, 0.5, 0)
    local size = config.Size or UDim2.new(0, 75, 0, 75)
    local isRect = config.IsRect or false
    local parent = config.Parent or ScreenGui
    local visible = config.Visible or false
    local textSize = config.TextSize or (isRect and 18 or 16)
    local cornerRadius = config.CornerRadius or (isRect and UDim.new(0, 10) or UDim.new(1, 0))
    local bgColor = config.BgColor or Color3.fromRGB(10, 10, 10)
    local bgTransparency = config.BgTransparency or 0.3
    local textColor = config.TextColor or Color3.fromRGB(255, 255, 255)
    local strokeColor = config.StrokeColor or ExodusBlue
    local strokeThickness = config.StrokeThickness or 3
    local strokeTransparency = config.StrokeTransparency or 0.2
    local onClick = config.OnClick or nil
    local draggable = config.Draggable ~= false
    local btn = Instance.new('TextButton')

    btn.Name = name
    btn.Parent = parent
    btn.Visible = visible
    btn.Size = size
    btn.Position = pos
    btn.BackgroundColor3 = bgColor
    btn.BackgroundTransparency = bgTransparency
    btn.Text = text
    btn.TextColor3 = textColor
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = textSize
    btn.TextTransparency = 0.1
    btn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextStrokeTransparency = 0.5

    local corner = Instance.new('UICorner')

    corner.CornerRadius = cornerRadius
    corner.Parent = btn

    local stroke = Instance.new('UIStroke')

    stroke.Thickness = strokeThickness
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Color = strokeColor
    stroke.Transparency = strokeTransparency
    stroke.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.3), {
            BackgroundTransparency = 0.1,
            TextTransparency = 0,
        }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.3), {
            Thickness = 4,
            Color = Color3.new(1, 1, 1),
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.3), {
            BackgroundTransparency = bgTransparency,
            TextTransparency = 0.1,
        }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.3), {
            Thickness = strokeThickness,
            Color = strokeColor,
        }):Play()
    end)

    if onClick then
        btn.MouseButton1Click:Connect(onClick)
    end
    if draggable then
        local dragging, dragStart, startPos

        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                if not _G.LockAll then
                    dragging = true
                    dragStart = input.Position
                    startPos = btn.Position
                end
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart

                btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
    end

    return btn
end
local function CreateStatusBox(config)
    config = config or {}

    local name = config.Name or 'StatusBox'
    local text = config.Text or 'STATUS'
    local pos = config.Position or UDim2.new(0.5, 0, 0, 10)
    local size = config.Size or UDim2.new(0, 120, 0, 40)
    local parent = config.Parent or ScreenGui
    local visible = config.Visible or false
    local box = Instance.new('Frame')

    box.Name = name
    box.Parent = parent
    box.Visible = visible
    box.Size = size
    box.Position = pos
    box.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    box.BackgroundTransparency = 0.3

    local corner = Instance.new('UICorner')

    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = box

    local stroke = Instance.new('UIStroke')

    stroke.Thickness = 3
    stroke.Color = ExodusBlue
    stroke.Transparency = 0.2
    stroke.Parent = box

    local label = Instance.new('TextLabel')

    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 16
    label.TextStrokeTransparency = 0.5
    label.Parent = box

    return box, label
end

local ShootBtn = CreateFloatingButton({
    Name = 'ShootButton',
    Text = 'SHOOT',
    Position = DefaultShootPos,
    Size = UDim2.new(0, 150, 0, 50),
    IsRect = true,
    OnClick = function() end,
})
local GunBtn = CreateFloatingButton({
    Name = 'GunButton',
    Text = 'GUN',
    Position = DefaultGunPos,
    Size = UDim2.new(0, 75, 0, 75),
    IsRect = false,
    OnClick = function() end,
})
local ThrowBtn = CreateFloatingButton({
    Name = 'ThrowButton',
    Text = 'THROW',
    Position = DefaultThrowPos,
    Size = UDim2.new(0, 75, 0, 75),
    IsRect = false,
    OnClick = function() end,
})
local BombBtn = CreateFloatingButton({
    Name = 'BombButton',
    Text = 'BOMB',
    Position = DefaultBombPos,
    Size = UDim2.new(0, 75, 0, 75),
    IsRect = false,
    OnClick = function() end,
})
local TimerBox, TimerText = CreateStatusBox({
    Name = 'TimerBox',
    Text = 'TIME: --',
    Position = UDim2.new(0.5, -60, 0, 10),
    Size = UDim2.new(0, 120, 0, 40),
})
local ChanceBox, ChanceText = CreateStatusBox({
    Name = 'ChanceBox',
    Text = 'Soon',
    Position = UDim2.new(0.5, -75, 0, 55),
    Size = UDim2.new(0, 150, 0, 35),
})
local InvisState = false
local GhostCharacter = nil
local RealHRP = nil
local InvisDefaultPos = UDim2.new(0.5, 180, 0.5, -90)
local InvisGui = Instance.new('ScreenGui')

InvisGui.Name = 'Exodus_FloatingInvis'
InvisGui.ResetOnSpawn = false

local invisSuccess, invisCore = pcall(function()
    return game:GetService('CoreGui')
end)

InvisGui.Parent = invisSuccess and invisCore or lp:WaitForChild('PlayerGui')

local InvisBtn = CreateFloatingButton({
    Name = 'InvisButton',
    Text = 'INVIS: \u{1f534}',
    Position = InvisDefaultPos,
    Size = UDim2.new(0, 90, 0, 30),
    IsRect = true,
    Parent = InvisGui,
    Visible = false,
    TextSize = 13,
    StrokeColor = Color3.fromRGB(255, 0, 0),
    StrokeThickness = 2,
    CornerRadius = UDim.new(0, 6),
    OnClick = function()
        ToggleGhostMode()
    end,
})
local XrayDefaultPos = UDim2.new(0.5, 180, 0.5, -130)
local XrayState = false
local XrayBtn = Instance.new('TextButton')

XrayBtn.Name = 'XrayButton'
XrayBtn.Parent = InvisGui
XrayBtn.Visible = false
XrayBtn.Size = UDim2.new(0, 90, 0, 30)
XrayBtn.Position = XrayDefaultPos
XrayBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
XrayBtn.BackgroundTransparency = 0.3
XrayBtn.Text = 'X-RAY: \u{1f534}'
XrayBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
XrayBtn.Font = Enum.Font.GothamBold
XrayBtn.TextSize = 13
XrayBtn.TextTransparency = 0.1
XrayBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
XrayBtn.TextStrokeTransparency = 0.5

local XrayCorner = Instance.new('UICorner')

XrayCorner.CornerRadius = UDim.new(0, 6)
XrayCorner.Parent = XrayBtn

local XrayStroke = Instance.new('UIStroke')

XrayStroke.Thickness = 2
XrayStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
XrayStroke.Color = Color3.fromRGB(255, 0, 0)
XrayStroke.Transparency = 0.2
XrayStroke.Parent = XrayBtn

XrayBtn.MouseEnter:Connect(function()
    TweenService:Create(XrayBtn, TweenInfo.new(0.3), {
        BackgroundTransparency = 0.1,
        TextTransparency = 0,
    }):Play()
    TweenService:Create(XrayStroke, TweenInfo.new(0.3), {Thickness = 3}):Play()
end)
XrayBtn.MouseLeave:Connect(function()
    TweenService:Create(XrayBtn, TweenInfo.new(0.3), {
        BackgroundTransparency = 0.3,
        TextTransparency = 0.1,
    }):Play()
    TweenService:Create(XrayStroke, TweenInfo.new(0.3), {Thickness = 2}):Play()
end)
XrayBtn.MouseButton1Click:Connect(function()
    XrayState = not XrayState

    if XrayState then
        XrayBtn.Text = 'X-RAY: \u{1f7e2}'
        XrayStroke.Color = Color3.fromRGB(0, 255, 0)
    else
        XrayBtn.Text = 'X-RAY: \u{1f534}'
        XrayStroke.Color = Color3.fromRGB(255, 0, 0)
    end

    for _, mapCandidate in pairs(workspace:GetChildren())do
        if mapCandidate:IsA('Model') and mapCandidate:FindFirstChildWhichIsA('BasePart', true) then
            local basePartCount = 0

            for _, desc in pairs(mapCandidate:GetDescendants())do
                if desc:IsA('BasePart') then
                    basePartCount = basePartCount + 1

                    if basePartCount > 50 then
                        break
                    end
                end
            end

            if basePartCount > 50 then
                for _, v in pairs(mapCandidate:GetDescendants())do
                    if v:IsA('BasePart') and not v:IsDescendantOf(lp.Character) then
                        v.LocalTransparencyModifier = XrayState and 0.5 or 0
                    end
                end

                break
            end
        end
    end
end)

local function ToggleGhostMode()
    InvisState = not InvisState

    local char = lp.Character

    if InvisState then
        InvisBtn.Text = 'INVIS: \u{1f7e2}'
        InvisBtn.UIStroke.Color = Color3.fromRGB(0, 255, 0)
    else
        InvisBtn.Text = 'INVIS: \u{1f534}'
        InvisBtn.UIStroke.Color = Color3.fromRGB(255, 0, 0)
    end
    if not char or not char:FindFirstChild('HumanoidRootPart') then
        return
    end

    RealHRP = char.HumanoidRootPart

    if InvisState then
        local spawnPos = RealHRP.CFrame

        char.Archivable = true
        GhostCharacter = char:Clone()
        GhostCharacter.Name = 'Exodus_Ghost'
        GhostCharacter.Parent = workspace

        for _, v in pairs(GhostCharacter:GetDescendants())do
            if v:IsA('BasePart') then
                v.CanCollide = true
                v.Transparency = 0.3
            end
        end

        local ghostHead = GhostCharacter:FindFirstChild('Head')

        if ghostHead then
            ghostHead.Transparency = 1

            for _, child in pairs(ghostHead:GetChildren())do
                if child:IsA('Decal') or child:IsA('Texture') then
                    child.Transparency = 0.3
                end
            end
        end

        for _, v in pairs(GhostCharacter:GetDescendants())do
            if v:IsA('Accessory') then
                local handle = v:FindFirstChild('Handle')

                if handle then
                    handle.Transparency = 0.3
                end
            end
        end

        if GhostCharacter:FindFirstChild('HumanoidRootPart') then
            GhostCharacter.PrimaryPart = GhostCharacter.HumanoidRootPart
        end

        for _, part in pairs(char:GetDescendants())do
            if part:IsA('BasePart') then
                part.Anchored = true
            end
        end

        RealHRP.CFrame = CFrame.new(0, 20000, 0)

        local ghostHRP = GhostCharacter:WaitForChild('HumanoidRootPart', 2)

        if ghostHRP then
            ghostHRP.CFrame = spawnPos
        end

        local ghostHum = GhostCharacter:WaitForChild('Humanoid', 2)

        if ghostHum then
            ghostHum.WalkSpeed = 16
            ghostHum.JumpPower = 50
            ghostHum.AutoRotate = true

            local cam = workspace.CurrentCamera

            cam.CameraSubject = ghostHum
            cam.CameraType = Enum.CameraType.Custom
        end
        if ghostLoopConnection then
            ghostLoopConnection:Disconnect()
        end

        ghostLoopConnection = RunService.Heartbeat:Connect(function()
            if not InvisState or not GhostCharacter or not GhostCharacter.Parent then
                if ghostLoopConnection then
                    ghostLoopConnection:Disconnect()

                    ghostLoopConnection = nil
                end

                return
            end
            if RealHRP and RealHRP.Parent then
                RealHRP.Anchored = true
                RealHRP.CFrame = CFrame.new(0, 20000, 0)
            end
        end)
    else
        if ghostLoopConnection then
            ghostLoopConnection:Disconnect()

            ghostLoopConnection = nil
        end

        local ghostCF = CFrame.new()

        if GhostCharacter then
            local gHRP = GhostCharacter:FindFirstChild('HumanoidRootPart')

            if gHRP then
                ghostCF = gHRP.CFrame
            end

            GhostCharacter:Destroy()

            GhostCharacter = nil
        end

        local cam = workspace.CurrentCamera
        local realHum = char:FindFirstChild('Humanoid')

        if realHum then
            cam.CameraSubject = realHum
            cam.CameraType = Enum.CameraType.Custom
        end
        if RealHRP and RealHRP.Parent then
            for _, part in pairs(char:GetDescendants())do
                if part:IsA('BasePart') then
                    part.Anchored = false
                end
            end

            RealHRP.CFrame = ghostCF
        end
        if realHum then
            realHum.PlatformStand = false

            realHum:ChangeState(Enum.HumanoidStateType.GettingUp)
            realHum:ChangeState(Enum.HumanoidStateType.Running)
        end
    end
end
local function performLeap(targetHRP)
    if leapDebounce or not lp.Character or not lp.Character:FindFirstChild('HumanoidRootPart') then
        return
    end

    leapDebounce = true

    local hrp = lp.Character.HumanoidRootPart
    local direction = (targetHRP.Position - hrp.Position).Unit
    local attachment = Instance.new('Attachment', hrp)
    local lv = Instance.new('LinearVelocity', attachment)

    lv.MaxForce = 100000
    lv.VectorVelocity = direction * 80
    lv.Attachment0 = attachment

    task.wait(0.2)
    lv:Destroy()
    attachment:Destroy()
    task.wait(1.3)

    leapDebounce = false
end

RunService.Heartbeat:Connect(function()
    if _G.AutoLeap and lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
        local holdingKnife = lp.Character:FindFirstChild('Knife')

        if holdingKnife and not leapDebounce then
            for _, v in pairs(Players:GetPlayers())do
                if v ~= lp and v.Character and v.Character:FindFirstChild('HumanoidRootPart') then
                    local dist = (lp.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude

                    if dist <= 10 then
                        performLeap(v.Character.HumanoidRootPart)

                        break
                    end
                end
            end
        end
    end
end)
RunService.Heartbeat:Connect(function()
    pcall(function()
        if lp.Character and lp.Character:FindFirstChild('Humanoid') and lp.Character:FindFirstChild('HumanoidRootPart') then
            local char = lp.Character
            local hum = char.Humanoid
            local hrp = char.HumanoidRootPart

            hum.WalkSpeed = _G.DesiredSpeed
            hum.JumpPower = _G.DesiredJump

            if _G.SpeedGlitchEnabled and hum.FloorMaterial == Enum.Material.Air then
                local moveDir = hum.MoveDirection

                if moveDir.Magnitude > 0 then
                    local newVel = Vector3.new(moveDir.X * _G.SpeedGlitchValue, hrp.Velocity.Y, moveDir.Z * _G.SpeedGlitchValue)

                    hrp.Velocity = newVel
                    hrp.AssemblyLinearVelocity = newVel
                end
            end
        end
    end)
end)
task.spawn(function()
    while true do
        pcall(function()
            local t = workspace.RoundTimerPart.SurfaceGui.Timer

            TimerText.Text = t.Text
        end)
        pcall(function()
            local chance = lp.PlayerGui.MainGui.Lobby.Chance.Text

            ChanceText.Text = 'MURDERER: ' .. chance
        end)
        task.wait(0.5)
    end
end)

local function getDynamicPrediction(targetRoot, myRoot)
    local targetVelocity = targetRoot.AssemblyLinearVelocity
    local distance = (myRoot.Position - targetRoot.Position).Magnitude
    local pingValue = 0.06

    pcall(function()
        local pingStr = game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValueString()

        pingValue = tonumber(pingStr:match('%d+')) / 1000 or 0.06
    end)

    local travelTime = distance / 175
    local speedMultiplier = math.clamp(targetVelocity.Magnitude / 16, 0.5, 1.5)

    return (pingValue + travelTime) * speedMultiplier
end
local function getCombatData()
    local char = lp.Character
    local myHRP = char and char:FindFirstChild('HumanoidRootPart')
    local arm = char and (char:FindFirstChild('Right Arm') or char:FindFirstChild('RightHand'))

    if not myHRP or not arm then
        return nil
    end

    local target = nil

    for _, p in ipairs(game.Players:GetPlayers())do
        if p ~= lp and p.Character then
            if p.Character:FindFirstChild('Knife') or (p:FindFirstChild('Backpack') and p.Backpack:FindFirstChild('Knife')) then
                target = p

                break
            end
        end
    end

    if not target or not target.Character:FindFirstChild('HumanoidRootPart') then
        return nil
    end

    local root = target.Character.HumanoidRootPart
    local velocity = root.AssemblyLinearVelocity
    local activeMethod = _G.ShootingMethod

    if activeMethod == 'New (blatant)' and _G.SilentAimWallCheck then
        local visible = false
        local partsToCheck = {
            target.Character:FindFirstChild('Head'),
            root,
            target.Character:FindFirstChild('UpperTorso'),
        }
        local rayParams = RaycastParams.new()

        rayParams.FilterType = Enum.RaycastFilterType.Exclude

        local ignoreList = {}

        for _, v in ipairs(game.Players:GetPlayers())do
            if v.Character then
                table.insert(ignoreList, v.Character)
            end
        end

        rayParams.FilterDescendantsInstances = ignoreList

        for _, part in ipairs(partsToCheck)do
            if part then
                local direction = (part.Position - arm.Position)
                local result = workspace:Raycast(arm.Position, direction, rayParams)

                if not result then
                    visible = true

                    break
                end
            end
        end

        if not visible then
            activeMethod = 'Normal'
        end
    end

    local predTime = _G.PredictionMultiplier or 0.12
    local flatVelocity = Vector3.new(velocity.X, 0, velocity.Z)
    local flatOffset = flatVelocity * predTime
    local clampedY = math.clamp((velocity.Y * predTime), -1.2, 1.2)
    local verticalOffset = Vector3.new(0, clampedY, 0)

    if velocity.Magnitude < 2 then
        flatOffset = Vector3.new(0, 0, 0)
        verticalOffset = Vector3.new(0, 0, 0)
    end

    local finalPredictionOffset = flatOffset + verticalOffset
    local originPos, targetPos

    if activeMethod == 'New (blatant)' then
        originPos = root.Position + Vector3.new(0, 0, -0.4)
        targetPos = root.Position + (root.AssemblyLinearVelocity * 0.12)
    else
        originPos = arm.Position

        local dist = (myHRP.Position - root.Position).Magnitude
        local dropComp = Vector3.new(0, (dist / 140), 0)

        targetPos = root.Position + finalPredictionOffset + dropComp
    end

    return root, originPos, targetPos
end
local function TeleportToLobby()
    local char = lp.Character
    local hrp = char and char:FindFirstChild('HumanoidRootPart')
    local hum = char and char:FindFirstChild('Humanoid')
    local lobby = workspace:FindFirstChild('RegularLobby')

    if hrp and hum and lobby then
        if _G.CoinTween then
            _G.CoinTween:Cancel()

            _G.CoinTween = nil
        end

        hum.PlatformStand = false

        hum:ChangeState(Enum.HumanoidStateType.GettingUp)

        hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        hrp.CFrame = lobby:GetPivot() + Vector3.new(0, 5, 0)
    end
end
local function fireGun()
    local char = lp.Character
    local hum = char and char:FindFirstChild('Humanoid')
    local myHRP = char and char:FindFirstChild('HumanoidRootPart')

    if not hum or not myHRP then
        return
    end

    local gun = char:FindFirstChild('Gun') or (lp.Backpack:FindFirstChild('Gun'))

    if not gun then
        return
    end

    local root, originPos, targetPos = getCombatData()

    if root and originPos and targetPos then
        if gun.Parent ~= char then
            hum:EquipTool(gun)
        end

        local remote = gun:FindFirstChild('Shoot') or game:GetService('ReplicatedStorage'):FindFirstChild('ShootGun')

        if remote then
            local originCF = CFrame.lookAt(originPos, targetPos)
            local targetCF = CFrame.new(targetPos)
            local args = {
                [1] = originCF,
                [2] = targetCF,
            }

            remote:FireServer(unpack(args))
        end
    end
end
local function getMurderer()
    for _, p in ipairs(Players:GetPlayers())do
        if p ~= lp then
            local backpack = p:FindFirstChild('Backpack')
            local char = p.Character

            if backpack and backpack:FindFirstChild('Knife') then
                return p
            end
            if char and char:FindFirstChild('Knife') then
                return p
            end
        end
    end
    for name, data in pairs(roleCache)do
        if data.Role == 'Murderer' then
            local p = Players:FindFirstChild(name)

            if p then
                return p
            end
        end
    end

    return nil
end
local function getSheriff()
    if workspace:FindFirstChild('GunDrop', true) then
        return nil
    end

    for _, p in pairs(game:GetService('Players'):GetPlayers())do
        if p ~= lp and p.Character then
            local backpack = p:FindFirstChild('Backpack')
            local char = p.Character
            local hasGun = char:FindFirstChild('Gun') or (backpack and backpack:FindFirstChild('Gun'))

            if hasGun then
                return p
            end
        end
    end
    for name, data in pairs(roleCache)do
        if data.Role == 'Sheriff' or data.Role == 'Hero' then
            local p = game:GetService('Players'):FindFirstChild(name)

            if p then
                return p
            end
        end
    end

    return nil
end
local function serverHop(smallServer)
    local PlaceId = game.PlaceId
    local servers = {}
    local url = 'https://games.roblox.com/v1/games/' .. PlaceId .. '/servers/Public?limit=100'
    local success, response = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)

    if not success or not response or not response.data then
        Rayfield:Notify({
            Title = 'Error',
            Content = 'Failed to fetch servers.',
            Duration = 3,
        })

        return
    end

    for _, server in ipairs(response.data)do
        if server.playing < server.maxPlayers and server.id ~= game.JobId then
            table.insert(servers, server)
        end
    end

    if #servers == 0 then
        Rayfield:Notify({
            Title = 'Error',
            Content = 'No other servers found.',
            Duration = 3,
        })

        return
    end
    if smallServer then
        table.sort(servers, function(a, b)
            return a.playing < b.playing
        end)
    end

    TeleportService:TeleportToPlaceInstance(PlaceId, servers[1].id, lp)
end
local function throwAction()
    local knife = lp.Character:FindFirstChild('Knife') or lp.Backpack:FindFirstChild('Knife')
    local near, dist = nil, math.huge

    for _, v in pairs(Players:GetPlayers())do
        if v ~= lp and v.Character and v.Character:FindFirstChild('HumanoidRootPart') then
            local d = (lp.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude

            if d < dist then
                dist = d
                near = v
            end
        end
    end

    if knife and near and near.Character:FindFirstChild('HumanoidRootPart') then
        if knife.Parent == lp.Backpack then
            lp.Character.Humanoid:EquipTool(knife)
        end

        local targetHRP = near.Character.HumanoidRootPart
        local myHRP = lp.Character.HumanoidRootPart
        local origin = myHRP.Position
        local targetPos = targetHRP.Position
        local args = {
            [1] = CFrame.new(origin, targetPos) * CFrame.Angles(1.4531978368759155, 0.04432811588048935, 1.6501713991165161),
            [2] = CFrame.new(targetPos) * CFrame.Angles(-0, 0, -0),
        }

        if knife:FindFirstChild('Events') and knife.Events:FindFirstChild('KnifeThrown') then
            knife.Events.KnifeThrown:FireServer(unpack(args))
        end
    end
end
local function grabGunAction()
    local d = workspace:FindFirstChild('GunDrop', true)

    if d and lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
        local old = lp.Character.HumanoidRootPart.CFrame

        lp.Character.HumanoidRootPart.CFrame = d.CFrame

        task.wait(0.1)

        lp.Character.HumanoidRootPart.CFrame = old
    end
end
local function deployBomb()
    local character = lp.Character

    if not character or not character:FindFirstChild('HumanoidRootPart') then
        return
    end

    local hrp = character.HumanoidRootPart
    local hum = character:FindFirstChild('Humanoid')
    local toy = lp.Backpack:FindFirstChild('FakeBomb') or character:FindFirstChild('FakeBomb')

    if not toy then
        local reqArgs = {
            [1] = 'FakeBomb',
        }

        game:GetService('ReplicatedStorage').Remotes.Extras.ReplicateToy:InvokeServer(unpack(reqArgs))
        task.wait(0.1)

        toy = lp.Backpack:FindFirstChild('FakeBomb')
    end
    if toy then
        if toy.Parent == lp.Backpack then
            hum:EquipTool(toy)
        end

        local bombArgs = {
            [1] = hrp.CFrame * CFrame.new(0, -2.5, 0),
            [2] = 50,
        }
        local remote = toy:FindFirstChild('Remote') or (character:FindFirstChild('FakeBomb') and character.FakeBomb:FindFirstChild('Remote'))

        if remote then
            remote:FireServer(unpack(bombArgs))
        end

        task.delay(1, function()
            if hum then
                hum.Jump = true
            end
        end)
    end
end
local function toggleAntiFling(state)
    antiFlingEnabled = state

    if state then
        Rayfield:Notify({
            Title = 'Anti-Fling',
            Content = 'Protection Activated',
            Duration = 2,
        })

        flingDetectionCon = RunService.Heartbeat:Connect(function()
            for _, pl in ipairs(Players:GetPlayers())do
                if pl ~= lp and pl.Character and pl.Character.PrimaryPart then
                    local primary = pl.Character.PrimaryPart

                    if primary.AssemblyAngularVelocity.Magnitude > 50 or primary.AssemblyLinearVelocity.Magnitude > 100 then
                        for _, p in ipairs(pl.Character:GetDescendants())do
                            if p:IsA('BasePart') then
                                p.CanCollide = false
                            end
                        end
                    end
                end
            end
        end)
        flingNeutralizerCon = RunService.Heartbeat:Connect(function()
            if lp.Character and lp.Character.PrimaryPart then
                local hrp = lp.Character.PrimaryPart

                if hrp.AssemblyLinearVelocity.Magnitude > 250 or hrp.AssemblyAngularVelocity.Magnitude > 250 then
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.AssemblyAngularVelocity = Vector3.zero
                end
            end
        end)
    else
        if flingDetectionCon then
            flingDetectionCon:Disconnect()
        end
        if flingNeutralizerCon then
            flingNeutralizerCon:Disconnect()
        end

        detectedPlayers = {}

        Rayfield:Notify({
            Title = 'Anti-Fling',
            Content = 'Protection Deactivated',
            Duration = 2,
        })
    end
end
local function executeFling(target)
    if not target or not target.Character then
        Rayfield:Notify({
            Title = 'Exodus Error',
            Content = 'Target not found.',
            Duration = 2,
        })

        return
    end

    local wasAntiFlingOn = antiFlingEnabled

    if wasAntiFlingOn then
        toggleAntiFling(false)
        task.wait(0.2)
    end

    local player = lp
    local Targets = {target}
    local AllBool = false
    local SkidFling = function(TargetPlayer)
        local Character = player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass('Humanoid')
        local RootPart = Humanoid and Humanoid.RootPart
        local TCharacter = TargetPlayer.Character
        local THumanoid
        local TRootPart
        local THead
        local Accessory
        local Handle

        if TCharacter:FindFirstChildOfClass('Humanoid') then
            THumanoid = TCharacter:FindFirstChildOfClass('Humanoid')
        end
        if THumanoid and THumanoid.RootPart then
            TRootPart = THumanoid.RootPart
        end
        if TCharacter:FindFirstChild('Head') then
            THead = TCharacter.Head
        end
        if TCharacter:FindFirstChildOfClass('Accessory') then
            Accessory = TCharacter:FindFirstChildOfClass('Accessory')
        end
        if Accessory and Accessory:FindFirstChild('Handle') then
            Handle = Accessory.Handle
        end
        if Character and Humanoid and RootPart then
            if RootPart.Velocity.Magnitude < 50 then
                getgenv().OldPos = RootPart.CFrame
            end
            if THead then
                workspace.CurrentCamera.CameraSubject = THead
            elseif not THead and Handle then
                workspace.CurrentCamera.CameraSubject = Handle
            elseif THumanoid and TRootPart then
                workspace.CurrentCamera.CameraSubject = THumanoid
            end
            if not TCharacter:FindFirstChildWhichIsA('BasePart') then
                return
            end

            local FPos = function(BasePart, Pos, Ang)
                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang

                Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)

                RootPart.Velocity = Vector3.new(9e7, 9E8, 9e7)
                RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
            end
            local SFBasePart = function(BasePart)
                local TimeToWait = 2
                local Time = tick()
                local Angle = 0

                repeat
                    if RootPart and THumanoid then
                        if BasePart.Velocity.Magnitude < 50 then
                            Angle = Angle + 100

                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                        else
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                        end
                    else
                        break
                    end
                until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or TargetPlayer.Character ~= TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
            end

            workspace.FallenPartsDestroyHeight = 0 / 0

            local BV = Instance.new('BodyVelocity')

            BV.Name = 'EpixVel'
            BV.Parent = RootPart
            BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
            BV.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)

            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

            if TRootPart and THead then
                if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                    SFBasePart(THead)
                else
                    SFBasePart(TRootPart)
                end
            elseif TRootPart and not THead then
                SFBasePart(TRootPart)
            elseif not TRootPart and THead then
                SFBasePart(THead)
            elseif not TRootPart and not THead and Accessory and Handle then
                SFBasePart(Handle)
            else
                Rayfield:Notify({
                    Title = 'Exodus Error',
                    Content = 'Cannot find proper part to fling.',
                    Duration = 3,
                })
            end

            BV:Destroy()
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

            workspace.CurrentCamera.CameraSubject = Humanoid

            repeat
                RootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)

                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
                Humanoid:ChangeState('GettingUp')

                for _, x in pairs(Character:GetChildren())do
                    if x:IsA('BasePart') then
                        x.Velocity = Vector3.new()
                        x.RotVelocity = Vector3.new()
                    end
                end

                task.wait()
            until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25

            workspace.FallenPartsDestroyHeight = getgenv().FPDH
        else
            Rayfield:Notify({
                Title = 'Exodus Error',
                Content = 'No valid character of target player.',
                Duration = 3,
            })
        end
    end

    SkidFling(Targets[1])

    if wasAntiFlingOn then
        task.wait(0.5)
        toggleAntiFling(true)
    end
end
local function holdHostage()
    if getMurderer() ~= lp then
        Rayfield:Notify({
            Title = 'Exodus',
            Content = 'You are not the Murderer!',
            Duration = 3,
        })

        return
    end

    local myHRP = lp.Character and lp.Character:FindFirstChild('HumanoidRootPart')

    if not myHRP then
        return
    end

    for _, player in ipairs(Players:GetPlayers())do
        if player ~= lp and player.Character and player.Character:FindFirstChild('HumanoidRootPart') then
            local targetHRP = player.Character.HumanoidRootPart

            targetHRP.Anchored = true
            targetHRP.CFrame = myHRP.CFrame + (myHRP.CFrame.LookVector * 4)
        end
    end

    Rayfield:Notify({
        Title = 'Hostage',
        Content = 'Everyone frozen at your position.',
        Duration = 3,
    })
end

local lastRole = nil

task.spawn(function()
    while task.wait(1) do
        if _G.RoleNotify then
            local myData = roleCache[lp.Name]

            if myData and type(myData) == 'table' then
                local currentRole = myData.Role or 'Innocent'

                if currentRole ~= lastRole then
                    local roleIcon = 4483345998

                    if currentRole == 'Murderer' then
                        roleIcon = 10795431606
                    elseif currentRole == 'Sheriff' or currentRole == 'Hero' then
                        roleIcon = 10795430489
                    end

                    Rayfield:Notify({
                        Title = 'ROUND START',
                        Content = 'Assigned Role: ' .. currentRole:upper(),
                        Duration = 5,
                        Image = roleIcon,
                    })

                    lastRole = currentRole
                end
            else
                lastRole = nil
            end
        else
            local myData = roleCache[lp.Name]

            if myData and type(myData) == 'table' then
                lastRole = myData.Role or 'Innocent'
            end
        end
    end
end)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end
    if input.KeyCode == _G.BindShoot then
        fireGun()
    elseif input.KeyCode == _G.BindThrow then
        throwAction()
    elseif input.KeyCode == _G.BindGun then
        grabGunAction()
    elseif input.KeyCode == _G.BindBomb then
        deployBomb()
    end
end)
task.spawn(function()
    while task.wait(1.5) do
        local success, data = pcall(function()
            local remote = game:GetService('ReplicatedStorage'):FindFirstChild('GetPlayerData', true)

            if remote then
                return remote:InvokeServer()
            end
        end)

        if success and type(data) == 'table' then
            roleCache = data
        end
    end
end)

local function applyPlayerESP(p)
    if not p or p == lp then
        return
    end

    local function setup(char)
        if not char then
            return
        end

        local head = char:WaitForChild('Head', 10)

        if not head then
            return
        end

        local highlight = char:FindFirstChild('ExodusESP') or Instance.new('Highlight')

        highlight.Name = 'ExodusESP'
        highlight.Parent = char
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0

        local bill = head:FindFirstChild('ExodusBill') or Instance.new('BillboardGui')

        bill.Name = 'ExodusBill'
        bill.Parent = head
        bill.Adornee = head
        bill.Size = UDim2.new(0, 150, 0, 50)
        bill.AlwaysOnTop = true
        bill.ExtentsOffset = Vector3.new(0, 3, 0)

        local label = bill:FindFirstChild('TextLabel') or Instance.new('TextLabel')

        label.Parent = bill
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.TextSize = 12
        label.TextStrokeTransparency = 0

        task.spawn(function()
            while char and char.Parent and p and p.Parent and p.Character == char do
                if _G.ESPEnabled then
                    highlight.Enabled = true
                    bill.Enabled = true

                    local activeHero = nil

                    for _, player in ipairs(game.Players:GetPlayers())do
                        if player and player.Character then
                            local bp = player:FindFirstChild('Backpack')
                            local charGun = player.Character:FindFirstChild('Gun')
                            local backGun = bp and bp:FindFirstChild('Gun')

                            if charGun or backGun then
                                activeHero = player

                                break
                            end
                        end
                    end

                    local backpack = p:FindFirstChild('Backpack')
                    local hasKnife = (backpack and backpack:FindFirstChild('Knife')) or char:FindFirstChild('Knife')
                    local hasGun = (backpack and backpack:FindFirstChild('Gun')) or char:FindFirstChild('Gun')
                    local gunDropped = workspace:FindFirstChild('GunDrop', true)
                    local pData = roleCache[p.Name]
                    local role = (pData and type(pData) == 'table' and pData.Role) or 'Innocent'

                    if hasKnife or role == 'Murderer' then
                        local mColor = Color3.fromRGB(255, 0, 0)

                        highlight.FillColor = mColor
                        label.Text = 'MURDERER\n\u{25bc}'
                        label.TextColor3 = mColor
                    elseif hasGun then
                        local sColor = Color3.fromRGB(0, 162, 255)

                        highlight.FillColor = sColor
                        label.Text = 'SHERIFF\n\u{25bc}'
                        label.TextColor3 = sColor
                    elseif role == 'Sheriff' or role == 'Hero' then
                        if gunDropped or (activeHero and activeHero ~= p) then
                            local iColor = Color3.fromRGB(0, 255, 0)

                            highlight.FillColor = iColor
                            label.Text = '\u{25bc}'
                            label.TextColor3 = iColor
                        else
                            local sColor = Color3.fromRGB(0, 162, 255)

                            highlight.FillColor = sColor
                            label.Text = 'SHERIFF\n\u{25bc}'
                            label.TextColor3 = sColor
                        end
                    else
                        local iColor = Color3.fromRGB(0, 255, 0)

                        highlight.FillColor = iColor
                        label.Text = '\u{25bc}'
                        label.TextColor3 = iColor
                    end
                else
                    highlight.Enabled = false
                    bill.Enabled = false
                end

                task.wait(0.5)
            end
        end)
    end

    p.CharacterAdded:Connect(setup)

    if p.Character then
        setup(p.Character)
    end
end

for _, player in pairs(game.Players:GetPlayers())do
    applyPlayerESP(player)
end

game.Players.PlayerAdded:Connect(applyPlayerESP)

local function ResetCharacterPhysics()
    if lp.Character and lp.Character:FindFirstChild('Humanoid') then
        local hum = lp.Character.Humanoid
        local hrp = lp.Character:FindFirstChild('HumanoidRootPart')

        if layTrack then
            layTrack:Stop()
        end

        hum.JumpPower = _G.DesiredJump
        hum.WalkSpeed = _G.DesiredSpeed

        hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        hum:ChangeState(Enum.HumanoidStateType.GettingUp)

        for _, part in pairs(lp.Character:GetDescendants())do
            if part:IsA('BasePart') then
                part.CanCollide = true
            end
        end

        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.new(0, 6, 0)
        end
    end
end
local function applyStats(char)
    local hum = char:WaitForChild('Humanoid')

    hum.WalkSpeed = _G.DesiredSpeed
    hum.UseJumpPower = true
    hum.JumpPower = _G.DesiredJump
end

lp.CharacterAdded:Connect(applyStats)

if lp.Character then
    applyStats(lp.Character)
end

RunService.Stepped:Connect(function()
    if lp.Character and lp.Character:FindFirstChild('Humanoid') then
        if _G.AutoCoins then
            lp.Character.Humanoid:ChangeState(11)

            for _, part in pairs(lp.Character:GetDescendants())do
                if part:IsA('BasePart') then
                    part.CanCollide = false
                    part.Velocity = Vector3.zero
                end
            end
        end
    end
end)
task.spawn(function()
    while true do
        local drop = workspace:FindFirstChild('GunDrop', true)

        if drop and not drop:FindFirstChild('ExodusGunESP') then
            local bill = Instance.new('BillboardGui', drop)

            bill.Name = 'ExodusGunESP'
            bill.Size = UDim2.new(0, 120, 0, 60)
            bill.AlwaysOnTop = true
            bill.ExtentsOffset = Vector3.new(0, 2, 0)

            local label = Instance.new('TextLabel', bill)

            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Font = 'GothamBold'
            label.TextSize = 16
            label.Text = 'GUN HERE\n\u{25bc}'
            label.TextColor3 = Color3.fromRGB(0, 255, 0)
            label.TextStrokeTransparency = 0
            label.TextStrokeColor3 = Color3.new(0, 0, 0)
        end
        if _G.AutoGrabGun and drop and lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
            firetouchinterest(lp.Character.HumanoidRootPart, drop, 0)
            firetouchinterest(lp.Character.HumanoidRootPart, drop, 1)
        end

        task.wait(0.1)
    end
end)
task.spawn(function()
    local currentTween = nil

    while true do
        task.wait(0.1)

        if _G.AutoCoins and lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
            local hrp = lp.Character.HumanoidRootPart
            local hum = lp.Character:FindFirstChild('Humanoid')
            local coins = workspace:FindFirstChild('CoinContainer', true) or workspace:FindFirstChild('Coins', true)

            if hum and (not layTrack or not layTrack.IsPlaying) then
                layTrack = hum:LoadAnimation(layAnim)
                layTrack.Looped = true

                layTrack:Play()
                hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
            end
            if coins then
                local target, sDist = nil, math.huge

                for _, c in pairs(coins:GetChildren())do
                    if c:IsA('BasePart') and c:FindFirstChild('TouchInterest') then
                        local d = (hrp.Position - c.Position).Magnitude

                        if d < sDist then
                            sDist = d
                            target = c
                        end
                    end
                end

                if target and target.Parent then
                    firetouchinterest(hrp, target, 0)

                    local subPos = target.Position - Vector3.new(0, 4.3, 0)

                    if currentTween then
                        currentTween:Cancel()
                    end

                    currentTween = TweenService:Create(hrp, TweenInfo.new(sDist / 22, Enum.EasingStyle.Linear), {
                        CFrame = CFrame.new(subPos),
                    })

                    currentTween:Play()

                    repeat
                        task.wait()
                    until not target or not target.Parent or not _G.AutoCoins or (hrp.Position - subPos).Magnitude < 1.5

                    if target and target.Parent then
                        firetouchinterest(hrp, target, 1)
                    end
                end
            end
        else
            if currentTween then
                currentTween:Cancel()

                currentTween = nil
            end
            if layTrack then
                layTrack:Stop()
            end
        end
    end
end)

local function setKillAura(enabled)
    if killAuraConnection then
        killAuraConnection:Disconnect()

        killAuraConnection = nil
    end
    if enabled then
        killAuraConnection = RunService.Heartbeat:Connect(function()
            if not lp.Character or not lp.Character:FindFirstChild('HumanoidRootPart') then
                return
            end

            local knife = lp.Character:FindFirstChild('Knife')

            if not knife then
                local backpackKnife = lp.Backpack:FindFirstChild('Knife')

                if backpackKnife then
                    lp.Character:FindFirstChild('Humanoid'):EquipTool(backpackKnife)

                    knife = lp.Character:FindFirstChild('Knife')
                end
            end
            if not knife then
                return
            end

            local nearest, shortestDist = nil, math.huge

            for _, p in ipairs(Players:GetPlayers())do
                if p ~= lp and p.Character and p.Character:FindFirstChild('HumanoidRootPart') then
                    local dist = (lp.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude

                    if dist < shortestDist then
                        shortestDist = dist
                        nearest = p
                    end
                end
            end

            if not nearest or not nearest.Character then
                return
            end

            local tHRP = nearest.Character:FindFirstChild('HumanoidRootPart')
            local tHum = nearest.Character:FindFirstChild('Humanoid')

            if not tHRP or not tHum or tHum.Health <= 0 then
                return
            end

            local range = _G.AuraRange or 7

            if shortestDist > range then
                return
            end

            pcall(function()
                tHRP.Anchored = true
                tHRP.CFrame = lp.Character.HumanoidRootPart.CFrame + lp.Character.HumanoidRootPart.CFrame.LookVector * 2

                task.wait(0.1)

                if knife:FindFirstChild('Stab') then
                    knife.Stab:FireServer('Slash')
                end
            end)
            task.delay(0.3, function()
                if tHRP then
                    tHRP.Anchored = false
                end
            end)
        end)
    end
end
local function killAll()
    if not lp.Character or not lp.Character:FindFirstChild('HumanoidRootPart') then
        return
    end

    local knife = lp.Character:FindFirstChild('Knife') or lp.Backpack:FindFirstChild('Knife')

    if not knife then
        Rayfield:Notify({
            Title = 'Exodus',
            Content = 'No knife found!',
            Duration = 3,
        })

        return
    end
    if knife.Parent == lp.Backpack then
        lp.Character:FindFirstChild('Humanoid'):EquipTool(knife)

        knife = lp.Character:FindFirstChild('Knife')
    end
    if not knife then
        return
    end

    local victims = {}

    for _, p in ipairs(Players:GetPlayers())do
        if p ~= lp and p.Character and p.Character:FindFirstChild('HumanoidRootPart') then
            local tHRP = p.Character.HumanoidRootPart

            tHRP.Anchored = true
            tHRP.CFrame = lp.Character.HumanoidRootPart.CFrame + lp.Character.HumanoidRootPart.CFrame.LookVector * 1

            table.insert(victims, tHRP)
        end
    end

    task.wait(0.1)

    if knife:FindFirstChild('Stab') then
        knife.Stab:FireServer('Slash')
    end

    task.delay(0.5, function()
        for _, tHRP in ipairs(victims)do
            if tHRP then
                tHRP.Anchored = false
            end
        end
    end)
end
local function sendCoinWebhook(status, coins)
    if _G.WebhookURL == '' or _G.WebhookURL == nil then
        return
    end

    local data = {
        embeds = {
            {
                title = '\u{2728} EXODUS HUB | COIN TRACKER \u{1fa99}',
                description = '**Status:** ' .. status .. '\n**Collected:** `+' .. tostring(coins) .. '`\n**Account:** ||' .. lp.Name .. '||',
                color = tonumber('0x00a2ff'),
            },
        },
    }
    local jsonData = HttpService:JSONEncode(data)
    local req = http_request or request or HttpPost or syn.request

    if req then
        pcall(function()
            req({
                Url = _G.WebhookURL,
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                },
                Body = jsonData,
            })
        end)
    end
end
local function getCoinContainer()
    for _, v in pairs(workspace:GetChildren())do
        if v:FindFirstChild('CoinContainer') then
            return v.CoinContainer
        end
    end

    return nil
end
local function getLobbyCFrame()
    local lobby = workspace:FindFirstChild('Lobby') or workspace:FindFirstChild('RegularLobby')

    if lobby then
        local spawns = lobby:FindFirstChild('Spawns')

        if spawns and #spawns:GetChildren() > 0 then
            return spawns:GetChildren()[1].CFrame + Vector3.new(0, 5, 0)
        end

        for _, child in pairs(lobby:GetDescendants())do
            if child:IsA('SpawnLocation') or child.Name:lower():find('spawn') then
                return child.CFrame + Vector3.new(0, 5, 0)
            end
        end

        return lobby:GetPivot() + Vector3.new(0, 5, 0)
    end

    for _, obj in pairs(workspace:GetDescendants())do
        if obj:IsA('SpawnLocation') then
            return obj.CFrame + Vector3.new(0, 5, 0)
        end
    end

    return CFrame.new(-108.5, 145, 41)
end
local function isInLobby()
    if not lp.Character or not lp.Character:FindFirstChild('HumanoidRootPart') then
        return false
    end

    local hrp = lp.Character.HumanoidRootPart
    local lobbyCF = getLobbyCFrame()
    local distance = (hrp.Position - lobbyCF.Position).Magnitude
    local container = getCoinContainer()

    if not container and distance < 300 then
        return true
    end

    return distance < 200
end

RunService.Heartbeat:Connect(function()
    if _G.SafeAutoFarm and _G.CoinTween then
        local container = getCoinContainer()

        if not container or not container.Parent or isInLobby() then
            _G.CoinTween:Cancel()

            _G.CoinTween = nil

            if lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
                lp.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)
RunService.Stepped:Connect(function()
    if _G.SafeAutoFarm and lp.Character then
        local hrp = lp.Character:FindFirstChild('HumanoidRootPart')
        local hum = lp.Character:FindFirstChild('Humanoid')

        if not hrp or not hum then
            return
        end
        if not isInLobby() then
            hum:ChangeState(Enum.HumanoidStateType.Physics)

            hum.PlatformStand = true

            for _, v in pairs(lp.Character:GetDescendants())do
                if v:IsA('BasePart') then
                    v.CanCollide = false
                end
            end
        end
    end
end)

local function ResetFarmPhysics()
    if not lp.Character then
        return
    end

    local hum = lp.Character:FindFirstChild('Humanoid')
    local hrp = lp.Character:FindFirstChild('HumanoidRootPart')

    if hum then
        hum.PlatformStand = false

        hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        hum:ChangeState(Enum.HumanoidStateType.Running)

        hum.WalkSpeed = _G.DesiredSpeed or 16
        hum.JumpPower = _G.DesiredJump or 50
        hum.UseJumpPower = true
        hum.AutoRotate = true
    end
    if hrp then
        hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        hrp.RotVelocity = Vector3.new(0, 0, 0)
    end

    for _, v in pairs(lp.Character:GetDescendants())do
        if v:IsA('BasePart') then
            v.CanCollide = true
        end
    end

    task.delay(0.1, function()
        if lp.Character and lp.Character:FindFirstChild('Humanoid') then
            local h = lp.Character.Humanoid

            h:ChangeState(Enum.HumanoidStateType.GettingUp)
            h:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
            h:ChangeState(Enum.HumanoidStateType.Running)
        end
    end)
end

task.spawn(function()
    local coinsThisRound = 0

    while task.wait(0.1) do
        if not _G.SafeAutoFarm then
            continue
        end

        local char = lp.Character
        local hrp = char and char:FindFirstChild('HumanoidRootPart')
        local hum = char and char:FindFirstChild('Humanoid')

        if not hrp or not hum then
            continue
        end

        local pGui = lp:FindFirstChild('PlayerGui')
        local mainGui = pGui and pGui:FindFirstChild('MainGUI')
        local fullUI = mainGui and mainGui:FindFirstChild('Lobby') and mainGui.Lobby:FindFirstChild('Dock') and mainGui.Lobby.Dock:FindFirstChild('CoinBags') and mainGui.Lobby.Dock.CoinBags:FindFirstChild('Container') and mainGui.Lobby.Dock.CoinBags.Container:FindFirstChild('Coin')
        local isFull = fullUI and fullUI:FindFirstChild('Full') and fullUI.Full.Visible or false
        local liveCoinUI = fullUI and fullUI:FindFirstChild('CurrencyFrame') and fullUI.CurrencyFrame:FindFirstChild('Icon') and fullUI.CurrencyFrame.Icon:FindFirstChild('Coins')

        if liveCoinUI then
            local currentVal = tonumber(liveCoinUI.Text)

            if currentVal then
                coinsThisRound = currentVal

                if coinsThisRound == 0 then
                    _G.HasReportedCoins = false
                end
            end
        end

        local inLobby = isInLobby()

        if inLobby then
            if not _G.HasReportedCoins and coinsThisRound > 0 then
                sendCoinWebhook('Round Ended \u{26a0}\u{fe0f}', coinsThisRound)

                _G.HasReportedCoins = true
            end
            if _G.CoinTween then
                _G.CoinTween:Cancel()

                _G.CoinTween = nil
            end

            continue
        end
        if isFull then
            if _G.CoinTween then
                _G.CoinTween:Cancel()

                _G.CoinTween = nil
            end

            hum:ChangeState(Enum.HumanoidStateType.GettingUp)

            hum.PlatformStand = false
            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)

            local startTime = tick()
            local lobbyCF = getLobbyCFrame()

            task.spawn(function()
                while tick() - startTime < 1 do
                    if lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
                        local h = lp.Character.HumanoidRootPart

                        h.CFrame = lobbyCF
                        h.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    end

                    task.wait(0.05)
                end
            end)

            if not _G.HasReportedCoins then
                sendCoinWebhook('Bag Full! \u{2705}', coinsThisRound)

                _G.HasReportedCoins = true
            end

            continue
        end

        local container = getCoinContainer()

        if container and not isInLobby() then
            local targetCoin = nil

            for _, c in ipairs(container:GetChildren())do
                if c:IsA('BasePart') and c.Name == 'Coin_Server' then
                    targetCoin = c

                    break
                end
            end

            if targetCoin then
                local dist = (hrp.Position - targetCoin.Position).Magnitude
                local tweenInfo = TweenInfo.new(dist / 40, Enum.EasingStyle.Linear)

                _G.CoinTween = TweenService:Create(hrp, tweenInfo, {
                    CFrame = targetCoin.CFrame * CFrame.new(0, -4, 0),
                })

                _G.CoinTween:Play()

                while _G.SafeAutoFarm and targetCoin.Parent == container and _G.CoinTween.PlaybackState == Enum.PlaybackState.Playing do
                    task.wait(0.05)

                    if fullUI and fullUI:FindFirstChild('Full') then
                        isFull = fullUI.Full.Visible
                    end
                    if isFull or isInLobby() then
                        break
                    end
                end

                if _G.CoinTween then
                    _G.CoinTween:Cancel()

                    _G.CoinTween = nil
                end

                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)

local Window = Rayfield:CreateWindow({
    Name = 'EXODUS HUB | Murder Mystery 2 \u{1f52a}',
    LoadingTitle = 'by @exodusstk',
    ConfigurationSaving = {
        Enabled = true,
        FolderName = 'ExodusConfigs',
        FileName = 'MM2_Final',
    },
})
local MainTab = Window:CreateTab('Main', 4483362458)
local FlingTab = Window:CreateTab('Fling', 4483362458)
local FarmTab = Window:CreateTab('Auto Farm', 4483362458)
local PlayerTab = Window:CreateTab('Player', 4483362458)
local MiscTab = Window:CreateTab('Misc', 4483362458)
local KeybindsTab = Window:CreateTab('Keybinds', 4483362458)

MainTab:CreateSection('Role ESP')
MainTab:CreateToggle({
    Name = 'Enable Arrow ESP',
    CurrentValue = false,
    Flag = 'ESP_F',
    Callback = function(V)
        _G.ESPEnabled = V
    end,
})
MainTab:CreateSection('Aim Utilities (Sheriff)')
MainTab:CreateDropdown({
    Name = 'Shooting Method',
    Options = {
        'Normal',
        'New (blatant)',
    },
    CurrentOption = {
        'New (blatant)',
    },
    MultipleOptions = false,
    Flag = 'SMethod',
    Callback = function(Option)
        _G.ShootingMethod = Option[1]
    end,
})
MainTab:CreateToggle({
    Name = 'Wall-Check',
    CurrentValue = false,
    Flag = 'WCheck',
    Callback = function(v)
        _G.SilentAimWallCheck = v
    end,
})
MainTab:CreateToggle({
    Name = 'Auto Grab Gun',
    CurrentValue = false,
    Flag = 'AGG_F',
    Callback = function(V)
        _G.AutoGrabGun = V
    end,
})
MainTab:CreateSection('Knife Utilities (Murderer)')
MainTab:CreateToggle({
    Name = 'Kill Aura',
    CurrentValue = false,
    Flag = 'KillAura_T',
    Callback = function(v)
        _G.KillAuraEnabled = v

        setKillAura(v)
    end,
})
MainTab:CreateInput({
    Name = 'Aura Range',
    PlaceholderText = 'Enter Range (e.g. 15)',
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        local value = tonumber(Text)

        if value then
            _G.AuraRange = value
        end
    end,
})
MainTab:CreateToggle({
    Name = 'Kill All Players',
    CurrentValue = false,
    Flag = 'KillAll_T',
    Callback = function(v)
        _G.KillAllEnabled = v

        if v then
            setKillAura(false)

            killAuraConnection = RunService.Heartbeat:Connect(function()
                if not _G.KillAllEnabled then
                    return
                end

                killAll()
                task.wait(0.5)
            end)
        else
            if killAuraConnection then
                killAuraConnection:Disconnect()
            end
        end
    end,
})
MainTab:CreateButton({
    Name = 'Instant Kill All (One-Time)',
    Callback = function()
        killAll()
    end,
})
MainTab:CreateToggle({
    Name = 'Murd Auto-Leap (Hold Knife)',
    CurrentValue = false,
    Flag = 'AL_F',
    Callback = function(V)
        _G.AutoLeap = V
    end,
})
MainTab:CreateSection('UI Settings')
MainTab:CreateToggle({
    Name = 'Lock Floating UI',
    CurrentValue = false,
    Flag = 'Lock_F',
    Callback = function(V)
        _G.LockAll = V
    end,
})
MainTab:CreateToggle({
    Name = 'Show Gun Button',
    CurrentValue = false,
    Flag = 'SGB_F',
    Callback = function(V)
        GunBtn.Visible = V
    end,
})
MainTab:CreateToggle({
    Name = 'Show Shoot Button',
    CurrentValue = false,
    Flag = 'SSB_F',
    Callback = function(V)
        ShootBtn.Visible = V
    end,
})
MainTab:CreateToggle({
    Name = 'Show Prank Button',
    CurrentValue = false,
    Flag = 'SPB_F',
    Callback = function(V)
        BombBtn.Visible = V
    end,
})
MainTab:CreateToggle({
    Name = 'Show Throw Button',
    CurrentValue = false,
    Flag = 'STB_F',
    Callback = function(V)
        ThrowBtn.Visible = V
    end,
})
MainTab:CreateButton({
    Name = 'Reset UI Positions',
    Callback = function()
        ShootBtn.Position = DefaultShootPos
        GunBtn.Position = DefaultGunPos
        ThrowBtn.Position = DefaultThrowPos
        BombBtn.Position = DefaultBombPos
        InvisBtn.Position = InvisDefaultPos
        XrayBtn.Position = XrayDefaultPos
    end,
})
MainTab:CreateSection('Others')
MainTab:CreateToggle({
    Name = 'Show Game Timer',
    CurrentValue = false,
    Flag = 'Timer_F',
    Callback = function(V)
        TimerBox.Visible = V
    end,
})
MainTab:CreateToggle({
    Name = 'Show Chance (not working)',
    CurrentValue = false,
    Flag = 'Chance_F',
    Callback = function(V)
        ChanceBox.Visible = V
    end,
})

local StartTime = os.time()
local TotalCollected = 0
local LastSessionBag = 0
local CoinTracker = FarmTab:CreateParagraph({
    Title = 'Coin Live Tracker',
    Content = 'Elapsed: 0d 0h 0m 0s\nBag: 0/0\nTotal Collected: 0',
})

task.spawn(function()
    while task.wait(1) do
        local diff = os.time() - StartTime
        local days = math.floor(diff / 86400)
        local hours = math.floor((diff % 86400) / 3600)
        local mins = math.floor((diff % 3600) / 60)
        local secs = diff % 60
        local timeStr = string.format('%dd %dh %dm %ds', days, hours, mins, secs)
        local coinText = '0/0'
        local bagValue = 0
        local maxBag = 40

        pcall(function()
            local pGui = lp:FindFirstChild('PlayerGui')
            local mainGUI = pGui and pGui:FindFirstChild('MainGUI')
            local lobby = mainGUI and mainGUI:FindFirstChild('Lobby')
            local dock = lobby and lobby:FindFirstChild('Dock')
            local coinBags = dock and dock:FindFirstChild('CoinBags')
            local container = coinBags and coinBags:FindFirstChild('Container')
            local coin = container and container:FindFirstChild('Coin')
            local currencyFrame = coin and coin:FindFirstChild('CurrencyFrame')
            local icon = currencyFrame and currencyFrame:FindFirstChild('Icon')
            local coinsLabel = icon and icon:FindFirstChild('Coins')

            if coinsLabel then
                coinText = coinsLabel.Text

                local current, max = coinText:match('(%d+)%D+(%d+)')

                bagValue = tonumber(current) or 0
                maxBag = tonumber(max) or 40
            end

            bagValue = tonumber(current) or 0
            maxBag = tonumber(max) or 40
        end)

        if bagValue < LastSessionBag then
            TotalCollected = TotalCollected + LastSessionBag
        end

        LastSessionBag = bagValue

        local displayBag = bagValue .. '/' .. maxBag

        CoinTracker:Set({
            Title = 'Coin Live Tracker',
            Content = 'Elapsed: ' .. timeStr .. '\nBag: ' .. displayBag .. '\nTotal Collected: ' .. (TotalCollected + bagValue),
        })
    end
end)
FarmTab:CreateSection('Safe AFK System')
FarmTab:CreateToggle({
    Name = 'Enable Safe Coin Farm',
    CurrentValue = false,
    Flag = 'AutoCoinToggle',
    Callback = function(Value)
        _G.SafeAutoFarm = Value
        _G.AutoCoins = Value

        if not Value then
            if _G.CoinTween then
                _G.CoinTween:Cancel()

                _G.CoinTween = nil
            end

            ResetFarmPhysics()
            task.delay(0.5, ResetFarmPhysics)
        end
    end,
})
PlayerTab:CreateInput({
    Name = 'Walk Speed',
    PlaceholderText = '16',
    Flag = 'WS_F',
    Callback = function(T)
        local s = tonumber(T)

        if s then
            _G.DesiredSpeed = s

            if lp.Character and lp.Character:FindFirstChild('Humanoid') then
                lp.Character.Humanoid.WalkSpeed = s
            end
        end
    end,
})
PlayerTab:CreateInput({
    Name = 'Jump Power',
    PlaceholderText = '50',
    Flag = 'JP_F',
    Callback = function(T)
        local s = tonumber(T)

        if s then
            _G.DesiredJump = s

            if lp.Character and lp.Character:FindFirstChild('Humanoid') then
                lp.Character.Humanoid.UseJumpPower = true
                lp.Character.Humanoid.JumpPower = s
            end
        end
    end,
})
PlayerTab:CreateToggle({
    Name = 'Speed Glitch (Air Only)',
    CurrentValue = false,
    Callback = function(V)
        _G.SpeedGlitchEnabled = V
    end,
})
PlayerTab:CreateInput({
    Name = 'Glitch Speed',
    PlaceholderText = '40',
    Flag = 'SP_F',
    Callback = function(T)
        _G.SpeedGlitchValue = tonumber(T) or 50
    end,
})
KeybindsTab:CreateInput({
    Name = 'Shoot Keybind',
    PlaceholderText = 'Q',
    Flag = 'KB_Shoot',
    Callback = function(T)
        local key = string.upper(T)

        pcall(function()
            _G.BindShoot = Enum.KeyCode[key]
        end)
    end,
})
KeybindsTab:CreateInput({
    Name = 'Gun Keybind',
    PlaceholderText = 'R',
    Flag = 'KB_Gun',
    Callback = function(T)
        local key = string.upper(T)

        pcall(function()
            _G.BindGun = Enum.KeyCode[key]
        end)
    end,
})
KeybindsTab:CreateInput({
    Name = 'Throw Keybind',
    PlaceholderText = 'E',
    Flag = 'KB_Throw',
    Callback = function(T)
        local key = string.upper(T)

        pcall(function()
            _G.BindThrow = Enum.KeyCode[key]
        end)
    end,
})
KeybindsTab:CreateInput({
    Name = 'Bomb Keybind',
    PlaceholderText = 'B',
    Flag = 'KB_Bomb',
    Callback = function(T)
        local key = string.upper(T)

        pcall(function()
            _G.BindBomb = Enum.KeyCode[key]
        end)
    end,
})
MiscTab:CreateSection('Role Utilities')
MiscTab:CreateToggle({
    Name = 'Role Notify',
    CurrentValue = false,
    Flag = 'RoleNotify_F',
    Callback = function(V)
        _G.RoleNotify = V
    end,
})
MiscTab:CreateSection('Teleports')
MiscTab:CreateButton({
    Name = 'Teleport to Lobby',
    Callback = function()
        TeleportToLobby()
    end,
})

local selectedFlingTarget = nil
local flingDropdown = nil

local function getOtherPlayers()
    local list = {}

    for _, p in ipairs(Players:GetPlayers())do
        if p ~= lp then
            table.insert(list, p.Name)
        end
    end

    return list
end

FlingTab:CreateSection('Security')
FlingTab:CreateToggle({
    Name = 'Anti-Fling',
    CurrentValue = false,
    Flag = 'AntiFling_Toggle',
    Callback = function(Value)
        toggleAntiFling(Value)
    end,
})
FlingTab:CreateSection('Target Selection')

flingDropdown = FlingTab:CreateDropdown({
    Name = 'Select Target',
    Options = getOtherPlayers(),
    CurrentOption = {},
    MultipleOptions = false,
    Flag = 'FlingTarget_Dropdown',
    Callback = function(Option)
        if Option and Option[1] then
            selectedFlingTarget = Players:FindFirstChild(Option[1])
        end
    end,
})

FlingTab:CreateButton({
    Name = 'Fling Selected Target',
    Callback = function()
        if selectedFlingTarget and selectedFlingTarget.Parent then
            executeFling(selectedFlingTarget)
        else
            Rayfield:Notify({
                Title = 'Fling Error',
                Content = 'No target selected or target left the game!',
                Duration = 3,
            })
        end
    end,
})
FlingTab:CreateButton({
    Name = 'Refresh Player List',
    Callback = function()
        local players = getOtherPlayers()

        flingDropdown:Refresh(players, {})
        Rayfield:Notify({
            Title = 'Fling',
            Content = 'Player list refreshed! Found ' .. #players .. ' players.',
            Duration = 2,
        })
    end,
})
FlingTab:CreateSection('Fling by Roles')
FlingTab:CreateButton({
    Name = 'Fling Murderer',
    Callback = function()
        executeFling(getMurderer())
    end,
})
FlingTab:CreateButton({
    Name = 'Fling Sheriff',
    Callback = function()
        executeFling(getSheriff())
    end,
})

local function makeDraggable(btn, action)
    local dragging, dragStart, startPos

    btn.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            if action then
                action()
            end
            if not _G.LockAll then
                dragging = true
                dragStart = input.Position
                startPos = btn.Position
            end
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart

            btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function()
        dragging = false
    end)
end

makeDraggable(ShootBtn, fireGun)
makeDraggable(ThrowBtn, throwAction)
makeDraggable(GunBtn, grabGunAction)
makeDraggable(BombBtn, deployBomb)
Rayfield:LoadConfiguration()
