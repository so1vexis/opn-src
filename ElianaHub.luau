repeat
    task.wait()
until game:IsLoaded()

local WindUI = loadstring(game:HttpGet('https://github.com/Footagesus/WindUI/releases/latest/download/main.lua'))()
local HttpService = game:GetService('HttpService')
local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService('Workspace')
local StarterGui = game:GetService('StarterGui')
local Camera = Workspace.CurrentCamera
local TextChatService = game:GetService('TextChatService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local VirtualUser = game:GetService('VirtualUser')
local TeleportService = game:GetService('TeleportService')
local cloneref = (cloneref or clonereference or function(i)
    return i
end)

WindUI:AddTheme({
    Name = 'Dark',
    Accent = '#18181b',
    Dialog = '#18181b',
    Outline = '#FFFFFF',
    Text = '#FFFFFF',
    Placeholder = '#999999',
    Background = '#0e0e10',
    Button = '#52525b',
    Icon = '#a1a1aa',
})
WindUI:AddTheme({
    Name = 'Light',
    Accent = '#f4f4f5',
    Dialog = '#f4f4f5',
    Outline = '#000000',
    Text = '#000000',
    Placeholder = '#666666',
    Background = '#ffffff',
    Button = '#e4e4e7',
    Icon = '#52525b',
})
WindUI:AddTheme({
    Name = 'Gray',
    Accent = '#374151',
    Dialog = '#374151',
    Outline = '#d1d5db',
    Text = '#f9fafb',
    Placeholder = '#9ca3af',
    Background = '#1f2937',
    Button = '#4b5563',
    Icon = '#d1d5db',
})
WindUI:AddTheme({
    Name = 'Blue',
    Accent = '#1e40af',
    Dialog = '#1e3a8a',
    Outline = '#93c5fd',
    Text = '#f0f9ff',
    Placeholder = '#60a5fa',
    Background = '#1e293b',
    Button = '#3b82f6',
    Icon = '#93c5fd',
})
WindUI:AddTheme({
    Name = 'Green',
    Accent = '#059669',
    Dialog = '#047857',
    Outline = '#6ee7b7',
    Text = '#ecfdf5',
    Placeholder = '#34d399',
    Background = '#064e3b',
    Button = '#10b981',
    Icon = '#6ee7b7',
})
WindUI:AddTheme({
    Name = 'Purple',
    Accent = '#7c3aed',
    Dialog = '#6d28d9',
    Outline = '#c4b5fd',
    Text = '#faf5ff',
    Placeholder = '#a78bfa',
    Background = '#581c87',
    Button = '#8b5cf6',
    Icon = '#c4b5fd',
})
WindUI:SetNotificationLower(true)

local function LoadNexora()
    local url = 'https://raw.githubusercontent.com/UniversalScripter1/ProjectNexora/refs/heads/main/Notification'
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)

    if success and result and result ~= '' then
        local func, err = loadstring(result)

        if func then
            return func()
        else
            warn('Nexora Loader: Syntax Error in External Script - ' .. tostring(err))
        end
    else
        warn('Nexora Loader: Connection Error. Could not fetch from GitHub.')
    end

    return nil
end

local notif = LoadNexora()

local function ExtractAssetId(icon)
    if not icon then
        return nil
    end
    if type(icon) == 'number' then
        return icon
    end

    local s = tostring(icon)
    local id = s:match('(%d+)')

    return tonumber(id)
end
local function SendNexoraNotification(title, text, duration, icon)
    duration = duration or 5

    if notif and type(notif.Notification) == 'function' then
        local iconId = ExtractAssetId(icon) or 54952350
        local ok, _ = pcall(function()
            notif:Notification(title or 'Project Nexora', text or '', 'GothamBold', 'Gotham', duration, iconId, nil, 'light')
        end)

        if not ok then
            StarterGui:SetCore('SendNotification', {
                Title = title or 'Project Nexora',
                Text = text or '',
                Duration = duration,
                Icon = icon or 'rbxassetid://89804924525665',
            })
        end
    else
        StarterGui:SetCore('SendNotification', {
            Title = title or 'Eliana Hub',
            Text = text or '',
            Duration = duration,
            Icon = icon or 'rbxassetid://89804924525665',
        })
    end
end

local ThemesList = {
    'Dark',
    'Light',
    'Gray',
    'Blue',
    'Green',
    'Purple',
}
local CurrentThemeIndex = 1

if not getgenv().TransparencyEnabled then
    getgenv().TransparencyEnabled = false
end

SendNexoraNotification('Eliana Hub', 'Toggle Keybind: ( R )', 30, 'rbxassetid://89804924525665')

local MainWindow = WindUI:CreateWindow({
    Title = 'Eliana Hub',
    Icon = 'zap',
    Author = 'OP KEYLESS',
    Folder = 'Project Nexora',
    Size = UDim2.fromOffset(500, 350),
    Transparent = getgenv().TransparencyEnabled,
    Theme = 'Purple',
    Resizable = true,
    SideBarWidth = 150,
    BackgroundImageTransparency = 0.8,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {
        Enabled = false,
        Anonymous = false,
        Callback = function()
            CurrentThemeIndex = CurrentThemeIndex + 1

            if CurrentThemeIndex > #ThemesList then
                CurrentThemeIndex = 1
            end

            local NewTheme = ThemesList[CurrentThemeIndex]

            WindUI:SetTheme(NewTheme)
            WindUI:Notify({
                Title = 'Theme Changed',
                Content = 'Switched to ' .. NewTheme .. ' theme!',
                Duration = 2,
                Icon = 'palette',
            })
        end,
    },
})

getgenv().TransparencyEnabled = true

pcall(function()
    MainWindow:ToggleTransparency(true)
end)

function getMap()
    for _, Child in ipairs(Workspace:GetChildren())do
        if Child:FindFirstChild('CoinContainer') and Child:FindFirstChild('Spawns') then
            return Child
        end
    end

    return nil
end

loadstring(game:HttpGet('https://pastefy.app/hcVkWhQF/raw'))()
MainWindow:EditOpenButton({
    Title = 'Eliana Hub',
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(255, 255, 255)),
    Draggable = true,
})

MainWindow.ToggleKey = Enum.KeyCode.R

local Tabs = {}

Tabs.Main = MainWindow:Tab({
    Title = 'Main',
    Icon = 'eye',
    Desc = 'Eliana Hub',
})
Tabs.Misc = MainWindow:Tab({
    Title = 'Misc',
    Icon = 'sparkles',
    Desc = 'Eliana Hub',
})
Tabs.ESP = MainWindow:Tab({
    Title = 'ESP',
    Icon = 'eye',
    Desc = 'Eliana Hub',
})
Tabs.Farm = MainWindow:Tab({
    Title = 'Farm',
    Icon = 'wrench',
    Desc = 'Eliana Hub',
})
Tabs.Place = MainWindow:Tab({
    Title = 'Teleport',
    Icon = 'map',
    Desc = 'Eliana Hub',
})
Tabs.Fling = MainWindow:Tab({
    Title = 'Fling',
    Icon = 'user',
    Desc = 'Eliana Hub',
})
Tabs.Info = MainWindow:Tab({
    Title = 'Information',
    Icon = 'badge-info',
    Desc = 'Eliana Hub',
})
Tabs.Manager = MainWindow:Tab({
    Title = 'Quick Buttons',
    Icon = 'solar:widget-bold',
    Desc = 'Eliana Hub',
})

MainWindow:SelectTab(7)

local SAVE_FILE = 'ZCNathan_Layout_V31.json'
local CreatedButtons = {}
local EditMode = false
local SelectedButton = nil
local MASTER_VIOLET = Color3.fromRGB(138, 43, 226)
local screenGui = Instance.new('ScreenGui')

screenGui.Name = 'ZCNathan_SelectionGui'
screenGui.ResetOnSpawn = false
screenGui.Parent = cloneref(LocalPlayer:WaitForChild('PlayerGui'))

local EditLabel = Instance.new('TextLabel')

EditLabel.Name = 'EditStatusLabel'
EditLabel.Size = UDim2.new(0, 500, 0, 50)
EditLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
EditLabel.AnchorPoint = Vector2.new(0.5, 0.5)
EditLabel.BackgroundTransparency = 1
EditLabel.Visible = false
EditLabel.Font = Enum.Font.GothamBold
EditLabel.TextColor3 = MASTER_VIOLET
EditLabel.TextSize = 22
EditLabel.TextStrokeTransparency = 0.5
EditLabel.Parent = screenGui

local function UpdateEditLabel()
    if EditMode and SelectedButton then
        EditLabel.Text = string.format('EDITING: %s', string.upper(SelectedButton.Name))
        EditLabel.Visible = true
    else
        EditLabel.Visible = false
    end
end
local function makeDraggable(gui)
    local dragging, dragInput, dragStart, startPos

    gui.InputBegan:Connect(function(input)
        if not EditMode then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if SelectedButton and SelectedButton ~= gui then
                SelectedButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            end

            SelectedButton = gui
            gui.BackgroundColor3 = MASTER_VIOLET

            UpdateEditLabel()

            dragging = true
            dragStart = input.Position
            startPos = gui.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if not EditMode then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart

            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end
local function SaveConfig()
    local fullData = {}

    for _, btn in ipairs(CreatedButtons)do
        local corner = btn.UICorner.CornerRadius

        fullData[btn.Name] = {
            PosX_Scale = btn.Position.X.Scale,
            PosX_Offset = btn.Position.X.Offset,
            PosY_Scale = btn.Position.Y.Scale,
            PosY_Offset = btn.Position.Y.Offset,
            SizeX = btn.Size.X.Offset,
            SizeY = btn.Size.Y.Offset,
            Transparency = btn.BackgroundTransparency,
            CornerScale = corner.Scale,
            CornerOffset = corner.Offset,
        }
    end

    writefile(SAVE_FILE, HttpService:JSONEncode(fullData))
    WindUI:Notify({
        Title = 'Saved',
        Content = 'Layout saved!',
        Icon = 'check',
    })
end
local function LoadConfig()
    if isfile(SAVE_FILE) then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile(SAVE_FILE))
        end)

        if success then
            for _, btn in ipairs(CreatedButtons)do
                if data[btn.Name] then
                    local d = data[btn.Name]

                    btn.Position = UDim2.new(d.PosX_Scale, d.PosX_Offset, d.PosY_Scale, d.PosY_Offset)
                    btn.Size = UDim2.fromOffset(d.SizeX, d.SizeY)
                    btn.BackgroundTransparency = d.Transparency
                    btn.TextTransparency = d.Transparency
                    btn.UIStroke.Transparency = d.Transparency
                    btn.UICorner.CornerRadius = UDim.new(d.CornerScale or 1, d.CornerOffset or 0)
                end
            end
        end
    end
end
local function createShape(name, pos, text, callback)
    local btn = Instance.new('TextButton')

    btn.Name = name
    btn.Size = UDim2.fromOffset(70, 70)
    btn.Position = pos
    btn.AnchorPoint = Vector2.new(0.5, 0.5)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.BackgroundTransparency = 0.4
    btn.Visible = false
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamMedium
    btn.TextScaled = true
    btn.Parent = screenGui

    local uc = Instance.new('UICorner', btn)

    uc.CornerRadius = UDim.new(1, 0)

    local st = Instance.new('UIStroke', btn)

    st.Thickness = 3
    st.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    st.Color = Color3.fromRGB(255, 255, 255)

    local gradient = Instance.new('UIGradient', st)

    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, MASTER_VIOLET),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, MASTER_VIOLET),
    })

    RunService.RenderStepped:Connect(function(dt)
        gradient.Rotation = (gradient.Rotation + (180 * dt)) % 360
    end)
    btn.MouseButton1Click:Connect(function()
        if not EditMode then
            callback()
        end
    end)
    makeDraggable(btn)
    table.insert(CreatedButtons, btn)

    return btn
end

createShape('Shoot_Btn', UDim2.new(0.4, 0, 0.4, 0), 'SHOOT', function()
    local Character = LocalPlayer.Character
    local Backpack = LocalPlayer:FindFirstChild('Backpack')

    if not Character or not Backpack then
        return
    end

    local Gun = Backpack:FindFirstChild('Gun') or Character:FindFirstChild('Gun')

    if not Gun then
        return
    end

    local Murderer = nil

    for _, plr in ipairs(Players:GetPlayers())do
        if plr ~= LocalPlayer and plr.Character then
            if plr.Backpack:FindFirstChild('Knife') or plr.Character:FindFirstChild('Knife') then
                Murderer = plr

                break
            end
        end
    end

    if not Murderer or not Murderer.Character then
        return
    end

    local MyRoot = Character:FindFirstChild('HumanoidRootPart')
    local TargetRoot = Murderer.Character:FindFirstChild('HumanoidRootPart')
    local ShootRemote = Gun:FindFirstChild('Shoot')

    if not (MyRoot and TargetRoot and ShootRemote) then
        return
    end

    Gun.Parent = Character

    task.wait()

    local PredictedPos = TargetRoot.CFrame + (TargetRoot.Velocity * 0.125)

    ShootRemote:FireServer(MyRoot.CFrame, PredictedPos)
    task.wait()

    Gun.Parent = Backpack
end)

local AimbotActive = false
local AimbotConnection = nil
local PredictionFactor = 0.125

local function GetBestTorsoTarget()
    local target = nil
    local shortest = math.huge
    local screenCenter = Camera.ViewportSize / 2

    for _, player in ipairs(Players:GetPlayers())do
        if player ~= LocalPlayer and player.Character then
            local torso = player.Character:FindFirstChild('UpperTorso') or player.Character:FindFirstChild('HumanoidRootPart')

            if torso then
                local pos, onScreen = Camera:WorldToViewportPoint(torso.Position)

                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude

                    if dist < shortest then
                        shortest = dist
                        target = torso
                    end
                end
            end
        end
    end

    return target
end
local function StartAimbot()
    if AimbotConnection then
        AimbotConnection:Disconnect()
    end

    AimbotConnection = RunService.RenderStepped:Connect(function()
        if not AimbotActive then
            return
        end

        local target = GetBestTorsoTarget()

        if target then
            local velocity = target.AssemblyLinearVelocity or target.Velocity
            local predictedPos = target.Position + (velocity * PredictionFactor)

            Camera.CFrame = CFrame.new(Camera.CFrame.Position, predictedPos)
        end
    end)
end

local XRayEnabled = false

createShape('Aim_Btn', UDim2.new(0.5, 0, 0.85, 0), 'AIM', function()
    AimbotActive = not AimbotActive

    if AimbotActive then
        StartAimbot()
        WindUI:Notify({
            Title = 'AIMBOT',
            Content = 'Enabled',
            Icon = 'target',
        })
    else
        if AimbotConnection then
            AimbotConnection:Disconnect()

            AimbotConnection = nil
        end

        WindUI:Notify({
            Title = 'AIMBOT',
            Content = 'Disabled',
            Icon = 'target',
        })
    end
end)
createShape('Run_Btn', UDim2.new(0.5, 0, 0.7, 0), 'RUN', function()
    local character = LocalPlayer.Character

    if character and character:FindFirstChild('Humanoid') then
        local humanoid = character.Humanoid

        humanoid.WalkSpeed = humanoid.WalkSpeed + 9

        WindUI:Notify({
            Title = 'RUN',
            Content = 'Speed Activated',
            Icon = 'run',
        })
        task.delay(5, function()
            if humanoid and humanoid.Parent then
                humanoid.WalkSpeed = humanoid.WalkSpeed - 9

                WindUI:Notify({
                    Title = 'RUN',
                    Content = 'Speed reverted',
                    Icon = 'run',
                })
            end
        end)
    end
end)

