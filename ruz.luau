local UserInputService, CurrentCamera, n1, n2, u13, n3, u15, u16, u17, v18, v25, u29, u31, u32, u61, u62, t3, t4, v68, v78, u120, n17, u126, u127, u128, v145, u147, u148, u149, u150, u151, u156, u172, u173, u174, u175, u176, u177, u178, v183, u184, u185, u186, u187, u188, u189, u198, u199, id, u201, u202, u205, u206, u207, u208, u209, u210, u211, u212, v232, v239, v244, u252, u257, u263, u270, u276, u281, u287, u293, v301, v302

do
    local u9, u10, u99, u105, u110, u116, u157
    local Players = game:GetService('Players')
    local Workspace, RunService, LocalPlayer, u129, u130, u131, u162, u163, u164, u165, u166, u167, u168, u169, t25, v220, uDim2, t26

    do
        local u98, u104, u222
        local v125, uDim2_2

        do
            local u218
            local v21, v115, t17

            do
                local Lighting, TextLabel

                do
                    local ReplicatedStorage = game:GetService('ReplicatedStorage')

                    Workspace = game:GetService('Workspace')
                    UserInputService = game:GetService('UserInputService')
                    RunService = game:GetService('RunService')
                    Lighting = game:GetService('Lighting')
                    LocalPlayer = Players.LocalPlayer
                    CurrentCamera = Workspace.CurrentCamera
                    u9 = false
                    u10 = false
                    n1 = 200
                    n2 = 200
                    u13 = false
                    n3 = 70
                    u15 = false
                    u16 = false
                    u17 = true
                    v18 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/dist/main.lua'))()

                    v18:SetTheme('Crimson')

                    do
                        local _ = v18
                    end
                    do
                        local u20 = UserInputService

                        function v21(p1)
                            local u362 = nil
                            local p2Position = nil
                            local Position = nil
                            local InputBegan = p1.InputBegan
                            local u366 = p1

                            InputBegan:Connect(function(p2)
                                if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
                                    u362 = true
                                    p2Position = p2.Position
                                    Position = u366.Position
                                end
                            end)

                            local InputChanged = p1.InputChanged
                            local u368 = p1

                            InputChanged:Connect(function(p3)
                                if u362 then
                                    if p3.UserInputType == Enum.UserInputType.MouseMovement or p3.UserInputType == Enum.UserInputType.Touch then
                                        local v838 = p3.Position - p2Position

                                        u368.Position = UDim2.new(Position.X.Scale, Position.X.Offset + v838.X, Position.Y.Scale, Position.Y.Offset + v838.Y)
                                    end

                                    return
                                end
                            end)
                            u20.InputEnded:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                    u362 = false
                                end
                            end)
                        end
                    end
                    do
                        local u22 = UserInputService
                        local u23 = v18
                        local u24 = v21

                        function v25(p4, p5, p6, p7, p8, p9, p10)
                            local v377 = 'RuzSlider_' .. p4:gsub('%s+', '_')
                            local v378 = game.CoreGui:FindFirstChild(v377)

                            if not v378 then
                                local ScreenGui = Instance.new('ScreenGui', game.CoreGui)

                                ScreenGui.Name = v377
                                ScreenGui.ResetOnSpawn = false
                                ScreenGui.DisplayOrder = 55
                                ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                                local Frame = Instance.new('Frame', ScreenGui)

                                Frame.Size = UDim2.new(0, 300, 0, 175)
                                Frame.Position = UDim2.new(0.5, -150, 0.35, 0)
                                Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                                Frame.BackgroundTransparency = 0.08
                                Frame.BorderSizePixel = 0
                                Instance.new('UICorner', Frame).CornerRadius = UDim.new(0, 10)

                                local UIStroke = Instance.new('UIStroke', Frame)

                                UIStroke.Color = Color3.fromRGB(220, 38, 38)
                                UIStroke.Thickness = 1.5
                                UIStroke.Transparency = 0.15

                                local TextLabel2 = Instance.new('TextLabel', Frame)

                                TextLabel2.Size = UDim2.new(1, -44, 0, 36)
                                TextLabel2.Position = UDim2.new(0, 12, 0, 0)
                                TextLabel2.BackgroundTransparency = 1
                                TextLabel2.Text = 'RuzHub  \u{2014}  ' .. p4
                                TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
                                TextLabel2.Font = Enum.Font.GothamBold
                                TextLabel2.TextSize = 14
                                TextLabel2.TextXAlignment = Enum.TextXAlignment.Left

                                local TextButton = Instance.new('TextButton', Frame)

                                TextButton.Size = UDim2.new(0, 28, 0, 28)
                                TextButton.Position = UDim2.new(1, -34, 0, 4)
                                TextButton.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
                                TextButton.Text = 'X'
                                TextButton.TextColor3 = Color3.new(1, 1, 1)
                                TextButton.Font = Enum.Font.GothamBold
                                TextButton.TextSize = 13
                                Instance.new('UICorner', TextButton).CornerRadius = UDim.new(0, 6)

                                local MouseButton1Click = TextButton.MouseButton1Click
                                local u385 = ScreenGui

                                MouseButton1Click:Connect(function()
                                    u385:Destroy()
                                end)

                                local u386 = p7
                                local TextLabel3 = Instance.new('TextLabel', Frame)

                                TextLabel3.Size = UDim2.new(1, 0, 0, 22)
                                TextLabel3.Position = UDim2.new(0, 0, 0, 38)
                                TextLabel3.BackgroundTransparency = 1
                                TextLabel3.Text = p4 .. ':  ' .. tostring(p7)
                                TextLabel3.TextColor3 = Color3.fromRGB(210, 210, 210)
                                TextLabel3.Font = Enum.Font.Gotham
                                TextLabel3.TextSize = 13

                                local Frame2 = Instance.new('Frame', Frame)

                                Frame2.Size = UDim2.new(1, -30, 0, 10)
                                Frame2.Position = UDim2.new(0, 15, 0, 72)
                                Frame2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                                Frame2.BorderSizePixel = 0
                                Instance.new('UICorner', Frame2).CornerRadius = UDim.new(1, 0)

                                local v390 = (p7 - p5) / (p6 - p5)
                                local Frame3 = Instance.new('Frame', Frame2)

                                Frame3.Size = UDim2.new(v390, 0, 1, 0)
                                Frame3.BackgroundColor3 = Color3.fromRGB(220, 38, 38)
                                Frame3.BorderSizePixel = 0
                                Instance.new('UICorner', Frame3).CornerRadius = UDim.new(1, 0)

                                local TextButton2 = Instance.new('TextButton', Frame2)

                                TextButton2.Size = UDim2.new(0, 26, 0, 26)
                                TextButton2.Position = UDim2.new(v390, -13, 0.5, -13)
                                TextButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                TextButton2.Text = ''
                                TextButton2.AutoButtonColor = false
                                TextButton2.BorderSizePixel = 0
                                Instance.new('UICorner', TextButton2).CornerRadius = UDim.new(1, 0)

                                local u393 = Frame2
                                local u394 = p5
                                local u395 = p6
                                local u396 = p8
                                local u397 = TextButton2
                                local u398 = p4

                                local function v399(p11)
                                    local v841 = (p11 - u393.AbsolutePosition.X) / u393.AbsoluteSize.X
                                    local v842 = math.clamp(v841, 0, 1)
                                    local v843 = u394 + v842 * (u395 - u394)

                                    u386 = math.round(v843)

                                    if u396 and u396 > 0 then
                                        local v844 = u386 / u396

                                        u386 = math.round(v844) * u396
                                    end

                                    local v845 = (u386 - u394) / (u395 - u394)

                                    Frame3.Size = UDim2.new(v845, 0, 1, 0)
                                    u397.Position = UDim2.new(v845, -13, 0.5, -13)
                                    TextLabel3.Text = u398 .. ':  ' .. tostring(u386)
                                end

                                local u400 = false

                                TextButton2.InputBegan:Connect(function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                        u400 = true
                                    end
                                end)

                                local InputBegan = Frame2.InputBegan
                                local u402 = v399

                                InputBegan:Connect(function(p12)
                                    if p12.UserInputType == Enum.UserInputType.MouseButton1 or p12.UserInputType == Enum.UserInputType.Touch then
                                        u400 = true

                                        u402(p12.Position.X)
                                    end
                                end)

                                local InputChanged = u22.InputChanged
                                local u404 = v399

                                InputChanged:Connect(function(p13)
                                    if u400 then
                                        if p13.UserInputType == Enum.UserInputType.MouseMovement or p13.UserInputType == Enum.UserInputType.Touch then
                                            u404(p13.Position.X)
                                        end

                                        return
                                    end
                                end)
                                u22.InputEnded:Connect(function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                        u400 = false
                                    end
                                end)

                                local Frame4 = Instance.new('Frame', Frame)

                                Frame4.Size = UDim2.new(1, -20, 0, 36)
                                Frame4.Position = UDim2.new(0, 10, 0, 126)
                                Frame4.BackgroundTransparency = 1

                                local TextButton3 = Instance.new('TextButton', Frame4)

                                TextButton3.Size = UDim2.new(0.48, 0, 1, 0)
                                TextButton3.BackgroundColor3 = Color3.fromRGB(20, 160, 20)
                                TextButton3.Text = 'Apply'
                                TextButton3.TextColor3 = Color3.new(1, 1, 1)
                                TextButton3.Font = Enum.Font.GothamBold
                                TextButton3.TextSize = 13
                                Instance.new('UICorner', TextButton3).CornerRadius = UDim.new(0, 6)

                                local MouseButton1Click2 = TextButton3.MouseButton1Click
                                local u408 = p9
                                local u409 = p4

                                MouseButton1Click2:Connect(function()
                                    u408(u386)

                                    local v853 = u409 .. ' set to ' .. u386

                                    u23:Notify({
                                        Title = 'RuzHub',
                                        Content = tostring(v853),
                                        Duration = 3,
                                        Icon = 'bell',
                                    })
                                end)

                                local TextButton4 = Instance.new('TextButton', Frame4)

                                TextButton4.Size = UDim2.new(0.48, 0, 1, 0)
                                TextButton4.Position = UDim2.new(0.52, 0, 0, 0)
                                TextButton4.BackgroundColor3 = Color3.fromRGB(160, 20, 20)
                                TextButton4.Text = 'Reset'
                                TextButton4.TextColor3 = Color3.new(1, 1, 1)
                                TextButton4.Font = Enum.Font.GothamBold
                                TextButton4.TextSize = 13
                                Instance.new('UICorner', TextButton4).CornerRadius = UDim.new(0, 6)

                                local MouseButton1Click3 = TextButton4.MouseButton1Click
                                local u412 = ScreenGui

                                MouseButton1Click3:Connect(function()
                                    p10()
                                    u412:Destroy()
                                end)
                                u24(Frame)

                                return
                            end

                            v378:Destroy()
                        end
                    end
                    do
                        local ScreenGui = Instance.new('ScreenGui', game.CoreGui)

                        ScreenGui.Name = 'RuzLGStar'
                        ScreenGui.ResetOnSpawn = false
                        ScreenGui.DisplayOrder = 40
                        TextLabel = Instance.new('TextLabel', ScreenGui)
                    end

                    TextLabel.Size = UDim2.new(0, 28, 0, 28)
                    TextLabel.Position = UDim2.new(1, -34, 0, 4)
                    TextLabel.BackgroundTransparency = 1
                    TextLabel.Text = '\u{2605}'
                    TextLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
                    TextLabel.Font = Enum.Font.GothamBold
                    TextLabel.TextSize = 22
                    TextLabel.Visible = false

                    do
                        local t2, n4, u82
                        local Part = Instance.new('Part')

                        Part.Name = 'RuzPredictionPart'
                        Part.Size = Vector3.new(0.5, 0.5, 0.5)
                        Part.Anchored = true
                        Part.CanCollide = false
                        Part.Transparency = 1
                        Part.Parent = Workspace
                        u29 = nil

                        do
                            local v35

                            do
                                local u30 = Workspace

                                u31 = nil
                                u32 = nil

                                local color3 = Color3.fromRGB(255, 215, 0)

                                local function u34(p14)
                                    if u29 then
                                        u29:Destroy()

                                        u29 = nil
                                    end

                                    local Part2 = Instance.new('Part')

                                    Part2.Name = 'RuzGunMarker'
                                    Part2.Size = Vector3.new(1.5, 0.15, 1.5)
                                    Part2.Anchored = true
                                    Part2.CanCollide = false
                                    Part2.CastShadow = false
                                    Part2.Material = Enum.Material.Neon
                                    Part2.Color = Color3.fromRGB(50, 255, 80)
                                    Part2.Transparency = 0.25
                                    Part2.CFrame = CFrame.new(p14)
                                    Part2.Parent = u30

                                    local spawn = task.spawn
                                    local u416 = Part2

                                    spawn(function()
                                        while u416 and u416.Parent do
                                            for i = 0, 1, 0.05 do
                                                if not u416 or not u416.Parent then
                                                    break
                                                end

                                                local v856 = i * 3.141592653589793

                                                u416.Transparency = 0.25 + 0.5 * math.sin(v856)

                                                task.wait(0.03)
                                            end
                                        end
                                    end)

                                    u29 = Part2
                                end

                                function v35(p15)
                                    if u17 then
                                        if u31 then
                                            u31:Destroy()

                                            u31 = nil
                                        end
                                        if u32 then
                                            u32:Destroy()

                                            u32 = nil
                                        end

                                        local Highlight = Instance.new('Highlight')

                                        Highlight.Adornee = p15
                                        Highlight.FillColor = color3
                                        Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                        Highlight.FillTransparency = 0.35
                                        Highlight.OutlineTransparency = 0
                                        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                        Highlight.Parent = p15
                                        u31 = Highlight

                                        local v419 = p15:FindFirstChild('Handle') or (p15:IsA('Model') and p15.PrimaryPart or p15:FindFirstChildWhichIsA('BasePart')) or p15:IsA('BasePart') and p15

                                        if not v419 then
                                            if p15:IsA('Model') then
                                                u34(p15:GetModelCFrame().Position + Vector3.new(0, 0.1, 0))
                                            end

                                            return
                                        end

                                        u34(v419.Position + Vector3.new(0, 0.1, 0))

                                        local BillboardGui = Instance.new('BillboardGui')

                                        BillboardGui.Adornee = v419
                                        BillboardGui.Size = UDim2.new(0, 130, 0, 36)
                                        BillboardGui.StudsOffset = Vector3.new(0, 4, 0)
                                        BillboardGui.AlwaysOnTop = true
                                        BillboardGui.MaxDistance = 300
                                        BillboardGui.Parent = v419

                                        local Frame = Instance.new('Frame', BillboardGui)

                                        Frame.Size = UDim2.new(1, 0, 1, 0)
                                        Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        Frame.BackgroundTransparency = 0.4
                                        Frame.BorderSizePixel = 0
                                        Instance.new('UICorner', Frame).CornerRadius = UDim.new(0, 6)

                                        local UIStroke = Instance.new('UIStroke', Frame)

                                        UIStroke.Color = color3
                                        UIStroke.Thickness = 1.5
                                        UIStroke.Transparency = 0.1

                                        local TextLabel4 = Instance.new('TextLabel', Frame)

                                        TextLabel4.Size = UDim2.new(1, 0, 1, 0)
                                        TextLabel4.BackgroundTransparency = 1
                                        TextLabel4.Text = 'GUN ON MAP'
                                        TextLabel4.TextColor3 = color3
                                        TextLabel4.Font = Enum.Font.GothamBlack
                                        TextLabel4.TextSize = 13
                                        TextLabel4.TextStrokeTransparency = 0.4
                                        TextLabel4.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                        u32 = BillboardGui

                                        return
                                    end
                                end
                            end
                            do
                                local _ = Workspace
                                local _ = v35
                                local _ = v18
                            end
                            do
                                local u42

                                do
                                    local t1 = {}
                                    local u40 = v35
                                    local u41 = v18

                                    function u42(p16)
                                        if not t1[p16] then
                                            t1[p16] = true

                                            p16.ChildAdded:Connect(function(child)
                                                if child.Name == 'GunDrop' then
                                                    task.wait(0.1)

                                                    if u17 then
                                                        u40(child)
                                                    end

                                                    u41:Notify({
                                                        Title = 'RuzHub',
                                                        Content = tostring('Gun dropped on the map!'),
                                                        Duration = 3,
                                                        Icon = 'bell',
                                                    })
                                                end
                                                if child:IsA('Model') or child:IsA('Folder') then
                                                    u42(child)
                                                end
                                            end)
                                            p16.ChildRemoved:Connect(function(child)
                                                if child.Name == 'GunDrop' then
                                                    if u31 then
                                                        u31:Destroy()

                                                        u31 = nil
                                                    end
                                                    if u32 then
                                                        u32:Destroy()

                                                        u32 = nil
                                                    end
                                                    if u29 then
                                                        u29:Destroy()

                                                        u29 = nil
                                                    end
                                                end
                                            end)

                                            for _, child in ipairs(p16:GetChildren())do
                                                if child:IsA('Model') or child:IsA('Folder') then
                                                    u42(child)
                                                end
                                            end

                                            return
                                        end
                                    end
                                end

                                u42(Workspace)

                                local ChildAdded = Workspace.ChildAdded
                                local u44 = u42
                                local u45 = v35
                                local u46 = v18

                                ChildAdded:Connect(function(p17)
                                    if p17:IsA('Model') or p17:IsA('Folder') then
                                        u44(p17)
                                    end
                                    if p17.Name == 'GunDrop' then
                                        task.wait(0.1)

                                        if u17 then
                                            u45(p17)
                                        end

                                        u46:Notify({
                                            Title = 'RuzHub',
                                            Content = tostring('Gun dropped on the map!'),
                                            Duration = 3,
                                            Icon = 'bell',
                                        })
                                    end
                                end)
                            end
                            do
                                local spawn = task.spawn
                                local u48 = Workspace
                                local u49 = v35
                                local u50 = v18

                                spawn(function()
                                    task.wait(1.5)

                                    local GunDrop = u48:FindFirstChild('GunDrop', true)

                                    if GunDrop then
                                        if u17 then
                                            u49(GunDrop)
                                        end

                                        u50:Notify({
                                            Title = 'RuzHub',
                                            Content = tostring('Gun dropped on the map!'),
                                            Duration = 3,
                                            Icon = 'bell',
                                        })
                                    end
                                end)
                            end
                            do
                                local u51 = Workspace
                                local u52 = v35
                                local u53 = v18

                                for _, player in ipairs(Players:GetPlayers())do
                                    if player ~= LocalPlayer then
                                        task.spawn(function(p18)
                                            local u431 = p18

                                            if p18.Character then
                                                local Character = p18.Character

                                                if Character then
                                                    local Humanoid = Character:WaitForChild('Humanoid', 5)

                                                    if Humanoid then
                                                        local Died = Humanoid.Died
                                                        local u435 = p18
                                                        local u436 = Character

                                                        Died:Connect(function()
                                                            if u435.Backpack:FindFirstChild('Gun') or u436:FindFirstChild('Gun') then
                                                                task.delay(0.8, function()
                                                                    local GunDrop = u51:FindFirstChild('GunDrop', true)

                                                                    if GunDrop then
                                                                        if u17 then
                                                                            u52(GunDrop)
                                                                        end

                                                                        u53:Notify({
                                                                            Title = 'RuzHub',
                                                                            Content = tostring('Gun dropped on the map!'),
                                                                            Duration = 3,
                                                                            Icon = 'bell',
                                                                        })
                                                                    end
                                                                end)
                                                            end
                                                        end)
                                                    end
                                                end
                                            end

                                            p18.CharacterAdded:Connect(function(character)
                                                if character then
                                                    local Humanoid = character:WaitForChild('Humanoid', 5)

                                                    if Humanoid then
                                                        local Died = Humanoid.Died
                                                        local u862 = character

                                                        Died:Connect(function()
                                                            if u431.Backpack:FindFirstChild('Gun') or u862:FindFirstChild('Gun') then
                                                                task.delay(0.8, function()
                                                                    local GunDrop = u51:FindFirstChild('GunDrop', true)

                                                                    if GunDrop then
                                                                        if u17 then
                                                                            u52(GunDrop)
                                                                        end

                                                                        u53:Notify({
                                                                            Title = 'RuzHub',
                                                                            Content = tostring('Gun dropped on the map!'),
                                                                            Duration = 3,
                                                                            Icon = 'bell',
                                                                        })
                                                                    end
                                                                end)
                                                            end
                                                        end)

                                                        return
                                                    end

                                                    return
                                                end
                                            end)
                                        end, player)
                                    end
                                end
                            end

                            local PlayerAdded = Players.PlayerAdded
                            local u57 = LocalPlayer
                            local u58 = Workspace
                            local u59 = v35
                            local u60 = v18

                            PlayerAdded:Connect(function(p19)
                                if p19 ~= u57 then
                                    local u438 = p19

                                    if p19.Character then
                                        local Character = p19.Character

                                        if Character then
                                            local Humanoid = Character:WaitForChild('Humanoid', 5)

                                            if Humanoid then
                                                local Died = Humanoid.Died
                                                local u442 = p19
                                                local u443 = Character

                                                Died:Connect(function()
                                                    if u442.Backpack:FindFirstChild('Gun') or u443:FindFirstChild('Gun') then
                                                        task.delay(0.8, function()
                                                            local GunDrop = u58:FindFirstChild('GunDrop', true)

                                                            if GunDrop then
                                                                if u17 then
                                                                    u59(GunDrop)
                                                                end

                                                                u60:Notify({
                                                                    Title = 'RuzHub',
                                                                    Content = tostring('Gun dropped on the map!'),
                                                                    Duration = 3,
                                                                    Icon = 'bell',
                                                                })
                                                            end
                                                        end)
                                                    end
                                                end)
                                            end
                                        end
                                    end

                                    p19.CharacterAdded:Connect(function(character)
                                        if character then
                                            local Humanoid = character:WaitForChild('Humanoid', 5)

                                            if Humanoid then
                                                local Died = Humanoid.Died
                                                local u866 = character

                                                Died:Connect(function()
                                                    if u438.Backpack:FindFirstChild('Gun') or u866:FindFirstChild('Gun') then
                                                        task.delay(0.8, function()
                                                            local GunDrop = u58:FindFirstChild('GunDrop', true)

                                                            if GunDrop then
                                                                if u17 then
                                                                    u59(GunDrop)
                                                                end

                                                                u60:Notify({
                                                                    Title = 'RuzHub',
                                                                    Content = tostring('Gun dropped on the map!'),
                                                                    Duration = 3,
                                                                    Icon = 'bell',
                                                                })
                                                            end
                                                        end)
                                                    end
                                                end)

                                                return
                                            end

                                            return
                                        end
                                    end)
                                end
                            end)

                            u61 = false
                            u62 = nil
                            t2 = {}
                            n4 = 0
                            t3 = {
                                Murderer = true,
                                Sheriff = true,
                                Hero = true,
                                Innocent = true,
                                Self = true,
                            }
                            t4 = {
                                Murderer = Color3.fromRGB(255, 40, 40),
                                Sheriff = Color3.fromRGB(40, 130, 255),
                                Hero = Color3.fromRGB(255, 215, 0),
                                Innocent = Color3.fromRGB(0, 220, 0),
                            }

                            local u67 = Players

                            function v68()
                                for _, player in ipairs(u67:GetPlayers())do
                                    if player.Character then
                                        local RuzHub_ESP = player.Character:FindFirstChild('RuzHub_ESP')

                                        if RuzHub_ESP then
                                            RuzHub_ESP:Destroy()
                                        end
                                    end
                                end

                                t2 = {}
                                n4 = 0
                            end
                        end
                        do
                            local u69 = ReplicatedStorage
                            local u70 = v18
                            local u71 = RunService
                            local u72 = Players

                            local function u73(p20)
                                local s1 = 'Innocent'
                                local v446 = t2[p20.Name]

                                if v446 then
                                    local v447 = v446.Role or (v446.role or (v446.Team or ''))
                                    local v448 = tostring(v447):lower()

                                    if v448:find('murd') then
                                        return 'Murderer'
                                    end
                                    if v448:find('sheriff') or v448:find('gun') then
                                        return 'Sheriff'
                                    end
                                    if v448:find('hero') then
                                        s1 = 'Hero'
                                    end
                                end

                                return s1
                            end

                            local u74 = t3
                            local u75 = LocalPlayer

                            local function u76(p21, p22)
                                local v451 = p21:FindFirstChild('RuzHub_ESP') or Instance.new('Highlight')

                                v451.Name = 'RuzHub_ESP'
                                v451.Parent = p21
                                v451.FillColor = p22
                                v451.FillTransparency = 0.7
                                v451.OutlineColor = Color3.fromRGB(255, 255, 255)
                                v451.OutlineTransparency = 0.15
                                v451.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            end

                            local u77 = t4

                            function v78()
                                local GetCurrentPlayerData = u69:FindFirstChild('GetCurrentPlayerData', true)

                                if GetCurrentPlayerData and GetCurrentPlayerData:IsA('RemoteFunction') then
                                    if u62 then
                                        u62:Disconnect()

                                        u62 = nil
                                    end

                                    local Heartbeat = u71.Heartbeat
                                    local u459 = GetCurrentPlayerData

                                    u62 = Heartbeat:Connect(function()
                                        if u61 then
                                            if tick() - n4 > 0.5 then
                                                local ok, result = pcall(function()
                                                    return u459:InvokeServer()
                                                end)

                                                if ok and type(result) == 'table' then
                                                    t2 = result
                                                end

                                                n4 = tick()
                                            end

                                            for _, player in ipairs(u72:GetPlayers())do
                                                if player.Character then
                                                    local v871 = u73(player)
                                                    local v872 = u74[v871]

                                                    if player == u75 and not u74.Self then
                                                        v872 = false
                                                    end
                                                    if not v872 then
                                                        local RuzHub_ESP = player.Character:FindFirstChild('RuzHub_ESP')

                                                        if RuzHub_ESP then
                                                            RuzHub_ESP:Destroy()
                                                        end
                                                    else
                                                        u76(player.Character, u77[v871])
                                                    end
                                                end
                                            end

                                            return
                                        end
                                    end)

                                    return
                                end

                                u70:Notify({
                                    Title = 'RuzHub',
                                    Content = tostring('ESP remote not found!'),
                                    Duration = 3,
                                    Icon = 'bell',
                                })

                                u61 = false
                            end
                        end
                        do
                            local _ = v68
                            local _ = v78
                            local _ = v68

                            u82 = nil

                            local u83 = LocalPlayer
                            local u84 = Players
                            local RenderStepped = RunService.RenderStepped

                            local function u86()
                                local Character = u83.Character
                                local v464 = Character and Character:FindFirstChild('HumanoidRootPart')

                                if v464 then
                                    local v466 = u83.Backpack:FindFirstChild('Knife') or u83.Character and u83.Character:FindFirstChild('Knife')
                                    local v468 = u83.Backpack:FindFirstChild('Gun') or u83.Character and u83.Character:FindFirstChild('Gun')
                                    local v469 = nil
                                    local n5 = (1/0)

                                    for _, player in ipairs(u84:GetPlayers())do
                                        if player ~= u83 and player.Character then
                                            local Character2 = player.Character
                                            local Humanoid = Character2:FindFirstChildOfClass('Humanoid')

                                            if Humanoid and Humanoid.Health > 0 then
                                                local HumanoidRootPart = Character2:FindFirstChild('HumanoidRootPart')

                                                if HumanoidRootPart then
                                                    local v476 = player.Backpack:FindFirstChild('Knife') or player.Character and player.Character:FindFirstChild('Knife')
                                                    local v477 = player.Backpack:FindFirstChild('Gun') or player.Character and player.Character:FindFirstChild('Gun')
                                                    local Magnitude = (HumanoidRootPart.Position - v464.Position).Magnitude
                                                    local v479 = false

                                                    if not v466 then
                                                        if not v468 then
                                                            if v476 then
                                                                v479 = true
                                                                Magnitude = Magnitude - 1000
                                                            end
                                                            if v477 then
                                                                v479 = true
                                                            end
                                                        elseif v477 or v476 then
                                                            v479 = true
                                                        end
                                                    elseif v476 then
                                                        v479 = true
                                                    end
                                                    if v479 and Magnitude < n5 then
                                                        n5 = Magnitude
                                                        v469 = Character2
                                                    end
                                                end
                                            end
                                        end
                                    end

                                    if not v469 then
                                        for _, player in ipairs(u84:GetPlayers())do
                                            if player ~= u83 and player.Character then
                                                local Character3 = player.Character
                                                local Humanoid = Character3:FindFirstChildOfClass('Humanoid')
                                                local HumanoidRootPart = Character3:FindFirstChild('HumanoidRootPart')

                                                if Humanoid and Humanoid.Health > 0 and HumanoidRootPart then
                                                    local Magnitude = (HumanoidRootPart.Position - v464.Position).Magnitude

                                                    if Magnitude < n5 then
                                                        n5 = Magnitude
                                                        v469 = Character3
                                                    end
                                                end
                                            end
                                        end
                                    end

                                    return v469
                                end

                                return nil
                            end

                            local u87 = LocalPlayer
                            local u88 = Part

                            RenderStepped:Connect(function()
                                local v486 = u86()

                                u82 = v486

                                if v486 then
                                    local Character = u87.Character
                                    local v488 = Character and Character:FindFirstChild('HumanoidRootPart')

                                    if v488 then
                                        local v489 = v486:FindFirstChild('UpperTorso') or (v486:FindFirstChild('Torso') or v486:FindFirstChild('HumanoidRootPart'))
                                        local Humanoid = v486:FindFirstChildOfClass('Humanoid')

                                        if v489 then
                                            local Position = v489.Position
                                            local v492 = (Position - v488.Position).Magnitude / 250

                                            if u13 then
                                                local ok, result = pcall(function()
                                                    return u87:GetNetworkPing()
                                                end)

                                                if ok and result then
                                                    v492 = v492 + result * 0.5
                                                end
                                            end

                                            local AssemblyLinearVelocity = v489.AssemblyLinearVelocity

                                            if Humanoid then
                                                local State = Humanoid:GetState()

                                                if State == Enum.HumanoidStateType.Freefall or State == Enum.HumanoidStateType.Jumping then
                                                    AssemblyLinearVelocity = Vector3.new(AssemblyLinearVelocity.X, AssemblyLinearVelocity.Y * 0.35, AssemblyLinearVelocity.Z)
                                                end
                                            end

                                            u88.CFrame = CFrame.new(Position + AssemblyLinearVelocity * v492)

                                            return
                                        end

                                        return
                                    end

                                    return
                                end
                            end)
                        end

                        local u89 = LocalPlayer
                        local u90 = v18
                        local u91 = Part
                        local u92 = LocalPlayer
                        local u93 = v18
                        local u94 = Players
                        local u95 = LocalPlayer

                        local function u96()
                            local Character = u92.Character

                            if Character then
                                local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart')

                                if HumanoidRootPart then
                                    local v507 = u92.Backpack:FindFirstChild('Knife') or Character:FindFirstChild('Knife')

                                    if v507 then
                                        if Character ~= v507.Parent then
                                            Character.Humanoid:EquipTool(v507)
                                            task.wait(0)
                                        end

                                        local v508 = u82

                                        if not u82 then
                                            local n6 = (1/0)

                                            for _, player in ipairs(u94:GetPlayers())do
                                                if player ~= u92 and player.Character then
                                                    local HumanoidRootPart2 = player.Character:FindFirstChild('HumanoidRootPart')
                                                    local Humanoid = player.Character:FindFirstChildOfClass('Humanoid')

                                                    if HumanoidRootPart2 and Humanoid and Humanoid.Health > 0 then
                                                        local Magnitude = (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude

                                                        if Magnitude < n6 then
                                                            n6 = Magnitude
                                                            v508 = player.Character
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                        if v508 then
                                            local HumanoidRootPart3 = v508:FindFirstChild('HumanoidRootPart')

                                            if HumanoidRootPart3 then
                                                local v516 = v508:FindFirstChild('UpperTorso') or (v508:FindFirstChild('Torso') or HumanoidRootPart3)
                                                local AssemblyLinearVelocity = HumanoidRootPart3.AssemblyLinearVelocity
                                                local Magnitude = (v516.Position - HumanoidRootPart.Position).Magnitude
                                                local n7 = 0

                                                if u13 then
                                                    local ok, result = pcall(function()
                                                        return u92:GetNetworkPing()
                                                    end)

                                                    n7 = ok and result or 0
                                                end

                                                local u522 = v516.Position + Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z) * (Magnitude / 65 + n7 * 0.5)
                                                local _pcall = pcall
                                                local u524 = v507
                                                local u525 = HumanoidRootPart

                                                pcall(function()
                                                    local KnifeThrown = u524:WaitForChild('Events'):WaitForChild('KnifeThrown')
                                                    local cFrame = CFrame.new(u525.Position, u522)
                                                    local v881 = (function(...)
                                                        local t5 = {...}

                                                        t5.n = select('#', ...)

                                                        return t5
                                                    end)(CFrame.new(u522))

                                                    KnifeThrown:FireServer(cFrame, unpack(v881, 1, v881.n))
                                                end)

                                                return
                                            end

                                            return
                                        end

                                        u93:Notify({
                                            Title = 'RuzHub',
                                            Content = tostring('No target found!'),
                                            Duration = 3,
                                            Icon = 'bell',
                                        })

                                        return
                                    end

                                    u93:Notify({
                                        Title = 'RuzHub',
                                        Content = tostring('No knife in inventory!'),
                                        Duration = 3,
                                        Icon = 'bell',
                                    })

                                    return
                                end

                                return
                            end
                        end
                        local function u97()
                            local Character = u89.Character

                            if Character then
                                local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart')

                                if HumanoidRootPart then
                                    local v499 = u89.Backpack:FindFirstChild('Gun') or Character:FindFirstChild('Gun')

                                    if v499 then
                                        if u82 then
                                            if Character ~= v499.Parent then
                                                Character.Humanoid:EquipTool(v499)
                                                task.wait(0)
                                            end

                                            local CFramePosition = u91.CFrame.Position
                                            local v501 = HumanoidRootPart.Position + Vector3.new(0, 1, 0)
                                            local cFrame = CFrame.new(v501, CFramePosition)
                                            local _pcall = pcall
                                            local u504 = v499

                                            pcall(function()
                                                local Shoot = u504:WaitForChild('Shoot')
                                                local v876 = (function(...)
                                                    local t6 = {...}

                                                    t6.n = select('#', ...)

                                                    return t6
                                                end)(CFrame.new(CFramePosition))

                                                Shoot:FireServer(cFrame, unpack(v876, 1, v876.n))
                                            end)

                                            return
                                        end

                                        u90:Notify({
                                            Title = 'RuzHub',
                                            Content = tostring('No target found.'),
                                            Duration = 3,
                                            Icon = 'bell',
                                        })

                                        return
                                    end

                                    u90:Notify({
                                        Title = 'RuzHub',
                                        Content = tostring('No gun in inventory!'),
                                        Duration = 3,
                                        Icon = 'bell',
                                    })

                                    return
                                end

                                return
                            end
                        end

                        function u98()
                            if u95.Character then
                                if not u95.Backpack:FindFirstChild('Knife') and (not u95.Character or not u95.Character:FindFirstChild('Knife')) then
                                    u97()

                                    return
                                end

                                u96()

                                return
                            end
                        end
                    end

                    u99 = false

                    do
                        local u100 = LocalPlayer
                        local u101 = UserInputService
                        local u102 = CurrentCamera
                        local u103 = RunService

                        function u104()
                            if u99 then
                                return
                            end

                            local Character = u100.Character

                            if not Character then
                                return
                            end

                            local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart')

                            if not HumanoidRootPart then
                                return
                            end

                            u99 = true

                            local g539

                            if u101.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
                                local HumanoidRootPartCFrame = HumanoidRootPart.CFrame
                                local v530 = HumanoidRootPartCFrame * CFrame.Angles(0, 3.141592653589793, 0)

                                for i = 1, 4 do
                                    HumanoidRootPart.CFrame = HumanoidRootPartCFrame:Lerp(v530, i / 4)

                                    u103.RenderStepped:Wait()
                                end
                            else
                                local CFrame2 = u102.CFrame
                                local LookVector = CFrame2.LookVector
                                local vector3 = Vector3.new(-LookVector.X, LookVector.Y, -LookVector.Z)
                                local cFrame = CFrame.lookAt(CFrame2.Position, CFrame2.Position + vector3)
                                local n8 = 1
                                local n9 = 5
                                local n10 = 1

                                g539 = nil

                                if false then
                                    if true then
                                        g539 = true
                                    end
                                elseif not (n8 <= n9) then
                                    g539 = true
                                end
                                if not g539 then
                                    if not g539 then
                                        repeat
                                            while true do
                                                u102.CFrame = CFrame2:Lerp(cFrame, n8 / 5)

                                                u103.RenderStepped:Wait()

                                                n8 = n8 + n10

                                                if n10 > 0 then
                                                    break
                                                end
                                                if not (n9 <= n8) then
                                                    g539 = true
                                                end
                                                if g539 then
                                                    break
                                                end
                                            end

                                            if g539 then
                                                break
                                            end
                                        until not (n8 <= n9)
                                    end
                                end
                            end

                            g539 = false

                            task.wait(0.15)

                            u99 = false
                        end

                        u105 = false

                        local u106 = LocalPlayer
                        local u107 = UserInputService
                        local u108 = CurrentCamera
                        local u109 = RunService

                        function u110()
                            local v540 = nil
                            local RenderStepped = nil
                            local v542 = nil
                            local v543 = nil

                            if u105 then
                                return
                            end

                            local Character = u106.Character

                            if not Character then
                                return
                            end

                            local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart')

                            if not HumanoidRootPart then
                                return
                            end

                            local Humanoid = Character:FindFirstChildOfClass('Humanoid')

                            if not Humanoid then
                                return
                            end

                            u105 = true

                            local v547 = u107.MouseBehavior == Enum.MouseBehavior.LockCenter
                            local _, v549, _ = HumanoidRootPart.CFrame:ToEulerAnglesYXZ()
                            local CFrame3 = u108.CFrame
                            local g590 = nil
                            local g566

                            if not v547 then
                                local v552 = v549 - 1.5707963267948966

                                for i = 1, 7 do
                                    local _ = i / 7
                                    local _ = RenderStepped ^ 2
                                    local cFrame = CFrame.new(HumanoidRootPart.Position)
                                    local fromEulerAnglesYXZ = CFrame.fromEulerAnglesYXZ

                                    v543 = v549 + (v552 - v549) * v540
                                    v542 = fromEulerAnglesYXZ(0, v543, 0)
                                    HumanoidRootPart.CFrame = cFrame * v542
                                    RenderStepped = u109.RenderStepped

                                    RenderStepped:Wait()
                                end
                            else
                                local Unit = Vector3.new(CFrame3.LookVector.X, 0, CFrame3.LookVector.Z).Unit
                                local new = Vector3.new
                                local RightVectorX = CFrame3.RightVector.X
                                local RightVectorZ = CFrame3.RightVector.Z
                                local Unit2 = new(RightVectorX, 0, RightVectorZ).Unit
                                local n11 = 1
                                local n12 = 7
                                local n13 = 1

                                g566 = nil

                                if false then
                                    if true then
                                        g566 = true
                                    end
                                elseif not (n11 <= n12) then
                                    g566 = true
                                end
                                if not g566 then
                                    if not g566 then
                                        repeat
                                            while true do
                                                local _ = n11 / 7
                                                local _ = v542 ^ 2
                                                local lookAt = CFrame.lookAt
                                                local CFramePosition = u108.CFrame.Position

                                                v543 = u108.CFrame.Position + Unit:Lerp(Unit2, RightVectorZ).Unit
                                                u108.CFrame = lookAt(CFramePosition, v543)
                                                v542 = u109.RenderStepped

                                                v542:Wait()

                                                n11 = n11 + n13

                                                if n13 > 0 then
                                                    break
                                                end
                                                if not (n12 <= n11) then
                                                    g566 = true
                                                end
                                                if g566 then
                                                    break
                                                end
                                            end

                                            if g566 then
                                                break
                                            end
                                        until not (n11 <= n12)
                                    end
                                end
                            end

                            g566 = false

                            local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity

                            HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(AssemblyLinearVelocity.X, 55, AssemblyLinearVelocity.Z)

                            local _pcall = pcall
                            local u574 = Humanoid

                            pcall(function()
                                u574:ChangeState(Enum.HumanoidStateType.Jumping)
                            end)
                            task.wait(0.12)

                            if not v547 then
                                local _, v576, _ = HumanoidRootPart.CFrame:ToEulerAnglesYXZ()

                                for i = 1, 5 do
                                    local _ = i / 5
                                    local _ = v543 ^ 2

                                    HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position) * CFrame.fromEulerAnglesYXZ(0, v576 + (v549 - v576) * v542, 0)
                                    v543 = u109.RenderStepped

                                    v543:Wait()
                                end
                            else
                                local Unit = Vector3.new(CFrame3.LookVector.X, 0, CFrame3.LookVector.Z).Unit
                                local new = Vector3.new
                                local LookVectorX = u108.CFrame.LookVector.X
                                local CFrame4 = u108.CFrame
                                local LookVectorZ = CFrame4.LookVector.Z
                                local Unit3 = new(LookVectorX, 0, LookVectorZ).Unit
                                local n14 = 1
                                local n15 = 5
                                local n16 = 1

                                if false then
                                    if true then
                                        g590 = true
                                    end
                                elseif not (n14 <= n15) then
                                    g590 = true
                                end
                                if not g590 then
                                    if not g590 then
                                        repeat
                                            while true do
                                                local _ = n14 / 5
                                                local _ = CFrame4 ^ 2

                                                u108.CFrame = CFrame.lookAt(u108.CFrame.Position, u108.CFrame.Position + Unit3:Lerp(Unit, LookVectorZ).Unit)
                                                CFrame4 = u109.RenderStepped

                                                CFrame4:Wait()

                                                n14 = n14 + n16

                                                if n16 > 0 then
                                                    break
                                                end
                                                if not (n15 <= n14) then
                                                    g590 = true
                                                end
                                                if g590 then
                                                    break
                                                end
                                            end

                                            if g590 then
                                                break
                                            end
                                        until not (n14 <= n15)
                                    end
                                end
                            end

                            g590 = false

                            task.wait(0.1)

                            u105 = false
                        end
                    end

                    local spawn = task.spawn
                    local u112 = ReplicatedStorage

                    spawn(function()
                        while true do
                            task.wait(2)
                            pcall(function()
                                u112.Remotes.Extras.ReplicateToy:InvokeServer('FakeBomb')
                                u112.Remotes.Extras.ReplicateToy:InvokeServer('GoldBomb')
                            end)
                        end
                    end)

                    local u113 = LocalPlayer
                    local u114 = v18

                    function v115(p23, p24)
                        local Character = u113.Character

                        if Character then
                            local v596 = u113.Backpack:FindFirstChild(p23) or Character:FindFirstChild(p23)

                            if v596 then
                                local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart')

                                if HumanoidRootPart then
                                    if Character ~= v596.Parent then
                                        Character.Humanoid:EquipTool(v596)
                                        task.wait()
                                    end

                                    local _pcall = pcall
                                    local u599 = v596
                                    local u600 = HumanoidRootPart

                                    pcall(function()
                                        u599.Remote:FireServer(CFrame.new(u600.Position + u600.CFrame.LookVector * 1.5 + Vector3.new(0, -3, 0)), 50)
                                    end)
                                    Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)

                                    HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(HumanoidRootPart.AssemblyLinearVelocity.X, 62, HumanoidRootPart.AssemblyLinearVelocity.Z)

                                    if not p24 then
                                        task.spawn(function()
                                            u10 = true

                                            task.wait(21)

                                            u10 = false
                                        end)

                                        return
                                    end

                                    task.spawn(function()
                                        u9 = true

                                        task.wait(4)

                                        u9 = false
                                    end)

                                    return
                                end

                                return
                            end

                            local v601 = 'No ' .. p23 .. ' found!'

                            u114:Notify({
                                Title = 'RuzHub',
                                Content = tostring(v601),
                                Duration = 3,
                                Icon = 'bell',
                            })

                            return
                        end
                    end

                    u116 = false

                    local u117 = nil
                    local u118 = RunService

                    local function v119(p25)
                        local Humanoid = p25:WaitForChild('Humanoid')

                        if u117 then
                            u117:Disconnect()
                        end

                        local RenderStepped = u118.RenderStepped
                        local u605 = Humanoid

                        u117 = RenderStepped:Connect(function()
                            if u116 then
                                local State = u605:GetState()

                                u605.WalkSpeed = (State == Enum.HumanoidStateType.Jumping or State == Enum.HumanoidStateType.Freefall) and (u605.MoveDirection.Magnitude > 0 and n2) or 16

                                return
                            end

                            u605.WalkSpeed = 16
                        end)
                    end

                    LocalPlayer.CharacterAdded:Connect(v119)

                    if LocalPlayer.Character then
                        task.spawn(v119, LocalPlayer.Character)
                    end

                    u120 = false

                    local u121 = nil

                    n17 = 0.5

                    local u123 = RunService
                    local u124 = CurrentCamera

                    function v125(p26)
                        u120 = p26

                        if not p26 then
                            if u121 then
                                u121:Disconnect()

                                u121 = nil
                            end

                            return
                        end
                        if u121 then
                            u121:Disconnect()
                        end

                        u121 = u123.RenderStepped:Connect(function()
                            u124.CFrame = u124.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, n17, 0, 0, 0, 1)
                        end)
                    end
                end

                u126 = v25
                u127 = v125
                u128 = v18
                u129 = Workspace
                u130 = v18
                u131 = LocalPlayer

                do
                    local t7 = {}
                    local t8 = {
                        name = 'Red',
                        id = '98490421374360',
                        color = Color3.fromRGB(200, 50, 50),
                    }
                    local t9 = {
                        name = 'Pink',
                        id = '95000769820905',
                        color = Color3.fromRGB(220, 100, 180),
                    }
                    local t10 = {
                        name = 'Pink 2',
                        id = '82988835868087',
                        color = Color3.fromRGB(200, 80, 160),
                    }
                    local t11 = {
                        name = 'Green',
                        id = '5036205687',
                        color = Color3.fromRGB(50, 180, 80),
                    }
                    local t12 = {
                        name = 'Black',
                        id = '80807192441609',
                        color = Color3.fromRGB(30, 30, 30),
                    }
                    local t13 = {
                        name = 'Cosmic',
                        id = '77816282467771',
                        color = Color3.fromRGB(80, 40, 160),
                    }
                    local t14 = {
                        name = 'Yellow',
                        id = '2669948520',
                        color = Color3.fromRGB(220, 190, 40),
                    }

                    t7[1] = t8
                    t7[2] = t9
                    t7[3] = t10
                    t7[4] = t11
                    t7[5] = t12
                    t7[6] = t13
                    t7[7] = t14

                    local u140 = nil
                    local u141 = false
                    local u142 = Lighting;

                    (function()
                        local Sky = u142:FindFirstChildOfClass('Sky')

                        if Sky then
                            u140 = {
                                SkyboxBk = Sky.SkyboxBk,
                                SkyboxDn = Sky.SkyboxDn,
                                SkyboxFt = Sky.SkyboxFt,
                                SkyboxLf = Sky.SkyboxLf,
                                SkyboxRt = Sky.SkyboxRt,
                                SkyboxUp = Sky.SkyboxUp,
                            }
                        end
                    end)()

                    local u143 = Lighting
                    local u144 = v18

                    function v145()
                        for _, child in pairs(u143:GetChildren())do
                            if child:IsA('Sky') or child:IsA('Atmosphere') or child:IsA('Clouds') then
                                child:Destroy()
                            end
                        end

                        if u140 then
                            local Sky = Instance.new('Sky', u143)

                            for k, v in pairs(u140)do
                                Sky[k] = v
                            end
                        end

                        u141 = false

                        u144:Notify({
                            Title = 'RuzHub',
                            Content = tostring('Skybox restored to default.'),
                            Duration = 3,
                            Icon = 'bell',
                        })
                    end

                    local u146 = Lighting

                    function u147(p27)
                        for _, child in pairs(u146:GetChildren())do
                            if child:IsA('Sky') or child:IsA('Atmosphere') or child:IsA('Clouds') then
                                child:Destroy()
                            end
                        end

                        local Sky = Instance.new('Sky', u146)

                        Sky.Name = 'RuzHub_CustomSky'

                        local v625 = 'rbxassetid://' .. tostring(p27)

                        Sky.SkyboxBk = v625
                        Sky.SkyboxDn = v625
                        Sky.SkyboxFt = v625
                        Sky.SkyboxLf = v625
                        Sky.SkyboxRt = v625
                        Sky.SkyboxUp = v625
                        Sky.SunTextureId = ''
                        Sky.MoonTextureId = ''
                        Sky.SunAngularSize = 0
                        Sky.StarCount = 0
                        u146.ClockTime = 14
                        u146.Brightness = 2
                        u146.GlobalShadows = false
                        u146.FogEnd = 999999
                        u141 = true
                    end

                    u148 = v18
                    u149 = v145
                    u150 = t7
                    u151 = v21

                    local u152 = false
                    local u153 = nil
                    local u154 = RunService
                    local u155 = LocalPlayer

                    function u156(p28)
                        u152 = p28

                        if not p28 then
                            if u153 then
                                u153:Disconnect()

                                u153 = nil
                            end

                            return
                        end
                        if u153 then
                            u153:Disconnect()
                        end

                        u153 = u154.Heartbeat:Connect(function()
                            if u152 then
                                local Character = u155.Character
                                local v894 = Character and Character:FindFirstChild('HumanoidRootPart')

                                if v894 then
                                    local AssemblyLinearVelocity = v894.AssemblyLinearVelocity

                                    if AssemblyLinearVelocity.Magnitude > n1 then
                                        v894.AssemblyLinearVelocity = AssemblyLinearVelocity.Unit * n1
                                    end
                                end

                                return
                            end
                        end)
                    end
                end

                getgenv().RuzOldPos = nil
                getgenv().RuzFPDH = Workspace.FallenPartsDestroyHeight
                u157 = false

                local u158 = LocalPlayer
                local u159 = v18
                local u160 = Workspace

                local function v161(p29)
                    if not u157 then
                        local Character = u158.Character

                        if Character then
                            local Humanoid = Character:FindFirstChildOfClass('Humanoid')

                            if Humanoid then
                                local RootPart = Humanoid.RootPart

                                if RootPart then
                                    local Character4 = p29.Character

                                    if Character4 then
                                        local Humanoid2 = Character4:FindFirstChildOfClass('Humanoid')
                                        local v663 = Humanoid2 and Humanoid2.RootPart
                                        local Head = Character4:FindFirstChild('Head')
                                        local Accessory = Character4:FindFirstChildOfClass('Accessory')
                                        local v666 = Accessory and Accessory:FindFirstChild('Handle')

                                        if RootPart.Velocity.Magnitude < 50 then
                                            getgenv().RuzOldPos = RootPart.CFrame
                                        end
                                        if not Humanoid2 or not Humanoid2.Sit then
                                            local v667 = Head or (v666 or Humanoid2)

                                            if v667 then
                                                u160.CurrentCamera.CameraSubject = v667
                                            end
                                            if Character4:FindFirstChildWhichIsA('BasePart') then
                                                local u668 = RootPart
                                                local u669 = Character

                                                local function u670(p30, p31, p32)
                                                    u668.CFrame = CFrame.new(p30.Position) * p31 * p32

                                                    local _pcall = pcall
                                                    local u900 = p30
                                                    local u901 = p31
                                                    local u902 = p32

                                                    pcall(function()
                                                        u669:SetPrimaryPartCFrame(CFrame.new(u900.Position) * u901 * u902)
                                                    end)

                                                    u668.Velocity = Vector3.new(90000000, 900000000, 90000000)
                                                    u668.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
                                                end

                                                local u671 = RootPart

                                                u157 = true
                                                u160.FallenPartsDestroyHeight = (0 / 0)

                                                local BodyVelocity = Instance.new('BodyVelocity')

                                                BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                                                BodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
                                                BodyVelocity.Parent = RootPart

                                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                                                local v673 = v663 or (Head or v666)

                                                if not v673 then
                                                    local v674 = p29.Name .. ' \u{2014} no valid fling part.'

                                                    u159:Notify({
                                                        Title = 'RuzHub',
                                                        Content = tostring(v674),
                                                        Duration = 3,
                                                        Icon = 'bell',
                                                    })
                                                else
                                                    (function(p33)
                                                        local v904 = tick() + 2.5
                                                        local n18 = 0

                                                        while u671 and Humanoid2 do
                                                            local Magnitude = p33.Velocity.Magnitude

                                                            if not (Magnitude < 40) then
                                                                local MoveDirection = Humanoid2.MoveDirection
                                                                local WalkSpeed = Humanoid2.WalkSpeed

                                                                u670(p33, CFrame.new(MoveDirection.X * WalkSpeed * 0.12, 3, MoveDirection.Z * WalkSpeed * 0.12), CFrame.Angles(1.5707963267948966, 0, 0))

                                                                u671.Velocity = Vector3.new(900000000, 900000000, 900000000)

                                                                task.wait()
                                                                u670(p33, CFrame.new(-MoveDirection.X * WalkSpeed * 0.06, -3, -MoveDirection.Z * WalkSpeed * 0.06), CFrame.Angles(0, 0, 0))

                                                                u671.Velocity = Vector3.new(900000000, 900000000, 900000000)

                                                                task.wait()
                                                                u670(p33, CFrame.new(MoveDirection.X * WalkSpeed * 0.18, 3, MoveDirection.Z * WalkSpeed * 0.18), CFrame.Angles(1.5707963267948966, 0, 0))

                                                                u671.Velocity = Vector3.new(900000000, 900000000, 900000000)

                                                                task.wait()
                                                                u670(p33, CFrame.new(-MoveDirection.X * WalkSpeed * 0.06, -3, -MoveDirection.Z * WalkSpeed * 0.06), CFrame.Angles(0, 0, 0))

                                                                u671.Velocity = Vector3.new(900000000, 900000000, 900000000)

                                                                task.wait()
                                                            else
                                                                n18 = n18 + 100

                                                                u670(p33, CFrame.new(0, 1.5, 0) + Humanoid2.MoveDirection * Magnitude / 1.25, CFrame.Angles(math.rad(n18), 0, 0))
                                                                task.wait()
                                                                u670(p33, CFrame.new(0, -1.5, 0) + Humanoid2.MoveDirection * Magnitude / 1.25, CFrame.Angles(math.rad(n18), 0, 0))
                                                                task.wait()
                                                                u670(p33, CFrame.new(0, 1.5, 0) + Humanoid2.MoveDirection * Magnitude / 1.25, CFrame.Angles(math.rad(n18), 0, 0))
                                                                task.wait()
                                                                u670(p33, CFrame.new(0, -1.5, 0) + Humanoid2.MoveDirection * Magnitude / 1.25, CFrame.Angles(math.rad(n18), 0, 0))
                                                                task.wait()
                                                                u670(p33, CFrame.new(0, 1.5, 0), CFrame.Angles(math.rad(n18), 0, 0))
                                                                task.wait()
                                                                u670(p33, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(n18), 0, 0))
                                                                task.wait()
                                                            end
                                                            if v904 < tick() then
                                                                return
                                                            end
                                                        end
                                                    end)(v673)
                                                end

                                                BodyVelocity:Destroy()
                                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

                                                u160.CurrentCamera.CameraSubject = Humanoid

                                                if getgenv().RuzOldPos then
                                                    local n19 = 0

                                                    repeat
                                                        n19 = n19 + 1
                                                        RootPart.CFrame = getgenv().RuzOldPos * CFrame.new(0, 0.5, 0)

                                                        local _pcall = pcall
                                                        local u677 = Character

                                                        pcall(function()
                                                            u677:SetPrimaryPartCFrame(getgenv().RuzOldPos * CFrame.new(0, 0.5, 0))
                                                        end)
                                                        Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

                                                        for _, child in ipairs(Character:GetChildren())do
                                                            if child:IsA('BasePart') then
                                                                child.Velocity = Vector3.new()
                                                                child.RotVelocity = Vector3.new()
                                                            end
                                                        end

                                                        task.wait()
                                                    until n19 > 30 or (RootPart.Position - getgenv().RuzOldPos.p).Magnitude < 25

                                                    u160.FallenPartsDestroyHeight = getgenv().RuzFPDH

                                                    u159:Notify({
                                                        Title = 'RuzHub',
                                                        Content = tostring('Returned to previous position.'),
                                                        Duration = 3,
                                                        Icon = 'bell',
                                                    })
                                                end

                                                u157 = false

                                                return
                                            end

                                            return
                                        end

                                        local v680 = p29.Name .. ' is sitting, skipped.'

                                        u159:Notify({
                                            Title = 'RuzHub',
                                            Content = tostring(v680),
                                            Duration = 3,
                                            Icon = 'bell',
                                        })

                                        return
                                    end

                                    return
                                end

                                return
                            end

                            return
                        end

                        return
                    end
                end

                u162 = v18
                u163 = Players
                u164 = LocalPlayer
                u165 = v161
                u166 = v18
                u167 = Players
                u168 = LocalPlayer
                u169 = v161

                local t15 = {
                    GlobalShadows = Lighting.GlobalShadows,
                    Brightness = Lighting.Brightness,
                    Ambient = Lighting.Ambient,
                    OutdoorAmbient = Lighting.OutdoorAmbient,
                }
                local t16 = {}

                u172 = nil
                u173 = Lighting
                u174 = t15
                u175 = Workspace

                function u176(p34)
                    if p34:IsA('BasePart') then
                        if not t16[p34] then
                            t16[p34] = {
                                Material = p34.Material,
                                CastShadow = p34.CastShadow,
                            }
                        end

                        p34.Material = Enum.Material.SmoothPlastic
                        p34.CastShadow = false
                    end
                    if p34:IsA('Decal') or p34:IsA('Texture') then
                        if not t16[p34] then
                            t16[p34] = {
                                Transparency = p34.Transparency,
                            }
                        end

                        p34.Transparency = 1
                    end
                end

                u177 = TextLabel
                u178 = v18

                local u179 = Lighting
                local u180 = t15
                local u181 = TextLabel
                local u182 = v18

                function v183()
                    u15 = false

                    pcall(function()
                        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
                    end)

                    u179.GlobalShadows = u180.GlobalShadows
                    u179.Brightness = u180.Brightness
                    u179.Ambient = u180.Ambient
                    u179.OutdoorAmbient = u180.OutdoorAmbient

                    if u172 then
                        u172:Disconnect()

                        u172 = nil
                    end

                    for k, v in pairs(t16)do
                        if k and k.Parent then
                            local _pcall = pcall
                            local u699 = v
                            local u700 = k

                            pcall(function()
                                for k2, v2 in pairs(u699)do
                                    u700[k2] = v2
                                end
                            end)
                        end
                    end

                    t16 = {}
                    u181.Visible = false

                    u182:Notify({
                        Title = 'RuzHub',
                        Content = tostring('Low Graphics OFF'),
                        Duration = 3,
                        Icon = 'bell',
                    })
                end

                u184 = v183
                u185 = Lighting
                u186 = v18
                u187 = Lighting
                u188 = t15
                u189 = v18
                t17 = {}

                local t18 = {
                    name = 'Neon Cyan',
                    id = '11770890197',
                }
                local t19 = {
                    name = 'Electric Purple',
                    id = '11770691141',
                }
                local t20 = {
                    name = 'Precision Dot',
                    id = '10878218308',
                }
                local t21 = {
                    name = 'Aim Cross',
                    id = '10891594349',
                }
                local t22 = {
                    name = 'Blue Spec',
                    id = '11720475063',
                }
                local t23 = {
                    name = 'Circle Dot',
                    id = '10831379335',
                }
                local t24 = {
                    name = 'Green Hit',
                    id = '8375241602',
                }

                t17[1] = t18
                t17[2] = t19
                t17[3] = t20
                t17[4] = t21
                t17[5] = t22
                t17[6] = t23
                t17[7] = t24
            end

            u198 = false
            u199 = false
            id = t17[1].id
            u201 = nil
            u202 = nil

            local u203 = RunService

            local function v204()
                if u202 then
                    u202:Disconnect()

                    u202 = nil
                end
                if not u199 or not u201 or not u201.Parent then
                    if u201 then
                        u201.Rotation = 0
                    end

                    return
                end

                u202 = u203.RenderStepped:Connect(function()
                    if u201 and u201.Parent and u201.Visible then
                        u201.Rotation = u201.Rotation + 4
                    end
                end)
            end

            u205 = RunService
            u206 = UserInputService
            u207 = LocalPlayer
            u208 = v204
            u209 = v18
            u210 = v204
            u211 = t17
            u212 = v21

            local RuzHub_BtnLayer = game.CoreGui:FindFirstChild('RuzHub_BtnLayer')

            if RuzHub_BtnLayer then
                RuzHub_BtnLayer:Destroy()
            end

            local ScreenGui = Instance.new('ScreenGui', game.CoreGui)

            ScreenGui.Name = 'RuzHub_BtnLayer'
            ScreenGui.ResetOnSpawn = false
            ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            ScreenGui.DisplayOrder = 10

            local u215 = ScreenGui

            t25 = {}

            local u217 = UserInputService

            function u218(p35)
                local u740 = nil
                local p36Position = nil
                local Position = nil
                local InputBegan = p35.InputBegan
                local u744 = p35

                InputBegan:Connect(function(p36)
                    if p36.UserInputType == Enum.UserInputType.MouseButton1 or p36.UserInputType == Enum.UserInputType.Touch then
                        u740 = true
                        p36Position = p36.Position
                        Position = u744.Position
                    end
                end)

                local InputChanged = p35.InputChanged
                local u746 = p35

                InputChanged:Connect(function(p37)
                    if u740 then
                        if p37.UserInputType == Enum.UserInputType.MouseMovement or p37.UserInputType == Enum.UserInputType.Touch then
                            local v923 = p37.Position - p36Position

                            u746.Position = UDim2.new(Position.X.Scale, Position.X.Offset + v923.X, Position.Y.Scale, Position.Y.Offset + v923.Y)
                        end

                        return
                    end
                end)
                u217.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        u740 = false
                    end
                end)
            end

            local u219 = t25

            function v220(p38, p39, p40, p41, p42)
                if u219[p38] then
                    u219[p38].btn:Destroy()

                    u219[p38] = nil
                end

                local TextButton = Instance.new('TextButton', u215)

                TextButton.Name = 'RuzBtn_' .. p38
                TextButton.Size = p40
                TextButton.Position = p39
                TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                TextButton.BackgroundTransparency = 0.6
                TextButton.Text = ''
                TextButton.AutoButtonColor = false
                TextButton.BorderSizePixel = 0
                Instance.new('UICorner', TextButton).CornerRadius = UDim.new(0, p40.Y.Offset * 0.2)

                local UIStroke = Instance.new('UIStroke', TextButton)

                UIStroke.Color = p41
                UIStroke.Thickness = 1.3
                UIStroke.Transparency = 0.5
                UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                local TextLabel = Instance.new('TextLabel', TextButton)

                TextLabel.Name = 'Lbl'
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Text = p42
                TextLabel.TextColor3 = p41
                TextLabel.Font = Enum.Font.GothamBold

                local v755 = p40.Y.Offset * 0.14

                TextLabel.TextSize = math.max(10, v755)
                TextLabel.TextYAlignment = Enum.TextYAlignment.Center
                TextLabel.TextXAlignment = Enum.TextXAlignment.Center

                u218(TextButton)

                u219[p38] = {
                    btn = TextButton,
                    stroke = UIStroke,
                    lbl = TextLabel,
                }

                return u219[p38]
            end

            local u221 = RunService

            function u222(p43, p44)
                local YOffset = p43.btn.Size.Y.Offset
                local v759 = YOffset * 0.55
                local v760 = math.floor(v759)
                local ImageLabel = Instance.new('ImageLabel', p43.btn)

                ImageLabel.Name = 'SpinImg'
                ImageLabel.Size = UDim2.new(0, v760, 0, v760)
                ImageLabel.Position = UDim2.new(0.5, -v760 / 2, 0.5, -v760 / 2)
                ImageLabel.BackgroundTransparency = 1
                ImageLabel.Image = 'rbxassetid://' .. tostring(p44)
                p43.img = ImageLabel
                p43.lbl.Size = UDim2.new(1, 0, 0.28, 0)
                p43.lbl.Position = UDim2.new(0, 0, 0.72, 0)

                local lbl = p43.lbl
                local v763 = YOffset * 0.12

                lbl.TextSize = math.max(9, v763)

                local spawn = task.spawn
                local u765 = ImageLabel

                spawn(function()
                    while u765 and u765.Parent do
                        u765.Rotation = u765.Rotation + 4

                        u221.RenderStepped:Wait()
                    end
                end)

                return ImageLabel
            end

            uDim2_2 = UDim2.new(0, 88, 0, 88)
            uDim2 = UDim2.new(0, 56, 0, 56)
            t26 = {
                GoldBomb = UDim2.new(0.5, -210, 0.78, 0),
                NormalBomb = UDim2.new(0.5, -110, 0.78, 0),
                Shoot = UDim2.new(0.5, -10, 0.78, 0),
                ESP = UDim2.new(0.5, 90, 0.78, 16),
                Flick = UDim2.new(0.5, 154, 0.78, 16),
                Speed = UDim2.new(0.5, -278, 0.78, 16),
                Stretch = UDim2.new(0.5, -214, 0.78, 16),
                GrabGun = UDim2.new(0.5, 90, 0.68, 16),
                WallHop = UDim2.new(0.5, 154, 0.68, 16),
                FlingMurderer = UDim2.new(0.5, -278, 0.68, 16),
                FlingSheriff = UDim2.new(0.5, -214, 0.68, 16),
            }

            local u226 = t25
            local u227 = v220
            local u228 = t26
            local u229 = uDim2_2
            local u230 = v18
            local u231 = v115

            function v232(p45)
                if p45 then
                    u227('GoldBomb', u228.GoldBomb, u229, Color3.fromRGB(255, 215, 0), 'GOLD\nJUMP')
                    u226.GoldBomb.btn.MouseButton1Click:Connect(function()
                        if not u9 then
                            u231('GoldBomb', true)

                            return
                        end

                        u230:Notify({
                            Title = 'RuzHub',
                            Content = tostring('Gold Bomb on cooldown.'),
                            Duration = 3,
                            Icon = 'bell',
                        })
                    end)

                    return
                end
                if u226.GoldBomb then
                    u226.GoldBomb.btn:Destroy()

                    u226.GoldBomb = nil
                end
            end

            local u233 = t25
            local u234 = v220
            local u235 = t26
            local u236 = uDim2_2
            local u237 = v18
            local u238 = v115

            function v239(p46)
                if p46 then
                    u234('NormalBomb', u235.NormalBomb, u236, Color3.fromRGB(0, 170, 255), 'NORMAL\nJUMP')
                    u233.NormalBomb.btn.MouseButton1Click:Connect(function()
                        if not u10 then
                            u238('FakeBomb', false)

                            return
                        end

                        u237:Notify({
                            Title = 'RuzHub',
                            Content = tostring('Normal Bomb on cooldown.'),
                            Duration = 3,
                            Icon = 'bell',
                        })
                    end)

                    return
                end
                if u233.NormalBomb then
                    u233.NormalBomb.btn:Destroy()

                    u233.NormalBomb = nil
                end
            end
        end

        local u240 = t25
        local u241 = v220
        local u242 = t26
        local u243 = uDim2_2

        function v244(p47)
            if p47 then
                local v769 = u241('Shoot', u242.Shoot, u243, Color3.fromRGB(255, 255, 255), 'SHOOT')

                u222(v769, 5159914132)
                v769.btn.MouseButton1Click:Connect(u98)

                return
            end
            if u240.Shoot then
                u240.Shoot.btn:Destroy()

                u240.Shoot = nil
            end
        end

        local u245 = t25
        local u246 = v220
        local u247 = t26
        local u248 = uDim2
        local u249 = v78
        local u250 = v68
        local u251 = v18

        function u252(p48)
            if p48 then
                u246('ESP', u247.ESP, u248, Color3.fromRGB(10, 140, 30), 'ESP\nOFF')
                u245.ESP.btn.MouseButton1Click:Connect(function()
                    local v926 = not u61

                    u61 = v926

                    if not v926 then
                        if u62 then
                            u62:Disconnect()

                            u62 = nil
                        end

                        task.delay(0.1, u250)
                    else
                        u249()
                    end

                    local v927 = u61 and 'ESP ON' or 'ESP OFF'

                    u251:Notify({
                        Title = 'RuzHub',
                        Content = tostring(v927),
                        Duration = 3,
                        Icon = 'bell',
                    })
                end)

                return
            end
            if u245.ESP then
                u245.ESP.btn:Destroy()

                u245.ESP = nil
            end
        end

        local u253 = t25
        local u254 = v220
        local u255 = t26
        local u256 = uDim2

        function u257(p49)
            if p49 then
                u254('Flick', u255.Flick, u256, Color3.fromRGB(180, 50, 255), 'FLICK')
                u253.Flick.btn.MouseButton1Click:Connect(u104)

                return
            end
            if u253.Flick then
                u253.Flick.btn:Destroy()

                u253.Flick = nil
            end
        end

        local u258 = t25
        local u259 = v220
        local u260 = t26
        local u261 = uDim2
        local u262 = v18

        function u263(p50)
            if p50 then
                u259('Speed', u260.Speed, u261, Color3.fromRGB(0, 140, 120), 'SPEED')
                u258.Speed.btn.MouseButton1Click:Connect(function()
                    u116 = not u116

                    local v928 = u116 and 'Speed Glitch ON' or 'Speed Glitch OFF'

                    u262:Notify({
                        Title = 'RuzHub',
                        Content = tostring(v928),
                        Duration = 3,
                        Icon = 'bell',
                    })
                end)

                return
            end
            if u258.Speed then
                u258.Speed.btn:Destroy()

                u258.Speed = nil
            end
        end

        local u264 = t25
        local u265 = v220
        local u266 = t26
        local u267 = uDim2
        local u268 = v125
        local u269 = v18

        function u270(p51)
            if p51 then
                u265('Stretch', u266.Stretch, u267, Color3.fromRGB(200, 80, 0), 'STRETCH')
                u264.Stretch.btn.MouseButton1Click:Connect(function()
                    u120 = not u120

                    u268(u120)

                    local v929 = u120 and 'Stretch ON' or 'Stretch OFF'

                    u269:Notify({
                        Title = 'RuzHub',
                        Content = tostring(v929),
                        Duration = 3,
                        Icon = 'bell',
                    })
                end)

                return
            end
            if u264.Stretch then
                u264.Stretch.btn:Destroy()

                u264.Stretch = nil
            end
        end
    end

    local u271 = t25
    local u272 = v220
    local u273 = t26
    local u274 = uDim2

    local function u275()
        local GunDrop = u129:FindFirstChild('GunDrop', true)

        if GunDrop then
            local Character = u131.Character
            local v611 = Character and Character:FindFirstChild('HumanoidRootPart')

            if v611 then
                local v613

                if not GunDrop:IsA('BasePart') then
                    local v612 = GunDrop:FindFirstChild('Handle') or (GunDrop:FindFirstChildWhichIsA('BasePart') or GunDrop.PrimaryPart)

                    v613 = v612 and v612.Position or GunDrop:GetModelCFrame().Position
                else
                    v613 = GunDrop.Position
                end
                if v613 then
                    local CFrame5 = v611.CFrame

                    v611.CFrame = CFrame.new(v613 + Vector3.new(0, 2, 0))

                    task.wait(0.2)

                    v611.CFrame = CFrame5

                    u130:Notify({
                        Title = 'RuzHub',
                        Content = tostring('Teleported to gun!'),
                        Duration = 3,
                        Icon = 'bell',
                    })

                    return
                end

                u130:Notify({
                    Title = 'RuzHub',
                    Content = tostring('Gun position not found!'),
                    Duration = 3,
                    Icon = 'bell',
                })

                return
            end

            return
        end

        u130:Notify({
            Title = 'RuzHub',
            Content = tostring('No gun on map!'),
            Duration = 3,
            Icon = 'bell',
        })
    end

    function u276(p52)
        if p52 then
            u272('GrabGun', u273.GrabGun, u274, Color3.fromRGB(200, 120, 0), 'GRAB\nGUN')
            u271.GrabGun.btn.MouseButton1Click:Connect(u275)

            return
        end
        if u271.GrabGun then
            u271.GrabGun.btn:Destroy()

            u271.GrabGun = nil
        end
    end

    local u277 = t25
    local u278 = v220
    local u279 = t26
    local u280 = uDim2

    function u281(p53)
        if p53 then
            u278('WallHop', u279.WallHop, u280, Color3.fromRGB(0, 210, 210), 'WALL\nHOP')
            u277.WallHop.btn.MouseButton1Click:Connect(u110)

            return
        end
        if u277.WallHop then
            u277.WallHop.btn:Destroy()

            u277.WallHop = nil
        end
    end

    local u282 = t25
    local u283 = v220
    local u284 = t26
    local u285 = uDim2

    local function u286()
        if not u157 then
            for _, player in ipairs(u163:GetPlayers())do
                if player ~= u164 and player.Character and (player.Backpack:FindFirstChild('Knife') or player.Character and player.Character:FindFirstChild('Knife')) then
                    local Humanoid = player.Character:FindFirstChildOfClass('Humanoid')

                    if Humanoid and Humanoid.Health > 0 then
                        local v684 = 'Flinging: ' .. player.Name

                        u162:Notify({
                            Title = 'RuzHub',
                            Content = tostring(v684),
                            Duration = 3,
                            Icon = 'bell',
                        })
                        task.spawn(u165, player)

                        return
                    end
                end
            end

            u162:Notify({
                Title = 'RuzHub',
                Content = tostring('No knife player found!'),
                Duration = 3,
                Icon = 'bell',
            })

            return
        end

        u162:Notify({
            Title = 'RuzHub',
            Content = tostring('Fling in progress...'),
            Duration = 3,
            Icon = 'bell',
        })
    end

    function u287(p54)
        if p54 then
            u283('FlingMurderer', u284.FlingMurderer, u285, Color3.fromRGB(255, 50, 50), 'FLING\nMURD')
            u282.FlingMurderer.btn.MouseButton1Click:Connect(u286)

            return
        end
        if u282.FlingMurderer then
            u282.FlingMurderer.btn:Destroy()

            u282.FlingMurderer = nil
        end
    end

    local u288 = t25
    local u289 = v220
    local u290 = t26
    local u291 = uDim2

    local function u292()
        if not u157 then
            for _, player in ipairs(u167:GetPlayers())do
                if player ~= u168 and player.Character and (player.Backpack:FindFirstChild('Gun') or player.Character and player.Character:FindFirstChild('Gun')) then
                    local Humanoid = player.Character:FindFirstChildOfClass('Humanoid')

                    if Humanoid and Humanoid.Health > 0 then
                        local v688 = 'Flinging: ' .. player.Name

                        u166:Notify({
                            Title = 'RuzHub',
                            Content = tostring(v688),
                            Duration = 3,
                            Icon = 'bell',
                        })
                        task.spawn(u169, player)

                        return
                    end
                end
            end

            u166:Notify({
                Title = 'RuzHub',
                Content = tostring('No gun player found!'),
                Duration = 3,
                Icon = 'bell',
            })

            return
        end

        u166:Notify({
            Title = 'RuzHub',
            Content = tostring('Fling in progress...'),
            Duration = 3,
            Icon = 'bell',
        })
    end

    function u293(p55)
        if p55 then
            u289('FlingSheriff', u290.FlingSheriff, u291, Color3.fromRGB(40, 130, 255), 'FLING\nSHERIF')
            u288.FlingSheriff.btn.MouseButton1Click:Connect(u292)

            return
        end
        if u288.FlingSheriff then
            u288.FlingSheriff.btn:Destroy()

            u288.FlingSheriff = nil
        end
    end

    local Heartbeat = RunService.Heartbeat
    local u295 = t25
    local u296 = LocalPlayer
    local u297 = UserInputService
    local u298 = Workspace
    local u299 = Players

    Heartbeat:Connect(function()
        if u295.GoldBomb then
            u295.GoldBomb.lbl.Text = u9 and 'WAIT...' or 'GOLD\nJUMP'
        end
        if u295.NormalBomb then
            u295.NormalBomb.lbl.Text = u10 and 'WAIT...' or 'NORMAL\nJUMP'
        end
        if u295.Shoot and u295.Shoot.img then
            local v779 = u296.Backpack:FindFirstChild('Knife') or u296.Character and u296.Character:FindFirstChild('Knife')

            u295.Shoot.img.Image = v779 and 'rbxassetid://9695655416' or 'rbxassetid://5159914132'
            u295.Shoot.lbl.Text = v779 and 'THROW' or 'SHOOT'
        end
        if u295.ESP then
            local v780 = u61 and Color3.fromRGB(50, 220, 80) or Color3.fromRGB(10, 140, 30)

            u295.ESP.lbl.Text = u61 and 'ESP\nON' or 'ESP\nOFF'
            u295.ESP.lbl.TextColor3 = v780
            u295.ESP.stroke.Color = v780
        end
        if u295.Flick then
            local v781 = u297.MouseBehavior == Enum.MouseBehavior.LockCenter
            local v782 = u99 and Color3.fromRGB(255, 120, 0) or (v781 and Color3.fromRGB(120, 200, 255) or Color3.fromRGB(180, 50, 255))

            u295.Flick.lbl.Text = u99 and 'WAIT...' or 'FLICK'
            u295.Flick.lbl.TextColor3 = v782
            u295.Flick.stroke.Color = v782
        end
        if u295.WallHop then
            local v783 = u297.MouseBehavior == Enum.MouseBehavior.LockCenter
            local v784 = u105 and Color3.fromRGB(255, 120, 0) or (v783 and Color3.fromRGB(0, 255, 220) or Color3.fromRGB(0, 210, 210))

            u295.WallHop.lbl.Text = u105 and 'WAIT...' or 'WALL\nHOP'
            u295.WallHop.lbl.TextColor3 = v784
            u295.WallHop.stroke.Color = v784
        end
        if u295.Speed then
            local v785 = u116 and Color3.fromRGB(0, 220, 200) or Color3.fromRGB(0, 140, 120)

            u295.Speed.lbl.Text = u116 and 'SPEED\nON' or 'SPEED'
            u295.Speed.lbl.TextColor3 = v785
            u295.Speed.stroke.Color = v785
        end
        if u295.Stretch then
            local v786 = u120 and Color3.fromRGB(255, 140, 30) or Color3.fromRGB(200, 80, 0)

            u295.Stretch.lbl.Text = u120 and 'STRETCH\nON' or 'STRETCH'
            u295.Stretch.lbl.TextColor3 = v786
            u295.Stretch.stroke.Color = v786
        end
        if u295.GrabGun then
            local GunDrop = u298:FindFirstChild('GunDrop', true)
            local v788 = GunDrop and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(200, 100, 0)

            u295.GrabGun.lbl.Text = GunDrop and 'GRAB\nGUN' or 'NO\nGUN'
            u295.GrabGun.lbl.TextColor3 = v788
            u295.GrabGun.stroke.Color = v788
        end
        if u295.FlingMurderer then
            local v789 = false

            for _, player in ipairs(u299:GetPlayers())do
                if player ~= u296 and (player.Backpack:FindFirstChild('Knife') or player.Character and player.Character:FindFirstChild('Knife')) then
                    v789 = true

                    break
                end
            end

            local v792 = u157 and Color3.fromRGB(255, 180, 0) or (v789 and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(200, 20, 20))

            u295.FlingMurderer.lbl.Text = u157 and 'FLING...' or (v789 and 'FLING\nMURD' or 'NO\nMURD')
            u295.FlingMurderer.lbl.TextColor3 = v792
            u295.FlingMurderer.stroke.Color = v792
        end
        if u295.FlingSheriff then
            local v793 = false

            for _, player in ipairs(u299:GetPlayers())do
                if player ~= u296 and (player.Backpack:FindFirstChild('Gun') or player.Character and player.Character:FindFirstChild('Gun')) then
                    v793 = true

                    break
                end
            end

            local v796 = u157 and Color3.fromRGB(255, 180, 0) or (v793 and Color3.fromRGB(40, 130, 255) or Color3.fromRGB(10, 80, 200))

            u295.FlingSheriff.lbl.Text = u157 and 'FLING...' or (v793 and 'FLING\nSHERIF' or 'NO\nSHERIF')
            u295.FlingSheriff.lbl.TextColor3 = v796
            u295.FlingSheriff.stroke.Color = v796
        end
    end)
    v18:Popup({
        Title = 'RuzHub Mmv And Mm2',
        Icon = 'sparkles',
        Content = 'v7.3 loaded!\nBombs and Shoot auto-loaded.\nOpen menu to configure everything.',
        Buttons = {
            {
                Title = 'Start',
                Icon = 'arrow-right',
                Variant = 'Primary',
                Callback = function() end,
            },
        },
    })

    local v300 = v18:CreateWindow({
        Title = 'RuzHub',
        Icon = 'sparkles',
        Author = 'Mmv And Mm2',
        Folder = 'RuzHub',
        Size = UDim2.fromOffset(700, 550),
        Theme = 'Crimson',
        Acrylic = false,
        HideSearchBar = false,
        OpenButton = {
            Title = 'RuzHub',
            CornerRadius = UDim.new(1, 0),
            StrokeThickness = 2,
            Enabled = true,
            OnlyMobile = false,
            Color = ColorSequence.new(Color3.fromHex('#dc2626'), Color3.fromHex('#991b1b')),
        },
    }):Section({
        Title = 'RuzHub',
        Opened = true,
    })

    v301 = v300:Tab({
        Title = 'Main',
        Icon = 'zap',
    })
    v302 = v300:Tab({
        Title = 'ESP',
        Icon = 'eye',
    })

    v301:Paragraph({
        Title = 'Auto-Loaded Buttons',
        Content = 'Gold Bomb, Normal Bomb and Shoot/Throw are enabled by default.',
    })

    local t27 = {
        Title = 'Show Gold Bomb',
        Default = true,
    }
    local u304 = v232

    function t27.Callback(p56)
        u304(p56)
    end

    v301:Toggle(t27)

    local t28 = {
        Title = 'Show Normal Bomb',
        Default = true,
    }
    local u306 = v239

    function t28.Callback(p57)
        u306(p57)
    end

    v301:Toggle(t28)

    local t29 = {
        Title = 'Show Shoot/Throw',
        Default = true,
    }
    local u308 = v244

    function t29.Callback(p58)
        u308(p58)
    end

    v301:Toggle(t29)
