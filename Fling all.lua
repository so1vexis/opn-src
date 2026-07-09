local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FlingGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(0, 140, 0, 75)
Container.Position = UDim2.new(0.5, -70, 0.5, -37)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.Active = true
Container.Parent = ScreenGui

local MainButton = Instance.new("TextButton")
MainButton.Name = "FlingButton"
MainButton.Size = UDim2.new(0, 140, 0, 45)
MainButton.Position = UDim2.new(0, 0, 0, 0)
MainButton.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
MainButton.Text = "FLING"
MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainButton.TextSize = 20
MainButton.Font = Enum.Font.GothamBold
MainButton.AutoButtonColor = false
MainButton.Parent = Container

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = MainButton

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 0, 40))
})
Gradient.Rotation = 45
Gradient.Parent = MainButton

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(255, 120, 150)
Stroke.Thickness = 2
Stroke.Transparency = 0.2
Stroke.Parent = MainButton

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 3)
Shadow.Size = UDim2.new(1, 18, 1, 18)
Shadow.ZIndex = -1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.65
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Parent = MainButton

local ToggleFrame = Instance.new("Frame")
ToggleFrame.Name = "ToggleFrame"
ToggleFrame.Size = UDim2.new(0, 140, 0, 26)
ToggleFrame.Position = UDim2.new(0, 0, 0, 49)
ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
ToggleFrame.BorderSizePixel = 0
ToggleFrame.Parent = Container

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleFrame

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(60, 60, 70)
ToggleStroke.Thickness = 1.5
ToggleStroke.Parent = ToggleFrame

local AutoLabel = Instance.new("TextLabel")
AutoLabel.Size = UDim2.new(0, 60, 1, 0)
AutoLabel.Position = UDim2.new(0, 10, 0, 0)
AutoLabel.BackgroundTransparency = 1
AutoLabel.Text = "AUTO"
AutoLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
AutoLabel.TextSize = 14
AutoLabel.Font = Enum.Font.GothamBold
AutoLabel.TextXAlignment = Enum.TextXAlignment.Left
AutoLabel.Parent = ToggleFrame

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 44, 0, 22)
ToggleBtn.Position = UDim2.new(1, -54, 0.5, -11)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
ToggleBtn.Text = ""
ToggleBtn.AutoButtonColor = false
ToggleBtn.Parent = ToggleFrame

local ToggleBtnCorner = Instance.new("UICorner")
ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
ToggleBtnCorner.Parent = ToggleBtn

local Circle = Instance.new("Frame")
Circle.Size = UDim2.new(0, 18, 0, 18)
Circle.Position = UDim2.new(0, 2, 0.5, -9)
Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Circle.BorderSizePixel = 0
Circle.Parent = ToggleBtn

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = Circle

MainButton.MouseEnter:Connect(function()
    TweenService:Create(MainButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 150, 0, 48)}):Play()
    TweenService:Create(Stroke, TweenInfo.new(0.2), {Thickness = 3, Transparency = 0}):Play()
end)

MainButton.MouseLeave:Connect(function()
    TweenService:Create(MainButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 140, 0, 45)}):Play()
    TweenService:Create(Stroke, TweenInfo.new(0.2), {Thickness = 2, Transparency = 0.2}):Play()
end)

MainButton.MouseButton1Down:Connect(function()
    TweenService:Create(MainButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 130, 0, 42)}):Play()
end)

MainButton.MouseButton1Up:Connect(function()
    TweenService:Create(MainButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 140, 0, 45)}):Play()
end)

local isDragging = false
local hasDragged = false
local dragStart, startPos

local function OnInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        hasDragged = false
        dragStart = input.Position
        startPos = Container.Position
    end
end

local function OnInputChanged(input)
    if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        if math.abs(delta.X) > 3 or math.abs(delta.Y) > 3 then
            hasDragged = true
        end
        Container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