do
    local NinjaEnabled = false
    local NinjaCooldown = 22
    local NinjaOnCooldown = false
    local NinjaAirLock = false

    local function getTool(char)
        return char:FindFirstChild('FakeBomb') or LocalPlayer.Backpack:FindFirstChild('FakeBomb')
    end
    local function dropBombAndBounce(char)
        if NinjaOnCooldown then
            return
        end

        local hum = char:FindFirstChild('Humanoid')
        local hrp = char:FindFirstChild('HumanoidRootPart')
        local tool = getTool(char)

        if not (hum and hrp and tool) then
            return
        end
        if tool.Parent ~= char then
            tool.Parent = char
        end

        task.wait(0.05)

        local rem = tool:FindFirstChild('Remote')

        if rem then
            local down = CFrame.lookAt(hrp.Position, hrp.Position - Vector3.new(0, 50, 0))

            rem:FireServer(down, 50)
            hum:ChangeState(Enum.HumanoidStateType.Jumping)

            NinjaOnCooldown = true

            task.delay(NinjaCooldown, function()
                NinjaOnCooldown = false
            end)
        end
    end
    local function setupNinja(char)
        local hum = char:WaitForChild('Humanoid')
        local hrp = char:WaitForChild('HumanoidRootPart')

        RunService.Heartbeat:Connect(function()
            if not NinjaEnabled or NinjaOnCooldown then
                return
            end
            if hum.FloorMaterial == Enum.Material.Air then
                if hrp.AssemblyLinearVelocity.Y < -2 then
                    if not NinjaAirLock then
                        NinjaAirLock = true

                        dropBombAndBounce(char)
                    end
                end
            else
                NinjaAirLock = false
            end
        end)
    end

    if LocalPlayer.Character then
        task.spawn(setupNinja, LocalPlayer.Character)
    end

    LocalPlayer.CharacterAdded:Connect(function(c)
        task.spawn(setupNinja, c)
    end)
    createShape('NinjaStep_Btn', UDim2.new(0.5, 0, 0.5, 0), 'NINJA: OFF', function()
        NinjaEnabled = not NinjaEnabled

        for _, b in ipairs(CreatedButtons)do
            if b.Name == 'NinjaStep_Btn' then
                b.Text = NinjaEnabled and 'NINJA: ON' or 'NINJA: OFF'

                break
            end
        end

        WindUI:Notify({
            Title = 'Ninja Step',
            Content = NinjaEnabled and 'Active' or 'Inactive',
            Duration = 2,
        })
    end)
end

createShape('GodMode_Btn', UDim2.new(0.6, 0, 0.7, 0), 'GOD MODE', function()
    loadstring(game:HttpGet('https://pastefy.app/FHl36Zg1/raw'))('true')
end)
createShape('KillAll_Btn', UDim2.new(0.6, 0, 0.3, 0), 'KILL ALL', function()
    local character = LocalPlayer.Character
    local backpack = LocalPlayer:FindFirstChild('Backpack')

    if not character or not backpack then
        return
    end

    local knife = character:FindFirstChild('Knife') or backpack:FindFirstChild('Knife')

    if not knife then
        WindUI:Notify({
            Title = 'Kill All',
            Content = 'You are not the Murderer',
            Icon = 'x',
        })

        return
    end

    local myRoot = character:FindFirstChild('HumanoidRootPart')
    local humanoid = character:FindFirstChild('Humanoid')

    if not (myRoot and humanoid) then
        return
    end
    if knife.Parent == backpack then
        humanoid:EquipTool(knife)
        task.wait()
    end

    for _, plr in ipairs(Players:GetPlayers())do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') then
            local enemyRoot = plr.Character.HumanoidRootPart

            enemyRoot.Anchored = true
            enemyRoot.CFrame = myRoot.CFrame * CFrame.new(0, 0, -2)
        end
    end

    local stab = knife:FindFirstChild('Stab')

    if stab then
        stab:FireServer('Slash')
    end

    task.wait(0.1)

    for _, plr in ipairs(Players:GetPlayers())do
        if plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') then
            plr.Character.HumanoidRootPart.Anchored = false
        end
    end

    if knife.Parent == character then
        knife.Parent = backpack
    end
end)

local InvisibleActive = false
local Character, Humanoid, HumanoidRoot = nil, nil, nil
local PartsList = {}

local function UpdateCharacter()
    Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    Humanoid = Character:WaitForChild('Humanoid')
    HumanoidRoot = Character:WaitForChild('HumanoidRootPart')
    PartsList = {}

    for _, part in ipairs(Character:GetDescendants())do
        if part:IsA('BasePart') and part.Transparency == 0 then
            table.insert(PartsList, part)
        end
    end
end
local function ToggleInvisibility()
    InvisibleActive = not InvisibleActive

    for _, part in ipairs(PartsList)do
        part.Transparency = InvisibleActive and 0.5 or 0
    end
end

RunService.Heartbeat:Connect(function()
    if InvisibleActive and HumanoidRoot and Humanoid then
        local originalCFrame = HumanoidRoot.CFrame
        local originalOffset = Humanoid.CameraOffset
        local downCFrame = originalCFrame * CFrame.new(0, -2E5, 0)

        HumanoidRoot.CFrame = downCFrame
        Humanoid.CameraOffset = (downCFrame:ToObjectSpace(originalCFrame)).Position

        RunService.RenderStepped:Wait()

        HumanoidRoot.CFrame = originalCFrame
        Humanoid.CameraOffset = originalOffset
    end
end)
LocalPlayer.CharacterAdded:Connect(function()
    InvisibleActive = false

    UpdateCharacter()
end)
UpdateCharacter()
createShape('Invisible_Btn', UDim2.new(0.5, 0, 0.75, 0), 'INVISIBLE', ToggleInvisibility)

local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

local function GetGunNow()
    local character = LocalPlayer.Character

    if not character then
        return
    end

    local touchPart = character:FindFirstChild('LeftFoot') or character:FindFirstChild('Left Leg') or character:FindFirstChild('HumanoidRootPart')

    if not touchPart then
        return
    end

    local found = false

    for _, v in ipairs(workspace:GetDescendants())do
        if v.Name == 'GunDrop' then
            firetouchinterest(touchPart, v, 0)
            task.wait()
            firetouchinterest(touchPart, v, 1)

            found = true

            break
        end
    end

    if found then
        WindUI:Notify({
            Title = 'GUN',
            Content = 'Gun acquired',
            Icon = 'check',
        })
    else
        WindUI:Notify({
            Title = 'GUN',
            Content = 'No gun found',
            Icon = 'x',
        })
    end
end

createShape('Gun_Btn', UDim2.new(0.5, 0, 0.65, 0), 'GET GUN', GetGunNow)
Tabs.Manager:Section({
    Title = 'Main Controls',
})
Tabs.Manager:Toggle({
    Title = 'Enable All Buttons',
    Value = false,
    Callback = function(v)
        for _, btn in ipairs(CreatedButtons)do
            btn.Visible = v
        end
    end,
})
Tabs.Manager:Section({
    Title = 'Edit Controls',
})
Tabs.Manager:Button({
    Title = 'Edit Layout',
    Callback = function()
        EditMode = not EditMode

        if not EditMode and SelectedButton then
            SelectedButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            SelectedButton = nil
        end

        UpdateEditLabel()
    end,
})
Tabs.Manager:Button({
    Title = 'Save Layout',
    Callback = SaveConfig,
})

local EditGui = Instance.new('ScreenGui')

EditGui.Name = 'MacEditWidget'
EditGui.ResetOnSpawn = false
EditGui.DisplayOrder = 100
EditGui.Parent = cloneref(LocalPlayer:WaitForChild('PlayerGui'))

local MainFrame = Instance.new('Frame')

MainFrame.Name = 'MainFrame'
MainFrame.Size = UDim2.new(0, 240, 0, 245)
MainFrame.Position = UDim2.new(0.5, -120, 0.5, -122)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Active = true
MainFrame.Visible = false
MainFrame.Parent = EditGui
Instance.new('UICorner', MainFrame).CornerRadius = UDim.new(0, 12)

local Header = Instance.new('Frame')

Header.Size = UDim2.new(1, 0, 0, 30)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local draggingWidget, dragStart, startPos

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingWidget = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if draggingWidget and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart

        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingWidget = false
    end
end)

local Content = Instance.new('Frame')

Content.Size = UDim2.new(1, 0, 1, -30)
Content.Position = UDim2.new(0, 0, 0, 30)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local function createLabel(text, pos, parent, size, alignment, isBold)
    local label = Instance.new('TextLabel')

    label.Text = text
    label.Size = UDim2.new(1, -24, 0, 15)
    label.Position = pos
    label.BackgroundTransparency = 1
    label.TextColor3 = isBold and Color3.fromRGB(40, 40, 40) or Color3.fromRGB(120, 120, 120)
    label.TextXAlignment = alignment or Enum.TextXAlignment.Left
    label.Font = isBold and Enum.Font.GothamBold or Enum.Font.Gotham
    label.TextSize = size or 11
    label.Parent = parent

    return label
end

createLabel('NAME', UDim2.new(0, 12, 0, 5), Content, 10, nil, true)

local NameLabel = createLabel('No Selection', UDim2.new(0, 12, 0, 18), Content, 12, nil, false)

local function createSlider(name, pos, parent, onChange, getCurrent)
    local container = Instance.new('Frame', parent)

    container.Size = UDim2.new(1, -24, 0, 35)
    container.Position = pos
    container.BackgroundTransparency = 1

    createLabel(name, UDim2.new(0, 0, 0, 0), container, 10, nil, true)

    local valLabel = createLabel('0', UDim2.new(0, 0, 0, 0), container, 10, Enum.TextXAlignment.Right, true)

    valLabel.TextColor3 = MASTER_VIOLET

    local track = Instance.new('TextButton', container)

    track.Size = UDim2.new(1, 0, 0, 4)
    track.Position = UDim2.new(0, 0, 0, 22)
    track.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    track.BorderSizePixel = 0
    track.Text = ''

    local knob = Instance.new('Frame', track)

    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new(0, 0, 0.5, 0)
    knob.BackgroundColor3 = MASTER_VIOLET
    Instance.new('UICorner', knob).CornerRadius = UDim.new(1, 0)

    local isSliding = false

    local function move(input)
        local ratio = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)

        knob.Position = UDim2.new(ratio, 0, 0.5, 0)
        valLabel.Text = tostring(math.round(ratio * 100))

        if SelectedButton then
            onChange(ratio)
        end
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isSliding = true

            move(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if isSliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            move(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isSliding = false
        end
    end)
    RunService.RenderStepped:Connect(function()
        if not isSliding and SelectedButton and getCurrent then
            local p = getCurrent()

            knob.Position = UDim2.new(p, 0, 0.5, 0)
            valLabel.Text = tostring(math.round(p * 100))
        end
    end)
end

createSlider('OPACITY', UDim2.new(0, 12, 0, 45), Content, function(p)
    SelectedButton.BackgroundTransparency = 1 - p
    SelectedButton.TextTransparency = 1 - p
    SelectedButton.UIStroke.Transparency = 1 - p
end, function()
    return 1 - SelectedButton.BackgroundTransparency
end)
createSlider('SCALE', UDim2.new(0, 12, 0, 85), Content, function(p)
    local s = 30 + (p * 220)
    local ratio = SelectedButton.Size.Y.Offset / SelectedButton.Size.X.Offset

    SelectedButton.Size = UDim2.fromOffset(s, s * ratio)
end, function()
    return (SelectedButton.Size.X.Offset - 30) / 220
end)
createLabel('SHAPE', UDim2.new(0, 12, 0, 130), Content, 10, nil, true)

local ShapeBtn = Instance.new('TextButton', Content)

ShapeBtn.Size = UDim2.new(1, -24, 0, 26)
ShapeBtn.Position = UDim2.new(0, 12, 0, 148)
ShapeBtn.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
ShapeBtn.Text = '  Select Shape...'
ShapeBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
ShapeBtn.TextXAlignment = Enum.TextXAlignment.Left
ShapeBtn.Font = Enum.Font.Gotham
Instance.new('UICorner', ShapeBtn).CornerRadius = UDim.new(0, 6)

local Dropdown = Instance.new('ScrollingFrame', ShapeBtn)

Dropdown.Size = UDim2.new(1, 0, 0, 0)
Dropdown.Position = UDim2.new(0, 0, 1, 5)
Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dropdown.BorderSizePixel = 0
Dropdown.ZIndex = 500
Dropdown.Visible = false
Instance.new('UICorner', Dropdown).CornerRadius = UDim.new(0, 6)
Instance.new('UIStroke', Dropdown).Transparency = 0.8

local shapeConfigs = {
    Circle = {
        corner = UDim.new(1, 0),
        forceSquare = true,
    },
    Square = {
        corner = UDim.new(0, 0),
        forceSquare = true,
    },
    ['Rounded Rectangle'] = {
        corner = UDim.new(0, 12),
        forceSquare = false,
    },
    Capsule = {
        corner = UDim.new(1, 0),
        forceSquare = false,
    },
    ['Sharp Rectangle'] = {
        corner = UDim.new(0, 0),
        forceSquare = false,
    },
}
local shapes = {
    'Circle',
    'Square',
    'Rounded Rectangle',
    'Capsule',
    'Sharp Rectangle',
}

for i, sName in ipairs(shapes)do
    local b = Instance.new('TextButton', Dropdown)

    b.Size = UDim2.new(1, 0, 0, 25)
    b.Position = UDim2.new(0, 0, 0, (i - 1) * 25)
    b.BackgroundTransparency = 1
    b.Text = '  ' .. sName
    b.TextColor3 = Color3.fromRGB(80, 80, 80)
    b.Font = Enum.Font.Gotham
    b.TextSize = 10
    b.TextXAlignment = Enum.TextXAlignment.Left
    b.ZIndex = 501

    b.MouseButton1Click:Connect(function()
        if SelectedButton then
            local cfg = shapeConfigs[sName]
            local w = SelectedButton.Size.X.Offset

            SelectedButton.Size = UDim2.fromOffset(w, cfg.forceSquare and w or w * 0.6)
            SelectedButton.UICorner.CornerRadius = cfg.corner
            ShapeBtn.Text = '  ' .. sName
            Dropdown.Visible = false
            Dropdown.Size = UDim2.new(1, 0, 0, 0)
        end
    end)
end

ShapeBtn.MouseButton1Click:Connect(function()
    Dropdown.Visible = not Dropdown.Visible
    Dropdown.Size = Dropdown.Visible and UDim2.new(1, 0, 0, 125) or UDim2.new(1, 0, 0, 0)
end)

local ResetBtn = Instance.new('TextButton', Content)

ResetBtn.Size = UDim2.new(0, 65, 0, 26)
ResetBtn.Position = UDim2.new(0, 12, 1, -35)
ResetBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ResetBtn.Text = 'Reset'
ResetBtn.Font = Enum.Font.GothamBold
Instance.new('UICorner', ResetBtn).CornerRadius = UDim.new(0, 6)

local ExitBtn = Instance.new('TextButton', Content)

ExitBtn.Size = UDim2.new(0, 65, 0, 26)
ExitBtn.Position = UDim2.new(0.5, -32, 1, -35)
ExitBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
ExitBtn.Text = 'EXIT'
ExitBtn.TextColor3 = Color3.new(1, 1, 1)
ExitBtn.Font = Enum.Font.GothamBold
Instance.new('UICorner', ExitBtn).CornerRadius = UDim.new(0, 6)

local SaveBtn = Instance.new('TextButton', Content)

SaveBtn.Size = UDim2.new(0, 65, 0, 26)
SaveBtn.Position = UDim2.new(1, -77, 1, -35)
SaveBtn.BackgroundColor3 = MASTER_VIOLET
SaveBtn.Text = 'Save'
SaveBtn.TextColor3 = Color3.new(1, 1, 1)
SaveBtn.Font = Enum.Font.GothamBold
Instance.new('UICorner', SaveBtn).CornerRadius = UDim.new(0, 6)

ResetBtn.MouseButton1Click:Connect(function()
    if SelectedButton then
        SelectedButton.Size = UDim2.fromOffset(70, 70)
        SelectedButton.BackgroundTransparency = 0.4
        SelectedButton.UICorner.CornerRadius = UDim.new(1, 0)
    end
end)
ExitBtn.MouseButton1Click:Connect(function()
    EditMode = false
    MainFrame.Visible = false

    if SelectedButton then
        SelectedButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    end

    SelectedButton = nil

    UpdateEditLabel()
end)
SaveBtn.MouseButton1Click:Connect(SaveConfig)
RunService.Heartbeat:Connect(function()
    MainFrame.Visible = EditMode and SelectedButton ~= nil

    if SelectedButton then
        NameLabel.Text = SelectedButton.Name
    end
end)
LoadConfig()
Tabs.Main:Section({
    Title = 'Player',
    Icon = 'player',
})

local FOVSection = Tabs.Main:Section({
    Title = 'Field of View',
})
local FOVSlider = Tabs.Main:Slider({
    Title = 'FOV',
    Step = 1,
    Value = {
        Min = 30,
        Max = 120,
        Default = 70,
    },
    Callback = function(Value)
        game:GetService('Workspace').CurrentCamera.FieldOfView = Value
    end,
})

Tabs.Main:Button({
    Title = 'Reset FOV to Default',
    Icon = 'refresh-cw',
    Callback = function()
        FOVSlider:Set(70)

        game:GetService('Workspace').CurrentCamera.FieldOfView = 70

        WindUI:Notify({
            Title = 'Camera',
            Content = 'FOV Reset to 70',
            Duration = 2,
        })
    end,
})
Tabs.Main:Section({
    Title = 'Murder',
    Icon = 'sword',
})
Tabs.Main:Button({
    Title = 'Kill All (hold knife)',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/2eOpHYrg/raw'))('true')
    end,
})
Tabs.Main:Button({
    Title = 'Kill Sheriff (hold knife)',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/YBXds1as/raw'))('true')
    end,
})
Tabs.Main:Button({
    Title = 'Kill Innocents (hold knife)',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/vmG5vtCc/raw'))('true')
    end,
})

local HitboxSettings = {
    Hitbox = {
        Enabled = false,
        Size = 5,
        Color = Color3.new(1, 0, 0),
        Adornments = {},
        Connection = nil,
    },
}

local function UpdateHitboxes()
    if HitboxSettings.Hitbox.Enabled then
        for _, Player in pairs(Players:GetPlayers())do
            if Player ~= LocalPlayer then
                local Character = Player.Character
                local Adornment = HitboxSettings.Hitbox.Adornments[Player]

                if Character and HitboxSettings.Hitbox.Enabled then
                    local RootPart = Character:FindFirstChild('HumanoidRootPart')

                    if RootPart then
                        if Adornment then
                            Adornment.Size = Vector3.new(HitboxSettings.Hitbox.Size, HitboxSettings.Hitbox.Size, HitboxSettings.Hitbox.Size)
                            Adornment.Color3 = HitboxSettings.Hitbox.Color
                        else
                            local NewAdornment = Instance.new('BoxHandleAdornment')

                            NewAdornment.Adornee = RootPart
                            NewAdornment.Size = Vector3.new(HitboxSettings.Hitbox.Size, HitboxSettings.Hitbox.Size, HitboxSettings.Hitbox.Size)
                            NewAdornment.Color3 = HitboxSettings.Hitbox.Color
                            NewAdornment.Transparency = 0.4
                            NewAdornment.ZIndex = 10
                            NewAdornment.Parent = RootPart
                            HitboxSettings.Hitbox.Adornments[Player] = NewAdornment
                        end
                    end
                elseif Adornment then
                    Adornment:Destroy()

                    HitboxSettings.Hitbox.Adornments[Player] = nil
                end
            end
        end
    end
end

Tabs.Main:Toggle({
    Title = 'Hitboxes',
    Callback = function(State)
        HitboxSettings.Hitbox.Enabled = State

        if State then
            if not HitboxSettings.Hitbox.Connection then
                HitboxSettings.Hitbox.Connection = RunService.Heartbeat:Connect(UpdateHitboxes)
            end
        else
            if HitboxSettings.Hitbox.Connection then
                HitboxSettings.Hitbox.Connection:Disconnect()

                HitboxSettings.Hitbox.Connection = nil
            end

            for _, Adornment in pairs(HitboxSettings.Hitbox.Adornments)do
                if Adornment then
                    Adornment:Destroy()
                end
            end

            HitboxSettings.Hitbox.Adornments = {}
        end
    end,
})
Tabs.Main:Slider({
    Title = 'Hitbox size',
    Value = {
        Min = 1,
        Max = 20,
        Default = 5,
    },
    Callback = function(Value)
        HitboxSettings.Hitbox.Size = Value
    end,
})
Tabs.Main:Colorpicker({
    Title = 'Hitbox color',
    Default = Color3.new(1, 0, 0),
    Callback = function(Color)
        HitboxSettings.Hitbox.Color = Color
    end,
})
Tabs.Main:Section({
    Title = 'Sheriff',
    Icon = 'heart',
})
Tabs.Main:Button({
    Title = 'Shoot Murderer',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/IeVSJS2e/raw'))('true')
    end,
})

local AimbotMasterToggle = false
local AimbotActive = false
local AimbotConnection = nil
local CurrentTarget = nil
local screenGui = nil

local function GetClosestPlayerToCursor()
    local Target = nil
    local ShortestDistance = math.huge
    local MousePos = Camera.ViewportSize / 2

    for _, Player in ipairs(Players:GetPlayers())do
        if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild('HumanoidRootPart') then
            local RootPart = Player.Character.HumanoidRootPart
            local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)

            if OnScreen then
                local Distance = (Vector2.new(Pos.X, Pos.Y) - MousePos).Magnitude

                if Distance < ShortestDistance then
                    Target = Player
                    ShortestDistance = Distance
                end
            end
        end
    end

    return Target
