local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local UIS = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local HttpService = game:GetService('HttpService')
local LocalPlayer = Players.LocalPlayer
local WindUI = loadstring(game:HttpGet('https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua'))()
local Window = WindUI:CreateWindow({
    Title = 'bomb hub',
    Icon = 'ghost',
    Author = 'by Belfor',
    Folder = 'BJ hub',
    Size = UDim2.fromOffset(500, 350),
    Transparent = false,
    Theme = 'Light',
    Acrylic = true,
    HideSearchBar = false,
    SideBarWidth = 200,
    OpenButton = {
        Enabled = true,
        Title = '.gg/k8pVAByJWj',
        Draggable = true,
        CornerRadius = UDim.new(0, 8),
        StrokeThickness = 1,
        OnlyMobile = false,
        Scale = 1,
        Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0)),
    },
})
local PrankTab = Window:Tab({
    Title = 'Prank Bomb',
    Icon = 'mouse-pointer-click',
})
local GoldTab = Window:Tab({
    Title = 'Gold Jump',
    Icon = 'mouse-pointer-click',
})
local gui = Instance.new('ScreenGui')

gui.Name = 'BombJumpUI'
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer.PlayerGui
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function SaveButtonPosition(pos, name)
    pcall(function()
        if writefile then
            local folder = 'NexiumHub'

            if not isfolder(folder) then
                makefolder(folder)
            end

            writefile(folder .. '/' .. name .. 'Pos.json', HttpService:JSONEncode({
                X = {
                    Scale = pos.X.Scale,
                    Offset = pos.X.Offset,
                },
                Y = {
                    Scale = pos.Y.Scale,
                    Offset = pos.Y.Offset,
                },
            }))
        end
    end)
end
local function LoadButtonPosition(name)
    local success, result = pcall(function()
        if readfile and isfile and isfile('BJhub/' .. name .. 'Pos.json') then
            return HttpService:JSONDecode(readfile('BJhub/' .. name .. 'Pos.json'))
        end
    end)

    if success and result then
        return UDim2.new(result.X.Scale, result.X.Offset, result.Y.Scale, result.Y.Offset)
    end

    return nil
