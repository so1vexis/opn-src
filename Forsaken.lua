local t1 = {}
local v2 = unpack or table.unpack
local RunService = game:GetService('RunService')

do
    local Players = game:GetService('Players')

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    if not Players.LocalPlayer then
        local elapsed = os.clock()

        while true do
            local v6 = not Players.LocalPlayer

            if v6 then
                v6 = os.clock() - elapsed < 20
            end

            t1[1] = v6

            if not t1[1] then
                break
            end

            task.wait(0.1)
        end

        if not Players.LocalPlayer then
            Players.PlayerAdded:Wait()
        end
    end
end

print('=== Why u check console? ===')
task.spawn(function()
    task.wait(3)
    print('=== WORKSPACE CHILDREN ===')

    for _, child in ipairs(workspace:GetChildren())do
        print(child.Name, child.ClassName)
    end

    print('=== PLAYERS FOLDER ===')

    local Players = workspace:FindFirstChild('Players')

    if Players then
        for _, child in ipairs(Players:GetChildren())do
            print('Players ->', child.Name, child.ClassName)

            for _, child2 in ipairs(child:GetChildren())do
                print('  ->', child2.Name, child2.ClassName)
            end
        end
    end
end)

local u7

do
    local n1 = 0

    while not u7 and n1 < 5 do
        n1 += 1

        t1[2] = function()
            return loadstring(game:HttpGet('https://github.com/Footagesus/WindUI/releases/latest/download/main.lua'))()
        end

        local ok, result = pcall(t1[2])

        t1[3] = ok
        t1[1] = t1[3] and result

        if t1[1] then
            u7 = result
        else
            warn('[Forsaken] WindUI load failed (try ' .. n1 .. '): ' .. tostring(result))
            task.wait(1.5)
        end
    end
end

if not u7 then
    error('[Forsaken] \u{41d}\u{435} \u{443}\u{434}\u{430}\u{43b}\u{43e}\u{441}\u{44c} \u{437}\u{430}\u{433}\u{440}\u{443}\u{437}\u{438}\u{442}\u{44c} WindUI \u{43f}\u{43e}\u{441}\u{43b}\u{435} 5 \u{43f}\u{43e}\u{43f}\u{44b}\u{442}\u{43e}\u{43a}. \u{41f}\u{440}\u{43e}\u{432}\u{435}\u{440}\u{44c} \u{438}\u{43d}\u{442}\u{435}\u{440}\u{43d}\u{435}\u{442} \u{438} \u{437}\u{430}\u{43f}\u{443}\u{441}\u{442}\u{438} \u{441}\u{43a}\u{440}\u{438}\u{43f}\u{442} \u{437}\u{430}\u{43d}\u{43e}\u{432}\u{43e}.')
end

do
    local v11 = u7
    local color3 = Color3.fromHex('#2d1b2e')
    local color3_2 = Color3.fromHex('#1a0f1e')

    t1[2] = Color3.fromHex('#f9a8d4')

    local color3_3 = Color3.fromHex('#fce7f3')

    t1[1] = Color3.fromHex('#c084fc')

    local fromHex = Color3.fromHex

    t1[3] = v11.AddTheme

    local v16 = fromHex('#6b2d6b')
    local color3_4 = Color3.fromHex('#f0abfc')

    t1[3](v11, {
        Name = 'Pink',
        Accent = color3,
        Background = color3_2,
        Outline = t1[2],
        Text = color3_3,
        Placeholder = t1[1],
        Button = v16,
        Icon = color3_4,
    })
end
do
    local v18 = u7
    local uDim2 = UDim2.fromOffset(500, 420)

    t1[2] = Enum.KeyCode
    t1[3] = v18.CreateWindow
    t1[1] = t1[2].K
    t1[3] = t1[3](v18, {
        Title = 'Forsaken',
        Icon = 'zap',
        Author = 'by ScriptDLC',
        Folder = 'ForsakenDLC',
        Size = uDim2,
        Transparent = true,
        Theme = 'Pink',
        Resizable = true,
        HideSearchBar = true,
        ToggleKey = t1[1],
    })
end

local v20 = t1[3]

t1[3] = v20

do
    local Tag = t1[3].Tag

    t1[2] = Color3.fromHex('#ffb6d9')

    Tag(t1[3], {
        Title = '19.7 (Freemium)',
        Icon = 'github',
        Color = t1[2],
        Radius = 13,
    })

    t1[3] = v20

    local EditOpenButton = t1[3].EditOpenButton

    t1[2] = UDim.new(0, 420)
    t1[1] = ColorSequence.new(Color3.fromHex('FF6EB4'), Color3.fromHex('FFE4F0'))

    EditOpenButton(t1[3], {
        Title = '',
        Icon = 'external-link',
        CornerRadius = t1[2],
        StrokeThickness = 1.5,
        Color = t1[1],
        OnlyMobile = true,
        Enabled = true,
        Draggable = true,
    })

    local v23 = v20:Tab({
        Title = 'Info-Hub',
        Icon = 'mail-question-mark',
        Locked = false,
    })

    t1[1] = Color3.fromRGB(255, 200, 50)
    t1[2] = {
        Title = 'copy guns.lol',
        Icon = 'check',
        Callback = function()
            setclipboard('https://guns.lol/scriptdlc')
            u7:Notify({
                Title = 'ThX youu <33',
                Content = 'rrawr',
                Duration = 9,
                Icon = 'paw-print',
            })
        end,
    }
    t1[3] = v23.Paragraph

    t1[3](v23, {
        Title = 'Enjoy Script! :3',
        Desc = 'check my guns.lol plz <3',
        Image = 'cat',
        ImageSize = 26,
        Thumbnail = 'rbxassetid://70729346306474',
        ThumbnailSize = 196,
        Color = t1[1],
        Buttons = {
            t1[2],
            {
                Title = 'Copy Discord',
                Icon = 'star',
                Callback = function()
                    setclipboard('https://discord.gg/sJRH8xtsa')
                    u7:Notify({
                        Title = 'ThX youu <33',
                        Content = 'rrawr',
                        Duration = 9,
                        Icon = 'paw-print',
                    })
                end,
            },
        },
    })
    v23:Select()

    t1[3] = v20
    t1[2] = UDim.new(0, 16)
    t1[1] = ColorSequence.new

    local fromHex = Color3.fromHex

    t1[1] = t1[1](fromHex('FFE3F1'), Color3.fromHex('FF8FBF'))

    t1[3]:EditOpenButton({
        Title = '',
        Icon = 'monitor',
        CornerRadius = t1[2],
        StrokeThickness = 2,
        Color = t1[1],
        OnlyMobile = false,
        Enabled = true,
        Draggable = true,
    })

    t1[2] = v20:Tab({
        Title = 'ChangeLog',
        Icon = 'github',
        Locked = false,
    })
    t1[3] = t1[2].Paragraph

    local color3 = Color3.fromRGB(180, 180, 180)

    t1[3](t1[2], {
        Title = '1.0',
        Desc = 'The first version!',
        Image = 'cat',
        ImageSize = 26,
        Thumbnail = 'rbxassetid://139798731050086',
        ThumbnailSize = 196,
        Color = color3,
    })

    t1[3] = t1[2].Paragraph

    local color3_5 = Color3.fromRGB(180, 180, 180)

    t1[3](t1[2], {
        Title = '2.0',
        Desc = '+ Mobile\n+ Fixed ESP',
        Image = 'cat',
        ImageSize = 26,
        Thumbnail = 'rbxassetid://82625564944382',
        ThumbnailSize = 196,
        Color = color3_5,
    })

    t1[1] = Color3.fromRGB
    t1[3] = t1[2].Paragraph

    local v27 = t1[1](180, 180, 180)

    t1[3](t1[2], {
        Title = '2.2',
        Desc = '+ FIXED BUGS\n+ 6.7',
        Image = 'cat',
        ImageSize = 26,
        Thumbnail = 'rbxassetid://82625564944382',
        ThumbnailSize = 196,
        Color = v27,
    })
end
do
    local _Color3 = Color3

    t1[3] = t1[2].Paragraph

    local v29 = _Color3.fromRGB(180, 220, 255)

    t1[3](t1[2], {
        Title = '6.8',
        Desc = '+ Optimized ESP & Music',
        Image = 'cat',
        ImageSize = 26,
        Thumbnail = 'rbxassetid://82625564944382',
        ThumbnailSize = 196,
        Color = v29,
    })

    local _Color3_2 = Color3

    t1[3] = t1[2].Paragraph

    local v31 = _Color3_2.fromRGB(150, 255, 180)

    t1[3](t1[2], {
        Title = '6.9',
        Desc = '+ Fixed ESP toggle bugs\n+ Fixed self-highlight\n+ Real-time transparency',
        Image = 'cat',
        ImageSize = 26,
        Thumbnail = 'rbxassetid://82625564944382',
        ThumbnailSize = 196,
        Color = v31,
    })

    t1[3] = t1[2].Paragraph

    local color3 = Color3.fromRGB(150, 255, 180)

    t1[3](t1[2], {
        Title = '7.5',
        Desc = '+ Fixed maybe\n+ Fixed Stamina\n+ generator esp puzzle',
        Image = 'cat',
        ImageSize = 26,
        Thumbnail = 'rbxassetid://82625564944382',
        ThumbnailSize = 196,
        Color = color3,
    })

    t1[1] = Color3.fromRGB
    t1[3] = t1[2].Paragraph

    local v33 = t1[1](150, 255, 180)

    t1[3](t1[2], {
        Title = '9.67',
        Desc = '+ Fixed ESP BUGS\n+ Fixed Many Bugs\n+ ADDED AUTOBLOCK',
        Image = 'cat',
        ImageSize = 26,
        Thumbnail = 'rbxassetid://82625564944382',
        ThumbnailSize = 196,
        Color = v33,
    })

    t1[3] = t1[2].Paragraph

    local color3_6 = Color3.fromRGB(150, 255, 180)

    t1[3](t1[2], {
        Title = '11.5',
        Desc = '+ Better AutoBlock\n+ Hitbox no longer caught by ESP',
        Image = 'cat',
        ImageSize = 26,
        Thumbnail = 'rbxassetid://82625564944382',
        ThumbnailSize = 196,
        Color = color3_6,
    })
end

t1[3] = t1[2].Paragraph

local n2, n3, n4, n5, n6, u44, u45, v50, t3, u56, u57, u58, u59, t4, t5, u66
local u67, n8, n9, t10, t11, t12, u89, v98, u101, u107, u109, v110, v111, u113, u115, u117
local v118, v120, u122, u123, t16, t17, v128, u129, v130, n10, t40, t41, t43, u196, u198, v199
local v200, v201, v202, t46, u220, u221, u222, n12, u224, u225, n13, t51, u228, v231, v232, u237
local v238, v239, v240, u241, v242, t54