end
local function StartAimbot()
    if AimbotConnection then
        AimbotConnection:Disconnect()
    end

    AimbotConnection = RunService.RenderStepped:Connect(function()
        if AimbotMasterToggle and AimbotActive and CurrentTarget and CurrentTarget.Character and CurrentTarget.Character:FindFirstChild('Head') then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, CurrentTarget.Character.Head.Position)
        elseif AimbotActive and not CurrentTarget then
            CurrentTarget = GetClosestPlayerToCursor()
        end
    end)
end

Tabs.Main:Toggle({
    Title = 'Camera Hard-Lock GUI',
    Value = false,
    Callback = function(State)
        AimbotMasterToggle = State

        if State then
            local PlayerGui = LocalPlayer:WaitForChild('PlayerGui')

            screenGui = Instance.new('ScreenGui')
            screenGui.Name = 'CustomJumpGui'
            screenGui.ResetOnSpawn = false
            screenGui.Parent = PlayerGui

            local VERTICAL_OFFSET = 0.1
            local jumpButton = Instance.new('TextButton')

            jumpButton.Name = 'JumpButton'
            jumpButton.Size = UDim2.new(0, 90, 0, 90)
            jumpButton.AnchorPoint = Vector2.new(1, 0.5)
            jumpButton.Position = UDim2.new(1, -10, VERTICAL_OFFSET, 0)
            jumpButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            jumpButton.BackgroundTransparency = 0.5
            jumpButton.Text = ''
            jumpButton.AutoButtonColor = true
            jumpButton.Parent = screenGui

            local uiCorner = Instance.new('UICorner')

            uiCorner.CornerRadius = UDim.new(1, 0)
            uiCorner.Parent = jumpButton

            local insetStrokeFrame = Instance.new('Frame')

            insetStrokeFrame.Name = 'InsetStroke'
            insetStrokeFrame.Size = UDim2.new(0.9, 0, 0.9, 0)
            insetStrokeFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            insetStrokeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            insetStrokeFrame.BackgroundTransparency = 1
            insetStrokeFrame.Parent = jumpButton

            local insetCorner = Instance.new('UICorner')

            insetCorner.CornerRadius = UDim.new(1, 0)
            insetCorner.Parent = insetStrokeFrame

            local uiStroke = Instance.new('UIStroke')

            uiStroke.Thickness = 2
            uiStroke.Color = Color3.fromRGB(255, 255, 255)
            uiStroke.Transparency = 0.5
            uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            uiStroke.Parent = insetStrokeFrame

            local arrowIcon = Instance.new('ImageLabel')

            arrowIcon.Name = 'ArrowIcon'
            arrowIcon.Size = UDim2.new(0.7, 0, 0.7, 0)
            arrowIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
            arrowIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            arrowIcon.BackgroundTransparency = 1
            arrowIcon.Image = 'rbxassetid://17544521115'
            arrowIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            arrowIcon.ImageTransparency = 0.5
            arrowIcon.Parent = jumpButton

            jumpButton.MouseButton1Click:Connect(function()
                AimbotActive = not AimbotActive

                if AimbotActive then
                    CurrentTarget = GetClosestPlayerToCursor()
                    arrowIcon.ImageColor3 = Color3.fromRGB(255, 0, 0)

                    SendNexoraNotification('Aimbot', 'Locked On', 2)

                    if not AimbotConnection then
                        StartAimbot()
                    end
                else
                    CurrentTarget = nil
                    arrowIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                end
            end)
        else
            AimbotActive = false
            CurrentTarget = nil

            if screenGui then
                screenGui:Destroy()

                screenGui = nil
            end
            if AimbotConnection then
                AimbotConnection:Disconnect()

                AimbotConnection = nil
            end
        end
    end,
})

local _G = _G or {}

_G.GunAimbotArgs = nil

local GunAimbotEnabled = false
local GunAimbotConnection = nil
local InputConnection = nil
local TouchConnection = nil

local function FireAtMurderer()
    if not GunAimbotEnabled or not _G.GunAimbotArgs then
        return
    end

    local Character = LocalPlayer.Character
    local Gun = Character and Character:FindFirstChild('Gun')
    local ShootRemote = Gun and Gun:FindFirstChild('Shoot')

    if ShootRemote then
        ShootRemote:FireServer(unpack(_G.GunAimbotArgs))
    end
end

Tabs.Main:Toggle({
    Title = 'Gun Aimbot (Auto-Target Murderer)',
    Value = false,
    Callback = function(State)
        GunAimbotEnabled = State

        if GunAimbotConnection then
            GunAimbotConnection:Disconnect()
        end
        if InputConnection then
            InputConnection:Disconnect()
        end
        if TouchConnection then
            TouchConnection:Disconnect()
        end
        if State then
            GunAimbotConnection = RunService.RenderStepped:Connect(function()
                local TargetPlayer = nil

                for _, Player in ipairs(Players:GetPlayers())do
                    if Player ~= LocalPlayer then
                        local Backpack = Player:FindFirstChild('Backpack')
                        local Char = Player.Character

                        if (Backpack and Backpack:FindFirstChild('Knife')) or (Char and Char:FindFirstChild('Knife')) then
                            TargetPlayer = Player

                            break
                        end
                    end
                end

                if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild('HumanoidRootPart') then
                    local MyRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
                    local TargetRoot = TargetPlayer.Character.HumanoidRootPart

                    if MyRoot then
                        local PredictedPos = TargetRoot.CFrame + (TargetRoot.Velocity * 0.125)

                        _G.GunAimbotArgs = {
                            MyRoot.CFrame,
                            PredictedPos,
                        }
                    end
                else
                    _G.GunAimbotArgs = nil
                end
            end)
            InputConnection = UserInputService.InputBegan:Connect(function(Input, Processed)
                if not Processed and Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    FireAtMurderer()
                end
            end)
            TouchConnection = UserInputService.TouchTap:Connect(function()
                FireAtMurderer()
            end)
        else
            _G.GunAimbotArgs = nil
        end
    end,
})

local AutoShootEnabled = false
local currentScreenGui = nil
local inventoryCheckConnection = nil
local hasNotifiedSuccess = false
local hasNotifiedFailure = false

local function Notify(title, text)
    SendNexoraNotification(title, text, 3)
end
local function GetMurderer()
    for _, Player in ipairs(Players:GetPlayers())do
        if Player ~= LocalPlayer and Player.Character then
            local Knife = Player.Backpack:FindFirstChild('Knife') or Player.Character:FindFirstChild('Knife')

            if Knife then
                return Player
            end
        end
    end

    return nil
end
local function InstantShootSequence()
    local Character = LocalPlayer.Character
    local Backpack = LocalPlayer:FindFirstChild('Backpack')

    if not Character or not Backpack then
        return
    end

    local Gun = Backpack:FindFirstChild('Gun') or Character:FindFirstChild('Gun')

    if Gun then
        Gun.Parent = Character

        task.wait()

        local ShootRemote = Gun:FindFirstChild('Shoot')
        local Murderer = GetMurderer()

        if ShootRemote and Murderer and Murderer.Character:FindFirstChild('HumanoidRootPart') then
            local TargetRoot = Murderer.Character.HumanoidRootPart
            local MyRoot = Character:FindFirstChild('HumanoidRootPart')

            if MyRoot then
                local PredictedPos = TargetRoot.CFrame + (TargetRoot.Velocity * 0.125)
                local args = {
                    MyRoot.CFrame,
                    PredictedPos,
                }

                ShootRemote:FireServer(unpack(args))
            end
        end

        task.wait()

        Gun.Parent = Backpack
    end
end
local function CreateCombatGui()
    if currentScreenGui then
        return
    end

    currentScreenGui = Instance.new('ScreenGui')
    currentScreenGui.Name = 'CustomJumpGui'
    currentScreenGui.ResetOnSpawn = false
    currentScreenGui.Parent = LocalPlayer:WaitForChild('PlayerGui')

    local jumpButton = Instance.new('TextButton')

    jumpButton.Name = 'JumpButton'
    jumpButton.Size = UDim2.new(0, 90, 0, 90)
    jumpButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    jumpButton.BackgroundTransparency = 0.5
    jumpButton.Text = ''
    jumpButton.AutoButtonColor = true
    jumpButton.Parent = currentScreenGui

    local function alignToMobile()
        local touchGui = LocalPlayer.PlayerGui:FindFirstChild('TouchGui')

        if touchGui then
            local controlFrame = touchGui:FindFirstChild('TouchControlFrame')
            local jumpControl = controlFrame and controlFrame:FindFirstChild('JumpButton')

            if jumpControl then
                jumpButton.Position = UDim2.new(jumpControl.Position.X.Scale, jumpControl.Position.X.Offset - 110, jumpControl.Position.Y.Scale, jumpControl.Position.Y.Offset - 110)
            end
        else
            jumpButton.Position = UDim2.new(0.85, 0, 0.7, 0)
        end
    end

    alignToMobile()

    local uiCorner = Instance.new('UICorner')

    uiCorner.CornerRadius = UDim.new(1, 0)
    uiCorner.Parent = jumpButton

    local insetStrokeFrame = Instance.new('Frame')

    insetStrokeFrame.Name = 'InsetStroke'
    insetStrokeFrame.Size = UDim2.new(0.9, 0, 0.9, 0)
    insetStrokeFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    insetStrokeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    insetStrokeFrame.BackgroundTransparency = 1
    insetStrokeFrame.Parent = jumpButton

    local insetCorner = Instance.new('UICorner')

    insetCorner.CornerRadius = UDim.new(1, 0)
    insetCorner.Parent = insetStrokeFrame

    local uiStroke = Instance.new('UIStroke')

    uiStroke.Thickness = 2
    uiStroke.Color = Color3.fromRGB(255, 255, 255)
    uiStroke.Transparency = 0.5
    uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uiStroke.Parent = insetStrokeFrame

    local arrowIcon = Instance.new('ImageLabel')

    arrowIcon.Name = 'ArrowIcon'
    arrowIcon.Size = UDim2.new(0.7, 0, 0.7, 0)
    arrowIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    arrowIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    arrowIcon.BackgroundTransparency = 1
    arrowIcon.Image = 'rbxassetid://139650104834071'
    arrowIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    arrowIcon.ImageTransparency = 0.5
    arrowIcon.Parent = jumpButton

    jumpButton.MouseButton1Click:Connect(function()
        InstantShootSequence()
    end)
end