end

v301:Divider()
v301:Paragraph({
    Title = 'Optional Buttons',
    Content = 'Toggle to add or remove from screen.',
})
v301:Toggle({
    Title = 'Load ESP Toggle',
    Default = false,
    Callback = function(p59)
        u252(p59)
    end,
})
v301:Toggle({
    Title = 'Load Flick',
    Default = false,
    Callback = function(p60)
        u257(p60)
    end,
})
v301:Toggle({
    Title = 'Load Grab Gun',
    Default = false,
    Callback = function(p61)
        u276(p61)
    end,
})
v301:Toggle({
    Title = 'Load Speed Glitch',
    Default = false,
    Callback = function(p62)
        u263(p62)
    end,
})
v301:Toggle({
    Title = 'Load Stretch',
    Default = false,
    Callback = function(p63)
        u270(p63)
    end,
})
v301:Button({
    Title = 'Stretch Resolution Slider',
    Description = '10% = very wide  /  100% = normal',
    Callback = function()
        local v607 = n17 * 100
        local v608 = math.round(v607)

        u126('Stretch Resolution', 10, 100, v608, 5, function(p64)
            n17 = p64 / 100

            if u120 then
                u127(true)
            end

            local v886 = 'Stretch set to ' .. p64 .. '%  (1.0 = normal)'

            u128:Notify({
                Title = 'RuzHub',
                Content = tostring(v886),
                Duration = 3,
                Icon = 'bell',
            })
        end, function()
            n17 = 0.5

            if u120 then
                u127(true)
            end

            u128:Notify({
                Title = 'RuzHub',
                Content = tostring('Stretch reset to 50%'),
                Duration = 3,
                Icon = 'bell',
            })
        end)
    end,
})
v301:Toggle({
    Title = 'Load Fling Murderer',
    Default = false,
    Callback = function(p65)
        u287(p65)
    end,
})
v301:Toggle({
    Title = 'Load Fling Sheriff',
    Default = false,
    Callback = function(p66)
        u293(p66)
    end,
})
v301:Toggle({
    Title = 'Load Wall Hop',
    Default = false,
    Callback = function(p67)
        u281(p67)
    end,
})
v301:Divider()
v301:Paragraph({
    Title = 'Skybox',
    Content = 'Click the button below to open the visual skybox picker.\nSelecting a preset applies it instantly.',
})
v301:Button({
    Title = 'Open Skybox Picker',
    Description = 'Color preview list \u{2014} click to apply instantly',
    Callback = function()
        local RuzSkyboxPicker = game.CoreGui:FindFirstChild('RuzSkyboxPicker')

        if not RuzSkyboxPicker then
            local ScreenGui = Instance.new('ScreenGui', game.CoreGui)

            ScreenGui.Name = 'RuzSkyboxPicker'
            ScreenGui.ResetOnSpawn = false
            ScreenGui.DisplayOrder = 62

            local Frame = Instance.new('Frame', ScreenGui)

            Frame.Size = UDim2.new(0, 310, 0, 420)
            Frame.Position = UDim2.new(0.5, -155, 0.04, 0)
            Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            Frame.BackgroundTransparency = 0.06
            Frame.BorderSizePixel = 0
            Instance.new('UICorner', Frame).CornerRadius = UDim.new(0, 12)

            local UIStroke = Instance.new('UIStroke', Frame)

            UIStroke.Color = Color3.fromRGB(220, 38, 38)
            UIStroke.Thickness = 1.5

            local TextLabel = Instance.new('TextLabel', Frame)

            TextLabel.Size = UDim2.new(1, -44, 0, 38)
            TextLabel.Position = UDim2.new(0, 12, 0, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Text = 'RuzHub  \u{2014}  Skybox Picker'
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.Font = Enum.Font.GothamBold
            TextLabel.TextSize = 14
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left

            local TextButton = Instance.new('TextButton', Frame)

            TextButton.Size = UDim2.new(0, 28, 0, 28)
            TextButton.Position = UDim2.new(1, -34, 0, 5)
            TextButton.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
            TextButton.Text = 'X'
            TextButton.TextColor3 = Color3.new(1, 1, 1)
            TextButton.Font = Enum.Font.GothamBold
            TextButton.TextSize = 13
            Instance.new('UICorner', TextButton).CornerRadius = UDim.new(0, 6)

            local MouseButton1Click = TextButton.MouseButton1Click
            local u633 = ScreenGui

            MouseButton1Click:Connect(function()
                u633:Destroy()
            end)

            local TextBox = Instance.new('TextBox', Frame)

            TextBox.Size = UDim2.new(1, -20, 0, 34)
            TextBox.Position = UDim2.new(0, 10, 0, 44)
            TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            TextBox.Text = ''
            TextBox.PlaceholderText = 'Enter custom Skybox ID, press Enter...'
            TextBox.TextColor3 = Color3.new(1, 1, 1)
            TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
            TextBox.Font = Enum.Font.Gotham
            TextBox.TextSize = 13
            TextBox.ClearTextOnFocus = false
            Instance.new('UICorner', TextBox).CornerRadius = UDim.new(0, 6)
            Instance.new('UIStroke', TextBox).Color = Color3.fromRGB(80, 80, 80)

            local FocusLost = TextBox.FocusLost
            local u636 = TextBox

            FocusLost:Connect(function(p68)
                if p68 and u636.Text ~= '' then
                    u147(u636.Text)

                    local v888 = 'Custom skybox applied \u{2014} ID: ' .. u636.Text

                    u148:Notify({
                        Title = 'RuzHub',
                        Content = tostring(v888),
                        Duration = 3,
                        Icon = 'bell',
                    })

                    u636.Text = ''
                end
            end)

            local TextButton5 = Instance.new('TextButton', Frame)

            TextButton5.Size = UDim2.new(1, -20, 0, 28)
            TextButton5.Position = UDim2.new(0, 10, 0, 84)
            TextButton5.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            TextButton5.Text = 'Restore Default Sky'
            TextButton5.TextColor3 = Color3.fromRGB(200, 200, 200)
            TextButton5.Font = Enum.Font.GothamBold
            TextButton5.TextSize = 12
            Instance.new('UICorner', TextButton5).CornerRadius = UDim.new(0, 6)

            local MouseButton1Click4 = TextButton5.MouseButton1Click
            local u639 = ScreenGui

            MouseButton1Click4:Connect(function()
                u149()
                u639:Destroy()
            end)

            local Frame5 = Instance.new('Frame', Frame)

            Frame5.Size = UDim2.new(1, -20, 0, 1)
            Frame5.Position = UDim2.new(0, 10, 0, 118)
            Frame5.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Frame5.BorderSizePixel = 0

            local ScrollingFrame = Instance.new('ScrollingFrame', Frame)

            ScrollingFrame.Size = UDim2.new(1, -14, 1, -126)
            ScrollingFrame.Position = UDim2.new(0, 7, 0, 124)
            ScrollingFrame.BackgroundTransparency = 1
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.ScrollBarThickness = 4
            ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #u150 * 56)

            local UIListLayout = Instance.new('UIListLayout', ScrollingFrame)

            UIListLayout.Padding = UDim.new(0, 6)
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

            for i, v in ipairs(u150)do
                local TextButton6 = Instance.new('TextButton', ScrollingFrame)

                TextButton6.Size = UDim2.new(1, -8, 0, 48)
                TextButton6.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                TextButton6.Text = ''
                TextButton6.AutoButtonColor = false
                TextButton6.LayoutOrder = i
                Instance.new('UICorner', TextButton6).CornerRadius = UDim.new(0, 8)

                local UIStroke2 = Instance.new('UIStroke', TextButton6)

                UIStroke2.Color = v.color
                UIStroke2.Thickness = 1

                local Frame6 = Instance.new('Frame', TextButton6)

                Frame6.Size = UDim2.new(0, 34, 0, 34)
                Frame6.Position = UDim2.new(0, 8, 0.5, -17)
                Frame6.BackgroundColor3 = v.color
                Frame6.BorderSizePixel = 0
                Instance.new('UICorner', Frame6).CornerRadius = UDim.new(0, 6)

                local TextLabel5 = Instance.new('TextLabel', TextButton6)

                TextLabel5.Size = UDim2.new(1, -58, 0, 22)
                TextLabel5.Position = UDim2.new(0, 50, 0, 6)
                TextLabel5.BackgroundTransparency = 1
                TextLabel5.Text = v.name
                TextLabel5.TextColor3 = Color3.fromRGB(210, 210, 210)
                TextLabel5.Font = Enum.Font.GothamBold
                TextLabel5.TextSize = 14
                TextLabel5.TextXAlignment = Enum.TextXAlignment.Left

                local TextLabel6 = Instance.new('TextLabel', TextButton6)

                TextLabel6.Size = UDim2.new(1, -58, 0, 14)
                TextLabel6.Position = UDim2.new(0, 50, 1, -18)
                TextLabel6.BackgroundTransparency = 1
                TextLabel6.Text = 'ID: ' .. v.id
                TextLabel6.TextColor3 = Color3.fromRGB(100, 100, 100)
                TextLabel6.Font = Enum.Font.Gotham
                TextLabel6.TextSize = 10
                TextLabel6.TextXAlignment = Enum.TextXAlignment.Left

                local MouseButton1Click5 = TextButton6.MouseButton1Click
                local u651 = v
                local u652 = ScrollingFrame
                local u653 = UIStroke2
                local u654 = TextButton6
                local u655 = TextLabel5

                MouseButton1Click5:Connect(function()
                    u147(u651.id)

                    local v889 = 'Skybox applied: ' .. u651.name

                    u148:Notify({
                        Title = 'RuzHub',
                        Content = tostring(v889),
                        Duration = 3,
                        Icon = 'bell',
                    })

                    for _, child in ipairs(u652:GetChildren())do
                        if child:IsA('TextButton') then
                            local UIStroke3 = child:FindFirstChildOfClass('UIStroke')

                            if UIStroke3 then
                                UIStroke3.Thickness = 1
                                UIStroke3.Color = Color3.fromRGB(80, 80, 80)
                            end

                            child.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        end
                    end

                    u653.Thickness = 2
                    u653.Color = Color3.fromRGB(220, 38, 38)
                    u654.BackgroundColor3 = Color3.fromRGB(50, 15, 15)
                    u655.TextColor3 = Color3.fromRGB(255, 80, 80)
                end)
            end

            u151(Frame)

            return
        end

        RuzSkyboxPicker:Destroy()
    end,
})

local t30 = {
    Title = 'Restore Default Sky',
}
local u310 = v145

function t30.Callback()
    u310()
end

v301:Button(t30)
v301:Divider()
v301:Paragraph({
    Title = 'Crosshair',
    Content = 'Visible only when ShiftLock is active.\nSpin option is inside the picker.',
})

local t31 = {
    Title = 'Enable Custom Crosshair',
    Description = 'Visible only while ShiftLock is on',
    Default = false,
}

local function u312()
    local RuzCrosshairDisplay = game.CoreGui:FindFirstChild('RuzCrosshairDisplay')

    if RuzCrosshairDisplay then
        RuzCrosshairDisplay:Destroy()
    end
    if u202 then
        u202:Disconnect()

        u202 = nil
    end

    local ScreenGui = Instance.new('ScreenGui', game.CoreGui)

    ScreenGui.Name = 'RuzCrosshairDisplay'
    ScreenGui.ResetOnSpawn = false
    ScreenGui.DisplayOrder = 25
    ScreenGui.IgnoreGuiInset = true
    u201 = Instance.new('ImageLabel', ScreenGui)
    u201.AnchorPoint = Vector2.new(0.5, 0.5)
    u201.Position = UDim2.new(0.5, 0, 0.5, 0)
    u201.Size = UDim2.new(0, 42, 0, 42)
    u201.BackgroundTransparency = 1
    u201.Image = 'rbxassetid://' .. id
    u201.ZIndex = 10
    u201.Visible = false

    u205.RenderStepped:Connect(function()
        if u201 and u201.Parent then
            local v914 = u206.MouseBehavior == Enum.MouseBehavior.LockCenter
            local PlayerGui = u207:FindFirstChild('PlayerGui')

            if PlayerGui then
                local GameTopbar = PlayerGui:FindFirstChild('GameTopbar')

                if GameTopbar and GameTopbar:FindFirstChild('Crosshair') then
                    GameTopbar.Crosshair.Visible = false
                end
            end

            local v917 = u198 and (v914 or false)

            u201.Visible = v917
            u206.MouseIconEnabled = not v917

            return
        end
    end)
    u208()
end

local u313 = v18
local u314 = UserInputService

function t31.Callback(p69)
    u198 = p69

    if not p69 then
        local RuzCrosshairDisplay = game.CoreGui:FindFirstChild('RuzCrosshairDisplay')

        if RuzCrosshairDisplay then
            RuzCrosshairDisplay:Destroy()

            u201 = nil
        end
        if u202 then
            u202:Disconnect()

            u202 = nil
        end

        u314.MouseIconEnabled = true

        u313:Notify({
            Title = 'RuzHub',
            Content = tostring('Crosshair OFF'),
            Duration = 3,
            Icon = 'bell',
        })

        return
    end

    u312()
    u313:Notify({
        Title = 'RuzHub',
        Content = tostring('Crosshair ON \u{2014} enable ShiftLock to see it!'),
        Duration = 3,
        Icon = 'bell',
    })
end

v301:Toggle(t31)
v301:Button({
    Title = 'Open Cursor Picker',
    Description = 'Visual grid with spin toggle \u{2014} click to apply',
    Callback = function()
        local RuzCursorPicker = game.CoreGui:FindFirstChild('RuzCursorPicker')

        if not RuzCursorPicker then
            local ScreenGui = Instance.new('ScreenGui', game.CoreGui)

            ScreenGui.Name = 'RuzCursorPicker'
            ScreenGui.ResetOnSpawn = false
            ScreenGui.DisplayOrder = 60

            local Frame = Instance.new('Frame', ScreenGui)

            Frame.Size = UDim2.new(0, 300, 0, 460)
            Frame.Position = UDim2.new(0.5, -150, 0.04, 0)
            Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
            Frame.BackgroundTransparency = 0.06
            Frame.BorderSizePixel = 0
            Instance.new('UICorner', Frame).CornerRadius = UDim.new(0, 12)

            local UIStroke = Instance.new('UIStroke', Frame)

            UIStroke.Color = Color3.fromRGB(220, 38, 38)
            UIStroke.Thickness = 1.5

            local TextLabel = Instance.new('TextLabel', Frame)

            TextLabel.Size = UDim2.new(1, -44, 0, 38)
            TextLabel.Position = UDim2.new(0, 12, 0, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Text = 'RuzHub  \u{2014}  Cursor Picker'
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.Font = Enum.Font.GothamBold
            TextLabel.TextSize = 14
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left

            local TextButton = Instance.new('TextButton', Frame)

            TextButton.Size = UDim2.new(0, 28, 0, 28)
            TextButton.Position = UDim2.new(1, -34, 0, 5)
            TextButton.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
            TextButton.Text = 'X'
            TextButton.TextColor3 = Color3.new(1, 1, 1)
            TextButton.Font = Enum.Font.GothamBold
            TextButton.TextSize = 13
            Instance.new('UICorner', TextButton).CornerRadius = UDim.new(0, 6)

            local MouseButton1Click = TextButton.MouseButton1Click
            local u715 = ScreenGui

            MouseButton1Click:Connect(function()
                u715:Destroy()
            end)

            local TextBox = Instance.new('TextBox', Frame)

            TextBox.Size = UDim2.new(1, -20, 0, 34)
            TextBox.Position = UDim2.new(0, 10, 0, 44)
            TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            TextBox.Text = ''
            TextBox.PlaceholderText = 'Enter custom Cursor ID, press Enter...'
            TextBox.TextColor3 = Color3.new(1, 1, 1)
            TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
            TextBox.Font = Enum.Font.Gotham
            TextBox.TextSize = 13
            TextBox.ClearTextOnFocus = false
            Instance.new('UICorner', TextBox).CornerRadius = UDim.new(0, 6)
            Instance.new('UIStroke', TextBox).Color = Color3.fromRGB(80, 80, 80)

            local FocusLost = TextBox.FocusLost
            local u718 = TextBox

            FocusLost:Connect(function(p70)
                if p70 and u718.Text ~= '' then
                    id = u718.Text

                    if u198 and u201 then
                        u201.Image = 'rbxassetid://' .. u718.Text
                    end

                    u209:Notify({
                        Title = 'RuzHub',
                        Content = tostring('Custom cursor applied \u{2014} enable ShiftLock to see it!'),
                        Duration = 3,
                        Icon = 'bell',
                    })

                    u718.Text = ''
                end
            end)

            local Frame7 = Instance.new('Frame', Frame)

            Frame7.Size = UDim2.new(1, -20, 0, 30)
            Frame7.Position = UDim2.new(0, 10, 0, 84)
            Frame7.BackgroundTransparency = 1

            local TextLabel7 = Instance.new('TextLabel', Frame7)

            TextLabel7.Size = UDim2.new(1, -64, 1, 0)
            TextLabel7.BackgroundTransparency = 1
            TextLabel7.Text = 'Spin Crosshair'
            TextLabel7.TextColor3 = Color3.fromRGB(200, 200, 200)
            TextLabel7.Font = Enum.Font.GothamBold
            TextLabel7.TextSize = 13
            TextLabel7.TextXAlignment = Enum.TextXAlignment.Left

            local TextButton7 = Instance.new('TextButton', Frame7)

            TextButton7.Size = UDim2.new(0, 54, 0, 26)
            TextButton7.Position = UDim2.new(1, -54, 0.5, -13)
            TextButton7.BackgroundColor3 = u199 and Color3.fromRGB(30, 160, 30) or Color3.fromRGB(80, 20, 20)
            TextButton7.Text = u199 and 'ON' or 'OFF'
            TextButton7.TextColor3 = Color3.new(1, 1, 1)
            TextButton7.Font = Enum.Font.GothamBold
            TextButton7.TextSize = 12
            Instance.new('UICorner', TextButton7).CornerRadius = UDim.new(0, 8)

            local MouseButton1Click6 = TextButton7.MouseButton1Click
            local u723 = TextButton7

            MouseButton1Click6:Connect(function()
                u199 = not u199
                u723.BackgroundColor3 = u199 and Color3.fromRGB(30, 160, 30) or Color3.fromRGB(80, 20, 20)
                u723.Text = u199 and 'ON' or 'OFF'

                u210()

                local v919 = 'Crosshair Spin: ' .. (u199 and 'ON' or 'OFF')

                u209:Notify({
                    Title = 'RuzHub',
                    Content = tostring(v919),
                    Duration = 3,
                    Icon = 'bell',
                })
            end)

            local Frame8 = Instance.new('Frame', Frame)

            Frame8.Size = UDim2.new(1, -20, 0, 1)
            Frame8.Position = UDim2.new(0, 10, 0, 120)
            Frame8.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            Frame8.BorderSizePixel = 0

            local ScrollingFrame = Instance.new('ScrollingFrame', Frame)

            ScrollingFrame.Size = UDim2.new(1, -14, 1, -128)
            ScrollingFrame.Position = UDim2.new(0, 7, 0, 126)
            ScrollingFrame.BackgroundTransparency = 1
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.ScrollBarThickness = 4

            local new = UDim2.new
            local v727 = #u211 / 2

            ScrollingFrame.CanvasSize = new(0, 0, 0, math.ceil(v727) * 118 + 10)

            local UIGridLayout = Instance.new('UIGridLayout', ScrollingFrame)

            UIGridLayout.CellSize = UDim2.new(0, 128, 0, 110)
            UIGridLayout.CellPadding = UDim2.new(0, 8, 0, 8)
            UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder

            for i, v in ipairs(u211)do
                local v731 = id == v.id
                local TextButton8 = Instance.new('TextButton', ScrollingFrame)

                TextButton8.Size = UDim2.new(0, 128, 0, 110)
                TextButton8.BackgroundColor3 = v731 and Color3.fromRGB(55, 15, 15) or Color3.fromRGB(20, 20, 20)
                TextButton8.Text = ''
                TextButton8.AutoButtonColor = false
                TextButton8.LayoutOrder = i
                Instance.new('UICorner', TextButton8).CornerRadius = UDim.new(0, 8)

                local UIStroke4 = Instance.new('UIStroke', TextButton8)

                UIStroke4.Color = v731 and Color3.fromRGB(220, 38, 38) or Color3.fromRGB(50, 50, 50)
                UIStroke4.Thickness = v731 and 1.8 or 1.2

                local ImageLabel = Instance.new('ImageLabel', TextButton8)

                ImageLabel.Size = UDim2.new(0, 58, 0, 58)
                ImageLabel.AnchorPoint = Vector2.new(0.5, 0)
                ImageLabel.Position = UDim2.new(0.5, 0, 0, 8)
                ImageLabel.BackgroundTransparency = 1
                ImageLabel.Image = 'rbxassetid://' .. v.id

                local TextLabel8 = Instance.new('TextLabel', TextButton8)

                TextLabel8.Size = UDim2.new(1, -6, 0, 28)
                TextLabel8.Position = UDim2.new(0, 3, 1, -30)
                TextLabel8.BackgroundTransparency = 1
                TextLabel8.Text = v.name .. (v731 and ' \u{2713}' or '')
                TextLabel8.TextColor3 = v731 and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(200, 200, 200)
                TextLabel8.Font = Enum.Font.GothamBold
                TextLabel8.TextSize = 11
                TextLabel8.TextWrapped = true

                local MouseButton1Click7 = TextButton8.MouseButton1Click
                local u737 = v
                local u738 = ScreenGui

                MouseButton1Click7:Connect(function()
                    id = u737.id

                    if u198 and u201 then
                        u201.Image = 'rbxassetid://' .. u737.id
                    end

                    local v920 = 'Cursor: ' .. u737.name .. ' \u{2014} enable ShiftLock to see it!'

                    u209:Notify({
                        Title = 'RuzHub',
                        Content = tostring(v920),
                        Duration = 3,
                        Icon = 'bell',
                    })
                    u738:Destroy()
                end)
            end

            u212(Frame)

            return
        end

        RuzCursorPicker:Destroy()
    end,
})
v301:Divider()
v301:Paragraph({
    Title = 'Graphics',
    Content = 'Low: removes textures, map looks flat, boosts FPS.\nHigh: Bloom, SunRays, enhanced lighting.',
})

local t32 = {
    Title = 'Low Graphics (FPS Boost)',
    Default = false,
}

local function u316()
    if u16 then
        u16 = false
        u173.Brightness = u174.Brightness
        u173.GlobalShadows = u174.GlobalShadows
        u173.Ambient = u174.Ambient
        u173.OutdoorAmbient = u174.OutdoorAmbient

        for _, child in pairs(u173:GetChildren())do
            if child:IsA('BloomEffect') or child:IsA('SunRaysEffect') or child:IsA('ColorCorrectionEffect') then
                child:Destroy()
            end
        end
    end

    u15 = true

    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)
    pcall(function()
        setfpscap(9999)
    end)

    u173.GlobalShadows = false
    u173.Brightness = 2

    for _, descendant in ipairs(u175:GetDescendants())do
        local _pcall = pcall
        local u695 = descendant

        pcall(function()
            u176(u695)
        end)
    end

    if u172 then
        u172:Disconnect()
    end

    u172 = u175.DescendantAdded:Connect(function(descendant)
        task.wait(0.1)

        local u911 = descendant

        pcall(function()
            u176(u911)
        end)
    end)
    u177.Visible = true

    u178:Notify({
        Title = 'RuzHub',
        Content = tostring('Low Graphics ON \u{2014} FPS boost active'),
        Duration = 3,
        Icon = 'bell',
    })
end

local u317 = v183

function t32.Callback(p71)
    if not p71 then
        u317()

        return
    end

    u316()
end

v301:Toggle(t32)

local t33 = {
    Title = 'High Graphics (Beautiful)',
    Default = false,
}

local function u319()
    if u15 then
        u184()
    end

    u16 = true

    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level21
    end)

    u185.GlobalShadows = true
    u185.Brightness = 3.5
    u185.Ambient = Color3.fromRGB(80, 80, 100)
    u185.OutdoorAmbient = Color3.fromRGB(100, 110, 130)

    local v701 = u185:FindFirstChildOfClass('BloomEffect') or Instance.new('BloomEffect', u185)

    v701.Intensity = 0.6
    v701.Size = 24
    v701.Threshold = 0.95

    local v702 = u185:FindFirstChildOfClass('SunRaysEffect') or Instance.new('SunRaysEffect', u185)

    v702.Intensity = 0.25
    v702.Spread = 1

    local v703 = u185:FindFirstChildOfClass('ColorCorrectionEffect') or Instance.new('ColorCorrectionEffect', u185)

    v703.Saturation = 0.2
    v703.Contrast = 0.1
    v703.Brightness = 0.05

    u186:Notify({
        Title = 'RuzHub',
        Content = tostring('High Graphics ON'),
        Duration = 3,
        Icon = 'bell',
    })