local function OnInputEnded(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = false
    end
end

Container.InputBegan:Connect(OnInputBegan)
MainButton.InputBegan:Connect(OnInputBegan)
ToggleFrame.InputBegan:Connect(OnInputBegan)
ToggleBtn.InputBegan:Connect(OnInputBegan)
Circle.InputBegan:Connect(OnInputBegan)
AutoLabel.InputBegan:Connect(OnInputBegan)

UserInputService.InputChanged:Connect(OnInputChanged)
UserInputService.InputEnded:Connect(OnInputEnded)

local AutoFling = false
local AutoLoopRunning = false

local function Message(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local function WaitForCharacter()
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChildOfClass("Humanoid") then
        return Player.Character
    end
    local char = Player.Character or Player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    local hum = char:WaitForChildOfClass("Humanoid", 5)
    return char
end

local function SkidFling(TargetPlayer)
    local Character = WaitForCharacter()
    if not Character then return end
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart") or (Humanoid and Humanoid.RootPart)
    if not (Humanoid and RootPart) then return end

    local TCharacter = TargetPlayer.Character
    if not TCharacter then return end
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle

    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessory and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end

    if RootPart.Velocity.Magnitude < 50 then
        getgenv().OldPos = RootPart.CFrame
    end

    if THumanoid and THumanoid.Sit then
        return Message("Error Occurred", "Targeting is sitting", 5)
    end

    if THead then
        workspace.CurrentCamera.CameraSubject = THead
    elseif not THead and Handle then
        workspace.CurrentCamera.CameraSubject = Handle
    elseif THumanoid and TRootPart then
        workspace.CurrentCamera.CameraSubject = THumanoid
    end

    if not TCharacter:FindFirstChildWhichIsA("BasePart") then
        return
    end

    local FPos = function(BasePart, Pos, Ang)
        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
    end

    local SFBasePart = function(BasePart)
        local TimeToWait = 2
        local Time = tick()
        local Angle = 0

        repeat
            if not RootPart.Parent or not Humanoid.Parent then break end
            if Humanoid.Health <= 0 then break end
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

    getgenv().FPDH = workspace.FallenPartsDestroyHeight
    workspace.FallenPartsDestroyHeight = 0/0

    local BV = Instance.new("BodyVelocity")
    BV.Name = "EpixVel"
    BV.Parent = RootPart
    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
    BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

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
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        return Message("Error Occurred", "Target is missing everything", 5)
    end

    BV:Destroy()
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    workspace.CurrentCamera.CameraSubject = Humanoid

    repeat
        if not RootPart.Parent or not Humanoid.Parent then break end
        RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
        Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
        Humanoid:ChangeState("GettingUp")
        for _, x in ipairs(Character:GetChildren()) do
            if x:IsA("BasePart") then
                x.Velocity = Vector3.new()
                x.RotVelocity = Vector3.new()
            end
        end
        task.wait()
    until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
    workspace.FallenPartsDestroyHeight = getgenv().FPDH
end

local function RunFlingAll()
    if not getgenv().Welcome then Message("Script by solvexis", "Enjoy!", 5) end
    getgenv().Welcome = true

    for _, x in next, Players:GetPlayers() do
        if x ~= Player and x.UserId ~= 1414978355 then
            if x.Character and x.Character:FindFirstChildWhichIsA("BasePart") then
                pcall(function()
                    SkidFling(x)
                end)
            end
        end
    end
end

MainButton.MouseButton1Click:Connect(function()
    if hasDragged then return end
    task.spawn(RunFlingAll)
end)

local function AutoLoop()
    if AutoLoopRunning then return end
    AutoLoopRunning = true
    while AutoFling do
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChildOfClass("Humanoid") then
            RunFlingAll()
        end
        task.wait(0.3)
    end
    AutoLoopRunning = false
end

ToggleBtn.MouseButton1Click:Connect(function()
    if hasDragged then return end
    AutoFling = not AutoFling
    if AutoFling then
        TweenService:Create(ToggleBtn, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(0, 170, 80)}):Play()
        TweenService:Create(Circle, TweenInfo.new(0.25), {Position = UDim2.new(0, 24, 0.5, -9)}):Play()
        TweenService:Create(AutoLabel, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        task.spawn(AutoLoop)
    else
        TweenService:Create(ToggleBtn, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}):Play()
        TweenService:Create(Circle, TweenInfo.new(0.25), {Position = UDim2.new(0, 2, 0.5, -9)}):Play()
        TweenService:Create(AutoLabel, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
    end
end)