Tabs.Main:Toggle({
    Title = 'Flick Shot Gui',
    Value = false,
    Callback = function(State)
        AutoShootEnabled = State
        hasNotifiedSuccess = false
        hasNotifiedFailure = false

        if State then
            inventoryCheckConnection = RunService.Heartbeat:Connect(function()
                if not AutoShootEnabled then
                    return
                end

                local Backpack = LocalPlayer:FindFirstChild('Backpack')
                local Character = LocalPlayer.Character
                local Gun = (Backpack and Backpack:FindFirstChild('Gun')) or (Character and Character:FindFirstChild('Gun'))

                if Gun then
                    if not currentScreenGui then
                        CreateCombatGui()

                        if not hasNotifiedSuccess then
                            Notify('Eliana Hub', 'Gun Detected: Combat Button is now visible.')

                            hasNotifiedSuccess = true
                            hasNotifiedFailure = false
                        end
                    end
                else
                    if currentScreenGui then
                        currentScreenGui:Destroy()

                        currentScreenGui = nil
                    end
                    if not hasNotifiedFailure then
                        Notify('Project Nexora', 'Gun Needed: You need a Gun to use this feature.')

                        hasNotifiedFailure = true
                        hasNotifiedSuccess = false
                    end
                end
            end)
        else
            if inventoryCheckConnection then
                inventoryCheckConnection:Disconnect()
            end
            if currentScreenGui then
                currentScreenGui:Destroy()

                currentScreenGui = nil
            end
        end
    end,
})
Tabs.Main:Toggle({
    Title = 'Mobile Murderer Button',
    Value = false,
    Callback = function(State)
        AutoShootEnabled = State

        if State then
            currentScreenGui = Instance.new('ScreenGui')
            currentScreenGui.Name = 'CustomJumpGui'
            currentScreenGui.ResetOnSpawn = false
            currentScreenGui.Parent = LocalPlayer:WaitForChild('PlayerGui')

            local jumpButton = Instance.new('TextButton')

            jumpButton.Name = 'JumpButton'
            jumpButton.Size = UDim2.new(0, 90, 0, 90)
            jumpButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            jumpButton.BackgroundTransparency = 0.5
            jumpButton.Text = ''
            jumpButton.AutoButtonColor = true
            jumpButton.Parent = currentScreenGui

            local function alignToMobile()
                local touchGui = LocalPlayer.PlayerGui:FindFirstChild('TouchGui')

                if touchGui then
                    local controlFrame = touchGui:FindFirstChild('TouchControlFrame')
                    local jumpControl = controlFrame and controlFrame:FindFirstChild('JumpButton')

                    if jumpControl then
                        jumpButton.Position = UDim2.new(jumpControl.Position.X.Scale, jumpControl.Position.X.Offset - 110, jumpControl.Position.Y.Scale, jumpControl.Position.Y.Offset - 110)
                    end
                else
                    jumpButton.Position = UDim2.new(0.85, 0, 0.7, 0)
                end
            end

            alignToMobile()

            local uiCorner = Instance.new('UICorner')

            uiCorner.CornerRadius = UDim.new(1, 0)
            uiCorner.Parent = jumpButton

            local insetStrokeFrame = Instance.new('Frame')

            insetStrokeFrame.Name = 'InsetStroke'
            insetStrokeFrame.Size = UDim2.new(0.9, 0, 0.9, 0)
            insetStrokeFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            insetStrokeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            insetStrokeFrame.BackgroundTransparency = 1
            insetStrokeFrame.Parent = jumpButton

            local insetCorner = Instance.new('UICorner')

            insetCorner.CornerRadius = UDim.new(1, 0)
            insetCorner.Parent = insetStrokeFrame

            local uiStroke = Instance.new('UIStroke')

            uiStroke.Thickness = 2
            uiStroke.Color = Color3.fromRGB(255, 255, 255)
            uiStroke.Transparency = 0.5
            uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            uiStroke.Parent = insetStrokeFrame

            local arrowIcon = Instance.new('ImageLabel')

            arrowIcon.Name = 'ArrowIcon'
            arrowIcon.Size = UDim2.new(0.7, 0, 0.7, 0)
            arrowIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
            arrowIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            arrowIcon.BackgroundTransparency = 1
            arrowIcon.Image = 'rbxassetid://139650104834071'
            arrowIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            arrowIcon.ImageTransparency = 0.5
            arrowIcon.Parent = jumpButton

            jumpButton.MouseButton1Click:Connect(function()
                InstantShootSequence()
            end)
        else
            if currentScreenGui then
                currentScreenGui:Destroy()

                currentScreenGui = nil
            end
        end
    end,
})
Tabs.Main:Section({
    Title = 'Innocent',
    Icon = 'eye',
})

local InvisAnimationId = '90878454666108'
local InvisAnimTimePos = 0.2
local InvisAnimSpeed = 0
local InvisibilityEnabled = false
local CurrentInvisAnimation = nil
local AnimationBlockConnection = nil
local HeartbeatConnection = nil
local CollisionConnection = nil

local function SetCharacterTransparency(Character, Transparency)
    if Character then
        local BodyParts = {
            'Head',
            'UpperTorso',
            'LowerTorso',
            'LeftUpperArm',
            'LeftLowerArm',
            'LeftHand',
            'RightUpperArm',
            'RightLowerArm',
            'RightHand',
            'LeftUpperLeg',
            'LeftLowerLeg',
            'LeftFoot',
            'RightUpperLeg',
            'RightLowerLeg',
            'RightFoot',
        }

        for _, PartName in ipairs(BodyParts)do
            local Part = Character:FindFirstChild(PartName)

            if Part and Part:IsA('BasePart') then
                Part.Transparency = Transparency
            end
        end
    end
end
local function PlayInvisAnimation(Animator)
    if Animator then
        if not (CurrentInvisAnimation and CurrentInvisAnimation.IsPlaying) then
            local Animation = Instance.new('Animation')

            Animation.AnimationId = 'rbxassetid://' .. InvisAnimationId
            CurrentInvisAnimation = Animator:LoadAnimation(Animation)

            CurrentInvisAnimation:Play()

            CurrentInvisAnimation.TimePosition = InvisAnimTimePos

            CurrentInvisAnimation:AdjustSpeed(InvisAnimSpeed)
        end
    end
end
local function StopInvisAnimation()
    if CurrentInvisAnimation then
        CurrentInvisAnimation:Stop()

        CurrentInvisAnimation = nil
    end
end
local function BlockOtherAnimations(Humanoid)
    if Humanoid then
        if AnimationBlockConnection then
            AnimationBlockConnection:Disconnect()
        end

        AnimationBlockConnection = Humanoid.AnimationPlayed:Connect(function(AnimTrack)
            if AnimTrack.Animation.AnimationId:match('%d+') ~= InvisAnimationId then
                AnimTrack:Stop()
            end
        end)
    end
end
local function UnblockAnimations()
    if AnimationBlockConnection then
        AnimationBlockConnection:Disconnect()

        AnimationBlockConnection = nil
    end
end
local function StartInvisibility(Character)
    if Character then
        local Humanoid = Character:WaitForChild('Humanoid')
        local Animator

        if Humanoid then
            Animator = Humanoid:FindFirstChildOfClass('Animator')
        else
            Animator = Humanoid
        end
        if Humanoid and Animator then
            SetCharacterTransparency(Character, 0.5)
            BlockOtherAnimations(Humanoid)

            if HeartbeatConnection then
                HeartbeatConnection:Disconnect()
            end

            HeartbeatConnection = RunService.Heartbeat:Connect(function()
                if InvisibilityEnabled then
                    PlayInvisAnimation(Animator)
                end
            end)
        end
    else
        return
    end
end
local function StopInvisibility(Character)
    StopInvisAnimation()
    UnblockAnimations()
    SetCharacterTransparency(Character, 0)

    if HeartbeatConnection then
        HeartbeatConnection:Disconnect()

        HeartbeatConnection = nil
    end
end
local function DisableCollision(Character)
    if Character then
        if CollisionConnection then
            CollisionConnection:Disconnect()
        end

        CollisionConnection = RunService.Stepped:Connect(function()
            if Character then
                for _, Descendant in ipairs(Character:GetDescendants())do
                    if Descendant:IsA('BasePart') and Descendant.Name ~= 'HumanoidRootPart' then
                        Descendant.CanCollide = false
                    end
                end
            end
        end)
    end
end
local function EnableCollision(Character)
    if CollisionConnection then
        CollisionConnection:Disconnect()

        CollisionConnection = nil
    end
    if Character then
        for _, Descendant in ipairs(Character:GetDescendants())do
            if Descendant:IsA('BasePart') then
                Descendant.CanCollide = true
            end
        end
    end
end
local function EnableFullInvisibility(Character)
    StartInvisibility(Character)
    DisableCollision(Character)
end
local function DisableFullInvisibility(Character)
    StopInvisibility(Character)
    EnableCollision(Character)
end
local function OnCharacterAddedInvis(NewCharacter)
    DisableFullInvisibility(LocalPlayer.Character)

    if InvisibilityEnabled then
        task.wait(0.5)
        EnableFullInvisibility(NewCharacter)
    end

    NewCharacter:WaitForChild('Humanoid').Died:Connect(function()
        DisableFullInvisibility(NewCharacter)
    end)
end

Tabs.Main:Toggle({
    Title = 'invisibility',
    Value = false,
    Callback = function(State)
        InvisibilityEnabled = State

        local Character = LocalPlayer.Character

        if InvisibilityEnabled then
            EnableFullInvisibility(Character)
        else
            DisableFullInvisibility(Character)
        end
    end,
})
LocalPlayer.CharacterAdded:Connect(OnCharacterAddedInvis)

if LocalPlayer.Character then
    OnCharacterAddedInvis(LocalPlayer.Character)
end

local AutoGetGunEnabled = false

Tabs.Main:Toggle({
    Title = 'Auto Get Gun',
    Value = false,
    Callback = function(State)
        AutoGetGunEnabled = State

        if State then
            task.spawn(function()
                while AutoGetGunEnabled do
                    local Character = Players.LocalPlayer.Character

                    if Character and Character:FindFirstChild('HumanoidRootPart') then
                        local OriginalPosition = Character.HumanoidRootPart.Position
                        local NearestGun = nil
                        local NearestDistance = math.huge

                        for _, Descendant in pairs(Workspace:GetDescendants())do
                            if Descendant.Name == 'GunDrop' and Descendant:IsA('BasePart') then
                                local Distance = (Character.HumanoidRootPart.Position - Descendant.Position).Magnitude

                                if Distance < NearestDistance then
                                    NearestGun = Descendant
                                    NearestDistance = Distance
                                end
                            end
                        end

                        if NearestGun then
                            Character.HumanoidRootPart.CFrame = NearestGun.CFrame

                            task.wait(0.1)

                            Character.HumanoidRootPart.CFrame = CFrame.new(OriginalPosition)
                        end
                    end

                    task.wait(1)
                end
            end)
        end
    end,
})
Tabs.Main:Button({
    Title = 'Get Second Life (unstable)',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/FHl36Zg1/raw'))('true')
    end,
})
Tabs.Main:Section({
    Title = 'Fly',
    Icon = 'utensils',
})

local FlySpeed = 50
local FlyEnabled = false
local MobilePadEnabled = false
local InputBeganConnection = nil
local InputEndedConnection = nil
local CharacterAddedConnection = nil
local FlyDirection = {
    f = 0,
    b = 0,
    l = 0,
    r = 0,
}

local function PlayFlyAnimation(AnimationId, TimePosition, Speed)
    pcall(function()
        if LocalPlayer.Character then
            LocalPlayer.Character.Animate.Disabled = true

            local Humanoid = LocalPlayer.Character:FindFirstChildOfClass('Humanoid')

            if Humanoid then
                for _, Track in ipairs(Humanoid:GetPlayingAnimationTracks())do
                    Track:Stop(0)
                end

                local Animation = Instance.new('Animation')

                Animation.AnimationId = 'rbxassetid://' .. AnimationId

                local AnimTrack = Humanoid:LoadAnimation(Animation)

                AnimTrack:Play(0.1)

                AnimTrack.TimePosition = TimePosition

                AnimTrack:AdjustSpeed(Speed)
            end
        else
            return
        end
    end)
end
local function StopAllAnimations()
    pcall(function()
        if LocalPlayer.Character then
            local Humanoid = LocalPlayer.Character:FindFirstChildOfClass('Humanoid')

            if Humanoid then
                for _, Track in ipairs(Humanoid:GetPlayingAnimationTracks())do
                    Track:Stop(0.1)
                end

                LocalPlayer.Character.Animate.Disabled = false
            end
        else
            return
        end
    end)
end

local FlyPadGui = Instance.new('ScreenGui')

FlyPadGui.Name = 'FlyPadGui_Gemini'
FlyPadGui.Parent = game.CoreGui
FlyPadGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
FlyPadGui.Enabled = false

local FlyPad = Instance.new('ImageButton')

FlyPad.Name = 'Fly_Pad'
FlyPad.Parent = FlyPadGui
FlyPad.BackgroundTransparency = 1
FlyPad.Position = UDim2.new(0.1, 0, 0.6, 0)
FlyPad.Size = UDim2.new(0, 100, 0, 100)
FlyPad.ZIndex = 2
FlyPad.Image = 'rbxassetid://6764432293'
FlyPad.ImageRectOffset = Vector2.new(713, 315)
FlyPad.ImageRectSize = Vector2.new(75, 75)

local LeftButton = Instance.new('TextButton')

LeftButton.Parent = FlyPad
LeftButton.BackgroundTransparency = 1
LeftButton.Size = UDim2.new(0, 30, 0, 40)
LeftButton.Position = UDim2.new(0, 0, 0, 30)
LeftButton.Text = ''

local RightButton = Instance.new('TextButton')

RightButton.Parent = FlyPad
RightButton.BackgroundTransparency = 1
RightButton.Size = UDim2.new(0, 30, 0, 40)
RightButton.Position = UDim2.new(0, 70, 0, 30)
RightButton.Text = ''

local ForwardButton = Instance.new('TextButton')

ForwardButton.Parent = FlyPad
ForwardButton.BackgroundTransparency = 1
ForwardButton.Size = UDim2.new(0, 40, 0, 30)
ForwardButton.Position = UDim2.new(0, 30, 0, 0)
ForwardButton.Text = ''

local BackwardButton = Instance.new('TextButton')

BackwardButton.Parent = FlyPad
BackwardButton.BackgroundTransparency = 1
BackwardButton.Size = UDim2.new(0, 40, 0, 30)
BackwardButton.Position = UDim2.new(0, 30, 0, 70)
BackwardButton.Text = ''

ForwardButton.MouseButton1Down:Connect(function()
    if typeof(keypress) == 'function' then
        keypress('0x57')
    end
end)
ForwardButton.MouseButton1Up:Connect(function()
    if typeof(keyrelease) == 'function' then
        keyrelease('0x57')
    end
end)
BackwardButton.MouseButton1Down:Connect(function()
    if typeof(keypress) == 'function' then
        keypress('0x53')
    end
end)
BackwardButton.MouseButton1Up:Connect(function()
    if typeof(keyrelease) == 'function' then
        keyrelease('0x53')
    end
end)
LeftButton.MouseButton1Down:Connect(function()
    if typeof(keypress) == 'function' then
        keypress('0x41')
    end
end)
LeftButton.MouseButton1Up:Connect(function()
    if typeof(keyrelease) == 'function' then
        keyrelease('0x41')
    end
end)
RightButton.MouseButton1Down:Connect(function()
    if typeof(keypress) == 'function' then
        keypress('0x44')
    end
end)
RightButton.MouseButton1Up:Connect(function()
    if typeof(keyrelease) == 'function' then
        keyrelease('0x44')
    end
end)

local function StartFlying(Character)
    if Character and Character:FindFirstChild('UpperTorso') then
        local Torso = Character.UpperTorso
        local Humanoid = Character:FindFirstChildOfClass('Humanoid')

        if Humanoid then
            for _, Child in pairs(Torso:GetChildren())do
                if Child.Name == 'GeminiFlyMover' then
                    Child:Destroy()
                end
            end

            local BodyGyro = Instance.new('BodyGyro', Torso)

            BodyGyro.Name = 'GeminiFlyMover'
            BodyGyro.P = 20000
            BodyGyro.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
            BodyGyro.cframe = Torso.CFrame

            local BodyVelocity = Instance.new('BodyVelocity', Torso)

            BodyVelocity.Name = 'GeminiFlyMover'
            BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
            BodyVelocity.maxForce = Vector3.new(math.huge, math.huge, math.huge)

            PlayFlyAnimation(10714347256, 4, 0)

            while true do
                task.wait()
                pcall(function()
                    if Character.Parent and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                        Humanoid.PlatformStand = true

                        local CameraFly = Workspace.CurrentCamera
                        local Direction = Vector3.new(FlyDirection.l + FlyDirection.r, 0, FlyDirection.f + FlyDirection.b)
                        local WorldDirection = CameraFly.CFrame:VectorToWorldSpace(Direction).Unit

                        if Direction.Magnitude <= 0 then
                            BodyVelocity.Velocity = Vector3.new(0, 0.1, 0)
                        else
                            BodyVelocity.Velocity = WorldDirection * FlySpeed
                        end

                        local TiltX = math.rad(-75) * -(FlyDirection.f + FlyDirection.b)
                        local TiltZ = math.rad(30) * -(FlyDirection.l + FlyDirection.r)

                        BodyGyro.CFrame = CameraFly.CFrame * CFrame.Angles(TiltX, 0, TiltZ)
                    else
                        FlyEnabled = false
                    end
                end)

                if not (FlyEnabled and Humanoid) then
                    break
                end
                if Humanoid:GetState() == Enum.HumanoidStateType.Dead then
                    break
                end
            end

            pcall(function()
                BodyGyro:Destroy()
                BodyVelocity:Destroy()

                Humanoid.PlatformStand = false

                StopAllAnimations()
            end)
        end
    else
        return
    end