end
local function u320()
    u16 = false

    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    end)

    u187.Brightness = u188.Brightness
    u187.GlobalShadows = u188.GlobalShadows
    u187.Ambient = u188.Ambient
    u187.OutdoorAmbient = u188.OutdoorAmbient

    for _, child in pairs(u187:GetChildren())do
        if child:IsA('BloomEffect') or child:IsA('SunRaysEffect') or child:IsA('ColorCorrectionEffect') then
            child:Destroy()
        end
    end

    u189:Notify({
        Title = 'RuzHub',
        Content = tostring('High Graphics OFF'),
        Duration = 3,
        Icon = 'bell',
    })
end

function t33.Callback(p72)
    if not p72 then
        u320()

        return
    end

    u319()
end

v301:Toggle(t33)

local t34 = {
    Title = 'FOV Slider',
    Description = 'Mobile-friendly field of view selector',
}
local u322 = v25
local u323 = CurrentCamera
local u324 = v18

function t34.Callback()
    u322('Field of View', 30, 120, n3, 5, function(p73)
        n3 = p73
        u323.FieldOfView = p73
    end, function()
        n3 = 70
        u323.FieldOfView = 70

        u324:Notify({
            Title = 'RuzHub',
            Content = tostring('FOV reset to 70'),
            Duration = 3,
            Icon = 'bell',
        })
    end)