do
    local v217

    do
        local v55, t6, t7, t9, v108

        do
            local v54, v112, v121

            do
                local v104

                do
                    local v53

                    do
                        local t8

                        do
                            local v49

                            do
                                local color3 = Color3.fromRGB(150, 255, 180)

                                t1[3](t1[2], {
                                    Title = '13.0',
                                    Desc = '+ Fixed Autoblock\n+ Fixed any bugs with stamina\n+ Added auto solve puzzle\n+ soon killer and survivor tab...',
                                    Image = 'cat',
                                    ImageSize = 26,
                                    Thumbnail = 'rbxassetid://82625564944382',
                                    ThumbnailSize = 196,
                                    Color = color3,
                                })

                                local color3_7 = Color3.fromRGB(150, 255, 180)

                                t1[2]:Paragraph({
                                    Title = '19.2',
                                    Desc = '+ Fixed Autoblock (added new funcions)\n+ Fixed Stamina (for mobile)\n+ Added Survivors Tab!\n+ Added HDT for Guest1337\n+ Added Items ESP\n+ soon killer tab...',
                                    Image = 'cat',
                                    ImageSize = 26,
                                    Thumbnail = 'rbxassetid://82625564944382',
                                    ThumbnailSize = 196,
                                    Color = color3_7,
                                })

                                t1[3] = t1[2].Paragraph

                                local color3_8 = Color3.fromRGB(150, 255, 180)

                                t1[3](t1[2], {
                                    Title = '19.6',
                                    Desc = '+ Optimized Visual AutoBlock for madium\n+ Added Config Tab\n+ Fixed Mobile fuckest bug sprinting nigga (maybe)',
                                    Image = 'cat',
                                    ImageSize = 26,
                                    Thumbnail = 'rbxassetid://82625564944382',
                                    ThumbnailSize = 196,
                                    Color = color3_8,
                                })
                                v20:Section({
                                    Title = 'Semi-Legit',
                                    Icon = 'bird',
                                    Opened = false,
                                })

                                t1[1] = function()
                                    local Character = game.Players.LocalPlayer.Character

                                    if not Character then
                                        return true
                                    end

                                    local Humanoid = Character:FindFirstChild('Humanoid')

                                    if not Humanoid or Humanoid.Health <= 0 then
                                        return true
                                    end
                                    if tostring(Character.Parent) == 'Spectating' then
                                        return true
                                    end

                                    return false
                                end
                                t1[3] = v20
                                t1[2] = t1[3]:Tab({
                                    Title = 'Player',
                                    Icon = 'user',
                                })
                                t1[3] = t1[2].Section

                                local t2 = {
                                    Title = 'Stamina',
                                    Icon = 'zap',
                                }

                                t1[3] = t1[3](t1[2], t2)
                                n2 = 100
                                n3 = 10
                                n4 = 20
                                n5 = 0
                                n6 = 26
                                u44 = false
                                u45 = nil

                                local v46 = t1[1]

                                local function v47()
                                    local ok, result = pcall(function()
                                        return require(game:GetService('ReplicatedStorage').Systems.Character.Game.Sprinting)
                                    end)

                                    return ok and result or nil
                                end
                                local function v48(p1)
                                    p1.StaminaLoss = n3
                                    p1.StaminaGain = n4
                                    p1.MinStamina = n5
                                    p1.MaxStamina = n2
                                    p1.SprintSpeed = n6
                                    p1.StaminaLossDisabled = u44

                                    if u44 then
                                        p1.Stamina = n2

                                        if p1.__staminaChangedEvent then
                                            pcall(function()
                                                p1.__staminaChangedEvent:Fire(n2)
                                            end)
                                        end
                                    end
                                end

                                function v49()
                                    u45 = nil

                                    RunService.Stepped:Connect(function()
                                        if v46() then
                                            return
                                        end

                                        local v1083 = v47()

                                        if v1083 and v1083.DefaultsSet then
                                            v48(v1083)
                                        end
                                    end)
                                    RunService.Heartbeat:Connect(function(dt)
                                        local v1085 = v46

                                        if v1085() then
                                            u45 = v1085

                                            return
                                        end
                                        if u44 or n5 >= 0 then
                                            u45 = nil

                                            return
                                        end

                                        local v1086 = v47()

                                        if not v1086 and v1086.DefaultsSet or type(v1086.Stamina) ~= 'number' then
                                            return
                                        end

                                        local Stamina = v1086.Stamina

                                        if Stamina > 0 then
                                            u45 = Stamina

                                            return
                                        end

                                        local Character = game.Players.LocalPlayer.Character
                                        local v1089 = Character and Character:FindFirstChildOfClass('Humanoid')
                                        local v1090 = v1089 ~= nil and v1089.MoveDirection.Magnitude > 0.05
                                        local v1091 = u45 or 0

                                        if v1091 > 0 then
                                            v1091 = 0
                                        end

                                        local v1093

                                        if v1090 then
                                            local v1092 = dt or 0.016666666666667

                                            v1093 = v1091 - n3 * v1092
                                        else
                                            local v1094 = dt or 0.016666666666667

                                            v1093 = v1091 + n4 * v1094
                                        end

                                        local u1095 = math.clamp(v1093, n5, n2)

                                        v1086.Stamina = u1095

                                        if v1086.__staminaChangedEvent then
                                            pcall(function()
                                                v1086.__staminaChangedEvent:Fire(u1095)
                                            end)
                                        end
                                    end)
                                end
                                function v50()
                                    if v46() then
                                        return
                                    end

                                    local v343 = v47()

                                    if not v343 then
                                        return
                                    end
                                    if not v343.DefaultsSet then
                                        local n7 = 0

                                        if not v343.DefaultsSet then
                                            if not (n7 >= 10) then
                                            end
                                        end

                                        repeat
                                            pcall(function()
                                                v343:Init()
                                            end)
                                            task.wait(0.3)

                                            n7 += 1
                                        until v343.DefaultsSet or n7 >= 10

                                        if not v343.DefaultsSet then
                                            return
                                        end
                                    end

                                    v48(v343)
                                    v49()
                                end
                            end

                            t3 = {}
                            t1[1] = t1[3].Input
                            t1[2] = function(p2)
                                local num = tonumber(p2)

                                if num then
                                    n2 = num

                                    v50()

                                    local v347 = u7
                                    local v348 = 'max: ' .. num

                                    v347:Notify({
                                        Title = 'Stamina',
                                        Content = v348,
                                        Duration = 3,
                                        Icon = 'zap',
                                    })
                                end
                            end
                            t1[1] = t1[1](t1[3], {
                                Title = 'Max Stamina',
                                Value = '100',
                                InputIcon = 'zap',
                                Type = 'Input',
                                Placeholder = '100',
                                Callback = t1[2],
                            })
                            t3.maxStam = t1[1]
                            t1[1] = t1[3].Input
                            t1[2] = function(p3)
                                local num = tonumber((tostring(p3):gsub('%s', '')))

                                if num then
                                    n5 = num

                                    v50()

                                    local v351 = u7
                                    local v352 = 'min: ' .. num

                                    v351:Notify({
                                        Title = 'Stamina',
                                        Content = v352,
                                        Duration = 3,
                                        Icon = 'minus',
                                    })
                                end
                            end
                            t1[1] = t1[1](t1[3], {
                                Title = 'Min Stamina',
                                Value = '0',
                                InputIcon = 'minus',
                                Type = 'Input',
                                Placeholder = '-100 (\u{43c}\u{43e}\u{436}\u{43d}\u{43e} \u{43c}\u{438}\u{43d}\u{443}\u{441})',
                                Callback = t1[2],
                            })
                            t3.minStam = t1[1]
                            t1[1] = t1[3].Input
                            t1[2] = function(p4)
                                local num = tonumber(p4)

                                if num then
                                    n3 = num

                                    v50()

                                    local v355 = u7
                                    local v356 = 'loss: ' .. num

                                    v355:Notify({
                                        Title = 'Stamina',
                                        Content = v356,
                                        Duration = 3,
                                        Icon = 'trending-down',
                                    })
                                end
                            end
                            t1[1] = t1[1](t1[3], {
                                Title = 'Stamina Loss',
                                Value = '10',
                                InputIcon = 'trending-down',
                                Type = 'Input',
                                Placeholder = '10',
                                Callback = t1[2],
                            })
                            t3.lossStam = t1[1]
                            t1[1] = t1[3].Input
                            t1[2] = function(p5)
                                local num = tonumber(p5)

                                if num then
                                    n4 = num

                                    v50()

                                    local v359 = u7
                                    local v360 = 'gain: ' .. num

                                    v359:Notify({
                                        Title = 'Stamina',
                                        Content = v360,
                                        Duration = 3,
                                        Icon = 'trending-up',
                                    })
                                end
                            end
                            t1[1] = t1[1](t1[3], {
                                Title = 'Stamina Gain',
                                Value = '20',
                                InputIcon = 'trending-up',
                                Type = 'Input',
                                Placeholder = '20',
                                Callback = t1[2],
                            })
                            t3.gainStam = t1[1]
                            t1[1] = t1[3].Input
                            t1[2] = function(p6)
                                local num = tonumber(p6)

                                if num then
                                    n6 = num

                                    v50()

                                    local v363 = u7
                                    local v364 = 'speed: ' .. num

                                    v363:Notify({
                                        Title = 'Sprint',
                                        Content = v364,
                                        Duration = 3,
                                        Icon = 'bird',
                                    })
                                end
                            end
                            t1[1] = t1[1](t1[3], {
                                Title = 'Sprint Speed',
                                Value = '26',
                                InputIcon = 'bird',
                                Type = 'Input',
                                Placeholder = '26',
                                Callback = t1[2],
                            })
                            t3.sprintStam = t1[1]
                            t1[1] = t1[3].Toggle
                            t1[2] = function(p7)
                                u44 = p7

                                v50()
                            end
                            t1[1] = t1[1](t1[3], {
                                Title = 'Infinite Stamina',
                                Icon = 'infinity',
                                Value = false,
                                Callback = t1[2],
                            })
                            t3.infinite = t1[1]
                            t1[2] = game

                            t1[2].Players.LocalPlayer.CharacterAdded:Connect(function()
                                task.wait(1)
                                v50()
                            end)
                            task.spawn(function()
                                RunService.RenderStepped:Wait()
                                v50()
                                v49()
                            end)

                            local v52 = v20:Tab({
                                Title = 'ESP',
                                Icon = 'eye',
                            })

                            v53 = v52:Section({
                                Title = 'Player ESP',
                                Icon = 'users',
                            })
                            t1[1] = v52:Section({
                                Title = 'Killer ESP Settings',
                                Icon = 'skull',
                            })
                            t1[2] = v52:Section({
                                Title = 'Survivor ESP Settings',
                                Icon = 'users',
                            })
                            t1[3] = v52:Section({
                                Title = 'Generator ESP',
                                Icon = 'zap',
                            })
                            v54 = v52:Section({
                                Title = 'Generator ESP Settings',
                                Icon = 'settings',
                            })
                            v55 = v52:Section({
                                Title = 'Items ESP',
                                Icon = 'package',
                            })
                            u56 = false
                            u57 = false
                            u58 = false
                            u59 = nil
                            t4 = {}
                            t5 = {}
                            t6 = {}
                            t7 = {}
                            t8 = {}
                            t9 = {}
                            u66 = nil
                            u67 = nil
                            n8 = 0
                            n9 = 0

                            local color3 = Color3.fromRGB(255, 50, 50)
                            local color3_9 = Color3.fromRGB(255, 0, 0)
                            local color3_10 = Color3.fromRGB(255, 80, 80)
                            local color3_11 = Color3.fromRGB(255, 200, 200)
                            local color3_12 = Color3.fromRGB(255, 255, 100)

                            t10 = {
                                fillColor = color3,
                                outlineColor = color3_9,
                                fillTrans = 0.3,
                                showBillboard = true,
                                showName = true,
                                showHP = false,
                                showDist = false,
                                nameColor = color3_10,
                                hpColor = color3_11,
                                distColor = color3_12,
                                billboardBgTrans = 0.5,
                                maxDistance = 1000,
                                textSize = 13,
                                billboardWidth = 140,
                                billboardHeight = 0,
                            }
                        end
                        do
                            local color3 = Color3.fromRGB(50, 255, 100)
                            local color3_13 = Color3.fromRGB(0, 200, 50)
                            local color3_14 = Color3.fromRGB(100, 255, 150)
                            local color3_15 = Color3.fromRGB(100, 255, 100)
                            local color3_16 = Color3.fromRGB(255, 255, 100)

                            t11 = {
                                fillColor = color3,
                                outlineColor = color3_13,
                                fillTrans = 0.3,
                                showBillboard = true,
                                showName = true,
                                showHP = false,
                                showDist = false,
                                nameColor = color3_14,
                                hpColor = color3_15,
                                distColor = color3_16,
                                billboardBgTrans = 0.5,
                                maxDistance = 1000,
                                textSize = 13,
                                billboardWidth = 140,
                                billboardHeight = 0,
                            }
                        end

                        local v90, v91, v92, v94, v96, v97, v99

                        do
                            local color3 = Color3.fromRGB(255, 220, 50)
                            local color3_17 = Color3.fromRGB(200, 160, 0)
                            local color3_18 = Color3.fromRGB(255, 230, 80)
                            local color3_19 = Color3.fromRGB(100, 255, 180)
                            local color3_20 = Color3.fromRGB(255, 255, 100)

                            t12 = {
                                fillColor = color3,
                                outlineColor = color3_17,
                                fillTrans = 0.4,
                                showBillboard = true,
                                showLabel = true,
                                showProgress = true,
                                showDist = false,
                                labelColor = color3_18,
                                progressColor = color3_19,
                                distColor = color3_20,
                                billboardBgTrans = 0.5,
                                maxDistance = 1000,
                                textSize = 13,
                                billboardWidth = 160,
                                billboardHeight = 0,
                            }

                            local LocalPlayer = game.Players.LocalPlayer

                            u89 = nil
                            u89 = LocalPlayer

                            function v90(p8)
                                local v395 = u89

                                if v395.Character and p8 == v395.Character then
                                    return true
                                end
                                if p8.Name == v395.Name then
                                    local p8Name = game.Players:FindFirstChild(p8.Name)

                                    if p8Name and p8Name.UserId == v395.UserId then
                                        return true
                                    end
                                end

                                return false
                            end
                            function v91(p9)
                                local Players = workspace:FindFirstChild('Players')

                                if Players then
                                    local p9_2 = Players:FindFirstChild(p9)

                                    if p9_2 then
                                        return p9_2
                                    end
                                end

                                return workspace:FindFirstChild(p9)
                            end
                            function v92(p10)
                                local p10Name = game.Players:FindFirstChild(p10.Name)

                                if p10Name then
                                    return p10Name
                                end

                                for _, player in ipairs(game.Players:GetPlayers())do
                                    if p10 == player.Character then
                                        return player
                                    end
                                end

                                return nil
                            end

                            local function v93(p11)
                                local Humanoid = p11:FindFirstChildWhichIsA('Humanoid')

                                if Humanoid then
                                    return math.floor(Humanoid.Health), math.floor(Humanoid.MaxHealth)
                                end

                                return nil, nil
                            end

                            function v94(p12)
                                local Character = u89.Character

                                if not Character then
                                    return nil
                                end

                                local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart')

                                if not HumanoidRootPart then
                                    return nil
                                end

                                return math.floor((p12 - HumanoidRootPart.Position).Magnitude)
                            end

                            local function v95(p13)
                                local v408 = p13:FindFirstChild('HumanoidRootPart') or p13:FindFirstChildWhichIsA('BasePart')

                                return v408 and v408.Position
                            end

                            function v96(p14, p15, p16, p17, p18, p19, p20)
                                local BillboardGui = Instance.new('BillboardGui')

                                BillboardGui.Name = p16
                                BillboardGui.Size = UDim2.fromOffset(p17, p18)

                                if not p20 then
                                    p20 = Vector3.new(0, 1.5, 0)
                                end

                                BillboardGui.StudsOffset = p20
                                BillboardGui.AlwaysOnTop = true
                                BillboardGui.ResetOnSpawn = false
                                BillboardGui.LightInfluence = 0
                                BillboardGui.Adornee = p14
                                BillboardGui.Parent = p15

                                local Frame = Instance.new('Frame')

                                Frame.Name = '_ESPBg'
                                Frame.Size = UDim2.fromScale(1, 1)
                                Frame.BackgroundColor3 = Color3.new(0, 0, 0)
                                Frame.BackgroundTransparency = p19
                                Frame.BorderSizePixel = 0
                                Frame.Parent = BillboardGui

                                local UICorner = Instance.new('UICorner')

                                UICorner.CornerRadius = UDim.new(0, 5)
                                UICorner.Parent = Frame

                                local UIListLayout = Instance.new('UIListLayout')

                                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                UIListLayout.FillDirection = Enum.FillDirection.Vertical
                                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                                UIListLayout.Padding = UDim.new(0, 2)
                                UIListLayout.Parent = Frame

                                return BillboardGui, Frame
                            end
                            function v97(p21, p22, p23)
                                local v386 = p23 + 4

                                for i, v in ipairs(p22)do
                                    local TextLabel = Instance.new('TextLabel')

                                    TextLabel.Name = '_ESPLine' .. i
                                    TextLabel.Size = UDim2.new(1, 0, 0, v386)
                                    TextLabel.BackgroundTransparency = 1
                                    TextLabel.TextColor3 = v.color
                                    TextLabel.TextStrokeTransparency = 0.4
                                    TextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                                    TextLabel.Font = Enum.Font.GothamBold
                                    TextLabel.TextSize = p23
                                    TextLabel.Text = v.text
                                    TextLabel.LayoutOrder = i
                                    TextLabel.Parent = p21
                                end
                            end
                            function v98(p24, p25, p26)
                                local p25_2 = p24:FindFirstChild(p25)

                                if not p25_2 or (not p25_2:IsA('Highlight') or not p25_2.Parent) then
                                    pcall(function()
                                        if p25_2 then
                                            p25_2:Destroy()
                                        end
                                    end)
                                    pcall(function()
                                        local Highlight = Instance.new('Highlight')

                                        Highlight.Name = p25
                                        Highlight.FillColor = p26.fillColor
                                        Highlight.OutlineColor = p26.outlineColor
                                        Highlight.FillTransparency = p26.fillTrans
                                        Highlight.OutlineTransparency = 0
                                        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                        Highlight.Parent = p24
                                    end)

                                    return
                                end

                                p25_2.FillColor = p26.fillColor
                                p25_2.OutlineColor = p26.outlineColor
                                p25_2.FillTransparency = p26.fillTrans
                            end
                            function v99(p27, p28)
                                local t13 = {}

                                if p28.showName then
                                    local insert = table.insert
                                    local v417 = v92(p27)
                                    local v418 = v417 and v417.Name or p27.Name
                                    local nameColor = p28.nameColor

                                    insert(t13, {
                                        text = v418,
                                        color = nameColor,
                                    })
                                end
                                if p28.showHP then
                                    local v420, v421 = v93(p27)

                                    if v420 then
                                        local insert = table.insert
                                        local v423 = 'HP: ' .. v420 .. '/' .. v421
                                        local hpColor = p28.hpColor

                                        insert(t13, {
                                            text = v423,
                                            color = hpColor,
                                        })
                                    end
                                end
                                if p28.showDist then
                                    local v425 = v95(p27)
                                    local v426 = v425 and v94(v425)

                                    if v426 then
                                        local insert = table.insert
                                        local v428 = v426 .. ' studs'
                                        local distColor = p28.distColor

                                        insert(t13, {
                                            text = v428,
                                            color = distColor,
                                        })
                                    end
                                end

                                return t13
                            end
                        end

                        local function v100(p29)
                            return tostring(p29.showName) .. tostring(p29.showHP) .. tostring(p29.showDist) .. tostring(p29.textSize) .. tostring(p29.maxDistance) .. tostring(p29.billboardWidth) .. tostring(p29.billboardHeight) .. tostring(p29.showBillboard)
                        end

                        u101 = nil

                        function u101(p30, p31)
                            if not p30 or not p30.Parent then
                                return
                            end

                            v98(p30, '_ESPHighlight', p31)

                            if not p31.showBillboard then
                                local _ESPBillboard = p30:FindFirstChild('_ESPBillboard')

                                if _ESPBillboard then
                                    pcall(function()
                                        _ESPBillboard:Destroy()
                                    end)
                                end

                                t4[p30] = nil

                                return
                            end

                            local v438 = v99(p30, p31)
                            local v439 = p31.textSize + 4
                            local v440 = p31.billboardHeight > 0 and p31.billboardHeight or math.max(1, #v438) * v439 + 6
                            local billboardWidth = p31.billboardWidth
                            local v442 = v100(p31)
                            local _ESPBillboard = p30:FindFirstChild('_ESPBillboard')

                            if not _ESPBillboard or (not _ESPBillboard:IsA('BillboardGui') or (not _ESPBillboard.Parent or v442 ~= t4[p30])) then
                                pcall(function()
                                    if _ESPBillboard then
                                        _ESPBillboard:Destroy()
                                    end
                                end)

                                t4[p30] = v442

                                local v444 = p30:FindFirstChild('Head') or (p30:FindFirstChild('HumanoidRootPart') or p30:FindFirstChildWhichIsA('BasePart'))

                                if not v444 then
                                    return
                                end

                                pcall(function()
                                    local v1099, v1100 = v96(v444, p30, '_ESPBillboard', billboardWidth, v440, p31.billboardBgTrans)

                                    v1099.MaxDistance = p31.maxDistance

                                    v97(v1100, v438, p31.textSize)
                                end)

                                return
                            end

                            pcall(function()
                                local _ESPBg = _ESPBillboard:FindFirstChild('_ESPBg')

                                if _ESPBg then
                                    _ESPBg.BackgroundTransparency = p31.billboardBgTrans
                                end

                                _ESPBillboard.MaxDistance = p31.maxDistance

                                local v1102 = _ESPBillboard
                                local fromOffset = UDim2.fromOffset
                                local v1104 = v440

                                v1102.Size = fromOffset(billboardWidth, v1104)

                                for i, v in ipairs(v438)do
                                    local v1107 = _ESPBg

                                    if _ESPBg then
                                        v1107 = _ESPBg:FindFirstChild('_ESPLine' .. i)
                                    end
                                    if v1107 then
                                        v1107.Text = v.text
                                        v1107.TextColor3 = v.color
                                        v1107.TextSize = p31.textSize
                                    end
                                end
                            end)
                        end

                        local function v102(p32)
                            pcall(function()
                                local _ESPHighlight = p32:FindFirstChild('_ESPHighlight')

                                if _ESPHighlight then
                                    _ESPHighlight:Destroy()
                                end

                                local _ESPBillboard = p32:FindFirstChild('_ESPBillboard')

                                if _ESPBillboard then
                                    _ESPBillboard:Destroy()
                                end

                                t4[p32] = nil
                            end)
                        end
                        local function v103()
                            if next(t6) then
                                return
                            end
                            if u66 then
                                u66:Disconnect()

                                u66 = nil
                            end
                        end

                        function v104()
                            if u66 then
                                return
                            end

                            RunService.Heartbeat:Connect(function(dt)
                                n8 += dt

                                if n8 < 0.1 then
                                    return
                                end

                                for k, v in pairs(t6)do
                                    local v1111 = k
                                    local v1112 = not v1111

                                    if not v1112 then
                                        v1112 = not v1111.Parent
                                    end
                                    if v1112 then
                                        t6[v1111] = nil
                                    elseif v.showBillboard and v.showHP or v.showDist then
                                        local _ESPBillboard = v1111:FindFirstChild('_ESPBillboard')

                                        if _ESPBillboard then
                                            _ESPBillboard = _ESPBillboard:FindFirstChild('_ESPBg')
                                        end
                                        if _ESPBillboard then
                                            local v1114 = v99(v1111, v)

                                            for i, v3 in ipairs(v1114)do
                                                local v1117 = _ESPBillboard:FindFirstChild('_ESPLine' .. i)

                                                if v1117 then
                                                    v1117.Text = v3.text
                                                end
                                            end
                                        end
                                    end
                                end

                                v103()
                            end)
                        end

                        local function v105()
                            if u67 then
                                return
                            end

                            RunService.Heartbeat:Connect(function(dt)
                                n9 += dt

                                if n9 < 0.5 then
                                    return
                                end

                                for k, v in pairs(t6)do
                                    local v1121 = k

                                    if v1121 and v1121.Parent then
                                        local _ESPHighlight = v1121:FindFirstChild('_ESPHighlight')
                                        local v1123 = not _ESPHighlight

                                        if not v1123 then
                                            v1123 = not _ESPHighlight:IsA('Highlight')

                                            if not v1123 then
                                                v1123 = not _ESPHighlight.Parent

                                                if not v1123 then
                                                    v1123 = _ESPHighlight.FillColor ~= v.fillColor or (_ESPHighlight.OutlineColor ~= v.outlineColor or _ESPHighlight.FillTransparency ~= v.fillTrans)
                                                end
                                            end
                                        end
                                        if v1123 then
                                            v98(v1121, '_ESPHighlight', v)
                                        end
                                    end
                                end
                            end)
                        end
                        local function v106()
                            if u67 then
                                u67:Disconnect()

                                u67 = nil
                            end

                            n9 = 0
                        end

                        u107 = nil

                        function v108(p33)
                            local v382 = t9[p33]

                            if v382 then
                                if v382.died then
                                    pcall(function()
                                        v382.died:Disconnect()
                                    end)
                                end
                                if v382.respawn then
                                    pcall(function()
                                        v382.respawn:Disconnect()
                                    end)
                                end

                                t9[p33] = nil
                            end
                        end
                        function u109(p34, p35)
                            v108(p34)

                            local Humanoid = p34:FindFirstChildWhichIsA('Humanoid')

                            if not Humanoid then
                                return
                            end

                            local connection

                            connection = Humanoid.Died:Connect(function()
                                v102(p34)

                                t7[p34] = p35

                                connection:Disconnect()

                                if t9[p34] then
                                    t9[p34].died = nil
                                end

                                local v1124 = v92(p34)

                                if not v1124 then
                                    v108(p34)

                                    return
                                end

                                local connection2

                                connection2 = v1124.CharacterAdded:Connect(function(character)
                                    connection2:Disconnect()

                                    t7[p34] = nil

                                    v108(p34)
                                    task.wait(0.1)

                                    if t6[character] then
                                        return
                                    end
                                    if character and (character.Parent and not v90(character)) then
                                        u101(character, p35)

                                        t6[character] = p35

                                        u109(character, p35)
                                    end
                                end)

                                if t9[p34] then
                                    t9[p34].respawn = connection2
                                else
                                    local v1126 = t9
                                    local v1127 = p34
                                    local v1128 = connection2

                                    v1126[v1127] = {
                                        died = nil,
                                        respawn = v1128,
                                    }
                                end
                            end)
                            t9[p34] = {
                                died = connection,
                                respawn = nil,
                            }
                        end
                        function v110(p36, p37)
                            if t8[p36] then
                                t8[p36].add:Disconnect()
                                t8[p36].rem:Disconnect()

                                t8[p36] = nil
                            end

                            local v454 = v91(p36)

                            if not v454 then
                                return
                            end

                            for v457, v458 in ipairs(v454:GetChildren())do
                                v102(v458)

                                t6[v458] = nil
                            end

                            local GetChildren = v454.GetChildren

                            for _, v in ipairs(GetChildren(v454))do
                                if v:IsA('Model') and not v90(v) then
                                    u101(v, p37)

                                    t6[v] = p37

                                    u109(v, p37)
                                end
                            end

                            local connection = v454.ChildAdded:Connect(function(child)
                                if not child:IsA('Model') then
                                    return
                                end
                                if v90(child) then
                                    return
                                end

                                u101(child, p37)

                                t6[child] = p37

                                u109(child, p37)

                                if p37.showHP or p37.showDist then
                                    v104()
                                end
                            end)
                            local connection3 = v454.ChildRemoved:Connect(function(child)
                                v102(child)

                                t6[child] = nil
                                t7[child] = nil

                                v108(child)
                                v103()
                            end)

                            t8[p36] = {
                                add = connection,
                                rem = connection3,
                            }

                            if p37.showHP or p37.showDist then
                                v104()
                            end

                            v105()
                        end
                        function v111(p38)
                            if t8[p38] then
                                t8[p38].add:Disconnect()
                                t8[p38].rem:Disconnect()

                                t8[p38] = nil
                            end

                            local v467 = v91(p38)

                            if v467 then
                                for _, child in ipairs(v467:GetChildren())do
                                    v102(child)

                                    t6[child] = nil
                                    t7[child] = nil

                                    v108(child)
                                end
                            end

                            v103()

                            if not next(t8) then
                                v106()
                            end
                        end
                        function v112(p39, p40)
                            local v432 = v91(p39)

                            if not v432 then
                                return
                            end

                            for _, child in ipairs(v432:GetChildren())do
                                if child:IsA('Model') and not v90(child) then
                                    t4[child] = nil

                                    u101(child, p40)
                                end
                            end
                        end

                        u113 = nil

                        function u113()
                            local ok, result = pcall(function()
                                return workspace.Map.Ingame.Map
                            end)

                            return ok and result or nil
                        end

                        local function v114()
                            local t14 = {}
                            local v471 = u113()

                            if not v471 then
                                return t14
                            end

                            for _, child in ipairs(v471:GetChildren())do
                                if child.Name == 'Generator' then
                                    table.insert(t14, child)
                                end
                            end

                            return t14
                        end

                        u115 = nil

                        function u115(p41)
                            local Progress = p41:FindFirstChild('Progress')

                            if not Progress then
                                return nil
                            end
                            if Progress:IsA('NumberValue') or Progress:IsA('IntValue') then
                                return Progress.Value
                            end

                            local v447 = Progress:FindFirstChildWhichIsA('NumberValue') or (Progress:FindFirstChildWhichIsA('IntValue') or Progress:FindFirstChildWhichIsA('ValueBase'))

                            return v447 and v447.Value or nil
                        end

                        local function v116(p42, p43)
                            local t15 = {}

                            if p43.showLabel then
                                local insert = table.insert
                                local labelColor = p43.labelColor

                                insert(t15, {
                                    text = 'Generator',
                                    color = labelColor,
                                })
                            end
                            if p43.showProgress then
                                local v479 = u115(p42)

                                if v479 ~= nil then
                                    local insert = table.insert
                                    local v481 = 'Progress: ' .. math.floor(v479)
                                    local progressColor = p43.progressColor

                                    insert(t15, {
                                        text = v481,
                                        color = progressColor,
                                    })
                                end
                            end
                            if p43.showDist then
                                local BasePart = p42:FindFirstChildWhichIsA('BasePart')

                                if BasePart then
                                    local v484 = v94(BasePart.Position)

                                    if v484 then
                                        local insert = table.insert
                                        local v486 = v484 .. ' studs'
                                        local distColor = p43.distColor

                                        insert(t15, {
                                            text = v486,
                                            color = distColor,
                                        })
                                    end
                                end
                            end

                            return t15
                        end

                        u117 = nil

                        function u117(p44)
                            local u465 = p44

                            pcall(function()
                                local _GENHighlight = u465:FindFirstChild('_GENHighlight')

                                if _GENHighlight then
                                    _GENHighlight:Destroy()
                                end

                                local _GENBillboard = u465:FindFirstChild('_GENBillboard')

                                if _GENBillboard then
                                    _GENBillboard:Destroy()
                                end

                                t5[u465] = nil
                            end)
                        end
                        function v118()
                            for _, v in ipairs(v114())do
                                u117(v)
                            end
                        end

                        local function v119(p45, p46)
                            if not p45 or not p45.Parent then
                                return
                            end

                            v98(p45, '_GENHighlight', p46)

                            if not p46.showBillboard then
                                local _GENBillboard = p45:FindFirstChild('_GENBillboard')

                                if _GENBillboard then
                                    pcall(function()
                                        _GENBillboard:Destroy()
                                    end)
                                end

                                t5[p45] = nil

                                return
                            end

                            local v493 = v116(p45, p46)
                            local v494 = p46.textSize + 4
                            local v495 = p46.billboardHeight > 0 and p46.billboardHeight or math.max(1, #v493) * v494 + 6
                            local billboardWidth = p46.billboardWidth
                            local v497 = v100(p46)
                            local _GENBillboard = p45:FindFirstChild('_GENBillboard')
                            local v499 = not _GENBillboard or (not _GENBillboard:IsA('BillboardGui') or (not _GENBillboard.Parent or v497 ~= t5[p45]))
                            local v500 = p45:FindFirstChild('HumanoidRootPart') or p45:FindFirstChildWhichIsA('BasePart')

                            if v499 then
                                pcall(function()
                                    if _GENBillboard then
                                        _GENBillboard:Destroy()
                                    end
                                end)

                                t5[p45] = v497

                                if not v500 then
                                    return
                                end

                                pcall(function()
                                    local v1133, v1134 = v96(v500, p45, '_GENBillboard', billboardWidth, v495, p46.billboardBgTrans, Vector3.new(0, 4, 0))

                                    v1133.MaxDistance = p46.maxDistance

                                    v97(v1134, v493, p46.textSize)
                                end)

                                return
                            end

                            pcall(function()
                                local _ESPBg = _GENBillboard:FindFirstChild('_ESPBg')

                                if _ESPBg then
                                    _ESPBg.BackgroundTransparency = p46.billboardBgTrans
                                end

                                _GENBillboard.MaxDistance = p46.maxDistance

                                local v1136 = _GENBillboard
                                local fromOffset = UDim2.fromOffset
                                local v1138 = v495

                                v1136.Size = fromOffset(billboardWidth, v1138)

                                for i, v in ipairs(v493)do
                                    local v1141 = _ESPBg

                                    if _ESPBg then
                                        v1141 = _ESPBg:FindFirstChild('_ESPLine' .. i)
                                    end
                                    if v1141 then
                                        v1141.Text = v.text
                                        v1141.TextColor3 = v.color
                                        v1141.TextSize = p46.textSize
                                    end
                                end
                            end)
                        end

                        u107 = 0

                        function v120()
                            if u59 then
                                u59:Disconnect()
                            end

                            u59 = RunService.Heartbeat:Connect(function(dt)
                                u107 += dt

                                if u107 < 0.15 then
                                    return
                                end

                                u107 = 0

                                if not u58 then
                                    u59:Disconnect()

                                    u59 = nil

                                    return
                                end

                                for _, v in ipairs(v114())do
                                    v119(v, t12)
                                end
                            end)
                        end
                        function v121()
                            for _, v in ipairs(v114())do
                                t5[v] = nil
                            end
                        end
                    end

                    u122 = false
                    u123 = nil
                    t16 = {}

                    local color3 = Color3.fromRGB(0, 255, 128)
                    local color3_21 = Color3.fromRGB(255, 255, 255)

                    t17 = {
                        fillColor = color3,
                        outlineColor = color3_21,
                        fillTrans = 0.3,
                    }

                    function v128()
                        local v503 = u113()
                        local t18 = {}

                        if not v503 then
                            return t18
                        end

                        for _, child in ipairs(v503:GetChildren())do
                            if child.Name == 'BloxyCola' or child.Name == 'Medkit' then
                                table.insert(t18, child)
                            end
                        end

                        return t18
                    end

                    u129 = nil

                    function u129(p47)
                        pcall(function()
                            local _ITEMHighlight = p47:FindFirstChild('_ITEMHighlight')

                            if _ITEMHighlight then
                                _ITEMHighlight:Destroy()
                            end
                        end)
                    end
                    function v130()
                        for v510, v511 in ipairs(v128())do
                            u129(v511)
                        end
                        for k in pairs(t16)do
                            local v513 = k

                            if v513 and v513.Parent then
                                u129(v513)
                            end

                            t16[v513] = nil
                        end
                    end

                    n10 = 0
                    t3.espKiller = v53:Toggle({
                        Title = 'ESP Killers',
                        Desc = 'u know',
                        Icon = 'skull',
                        Type = 'Checkbox',
                        Value = false,
                        Callback = function(p48)
                            u56 = p48

                            if p48 then
                                v110('Killers', t10)

                                return
                            end

                            v111('Killers')
                        end,
                    })
                    t3.espSurvivor = v53:Toggle({
                        Title = 'ESP Survivors',
                        Desc = 'u know',
                        Icon = 'users',
                        Type = 'Checkbox',
                        Value = false,
                        Callback = function(p49)
                            u57 = p49

                            if p49 then
                                v110('Survivors', t11)

                                return
                            end

                            v111('Survivors')
                        end,
                    })

                    local fillColor = t10.fillColor

                    t1[1]:Colorpicker({
                        Title = 'Fill Color',
                        Default = fillColor,
                        Transparency = 0,
                        Callback = function(p50)
                            t10.fillColor = p50

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    })

                    local outlineColor = t10.outlineColor

                    t1[1]:Colorpicker({
                        Title = 'Outline Color',
                        Default = outlineColor,
                        Transparency = 0,
                        Callback = function(p51)
                            t10.outlineColor = p51

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    })

                    local t19 = {
                        Min = 0,
                        Max = 1,
                        Default = 0.3,
                    }

                    t1[1]:Slider({
                        Title = 'Fill Transparency',
                        Step = 0.05,
                        Value = t19,
                        Callback = function(p52)
                            t10.fillTrans = p52

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    })
                    t1[1]:Toggle({
                        Title = 'Show Billboard',
                        Icon = 'tag',
                        Type = 'Checkbox',
                        Value = true,
                        Callback = function(p53)
                            t10.showBillboard = p53

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    })

                    local t20 = {
                        Title = 'Show name',
                        Icon = 'user',
                        Type = 'Checkbox',
                        Value = true,
                        Callback = function(p54)
                            t10.showName = p54

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    }

                    t1[1]:Toggle(t20)

                    local nameColor = t10.nameColor
                    local t21 = {
                        Title = 'Name color',
                        Default = nameColor,
                        Transparency = 0,
                        Callback = function(p55)
                            t10.nameColor = p55

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    }

                    t1[1]:Colorpicker(t21)
                    t1[1]:Toggle({
                        Title = 'Show HP',
                        Icon = 'heart',
                        Type = 'Checkbox',
                        Value = false,
                        Callback = function(p56)
                            t10.showHP = p56

                            if u56 then
                                v112('Killers', t10)
                            end
                            if u56 and p56 then
                                v104()
                            end
                        end,
                    })

                    local Colorpicker = t1[1].Colorpicker
                    local hpColor = t10.hpColor

                    Colorpicker(t1[1], {
                        Title = 'HP color',
                        Default = hpColor,
                        Transparency = 0,
                        Callback = function(p57)
                            t10.hpColor = p57

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    })
                    t1[1]:Toggle({
                        Title = 'Show distance',
                        Icon = 'map-pin',
                        Type = 'Checkbox',
                        Value = false,
                        Callback = function(p58)
                            t10.showDist = p58

                            if u56 then
                                v112('Killers', t10)
                            end
                            if u56 and p58 then
                                v104()
                            end
                        end,
                    })

                    local Colorpicker2 = t1[1].Colorpicker
                    local distColor = t10.distColor

                    Colorpicker2(t1[1], {
                        Title = 'Distance color',
                        Default = distColor,
                        Transparency = 0,
                        Callback = function(p59)
                            t10.distColor = p59

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    })

                    local t22 = {
                        Min = 0,
                        Max = 1,
                        Default = 0.5,
                    }

                    t1[1]:Slider({
                        Title = 'Billboard BG transparency',
                        Step = 0.05,
                        Value = t22,
                        Callback = function(p60)
                            t10.billboardBgTrans = p60

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    })

                    local Slider = t1[1].Slider
                    local t23 = {
                        Min = 8,
                        Max = 24,
                        Default = 13,
                    }

                    Slider(t1[1], {
                        Title = 'Text size',
                        Step = 1,
                        Value = t23,
                        Callback = function(p61)
                            t10.textSize = p61

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    })

                    local t24 = {
                        Min = 50,
                        Max = 2000,
                        Default = 1000,
                    }

                    t1[1]:Slider({
                        Title = 'Max. Billboard distance',
                        Step = 50,
                        Value = t24,
                        Callback = function(p62)
                            t10.maxDistance = p62

                            if u56 then
                                v112('Killers', t10)
                            end
                        end,
                    })
                end

                local Slider = t1[1].Slider
                local t25 = {
                    Min = 60,
                    Max = 400,
                    Default = 140,
                }

                Slider(t1[1], {
                    Title = 'Billboard Width',
                    Step = 10,
                    Value = t25,
                    Callback = function(p63)
                        t10.billboardWidth = p63

                        if u56 then
                            v112('Killers', t10)
                        end
                    end,
                })

                local Slider2 = t1[1].Slider
                local t26 = {
                    Min = 0,
                    Max = 200,
                    Default = 0,
                }

                Slider2(t1[1], {
                    Title = 'Billboard Height',
                    Step = 5,
                    Value = t26,
                    Callback = function(p64)
                        t10.billboardHeight = p64

                        if u56 then
                            v112('Killers', t10)
                        end
                    end,
                })

                local fillColor = t11.fillColor

                t1[2]:Colorpicker({
                    Title = 'Fill Color',
                    Default = fillColor,
                    Transparency = 0,
                    Callback = function(p65)
                        t11.fillColor = p65

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })

                local Colorpicker = t1[2].Colorpicker
                local outlineColor = t11.outlineColor

                Colorpicker(t1[2], {
                    Title = 'Outline Color',
                    Default = outlineColor,
                    Transparency = 0,
                    Callback = function(p66)
                        t11.outlineColor = p66

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })

                local Slider3 = t1[2].Slider
                local t27 = {
                    Min = 0,
                    Max = 1,
                    Default = 0.3,
                }

                Slider3(t1[2], {
                    Title = 'Fill Transparency',
                    Step = 0.05,
                    Value = t27,
                    Callback = function(p67)
                        t11.fillTrans = p67

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })
                t1[2]:Toggle({
                    Title = 'Show Billboard',
                    Icon = 'tag',
                    Type = 'Checkbox',
                    Value = true,
                    Callback = function(p68)
                        t11.showBillboard = p68

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })
                t1[2]:Toggle({
                    Title = 'Show name',
                    Icon = 'user',
                    Type = 'Checkbox',
                    Value = true,
                    Callback = function(p69)
                        t11.showName = p69

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })

                local Colorpicker3 = t1[2].Colorpicker
                local nameColor = t11.nameColor

                Colorpicker3(t1[2], {
                    Title = 'Name color',
                    Default = nameColor,
                    Transparency = 0,
                    Callback = function(p70)
                        t11.nameColor = p70

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })
                t1[2]:Toggle({
                    Title = 'Show HP',
                    Icon = 'heart',
                    Type = 'Checkbox',
                    Value = false,
                    Callback = function(p71)
                        t11.showHP = p71

                        if u57 then
                            v112('Survivors', t11)
                        end
                        if u57 and p71 then
                            v104()
                        end
                    end,
                })

                local hpColor = t11.hpColor

                t1[2]:Colorpicker({
                    Title = 'HP color',
                    Default = hpColor,
                    Transparency = 0,
                    Callback = function(p72)
                        t11.hpColor = p72

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })
                t1[2]:Toggle({
                    Title = 'Show distance',
                    Icon = 'map-pin',
                    Type = 'Checkbox',
                    Value = false,
                    Callback = function(p73)
                        t11.showDist = p73

                        if u57 then
                            v112('Survivors', t11)
                        end
                        if u57 and p73 then
                            v104()
                        end
                    end,
                })

                local distColor = t11.distColor

                t1[2]:Colorpicker({
                    Title = 'Distance color',
                    Default = distColor,
                    Transparency = 0,
                    Callback = function(p74)
                        t11.distColor = p74

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })

                local Slider4 = t1[2].Slider
                local t28 = {
                    Min = 0,
                    Max = 1,
                    Default = 0.5,
                }

                Slider4(t1[2], {
                    Title = 'Billboard BG transparency',
                    Step = 0.05,
                    Value = t28,
                    Callback = function(p75)
                        t11.billboardBgTrans = p75

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })

                local t29 = {
                    Min = 8,
                    Max = 24,
                    Default = 13,
                }

                t1[2]:Slider({
                    Title = 'Text size',
                    Step = 1,
                    Value = t29,
                    Callback = function(p76)
                        t11.textSize = p76

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })

                local t30 = {
                    Min = 50,
                    Max = 2000,
                    Default = 1000,
                }

                t1[2]:Slider({
                    Title = 'Max. Billboard distance',
                    Step = 50,
                    Value = t30,
                    Callback = function(p77)
                        t11.maxDistance = p77

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })

                local Slider5 = t1[2].Slider
                local t31 = {
                    Min = 60,
                    Max = 400,
                    Default = 140,
                }

                Slider5(t1[2], {
                    Title = 'Billboard Width',
                    Step = 10,
                    Value = t31,
                    Callback = function(p78)
                        t11.billboardWidth = p78

                        if u57 then
                            v112('Survivors', t11)
                        end
                    end,
                })
            end

            local Slider = t1[2].Slider
            local t32 = {
                Min = 0,
                Max = 200,
                Default = 0,
            }

            Slider(t1[2], {
                Title = 'Billboard Height',
                Step = 5,
                Value = t32,
                Callback = function(p79)
                    t11.billboardHeight = p79

                    if u57 then
                        v112('Survivors', t11)
                    end
                end,
            })

            t3.espGenerator = t1[3]:Toggle({
                Title = 'ESP Generators',
                Desc = 'Highlight generators',
                Icon = 'zap',
                Type = 'Checkbox',
                Value = false,
                Callback = function(p80)
                    u58 = p80

                    if p80 then
                        v120()

                        return
                    end

                    v118()
                end,
            })

            local Colorpicker = v54.Colorpicker
            local fillColor = t12.fillColor

            Colorpicker(v54, {
                Title = 'Fill Color',
                Default = fillColor,
                Transparency = 0,
                Callback = function(p81)
                    t12.fillColor = p81

                    if u58 then
                        v121()
                    end
                end,
            })

            local outlineColor = t12.outlineColor

            v54:Colorpicker({
                Title = 'Outline Color',
                Default = outlineColor,
                Transparency = 0,
                Callback = function(p82)
                    t12.outlineColor = p82

                    if u58 then
                        v121()
                    end
                end,
            })

            local Slider6 = v54.Slider
            local t33 = {
                Min = 0,
                Max = 1,
                Default = 0.4,
            }

            Slider6(v54, {
                Title = 'Fill Transparency',
                Step = 0.05,
                Value = t33,
                Callback = function(p83)
                    t12.fillTrans = p83

                    if u58 then
                        v121()
                    end
                end,
            })
            v54:Toggle({
                Title = 'Show Billboard',
                Icon = 'tag',
                Type = 'Checkbox',
                Value = true,
                Callback = function(p84)
                    t12.showBillboard = p84

                    if u58 then
                        v121()
                    end
                end,
            })
            v54:Toggle({
                Title = 'Show label',
                Icon = 'zap',
                Type = 'Checkbox',
                Value = true,
                Callback = function(p85)
                    t12.showLabel = p85

                    if u58 then
                        v121()
                    end
                end,
            })

            local Colorpicker4 = v54.Colorpicker
            local labelColor = t12.labelColor

            Colorpicker4(v54, {
                Title = 'Label color',
                Default = labelColor,
                Transparency = 0,
                Callback = function(p86)
                    t12.labelColor = p86

                    if u58 then
                        v121()
                    end
                end,
            })
            v54:Toggle({
                Title = 'Show Progress',
                Icon = 'activity',
                Type = 'Checkbox',
                Value = true,
                Callback = function(p87)
                    t12.showProgress = p87

                    if u58 then
                        v121()
                    end
                end,
            })

            local progressColor = t12.progressColor

            v54:Colorpicker({
                Title = 'Progress color',
                Default = progressColor,
                Transparency = 0,
                Callback = function(p88)
                    t12.progressColor = p88

                    if u58 then
                        v121()
                    end
                end,
            })
            v54:Toggle({
                Title = 'Show distance',
                Icon = 'map-pin',
                Type = 'Checkbox',
                Value = false,
                Callback = function(p89)
                    t12.showDist = p89

                    if u58 then
                        v121()
                    end
                end,
            })

            local Colorpicker5 = v54.Colorpicker
            local distColor = t12.distColor

            Colorpicker5(v54, {
                Title = 'Distance color',
                Default = distColor,
                Transparency = 0,
                Callback = function(p90)
                    t12.distColor = p90

                    if u58 then
                        v121()
                    end
                end,
            })

            local t34 = {
                Min = 0,
                Max = 1,
                Default = 0.5,
            }

            v54:Slider({
                Title = 'Billboard BG transparency',
                Step = 0.05,
                Value = t34,
                Callback = function(p91)
                    t12.billboardBgTrans = p91

                    if u58 then
                        v121()
                    end
                end,
            })

            local Slider7 = v54.Slider
            local t35 = {
                Min = 8,
                Max = 24,
                Default = 13,
            }

            Slider7(v54, {
                Title = 'Text size',
                Step = 1,
                Value = t35,
                Callback = function(p92)
                    t12.textSize = p92

                    if u58 then
                        v121()
                    end
                end,
            })

            local t36 = {
                Min = 50,
                Max = 2000,
                Default = 1000,
            }

            v54:Slider({
                Title = 'Max. Billboard distance',
                Step = 50,
                Value = t36,
                Callback = function(p93)
                    t12.maxDistance = p93

                    if u58 then
                        v121()
                    end
                end,
            })

            local t37 = {
                Min = 60,
                Max = 400,
                Default = 160,
            }

            v54:Slider({
                Title = 'Billboard Width',
                Step = 10,
                Value = t37,
                Callback = function(p94)
                    t12.billboardWidth = p94

                    if u58 then
                        v121()
                    end
                end,
            })

            local Slider8 = v54.Slider
            local t38 = {
                Min = 0,
                Max = 200,
                Default = 0,
            }

            Slider8(v54, {
                Title = 'Billboard Height',
                Step = 5,
                Value = t38,
                Callback = function(p95)
                    t12.billboardHeight = p95

                    if u58 then
                        v121()
                    end
                end,
            })
        end

        t3.espItems = v55:Toggle({
            Title = 'ESP Items',
            Desc = 'Highlight BloxyCola & Medkit',
            Icon = 'package',
            Type = 'Checkbox',
            Value = false,
            Callback = function(p96)
                u122 = p96

                if p96 then
                    if u123 then
                        u123:Disconnect()
                    end

                    u123 = RunService.Heartbeat:Connect(function(dt)
                        n10 += dt

                        if n10 < 0.3 then
                            return
                        end
                        if not u122 then
                            u123:Disconnect()

                            u123 = nil

                            return
                        end

                        for _, v in ipairs(v128())do
                            v98(v, '_ITEMHighlight', t17)

                            t16[v] = true
                        end
                    end)

                    return
                end

                v130()
            end,
        })

        local fillColor = t17.fillColor

        v55:Colorpicker({
            Title = 'Fill Color',
            Default = fillColor,
            Transparency = 0,
            Callback = function(p97)
                t17.fillColor = p97
            end,
        })

        local outlineColor = t17.outlineColor

        v55:Colorpicker({
            Title = 'Outline Color',
            Default = outlineColor,
            Transparency = 0,
            Callback = function(p98)
                t17.outlineColor = p98
            end,
        })

        local t39 = {
            Min = 0,
            Max = 1,
            Default = 0.3,
        }

        v55:Slider({
            Title = 'Fill Transparency',
            Step = 0.05,
            Value = t39,
            Callback = function(p99)
                t17.fillTrans = p99
            end,
        })
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            t4 = {}
            t5 = {}

            for v568 in pairs(t6)do
                t6[v568] = nil
            end
            for k in pairs(t7)do
                t7[k] = nil
            end
            for k in pairs(t9)do
                v108(k)
            end

            task.wait(2)

            if u56 then
                v110('Killers', t10)
            end
            if u57 then
                v110('Survivors', t11)
            end
            if u58 then
                v120()
            end
            if u122 then
                if u123 then
                    u123:Disconnect()
                end

                u123 = RunService.Heartbeat:Connect(function(dt)
                    n10 += dt

                    if n10 < 0.3 then
                        return
                    end
                    if not u122 then
                        u123:Disconnect()

                        u123 = nil

                        return
                    end

                    for _, v in ipairs(v128())do
                        v98(v, '_ITEMHighlight', t17)

                        t16[v] = true
                    end
                end)
            end
        end)

        local v187 = v20:Tab({
            Title = 'Music',
            Icon = 'music',
            Locked = false,
        })
        local v188 = v187:Section({
            Title = 'Custom Music',
            Icon = 'music',
            Locked = false,
        })
        local v189 = v187:Section({
            Title = 'Slots Music',
            Icon = 'bookmark',
            Locked = false,
        })
        local v190 = v187:Section({
            Title = 'List music',
            Icon = 'list',
            Locked = false,
        })

        t40 = {}
        t41 = {}
        t1[1] = {
            'MapAmbience',
        }
        t1[2] = {
            name = 'Change MapAmbience music',
            targets = t1[1],
            enabled = false,
            trackId = nil,
            toggle = nil,
            dropdown = nil,
            conn = nil,
            soundIds = {},
        }

        local t42 = {
            name = 'Change Lobby Music',
            targets = {
                'lobby',
                'oldLobby',
            },
            enabled = false,
            trackId = nil,
            toggle = nil,
            dropdown = nil,
            conn = nil,
            soundIds = {},
        }

        t1[1] = {
            'LastSurvivor',
        }
        t1[1] = {
            name = 'Change LMS Music',
            targets = t1[1],
            enabled = false,
            trackId = nil,
            toggle = nil,
            dropdown = nil,
            conn = nil,
            soundIds = {},
        }
        t43 = {
            t1[2],
            t42,
            t1[1],
        }

        local function v195()
            if not isfolder('MusicDLC') then
                makefolder('MusicDLC')
            end
        end

        t1[1] = function()
            v195()

            t40 = {}
            t41 = {
                '[...]',
            }

            local ok, result = pcall(listfiles, 'MusicDLC')

            if not ok then
                return
            end

            for _, v in ipairs(result)do
                local v586 = v:lower():match('%.([^%.]+)$')

                if v586 == 'mp3' or (v586 == 'ogg' or (v586 == 'wav' or v586 == 'flac')) then
                    local v587 = v:match('([^/\\]+)%.[^%.]+$')

                    if v587 then
                        local ok2, result2 = pcall(getcustomasset, v)

                        if ok2 then
                            ok2 = result2 and result2 ~= ''
                        end
                        if ok2 then
                            table.insert(t40, {
                                name = v587,
                                path = v,
                                asset = result2,
                            })
                            table.insert(t41, v587)
                        end
                    end
                end
            end
        end
        u196 = nil

        local v197 = t1[1]

        u198 = nil
        t1[1] = function(p100)
            if not p100.trackId then
                return
            end

            for _, v in ipairs(p100.targets)do
                for _, v4 in ipairs(u198(v))do
                    local v601 = v4

                    if not p100.soundIds[v601] then
                        p100.soundIds[v601] = v601.SoundId
                    end

                    pcall(function()
                        if v601.SoundId ~= p100.trackId then
                            v601.SoundId = p100.trackId
                        end
                        if not v601.Playing then
                            v601:Play()
                        end
                    end)
                end
            end
        end

        function u198(p101)
            local t44 = {}
            local Themes = workspace:FindFirstChild('Themes')

            if not Themes then
                return t44
            end

            local p101_2 = Themes:FindFirstChild(p101)

            if not p101_2 then
                return t44
            end
            if p101_2:IsA('Sound') then
                table.insert(t44, p101_2)

                return t44
            end

            for v577, v578 in ipairs(p101_2:GetChildren())do
                if v578:IsA('Sound') then
                    table.insert(t44, v578)
                end
            end

            if #t44 == 0 then
                local GetDescendants = p101_2.GetDescendants

                for _, v in ipairs(GetDescendants(p101_2))do
                    if v:IsA('Sound') then
                        table.insert(t44, v)
                    end
                end
            end

            return t44
        end

        v199 = t1[1]

        function v200(p102)
            for k, v in pairs(p102.soundIds)do
                local v593 = v

                if k and k.Parent then
                    pcall(function()
                        k.SoundId = v593
                    end)
                end
            end

            p102.soundIds = {}
        end

        u196 = 0.5

        function v201(p103)
            if p103.conn then
                p103.conn:Disconnect()
            end

            local n11 = 0

            p103.conn = RunService.Heartbeat:Connect(function(dt)
                n11 += dt

                if n11 < u196 then
                    return
                end
                if not p103.enabled or not p103.trackId then
                    return
                end

                for _, v in ipairs(p103.targets)do
                    for _, v5 in ipairs(u198(v))do
                        local v1160 = v5

                        if not p103.soundIds[v1160] then
                            p103.soundIds[v1160] = v1160.SoundId ~= p103.trackId and v1160.SoundId or ''
                        end

                        pcall(function()
                            if v1160.SoundId ~= p103.trackId then
                                v1160.SoundId = p103.trackId
                            end
                            if not v1160.Playing then
                                v1160:Play()
                            end
                        end)
                    end
                end

                local t45 = {}

                for v1164 in pairs(p103.soundIds)do
                    if not v1164 or not v1164.Parent then
                        table.insert(t45, v1164)
                    end
                end
                for _, v in ipairs(t45)do
                    p103.soundIds[v] = nil
                end
            end)
        end
        function v202(p104)
            if p104.conn then
                p104.conn:Disconnect()

                p104.conn = nil
            end

            v200(p104)

            p104.enabled = false
        end

        task.spawn(function()
            local Themes = workspace:WaitForChild('Themes', 15)

            if not Themes then
                return
            end

            Themes.ChildAdded:Connect(function(child)
                task.wait(0.3)

                for _, v in ipairs(t43)do
                    if v.enabled and v.trackId then
                        for _, v7 in ipairs(v.targets)do
                            if v7 == child.Name then
                                v199(v)
                            end
                        end
                    end
                end
            end)
        end)

        t1[3] = function(p105)
            local v605 = t43[p105]

            pcall(function()
                v605.dropdown:Destroy()
            end)

            local v606 = v189
            local v607 = 'Track \u{2014} ' .. v605.name
            local Dropdown = v606.Dropdown
            local v609 = t41
            local v610 = t41[1]

            v605.dropdown = Dropdown(v606, {
                Title = v607,
                Desc = 'Choose track',
                Icon = 'music',
                Values = v609,
                Value = v610,
                Multi = false,
                AllowNone = false,
                Callback = function(p106)
                    if p106 == '[...]' then
                        v605.trackId = nil

                        if v605.enabled then
                            v202(v605)
                            pcall(function()
                                v605.toggle:Set(false)
                            end)
                        end

                        return
                    end

                    for _, v in ipairs(t40)do
                        if p106 == v.name then
                            v605.trackId = v.asset

                            break
                        end
                    end

                    if v605.enabled and v605.trackId then
                        v200(v605)
                        v199(v605)
                    end
                end,
            })
        end

        local v203 = t1[3]

        v197()

        t1[3] = v188.Button

        t1[3](v188, {
            Title = 'Refresh music',
            Desc = 'reload from MusicDLC folder',
            Icon = 'refresh-cw',
            Callback = function()
                v197()
                v203(1)
                v203(2)
                v203(3)

                local v611 = u7
                local v612 = 'Found: ' .. #t40

                v611:Notify({
                    Title = 'Music',
                    Content = v612,
                    Duration = 3,
                    Icon = 'refresh-cw',
                })
            end,
        })

        t1[3] = v188.Paragraph
        t1[1] = 'Image'
        t1[2] = 'info'

        local color3 = Color3.fromRGB(180, 220, 255)

        t1[3](v188, {
            Title = 'Tutorial',
            Desc = '1. Put .mp3/.ogg/.wav/.flac in MusicDLC\n2. Click Refresh\n3. Choose a track\n4. Turn on toggle',
            [v4379] = t1[2],
            ImageSize = 22,
            Color = color3,
        })

        t1[3] = ipairs

        for v205, v206 in t1[3](t43)do
            local v207

            do
                v207 = v206
                t1[1] = 'toggle'
                t1[2] = v189

                local Toggle = t1[2].Toggle
                local name = v207.name

                t1[3] = 'Targets: ' .. table.concat(v207.targets, ', ')

                local v210 = Toggle(t1[2], {
                    Title = name,
                    Desc = t1[3],
                    Icon = 'music',
                    Value = false,
                    Callback = function(p107)
                        v207.enabled = p107

                        if p107 then
                            if not v207.trackId then
                                local v614 = u7
                                local v615 = 'Choose track for ' .. v207.name

                                v614:Notify({
                                    Title = 'Music',
                                    Content = v615,
                                    Duration = 3,
                                    Icon = 'alert-triangle',
                                })
                                pcall(function()
                                    v207.toggle:Set(false)
                                end)

                                v207.enabled = false

                                return
                            end

                            v199(v207)
                            v201(v207)

                            local v616 = u7
                            local v617 = v207
                            local Notify = v616.Notify
                            local v619 = v617.name .. ' \u{2014} ON'

                            Notify(v616, {
                                Title = 'Music',
                                Content = v619,
                                Duration = 3,
                                Icon = 'play',
                            })

                            return
                        end

                        v202(v207)

                        local v620 = u7
                        local Notify = v620.Notify
                        local v622 = v207.name .. ' \u{2014} OFF'

                        Notify(v620, {
                            Title = 'Music',
                            Content = v622,
                            Duration = 3,
                            Icon = 'square',
                        })
                    end,
                })

                v207[t1[1] ] = v210
            end

            t1[1] = 'dropdown'
            t1[2] = v189
            t1[3] = v207

            local Dropdown = t1[2].Dropdown
            local v212 = 'Music \u{2014} ' .. t1[3].name

            t1[3] = t41

            local v213 = t41[1]
            local v214 = Dropdown(t1[2], {
                Title = v212,
                Desc = 'Choose Music',
                Icon = 'music',
                Values = t1[3],
                Value = v213,
                Multi = false,
                AllowNone = false,
                Callback = function(p108)
                    if p108 == '[...]' then
                        v207.trackId = nil

                        if v207.enabled then
                            v202(v207)
                            pcall(function()
                                v207.toggle:Set(false)
                            end)
                        end

                        return
                    end

                    for _, v in ipairs(t40)do
                        if p108 == v.name then
                            v207.trackId = v.asset

                            break
                        end
                    end

                    if v207.enabled and v207.trackId then
                        v200(v207)
                        v199(v207)
                    end
                end,
            })

            v207[t1[1] ] = v214

            if v205 < 3 then
                v189:Paragraph({
                    Title = '',
                    Desc = '\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}\u{2500}',
                })
            end
        end

        t46 = {}

        (function()
            for v628, v629 in ipairs(t46)do
                local v630 = v629

                pcall(function()
                    v630:Destroy()
                end)
            end

            t46 = {}

            if #t40 == 0 then
                table.insert(t46, v190:Paragraph({
                    Title = 'Empty',
                    Desc = 'Add files to MusicDLC and press Refresh',
                    Image = 'info',
                }))

                return
            end

            for i, v in ipairs(t40)do
                local insert = table.insert
                local v634 = t46
                local v635 = v190
                local v636 = i .. '. ' .. v.name
                local path = v.path
                local color3_22 = Color3.fromRGB(150, 220, 180)

                insert(v634, v635:Paragraph({
                    Title = v636,
                    Desc = path,
                    Image = 'music',
                    Color = color3_22,
                }))
            end
        end)()

        t1[1] = v20
        t1[3] = function()
            local Character = u89.Character
            local v640 = Character and Character:FindFirstChild('SpeedMultipliers')

            return v640 and v640:FindFirstChild('FixingGenerator') ~= nil
        end

        local Tab = t1[1].Tab

        t1[2] = function(p109)
            if #p109 <= 2 then
                return p109
            end

            local t47 = {}
            local g653

            for _, v in ipairs(p109)do
                t47[v.row .. '-' .. v.col] = v
            end

            local function v647(p110)
                local t48 = {}

                for _, v in ipairs({
                    {1, 0},
                    {
                        -1,
                        0,
                    },
                    {0, 1},
                    {
                        0,
                        -1,
                    },
                })do
                    local v1181 = t47[p110.row + v[1] .. '-' .. p110.col + v[2] ]

                    if v1181 then
                        table.insert(t48, v1181)
                    end
                end

                return t48
            end

            local v648
            local v649, v650, v651 = ipairs(p109)
            local v652

            repeat
                v651, v652 = v649(v650, v651)

                if not v651 then
                    g653 = true
                end
                if g653 then
                    break
                end
            until #v647(v652) == 1

            if not g653 then
                v648 = v652
            end

            g653 = false

            if not v648 then
                return p109
            end

            local t49 = {}
            local t50 = {}

            while v648 do
                table.insert(t49, v648)

                t50[v648.row .. '-' .. v648.col] = true

                local v656

                for _, v in ipairs(v647(v648))do
                    if not t50[v.row .. '-' .. v.col] then
                        v656 = v

                        break
                    end
                end

                v648 = v656
            end

            if #t49 == #p109 then
                return t49
            end

            return p109
        end
        v217 = Tab(t1[1], {
            Title = 'Generator',
            Icon = 'globe',
        })
    end

    t1[1] = v217:Section({
        Title = 'Auto Generator',
        Icon = 'sun',
    })

    local v218 = v217:Section({
        Title = 'Puzzle ESP',
        Icon = 'eye',
    })
    local v219 = v217:Section({
        Title = 'Auto Solve Puzzle',
        Icon = 'zap',
    })

    u220 = nil
    u221 = false
    u222 = nil
    n12 = 5
    u224 = false
    u225 = false
    n13 = 0.08
    t51 = {}
    u228 = nil
    u222 = nil

    local function v229()
        if u222 then
            return u222
        end

        local ok, result = pcall(require, game.ReplicatedStorage.Modules.Minigames.FlowGameManager)

        if ok and result then
            u222 = result
        end

        return u222
    end

    local v230 = t1[3]

    function v231() end
    function v232()
        v231()
        task.spawn(function()
            while u221 do
                local Character = u89.Character
                local v1183 = Character and Character:FindFirstChildOfClass('Humanoid')

                if Character and (v1183 and v1183.Health > 0) then
                    local SpeedMultipliers = Character:FindFirstChild('SpeedMultipliers')

                    if SpeedMultipliers and SpeedMultipliers:FindFirstChild('FixingGenerator') then
                        local ok, result = pcall(function()
                            return workspace.Map.Ingame.Map
                        end)

                        if ok and result then
                            local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart')
                            local n14 = (1/0)
                            local u1189

                            for _, child in ipairs(result:GetChildren())do
                                if child.Name == 'Generator' then
                                    local Progress = child:FindFirstChild('Progress')

                                    if Progress and Progress.Value < 100 then
                                        local Remotes = child:FindFirstChild('Remotes')
                                        local v1194 = Remotes and Remotes:FindFirstChildOfClass('RemoteEvent')

                                        if v1194 and HumanoidRootPart then
                                            local v1195 = child.PrimaryPart or child:FindFirstChildWhichIsA('BasePart')

                                            if v1195 then
                                                local Magnitude = (HumanoidRootPart.Position - v1195.Position).Magnitude

                                                if Magnitude < n14 then
                                                    n14 = Magnitude
                                                    u1189 = v1194
                                                end
                                            end
                                        end
                                    end
                                end
                            end

                            if u1189 then
                                pcall(function()
                                    u1189:FireServer()
                                end)
                            end
                        end
                    end
                end

                task.wait(n12)
            end
        end)
    end

    local function v233()
        for _, v in ipairs(t51)do
            local v669 = v

            pcall(function()
                v669:Disconnect()
            end)
        end

        t51 = {}
    end
    local function v234(p111)
        local v642 = p111 and p111:FindFirstChild('_ESPOverlay')

        if v642 then
            pcall(function()
                v642:Destroy()
            end)
        end
    end
    local function v235(p112, p113)
        if not p112 or not p112.Parent then
            return
        end

        local _ESPOverlay = p112:FindFirstChild('_ESPOverlay')

        if _ESPOverlay then
            _ESPOverlay:Destroy()
        end

        local Frame = Instance.new('Frame')

        Frame.Name = '_ESPOverlay'
        Frame.Size = UDim2.fromScale(1, 1)
        Frame.BackgroundColor3 = p113
        Frame.BackgroundTransparency = 0.7
        Frame.BorderSizePixel = 0
        Frame.ZIndex = 15
        Frame.Active = false
        Frame.Parent = p112

        local UICorner = Instance.new('UICorner')

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = Frame

        local UIStroke = Instance.new('UIStroke')

        UIStroke.Color = p113
        UIStroke.Thickness = 2
        UIStroke.Transparency = 0.15
        UIStroke.Parent = Frame
    end

    t1[3] = function(p114)
        v233()

        u228 = p114

        local Solution = p114.Solution
        local colors = p114.colors
        local gridFrame = p114.gridFrame

        if not Solution or (not colors or not gridFrame) then
            return
        end

        local t52 = {}

        for v677, v678 in pairs(Solution)do
            local v679 = colors[v677]

            if v679 then
                for _, v in ipairs(v678)do
                    local v682 = gridFrame:FindFirstChild(v.row .. '-' .. v.col)

                    if v682 then
                        t52[v682] = v679
                    end
                end
            end
        end
        for k, v in pairs(t52)do
            local Button = k:FindFirstChild('Button')

            if Button then
                v235(Button, v)

                local connection = Button.ChildRemoved:Connect(function(child)
                    if child.Name == '_ESPOverlay' and u224 then
                        local v1198 = t52[k]

                        if v1198 then
                            v235(Button, v1198)
                        end
                    end
                end)

                table.insert(t51, connection)
            end
        end
    end

    local v236 = t1[3]

    u237 = nil
    t1[3] = function()
        if u237 then
            u237:Disconnect()

            u237 = nil
        end

        local v687 = v229()

        if not v687 then
            return
        end

        local u688

        u237 = game:GetService('RunService').Heartbeat:Connect(function()
            if not u224 then
                return
            end

            local activeGame = v687.activeGame

            if not activeGame or (not activeGame.gridFrame or not activeGame.gridFrame.Parent) then
                if u228 ~= nil then
                    v233()

                    u228 = nil
                    u688 = nil
                end

                return
            end
            if activeGame.gameEnded then
                return
            end
            if activeGame ~= u228 or activeGame.id ~= u688 then
                local _ = activeGame.id

                v236(activeGame)
            end
        end)
    end

    function v238()
        if u237 then
            u237:Disconnect()
        end

        v233()

        local v689 = v229()

        if v689 and (v689.activeGame and v689.activeGame.gridFrame) then
            for _, child in ipairs(v689.activeGame.gridFrame:GetChildren())do
                local Button = child:FindFirstChild('Button')

                if Button then
                    v234(Button)
                end
            end
        end
    end

    v239 = t1[3]
    u220 = nil

    function v240()
        if u220 then
            task.cancel(u220)

            u220 = nil
        end
    end

    u241 = nil
    u241 = t1[2]

    function v242()
        v240()
        task.spawn(function()
            while u225 do
                local ok, result = pcall(function()
                    if not v230() then
                        task.wait(0.2)

                        return
                    end

                    task.wait(0.8)

                    local v1434 = v229()

                    if not v1434 then
                        task.wait(0.5)

                        return
                    end

                    local activeGame = v1434.activeGame

                    if not activeGame or activeGame.gameEnded then
                        task.wait(0.5)

                        return
                    end

                    local Solution = activeGame.Solution
                    local paths = activeGame.paths

                    if type(Solution) ~= 'table' or type(paths) ~= 'table' then
                        task.wait(0.5)

                        return
                    end

                    for k in pairs(paths)do
                        paths[k] = {}
                    end

                    pcall(function()
                        activeGame:updateGui()
                    end)

                    for k, v in pairs(Solution)do
                        local v1441 = k

                        if not u225 or not v230() or (activeGame ~= v1434.activeGame or activeGame.gameEnded) then
                            break
                        end
                        if type(v) == 'table' and #v >= 1 then
                            local v1442 = u241(v)

                            pcall(function()
                                activeGame.isDrawing = true

                                local v1519 = activeGame
                                local row = v1442[1].row
                                local col = v1442[1].col

                                v1519.drawingStart = {
                                    row = row,
                                    col = col,
                                    color = v1441,
                                }
                            end)

                            for i = 1, #v1442 do
                                local v1444 = not u225

                                if not v1444 then
                                    v1444 = not v230()
                                end
                                if v1444 then
                                    break
                                end

                                local v1445 = activeGame ~= v1434.activeGame

                                if not v1445 then
                                    v1445 = activeGame.gameEnded
                                end
                                if v1445 then
                                    break
                                end

                                local t53 = {}

                                for j = 1, i do
                                    local row = v1442[j].row
                                    local col = v1442[j].col

                                    t53[j] = {
                                        row = row,
                                        col = col,
                                    }
                                end

                                pcall(function()
                                    paths[v1441] = t53
                                end)
                                pcall(function()
                                    activeGame:updateGui()
                                end)
                                task.wait(n13)
                            end

                            pcall(function()
                                activeGame.isDrawing = false
                                activeGame.drawingStart = nil
                            end)
                            task.wait(n13)
                        end
                    end

                    pcall(function()
                        activeGame.isDrawing = false
                        activeGame.drawingStart = nil
                    end)
                    pcall(function()
                        activeGame:updateGui()
                    end)
                    task.wait(0.1)
                    pcall(function()
                        activeGame:checkForWin()
                    end)
                    u7:Notify({
                        Title = 'Puzzle',
                        Content = 'Solved!',
                        Duration = 3,
                        Icon = 'check',
                    })
                    task.wait(3)
                end)

                if not ok then
                    warn('[AutoSolve] ' .. tostring(result))
                    pcall(function()
                        local v1450 = v229()

                        if v1450 and v1450.activeGame then
                            v1450.activeGame.isDrawing = false
                            v1450.activeGame.drawingStart = nil
                        end
                    end)
                    task.wait(1)
                end
            end
        end)
    end

    t1[2] = {
        Min = 0.5,
        Max = 15,
        Default = 5,
    }
    t1[3] = function(p115)
        n12 = p115

        if u221 then
            v231()
            v232()
        end
    end

    t1[1]:Slider({
        Title = 'Per sec auto gen',
        Desc = 'Set 4.2 pls',
        Icon = 'clock',
        Step = 0.5,
        Value = t1[2],
        Callback = t1[3],
    })

    t1[3] = 'autoGen'

    local Toggle = t1[1].Toggle

    t1[2] = function(p116)
        u221 = p116

        if p116 then
            v232()
            u7:Notify({
                Title = 'Generator',
                Content = 'ON',
                Duration = 3,
                Icon = 'sun',
            })

            return
        end

        v231()
        u7:Notify({
            Title = 'Generator',
            Content = 'OFF',
            Duration = 3,
            Icon = 'square',
        })
    end

    local v244 = Toggle(t1[1], {
        Title = 'Auto Generator',
        Desc = 'per sec auto gen',
        Icon = 'sun',
        Type = 'Checkbox',
        Value = false,
        Callback = t1[2],
    })

    t3[t1[3] ] = v244
    t1[3] = 'puzzleESP'

    local Toggle2 = v218.Toggle

    t1[1] = function(p117)
        u224 = p117

        if p117 then
            v239()
            u7:Notify({
                Title = 'Puzzle ESP',
                Content = 'ON',
                Duration = 2,
                Icon = 'eye',
            })

            return
        end

        v238()
        u7:Notify({
            Title = 'Puzzle ESP',
            Content = 'OFF',
            Duration = 2,
            Icon = 'eye-off',
        })
    end

    local v246 = Toggle2(v218, {
        Title = 'Puzzle ESP',
        Desc = 'helper generator for legit players',
        Icon = 'eye',
        Type = 'Checkbox',
        Locked = false,
        Value = false,
        Callback = t1[1],
    })

    t3[t1[3] ] = v246
    t1[3] = {
        Min = 0.05,
        Max = 0.5,
        Default = 0.08,
    }

    local Slider = v219.Slider

    t1[2] = function(p118)
        n13 = p118

        if u225 then
            v240()
            v242()
        end
    end

    Slider(v219, {
        Title = 'per sec',
        Desc = 'use 0.06',
        Icon = 'clock',
        Locked = false,
        Step = 0.02,
        Value = t1[3],
        Callback = t1[2],
    })

    t1[3] = 'autoSolve'
    t1[1] = function(p119)
        u225 = p119

        if p119 then
            v242()
            u7:Notify({
                Title = 'Puzzle',
                Content = 'Auto Solve ON',
                Duration = 3,
                Icon = 'zap',
            })

            return
        end

        v240()
        u7:Notify({
            Title = 'Puzzle',
            Content = 'Auto Solve OFF',
            Duration = 3,
            Icon = 'square',
        })
    end
    t3[t1[3] ] = v219:Toggle({
        Title = 'Auto Solve Puzzle',
        Desc = 'Beta',
        Icon = 'zap',
        Type = 'Checkbox',
        Value = false,
        Locked = false,
        Callback = t1[1],
    })

    u89.CharacterAdded:Connect(function()
        v233()

        if u221 then
            task.wait(2)
            v231()
            v232()
        end
        if u225 then
            task.wait(2)
            v240()
            v242()
        end
        if u224 then
            task.wait(1)
            v239()
        end
    end)

    t54 = {
        RunService = game:GetService('RunService'),
        Players = game:GetService('Players'),
    }
    t54.LocalPlayer = t54.Players.LocalPlayer
    t54.TabAB = v20:Tab({
        Title = 'AutoBlock',
        Icon = 'shield',
        Locked = false,
    })
    t54.Paragraph = t54.TabAB:Paragraph({
        Title = 'THX FOR w0rmy for making autoblock <3',
        Desc = 'Beta Version',
        Color = 'Red',
        Image = '',
        ImageSize = 30,
        Thumbnail = '',
        ThumbnailSize = 80,
        Locked = false,
    })
    t54.SecMain = t54.TabAB:Section({
        Title = 'AutoBlock',
        Icon = 'shield',
        Locked = false,
    })
    t54.SecSet = t54.TabAB:Section({
        Title = 'Settings',
        Icon = 'settings',
        Locked = false,
    })
    t54.SecWall = t54.TabAB:Section({
        Title = 'Wall Check',
        Icon = 'layout',
        Locked = false,
    })
    t54.SecFC = t54.TabAB:Section({
        Title = 'FaceCheck',
        Icon = 'eye',
        Locked = false,
    })
    t54.SecRadVis = t54.TabAB:Section({
        Title = 'Radius Visual',
        Icon = 'circle',
        Locked = false,
    })
    t54.SecConeVis = t54.TabAB:Section({
        Title = 'Cone Visual',
        Icon = 'triangle',
        Locked = false,
    })
    t54.SecFCSet = t54.TabAB:Section({
        Title = 'FaceCheck Settings',
        Icon = 'sliders',
        Locked = false,
    })
    t54.SecHB = t54.TabAB:Section({
        Title = 'Hitbox Block',
        Icon = 'box',
        Locked = false,
    })
    t54.swingSoundIds = {
        '112809109188560',
        '109348678063422',
        '140242176732868',
        '104910828105172',
        '75330693422988',
        '128195973631079',
        '104625283622511',
        '105316545074913',
        '82336352305186',
        '126131675979001',
        '120059928759346',
        '98675142200448',
        '101698569375359',
        '79980897195554',
        '119583605486352',
        '128856426573270',
        '115026634746636',
        '98111231282218',
        '117173212095661',
        '133509103047518',
        '128137868531863',
        '139688966958293',
        '94317217837143',
        '74809026448465',
        '108610718831698',
        '84307400688050',
        '127557531826290',
        '80516583309685',
        '89004992452376',
        '85853080745515',
        '131406927389838',
        '105204810054381',
        '122667026674669',
        '128367348686124',
    }
    t54.swingSoundSet = {}

    for _, v in ipairs(t54.swingSoundIds)do
        local swingSoundSet = t54.swingSoundSet

        t1[1] = 'rbxassetid://' .. v
        swingSoundSet[t1[1] ] = true
    end

    t54.autoblockEnabled = false
    t54.betterAutoblockEnabled = false
    t54.activeSwings = {}
    t54.BetterLoop = nil
    t54.abRadius = 25
    t54.abBlockTime = 0.05
    t54.wallCheckEnabled = false
    t54.faceCheckEnabled = false
    t54.fcVisEnabled = false
    t54.radVisEnabled = false
    t54.fcFOV = 90
    t54.fcDistance = 30
    t54.fcRadiusColor = Color3.fromRGB(255, 50, 50)
    t54.fcConeColorNormal = Color3.fromRGB(160, 60, 255)
    t54.fcConeColorInside = Color3.fromRGB(50, 255, 100)
    t54.hitboxEnabled = false
    t54.hbSizeX = 8
    t54.hbSizeY = 6
    t54.hbSizeZ = 8
    t54.hbColor = Color3.fromRGB(100, 200, 255)
    t54.hbTransp = 0.5
    t54.hbOffsetX = 0
    t54.hbOffsetY = 0
    t54.hbOffsetZ = 0
    t54.killerHitboxes = {}
    t54.hbFolder = Instance.new('Folder')
    t54.hbFolder.Name = '_HBFolder'
    t54.hbFolder.Parent = workspace
    t54.killerSet = {}

    task.spawn(function()
        while true do
            local t55 = {}
            local t56 = {}
            local t57 = {}
            local Players = workspace:FindFirstChild('Players')

            if Players then
                local Killers = Players:FindFirstChild('Killers')

                if Killers then
                    for _, child in ipairs(Killers:GetChildren())do
                        if child:IsA('Model') and not t56[child] then
                            t56[child] = true

                            table.insert(t57, child)
                        end
                    end
                end
            end

            local Killers = workspace:FindFirstChild('Killers')

            if Killers then
                local GetChildren = Killers.GetChildren

                for _, v in ipairs(GetChildren(Killers))do
                    if v:IsA('Model') and not t56[v] then
                        t56[v] = true

                        table.insert(t57, v)
                    end
                end
            end

            for _, v in ipairs(t57)do
                t55[v] = true
            end

            t54.killerSet = t55

            task.wait(2)
        end
    end)

    function t54.getKillers()
        local t58 = {}

        for k in pairs(t54.killerSet)do
            table.insert(t58, k)
        end

        return t58
    end
    function t54.getServerPing()
        local ok, result = pcall(function()
            return game:GetService('Stats').Network.ServerStatsItem['Data Ping'].Value
        end)

        return (ok and result or 100) / 1000
    end
    function t54.getPredictedRoot(p120)
        local v716 = t54.getServerPing()
        local vector3 = Vector3.new(0, 0, 0)

        pcall(function()
            vector3 = p120.AssemblyLinearVelocity
        end)

        return p120.Position + vector3 * v716, p120.CFrame.LookVector
    end
    function t54.isLocalPlayerKiller()
        local Character = t54.LocalPlayer.Character

        if not Character then
            return false
        end

        local function v719(p121)
            if not p121 then
                return false
            end

            local GetChildren = p121.GetChildren

            for _, v in ipairs(GetChildren(p121))do
                if v == Character then
                    return true
                end
            end

            return false
        end

        local Players = workspace:FindFirstChild('Players')

        if Players and v719(Players:FindFirstChild('Killers')) then
            return true
        end
        if v719(workspace:FindFirstChild('Killers')) then
            return true
        end

        return false
    end
    function t54.getModelRoot(p122)
        return p122:FindFirstChild('HumanoidRootPart') or (p122:FindFirstChild('Head') or p122:FindFirstChildWhichIsA('BasePart'))
    end
    function t54.getPlayerRoot()
        local Character = t54.LocalPlayer.Character

        return Character and Character:FindFirstChild('HumanoidRootPart')
    end
    function t54.getFloorY(p123)
        local _workspace = workspace
        local t59 = {
            Vector3.new(0, -50, 0),
        }
        local raycastResult = _workspace:Raycast(p123, v2(t59))

        return raycastResult and raycastResult.Position.Y + 0.05 or p123.Y - 3
    end
    function t54.rotateY(p124, p125)
        local v729 = math.cos(p125)
        local v730 = math.sin(p125)

        return Vector3.new(p124.X * v729 - p124.Z * v730, 0, p124.X * v730 + p124.Z * v729)
    end
    function t54.isInConeForKiller(p126)
        local Character = t54.LocalPlayer.Character

        if not Character or not p126 then
            return false
        end

        local v733, v734 = t54.getPredictedRoot(p126)
        local vector3 = Vector3.new(v734.X, 0, v734.Z)

        if vector3.Magnitude < 0.01 then
            return false
        end

        local Unit = vector3.Unit
        local v737 = v733.X + Unit.X * 0.8
        local v738 = v733.Z + Unit.Z * 0.8
        local fcDistance = t54.fcDistance
        local fcFOV = t54.fcFOV
        local GetChildren = Character.GetChildren
        local v742 = fcFOV / 2

        for _, v in ipairs(GetChildren(Character))do
            if not v:IsA('BasePart') then
                continue
            end

            local v745 = v.Position.X - v737
            local v746 = v.Position.Z - v738
            local v747 = math.sqrt(v745 * v745 + v746 * v746)

            if v747 <= fcDistance then
                if v747 < 0.01 then
                    return true
                end
                if not (v742 >= math.deg((math.acos((math.clamp((v745 * Unit.X + v746 * Unit.Z) / v747, -1, 1)))))) then
                    continue
                end

                return true
            end
        end

        return false
    end
    function t54.triggerBlock()
        task.spawn(function()
            pcall(function()
                game:GetService('ReplicatedStorage').Modules.Network.Network.RemoteEvent:FireServer('UseActorAbility', {
                    buffer.fromstring('\3\5\0\0\0Block'),
                })
            end)
        end)
    end

    t54.wallParams = RaycastParams.new()
    t54.wallParams.FilterType = Enum.RaycastFilterType.Exclude

    function t54.hasWallBetween(p127)
        local v749 = t54.getPlayerRoot()
        local v750 = t54.getModelRoot(p127)

        if not v749 or not v750 then
            return false
        end

        local Character = t54.LocalPlayer.Character
        local t60 = {p127}

        if Character then
            table.insert(t60, Character)
        end

        t54.wallParams.FilterDescendantsInstances = t60

        local raycastResult = workspace:Raycast(v749.Position, v750.Position - v749.Position, t54.wallParams)

        if not raycastResult then
            return false
        end

        local Instance2 = raycastResult.Instance

        while Instance2 do
            if Instance2 == p127 then
                return false
            end

            Instance2 = Instance2.Parent
        end

        return true
    end
    function t54.isAnyPartInRadius(p128)
        local Character = t54.LocalPlayer.Character

        if not Character then
            return false
        end

        for _, child in ipairs(Character:GetChildren())do
            if not child:IsA('BasePart') then
                continue
            end

            local GetDescendants = p128.GetDescendants

            for _, v in ipairs(GetDescendants(p128))do
                if v:IsA('BasePart') and (v.Position - child.Position).Magnitude <= t54.abRadius then
                    return true
                end
            end

            local v762 = t54.getModelRoot(p128)

            if v762 and (v762.Position - child.Position).Magnitude <= t54.abRadius then
                return true
            end
        end

        return false
    end
    function t54.isPlayerInHitbox(p129)
        if not p129 or not p129.Parent then
            return false
        end

        local Character = t54.LocalPlayer.Character

        if not Character then
            return false
        end

        local hbSizeX = t54.hbSizeX
        local v766 = t54
        local v767 = hbSizeX / 2
        local hbSizeY = v766.hbSizeY
        local v769 = t54
        local v770 = hbSizeY / 2
        local v771 = v769.hbSizeZ / 2
        local GetChildren = Character.GetChildren

        for _, v in ipairs(GetChildren(Character))do
            if not v:IsA('BasePart') then
                continue
            end

            local v775 = p129.CFrame:PointToObjectSpace(v.Position)

            if v767 >= math.abs(v775.X) and (v770 >= math.abs(v775.Y) and v771 >= math.abs(v775.Z)) then
                return true
            end
        end

        return false
    end
    function t54.killerDetected(p130)
        if t54.hitboxEnabled then
            local v777 = t54.killerHitboxes[p130]

            return not not v777 and not not t54.isPlayerInHitbox(v777)
        end
        if t54.faceCheckEnabled then
            local v778 = t54.getModelRoot(p130)

            return not not v778 and not not t54.isInConeForKiller(v778)
        end

        return t54.isAnyPartInRadius(p130)
    end
    function t54.removeHitbox(p131)
        local v780 = t54.killerHitboxes[p131]

        if v780 then
            pcall(function()
                v780:Destroy()
            end)

            t54.killerHitboxes[p131] = nil
        end
    end
    function t54.removeAllHitboxes()
        for k in pairs(t54.killerHitboxes)do
            t54.removeHitbox(k)
        end
    end
    function t54.updateAllHitboxes()
        for _, v in pairs(t54.killerHitboxes)do
            if v and v.Parent then
                v.Size = Vector3.new(t54.hbSizeX, t54.hbSizeY, t54.hbSizeZ)
                v.Color = t54.hbColor
                v.Transparency = t54.hbTransp
            end
        end
    end
    function t54.updateHitboxOffset()
        for _, v in pairs(t54.killerHitboxes)do
            if v and v.Parent then
                local HBWeld = v:FindFirstChild('HBWeld')

                if HBWeld then
                    HBWeld.C0 = CFrame.new(t54.hbOffsetX, t54.hbOffsetY, t54.hbOffsetZ)
                end
            end
        end
    end
    function t54.getOrCreateHitbox(p132)
        local v788 = t54.killerHitboxes[p132]

        if v788 and v788.Parent then
            return v788
        end

        local v789 = t54.getModelRoot(p132)

        if not v789 then
            return nil
        end

        local Part = Instance.new('Part')

        Part.Name = 'KillerHitbox'
        Part.Anchored = false
        Part.CanCollide = false
        Part.CanTouch = false
        Part.CastShadow = false
        Part.Massless = true
        Part.Material = Enum.Material.ForceField
        Part.Color = t54.hbColor
        Part.Transparency = t54.hbTransp
        Part.Size = Vector3.new(t54.hbSizeX, t54.hbSizeY, t54.hbSizeZ)
        Part.CFrame = v789.CFrame * CFrame.new(t54.hbOffsetX, t54.hbOffsetY, t54.hbOffsetZ)

        local Motor6D = Instance.new('Motor6D')

        Motor6D.Name = 'HBWeld'
        Motor6D.Part0 = v789
        Motor6D.Part1 = Part
        Motor6D.C0 = CFrame.new(t54.hbOffsetX, t54.hbOffsetY, t54.hbOffsetZ)
        Motor6D.C1 = CFrame.new(0, 0, 0)
        Motor6D.Parent = Part
        Part.Parent = t54.hbFolder
        t54.killerHitboxes[p132] = Part

        return Part
    end

    t54.tracked = {}
    t54.addedConn = nil

    function t54.untrack(p133)
        local v793 = t54.tracked[p133]

        if not v793 then
            return
        end

        for _, v in ipairs(v793.conns)do
            local v796 = v

            pcall(function()
                v796:Disconnect()
            end)
        end

        t54.tracked[p133] = nil
    end
    function t54.getSoundKiller(p134)
        local p134Parent = p134.Parent

        while p134Parent and p134Parent ~= workspace do
            if p134Parent:IsA('Model') then
                if t54.killerSet[p134Parent] then
                    return p134Parent
                end

                return nil
            end

            p134Parent = p134Parent.Parent
        end

        return nil
    end
    function t54.tryBlock(p135)
        if not t54.autoblockEnabled then
            return
        end
        if #t54.swingSoundIds > 0 and not t54.swingSoundSet[p135.SoundId] then
            return
        end

        local v800 = t54.getSoundKiller(p135)

        if not v800 then
            return
        end
        if not t54.killerDetected(v800) then
            return
        end
        if t54.wallCheckEnabled and t54.hasWallBetween(v800) then
            return
        end

        local v801 = math.max(0, t54.abBlockTime - t54.getServerPing() * 0.5)

        task.delay(v801, function()
            t54.triggerBlock()
        end)
    end
    function t54.handleSoundStart(p136)
        if not t54.autoblockEnabled then
            return
        end
        if not p136 or not p136.Parent then
            return
        end
        if not p136:IsA('Sound') then
            return
        end

        t54.registerActiveSwing(p136)

        local v803 = t54.tracked[p136]

        if v803 then
            if v803.fired then
                return
            end

            v803.fired = true

            task.delay(0.05, function()
                if t54.tracked[p136] then
                    t54.tracked[p136].fired = false
                end
            end)
        end

        t54.tryBlock(p136)
    end
    function t54.trackSound(p137)
        if t54.tracked[p137] then
            return
        end

        t54.tracked[p137] = {
            conns = {},
            fired = false,
        }

        local v805 = t54.tracked[p137]

        table.insert(v805.conns, p137:GetPropertyChangedSignal('Playing'):Connect(function()
            if p137.Playing then
                t54.handleSoundStart(p137)
            end
        end))
        table.insert(v805.conns, p137.Played:Connect(function()
            t54.handleSoundStart(p137)
        end))
        table.insert(v805.conns, p137:GetPropertyChangedSignal('SoundId'):Connect(function()
            if p137.Playing then
                t54.handleSoundStart(p137)
            end
        end))
        table.insert(v805.conns, p137.AncestryChanged:Connect(function(_, parent)
            if parent == nil then
                t54.untrack(p137)
            end
        end))

        if p137.Playing then
            t54.handleSoundStart(p137)
        end
    end
    function t54.startAutoBlock()
        if t54.addedConn then
            t54.addedConn:Disconnect()

            t54.addedConn = nil
        end

        for k in pairs(t54.killerSet)do
            for _, descendant in ipairs(k:GetDescendants())do
                if descendant:IsA('Sound') then
                    t54.trackSound(descendant)
                end
            end
        end

        t54.addedConn = workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA('Sound') and t54.getSoundKiller(descendant) then
                t54.trackSound(descendant)
            end
        end)
    end
    function t54.stopAutoBlock()
        if t54.addedConn then
            t54.addedConn:Disconnect()

            t54.addedConn = nil
        end

        for k in pairs(t54.tracked)do
            t54.untrack(k)
        end
    end
    function t54.passesDetection(p139)
        if not t54.killerDetected(p139) then
            return false
        end
        if t54.wallCheckEnabled and t54.hasWallBetween(p139) then
            return false
        end

        return true
    end
    function t54.registerActiveSwing(p140)
        if not t54.betterAutoblockEnabled then
            return
        end
        if not p140 or not p140:IsA('Sound') then
            return
        end
        if #t54.swingSoundIds > 0 and not t54.swingSoundSet[p140.SoundId] then
            return
        end

        local v812 = t54.getSoundKiller(p140)

        if not v812 then
            return
        end
        if not t54.activeSwings[p140] then
            t54.activeSwings[p140] = {
                killer = v812,
                blocked = false,
            }
        end
    end
    function t54.startBetterLoop()
        if t54.BetterLoop then
            t54.BetterLoop:Disconnect()
        end

        t54.BetterLoop = t54.RunService.RenderStepped:Connect(function()
            if not t54.betterAutoblockEnabled or not t54.autoblockEnabled then
                return
            end
            if t54.isLocalPlayerKiller() then
                return
            end

            for k, v in pairs(t54.activeSwings)do
                local v1212 = k

                if not v1212 or (not v1212.Parent or not v1212.Playing) then
                    t54.activeSwings[v1212] = nil
                elseif not v.blocked then
                    local killer = v.killer

                    if killer and killer.Parent then
                        if t54.passesDetection(killer) then
                            v.blocked = true

                            t54.triggerBlock()
                        end
                    else
                        t54.activeSwings[v1212] = nil
                    end
                end
            end
        end)
    end
    function t54.stopBetterLoop()
        if t54.BetterLoop then
            t54.BetterLoop:Disconnect()

            t54.BetterLoop = nil
        end

        t54.activeSwings = {}
    end

    t54.visFolder = Instance.new('Folder')
    t54.visFolder.Name = '_FCVisFolder'
    t54.visFolder.Parent = workspace
    t54.partPool = {}
    t54.usedParts = 0
    t54.RAD_SEGMENTS = 40
    t54.radVisMaxDist2 = 90000
    t54.radCircleLUT = {}

    for i = 0, t54.RAD_SEGMENTS do
        t1[2] = t54.RAD_SEGMENTS

        local v253 = i / t1[2] * 3.141592653589793 * 2

        t1[1] = t54.radCircleLUT

        local v254 = math.cos(v253)

        t1[2] = math.sin

        local t61 = {
            v254,
            t1[2](v253),
        }

        t1[1][i] = t61
    end

    function t54.getVisPart(p141)
        if not t54.partPool[p141] then
            local Part = Instance.new('Part')

            Part.Name = 'FCPart'
            Part.Anchored = true
            Part.CanCollide = false
            Part.CanTouch = false
            Part.CastShadow = false
            Part.Material = Enum.Material.Neon
            Part.Transparency = 1
            Part.Size = Vector3.new(1, 0.08, 1)
            Part.Color = Color3.new(1, 1, 1)
            Part.Parent = t54.visFolder
            t54.partPool[p141] = Part
        end

        return t54.partPool[p141]
    end
    function t54.resetVisParts()
        for i = 1, t54.usedParts do
            t54.partPool[i].Transparency = 1
        end

        t54.usedParts = 0
    end
    function t54.placeLine(p142, p143, p144, p145, p146)
        local Magnitude = (p143 - p142).Magnitude

        if Magnitude < 0.01 then
            return
        end

        local v822 = t54
        local s1 = 'usedParts'

        v822[s1] = v822[s1] + 1

        local v824 = t54.getVisPart(t54.usedParts)

        v824.Size = Vector3.new(p146 or 0.18, 0.08, Magnitude)
        v824.CFrame = CFrame.lookAt((p142 + p143) / 2, p143)
        v824.Color = p144
        v824.Transparency = p145 or 0.15
    end
    function t54.placeDot(p147, p148, p149, p150)
        local v829 = t54

        v829.usedParts = v829.usedParts + 1

        local v830 = t54.getVisPart(t54.usedParts)
        local v831 = p150 or 0.45

        v830.Size = Vector3.new(v831, v831, v831)
        v830.CFrame = CFrame.new(p147)
        v830.Color = p148
        v830.Transparency = p149 or 0
    end
    function t54.drawRadiusWithParts(p151)
        if not t54.radVisEnabled then
            return
        end

        local v833, _ = t54.getPredictedRoot(p151)
        local abRadius = t54.abRadius
        local v836 = t54.getPlayerRoot()
        local v837 = false

        if v836 then
            local v838 = v836.Position.X - v833.X
            local v839 = v836.Position.Z - v833.Z
            local v840 = v839 * v839

            v837 = v838 * v838 + v840 <= abRadius * abRadius
        end

        local v841 = v837
        local v842 = t54.getFloorY(v833) + 0.1

        if v837 then
            v841 = Color3.fromRGB(255, 80, 80)
        end

        local v843 = v841 or t54.fcRadiusColor
        local v844 = not v837 and 0.28 or 0.08
        local v845 = not v837 and 0.2 or 0.32
        local radCircleLUT = t54.radCircleLUT
        local v847

        for i = 0, t54.RAD_SEGMENTS do
            local v849 = radCircleLUT[i]
            local vector3 = Vector3.new(v833.X + v849[1] * abRadius, v842, v833.Z + v849[2] * abRadius)

            if v847 then
                t54.placeLine(v847, vector3, v843, v844, v845)
            end

            v847 = vector3
        end
    end
    function t54.drawConeWithParts(p152, p153)
        if not t54.fcVisEnabled then
            return
        end

        local v853 = p153 and t54.fcConeColorInside or t54.fcConeColorNormal
        local v854 = not p153 and 0.2 or 0.05
        local v855 = not p153 and 0.1 or 0
        local v856 = not p153 and 0.18 or 0.28
        local _math = math
        local v858 = not p153 and 0.4 or 0.55
        local v859 = _math.rad(t54.fcFOV / 2)
        local fcDistance = t54.fcDistance
        local v861, v862 = t54.getPredictedRoot(p152)
        local v863 = t54.getFloorY(v861) + 0.1
        local vector3 = Vector3.new(v862.X, 0, v862.Z)

        if vector3.Magnitude < 0.01 then
            vector3 = Vector3.new(0, 0, 1)
        end

        local Unit = vector3.Unit
        local v866 = v861.X + Unit.X * 0.8
        local v867 = v861.Z + Unit.Z * 0.8
        local vector3_2 = Vector3.new(v866, v863, v867)
        local v869 = t54.rotateY(Unit, -v859)
        local v870 = t54.rotateY(Unit, v859)
        local vector3_3 = Vector3.new(v866 + v869.X * fcDistance, v863, v867 + v869.Z * fcDistance)
        local vector3_4 = Vector3.new(v866 + v870.X * fcDistance, v863, v867 + v870.Z * fcDistance)
        local v873 = (vector3_3 + vector3_4) / 2 + Unit * (fcDistance * 0.18)

        t54.placeLine(vector3_2, vector3_3, v853, v854, v856)
        t54.placeLine(vector3_2, vector3_4, v853, v854, v856)
        t54.placeLine(vector3_3, v873, v853, v854, v856)
        t54.placeLine(vector3_4, v873, v853, v854, v856)
        t54.placeDot(vector3_2, v853, v855, v858)
        t54.placeDot(vector3_3, v853, v855, v858)
        t54.placeDot(vector3_4, v853, v855, v858)
        t54.placeDot(v873, v853, v855, v858)
    end

    t54.FCLoop = nil
    t54.HBLoop = nil

    function t54.updateFCLoop()
        local v874 = t54.fcVisEnabled or t54.radVisEnabled

        if v874 and not t54.FCLoop then
            t54.FCLoop = t54.RunService.RenderStepped:Connect(function()
                if t54.isLocalPlayerKiller() then
                    t54.resetVisParts()

                    return
                end

                t54.resetVisParts()

                for _, v in ipairs(t54.getKillers())do
                    local v1216 = t54.getModelRoot(v)

                    if v1216 then
                        local v1217 = t54.isInConeForKiller(v1216)

                        t54.drawRadiusWithParts(v1216)
                        t54.drawConeWithParts(v1216, v1217)
                    end
                end
            end)

            return
        end
        if not v874 and t54.FCLoop then
            t54.FCLoop:Disconnect()

            t54.FCLoop = nil

            t54.resetVisParts()
        end
    end
    function t54.stopHitboxBlock()
        if t54.HBLoop then
            t54.HBLoop:Disconnect()

            t54.HBLoop = nil
        end

        t54.removeAllHitboxes()
    end
    function t54.startHitboxBlock()
        if t54.HBLoop then
            t54.HBLoop:Disconnect()
        end

        t54.HBLoop = t54.RunService.RenderStepped:Connect(function()
            if not t54.hitboxEnabled then
                return
            end
            if t54.isLocalPlayerKiller() then
                t54.removeAllHitboxes()

                return
            end

            local v1218 = t54.getKillers()
            local t62 = {}

            for v1222, v1223 in ipairs(v1218)do
                t62[v1223] = true

                local v1224 = t54.getOrCreateHitbox(v1223)

                if v1224 then
                    local vector3 = Vector3.new(t54.hbSizeX, t54.hbSizeY, t54.hbSizeZ)

                    if vector3 ~= v1224.Size then
                        v1224.Size = vector3
                    end
                    if v1224.Color ~= t54.hbColor then
                        v1224.Color = t54.hbColor
                    end
                    if v1224.Transparency ~= t54.hbTransp then
                        v1224.Transparency = t54.hbTransp
                    end
                end
            end
            for k in pairs(t54.killerHitboxes)do
                local v1227 = k

                if not t62[v1227] then
                    t54.removeHitbox(v1227)
                end
            end
        end)
    end

    local SecMain = t54.SecMain
    local Toggle3 = SecMain.Toggle

    t1[1] = function(p154)
        t54.autoblockEnabled = p154

        if p154 then
            t54.startAutoBlock()
        else
            t54.stopAutoBlock()
        end

        local v876 = u7
        local v877 = not p154 and 'OFF' or 'ON'

        v876:Notify({
            Title = 'AutoBlock',
            Content = v877,
            Duration = 2,
            Icon = 'shield',
        })
    end
    t3.abAutoblock = Toggle3(SecMain, {
        Title = 'AutoBlock',
        Desc = 'Auto-block on killer swing sounds',
        Icon = 'shield',
        Type = 'Checkbox',
        Value = false,
        Callback = t1[1],
    })

    local SecMain2 = t54.SecMain
    local Toggle4 = SecMain2.Toggle

    t1[1] = function(p155)
        t54.betterAutoblockEnabled = p155

        if p155 then
            t54.startBetterLoop()

            for k in pairs(t54.tracked)do
                local v880 = k

                if v880 and (v880.Parent and v880.Playing) then
                    t54.registerActiveSwing(v880)
                end
            end
        else
            t54.stopBetterLoop()
        end

        local v881 = u7
        local v882 = not p155 and 'OFF' or 'ON'

        v881:Notify({
            Title = 'Better AutoBlock',
            Content = v882,
            Duration = 2,
            Icon = 'zap',
        })
    end
    t3.abBetter = Toggle4(SecMain2, {
        Title = 'Better AutoBlock',
        Desc = "Don't use this if the killer is smart (bite per block)",
        Icon = 'zap',
        Type = 'Checkbox',
        Value = false,
        Callback = t1[1],
    })

    local SecMain3 = t54.SecMain
    local Button = SecMain3.Button

    t1[2] = function()
        local t63 = {}

        local function v884(...)
            local t64 = {}

            for _, v in ipairs({...})do
                table.insert(t64, (tostring(v)))
            end

            local v1231 = table.concat(t64, ' ')

            print(v1231)
            table.insert(t63, v1231)
        end

        v884('=== AUTOBLOCK DEBUG ===')
        v884('autoblockEnabled:', t54.autoblockEnabled)
        v884('betterAutoblockEnabled:', t54.betterAutoblockEnabled)
        v884('hitboxEnabled:', t54.hitboxEnabled)
        v884('faceCheckEnabled:', t54.faceCheckEnabled)
        v884('wallCheckEnabled:', t54.wallCheckEnabled)
        v884('abRadius:', t54.abRadius)
        v884('fcFOV:', t54.fcFOV, '| fcDistance:', t54.fcDistance)
        v884('ping (s):', t54.getServerPing())
        v884('isKiller:', t54.isLocalPlayerKiller())

        local n15 = 0

        for _ in pairs(t54.tracked)do
            n15 += 1
        end

        v884('tracked sounds:', n15)

        local n16 = 0

        for _ in pairs(t54.activeSwings)do
            n16 += 1
        end

        v884('active swings:', n16)
        v884('--- Block Button ---')

        local PlayerGui = t54.LocalPlayer:FindFirstChildOfClass('PlayerGui')

        v884('PlayerGui:', PlayerGui and PlayerGui.Name or 'NIL')

        if PlayerGui then
            local MainUI = PlayerGui:FindFirstChild('MainUI', true)

            v884('MainUI:', MainUI and MainUI.Name or 'NIL')

            if MainUI then
                local AbilityContainer = MainUI:FindFirstChild('AbilityContainer', true)

                v884('AbilityContainer:', AbilityContainer and AbilityContainer.Name or 'NIL')

                if AbilityContainer then
                    local Block = AbilityContainer:FindFirstChild('Block', true)

                    v884('Block:', Block and Block.Name or 'NIL')

                    if Block then
                        local v893 = Block:FindFirstChildWhichIsA('TextButton', true) or (Block:FindFirstChildWhichIsA('ImageButton', true) or (Block:IsA('GuiButton') and Block or nil))

                        v884('Button:', v893 and v893.ClassName or 'NIL')
                    end
                end
            end
        end

        v884('--- Killer Sounds ---')

        for v896, v897 in ipairs(t54.getKillers())do
            v884('Killer:', v897.Name)

            local GetDescendants = v897.GetDescendants

            for _, v in ipairs(GetDescendants(v897))do
                if v:IsA('Sound') then
                    v884('  Sound:', v.Name, '| Id:', v.SoundId, '| inSet:', not t54.swingSoundSet[v.SoundId] and 'no' or 'YES', '| tracked:', not t54.tracked[v] and 'no' or 'YES', '| playing:', not v.Playing and 'no' or 'YES')
                end
            end
        end

        v884('--- Detection ---')

        local v901 = t54.getPlayerRoot()

        v884('PlayerRoot:', v901 and v901.Name or 'NIL')

        for _, v in ipairs(t54.getKillers())do
            local v904 = t54.getModelRoot(v)
            local s2 = '?'

            if v901 and v904 then
                s2 = math.floor((v904.Position - v901.Position).Magnitude)
            end

            v884('Killer:', v.Name, '| dist:', s2, '| inRadius:', not t54.isAnyPartInRadius(v) and 'no' or 'YES', '| inCone:', (not v904 or not t54.isInConeForKiller(v904)) and 'no' or 'YES', '| detected:', not t54.killerDetected(v) and 'no' or 'YES', '| wall:', not t54.hasWallBetween(v) and 'no' or 'YES')
        end

        local v906 = table.concat(t63, '\n')

        if setclipboard then
            setclipboard(v906)
        end

        u7:Notify({
            Title = 'Debug',
            Content = 'Copied to clipboard!',
            Duration = 3,
            Icon = 'clipboard',
        })
    end

    Button(SecMain3, {
        Title = 'Debug AutoBlock',
        Desc = 'Check sounds, zone and block button',
        Icon = 'terminal',
        Callback = t1[2],
    })

    local SecSet = t54.SecSet

    t1[3] = {
        Min = 5,
        Max = 150,
        Default = 25,
    }

    local Slider9 = SecSet.Slider

    t1[2] = function(p156)
        t54.abRadius = p156
    end

    Slider9(SecSet, {
        Title = 'Detection Radius',
        Desc = 'Studs',
        Icon = 'radio',
        Step = 1,
        Value = t1[3],
        Callback = t1[2],
    })

    local SecSet2 = t54.SecSet
    local Slider10 = SecSet2.Slider

    t1[3] = {
        Min = 0,
        Max = 2,
        Default = 0.05,
    }
    t1[2] = function(p157)
        t54.abBlockTime = p157
    end

    Slider10(SecSet2, {
        Title = 'Block Delay',
        Desc = 'Seconds to wait after sound before blocking',
        Icon = 'clock',
        Step = 0.05,
        Value = t1[3],
        Callback = t1[2],
    })

    local SecWall = t54.SecWall
    local Toggle5 = SecWall.Toggle

    t1[1] = function(p158)
        t54.wallCheckEnabled = p158

        local v910 = u7

        if p158 then
            p158 = 'ON'
        end

        local v911 = p158 or 'OFF'

        v910:Notify({
            Title = 'Wall Check',
            Content = v911,
            Duration = 2,
            Icon = 'layout',
        })
    end
    t3.abWall = Toggle5(SecWall, {
        Title = 'Wall Check',
        Desc = 'wallcheck system',
        Icon = 'layout',
        Type = 'Checkbox',
        Value = false,
        Callback = t1[1],
    })

    local SecFC = t54.SecFC
    local Toggle6 = SecFC.Toggle

    t1[1] = function(p159)
        t54.faceCheckEnabled = p159

        t54.updateFCLoop()

        local v913 = u7
        local v914 = not p159 and 'OFF' or 'ON'
        local v915 = not p159 and 'eye-off' or 'eye'

        v913:Notify({
            Title = 'FaceCheck',
            Content = v914,
            Duration = 2,
            Icon = v915,
        })
    end
    t3.abFace = Toggle6(SecFC, {
        Title = 'FaceCheck Logic',
        Desc = 'Antibait system',
        Icon = 'shield',
        Type = 'Checkbox',
        Value = false,
        Callback = t1[1],
    })

    local SecFCSet = t54.SecFCSet

    t1[3] = {
        Min = 10,
        Max = 180,
        Default = 90,
    }

    local Slider11 = SecFCSet.Slider

    t1[2] = function(p160)
        t54.fcFOV = p160
    end

    Slider11(SecFCSet, {
        Title = 'FOV Angle',
        Desc = "Width of killer's view cone in degrees",
        Icon = 'triangle',
        Step = 5,
        Value = t1[3],
        Callback = t1[2],
    })