end

function updateMobilePadVisibility()
    local ShouldShow = FlyEnabled and MobilePadEnabled

    if ShouldShow then
        ShouldShow = UserInputService.TouchEnabled
    end

    FlyPadGui.Enabled = ShouldShow
end

Tabs.Main:Input({
    Title = 'Fly Speed',
    Placeholder = tostring(FlySpeed),
    Callback = function(Text)
        local NewSpeed = tonumber(Text)

        if NewSpeed and 0 < NewSpeed then
            FlySpeed = NewSpeed

            SendNexoraNotification('ElianaFly', 'Speed set to: ' .. FlySpeed, 2, 'rbxassetid://89804924525665')
        else
            SendNexoraNotification('ElianaFly', 'Invalid speed. Please enter a number greater than 0.', 3, 'rbxassetid://89804924525665')
        end
    end,
})
Tabs.Main:Toggle({
    Title = 'Mobile Fly Panel',
    Value = MobilePadEnabled,
    Callback = function(State)
        MobilePadEnabled = State

        updateMobilePadVisibility()
    end,
})
Tabs.Main:Toggle({
    Title = 'Fly',
    Value = FlyEnabled,
    Callback = function(State)
        FlyEnabled = State

        if FlyEnabled then
            InputBeganConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
                if not GameProcessed then
                    if Input.UserInputType == Enum.UserInputType.Keyboard then
                        local Key = Input.KeyCode.Name:lower()

                        if Key == 'w' then
                            FlyDirection.f = -1

                            PlayFlyAnimation(10714177846, 4.65, 0)
                        elseif Key == 's' then
                            FlyDirection.b = 1

                            PlayFlyAnimation(10147823318, 4.11, 0)
                        elseif Key == 'a' then
                            FlyDirection.l = -1

                            PlayFlyAnimation(10147823318, 3.55, 0)
                        elseif Key == 'd' then
                            FlyDirection.r = 1

                            PlayFlyAnimation(10147823318, 4.81, 0)
                        end
                    end
                end
            end)
            InputEndedConnection = UserInputService.InputEnded:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.Keyboard then
                    local Key = Input.KeyCode.Name:lower()

                    if Key == 'w' then
                        FlyDirection.f = 0

                        PlayFlyAnimation(10714347256, 4, 0)
                    elseif Key == 's' then
                        FlyDirection.b = 0

                        PlayFlyAnimation(10714347256, 4, 0)
                    elseif Key == 'a' then
                        FlyDirection.l = 0

                        PlayFlyAnimation(10714347256, 4, 0)
                    elseif Key == 'd' then
                        FlyDirection.r = 0

                        PlayFlyAnimation(10714347256, 4, 0)
                    end
                end
            end)
            CharacterAddedConnection = LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
                task.wait(0.5)

                if FlyEnabled then
                    task.spawn(StartFlying, NewCharacter)
                end
            end)

            if LocalPlayer.Character then
                task.spawn(StartFlying, LocalPlayer.Character)
            end
        else
            if InputBeganConnection then
                InputBeganConnection:Disconnect()

                InputBeganConnection = nil
            end
            if InputEndedConnection then
                InputEndedConnection:Disconnect()

                InputEndedConnection = nil
            end
            if CharacterAddedConnection then
                CharacterAddedConnection:Disconnect()

                CharacterAddedConnection = nil
            end

            FlyDirection = {
                f = 0,
                b = 0,
                l = 0,
                r = 0,
            }

            if LocalPlayer.Character then
                for _, Child in pairs(LocalPlayer.Character.UpperTorso:GetChildren())do
                    if Child.Name == 'GeminiFlyMover' then
                        Child:Destroy()
                    end
                end

                StopAllAnimations()
            end
        end

        updateMobilePadVisibility()
    end,
})
Tabs.Main:Section({
    Title = 'Movement',
    Icon = 'settings',
})

local speedToggle = false
local speedValue = 9
local humanoid = nil
local character = nil

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild('Humanoid')
end)

if LocalPlayer.Character then
    character = LocalPlayer.Character
    humanoid = character:FindFirstChild('Humanoid')
end

local function ToggleSpeedBypass(State)
    speedToggle = State
    getgenv().WalkspeedBypass = speedToggle

    if State then
        task.spawn(function()
            while getgenv().WalkspeedBypass and (character and character.Parent) do
                local Humanoid = character:FindFirstChildOfClass('Humanoid')

                if Humanoid and Humanoid.MoveDirection.Magnitude > 0 then
                    character:TranslateBy(Humanoid.MoveDirection * speedValue * RunService.Heartbeat:Wait() * 7)
                else
                    task.wait()
                end
            end
        end)
    end
end

Tabs.Main:Toggle({
    Title = 'Speed (V Key On/Off)',
    Value = false,
    Callback = ToggleSpeedBypass,
})
Tabs.Main:Slider({
    Title = 'Speed Boost Value',
    step = 1,
    Value = {
        Min = 1,
        Max = 100,
        Default = 9,
    },
    Callback = function(Value)
        speedValue = Value
    end,
})
UserInputService.InputBegan:Connect(function(Input, GameProcessed)
    if Input.KeyCode == Enum.KeyCode.V and not GameProcessed then
        ToggleSpeedBypass(not speedToggle)
    end
end)

local jumpValue = 200

Tabs.Main:Toggle({
    Title = 'Jump',
    Value = false,
    Callback = function(State)
        getgenv().JumpPowerBypass = State

        if State then
            task.spawn(function()
                while getgenv().JumpPowerBypass do
                    if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Jumping then
                        character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, jumpValue, 0)
                    end

                    task.wait()
                end
            end)
        end
    end,
})
Tabs.Main:Slider({
    Title = 'Jump Boost Value',
    step = 1,
    Value = {
        Min = 1,
        Max = 1000,
        Default = 200,
    },
    Callback = function(Value)
        jumpValue = Value
    end,
})
Tabs.Misc:Section({
    Title = 'Universal Scripts',
    Icon = 'flame',
})
Tabs.Misc:Button({
    Title = 'Godly OP spawner',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/UniversalScripter1/ProjectNexora/refs/heads/main/V3.txt'))()
    end,
})
Tabs.Misc:Button({
    Title = 'Speed Glitch',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/YNWpDybh/raw'))()
    end,
})
Tabs.Misc:Button({
    Title = 'Inf Yield',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})
Tabs.Misc:Button({
    Title = 'Dex Explorer',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Classic-Dex-Explorer-21009'))()
    end,
})
Tabs.Misc:Button({
    Title = 'Remote Spy',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua'))()
    end,
})
Tabs.Misc:Button({
    Title = 'Keyboard',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt', true))()
    end,
})
Tabs.Misc:Button({
    Title = 'Anim Logger',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/juBGMpCZ/raw'))()
    end,
})
Tabs.Misc:Button({
    Title = 'f3x',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua'))()
    end,
})
Tabs.Misc:Button({
    Title = 'Fly V3',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/xuSMWfDu'))()
    end,
})
Tabs.Misc:Button({
    Title = 'VFX Logger',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/2uXfJqdU'))()
    end,
})
Tabs.Misc:Section({
    Title = 'Player',
    Icon = 'star',
})
Tabs.Misc:Button({
    Title = 'ServerHop',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/uTXUoORd/raw'))()
    end,
})
Tabs.Misc:Button({
    Title = 'Rejoin',
    Locked = false,
    Callback = function()
        game:GetService('TeleportService'):Teleport(game.PlaceId)
    end,
})
Tabs.Misc:Button({
    Title = 'Reset',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/YPv8xrYN/raw'))()
    end,
})
Tabs.Misc:Button({
    Title = 'Fixcam',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/IrvnCaF2/raw'))()
    end,
})
Tabs.Misc:Section({
    Title = 'Tools',
    Icon = 'sword',
})
Tabs.Misc:Button({
    Title = 'Teleport Tool',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/ZLpXLAeF/raw'))()
    end,
})
Tabs.Misc:Button({
    Title = 'Jerk Off Tool',
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/LcC6ZrhN/raw'))()
    end,
})
Tabs.ESP:Section({
    Title = 'ESP',
    Icon = 'package',
})

do
    local ESPConfig = {
        MasterEnabled = false,
        ChamsTransparency = 0.5,
        ShowLines = false,
        ShowTexts = true,
        ShowHighlight = true,
        ShowMurderer = true,
        ShowSheriff = true,
        ShowInnocent = true,
        ShowGun = true,
    }
    local ESPColors = {
        Murder = Color3.fromRGB(255, 0, 0),
        Sheriff = Color3.fromRGB(0, 150, 255),
        Innocent = Color3.fromRGB(0, 255, 100),
        DroppedGun = Color3.fromRGB(255, 255, 0),
    }
    local ESP_PlayerESP = {}
    local ESP_GunESP = {}
    local ESP_RoleCache = {}
    local ESP_GunCache = {}
    local ESP_Pool = {
        Box = {},
        Text = {},
        Line = {},
    }

    local function ESP_Acquire(kind)
        local pool = ESP_Pool[kind]

        if #pool > 0 then
            local d = table.remove(pool)

            d.Visible = false

            return d
        end

        local t = {
            Box = 'Square',
            Text = 'Text',
            Line = 'Line',
        }

        return Drawing.new(t[kind])
    end
    local function ESP_Release(kind, d)
        if not d then
            return
        end

        d.Visible = false

        table.insert(ESP_Pool[kind], d)
    end
    local function ESP_RemoveHighlight(entry)
        if entry and entry.Highlight then
            pcall(function()
                entry.Highlight:Destroy()
            end)

            entry.Highlight = nil
        end
    end
    local function ESP_DestroyEntry(entry)
        if not entry then
            return
        end

        ESP_Release('Box', entry.Box)
        ESP_Release('Text', entry.Text)
        ESP_Release('Line', entry.Tracer)

        entry.Box = nil
        entry.Text = nil
        entry.Tracer = nil

        ESP_RemoveHighlight(entry)
    end
    local function ESP_NewEntry()
        local box = ESP_Acquire('Box')

        box.Thickness = 1.8
        box.Filled = false
        box.Transparency = 1

        local text = ESP_Acquire('Text')

        text.Size = 18
        text.Center = true
        text.Outline = true
        text.Font = 2

        local tracer = ESP_Acquire('Line')

        tracer.Thickness = 4.5
        tracer.Transparency = 0.85

        return {
            Box = box,
            Text = text,
            Tracer = tracer,
            Highlight = nil,
        }
    end
    local function ESP_GetRole(player)
        local Char = player.Character
        local BP = player:FindFirstChild('Backpack')

        local function Scan(loc)
            if not loc then
                return nil
            end

            for _, item in ipairs(loc:GetChildren())do
                if item:IsA('Tool') then
                    local n = item.Name:lower()

                    if n:find('knife') or n:find('sword') or n:find('murder') or item:FindFirstChild('Knife') then
                        return 'Murder'
                    end
                    if n:find('gun') or n:find('revolver') or n:find('sheriff') or item:FindFirstChild('Gun') then
                        return 'Sheriff'
                    end
                end
            end
        end

        return Scan(Char) or Scan(BP) or 'Innocent'
    end
    local function ESP_IsAllowed(player)
        local char = player.Character

        if not char then
            return false
        end

        local hum = char:FindFirstChildOfClass('Humanoid')

        if not hum then
            return false
        end

        return hum.NameDisplayDistance == 0
    end
    local function ESP_EnsurePlayerHL(player, entry, role, color)
        if ESP_RoleCache[player] == role and entry.Highlight then
            entry.Highlight.FillTransparency = ESPConfig.ChamsTransparency

            return
        end

        ESP_RoleCache[player] = role

        ESP_RemoveHighlight(entry)

        local char = player.Character

        if not char then
            return
        end

        local h = Instance.new('Highlight')

        h.FillColor = color
        h.OutlineColor = color
        h.FillTransparency = ESPConfig.ChamsTransparency
        h.OutlineTransparency = 0.2
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Adornee = char
        h.Parent = char
        entry.Highlight = h
    end
    local function ESP_EnsureGunHL(gun, entry)
        if entry.Highlight then
            entry.Highlight.FillTransparency = ESPConfig.ChamsTransparency

            return
        end

        local h = Instance.new('Highlight')

        h.FillColor = ESPColors.DroppedGun
        h.OutlineColor = ESPColors.DroppedGun
        h.FillTransparency = ESPConfig.ChamsTransparency
        h.OutlineTransparency = 0.2
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Adornee = gun
        h.Parent = gun
        entry.Highlight = h
    end
    local function ESP_UnregisterGun(part)
        ESP_GunCache[part] = nil

        if ESP_GunESP[part] then
            ESP_DestroyEntry(ESP_GunESP[part])

            ESP_GunESP[part] = nil
        end
    end
    local function ESP_CleanupAll()
        for _, e in pairs(ESP_PlayerESP)do
            ESP_DestroyEntry(e)
        end
        for _, e in pairs(ESP_GunESP)do
            ESP_DestroyEntry(e)
        end

        table.clear(ESP_PlayerESP)
        table.clear(ESP_GunESP)
        table.clear(ESP_RoleCache)
    end

    for _, v in ipairs(Workspace:GetDescendants())do
        if v.Name == 'GunDrop' and v:IsA('BasePart') then
            ESP_GunCache[v] = true
        end
    end

    Workspace.DescendantAdded:Connect(function(d)
        if d.Name == 'GunDrop' and d:IsA('BasePart') then
            ESP_GunCache[d] = true
        end
    end)
    Workspace.DescendantRemoving:Connect(function(d)
        if d.Name == 'GunDrop' and d:IsA('BasePart') then
            ESP_UnregisterGun(d)
        end
    end)
    Players.PlayerRemoving:Connect(function(P)
        if ESP_PlayerESP[P] then
            ESP_DestroyEntry(ESP_PlayerESP[P])

            ESP_PlayerESP[P] = nil
        end

        ESP_RoleCache[P] = nil
    end)

    for _, P in ipairs(Players:GetPlayers())do
        P.CharacterRemoving:Connect(function()
            if ESP_PlayerESP[P] then
                ESP_RemoveHighlight(ESP_PlayerESP[P])
            end

            ESP_RoleCache[P] = nil
        end)
    end

    Players.PlayerAdded:Connect(function(P)
        P.CharacterRemoving:Connect(function()
            if ESP_PlayerESP[P] then
                ESP_RemoveHighlight(ESP_PlayerESP[P])
            end

            ESP_RoleCache[P] = nil
        end)
    end)

    local function ESP_MainUpdate()
        if not ESPConfig.MasterEnabled then
            return
        end

        local Mid = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

        for _, P in ipairs(Players:GetPlayers())do
            if P == LocalPlayer then
                continue
            end

            local Char = P.Character
            local Root = Char and Char:FindFirstChild('HumanoidRootPart')
            local Hum = Char and Char:FindFirstChildOfClass('Humanoid')
            local alive = Hum and Hum.Health > 0

            if not Char or not Root or not alive or not ESP_IsAllowed(P) then
                if ESP_PlayerESP[P] then
                    ESP_DestroyEntry(ESP_PlayerESP[P])

                    ESP_PlayerESP[P] = nil
                    ESP_RoleCache[P] = nil
                end

                continue
            end

            local Role = ESP_GetRole(P)
            local ShowTarget = (Role == 'Murder' and ESPConfig.ShowMurderer) or (Role == 'Sheriff' and ESPConfig.ShowSheriff) or (Role == 'Innocent' and ESPConfig.ShowInnocent)

            if not ShowTarget then
                if ESP_PlayerESP[P] then
                    ESP_DestroyEntry(ESP_PlayerESP[P])

                    ESP_PlayerESP[P] = nil
                    ESP_RoleCache[P] = nil
                end

                continue
            end
            if not ESP_PlayerESP[P] then
                ESP_PlayerESP[P] = ESP_NewEntry()
            end

            local entry = ESP_PlayerESP[P]
            local SP, OnScreen = Camera:WorldToViewportPoint(Root.Position)

            if OnScreen then
                local C = ESPColors[Role]

                if ESPConfig.ShowHighlight then
                    ESP_EnsurePlayerHL(P, entry, Role, C)
                else
                    ESP_RemoveHighlight(entry)

                    ESP_RoleCache[P] = nil
                end

                entry.Box.Visible = true
                entry.Box.Color = C
                entry.Box.Position = Vector2.new(SP.X - 20, SP.Y - 30)
                entry.Box.Size = Vector2.new(40, 60)

                if ESPConfig.ShowTexts then
                    entry.Text.Visible = true
                    entry.Text.Text = '[' .. Role:upper() .. '] ' .. P.Name
                    entry.Text.Color = C
                    entry.Text.Position = Vector2.new(SP.X, SP.Y - 50)
                else
                    entry.Text.Visible = false
                end
                if ESPConfig.ShowLines then
                    entry.Tracer.Visible = true
                    entry.Tracer.From = Mid
                    entry.Tracer.To = Vector2.new(SP.X, SP.Y)
                    entry.Tracer.Color = C
                else
                    entry.Tracer.Visible = false
                end
            else
                entry.Box.Visible = false
                entry.Text.Visible = false
                entry.Tracer.Visible = false
            end
        end
        for P in pairs(ESP_PlayerESP)do
            if not P.Parent then
                ESP_DestroyEntry(ESP_PlayerESP[P])

                ESP_PlayerESP[P] = nil
                ESP_RoleCache[P] = nil
            end
        end

        if ESPConfig.ShowGun then
            for gun in pairs(ESP_GunCache)do
                if not gun.Parent or not gun:IsDescendantOf(Workspace) then
                    ESP_UnregisterGun(gun)

                    continue
                end
                if not ESP_GunESP[gun] then
                    ESP_GunESP[gun] = ESP_NewEntry()
                end

                local entry = ESP_GunESP[gun]
                local Pos, OnScreen = Camera:WorldToViewportPoint(gun.Position)
                local C = ESPColors.DroppedGun
                local fallback = not ESPConfig.ShowLines and not ESPConfig.ShowTexts

                if ESPConfig.ShowHighlight or fallback then
                    ESP_EnsureGunHL(gun, entry)
                else
                    ESP_RemoveHighlight(entry)
                end
                if OnScreen then
                    entry.Box.Visible = true
                    entry.Box.Color = C
                    entry.Box.Position = Vector2.new(Pos.X - 10, Pos.Y - 10)
                    entry.Box.Size = Vector2.new(20, 20)

                    if ESPConfig.ShowTexts then
                        entry.Text.Visible = true
                        entry.Text.Text = '[ GUN ]'
                        entry.Text.Color = C
                        entry.Text.Position = Vector2.new(Pos.X, Pos.Y - 28)
                    else
                        entry.Text.Visible = false
                    end
                    if ESPConfig.ShowLines then
                        entry.Tracer.Visible = true
                        entry.Tracer.From = Mid
                        entry.Tracer.To = Vector2.new(Pos.X, Pos.Y)
                        entry.Tracer.Color = C
                    else
                        entry.Tracer.Visible = false
                    end
                else
                    entry.Box.Visible = false
                    entry.Text.Visible = false
                    entry.Tracer.Visible = false
                end
            end
        else
            for gun, entry in pairs(ESP_GunESP)do
                ESP_DestroyEntry(entry)

                ESP_GunESP[gun] = nil
            end
        end
    end

    Tabs.ESP:Toggle({
        Title = 'Master ESP Switch',
        Value = false,
        Callback = function(S)
            ESPConfig.MasterEnabled = S

            if not S then
                ESP_CleanupAll()
            end
        end,
    })
    Tabs.ESP:Dropdown({
        Title = 'ESP Mode',
        Desc = 'Choose which visual elements to display',
        Values = {
            'Lines',
            'Texts',
            'Highlight',
        },
        Value = {
            'Lines',
            'Texts',
            'Highlight',
        },
        Multi = true,
        AllowNone = true,
        Callback = function(Selected)
            ESPConfig.ShowLines = false
            ESPConfig.ShowTexts = false
            ESPConfig.ShowHighlight = false

            for _, v in pairs(Selected)do
                if v == 'Lines' then
                    ESPConfig.ShowLines = true
                end
                if v == 'Texts' then
                    ESPConfig.ShowTexts = true
                end
                if v == 'Highlight' then
                    ESPConfig.ShowHighlight = true
                end
            end

            if not ESPConfig.ShowHighlight then
                for _, e in pairs(ESP_PlayerESP)do
                    ESP_RemoveHighlight(e)
                end
                for _, e in pairs(ESP_GunESP)do
                    ESP_RemoveHighlight(e)
                end

                table.clear(ESP_RoleCache)
            end
        end,
    })
    Tabs.ESP:Dropdown({
        Title = 'ESP Target',
        Desc = 'Choose which roles and objects to show',
        Values = {
            'Murderer',
            'Sheriff',
            'Innocent',
            'Gun Dropped',
        },
        Value = {
            'Murderer',
            'Sheriff',
            'Innocent',
            'Gun Dropped',
        },
        Multi = true,
        AllowNone = true,
        Callback = function(Selected)
            ESPConfig.ShowMurderer = false
            ESPConfig.ShowSheriff = false
            ESPConfig.ShowInnocent = false
            ESPConfig.ShowGun = false

            for _, v in pairs(Selected)do
                if v == 'Murderer' then
                    ESPConfig.ShowMurderer = true
                end
                if v == 'Sheriff' then
                    ESPConfig.ShowSheriff = true
                end
                if v == 'Innocent' then
                    ESPConfig.ShowInnocent = true
                end
                if v == 'Gun Dropped' then
                    ESPConfig.ShowGun = true
                end
            end

            if not ESPConfig.ShowGun then
                for gun, entry in pairs(ESP_GunESP)do
                    ESP_DestroyEntry(entry)

                    ESP_GunESP[gun] = nil
                end
            end
        end,
    })
    Tabs.ESP:Slider({
        Title = 'Chams Opacity',
        Desc = 'Fill transparency of all highlights',
        Value = {
            Min = 0,
            Max = 1,
            Default = 0.5,
        },
        Callback = function(V)
            ESPConfig.ChamsTransparency = V

            for _, e in pairs(ESP_PlayerESP)do
                if e.Highlight then
                    e.Highlight.FillTransparency = V
                end
            end
            for _, e in pairs(ESP_GunESP)do
                if e.Highlight then
                    e.Highlight.FillTransparency = V
                end
            end
        end,
    })
    RunService.Heartbeat:Connect(function()
        if ESPConfig.MasterEnabled then
            pcall(ESP_MainUpdate)
        end
    end)