end

v301:Button(t34)
v301:Divider()
v301:Paragraph({
    Title = 'Extra Scripts',
    Content = 'Universal scripts and additional tools.',
})

local t35 = {
    Title = 'Load Emotes GUI',
    Description = '7yd7 emote panel',
}
local u326 = v18

function t35.Callback()
    local ok, result = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua'))()
    end)
    local v814 = ok and 'Emotes GUI loaded!' or 'Error: ' .. tostring(result)

    u326:Notify({
        Title = 'RuzHub',
        Content = tostring(v814),
        Duration = 3,
        Icon = 'bell',
    })
end

v301:Button(t35)

local t36 = {
    Title = 'Load Infinite Yield',
    Description = 'Admin script',
}
local u328 = v18

function t36.Callback()
    local ok, result = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
    local v817 = ok and 'Infinite Yield loaded!' or 'Error: ' .. tostring(result)

    u328:Notify({
        Title = 'RuzHub',
        Content = tostring(v817),
        Duration = 3,
        Icon = 'bell',
    })
end

v301:Button(t36)
v301:Divider()

local t37 = {
    Title = 'Anti-Fling',
    Description = 'Limits velocity to prevent being launched',
    Default = false,
}
local u330 = v18

function t37.Callback(p74)
    u156(p74)

    local v819 = p74 and 'Anti-Fling ON' or 'Anti-Fling OFF'

    u330:Notify({
        Title = 'RuzHub',
        Content = tostring(v819),
        Duration = 3,
        Icon = 'bell',
    })