end
do
    local SecFCSet = t54.SecFCSet

    t1[3] = {
        Min = 5,
        Max = 100,
        Default = 30,
    }
    t1[2] = function(p161)
        t54.fcDistance = p161
    end

    SecFCSet:Slider({
        Title = 'Detection Distance',
        Desc = 'Distance detection',
        Icon = 'radio',
        Step = 1,
        Value = t1[3],
        Callback = t1[2],
    })

    local SecRadVis = t54.SecRadVis
    local Toggle = SecRadVis.Toggle

    t1[1] = function(p162)
        t54.radVisEnabled = p162

        if not p162 then
            t54.resetVisParts()
        end

        t54.updateFCLoop()

        local v919 = u7
        local v920 = not p162 and 'OFF' or 'ON'

        v919:Notify({
            Title = 'Radius Visual',
            Content = v920,
            Duration = 2,
            Icon = 'circle',
        })
    end
    t3.abRadVis = Toggle(SecRadVis, {
        Title = 'Show Radius',
        Desc = 'Draw circle on the floor showing detection radius',
        Icon = 'circle',
        Type = 'Checkbox',
        Value = false,
        Callback = t1[1],
    })

    local SecRadVis2 = t54.SecRadVis
    local color3 = Color3.fromRGB(255, 50, 50)
    local Colorpicker = SecRadVis2.Colorpicker

    t1[2] = function(p163)
        t54.fcRadiusColor = p163
    end

    Colorpicker(SecRadVis2, {
        Title = 'Radius Color',
        Default = color3,
        Transparency = 0,
        Callback = t1[2],
    })

    local SecConeVis = t54.SecConeVis
    local Toggle7 = SecConeVis.Toggle

    t1[1] = function(p164)
        t54.fcVisEnabled = p164

        if not p164 then
            t54.resetVisParts()
        end

        t54.updateFCLoop()

        local v923 = u7
        local v924 = not p164 and 'OFF' or 'ON'

        v923:Notify({
            Title = 'Cone Visual',
            Content = v924,
            Duration = 2,
            Icon = 'triangle',
        })
    end
    t3.abCone = Toggle7(SecConeVis, {
        Title = 'Show Cone',
        Desc = 'Kite outline',
        Icon = 'triangle',
        Type = 'Checkbox',
        Value = false,
        Callback = t1[1],
    })

    local SecConeVis2 = t54.SecConeVis
    local color3_23 = Color3.fromRGB(160, 60, 255)
    local Colorpicker6 = SecConeVis2.Colorpicker

    t1[2] = function(p165)
        t54.fcConeColorNormal = p165
    end

    Colorpicker6(SecConeVis2, {
        Title = 'Cone Color (normal)',
        Default = color3_23,
        Transparency = 0,
        Callback = t1[2],
    })

    local SecConeVis3 = t54.SecConeVis

    t1[1] = Color3.fromRGB

    local Colorpicker7 = SecConeVis3.Colorpicker
    local v285 = t1[1](50, 255, 100)

    t1[2] = function(p166)
        t54.fcConeColorInside = p166
    end

    Colorpicker7(SecConeVis3, {
        Title = 'Cone Color (inside)',
        Default = v285,
        Transparency = 0,
        Callback = t1[2],
    })

    local SecHB = t54.SecHB
    local Toggle8 = SecHB.Toggle

    t1[1] = function(p167)
        t54.hitboxEnabled = p167

        if p167 then
            t54.startHitboxBlock()
        else
            t54.stopHitboxBlock()
        end

        local v928 = u7
        local v929 = not p167 and 'OFF' or 'ON'

        v928:Notify({
            Title = 'Hitbox Block',
            Content = v929,
            Duration = 2,
            Icon = 'box',
        })
    end
    t3.abHitbox = Toggle8(SecHB, {
        Title = 'Hitbox Block',
        Desc = 'Block when any body part enters killer hitbox (overrides radius/cone)',
        Icon = 'box',
        Type = 'Checkbox',
        Value = false,
        Callback = t1[1],
    })

    local SecHB2 = t54.SecHB
    local color3_24 = Color3.fromRGB(100, 200, 255)

    t1[2] = function(p168)
        t54.hbColor = p168

        t54.updateAllHitboxes()
    end

    SecHB2:Colorpicker({
        Title = 'Hitbox Color',
        Default = color3_24,
        Transparency = 0,
        Callback = t1[2],
    })

    local SecHB3 = t54.SecHB
    local Slider = SecHB3.Slider

    t1[3] = {
        Min = 0,
        Max = 0.95,
        Default = 0.5,
    }
    t1[2] = function(p169)
        t54.hbTransp = p169

        t54.updateAllHitboxes()
    end

    Slider(SecHB3, {
        Title = 'Transparency',
        Desc = '0 = solid, 0.95 = nearly invisible',
        Icon = 'eye',
        Step = 0.05,
        Value = t1[3],
        Callback = t1[2],
    })

    local SecHB4 = t54.SecHB

    t1[3] = {
        Min = 1,
        Max = 30,
        Default = 8,
    }

    local Slider12 = SecHB4.Slider

    t1[2] = function(p170)
        t54.hbSizeX = p170

        t54.updateAllHitboxes()
    end

    Slider12(SecHB4, {
        Title = 'Size X',
        Desc = 'Hitbox width',
        Icon = 'move-horizontal',
        Step = 0.5,
        Value = t1[3],
        Callback = t1[2],
    })

    local SecHB5 = t54.SecHB

    t1[3] = {
        Min = 1,
        Max = 20,
        Default = 6,
    }

    local Slider13 = SecHB5.Slider

    t1[2] = function(p171)
        t54.hbSizeY = p171

        t54.updateAllHitboxes()
    end

    Slider13(SecHB5, {
        Title = 'Size Y',
        Desc = 'Hitbox height',
        Icon = 'move-vertical',
        Step = 0.5,
        Value = t1[3],
        Callback = t1[2],
    })

    local SecHB6 = t54.SecHB
    local Slider14 = SecHB6.Slider

    t1[3] = {
        Min = 1,
        Max = 30,
        Default = 8,
    }
    t1[2] = function(p172)
        t54.hbSizeZ = p172

        t54.updateAllHitboxes()
    end

    Slider14(SecHB6, {
        Title = 'Size Z',
        Desc = 'Hitbox depth',
        Icon = 'move',
        Step = 0.5,
        Value = t1[3],
        Callback = t1[2],
    })

    local SecHB7 = t54.SecHB
    local Slider15 = SecHB7.Slider

    t1[3] = {
        Min = -10,
        Max = 10,
        Default = 0,
    }
    t1[2] = function(p173)
        t54.hbOffsetX = p173

        t54.updateHitboxOffset()
    end

    Slider15(SecHB7, {
        Title = 'Offset X',
        Desc = 'Left / Right',
        Icon = 'move-horizontal',
        Step = 0.25,
        Value = t1[3],
        Callback = t1[2],
    })

    local SecHB8 = t54.SecHB
    local Slider16 = SecHB8.Slider

    t1[3] = {
        Min = -5,
        Max = 5,
        Default = 0,
    }
    t1[2] = function(p174)
        t54.hbOffsetY = p174

        t54.updateHitboxOffset()
    end

    Slider16(SecHB8, {
        Title = 'Offset Y',
        Desc = 'Up / Down',
        Icon = 'move-vertical',
        Step = 0.25,
        Value = t1[3],
        Callback = t1[2],
    })