end

Tabs.ESP:Section({
    Title = 'Expose Roles',
    Icon = 'info',
})

local function SendChatMessage(Message)
    if TextChatService and TextChatService:FindFirstChild('ChatInputBarConfiguration') then
        local TextChannels = TextChatService:FindFirstChild('TextChannels')

        if TextChannels and TextChannels:FindFirstChild('RBXGeneral') then
            TextChannels.RBXGeneral:SendAsync(Message)
        end
    else
        local ChatEvents = ReplicatedStorage:FindFirstChild('DefaultChatSystemChatEvents')

        if ChatEvents then
            ChatEvents.SayMessageRequest:FireServer(Message, 'All')
        end
    end
end
local function ExposeRole(WeaponName, RoleName)
    for _, Player in pairs(Players:GetPlayers())do
        local Character = Player.Character
        local Backpack = Player.Backpack

        if Character and Character:FindFirstChild(WeaponName) or Backpack and Backpack:FindFirstChild(WeaponName) then
            SendChatMessage(RoleName .. ': ' .. Player.Name)

            return true
        end
    end

    return false
end
local function CreateAutoExposeToggle(Title, WeaponName, RoleName)
    local ExposeConnection = nil

    Tabs.ESP:Toggle({
        Title = Title,
        Value = false,
        Callback = function(State)
            if State then
                ExposeConnection = RunService.Heartbeat:Connect(function()
                    if ExposeRole(WeaponName, RoleName) and ExposeConnection then
                        ExposeConnection:Disconnect()

                        ExposeConnection = nil
                    end
                end)
            elseif ExposeConnection then
                ExposeConnection:Disconnect()

                ExposeConnection = nil
            end
        end,
    })
end

Tabs.ESP:Button({
    Title = 'Expose Murderer',
    Callback = function()
        ExposeRole('Knife', 'Murderer')
    end,
})
Tabs.ESP:Button({
    Title = 'Expose Sheriff',
    Callback = function()
        ExposeRole('Gun', 'Sheriff')
    end,
})
CreateAutoExposeToggle('Auto Expose Murderer', 'Knife', 'Murderer')
CreateAutoExposeToggle('Auto Expose Sheriff', 'Gun', 'Sheriff')
Tabs.ESP:Section({
    Title = 'Notify',
    Icon = 'alert-circle',
})

local function SendNotification(Message)
    SendNexoraNotification('Eliana Hub', Message, 5, 'http://www.roblox.com/asset/?id=89804924525665')
end
local function NotifyRole(WeaponName, RoleName)
    for _, Player in pairs(Players:GetPlayers())do
        if Player.Character and Player.Character:FindFirstChild(WeaponName) or Player.Backpack and Player.Backpack:FindFirstChild(WeaponName) then
            SendNotification(RoleName .. ': ' .. Player.Name)

            return true
        end
    end

    return false
end
local function CreateAutoNotifyToggle(Title, WeaponName, RoleName)
    local NotifyConnection = nil

    Tabs.ESP:Toggle({
        Title = Title,
        Value = false,
        Callback = function(State)
            if State then
                NotifyConnection = RunService.Heartbeat:Connect(function()
                    if NotifyRole(WeaponName, RoleName) and NotifyConnection then
                        NotifyConnection:Disconnect()

                        NotifyConnection = nil
                    end
                end)
            elseif NotifyConnection then
                NotifyConnection:Disconnect()

                NotifyConnection = nil
            end
        end,
    })
end

Tabs.ESP:Button({
    Title = 'Notify Murderer',
    Callback = function()
        NotifyRole('Knife', 'Murderer')
    end,
})
Tabs.ESP:Button({
    Title = 'Notify Sheriff',
    Callback = function()
        NotifyRole('Gun', 'Sheriff')
    end,
})
CreateAutoNotifyToggle('Auto Notify Murderer', 'Knife', 'Murderer')
CreateAutoNotifyToggle('Auto Notify Sheriff', 'Gun', 'Sheriff')
Tabs.ESP:Section({
    Title = 'Spectate',
    Icon = 'eye',
})

local function FindMurdererCharacter()
    for _, Player in pairs(Players:GetPlayers())do
        if Player ~= LocalPlayer and Player.Character and (Player.Backpack:FindFirstChild('Knife') or Player.Character:FindFirstChild('Knife')) then
            return Player.Character
        end
    end

    return nil
end

Tabs.ESP:Button({
    Title = 'Spectate Murderer',
    Locked = false,
    Callback = function()
        local MurdererCharacter = FindMurdererCharacter()

        if MurdererCharacter and MurdererCharacter:FindFirstChild('HumanoidRootPart') then
            Camera.CameraSubject = MurdererCharacter:FindFirstChild('Humanoid')
        else
            SendNexoraNotification('Project Nexora', 'Murder Not Found!', 1)
        end
    end,
})

local function FindSheriffCharacter()
    for _, Player in pairs(Players:GetPlayers())do
        if Player ~= LocalPlayer and Player.Character and (Player.Backpack:FindFirstChild('Gun') or Player.Character:FindFirstChild('Gun')) then
            return Player.Character
        end
    end

    return nil
end

Tabs.ESP:Button({
    Title = 'Spectate Sheriff',
    Locked = false,
    Callback = function()
        local SheriffCharacter = FindSheriffCharacter()

        if SheriffCharacter and SheriffCharacter:FindFirstChild('Humanoid') then
            Camera.CameraSubject = SheriffCharacter:FindFirstChild('Humanoid')
        else
            SendNexoraNotification('Project Nexora', 'Sheriff Not Found', 10)
        end
    end,
})
Tabs.ESP:Button({
    Title = 'Spectate Random',
    Locked = false,
    Callback = function()
        local AllPlayers = Players:GetPlayers()

        if #AllPlayers <= 1 then
            SendNexoraNotification('Project Nexora', 'There must be at least 2 people on the server', 1)
        else
            local RandomPlayer

            repeat
                RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
            until RandomPlayer ~= LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild('Humanoid')

            Camera.CameraSubject = RandomPlayer.Character:FindFirstChild('Humanoid')
        end
    end,
})
Tabs.ESP:Button({
    Title = 'Stop Spectating',
    Locked = false,
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('Humanoid') then
            Camera.CameraSubject = LocalPlayer.Character:FindFirstChild('Humanoid')
        end
    end,
})
Tabs.Farm:Section({
    Title = 'Coin Farm',
    Icon = 'package',
})

local CoinFarmEnabled = false
local TeleportWalkEnabled = false
local CoinFarmMode = 'Nearest'
local TeleportInterval = 3
local WalkCoinRadius = 15
local LastTeleportTime = 0
local LastTeleportedCoin = nil
local CurrentWalkTarget = nil
local CoinContainer = nil