end

v301:Toggle(t37)

local t38 = {
    Title = 'Auto Ping Prediction',
    Description = 'Adds ping offset to shoot and throw',
    Default = false,
}
local u332 = v18

function t38.Callback(p75)
    u13 = p75

    local v821 = p75 and 'Ping Prediction ON' or 'Ping Prediction OFF'

    u332:Notify({
        Title = 'RuzHub',
        Content = tostring(v821),
        Duration = 3,
        Icon = 'bell',
    })
end

v301:Toggle(t38)

local t39 = {
    Title = 'Speed Glitch Slider',
    Description = 'Mobile-friendly speed selector',
}
local u334 = v25
local u335 = v18

function t39.Callback()
    u334('Speed Glitch', 50, 600, n2, 10, function(p76)
        n2 = p76
    end, function()
        n2 = 200

        u335:Notify({
            Title = 'RuzHub',
            Content = tostring('Speed reset to 200'),
            Duration = 3,
            Icon = 'bell',
        })
    end)
end

v301:Button(t39)
v301:Dropdown({
    Title = 'Velocity Cap (Anti-Fling)',
    Options = {
        '50',
        '100',
        '150',
        '200',
        '300',
        '500',
    },
    Default = '200',
    Callback = function(p77)
        n1 = tonumber(p77) or 200
    end,
})