end

local SecHB = t54.SecHB
local Slider = SecHB.Slider

t1[3] = {
    Min = -10,
    Max = 10,
    Default = 0,
}
t1[2] = function(p175)
    t54.hbOffsetZ = p175

    t54.updateHitboxOffset()
end

Slider(SecHB, {
    Title = 'Offset Z',
    Desc = 'Forward / Back',
    Icon = 'move',
    Step = 0.25,
    Value = t1[3],
    Callback = t1[2],
})
t54.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(2)

    if t54.autoblockEnabled then
        t54.stopAutoBlock()
        t54.startAutoBlock()
    end
    if t54.hitboxEnabled then
        t54.stopHitboxBlock()
        t54.startHitboxBlock()
    end
    if t54.betterAutoblockEnabled then
        t54.stopBetterLoop()
        t54.startBetterLoop()
    end
end)

local v304 = v20:Tab({
    Title = 'Game',
    Icon = 'globe',
}):Section({
    Title = 'World',
    Icon = 'sun',
})
local n17 = 70
local n18 = 0
local n19 = 70
local n20 = 0
local u309 = false
local u310
local u311
local u312

t1[3] = function()
    if u312 then
        pcall(function()
            RunService:UnbindFromRenderStep('DLC_FOVLock')
        end)

        u312 = false
    end
    if u310 then
        u310:Disconnect()

        u310 = nil
    end

    local CurrentCamera = workspace.CurrentCamera

    u311 = CurrentCamera and CurrentCamera.FieldOfView or 70
    n19 = u311
    n20 = 0
    u312 = true

    RunService:BindToRenderStep('DLC_FOVLock', Enum.RenderPriority.Last.Value + 1, function(p176)
        local CurrentCamera2 = workspace.CurrentCamera

        if not CurrentCamera2 then
            return
        end

        n19 += (n17 - n19) * (p176 * 10)

        local v1234 = n20

        n20 += (n18 - v1234) * (p176 * 10)

        CurrentCamera2.FieldOfView = n19

        if n20 ~= 0 then
            local v1235 = 1 - n20 / 200

            CurrentCamera2.CFrame = CurrentCamera2.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, v1235, 0, 0, 0, 1)
        end
    end)