local function FindTargetCoin(RootPart)
    local NearestDistance = math.huge
    local AllCoins = {}
    local NearestCoin = nil

    for _, Child in ipairs(CoinContainer:GetChildren())do
        local CoinPart = nil

        if Child:IsA('BasePart') then
            CoinPart = Child
        elseif Child:IsA('Model') and Child.PrimaryPart then
            CoinPart = Child.PrimaryPart
        end
        if CoinPart and (CoinPart.Parent and CoinPart ~= LastTeleportedCoin) then
            if CoinFarmMode ~= 'Nearest' then
                table.insert(AllCoins, CoinPart)
            else
                local Distance = (RootPart.Position - CoinPart.Position).Magnitude

                if Distance < NearestDistance then
                    NearestCoin = CoinPart
                    NearestDistance = Distance
                end
            end
        end
    end

    if CoinFarmMode == 'Nearest' then
        return NearestCoin
    end
    if #AllCoins > 0 then
        return AllCoins[math.random(1, #AllCoins)]
    end
end
local function FindNearbyCoin(RootPart)
    local SearchRadius = WalkCoinRadius
    local CurrentPosition = RootPart.Position
    local NearestCoin = nil
    local NearestDistance = SearchRadius

    for _, Child in ipairs(CoinContainer:GetChildren())do
        local CoinPart = nil

        if Child:IsA('BasePart') then
            CoinPart = Child
        elseif Child:IsA('Model') and Child.PrimaryPart then
            CoinPart = Child.PrimaryPart
        end
        if CoinPart and (CoinPart.Parent and (CoinPart ~= LastTeleportedCoin and CoinPart ~= CurrentWalkTarget)) then
            local Distance = (CurrentPosition - CoinPart.Position).Magnitude

            if Distance < NearestDistance then
                NearestCoin = CoinPart
                NearestDistance = Distance
            end
        end
    end

    return NearestCoin
end

RunService.Heartbeat:Connect(function()
    if not (CoinContainer and CoinContainer.Parent) then
        CoinContainer = Workspace:FindFirstChild('CoinContainer', true)
    end
    if CoinFarmEnabled and (LocalPlayer and CoinContainer) then
        local Character = LocalPlayer.Character

        if Character then
            local Humanoid = Character:FindFirstChildOfClass('Humanoid')
            local RootPart = Character:FindFirstChild('HumanoidRootPart')

            if Humanoid and (Humanoid.Health > 0 and RootPart) then
                local CurrentTime = os.clock()

                if TeleportWalkEnabled then
                    if TeleportInterval > CurrentTime - LastTeleportTime then
                        local NearbyCoin = not (CurrentWalkTarget and CurrentWalkTarget.Parent) and FindNearbyCoin(RootPart)

                        if NearbyCoin then
                            CurrentWalkTarget = NearbyCoin

                            Humanoid:MoveTo(NearbyCoin.Position)
                            Humanoid.MoveToFinished:Wait()

                            CurrentWalkTarget = nil
                        end
                    else
                        local TargetCoin = FindTargetCoin(RootPart)

                        if TargetCoin then
                            RootPart.CFrame = TargetCoin.CFrame
                            LastTeleportedCoin = TargetCoin
                            CurrentWalkTarget = nil
                            LastTeleportTime = CurrentTime
                        end
                    end
                else
                    local TargetCoin = TeleportInterval <= CurrentTime - LastTeleportTime and FindTargetCoin(RootPart)

                    if TargetCoin then
                        RootPart.CFrame = TargetCoin.CFrame
                        LastTeleportedCoin = TargetCoin
                        LastTeleportTime = CurrentTime
                    end
                end
            end
        else
            return
        end
    else
        return
    end
end)
Tabs.Farm:Toggle({
    Title = 'Auto Farm Coin',
    Value = false,
    Callback = function(State)
        CoinFarmEnabled = State

        if not State then
            LastTeleportedCoin = nil
            CurrentWalkTarget = nil
        end
    end,
})
Tabs.Farm:Toggle({
    Title = 'Teleport + Walk',
    Value = false,
    Callback = function(State)
        TeleportWalkEnabled = State
    end,
})
Tabs.Farm:Dropdown({
    Title = 'Coin Farm Mode',
    Desc = "Ana hedef coin'i nas\u{c4}\u{b1}l se\u{c3}\u{a7}e\u{c4}\u{178}ini belirle",
    Values = {
        'Nearest',
        'Random',
    },
    Value = 'Nearest',
    Callback = function(Value)
        CoinFarmMode = Value
    end,
})
Tabs.Farm:Slider({
    Title = 'Teleport Interval',
    step = 1,
    Value = {
        Min = 3,
        Max = 10,
        Default = 4,
    },
    Callback = function(Value)
        TeleportInterval = tonumber(Value) or 3
    end,
})

local SpinEnabled = false
local SpinSpeed = 5
local SpinConnection = nil

Tabs.Farm:Toggle({
    Title = 'Spin (spin for getting coins easily)',
    Value = false,
    Callback = function(State)
        if State then
            SpinEnabled = true

            local RootPart = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart')

            SpinConnection = RunService.RenderStepped:Connect(function(_)
                if SpinEnabled and RootPart then
                    RootPart.CFrame = RootPart.CFrame * CFrame.Angles(0, math.rad(SpinSpeed), 0)
                end
            end)
        else
            SpinEnabled = false

            if SpinConnection then
                SpinConnection:Disconnect()

                SpinConnection = nil
            end
        end
    end,
})

local AntiAFKConnection = nil

Tabs.Farm:Toggle({
    Title = 'Anti-AFK',
    Value = false,
    Callback = function(State)
        if State then
            AntiAFKConnection = LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0, 0), Camera.CFrame)
                task.wait(10)
                VirtualUser:Button2Up(Vector2.new(0, 0), Camera.CFrame)
            end)
        elseif AntiAFKConnection then
            AntiAFKConnection:Disconnect()

            AntiAFKConnection = nil
        end
    end,
})
Tabs.Farm:Button({
    Title = 'Nexora Floating GUI',
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/UniversalScripter1/ProjectNexora/refs/heads/main/MM2AUTOFARMMAINsource'))()
    end,
})
Tabs.Place:Button({
    Title = 'Teleport To Sheriff',
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/62Z9VRVr/raw'))('true')
    end,
})
Tabs.Place:Button({
    Title = 'Teleport To Murderer',
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/IrRhoidd/raw'))('true')
    end,
})

local LoopTeleportAllEnabled = false
local originalPosition = nil

Tabs.Place:Toggle({
    Title = 'Loop Teleport Everyone',
    Value = false,
    Callback = function(State)
        LoopTeleportAllEnabled = State

        if State then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                originalPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
            end

            startTeleporting()
        elseif originalPosition and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
            LocalPlayer.Character.HumanoidRootPart.CFrame = originalPosition
        end
    end,
})

function startTeleporting()
    task.spawn(function()
        while LoopTeleportAllEnabled do
            for _, Player in ipairs(Players:GetPlayers())do
                if Player ~= LocalPlayer and Player.Character and (Player.Character:FindFirstChild('HumanoidRootPart') and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')) then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame

                    task.wait(0.1)
                end
            end

            task.wait(0.1)
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function()
    if LoopTeleportAllEnabled then
        startTeleporting()
    end
end)
Tabs.Place:Button({
    Title = 'Teleport To Lobby',
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.5, 142, 0.6)
    end,
})
Tabs.Place:Button({
    Title = 'Teleport To Map',
    Callback = function()
        loadstring(game:HttpGet('https://pastefy.app/lvZs7ugv/raw'))('true')
    end,
})

local function miniFling(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then
        return
    end

    local targetRoot = targetPlayer.Character:FindFirstChild('HumanoidRootPart')
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

    if targetRoot and myRoot then
        getgenv().OldPos = myRoot.CFrame

        local flingVelocity = CFrame.new(targetRoot.Position, myRoot.Position).LookVector * 100

        targetRoot.Velocity = flingVelocity
    end
end

Tabs.Fling:Button({
    Title = 'Fling Sheriff',
    Callback = function()
        local TargetPlayer = nil

        for _, Player in pairs(Players:GetPlayers())do
            if Player ~= LocalPlayer and Player.Character then
                local Backpack = Player:FindFirstChild('Backpack')

                if Backpack and Backpack:FindFirstChild('Gun') then
                    TargetPlayer = Player

                    break
                end
            end
        end

        if TargetPlayer then
            miniFling(TargetPlayer)
        else
            SendNexoraNotification('Project Nexora', 'Sheriff Not found!', 1)
        end
    end,
})
Tabs.Fling:Button({
    Title = 'Fling Murderer',
    Callback = function()
        local TargetPlayer = nil

        for _, Player in pairs(Players:GetPlayers())do
            if Player ~= LocalPlayer and Player.Character then
                local Backpack = Player:FindFirstChild('Backpack')

                if Backpack and Backpack:FindFirstChild('Knife') then
                    TargetPlayer = Player

                    break
                end
            end
        end

        if TargetPlayer then
            miniFling(TargetPlayer)
        else
            SendNexoraNotification('Project Nexora', 'Murderer Not Found', 1)
        end
    end,
})
Tabs.Fling:Button({
    Title = 'Fix fling teleport bug',
    Callback = function()
        local RootPart = LocalPlayer.Character

        if RootPart then
            RootPart = RootPart:FindFirstChild('HumanoidRootPart')
        end
        if RootPart then
            if getgenv().OldPos then
                RootPart.CFrame = getgenv().OldPos

                SendNexoraNotification('Project Nexora', 'Teleport bug fixed!', 5)
            else
                SendNexoraNotification('Project Nexora', "Didn't find any teleport bug?", 5)
            end
        end
    end,
})

local SelectedPlayer = nil
local DeathNotifyConnection = nil
local OrbitHeartbeatConnection = nil
local OrbitRenderConnection = nil
local ESPRenderConnection = nil
local ESPBillboards = {}
local ESPEnabled = false
local OriginalCameraSubject = Camera.CameraSubject
local PlayerActions = {
    teleport = false,
    fling = false,
    view = false,
    aimLockCam = false,
    aimLockChar = false,
    orbit = false,
    notifyOnDeath = false,
}

local function SendPlayerNotification(Title, Text, Icon, Duration)
    SendNexoraNotification(Title or 'Project Nexora', Text or '', Duration or 5, Icon or 'rbxassetid://89804924525665')
end
local function AimCameraAtPlayer(Player)
    if Player then
        Player = Player.Character
    end
    if Player then
        Player = Player:FindFirstChild('Head')
    end
    if Player then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, Player.Position)
    end
end
local function AimCharacterAtPlayer(Player)
    local MyRootPart = LocalPlayer.Character

    if MyRootPart then
        MyRootPart = MyRootPart:FindFirstChild('HumanoidRootPart')
    end
    if Player then
        Player = Player.Character
    end
    if Player then
        Player = Player:FindFirstChild('HumanoidRootPart')
    end
    if MyRootPart and Player then
        MyRootPart.CFrame = CFrame.new(MyRootPart.Position, Player.Position)
    end
end
local function SetupDeathNotification()
    if DeathNotifyConnection then
        DeathNotifyConnection:Disconnect()

        DeathNotifyConnection = nil
    end
    if PlayerActions.notifyOnDeath and SelectedPlayer then
        local Character = SelectedPlayer.Character or SelectedPlayer.CharacterAdded:Wait()

        if Character then
            Character = Character:FindFirstChildOfClass('Humanoid')
        end
        if Character then
            DeathNotifyConnection = Character.Died:Connect(function()
                SendPlayerNotification('Project Nexora', SelectedPlayer.DisplayName .. ' Died')
            end)
        end
    end
end
local function SelectPlayer(PlayerName)
    if DeathNotifyConnection then
        DeathNotifyConnection:Disconnect()

        DeathNotifyConnection = nil
    end

    SelectedPlayer = nil

    if not PlayerName or PlayerName == '' then
        SendPlayerNotification('Project Nexora', 'No One Selected')

        return
    end

    local LowerName = string.lower(PlayerName)
    local FoundPlayer = nil

    for _, Player in ipairs(Players:GetPlayers())do
        if string.find(string.lower(Player.Name), LowerName, 1, true) or string.find(string.lower(Player.DisplayName), LowerName, 1, true) then
            FoundPlayer = Player

            break
        end
    end

    if FoundPlayer then
        SelectedPlayer = FoundPlayer

        SendPlayerNotification('Project Nexora', 'Selected: ' .. FoundPlayer.DisplayName, 'https://www.roblox.com/headshot-thumbnail/image?userId=' .. FoundPlayer.UserId .. '&width=420&height=420&format=png', 5)
        SetupDeathNotification()
    else
        SendPlayerNotification('Project Nexora', 'Player Not Found...')
    end
end

function createEspForPlayer(Player)
    local Head = Player.Character

    if Head then
        Head = Player.Character:FindFirstChild('Head')
    end
    if Head then
        local Billboard = Instance.new('BillboardGui')

        Billboard.Name = 'ESP_Billboard'
        Billboard.Size = UDim2.new(0, 200, 0, 50)
        Billboard.Adornee = Head
        Billboard.AlwaysOnTop = true

        local Frame = Instance.new('Frame')

        Frame.Size = UDim2.new(1, 0, 1, 0)
        Frame.BackgroundColor3 = Color3.new(0.8, 0, 0)
        Frame.BackgroundTransparency = 0.6
        Frame.Parent = Billboard

        local Corner = Instance.new('UICorner')

        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = Frame

        local Label = Instance.new('TextLabel')

        Label.Size = UDim2.new(1, 0, 1, 0)
        Label.BackgroundTransparency = 1
        Label.TextColor3 = Color3.new(1, 1, 1)
        Label.Text = Player.DisplayName
        Label.Font = Enum.Font.SourceSansBold
        Label.TextSize = 16
        Label.Parent = Frame
        ESPBillboards[Player] = {billboard = Billboard}
        Billboard.Parent = LocalPlayer.PlayerGui
    end
end
function updateEspForPlayer(Player)
    local Data = ESPBillboards[Player]

    if Data and Data.billboard then
        local Head = Player.Character

        if Head then
            Head = Head:FindFirstChild('Head')
        end
        if Head and Data.billboard.Adornee ~= Head then
            Data.billboard.Adornee = Head
        end
    end
end
function removeEspForPlayer(Player)
    if ESPBillboards[Player] then
        if ESPBillboards[Player].billboard then
            ESPBillboards[Player].billboard:Destroy()
        end

        ESPBillboards[Player] = nil
    end
end
function runEspLoop()
    for _, Player in ipairs(Players:GetPlayers())do
        if Player == LocalPlayer or not Player.Character or not Player.Character:FindFirstChild('Head') then
            if ESPBillboards[Player] then
                removeEspForPlayer(Player)
            end
        elseif ESPBillboards[Player] then
            updateEspForPlayer(Player)
        else
            createEspForPlayer(Player)
        end
    end
end