end
local function CreateJumpSystem(config)
    local size = config.Size or 60
    local visible = false
    local cooldown = false
    local cooldownTime = config.Cooldown
    local editMode = false
    local buttonText = config.Text or 'Jump'
    local saveName = config.BombName
    local shimmerColor = config.ShimmerColor or Color3.fromRGB(0, 200, 255)
    local clickFlashColor = config.ClickFlashColor or Color3.fromRGB(180, 230, 255)
    local currentKeybind = config.Keybind or nil
    local defaultPos = config.Position or UDim2.new(0.5, -(size / 2), 0.5, -(size / 2))
    local buttonPos = LoadButtonPosition(saveName) or defaultPos
    local button = Instance.new('TextButton')

    button.Name = saveName .. 'Button'
    button.Parent = gui
    button.Size = UDim2.new(0, size, 0, size)
    button.Position = buttonPos
    button.Text = buttonText
    button.TextScaled = false
    button.TextSize = math.floor(size * 0.42)
    button.Font = Enum.Font.Code
    button.TextColor3 = config.TextColor or Color3.fromRGB(255, 255, 255)
    button.BackgroundTransparency = 1
    button.TextStrokeTransparency = 0.75
    button.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    button.Active = true
    button.AutoButtonColor = false
    button.Visible = visible
    button.ZIndex = 100

    local corner = Instance.new('UICorner')

    corner.CornerRadius = UDim.new(0.5, 0)
    corner.Parent = button

    local innerGlow = Instance.new('Frame')

    innerGlow.Name = 'InnerGlow'
    innerGlow.Parent = button
    innerGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    innerGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    innerGlow.Size = UDim2.new(1, -8, 1, -8)
    innerGlow.BackgroundTransparency = 0.92
    innerGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    innerGlow.ZIndex = 98

    local innerCorner = Instance.new('UICorner')

    innerCorner.CornerRadius = UDim.new(0.5, 0)
    innerCorner.Parent = innerGlow

    local innerGradient = Instance.new('UIGradient')

    innerGradient.Color = config.Gradient or ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 140, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 80, 200)),
    })
    innerGradient.Rotation = 45
    innerGradient.Parent = innerGlow

    local gradientTween = TweenService:Create(innerGradient, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true), {Rotation = 405})

    gradientTween:Play()

    local stroke = Instance.new('UIStroke')

    stroke.Thickness = 2.5
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.LineJoinMode = Enum.LineJoinMode.Round
    stroke.Parent = button

    local shimmerTween = TweenService:Create(stroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Color = shimmerColor})

    shimmerTween:Play()

    local function UpdateSize(newSize)
        size = newSize
        button.Size = UDim2.new(0, size, 0, size)
        button.TextSize = math.floor(size * 0.42)
    end
    local function PlayClickAnimation()
        local currentSize = button.Size.X.Offset
        local tweenDown = TweenService:Create(button, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, currentSize * 0.85, 0, currentSize * 0.85),
        })
        local tweenUp = TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, currentSize, 0, currentSize),
        })

        tweenDown:Play()
        tweenDown.Completed:Connect(function()
            tweenUp:Play()
        end)

        local ripple = Instance.new('Frame')

        ripple.Name = 'Ripple'
        ripple.Parent = button
        ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
        ripple.Size = UDim2.new(0, 0, 0, 0)
        ripple.BackgroundTransparency = 1
        ripple.ZIndex = 101

        local rippleCorner = Instance.new('UICorner')

        rippleCorner.CornerRadius = UDim.new(0.5, 0)
        rippleCorner.Parent = ripple

        local rippleStroke = Instance.new('UIStroke')

        rippleStroke.Thickness = 2
        rippleStroke.Color = Color3.fromRGB(255, 255, 255)
        rippleStroke.Parent = ripple

        local expandTween = TweenService:Create(ripple, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(1.8, 0, 1.8, 0),
        })
        local fadeTween = TweenService:Create(rippleStroke, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})

        expandTween:Play()
        fadeTween:Play()
        task.delay(0.5, function()
            if ripple then
                ripple:Destroy()
            end
        end)

        local originalColor = stroke.Color

        stroke.Color = clickFlashColor

        task.delay(0.12, function()
            stroke.Color = originalColor
        end)
    end

    LocalPlayer.CharacterAdded:Connect(function()
        cooldown = false

        task.wait()

        if not cooldown and not editMode then
            button.Text = buttonText
        end
    end)

    local dragging = false
    local dragStart
    local startPos

    button.InputBegan:Connect(function(input)
        if not editMode then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = button.Position
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging and editMode then
                SaveButtonPosition(button.Position, saveName)
            end

            dragging = false
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if not editMode then
            return
        end
        if dragging then
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                local delta = input.Position - dragStart

                button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end
    end)

    local function GetBomb()
        local character = LocalPlayer.Character
        local backpack = LocalPlayer:FindFirstChild('Backpack')

        if not character then
            return nil
        end

        local bomb = character:FindFirstChild(config.BombName)

        if bomb then
            return bomb
        end
        if backpack then
            bomb = backpack:FindFirstChild(config.BombName)

            if bomb then
                bomb.Parent = character

                return bomb
            end
        end

        pcall(function()
            ReplicatedStorage.Remotes.Extras.ReplicateToy:InvokeServer(config.BombName)
        end)
        task.wait(0.15)

        bomb = character:FindFirstChild(config.BombName)

        if not bomb and backpack then
            bomb = backpack:FindFirstChild(config.BombName)

            if bomb then
                bomb.Parent = character
            end
        end

        return bomb
    end
    local function DoJump()
        if cooldown then
            return
        end

        local character = LocalPlayer.Character

        if not character then
            return
        end

        local hrp = character:FindFirstChild('HumanoidRootPart')
        local humanoid = character:FindFirstChild('Humanoid')

        if not hrp or not humanoid then
            return
        end

        local bomb = GetBomb()

        if not bomb then
            return
        end

        local remote = bomb:FindFirstChild('Remote')

        if not remote then
            return
        end

        local camera = workspace.CurrentCamera
        local lookVector = camera.CFrame.LookVector
        local position = hrp.Position + (lookVector * 5) + Vector3.new(0, 2, 0)

        pcall(function()
            remote:FireServer(CFrame.new(position), 50)
        end)
        task.delay(0.05, function()
            if hrp then
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, math.max(hrp.AssemblyLinearVelocity.Y, 50), hrp.AssemblyLinearVelocity.Z)
            end

            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)

        cooldown = true

        task.spawn(function()
            for i = cooldownTime, 1, -1 do
                if not cooldown then
                    break
                end

                button.Text = tostring(i)

                task.wait(1)
            end

            if not editMode then
                button.Text = buttonText
            end

            cooldown = false
        end)
        task.delay(0.4, function()
            if bomb and bomb.Parent == character then
                bomb.Parent = LocalPlayer.Backpack
            end
        end)
    end

    button.MouseButton1Click:Connect(function()
        if editMode then
            return
        end

        PlayClickAnimation()
        DoJump()
    end)
    UIS.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if editMode then
            return
        end
        if not currentKeybind then
            return
        end
        if input.KeyCode == currentKeybind then
            PlayClickAnimation()
            DoJump()
        end
    end)
    config.Tab:Toggle({
        Title = 'Show Button',
        Default = false,
        Callback = function(state)
            visible = state
            button.Visible = visible
        end,
    })
    config.Tab:Toggle({
        Title = 'Edit Mode',
        Default = false,
        Callback = function(state)
            editMode = state

            if editMode then
                button.Text = 'MV'
                button.BackgroundTransparency = 0.95
                innerGlow.BackgroundTransparency = 0.85
            else
                button.BackgroundTransparency = 1
                innerGlow.BackgroundTransparency = 0.92

                if not cooldown then
                    button.Text = buttonText
                end
            end
        end,
    })
    config.Tab:Slider({
        Title = 'Button Size',
        Value = {
            Min = 20,
            Max = 200,
            Default = size,
        },
        Callback = function(v)
            UpdateSize(v)
        end,
    })
    config.Tab:Keybind({
        Title = 'Jump Keybind',
        Default = currentKeybind,
        Callback = function(key)
            currentKeybind = key
        end,
    })
end

CreateJumpSystem({
    Tab = PrankTab,
    BombName = 'FakeBomb',
    Cooldown = 22,
    Size = 60,
    Text = 'BJ',
    Keybind = Enum.KeyCode.Q,
    TextColor = Color3.fromRGB(200, 230, 255),
    ShimmerColor = Color3.fromRGB(0, 200, 255),
    ClickFlashColor = Color3.fromRGB(180, 230, 255),
    Gradient = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 140, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 80, 200)),
    }),
})
CreateJumpSystem({
    Tab = GoldTab,
    BombName = 'GoldBomb',
    Cooldown = 4,
    Size = 70,
    Text = 'gBJ',
    Keybind = Enum.KeyCode.G,
    TextColor = Color3.fromRGB(255, 240, 120),
    ShimmerColor = Color3.fromRGB(255, 215, 0),
    ClickFlashColor = Color3.fromRGB(255, 240, 150),
    Gradient = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 120)),
    }),
})