end
u312 = false

local v313 = t1[3]

local function v314()
    if u312 then
        pcall(function()
            RunService:UnbindFromRenderStep('DLC_FOVLock')
        end)
    end
    if u310 then
        u310:Disconnect()
    end

    local CurrentCamera = workspace.CurrentCamera

    if CurrentCamera then
        CurrentCamera.FieldOfView = u311 or 70
    end
end

t1[3] = v304.Toggle
t1[1] = function(p177)
    u309 = p177

    if p177 then
        v313()

        return
    end

    v314()
end
t1[3] = t1[3](v304, {
    Title = 'Enable FOV / Stretch',
    Icon = 'monitor',
    Value = false,
    Callback = t1[1],
})
t3.fov = t1[3]

local Slider17 = v304.Slider

t1[2] = {
    Min = 30,
    Max = 120,
    Default = 70,
}
t1[1] = function(p178)
    n17 = p178

    if not u309 then
        local CurrentCamera = workspace.CurrentCamera

        if CurrentCamera then
            CurrentCamera.FieldOfView = p178
        end
    end
end

Slider17(v304, {
    Title = 'FOV',
    Desc = 'FOVV!!',
    Step = 1,
    Value = t1[2],
    Callback = t1[1],
})

t1[2] = {
    Min = 0,
    Max = 180,
    Default = 0,
}