local t40 = {
    Title = 'Enable ESP',
    Default = false,
}
local u337 = v78
local u338 = v68
local u339 = v18

function t40.Callback(p78)
    u61 = p78

    if not p78 then
        if u62 then
            u62:Disconnect()

            u62 = nil
        end

        task.delay(0.1, u338)
    else
        u337()
    end

    local v824 = p78 and 'ESP ON' or 'ESP OFF'

    u339:Notify({
        Title = 'RuzHub',
        Content = tostring(v824),
        Duration = 3,
        Icon = 'bell',
    })
end

v302:Toggle(t40)
v302:Divider()

local t41 = {
    Title = 'Show Murderer',
    Default = true,
}
local u341 = t3

function t41.Callback(p79)
    u341.Murderer = p79
end

v302:Toggle(t41)

local t42 = {
    Title = 'Show Sheriff',
    Default = true,
}
local u343 = t3

function t42.Callback(p80)
    u343.Sheriff = p80
end

v302:Toggle(t42)

local t43 = {
    Title = 'Show Hero',
    Default = true,
}
local u345 = t3

function t43.Callback(p81)
    u345.Hero = p81
end

v302:Toggle(t43)

local t44 = {
    Title = 'Show Innocents',
    Default = true,
}
local u347 = t3

function t44.Callback(p82)
    u347.Innocent = p82