Tabs.Fling:Section({
    Title = 'Player Selection',
    Icon = 'eye',
})
Tabs.Fling:Input({
    Title = 'Select Player',
    Desc = 'Enter Player Name To Select Target',
    Placeholder = 'PlayerName',
    Callback = function(Text)
        SelectPlayer(Text)
    end,
})
Tabs.Fling:Section({
    Title = 'Player Actions',
})
Tabs.Fling:Button({
    Title = 'Teleport to Player',
    Callback = function()
        if SelectedPlayer then
            local MyRootPart = LocalPlayer.Character

            if MyRootPart then
                MyRootPart = MyRootPart:FindFirstChild('HumanoidRootPart')
            end

            local TargetRootPart = SelectedPlayer.Character

            if TargetRootPart then
                TargetRootPart = TargetRootPart:FindFirstChild('HumanoidRootPart')
            end
            if MyRootPart and TargetRootPart then
                MyRootPart.CFrame = TargetRootPart.CFrame
            else
                SendPlayerNotification('Project Nexora', 'Could not find character to teleport.')
            end
        else
            SendPlayerNotification('Project Nexora', 'No One Selected')
        end
    end,
})
Tabs.Fling:Toggle({
    Title = 'Loop Teleport',
    Value = PlayerActions.teleport,
    Callback = function(State)
        PlayerActions.teleport = State

        if State then
            if SelectedPlayer then
                task.spawn(function()
                    while PlayerActions.teleport and (SelectedPlayer and SelectedPlayer.Parent) do
                        local MyRootPart = LocalPlayer.Character

                        if MyRootPart then
                            MyRootPart = MyRootPart:FindFirstChild('HumanoidRootPart')
                        end

                        local TargetRootPart = SelectedPlayer.Character

                        if TargetRootPart then
                            TargetRootPart = TargetRootPart:FindFirstChild('HumanoidRootPart')
                        end
                        if not (MyRootPart and TargetRootPart) then
                            PlayerActions.teleport = false

                            break
                        end

                        MyRootPart.CFrame = TargetRootPart.CFrame

                        task.wait()
                    end
                end)
            else
                SendPlayerNotification('Project Nexora', 'No One Selected')

                PlayerActions.teleport = false
            end
        else
            return
        end
    end,
})
Tabs.Fling:Button({
    Title = 'Fling Player',
    Callback = function()
        if SelectedPlayer then
            miniFling(SelectedPlayer)
        else
            SendPlayerNotification('Project Nexora', 'No One Selected')
        end
    end,
})
Tabs.Fling:Toggle({
    Title = 'Loop Fling',
    Value = PlayerActions.fling,
    Callback = function(State)
        PlayerActions.fling = State

        if State then
            if SelectedPlayer then
                task.spawn(function()
                    while PlayerActions.fling and (SelectedPlayer and SelectedPlayer.Parent) do
                        miniFling(SelectedPlayer)
                        task.wait(0.5)
                    end
                end)
            else
                SendPlayerNotification('Project Nexora', 'No One Selected')

                PlayerActions.fling = false
            end
        else
            return
        end
    end,
})
Tabs.Fling:Button({
    Title = 'View Player (3 sec)',
    Callback = function()
        if SelectedPlayer then
            local TargetHumanoid = SelectedPlayer.Character

            if TargetHumanoid then
                TargetHumanoid = TargetHumanoid:FindFirstChildOfClass('Humanoid')
            end
            if TargetHumanoid then
                Camera.CameraSubject = TargetHumanoid

                task.delay(3, function()
                    if Camera.CameraSubject == TargetHumanoid then
                        Camera.CameraSubject = OriginalCameraSubject
                    end
                end)
            else
                SendPlayerNotification('Project Nexora', "Could not find the player's character to view.")
            end
        else
            SendPlayerNotification('Project Nexora', 'No One Selected')
        end
    end,
})
Tabs.Fling:Toggle({
    Title = 'Loop View',
    Value = PlayerActions.view,
    Callback = function(State)
        PlayerActions.view = State

        if State then
            if SelectedPlayer then
                task.spawn(function()
                    while PlayerActions.view and (SelectedPlayer and SelectedPlayer.Parent) do
                        local TargetHumanoid = SelectedPlayer.Character

                        if TargetHumanoid then
                            TargetHumanoid = TargetHumanoid:FindFirstChildOfClass('Humanoid')
                        end
                        if TargetHumanoid then
                            Camera.CameraSubject = TargetHumanoid
                        end

                        task.wait(0.1)
                    end

                    Camera.CameraSubject = OriginalCameraSubject
                end)
            else
                SendPlayerNotification('Project Nexora', 'No One Selected')

                PlayerActions.view = false
            end
        else
            Camera.CameraSubject = OriginalCameraSubject

            return
        end
    end,
})
Tabs.Fling:Toggle({
    Title = 'AimLock (Camera)',
    Value = PlayerActions.aimLockCam,
    Callback = function(State)
        PlayerActions.aimLockCam = State

        if State then
            if SelectedPlayer then
                task.spawn(function()
                    while PlayerActions.aimLockCam and (SelectedPlayer and SelectedPlayer.Parent) do
                        AimCameraAtPlayer(SelectedPlayer)
                        RunService.RenderStepped:Wait()
                    end
                end)
            else
                SendPlayerNotification('Project Nexora', 'No One Selected')

                PlayerActions.aimLockCam = false
            end
        else
            return
        end
    end,
})
Tabs.Fling:Toggle({
    Title = 'AimLock (Character)',
    Value = PlayerActions.aimLockChar,
    Callback = function(State)
        PlayerActions.aimLockChar = State

        if State then
            if SelectedPlayer then
                task.spawn(function()
                    while PlayerActions.aimLockChar and (SelectedPlayer and SelectedPlayer.Parent) do
                        AimCharacterAtPlayer(SelectedPlayer)
                        RunService.Heartbeat:Wait()
                    end
                end)
            else
                SendPlayerNotification('Project Nexora', 'No One Selected')

                PlayerActions.aimLockChar = false
            end
        else
            return
        end
    end,
})
Tabs.Fling:Toggle({
    Title = 'ESP',
    Value = ESPEnabled,
    Callback = function(State)
        ESPEnabled = State

        if ESPEnabled then
            if not ESPRenderConnection then
                ESPRenderConnection = RunService.RenderStepped:Connect(runEspLoop)
            end
        else
            if ESPRenderConnection then
                ESPRenderConnection:Disconnect()

                ESPRenderConnection = nil
            end

            for Player, _ in pairs(ESPBillboards)do
                removeEspForPlayer(Player)
            end

            table.clear(ESPBillboards)
        end
    end,
})
Tabs.Fling:Toggle({
    Title = 'Orbit Player',
    Value = PlayerActions.orbit,
    Callback = function(State)
        PlayerActions.orbit = State

        if OrbitHeartbeatConnection then
            OrbitHeartbeatConnection:Disconnect()

            OrbitHeartbeatConnection = nil
        end
        if OrbitRenderConnection then
            OrbitRenderConnection:Disconnect()

            OrbitRenderConnection = nil
        end
        if State then
            if SelectedPlayer then
                task.spawn(function()
                    local OrbitAngle = 0
                    local OrbitSpeed = 8
                    local OrbitRadius = 10

                    OrbitHeartbeatConnection = RunService.Heartbeat:Connect(function()
                        if PlayerActions.orbit and (SelectedPlayer and SelectedPlayer.Parent) then
                            local MyRootPart = LocalPlayer.Character

                            if MyRootPart then
                                MyRootPart = MyRootPart:FindFirstChild('HumanoidRootPart')
                            end

                            local TargetRootPart = SelectedPlayer.Character

                            if TargetRootPart then
                                TargetRootPart = TargetRootPart:FindFirstChild('HumanoidRootPart')
                            end
                            if MyRootPart and TargetRootPart then
                                OrbitAngle = OrbitAngle + OrbitSpeed
                                MyRootPart.CFrame = CFrame.new(TargetRootPart.Position) * CFrame.Angles(0, math.rad(OrbitAngle), 0) * CFrame.new(OrbitRadius, 0, 0)
                            else
                                PlayerActions.orbit = false
                            end
                        else
                            if OrbitHeartbeatConnection then
                                OrbitHeartbeatConnection:Disconnect()

                                OrbitHeartbeatConnection = nil
                            end
                            if OrbitRenderConnection then
                                OrbitRenderConnection:Disconnect()

                                OrbitRenderConnection = nil
                            end

                            return
                        end
                    end)
                    OrbitRenderConnection = RunService.RenderStepped:Connect(function()
                        if PlayerActions.orbit and (SelectedPlayer and SelectedPlayer.Parent) then
                            local MyRootPart = LocalPlayer.Character

                            if MyRootPart then
                                MyRootPart = MyRootPart:FindFirstChild('HumanoidRootPart')
                            end

                            local TargetRootPart = SelectedPlayer.Character

                            if TargetRootPart then
                                TargetRootPart = TargetRootPart:FindFirstChild('HumanoidRootPart')
                            end
                            if MyRootPart and TargetRootPart then
                                MyRootPart.CFrame = CFrame.new(MyRootPart.Position, TargetRootPart.Position)
                            else
                                PlayerActions.orbit = false
                            end
                        else
                            if OrbitHeartbeatConnection then
                                OrbitHeartbeatConnection:Disconnect()

                                OrbitHeartbeatConnection = nil
                            end
                            if OrbitRenderConnection then
                                OrbitRenderConnection:Disconnect()

                                OrbitRenderConnection = nil
                            end

                            return
                        end
                    end)
                end)
            else
                SendPlayerNotification('Project Nexora', 'No One Selected')

                PlayerActions.orbit = false
            end
        else
            return
        end
    end,
})
Tabs.Fling:Toggle({
    Title = 'Notify On Death',
    Value = PlayerActions.notifyOnDeath,
    Callback = function(State)
        PlayerActions.notifyOnDeath = State

        SetupDeathNotification()
    end,
})
Players.PlayerRemoving:Connect(function(Player)
    if SelectedPlayer and Player == SelectedPlayer then
        SendPlayerNotification('Project Nexora', Player.DisplayName .. ' left the game')

        SelectedPlayer = nil

        for Key, _ in pairs(PlayerActions)do
            PlayerActions[Key] = false
        end
    end

    removeEspForPlayer(Player)
end)
Tabs.Fling:Section({
    Title = 'Fling',
    Icon = 'utensils',
})

local FlingAuraEnabled = false

Tabs.Fling:Toggle({
    Title = 'Fling Aura',
    Value = false,
    Callback = function(State)
        FlingAuraEnabled = State

        if State then
            task.spawn(function()
                while FlingAuraEnabled do
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                        for _, Player in pairs(Players:GetPlayers())do
                            if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild('HumanoidRootPart') then
                                local TargetRootPart = Player.Character.HumanoidRootPart

                                if (LocalPlayer.Character.HumanoidRootPart.Position - TargetRootPart.Position).Magnitude <= 10 then
                                    miniFling(Player)
                                end
                            end
                        end
                    end

                    task.wait(0.5)
                end
            end)
        end
    end,
})
LocalPlayer.CharacterAdded:Connect(function()
    FlingAuraEnabled = false
end)

local MouseClickFling = LocalPlayer:GetMouse()
local ClickFlingEnabled = false

Tabs.Fling:Toggle({
    Title = 'Click Fling',
    Value = false,
    Callback = function(State)
        ClickFlingEnabled = State
    end,
})

local function GetPlayerFromPart(Part)
    if Part and Part.Parent and Part.Parent:IsA('Model') then
        return Players:FindFirstChild(Part.Parent.Name)
    end

    return nil
end

MouseClickFling.Button1Down:Connect(function()
    if ClickFlingEnabled then
        local TargetPlayer = GetPlayerFromPart(MouseClickFling.Target)

        if TargetPlayer and TargetPlayer ~= LocalPlayer then
            miniFling(TargetPlayer)
        end
    end
end)
UserInputService.TouchTap:Connect(function(TouchPositions, GameProcessed)
    if ClickFlingEnabled and not GameProcessed then
        local TouchPosition = TouchPositions[1]
        local CameraPosition = Camera.CFrame.Position
        local RayDirection = Camera:ViewportPointToRay(TouchPosition.X, TouchPosition.Y).Direction * 500
        local RayParams = RaycastParams.new()

        RayParams.FilterDescendantsInstances = {
            LocalPlayer.Character,
        }
        RayParams.FilterType = Enum.RaycastFilterType.Blacklist

        local RayResult = Workspace:Raycast(CameraPosition, RayDirection, RayParams)
        local HitInstance

        if RayResult then
            HitInstance = RayResult.Instance
        end

        local TargetPlayer = GetPlayerFromPart(HitInstance)

        if TargetPlayer and TargetPlayer ~= LocalPlayer then
            miniFling(TargetPlayer)
        end
    end
end)

local FlingAllEnabled = false
local OriginalCFrameFlingAll = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):FindFirstChild('HumanoidRootPart')
local SavedCFrameFlingAll

if OriginalCFrameFlingAll then
    SavedCFrameFlingAll = OriginalCFrameFlingAll.CFrame
else
    SavedCFrameFlingAll = OriginalCFrameFlingAll
end

Tabs.Fling:Toggle({
    Title = 'Fling All (Buggy?)',
    Value = false,
    Callback = function(State)
        FlingAllEnabled = State

        if State then
            task.spawn(function()
                while FlingAllEnabled do
                    for _, Player in pairs(Players:GetPlayers())do
                        if Player ~= LocalPlayer then
                            miniFling(Player)
                        end
                    end

                    task.wait(0.5)
                end
            end)
        elseif SavedCFrameFlingAll and OriginalCFrameFlingAll then
            OriginalCFrameFlingAll.CFrame = SavedCFrameFlingAll
        end
    end,
})

local TouchFlingEnabled = false

local function TouchFlingLoop()
    local Character = nil
    local RootPart = nil
    local ToggleValue = 0.1

    while TouchFlingEnabled do
        RunService.Heartbeat:Wait()

        while TouchFlingEnabled and not (Character and (Character.Parent and (RootPart and RootPart.Parent))) do
            RunService.Heartbeat:Wait()

            Character = LocalPlayer.Character
            RootPart = Character:FindFirstChild('HumanoidRootPart') or (Character:FindFirstChild('Torso') or Character:FindFirstChild('UpperTorso'))
        end

        if TouchFlingEnabled then
            local CurrentVelocity = RootPart.Velocity

            RootPart.Velocity = CurrentVelocity * 10000 + Vector3.new(0, 10000, 0)

            RunService.RenderStepped:Wait()

            if Character and (Character.Parent and (RootPart and RootPart.Parent)) then
                RootPart.Velocity = CurrentVelocity
            end

            RunService.Stepped:Wait()

            if Character and (Character.Parent and (RootPart and RootPart.Parent)) then
                RootPart.Velocity = CurrentVelocity + Vector3.new(0, ToggleValue, 0)
                ToggleValue = ToggleValue * -1
            end
        end
    end
end

Tabs.Fling:Toggle({
    Title = 'Touch Fling',
    Value = false,
    Callback = function(State)
        if State then
            TouchFlingEnabled = true

            coroutine.wrap(TouchFlingLoop)()
        else
            TouchFlingEnabled = false
        end
    end,
})

local AntiFlingEnabled = false
local AntiFlingConnections = {}

local function DisablePlayerCollision(Player)
    if AntiFlingEnabled and Player.Character then
        for _, Descendant in pairs(Player.Character:GetDescendants())do
            if Descendant:IsA('BasePart') and Descendant.CanCollide then
                Descendant.CanCollide = false
            end
        end
    end
end
local function EnableAllPlayerCollisions()
    for _, Player in pairs(Players:GetPlayers())do
        if Player ~= LocalPlayer and Player.Character then
            for _, Descendant in pairs(Player.Character:GetDescendants())do
                if Descendant:IsA('BasePart') then
                    Descendant.CanCollide = true
                end
            end
        end
    end
end
local function StartAntiFling()
    for _, Player in pairs(Players:GetPlayers())do
        if Player ~= LocalPlayer then
            local Connection = RunService.Stepped:Connect(function()
                DisablePlayerCollision(Player)
            end)

            table.insert(AntiFlingConnections, Connection)
        end
    end

    Players.PlayerAdded:Connect(function(Player)
        if Player ~= LocalPlayer then
            local Connection = RunService.Stepped:Connect(function()
                DisablePlayerCollision(Player)
            end)

            table.insert(AntiFlingConnections, Connection)
        end
    end)
end
local function StopAntiFling()
    for _, Connection in pairs(AntiFlingConnections)do
        Connection:Disconnect()
    end

    table.clear(AntiFlingConnections)
    EnableAllPlayerCollisions()
end

Tabs.Fling:Toggle({
    Title = 'Anti Fling',
    Value = false,
    Callback = function(State)
        AntiFlingEnabled = State

        if State then
            StartAntiFling()
        else
            StopAntiFling()
        end
    end,
})

local CustomFlingPower = 1000
local CustomTouchFlingEnabled = false

local function CustomTouchFlingLoop()
    local Character = nil
    local RootPart = nil
    local ToggleValue = 0.1

    while CustomTouchFlingEnabled do
        RunService.Heartbeat:Wait()

        while CustomTouchFlingEnabled and not (Character and (Character.Parent and (RootPart and RootPart.Parent))) do
            RunService.Heartbeat:Wait()

            Character = LocalPlayer.Character
            RootPart = Character:FindFirstChild('HumanoidRootPart') or (Character:FindFirstChild('Torso') or Character:FindFirstChild('UpperTorso'))
        end

        if CustomTouchFlingEnabled then
            local CurrentVelocity = RootPart.Velocity

            RootPart.Velocity = CurrentVelocity * CustomFlingPower + Vector3.new(0, 100, 0)

            RunService.RenderStepped:Wait()

            if Character and (Character.Parent and (RootPart and RootPart.Parent)) then
                RootPart.Velocity = CurrentVelocity
            end

            RunService.Stepped:Wait()

            if Character and (Character.Parent and (RootPart and RootPart.Parent)) then
                RootPart.Velocity = CurrentVelocity + Vector3.new(0, ToggleValue, 0)
                ToggleValue = ToggleValue * -1
            end
        end
    end
end

Tabs.Fling:Toggle({
    Title = 'Custom Touch Fling Power',
    Value = false,
    Callback = function(State)
        if State then
            CustomTouchFlingEnabled = true

            coroutine.wrap(CustomTouchFlingLoop)()
        else
            CustomTouchFlingEnabled = false
        end
    end,
})
Tabs.Fling:Slider({
    Title = 'Fling Power Value',
    Value = {
        Min = 1,
        Max = 10000,
        Default = 100,
    },
    Callback = function(Value)
        CustomFlingPower = Value
    end,
})

local Info = Tabs.Info

Info:Section({
    Title = 'Project Nexora Features',
    TextXAlignment = 'Center',
})
Info:Paragraph({
    Title = 'Current Features',
    Desc = '\u{e2}\u{20ac}\u{a2} Fake Bomb jump\n\u{e2}\u{20ac}\u{a2} upgraded ESP',
    Image = 'rbxassetid://89804924525665',
    ImageSize = 30,
})
Info:Divider()
Info:Section({
    Title = 'Official Socials',
    TextSize = 20,
})
Info:Paragraph({
    Title = 'Nexora Hub TikTok',
    Desc = 'Follow us for the latest script updates and short showcases.',
    Image = 'rbxassetid://134384554225463',
    Buttons = {
        {
            Title = 'Copy Link',
            Icon = 'link',
            Variant = 'Primary',
            Callback = function()
                setclipboard('https://www.tiktok.com/@nexora.hub.nds')
                WindUI:Notify({
                    Title = 'TikTok Link Copied',
                    Content = 'Successfully saved to clipboard!',
                    Duration = 3,
                })
            end,
        },
    },
})
Info:Space()
Info:Paragraph({
    Title = 'Script Showcaser',
    Desc = 'Subscribe for full-length high-quality showcases and tutorials.',
    Image = 'rbxassetid://109919668957167',
    Buttons = {
        {
            Title = 'Copy Channel Link',
            Icon = 'youtube',
            Variant = 'Secondary',
            Callback = function()
                setclipboard('https://www.youtube.com/@mm2scriptsop-e2j')
                WindUI:Notify({
                    Title = 'YouTube Link Copied',
                    Content = 'Successfully saved to clipboard!',
                    Duration = 3,
                })
            end,
        },
    },
})
SendNexoraNotification('Eliana Hub', 'Merged script loaded successfully!', 5, 'rbxassetid://89804924525665')