local Slider18 = v304.Slider

t1[1] = function(p179)
    n18 = p179
end

Slider18(v304, {
    Title = 'Stretch',
    Desc = 'stretch',
    Step = 1,
    Value = t1[2],
    Callback = t1[1],
})

t1[2] = game:GetService('Players')

game:GetService('RunService')
game:GetService('VirtualInputManager')

local _ = t1[2].LocalPlayer
local t65 = {}

t1[1] = function()
    local t66 = {}
    local Players = game:GetService('Players')
    local RunService2 = game:GetService('RunService')
    local ReplicatedStorage = game:GetService('ReplicatedStorage')
    local UserInputService = game:GetService('UserInputService')
    local VirtualInputManager = game:GetService('VirtualInputManager')
    local LocalPlayer = Players.LocalPlayer
    local CurrentCamera = workspace.CurrentCamera

    if _G.__SK8_CLEANUP then
        pcall(_G.__SK8_CLEANUP)
    end

    local t67 = {}

    local function v953(p180)
        if p180 then
            table.insert(t67, p180)
        end

        return p180
    end

    function _G.__SK8_CLEANUP()
        for _, v in ipairs(t67)do
            local v1239 = v

            pcall(function()
                if v1239.Connected then
                    v1239:Disconnect()
                end
            end)
        end

        pcall(function()
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end)
    end

    local function v954()
        local Character = LocalPlayer.Character

        if not Character then
            return nil
        end

        return Character, Character:FindFirstChildOfClass('Humanoid') or Character:FindFirstChildWhichIsA('Humanoid'), Character:FindFirstChild('HumanoidRootPart')
    end

    local v955 = v20:Tab({
        Title = 'Survivors',
        Icon = 'globe',
    })

    v955:Paragraph({
        Title = 'Added more soon!',
        Desc = 'Yeahh..',
        Color = 'Grey',
        Image = '',
        ImageSize = 30,
        Thumbnail = '',
        ThumbnailSize = 80,
        Locked = false,
    })

    local v956 = v955:Section({
        Title = 'Veronica',
        Icon = 'zap',
    })
    local t68 = {
        '117058860640843',
    }
    local u958 = true
    local u959 = false
    local u960

    local function v961(p181)
        if not p181 then
            return false
        end

        for _, v in ipairs(p181:GetPlayingAnimationTracks())do
            local v1247 = v.Animation and tostring(v.Animation.AnimationId):match('%d+')

            if v1247 and table.find(t68, v1247) then
                return true
            end
        end

        return false
    end
    local function v962()
        if not u959 then
            return
        end

        u959 = false

        if u960 then
            u960:Disconnect()

            u960 = nil
        end

        local _, v1249 = v954()
        local v1250 = v1249

        if v1250 then
            if false then
                v1250.WalkSpeed = nil
            end

            pcall(function()
                v1250:Move(Vector3.new(0, 0, 0))
            end)
        end
    end
    local function v963()
        if u959 or not u958 then
            return
        end

        local _, v1252, v1253 = v954()

        if not v1252 or not v1253 then
            return
        end

        u959 = true

        local _ = v1252.AutoRotate
        local _ = v1252.WalkSpeed
        local _ = UserInputService.MouseBehavior

        v1252.AutoRotate = false
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        u960 = RunService2.RenderStepped:Connect(function()
            if not u958 or not u959 then
                if u960 then
                    u960:Disconnect()

                    u960 = nil
                end

                return
            end

            local _, v1452, v1453 = v954()

            if not v1452 or not v1453 then
                return
            end

            local LookVector = CurrentCamera.CFrame.LookVector
            local vector3 = Vector3.new(LookVector.X, 0, LookVector.Z)

            if vector3.Magnitude < 0.1 then
                return
            end

            local Unit = vector3.Unit

            v1452.AutoRotate = false

            v1452:Move(Unit, false)

            local _, _, v1459 = v954()
            local v1460 = v1459 and v1459:FindFirstChild('SkatePointer')

            if v1460 and v1460:IsA('AlignOrientation') then
                v1460.Mode = Enum.OrientationAlignmentMode.OneAttachment
                v1460.RigidityEnabled = false
                v1460.MaxAngularVelocity = 90
                v1460.Responsiveness = 200
                v1460.CFrame = CFrame.lookAt(Vector3.zero, Unit)
            end
        end)
    end

    v953(RunService2.Heartbeat:Connect(function()
        if not u958 then
            if u959 then
                v962()
            end

            return
        end

        local _, v1258 = v954()

        if not v1258 then
            if u959 then
                v962()
            end

            return
        end
        if v961(v1258) then
            if not u959 then
                v963()

                return
            end
        elseif u959 then
            v962()
        end
    end))
    v953(LocalPlayer.CharacterAdded:Connect(function()
        if u960 then
            u960:Disconnect()
        end

        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end))

    local u964 = false
    local s3 = 'PC'
    local u966

    local function v967()
        if u966 and u966.Parent then
            return u966
        end

        local ok, result = pcall(function()
            return ReplicatedStorage:WaitForChild('Assets', 5):WaitForChild('Survivors', 5):WaitForChild('Veeronica', 5):WaitForChild('Behavior', 5)
        end)

        u966 = ok and result or nil

        return u966
    end
    local function v968()
        if pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
            task.wait(0.05)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        end) then
            return
        end

        pcall(function()
            keypress(Enum.KeyCode.Space)
            task.wait(0.05)
            keyrelease(Enum.KeyCode.Space)
        end)
    end
    local function v969()
        local PlayerGui = LocalPlayer:FindFirstChild('PlayerGui')
        local v1264

        if not PlayerGui then
            v1264 = nil
        else
            local MainUI = PlayerGui:FindFirstChild('MainUI')

            v1264 = MainUI and MainUI:FindFirstChild('SprintingButton')
        end

        local v1266 = v1264

        if not v1266 then
            return
        end

        local ok, result = pcall(function()
            return getconnections(v1266.MouseButton1Down)
        end)

        if ok and result then
            for _, v in pairs(result)do
                local v1271 = v

                pcall(function()
                    v1271:Fire()
                end)
                pcall(function()
                    if v1271.Function then
                        v1271:Function()
                    end
                end)
            end
        end
    end
    local function v970()
        local v1272 = v967()
        local Character = LocalPlayer.Character

        if not v1272 or not Character then
            return false
        end

        local GetDescendants = v1272.GetDescendants

        for _, v in ipairs(GetDescendants(v1272))do
            if not (v:IsA('Highlight') and v.Enabled) then
                continue
            end

            local vAdornee = v.Adornee

            if vAdornee and vAdornee == Character or vAdornee:IsDescendantOf(Character) then
                return true
            end
        end

        return false
    end

    v953(RunService2.Heartbeat:Connect(function()
        if not u964 then
            return
        end

        os.clock()

        if v970() and true then
            if s3 == 'Mobile' then
                v969()

                return
            end

            v968()
        end
    end))

    t3.freeMove = v956:Toggle({
        Title = 'Free Move',
        Icon = 'move',
        Value = true,
        Callback = function(p182)
            u958 = p182

            if not p182 then
                v962()
            end
        end,
    })
    t3.autoTrick = v956:Toggle({
        Title = 'Auto Trick',
        Icon = 'rotate-cw',
        Value = false,
        Callback = function(p183)
            u964 = p183
        end,
    })

    v956:Dropdown({
        Title = 'Auto Trick Mode',
        Desc = 'Working | Maybe',
        Values = {
            'PC',
            'Mobile',
        },
        Value = 'PC',
        Callback = function(p184)
            s3 = p184
        end,
    })

    local v971 = v955:Section({
        Title = 'Guest1337',
        Icon = 'zap',
    })
    local u972 = false
    local n21 = 6
    local n22 = 1
    local u975 = false
    local n23 = 26
    local WalkSpeed
    local u978

    local function v979(p185)
        if not p185 then
            return nil
        end

        local HumanoidRootPart = p185:FindFirstChild('HumanoidRootPart')

        if not HumanoidRootPart then
            HumanoidRootPart = p185:FindFirstChild('Torso') or (p185:FindFirstChild('UpperTorso') or (p185:FindFirstChild('Head') or p185:FindFirstChildWhichIsA('BasePart')))
        end

        return HumanoidRootPart
    end
    local function v980()
        local _, _, v1285 = v954()
        local v1286 = v1285

        if not v1286 then
            return nil
        end

        local huge = math.huge
        local u1288
        local v1289 = huge

        local function v1290(p186)
            if not p186 then
                return
            end
            if p186:IsA('Model') and p186:FindFirstChildWhichIsA('Humanoid') or p186:FindFirstChild('HumanoidRootPart') then
                local v1464 = v979(p186)

                if v1464 and (v1464.Position - v1286.Position).Magnitude < v1289 then
                    u1288 = v1464

                    return
                end
            else
                for _, child in ipairs(p186:GetChildren())do
                    if child:IsA('Model') then
                        local v1467 = v979(child)

                        if v1467 and (v1467.Position - v1286.Position).Magnitude < v1289 then
                            u1288 = v1467
                        end
                    end
                end
            end
        end

        local Players2 = workspace:FindFirstChild('Players')

        if Players2 then
            v1290(Players2:FindFirstChild('Killers'))
        end

        v1290(workspace:FindFirstChild('Killers'))

        return u1288
    end
    local function v981()
        if u975 or not u972 then
            return
        end
        if os.clock() - 0 < n23 then
            return
        end

        local _, v1296, v1297 = v954()
        local v1298 = v1296

        if not v1298 or not v1297 then
            return
        end
        if not v980() then
            u7:Notify({
                Title = 'HDT',
                Content = 'Killer not finded',
                Duration = 2,
                Icon = 'x',
            })

            return
        end

        u975 = true

        local elapsed = os.clock()

        pcall(function()
            WalkSpeed = v1298.WalkSpeed

            local _ = v1298.AutoRotate

            v1298.WalkSpeed = n21
            v1298.AutoRotate = false
        end)
        RunService2.RenderStepped:Connect(function(dt)
            if not u975 then
                return
            end
            if os.clock() - elapsed >= n22 then
                u975 = false

                local _, v1471 = v954()
                local v1472 = v1471

                if v1472 then
                    pcall(function()
                        v1472:Move(Vector3.zero, false)

                        if WalkSpeed ~= nil then
                            v1472.WalkSpeed = WalkSpeed
                        end
                        if u978 ~= nil then
                            v1472.AutoRotate = u978
                        end
                    end)
                end

                WalkSpeed = nil
                u978 = nil

                return
            end

            local _, v1474, v1475 = v954()
            local v1476 = v1474
            local v1477 = v1475

            if not v1476 or not v1477 then
                u975 = false

                local _, v1479 = v954()
                local v1480 = v1479

                if v1480 then
                    pcall(function()
                        v1480:Move(Vector3.zero, false)

                        if WalkSpeed ~= nil then
                            v1480.WalkSpeed = WalkSpeed
                        end
                        if u978 ~= nil then
                            v1480.AutoRotate = u978
                        end
                    end)
                end

                WalkSpeed = nil
                u978 = nil

                return
            end

            local v1481 = v980()

            if not v1481 then
                return
            end

            local Position = v1477.Position
            local vector3 = Vector3.new(v1481.Position.X - Position.X, 0, v1481.Position.Z - Position.Z)
            local Magnitude = vector3.Magnitude

            if Magnitude < 0.05 then
                v1476:Move(Vector3.zero, false)

                return
            end

            local Unit = vector3.Unit
            local v1486 = math.clamp(dt * 9, 0, 1)
            local u1487 = v1486

            pcall(function()
                v1477.CFrame = v1477.CFrame:Lerp(CFrame.lookAt(Position, Position + Unit), u1487)
            end)

            if Magnitude > 4 then
                pcall(function()
                    v1476:Move(Unit, false)
                end)
            else
                pcall(function()
                    v1476:Move(Vector3.zero, false)
                end)
            end
        end)
    end
    local function v982()
        local PlayerGui = LocalPlayer:FindFirstChild('PlayerGui')

        if not PlayerGui then
            return nil
        end

        local MainUI = PlayerGui:FindFirstChild('MainUI')

        if not MainUI then
            return nil
        end

        local AbilityContainer = MainUI:FindFirstChild('AbilityContainer')

        if not AbilityContainer then
            return nil
        end

        local Block = AbilityContainer:FindFirstChild('Block')

        if not Block then
            return nil
        end
        if Block:IsA('GuiButton') then
            return Block
        end

        return Block:FindFirstChildWhichIsA('TextButton') or Block:FindFirstChildWhichIsA('ImageButton')
    end

    local u983 = false

    local function v984(p187)
        if not p187 or p187 == nil then
            return
        end

        pcall(function()
            local connection = p187.Activated:Connect(function()
                if u972 then
                    v981()
                end
            end)

            if connection then
                table.insert(t67, connection)
            end
        end)
        pcall(function()
            local connection = p187.MouseButton1Click:Connect(function()
                if u972 then
                    v981()
                end
            end)

            if connection then
                table.insert(t67, connection)
            end
        end)
    end

    local connection = RunService2.Heartbeat:Connect(function()
        if not u972 then
            u983 = false

            return
        end

        local v1305 = v982()

        if not v1305 then
            u983 = false

            return
        end

        v984(v1305)

        if v1305:IsA('GuiButton') and (v1305.GuiState == Enum.GuiState.Press and not u983) then
            v981()
        end
    end)

    if connection then
        table.insert(t67, connection)
    end
    if t54 and t54.triggerBlock then
        local triggerBlock = t54.triggerBlock
        local v987 = t54

        t66[1] = function(...)
            if u972 then
                v981()
            end

            return triggerBlock(...)
        end
        v987.triggerBlock = t66[1]
    end

    local RemoteEvent

    t66[1] = function()
        RemoteEvent = game:GetService('ReplicatedStorage').Modules.Network.Network.RemoteEvent
    end
    RemoteEvent = nil

    pcall(t66[1])

    if RemoteEvent then
        local function u989(p188, p189)
            local v1308 = p189 or 0

            if v1308 > 4 then
                return false
            end

            local v1309 = typeof and typeof(p188) or type(p188)

            if v1309 == 'string' then
                return string.find(p188, 'Block') ~= nil
            end
            if v1309 == 'buffer' then
                local u1310

                pcall(function()
                    u1310 = buffer.tostring(p188)
                end)

                return type(u1310) == 'string' and string.find(u1310, 'Block') ~= nil
            end
            if v1309 == 'table' then
                for _, v in pairs(p188)do
                    if u989(v, v1308 + 1) then
                        return true
                    end
                end
            end

            return false
        end
        local function v990(...)
            local v1313 = select('#', ...)
            local v1314 = table.pack(...)

            for i = 1, v1313 do
                if u989(v1314[i], 0) then
                    return true
                end
            end

            return false
        end

        local connection4 = RemoteEvent.OnClientEvent:Connect(function(...)
            if not u972 then
                return
            end
            if v990(...) then
                v981()
            end
        end)

        if connection4 then
            table.insert(t67, connection4)
        end
        if hookmetamethod and getnamecallmethod then
            local u992

            u992 = hookmetamethod(game, '__namecall', function(p190, ...)
                if u972 and (p190 == RemoteEvent and (getnamecallmethod() == 'FireServer' and v990(...))) then
                    task.spawn(v981)
                end

                return u992(p190, ...)
            end)
        end
    end

    v953(LocalPlayer.CharacterAdded:Connect(function()
        if u975 then
            u975 = false

            local _, v1318 = v954()
            local v1319 = v1318

            if v1319 then
                pcall(function()
                    v1319:Move(Vector3.zero, false)

                    if WalkSpeed ~= nil then
                        v1319.WalkSpeed = WalkSpeed
                    end
                    if u978 ~= nil then
                        v1319.AutoRotate = u978
                    end
                end)
            end

            WalkSpeed = nil
            u978 = nil
        end
    end))
    v971:Paragraph({
        Title = 'Beta Version!',
        Desc = 'WARNING PLZ DONT REPORT THIS (fixed bee soon)',
        Color = 'Grey',
        Image = '',
        ImageSize = 30,
        Thumbnail = '',
        ThumbnailSize = 80,
        Locked = false,
    })

    local v993 = t3

    t66[1] = v971:Toggle({
        Title = 'HDT',
        Desc = 'Hitbox dragging tech',
        Icon = 'move',
        Value = false,
        Callback = function(p191)
            u972 = p191

            if not p191 then
                u975 = false

                local _, v1322 = v954()
                local v1323 = v1322

                if v1323 then
                    pcall(function()
                        v1323:Move(Vector3.zero, false)

                        if WalkSpeed ~= nil then
                            v1323.WalkSpeed = WalkSpeed
                        end
                        if u978 ~= nil then
                            v1323.AutoRotate = u978
                        end
                    end)
                end

                WalkSpeed = nil
                u978 = nil
            end
        end,
    })
    v993.hdt = t66[1]

    local Slider19 = v971.Slider
    local t69 = {
        Min = 0.01,
        Max = 50,
        Default = 0.14,
    }

    Slider19(v971, {
        Title = 'Slide Speed',
        Desc = 'Speed',
        Icon = 'gauge',
        Step = 1,
        Value = t69,
        Callback = function(p192)
            n21 = p192
        end,
    })

    local Slider20 = v971.Slider
    local t70 = {
        Min = 0.1,
        Max = 5,
        Default = 0.1,
    }

    Slider20(v971, {
        Title = 'Slide Time (sec)',
        Desc = 'Before block per sec',
        Icon = 'timer',
        Step = 1,
        Locked = true,
        Value = t70,
        Callback = function(p193)
            n22 = p193
        end,
    })

    local t71 = {
        Min = 0,
        Max = 60,
        Default = 27,
    }

    v971:Slider({
        Title = 'Cooldown (sec)',
        Desc = 'Cooldown | Beta',
        Icon = 'hourglass',
        Step = 1,
        Locked = true,
        Value = t71,
        Callback = function(p194)
            n23 = p194
        end,
    })

    local v999 = syn and syn.request

    if not v999 then
        t66[2] = http and http.request
        v999 = t66[2]

        if not t66[2] then
            v999 = http_request or (fluxus and fluxus.request or request)
        end
    end

    local v1000 = v999
    local HttpService = game:GetService('HttpService')
    local t72 = {
        Type = 'Bug',
        Text = '',
    }
    local t73 = {
        emoji = '\u{1f41b}',
        color = 15158332,
    }
    local t74 = {
        emoji = '\u{1f4a1}',
        color = 3066993,
    }
    local t75 = {
        emoji = '\u{1f4cc}',
        color = 3447003,
    }
    local t76 = {
        Bug = t73,
        Suggestion = t74,
        Other = t75,
    }

    local function v1007()
        if isfile and (readfile and isfile('script_report_cooldown.json')) then
            local ok, result = pcall(function()
                local v1492 = HttpService
                local t77 = {
                    readfile('script_report_cooldown.json'),
                }

                return v1492:JSONDecode(v2(t77))
            end)

            if ok then
                ok = type(result) == 'table'
            end
            if ok then
                return result
            end
        end

        return {}
    end
    local function v1008()
        return (tonumber(v1007()[tostring(LocalPlayer.UserId)] or 0) or 0) - os.time()
    end
    local function v1009(p195)
        local v1332 = math.max(0, (math.floor(p195)))
        local v1333 = math.floor(v1332 / 86400)
        local v1334 = v1332 % 86400
        local v1335 = math.floor(v1334 / 3600)
        local v1336 = math.floor(v1334 % 3600 / 60)
        local t78 = {}

        if v1333 > 0 then
            table.insert(t78, v1333 .. 'd')
        end
        if v1335 > 0 then
            table.insert(t78, v1335 .. 'h')
        end
        if v1336 > 0 or #t78 == 0 then
            table.insert(t78, v1336 .. 'm')
        end

        return table.concat(t78, ' ')
    end

    local v1010 = v20:Tab({
        Title = 'Report',
        Icon = 'globe',
    })

    v1010:Paragraph({
        Title = 'PLEASE IF YOU HAVE A BUG THAT CANNOT BE DESCRIBED, GO TO OUR SERVER AND REPORT THE BUG WITH VIDEO (use catbox or smt otherwise)',
        Desc = 'WARNING',
        Color = 'Grey',
        Image = '',
        ImageSize = 30,
        Thumbnail = '',
        ThumbnailSize = 80,
        Locked = false,
    })
    v1010:Paragraph({
        Title = 'Pls reports bugs or suggestions',
        Desc = 'Cooldown 5 hours',
        Color = 'Grey',
        Image = '',
        ImageSize = 30,
        Thumbnail = '',
        ThumbnailSize = 80,
        Locked = false,
    })
    v1010:Dropdown({
        Title = 'Report Type',
        Values = {
            'Bug',
            'Suggestion',
            'Other',
        },
        Value = 'Bug',
        Callback = function(p196)
            t72.Type = p196
        end,
    })
    v1010:Input({
        Title = 'Description',
        Placeholder = 'Describe the bug or suggestion...',
        Callback = function(p197)
            t72.Text = p197
        end,
    })
    v1010:Button({
        Title = 'Send Report',
        Icon = 'send',
        Callback = function()
            if false then
                u7:Notify({
                    Title = 'Report',
                    Content = 'Webhook is not configured',
                    Duration = 4,
                })

                return
            end
            if not v1000 then
                u7:Notify({
                    Title = 'Report',
                    Content = "Your executor doesn't support HTTP requests",
                    Duration = 4,
                })

                return
            end
            if t72.Text == '' then
                u7:Notify({
                    Title = 'Report',
                    Content = 'Please write your report first',
                    Duration = 4,
                })

                return
            end

            local v1338 = v1008()

            if v1338 > 0 then
                local v1339 = u7
                local v1340 = 'You can send another report in ' .. v1009(v1338)

                v1339:Notify({
                    Title = 'On cooldown',
                    Content = v1340,
                    Duration = 6,
                })

                return
            end

            local v1341 = t76[t72.Type] or t76.Other
            local t79 = {
                name = 'New Report Received',
            }
            local v1343 = v1341.emoji .. '  ' .. t72.Type .. ' Report'
            local v1344 = '`' .. t72.Text .. '`'
            local color = v1341.color
            local v1346 = ('%s (`%s`)'):format(LocalPlayer.DisplayName, LocalPlayer.Name)
            local t80 = {
                name = '\u{1f464} Player',
                value = v1346,
                inline = true,
            }
            local v1348 = '`' .. tostring(LocalPlayer.UserId) .. '`'
            local t81 = {
                name = '\u{1f194} User ID',
                value = v1348,
                inline = true,
            }
            local v1350 = '`' .. tostring(game.PlaceId) .. '`'
            local t82 = {
                t80,
                t81,
                {
                    name = '\u{1f3ae} Place ID',
                    value = v1350,
                    inline = true,
                },
            }
            local t83 = {
                text = 'Script Hub \u{2022} Report System',
            }
            local v1353 = DateTime.now():ToIsoDate()
            local t84 = {
                author = t79,
                title = v1343,
                description = v1344,
                color = color,
                fields = t82,
                footer = t83,
                timestamp = v1353,
            }
            local t85 = {
                username = 'Script Reports',
                embeds = {t84},
            }
            local ok, result = pcall(function()
                local v1494 = v1000
                local t86 = {
                    ['Content-Type'] = 'application/json',
                }
                local json = HttpService:JSONEncode(t85)

                v1494({
                    Url = 'https://discord.com/api/webhooks/1509981175630925964/xbS_0srVwthoMsA9vJlw7h6diihWFsnquBwNKlcnFEpoaW8PwFzCFVpfUqVGykHQuE7M',
                    Method = 'POST',
                    Headers = t86,
                    Body = json,
                })
            end)

            if ok then
                local v1358 = v1007()

                v1358[tostring(LocalPlayer.UserId)] = os.time() + 18000

                if writefile then
                    pcall(function()
                        writefile('script_report_cooldown.json', HttpService:JSONEncode(v1358))
                    end)
                end

                local v1359 = u7
                local t87 = {}

                table.insert(t87, '5h')

                if #t87 == 0 then
                    table.insert(t87, '0m')
                end

                local v1361 = 'Report sent \u{2705} \u{2014} next one in ' .. table.concat(t87, ' ')

                v1359:Notify({
                    Title = 'Report',
                    Content = v1361,
                    Duration = 5,
                })

                t72.Text = ''
            else
                local v1362 = u7
                local Notify = v1362.Notify
                local v1364 = 'Failed to send: ' .. tostring(result)

                Notify(v1362, {
                    Title = 'Report',
                    Content = v1364,
                    Duration = 5,
                })
            end
        end,
    })

    function t65.get()
        local t88 = {
            enabled = u972,
            speed = n21,
            duration = n22,
            cooldown = n23,
        }
        local t89 = {
            enabled = u964,
            mode = s3,
            freeMove = u958,
        }

        return {
            hdt = t88,
            trick = t89,
        }
    end
    function t65.apply(p198)
        pcall(function()
            local hdt = p198.hdt

            if hdt then
                if hdt.speed ~= nil then
                    local _ = hdt.speed
                end
                if hdt.duration ~= nil then
                    local _ = hdt.duration
                end
                if hdt.cooldown ~= nil then
                    local _ = hdt.cooldown
                end

                u972 = not not hdt.enabled

                if not u972 then
                    u975 = false

                    local _, v1502 = v954()
                    local v1503 = v1502

                    if v1503 then
                        pcall(function()
                            v1503:Move(Vector3.zero, false)

                            if WalkSpeed ~= nil then
                                v1503.WalkSpeed = WalkSpeed
                            end
                            if u978 ~= nil then
                                v1503.AutoRotate = u978
                            end
                        end)
                    end

                    WalkSpeed = nil
                    u978 = nil
                end
            end
        end)
        pcall(function()
            local trick = p198.trick

            if trick then
                if trick.mode ~= nil then
                    local _ = trick.mode
                end

                u964 = not not trick.enabled

                if trick.freeMove ~= nil then
                    u958 = not not trick.freeMove

                    if not u958 then
                        v962()
                    end
                end
            end
        end)
        pcall(function()
            if t3.hdt then
                t3.hdt:Set(u972 and true or false)
            end
            if t3.autoTrick then
                t3.autoTrick:Set(not not u964)
            end
            if t3.freeMove then
                t3.freeMove:Set(not not u958)
            end
        end)
    end