end

v302:Toggle(t44)

local t45 = {
    Title = 'Show Self',
    Default = true,
}
local u349 = t3

function t45.Callback(p83)
    u349.Self = p83
end

v302:Toggle(t45)

local t46 = {
    Title = 'Dropped Gun ESP',
    Description = 'Highlight and label when a gun is on the map',
    Default = true,
}
local u351 = v18

function t46.Callback(p84)
    u17 = p84

    if not p84 then
        if u31 then
            u31:Destroy()

            u31 = nil
        end
        if u32 then
            u32:Destroy()

            u32 = nil
        end
        if u29 then
            u29:Destroy()

            u29 = nil
        end
    end

    local v831 = p84 and 'Gun ESP ON' or 'Gun ESP OFF'

    u351:Notify({
        Title = 'RuzHub',
        Content = tostring(v831),
        Duration = 3,
        Icon = 'bell',
    })
end

v302:Toggle(t46)
v302:Divider()

local t47 = {
    Title = 'Murderer Color',
    Default = Color3.fromRGB(255, 40, 40),
}
local u353 = t4

function t47.Callback(p85)
    u353.Murderer = p85
end

v302:ColorPicker(t47)

local t48 = {
    Title = 'Sheriff Color',
    Default = Color3.fromRGB(40, 130, 255),
}
local u355 = t4

function t48.Callback(p86)
    u355.Sheriff = p86
end

v302:ColorPicker(t48)

local t49 = {
    Title = 'Hero Color',
    Default = Color3.fromRGB(255, 215, 0),
}
local u357 = t4

function t49.Callback(p87)
    u357.Hero = p87
end

v302:ColorPicker(t49)

local t50 = {
    Title = 'Innocent Color',
    Default = Color3.fromRGB(0, 220, 0),
}
local u359 = t4

function t50.Callback(p88)
    u359.Innocent = p88
end

v302:ColorPicker(t50)
task.wait(0.4)
v232(true)
v239(true)
v244(true)
v18:Notify({
    Title = 'RuzHub',
    Content = tostring('RuzHub v7.3 ready!'),
    Duration = 3,
    Icon = 'bell',
})
print('[RuzHub] v7.3 loaded.')