end

t1[1]()

t1[1] = v20:Tab({
    Title = 'Configs',
    Icon = 'save',
})

local v319 = t1[1]:Section({
    Title = 'Generate / Share',
    Icon = 'upload',
})

t1[2] = t1[1]:Section({
    Title = 'Load Config',
    Icon = 'download',
})
t1[1] = game:GetService('HttpService')

local v320 = t1[1]
local s5

t1[1] = function(p199)
    return (p199:gsub('.', function(p200)
        local s4 = ''
        local v1380 = p200:byte()

        for i = 8, 1, -1 do
            s4 = not (s4 .. (v1380 % 2 ^ i - v1380 % 2 ^ (i - 1) > 0)) and '0' or '1'
        end

        return s4
    end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(p201)
        if #p201 < 6 then
            return ''
        end

        local n24 = 0

        for i = 1, 6 do
            local v1385 = i

            n24 += p201:sub(v1385, v1385) == '1' and 2 ^ (6 - v1385) or 0
        end

        return s5:sub(n24 + 1, n24 + 1)
    end) .. ({
        '',
        '==',
        '=',
    })[#p199 % 3 + 1]
end
s5 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

local v322 = t1[1]

local function v323(p202)
    return string.gsub(p202, '[^' .. s5 .. '=]', ''):gsub('.', function(p203)
        if p203 == '=' then
            return ''
        end

        local s6 = ''
        local v1372 = s5:find(p203, 1, true) - 1

        for i = 6, 1, -1 do
            s6 = not (s6 .. (v1372 % 2 ^ i - v1372 % 2 ^ (i - 1) > 0)) and '0' or '1'
        end

        return s6
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(p204)
        if #p204 ~= 8 then
            return ''
        end

        local n25 = 0

        for i = 1, 8 do
            local v1377 = i

            n25 += p204:sub(v1377, v1377) == '1' and 2 ^ (8 - v1377) or 0
        end

        return string.char(n25)
    end)
end
local function u324(p205)
    if typeof(p205) == 'Color3' then
        local v1015 = math.floor(p205.R * 255 + 0.5)
        local v1016 = math.floor(p205.G * 255 + 0.5)
        local v1017 = math.floor(p205.B * 255 + 0.5)

        return {
            __c3 = true,
            r = v1015,
            g = v1016,
            b = v1017,
        }
    end
    if type(p205) == 'table' then
        local t90 = {}

        for k, v in pairs(p205)do
            t90[k] = u324(v)
        end

        return t90
    end

    return p205
end

local u325

u325 = function(p206)
    if type(p206) == 'table' then
        if p206.__c3 then
            return Color3.fromRGB(p206.r or 0, p206.g or 0, p206.b or 0)
        end

        local t91 = {}

        for k, v in pairs(p206)do
            t91[k] = u325(v)
        end

        return t91
    end

    return p206
end
t1[1] = function(p207)
    if type(p207) ~= 'string' then
        return false, '\u{43d}\u{435}\u{442} \u{43a}\u{43e}\u{434}\u{430}'
    end

    local v1064 = p207:gsub('%s', '')

    if #v1064 < 4 then
        return false, '\u{43f}\u{443}\u{441}\u{442}\u{43e}\u{439} \u{43a}\u{43e}\u{434}'
    end

    local ok, result = pcall(v323, v1064)
    local v1067 = not ok
    local v1068 = result

    if not v1067 then
        v1067 = not v1068
    end
    if v1067 then
        return false, 'decode'
    end

    local ok3, result3 = pcall(function()
        return v320:JSONDecode(v1068)
    end)
    local v1071 = result3

    if not ok3 or type(v1071) ~= 'table' then
        return false, '\u{43f}\u{430}\u{440}\u{441}\u{438}\u{43d}\u{433}'
    end

    pcall(function()
        local stamina = v1071.stamina

        if stamina then
            if stamina.max ~= nil then
                n2 = stamina.max
            end
            if stamina.loss ~= nil then
                n3 = stamina.loss
            end
            if stamina.gain ~= nil then
                n4 = stamina.gain
            end
            if stamina.min ~= nil then
                n5 = stamina.min
            end
            if stamina.sprint ~= nil then
                n6 = stamina.sprint
            end
            if stamina.infinite ~= nil then
                u44 = not not stamina.infinite
            end

            v50()
            pcall(function()
                if t3.maxStam then
                    local maxStam = t3.maxStam
                    local t92 = {
                        tostring(n2),
                    }

                    maxStam:Set(v2(t92))
                end
                if t3.minStam then
                    local minStam = t3.minStam
                    local t93 = {
                        tostring(n5),
                    }

                    minStam:Set(v2(t93))
                end
                if t3.lossStam then
                    local lossStam = t3.lossStam
                    local t94 = {
                        tostring(n3),
                    }

                    lossStam:Set(v2(t94))
                end
                if t3.gainStam then
                    local gainStam = t3.gainStam
                    local t95 = {
                        tostring(n4),
                    }

                    gainStam:Set(v2(t95))
                end
                if t3.sprintStam then
                    t3.sprintStam:Set((tostring(n6)))
                end
            end)
        end
    end)
    pcall(function()
        local esp = v1071.esp

        if esp then
            if esp.killerSettings then
                for k, v in pairs(u325(esp.killerSettings))do
                    t10[k] = v
                end
            end
            if esp.survivorSettings then
                for k, v in pairs(u325(esp.survivorSettings))do
                    t11[k] = v
                end
            end
            if esp.generatorSettings then
                for k, v in pairs(u325(esp.generatorSettings))do
                    t12[k] = v
                end
            end
            if esp.itemSettings then
                for k, v in pairs(u325(esp.itemSettings))do
                    t17[k] = v
                end
            end

            u56 = not not esp.killer

            v111('Killers')

            if u56 then
                v110('Killers', t10)
            end

            u57 = not not esp.survivor

            v111('Survivors')

            if u57 then
                v110('Survivors', t11)
            end

            u58 = not not esp.generator

            v118()

            if u58 then
                v120()
            end

            u122 = not not esp.items

            v130()

            if u122 then
                if u123 then
                    u123:Disconnect()
                end

                u123 = RunService.Heartbeat:Connect(function(dt)
                    n10 += dt

                    if n10 < 0.3 then
                        return
                    end
                    if not u122 then
                        u123:Disconnect()

                        u123 = nil

                        return
                    end

                    for _, v in ipairs(v128())do
                        v98(v, '_ITEMHighlight', t17)

                        t16[v] = true
                    end
                end)
            end
        end
    end)
    pcall(function()
        local gen = v1071.gen

        if gen then
            if gen.autoGenInterval ~= nil then
                local _ = gen.autoGenInterval
            end
            if gen.autoSolveDelay ~= nil then
                local _ = gen.autoSolveDelay
            end

            u221 = not not gen.autoGen

            v231()

            if u221 then
                v232()
            end

            u224 = not not gen.puzzleESP

            v238()

            if u224 then
                v239()
            end

            u225 = not not gen.autoSolve

            v240()

            if u225 then
                v242()
            end
        end
    end)
    pcall(function()
        local world = v1071.world

        if world then
            if world.fovValue ~= nil then
                local _ = world.fovValue
            end
            if world.stretch ~= nil then
                local _ = world.stretch
            end

            u309 = not not world.fov

            v314()

            if u309 then
                v313()
            end
        end
    end)
    pcall(function()
        local ab = v1071.ab

        if ab then
            if ab.radius ~= nil then
                t54.abRadius = ab.radius
            end
            if ab.blockTime ~= nil then
                t54.abBlockTime = ab.blockTime
            end
            if ab.fcFOV ~= nil then
                t54.fcFOV = ab.fcFOV
            end
            if ab.fcDistance ~= nil then
                t54.fcDistance = ab.fcDistance
            end
            if ab.hbSizeX ~= nil then
                t54.hbSizeX = ab.hbSizeX
            end
            if ab.hbSizeY ~= nil then
                t54.hbSizeY = ab.hbSizeY
            end
            if ab.hbSizeZ ~= nil then
                t54.hbSizeZ = ab.hbSizeZ
            end
            if ab.hbOffsetX ~= nil then
                t54.hbOffsetX = ab.hbOffsetX
            end
            if ab.hbOffsetY ~= nil then
                t54.hbOffsetY = ab.hbOffsetY
            end
            if ab.hbOffsetZ ~= nil then
                t54.hbOffsetZ = ab.hbOffsetZ
            end
            if ab.hbTransp ~= nil then
                t54.hbTransp = ab.hbTransp
            end
            if ab.fcRadiusColor then
                t54.fcRadiusColor = u325(ab.fcRadiusColor)
            end
            if ab.fcConeColorNormal then
                t54.fcConeColorNormal = u325(ab.fcConeColorNormal)
            end
            if ab.fcConeColorInside then
                t54.fcConeColorInside = u325(ab.fcConeColorInside)
            end
            if ab.hbColor then
                t54.hbColor = u325(ab.hbColor)
            end

            t54.wallCheckEnabled = not not ab.wallCheck
            t54.faceCheckEnabled = not not ab.faceCheck
            t54.radVisEnabled = not not ab.radVis
            t54.fcVisEnabled = not not ab.coneVis
            t54.autoblockEnabled = not not ab.autoblock

            if t54.stopAutoBlock then
                t54.stopAutoBlock()
            end
            if t54.autoblockEnabled and t54.startAutoBlock then
                t54.startAutoBlock()
            end

            t54.betterAutoblockEnabled = not not ab.better

            if t54.stopBetterLoop then
                t54.stopBetterLoop()
            end
            if t54.betterAutoblockEnabled and t54.startBetterLoop then
                t54.startBetterLoop()
            end

            t54.hitboxEnabled = not not ab.hitbox

            if t54.stopHitboxBlock then
                t54.stopHitboxBlock()
            end
            if t54.hitboxEnabled and t54.startHitboxBlock then
                t54.startHitboxBlock()
            end
            if t54.updateFCLoop then
                t54.updateFCLoop()
            end
            if t54.updateAllHitboxes then
                t54.updateAllHitboxes()
            end
        end
    end)
    pcall(function()
        local music = v1071.music

        if music and music.slots then
            for i, v in ipairs(music.slots)do
                local v1413 = v
                local v1414 = t43[i]

                if v1414 and v1413 then
                    if v1413.track then
                        for _, v8 in ipairs(t40)do
                            if v8.name == v1413.track then
                                v1414.trackId = v8.asset

                                break
                            end
                        end

                        pcall(function()
                            v1414.dropdown:Select(v1413.track)
                        end)
                    end
                    if v1413.enabled and v1414.trackId then
                        v200(v1414)
                        v199(v1414)
                        v201(v1414)

                        v1414.enabled = true
                    else
                        v202(v1414)
                    end

                    pcall(function()
                        v1414.toggle:Set(not not v1414.enabled)
                    end)
                end
            end
        end
    end)
    pcall(function()
        local v1417 = u44

        if t3.infinite then
            t3.infinite:Set(not not v1417)
        end

        local v1418 = u56

        if t3.espKiller then
            t3.espKiller:Set(not not v1418)
        end

        local v1419 = u57

        if t3.espSurvivor then
            t3.espSurvivor:Set(not not v1419)
        end

        local v1420 = u58

        if t3.espGenerator then
            t3.espGenerator:Set(not not v1420)
        end

        local v1421 = u122

        if t3.espItems then
            t3.espItems:Set(not not v1421)
        end

        local v1422 = u221

        if t3.autoGen then
            t3.autoGen:Set(not not v1422)
        end

        local v1423 = u224

        if t3.puzzleESP then
            t3.puzzleESP:Set(not not v1423)
        end

        local v1424 = u225

        if t3.autoSolve then
            t3.autoSolve:Set(not not v1424)
        end

        local v1425 = u309

        if t3.fov then
            t3.fov:Set(not not v1425)
        end

        local autoblockEnabled = t54.autoblockEnabled

        if t3.abAutoblock then
            t3.abAutoblock:Set(not not autoblockEnabled)
        end

        local betterAutoblockEnabled = t54.betterAutoblockEnabled

        if t3.abBetter then
            t3.abBetter:Set(not not betterAutoblockEnabled)
        end

        local wallCheckEnabled = t54.wallCheckEnabled

        if t3.abWall then
            t3.abWall:Set(not not wallCheckEnabled)
        end

        local faceCheckEnabled = t54.faceCheckEnabled

        if t3.abFace then
            t3.abFace:Set(not not faceCheckEnabled)
        end

        local radVisEnabled = t54.radVisEnabled

        if t3.abRadVis then
            t3.abRadVis:Set(not not radVisEnabled)
        end

        local fcVisEnabled = t54.fcVisEnabled

        if t3.abCone then
            t3.abCone:Set(not not fcVisEnabled)
        end

        local hitboxEnabled = t54.hitboxEnabled

        if t3.abHitbox then
            t3.abHitbox:Set(not not hitboxEnabled)
        end
    end)
    pcall(function()
        if t65.apply then
            t65.apply(v1071)
        end
    end)

    return true
end

local function v326()
    local t96 = {
        max = n2,
        loss = n3,
        gain = n4,
        min = n5,
        sprint = n6,
        infinite = u44,
    }
    local v1026 = u56
    local v1027 = u57
    local v1028 = u58
    local v1029 = u122
    local v1030 = u324(t10)
    local v1031 = u324(t11)
    local v1032 = u324(t12)
    local v1033 = u324(t17)
    local t97 = {
        killer = v1026,
        survivor = v1027,
        generator = v1028,
        items = v1029,
        killerSettings = v1030,
        survivorSettings = v1031,
        generatorSettings = v1032,
        itemSettings = v1033,
    }
    local t98 = {
        autoGen = u221,
        autoGenInterval = n12,
        puzzleESP = u224,
        autoSolve = u225,
        autoSolveDelay = n13,
    }
    local t99 = {
        fov = u309,
        fovValue = n17,
        stretch = n18,
    }
    local autoblockEnabled = t54.autoblockEnabled
    local betterAutoblockEnabled = t54.betterAutoblockEnabled
    local wallCheckEnabled = t54.wallCheckEnabled
    local faceCheckEnabled = t54.faceCheckEnabled
    local radVisEnabled = t54.radVisEnabled
    local fcVisEnabled = t54.fcVisEnabled
    local hitboxEnabled = t54.hitboxEnabled
    local abRadius = t54.abRadius
    local abBlockTime = t54.abBlockTime
    local fcFOV = t54.fcFOV
    local fcDistance = t54.fcDistance
    local hbSizeX = t54.hbSizeX
    local hbSizeY = t54.hbSizeY
    local hbSizeZ = t54.hbSizeZ
    local hbOffsetX = t54.hbOffsetX
    local hbOffsetY = t54.hbOffsetY
    local hbOffsetZ = t54.hbOffsetZ
    local hbTransp = t54.hbTransp
    local v1055 = u324(t54.fcRadiusColor)
    local v1056 = u324(t54.fcConeColorNormal)
    local v1057 = u324(t54.fcConeColorInside)
    local v1058 = u324(t54.hbColor)
    local t100 = {
        autoblock = autoblockEnabled,
        better = betterAutoblockEnabled,
        wallCheck = wallCheckEnabled,
        faceCheck = faceCheckEnabled,
        radVis = radVisEnabled,
        coneVis = fcVisEnabled,
        hitbox = hitboxEnabled,
        radius = abRadius,
        blockTime = abBlockTime,
        fcFOV = fcFOV,
        fcDistance = fcDistance,
        hbSizeX = hbSizeX,
        hbSizeY = hbSizeY,
        hbSizeZ = hbSizeZ,
        hbOffsetX = hbOffsetX,
        hbOffsetY = hbOffsetY,
        hbOffsetZ = hbOffsetZ,
        hbTransp = hbTransp,
        fcRadiusColor = v1055,
        fcConeColorNormal = v1056,
        fcConeColorInside = v1057,
        hbColor = v1058,
    }
    local t101 = {
        v = 1,
        stamina = t96,
        esp = t97,
        gen = t98,
        world = t99,
        ab = t100,
    }

    pcall(function()
        local t102 = {}

        for i, v in ipairs(t43)do
            local name

            for _, v9 in ipairs(t40)do
                if v9.asset == v.trackId then
                    name = v9.name

                    break
                end
            end

            t102[i] = {
                enabled = not not v.enabled,
                track = name,
            }
        end

        t101.music = {slots = t102}
    end)
    pcall(function()
        if t65.get then
            local v1392 = t65.get()

            t101.hdt = v1392.hdt
            t101.trick = v1392.trick
        end
    end)

    local v1061 = v320
    local JSONEncode = v1061.JSONEncode

    return v322(JSONEncode(v1061, t101))
end

local v327 = t1[1]

v319:Paragraph({
    Title = 'How to use (for beginners)',
    Desc = "1) Configure the desired functions in the other tabs. 2) Click Generate Config\u{2014}the code will be copied to the clipboard, and you can share it with others. 3) To load someone else's config, paste it below and click Load Config.",
    Color = 'Grey',
})

t1[1] = function() end
t1[1] = v319:Input({
    Title = 'Your Config Code',
    Placeholder = '\u{43d}\u{430}\u{436}\u{43c}\u{438} Generate \u{2193}',
    Type = 'Input',
    Callback = t1[1],
})

local v328 = t1[1]

t1[1] = v319.Button

t1[1](v319, {
    Title = 'Generate Config',
    Desc = 'Copy the code from the current settings',
    Icon = 'upload',
    Callback = function()
        local ok, result = pcall(v326)
        local v1074 = result

        if not ok or type(v1074) ~= 'string' then
            u7:Notify({
                Title = 'Config',
                Content = 'Generation error',
                Duration = 4,
                Icon = 'x',
            })

            return
        end
        if setclipboard then
            pcall(setclipboard, v1074)
        end

        pcall(function()
            v328:Set(v1074)
        end)
        u7:Notify({
            Title = 'Config',
            Content = 'Done! The code has been copied to your clipboard.',
            Duration = 5,
            Icon = 'check',
        })
    end,
})

local s7 = ''

t1[1] = t1[2]:Input({
    Title = 'Paste Config Code',
    Placeholder = 'Paste the config code here',
    Type = 'Input',
    Callback = function(p208)
        local _tostring = tostring

        if not p208 then
            p208 = ''
        end

        s7 = _tostring(p208)
    end,
})

local v330 = t1[1]

t1[1] = t1[2].Button

t1[1](t1[2], {
    Title = 'Load Config',
    Desc = 'Apply all settings from the code',
    Icon = 'download',
    Callback = function()
        local u1077 = s7

        pcall(function()
            if v330 and (v330.Value and #tostring(v330.Value) > 0) then
                u1077 = v330.Value
            end
        end)

        local t103, v1079 = v327(u1077)

        if t103 then
            u7:Notify({
                Title = 'Config',
                Content = 'Config loaded - all functions applied!',
                Duration = 5,
                Icon = 'check',
            })
        else
            local v1080 = u7
            local Notify = v1080.Notify
            local v1082 = 'Fuckest Error ever: ' .. tostring(v1079)

            Notify(v1080, {
                Title = 'Config',
                Content = v1082,
                Duration = 5,
                Icon = 'x',
            })
        end
    end,
})
