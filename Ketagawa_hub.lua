local t1 = {}
local v2 = unpack or table.unpack

game:IsLoaded()

repeat
    task.wait()

    t1[1] = game:IsLoaded()
until t1[1]

t1[1] = game:GetService('Players')

local v3 = t1[1]

t1[1] = game:GetService('RunService')

local v4 = t1[1]

t1[1] = game:GetService('UserInputService')

local v5 = t1[1]

t1[1] = game:GetService('TweenService')

local v6 = t1[1]

t1[1] = game:GetService('VirtualInputManager')

local v7 = t1[1]

t1[1] = game:GetService('InsertService')

local v8 = t1[1]

t1[1] = game:GetService('Debris')

local v9 = t1[1]

t1[1] = game:GetService('CoreGui')

local v10 = t1[1]

game:GetService('GuiService')

t1[1] = game:GetService('Lighting')

local v11 = t1[1]

t1[1] = v3.LocalPlayer

local u12 = t1[1] or v3.PlayerAdded:Wait()
local PlayerGui = u12:WaitForChild('PlayerGui')

t1[1] = function()
    if getgenv and getgenv().KitagawaHubUnload then
        getgenv().KitagawaHubUnload()
    end
end

pcall(t1[1])

local function v14(p1)
    p1.ResetOnSpawn = false

    local u171
    local s1 = 'gethui'

    pcall(function()
        u171 = _G[s1]
    end)

    local v173

    if type(u171) == 'function' then
        v173 = u171
    else
        v173 = nil
    end

    local v174 = v173

    if v174 then
        pcall(function()
            p1.Parent = v174()
        end)

        if p1.Parent then
            return p1
        end
    end

    pcall(function()
        if syn and type(syn.protect_gui) == 'function' then
            syn.protect_gui(p1)

            p1.Parent = v10
        end
    end)

    if p1.Parent then
        return p1
    end

    pcall(function()
        local u757
        local s2 = 'protectgui'

        pcall(function()
            u757 = _G[s2]
        end)

        local v759

        if type(u757) == 'function' then
            v759 = u757
        else
            v759 = nil
        end
        if v759 then
            v759(p1)

            p1.Parent = v10
        end
    end)

    if not p1.Parent then
        p1.Parent = PlayerGui
    end

    pcall(function()
        p1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    end)
    pcall(function()
        p1.DisplayOrder = 999
    end)
    pcall(function()
        p1.IgnoreGuiInset = true
    end)

    p1.Enabled = true

    return p1
end

local u15 = false
local t2 = {
    Enabled = false,
    Bind = nil,
}
local t3 = {
    Enabled = false,
    Bind = nil,
}
local t4 = {
    Enabled = false,
    Bind = nil,
}
local t5 = {
    Enabled = false,
    Bind = nil,
}
local t6 = {
    Enabled = false,
    Bind = nil,
}
local t7 = {
    Enabled = false,
    Bind = nil,
}
local t8 = {
    Enabled = false,
    Bind = nil,
    Delay = 80,
}
local t9 = {
    Enabled = false,
    Speed = 10,
    Bind = nil,
}
local t10 = {
    Enabled = false,
    Power = 1,
    Bind = nil,
}
local t11 = {
    Enabled = false,
    Bind = nil,
}
local t12 = {
    Enabled = false,
    Bind = nil,
}
local t13 = {Enabled = false}
local t14 = {
    Enabled = false,
    Bind = nil,
}
local t15 = {Enabled = false}
local t16 = {Enabled = false}
local t17 = {Enabled = false}
local t18 = {Enabled = false}
local t19 = {Enabled = false}
local t20 = {Enabled = false}
local t21 = {Enabled = false}
local t22 = {Enabled = false}
local t23 = {Enabled = false}
local t24 = {Enabled = false}
local t25 = {
    Enabled = false,
    R = 255,
    G = 200,
    B = 50,
    Size = 15,
}
local t26 = {
    Enabled = false,
    Mode = 'Tropical',
}
local t27 = {
    Enabled = false,
    Density = 0.35,
    Haze = 0.9,
    Glare = 0.12,
    Offset = 0.25,
}
local t28 = {
    Enabled = false,
    Bind = nil,
}
local t29 = {
    Enabled = false,
    Bind = nil,
}
local t30 = {
    Enabled = false,
    Bind = nil,
}
local t31 = {
    Enabled = false,
    Bind = nil,
}

t1[1] = {
    Enabled = false,
    Bind = nil,
}

local t32 = {
    Enabled = false,
    Bind = nil,
}
local t33 = {Enabled = false}
local t34 = {Enabled = false}
local t35 = {Enabled = false}
local t36 = {Enabled = false}
local t37 = {Enabled = false}

t1[1] = {
    DeviceMode = 'PC',
    AutoLoot = t2,
    TouchFling = t3,
    AutoShootMurder = t4,
    WallShotMurder = t5,
    MurderKillAll = t6,
    KillOnlySheriff = t7,
    TriggerBot = t8,
    SpinBot = t9,
    BHop = t10,
    InfJump = t11,
    Fly = t12,
    Noclip = t13,
    AntiFling = t14,
    RoleESP = t15,
    RoleESPMode = 'Glow',
    NameESP = t16,
    GunESP = t17,
    PlayerMenu = t18,
    DeathNote = t19,
    DeathNoteStyle = 'Rotating',
    NikilisPet = t20,
    RyukPet = t21,
    KeyBindList = t22,
    FpsBanner = t23,
    PingBanner = t24,
    BulletTracker = t25,
    CustomSky = t26,
    CustomAtmosphere = t27,
    ElEtoYa = t28,
    LightYagami = t29,
    RonaldoSkin = t30,
    RonaldoEmote = t31,
    JerkOff = t1[1],
    AutoFarmCoin = t32,
    WingsAura = t33,
    StarrBallAura = t34,
    RedAura = t35,
    JumpCircleNeon = t36,
    JumpCircleShock = t37,
    JumpCirclePulse = {Enabled = false},
}

local v53 = t1[1]
local t38 = {}
local t39 = {}
local t40 = {}
local t41 = {}
local t42 = {}
local color3 = Color3.fromRGB(0, 150, 255)
local v60 = v14(v2({
    Instance.new('ScreenGui'),
}))

v60.Name = 'KitagawaHub_Gui'

local v61 = v14(v2({
    Instance.new('ScreenGui'),
}))

v61.Name = 'KitagawaMobileButtons'

pcall(function()
    v61.DisplayOrder = 1000
end)

local Folder = Instance.new('Folder')

Folder.Name = 'KitagawaPlayerMenus'
Folder.Parent = v60

local Frame = Instance.new('Frame')

Frame.Name = 'EarlyTopToggle'
Frame.Size = UDim2.new(0, 160, 0, 36)
Frame.Position = UDim2.new(0.5, -80, 0, 15)
Frame.BackgroundColor3 = Color3.fromRGB(28, 30, 36)
Frame.BackgroundTransparency = 0.36
Frame.BorderSizePixel = 0
Frame.ZIndex = 200
Frame.Parent = v60
Instance.new('UICorner', Frame).CornerRadius = UDim.new(1, 0)

local UIStroke = Instance.new('UIStroke', Frame)

UIStroke.Color = Color3.fromRGB(72, 78, 92)
UIStroke.Thickness = 1

local TextButton = Instance.new('TextButton', Frame)

TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.BackgroundTransparency = 1
t1[1] = function(p2, p3)
    local function v177(p4)
        if not p4 then
            return nil
        end

        local GetChildren = p4.GetChildren

        for _, v in ipairs(GetChildren(p4))do
            local v764 = v:IsA('Tool')

            if v764 then
                v764 = v.Name == 'Gun' or (string.find(v.Name:lower(), 'weapon') or string.find(v.Name:lower(), 'gun'))
            end
            if v764 then
                return v
            end
        end

        return nil
    end

    return v177(p2) or v177(p3)
end
TextButton.RichText = true
TextButton.Text = '<font color="#DDDDDD">Kitagawa</font><font color="#00A2FF">Hub</font>'
TextButton.Font = Enum.Font.GothamBold
TextButton.TextSize = 14
TextButton.ZIndex = 201

local TextLabel = Instance.new('TextLabel', Frame)

TextLabel.Size = UDim2.new(1, 0, 0, 10)
TextLabel.Position = UDim2.new(0, 0, 1, 2)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = 'Loading...'
TextLabel.TextColor3 = Color3.fromRGB(140, 200, 255)
TextLabel.Font = Enum.Font.Gotham
TextLabel.TextSize = 9
TextLabel.ZIndex = 201

local function v67(p5, p6, p7)
    if not p7 then
        p7 = p5
    end

    p7.Active = true

    local v181 = false
    local u182 = v181
    local u183 = v181
    local inputPosition
    local p5Position
    local p6Position

    p7.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            u182 = true
            inputPosition = input.Position
            p5Position = p5.Position

            if p6 then
                p6Position = p6.Position
            end

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    u182 = false
                end
            end)
        end
    end)
    p7.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            u183 = input
        end
    end)
    v5.InputChanged:Connect(function(input)
        if input == u183 and u182 then
            local v768 = input.Position - inputPosition

            p5.Position = UDim2.new(p5Position.X.Scale, p5Position.X.Offset + v768.X, p5Position.Y.Scale, p5Position.Y.Offset + v768.Y)

            if p6 then
                p6.Position = UDim2.new(p6Position.X.Scale, p6Position.X.Offset + v768.X, p6Position.Y.Scale, p6Position.Y.Offset + v768.Y)
            end
        end
    end)
end

local color3_2 = Color3.fromRGB(28, 30, 36)
local color3_3 = Color3.fromRGB(42, 45, 54)
local color3_4 = Color3.fromRGB(72, 78, 92)
local color3_5 = Color3.fromRGB(95, 165, 255)
local color3_6 = Color3.fromRGB(248, 252, 255)
local color3_7 = Color3.fromRGB(220, 228, 242)

local function v74(p8, p9, p10, p11)
    local Frame2 = Instance.new('Frame')

    Frame2.Size = UDim2.new(0, p9, 0, p10)
    Frame2.BackgroundColor3 = color3_2
    Frame2.BackgroundTransparency = 0.22
    Frame2.BorderSizePixel = 0
    Frame2.ZIndex = p11 or 5
    Frame2.Parent = p8
    Instance.new('UICorner', Frame2).CornerRadius = UDim.new(1, 0)

    local UIStroke2 = Instance.new('UIStroke', Frame2)

    UIStroke2.Color = color3_4
    UIStroke2.Thickness = 1
    UIStroke2.Transparency = 0.25

    local Frame3 = Instance.new('Frame', Frame2)

    Frame3.Name = 'BlurLayer'
    Frame3.Size = UDim2.new(1, -6, 1, -6)
    Frame3.Position = UDim2.new(0, 3, 0, 3)
    Frame3.BackgroundColor3 = color3_3
    Frame3.BackgroundTransparency = 0.32
    Frame3.BorderSizePixel = 0
    Frame3.ZIndex = Frame2.ZIndex
    Instance.new('UICorner', Frame3).CornerRadius = UDim.new(1, 0)

    return Frame2, Frame3, UIStroke2
end
local function u75(p12)
    if not p12 then
        return nil
    end

    return p12:FindFirstChild('UpperTorso') or (p12:FindFirstChild('Torso') or p12:FindFirstChild('HumanoidRootPart'))
end
local function v76(p13)
    if not p13 then
        return nil
    end

    local v209 = u75(p13)

    if not v209 or not v209.Parent then
        return nil
    end

    local AssemblyLinearVelocity = v209.AssemblyLinearVelocity
    local n1 = 50

    pcall(function()
        n1 = math.clamp(math.round(u12:GetNetworkPing() * 1000), 1, 999)
    end)

    local v212 = math.clamp(n1 / 1000, 0.04, 0.18)

    return v209.Position + AssemblyLinearVelocity * (v212 * 0.65 + 0.02)
end
local function v77(p14)
    return v76(p14)
end

local t43 = {
    Pink = 12635340429,
    PinkIshak = 106301897120310,
    Night = 10610570551,
    Sunset = 18763720423,
    Tropical = 93465206119408,
    RedNight = 105587979946220,
}
local t44 = {
    Pink = 'Pink Sky',
    PinkIshak = 'Pink Sky Ishak',
    Night = 'Night Sky',
    Sunset = 'Sun Set',
    Tropical = 'Tropical Summer',
    RedNight = 'Red Night',
}
local t45 = {
    Color = Color3.fromRGB(255, 185, 215),
    Density = 0.38,
    Offset = 0.2,
    Glare = 0.15,
    Haze = 1,
}
local t46 = {
    Color = Color3.fromRGB(255, 155, 195),
    Density = 0.42,
    Offset = 0.24,
    Glare = 0.12,
    Haze = 1.15,
}
local t47 = {
    Color = Color3.fromRGB(55, 65, 115),
    Density = 0.48,
    Offset = 0.1,
    Glare = 0.05,
    Haze = 0.55,
}
local t48 = {
    Color = Color3.fromRGB(255, 145, 85),
    Density = 0.34,
    Offset = 0.28,
    Glare = 0.22,
    Haze = 1.05,
}
local t49 = {
    Color = Color3.fromRGB(120, 220, 255),
    Density = 0.28,
    Offset = 0.35,
    Glare = 0.25,
    Haze = 0.85,
}
local color3_8 = Color3.fromRGB(120, 25, 35)
local t50 = {
    Pink = t45,
    PinkIshak = t46,
    Night = t47,
    Sunset = t48,
    Tropical = t49,
    RedNight = {
        Color = color3_8,
        Density = 0.52,
        Offset = 0.08,
        Glare = 0.04,
        Haze = 0.75,
    },
}
local t51 = {}
local u89
local u87

local function v90()
    if not v53.CustomAtmosphere or not v53.CustomAtmosphere.Enabled then
        if u87 then
            u87:Destroy()

            u87 = nil
        end

        return
    end

    local v221 = t50[v53.CustomSky.Mode or 'Tropical'] or t50.Tropical
    local CustomAtmosphere = v53.CustomAtmosphere

    if not u87 or not u87.Parent then
        u87 = Instance.new('Atmosphere')
        u87.Name = 'KitagawaAtmosphere'
        u87.Parent = v11
    end

    u87.Color = v221.Color
    u87.Density = CustomAtmosphere.Density or v221.Density
    u87.Offset = CustomAtmosphere.Offset or v221.Offset
    u87.Glare = CustomAtmosphere.Glare or v221.Glare
    u87.Haze = CustomAtmosphere.Haze or v221.Haze
    u87.Decay = Color3.fromRGB(math.clamp(v221.Color.R * 255 * 0.85, 0, 255), math.clamp(v221.Color.G * 255 * 0.85, 0, 255), (math.clamp(v221.Color.B * 255 * 0.85, 0, 255)))
end
local function v92(p15)
    if not p15 then
        return nil
    end
    if p15:IsA('Sky') then
        return p15
    end

    return p15:FindFirstChildWhichIsA('Sky', true)
end
local function v93(p16)
    local num = tonumber(p16)

    if not num then
        return nil
    end
    if t51[num] then
        return t51[num]
    end

    local u225

    pcall(function()
        local ok, result = pcall(function()
            return game:GetObjects('rbxassetid://' .. tostring(num))
        end)

        if ok and result then
            for _, v in ipairs(result)do
                u225 = v92(v)

                if u225 then
                    break
                end
            end
        end
        if not u225 then
            local v773 = v8:LoadAsset(num)

            for _, child in ipairs(v773:GetChildren())do
                u225 = v92(child)

                if u225 then
                    break
                end
            end

            v773:Destroy()
        end
    end)

    if u225 then
        t51[num] = u225
    end

    return u225
end
local function v94(p17)
    if u89 then
        u89:Destroy()

        u89 = nil
    end

    u89 = p17:Clone()
    u89.Name = 'KitagawaCustomSky'
    u89.Parent = v11

    pcall(function()
        local Parent = u89.Parent

        u89.Parent = nil
        u89.Parent = Parent
    end)
end
local function v96(p18, p19)
    if not p19 then
        if u89 then
            u89:Destroy()
        end

        v90()

        return
    end

    local v229 = t43[p18] or t43.Tropical
    local v230 = v93(v229)

    if v230 then
        v94(v230)
    end
    if v53.CustomAtmosphere and v53.CustomAtmosphere.Enabled then
        v90()
    end
end

local CharacterAdded = u12.CharacterAdded
local Connect = CharacterAdded.Connect

Connect(CharacterAdded, function(_) end)

local function v100(p21)
    local AntiFlingEnabled = v53.AntiFling.Enabled
    local v271 = AntiFlingEnabled
    local TouchFlingEnabled = v53.TouchFling.Enabled

    if AntiFlingEnabled then
        v271 = t38.AntiFling
    end
    if v271 then
        t38.AntiFling(false)
    end
    if TouchFlingEnabled and t38.TouchFling then
        t38.TouchFling(false)
    end

    u15 = true

    local Character = u12.Character
    local v274 = Character and Character:FindFirstChildOfClass('Humanoid')
    local v275 = v274 and v274.RootPart
    local Character2 = p21.Character
    local v277 = Character2 and Character2:FindFirstChildOfClass('Humanoid')
    local v278 = v277 and v277.RootPart
    local v279 = Character2 and Character2:FindFirstChild('Head')
    local v280 = Character2 and Character2:FindFirstChildOfClass('Accessory')
    local v281 = v280 and v280:FindFirstChild('Handle')

    if Character and (v274 and v275) then
        if v275.Velocity.Magnitude < 50 then
            getgenv().OldPos = v275.CFrame
        end
        if v277 and v277.Sit then
            u15 = false

            if AntiFlingEnabled then
                AntiFlingEnabled = t38.AntiFling
            end
            if AntiFlingEnabled then
                t38.AntiFling(true)
            end
            if TouchFlingEnabled and t38.TouchFling then
                t38.TouchFling(true)
            end

            return
        end
        if v279 then
            workspace.CurrentCamera.CameraSubject = v279
        elseif v281 then
            workspace.CurrentCamera.CameraSubject = v281
        else
            workspace.CurrentCamera.CameraSubject = v277
        end
        if not Character2:FindFirstChildWhichIsA('BasePart') then
            u15 = false

            if AntiFlingEnabled then
                AntiFlingEnabled = t38.AntiFling
            end
            if AntiFlingEnabled then
                t38.AntiFling(true)
            end
            if TouchFlingEnabled and t38.TouchFling then
                t38.TouchFling(true)
            end

            return
        end

        local function v282(p22, p23, p24)
            v275.CFrame = CFrame.new(p22.Position) * p23 * p24

            Character:SetPrimaryPartCFrame(CFrame.new(p22.Position) * p23 * p24)

            v275.Velocity = Vector3.new(90000000, 900000000, 90000000)
            v275.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
        end
        local function v283(p25)
            local timestamp = tick()
            local n2 = 0

            if not (p25.Velocity.Magnitude > 500) and (p25.Parent == p21.Character and p21.Parent == v3) then
                local Character3 = p21.Character

                if Character2 ~= not Character3 and not v277.Sit and not (v274.Health <= 0) then
                    if not (tick() > timestamp + 2) then
                    end
                end
            end

            repeat
                if not (v275 and v277) then
                    return
                end
                if p25.Velocity.Magnitude < 50 then
                    n2 += 100

                    v282(p25, CFrame.new(0, 1.5, 0) + v277.MoveDirection * p25.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                    task.wait()
                    v282(p25, CFrame.new(0, -1.5, 0) + v277.MoveDirection * p25.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                    task.wait()
                    v282(p25, CFrame.new(2.25, 1.5, -2.25) + v277.MoveDirection * p25.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                    task.wait()
                    v282(p25, CFrame.new(-2.25, -1.5, 2.25) + v277.MoveDirection * p25.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                    task.wait()
                else
                    v282(p25, CFrame.new(0, 1.5, v277.WalkSpeed), CFrame.Angles(1.5707963267948966, 0, 0))
                    task.wait()
                    v282(p25, CFrame.new(0, -1.5, -v277.WalkSpeed), CFrame.Angles(0, 0, 0))
                    task.wait()
                end

                local v825 = p25.Velocity.Magnitude > 500

                if not v825 then
                    v825 = p25.Parent ~= p21.Character

                    if not v825 then
                        v825 = p21.Parent ~= v3

                        if not v825 then
                            v825 = true

                            local Character4 = p21.Character

                            if Character2 ~= not Character4 then
                                v825 = v277.Sit or (v274.Health <= 0 or tick() > timestamp + 2)
                            end
                        end
                    end
                end
            until v825
        end

        getgenv().FPDH = workspace.FallenPartsDestroyHeight
        workspace.FallenPartsDestroyHeight = (0 / 0)

        local BodyVelocity = Instance.new('BodyVelocity')

        BodyVelocity.Name = 'EpixVel'
        BodyVelocity.Parent = v275
        BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
        BodyVelocity.MaxForce = Vector3.new((1/0), (1/0), (1/0))

        v274:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

        if v278 and v279 then
            if (v278.CFrame.p - v279.CFrame.p).Magnitude > 5 then
                v283(v279)
            else
                v283(v278)
            end
        elseif v278 and not v279 then
            v283(v278)
        elseif not v278 and v279 then
            v283(v279)
        elseif not v278 and (not v279 and (v280 and v281)) then
            v283(v281)
        end

        BodyVelocity:Destroy()
        v274:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

        workspace.CurrentCamera.CameraSubject = v274

        if not ((v275.Position - getgenv().OldPos.p).Magnitude < 25) then
        end

        repeat
            v275.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)

            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
            v274:ChangeState('GettingUp')

            for _, child in pairs(Character:GetChildren())do
                if child:IsA('BasePart') then
                    local vector3 = Vector3.new()
                    local vector3_2 = Vector3.new()

                    child.Velocity = vector3
                    child.RotVelocity = vector3_2
                end
            end

            task.wait()
        until (v275.Position - getgenv().OldPos.p).Magnitude < 25

        workspace.FallenPartsDestroyHeight = getgenv().FPDH
        u15 = false
    else
        u15 = false
    end
    if AntiFlingEnabled and t38.AntiFling then
        t38.AntiFling(true)
    end
    if TouchFlingEnabled and t38.TouchFling then
        t38.TouchFling(true)
    end
end
local function v101(p26)
    if not p26 then
        return 'Default'
    end

    local Character = p26.Character
    local FindFirstChild = p26.FindFirstChild
    local u292
    local v293 = FindFirstChild(p26, 'Backpack')
    local u294 = false

    local function v295(p27)
        if not p27 then
            return
        end

        local GetChildren = p27.GetChildren

        for _, v in ipairs(GetChildren(p27))do
            if v:IsA('Tool') then
                local v831 = v.Name:lower()

                if string.find(v831, 'knife') then
                    u294 = true
                elseif string.find(v831, 'weapon') or string.find(v831, 'gun') then
                    u292 = true
                end
                if u294 and u292 then
                    return
                end
            end
        end
    end

    u292 = false

    v295(Character)
    v295(v293)

    if u294 then
        return 'Knife'
    end
    if u292 then
        return 'Weapon'
    end

    return 'Default'
end
local function v103(p28)
    local v267 = p28.Name:lower()

    if (v267 == 'gun' or (v267 == 'dropgun' or (v267 == 'gundrop' or v267 == 'weapon'))) and (p28:IsA('BasePart') or p28:IsA('Model')) then
        local p28Parent = p28.Parent

        while p28Parent and p28Parent ~= workspace do
            if p28Parent:FindFirstChild('Humanoid') or p28Parent:IsA('Backpack') then
                return false
            end

            p28Parent = p28Parent.Parent
        end

        return true
    end

    return false
end
local function v104()
    for _, v in pairs(t40)do
        if v.Highlight and v.Highlight.Parent then
            v.Highlight:Destroy()
        end
        if v.Billboard and v.Billboard.Parent then
            v.Billboard:Destroy()
        end
    end

    table.clear(t40)
end
local function v105(p29, p30, p31)
    local Character = u12.Character

    if not Character or not Character:FindFirstChild('HumanoidRootPart') then
        return
    end

    local HumanoidRootPart = Character.HumanoidRootPart
    local CurrentCamera = workspace.CurrentCamera
    local HumanoidRootPartCFrame = HumanoidRootPart.CFrame
    local CurrentCameraCFrame = CurrentCamera.CFrame
    local CameraType = CurrentCamera.CameraType
    local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity

    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    CurrentCamera.CFrame = CurrentCameraCFrame
    HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    HumanoidRootPart.CFrame = p29

    if p31 then
        p31()
    end

    task.wait(p30)

    HumanoidRootPart.CFrame = HumanoidRootPartCFrame
    HumanoidRootPart.AssemblyLinearVelocity = AssemblyLinearVelocity
    CurrentCamera.CameraType = CameraType
    CurrentCamera.CFrame = CurrentCameraCFrame
end

local u102
local u99
local u95
local u91

pcall(function()
    u102 = mousemoveabs
end)
pcall(function()
    u99 = mouse1press
end)
pcall(function()
    u95 = mouse1release
end)
pcall(function()
    u91 = mouse1click
end)
pcall(function()
    if not u102 and (syn and syn.mousemoveabs) then
        u102 = syn.mousemoveabs
    end
end)

local function v106(p32, p33, p34)
    local v299 = p34 or 0.03

    if u99 and u95 then
        pcall(function()
            u99()
        end)
        task.wait(v299)
        pcall(function()
            u95()
        end)
    elseif u91 then
        pcall(function()
            u91()
        end)
    end

    pcall(function()
        v7:SendMouseButtonEvent(p32, p33, 0, true, game, 0)
        task.wait(v299)
        v7:SendMouseButtonEvent(p32, p33, 0, false, game, 0)
    end)
end

local v107 = t1[1]
local _Instance = Instance

t1[1] = function()
    local v325, v326, v327 = ipairs(v3:GetPlayers())
    local v328, Character

    repeat
        repeat
            v327, v328 = v325(v326, v327)

            if not v327 then
                local v329, v330, v331 = ipairs(v3:GetPlayers())
                local v332

                repeat
                    repeat
                        v331, v332 = v329(v330, v331)

                        if not v331 then
                            for _, player in ipairs(v3:GetPlayers())do
                                if not (player ~= u12 and v101(player) == 'Knife') then
                                    continue
                                end

                                local Character5 = player.Character
                                local v336 = Character5 and Character5:FindFirstChildOfClass('Humanoid')

                                if v336 and v336.Health > 0 then
                                    return player, Character5
                                end
                            end

                            return nil, nil
                        end
                    until v332 ~= u12 and (v332.Character and v332.Character:FindFirstChild('Knife'))

                    local Humanoid = v332.Character:FindFirstChildOfClass('Humanoid')
                until Humanoid and Humanoid.Health > 0

                return v332, v332.Character
            end
        until v328 ~= u12 and (v328.Backpack and v328.Backpack:FindFirstChild('Knife'))

        Character = v328.Character

        local v339 = Character and Character:FindFirstChildOfClass('Humanoid')
    until v339 and v339.Health > 0

    return v328, Character
end

local v109 = _Instance.new('Folder')

v109.Name = 'KitagawaBulletTrails'
v109.Parent = workspace

local function v110(p35, p36, p37)
    if not v53.BulletTracker or not v53.BulletTracker.Enabled then
        return
    end
    if not p35 then
        return
    end
    if p37 then
        if p37 == nil then
            return
        end
    elseif tick() - 0 < 0.3 then
        return
    end

    local Character = u12.Character
    local v344 = Character and Character:FindFirstChild('HumanoidRootPart')
    local v345 = p36 or v344 and v344.Position + Vector3.new(0, 1.15, 0)

    if not v345 then
        return
    end

    local color3_9 = Color3.fromRGB(v53.BulletTracker.R, v53.BulletTracker.G, v53.BulletTracker.B)
    local v347 = (v53.BulletTracker.Size or 15) / 55
    local color3_10 = Color3.new(math.min(color3_9.R + 0.25, 1), math.min(color3_9.G + 0.25, 1), (math.min(color3_9.B + 0.25, 1)))

    if (p35 - v345).Magnitude < 0.5 then
        return
    end

    local Part = Instance.new('Part')

    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Transparency = 1
    Part.Size = Vector3.new(0.05, 0.05, 0.05)
    Part.CFrame = CFrame.new(v345)
    Part.Parent = v109

    local Part2 = Instance.new('Part')

    Part2.Anchored = true
    Part2.CanCollide = false
    Part2.CanQuery = false
    Part2.CanTouch = false
    Part2.Transparency = 1
    Part2.Size = Vector3.new(0.05, 0.05, 0.05)
    Part2.CFrame = CFrame.new(p35)
    Part2.Parent = v109

    local Attachment = Instance.new('Attachment', Part)
    local Attachment2 = Instance.new('Attachment', Part2)
    local Beam = Instance.new('Beam')

    Beam.Attachment0 = Attachment
    Beam.Attachment1 = Attachment2
    Beam.Color = ColorSequence.new(color3_10)
    Beam.LightEmission = 1
    Beam.LightInfluence = 0
    Beam.FaceCamera = true
    Beam.Width0 = v347
    Beam.Width1 = v347 * 0.35
    Beam.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.05),
        NumberSequenceKeypoint.new(0.85, 0.35),
        NumberSequenceKeypoint.new(1, 1),
    })
    Beam.Parent = Part

    local Part3 = Instance.new('Part')

    Part3.Anchored = true
    Part3.CanCollide = false
    Part3.CanQuery = false
    Part3.CanTouch = false
    Part3.Shape = Enum.PartType.Ball
    Part3.Material = Enum.Material.Neon
    Part3.Color = color3_10
    Part3.Size = Vector3.new(v347 * 2.2, v347 * 2.2, v347 * 2.2)
    Part3.CFrame = CFrame.new(p35)
    Part3.Transparency = 0.2
    Part3.Parent = v109

    task.spawn(function()
        local n3 = 0

        while n3 < 8 and Beam.Parent do
            n3 += task.wait()

            local _math = math
            local v834 = n3 / 8
            local v835 = _math.min(0.05 + v834 * 0.95, 1)

            Beam.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, v835),
                NumberSequenceKeypoint.new(0.85, (math.min(0.35 + v834 * 0.65, 1))),
                NumberSequenceKeypoint.new(1, 1),
            })

            if Part3.Parent then
                Part3.Transparency = math.min(0.2 + v834 * 0.8, 1)
            end
        end
    end)
    v9:AddItem(Part, 8.5)
    v9:AddItem(Part2, 8.5)
    v9:AddItem(Part3, 8.5)
end

t1[1] = function(...) end

local t52 = {
    notification = t1[1],
    dialog = function(...) end,
    waitfordialog = function()
        return 'Load'
    end,
    closedialog = function() end,
}
local u112 = false
local t53

t1[1] = function()
    for _, player in ipairs(game.Players:GetPlayers())do
        if player.Backpack:FindFirstChild('Knife') then
            return player
        end
    end

    local v366, v367, v368 = ipairs(game.Players:GetPlayers())
    local v369

    repeat
        v368, v369 = v366(v367, v368)

        if not v368 then
            if t53 then
                local v370 = t53
                local v371

                repeat
                    local v372

                    v371, v372 = v370(nil, v371)

                    if not v371 then
                        return nil
                    end
                until v372.Role == 'Murderer' and game.Players:FindFirstChild(v371)

                return game.Players:FindFirstChild(v371)
            end

            return nil
        end
    until v369.Character and v369.Character:FindFirstChild('Knife')

    return v369
end

local v114 = u12

t53 = {}

local v115 = t1[1]

t1[1] = function()
    local Character = v114.Character

    if not Character then
        return false
    end
    if Character:FindFirstChild('Gun') then
        return true
    end

    local Backpack = v114:FindFirstChild('Backpack')
    local v384 = Backpack and Backpack:FindFirstChild('Gun') or v107(nil, Backpack)

    if not v384 then
        return false
    end

    local Humanoid = Character:FindFirstChildOfClass('Humanoid')

    if Humanoid then
        pcall(function()
            Humanoid:EquipTool(v384)
        end)
    end

    return Character:WaitForChild('Gun', 2) ~= nil
end

local function v116()
    for _, player in ipairs(game.Players:GetPlayers())do
        if player.Backpack:FindFirstChild('Gun') then
            return player
        end
    end

    local v357, v358, v359 = ipairs(game.Players:GetPlayers())
    local v360

    repeat
        v359, v360 = v357(v358, v359)

        if not v359 then
            if t53 then
                local v361 = t53
                local v362

                repeat
                    local v363

                    v362, v363 = v361(nil, v362)

                    if not v362 then
                        return nil
                    end
                until v363.Role == 'Sheriff' and game.Players:FindFirstChild(v362)

                return game.Players:FindFirstChild(v362)
            end

            return nil
        end
    until v360.Character and v360.Character:FindFirstChild('Gun')

    return v360
end
local function v117()
    for _, player in ipairs(game.Players:GetPlayers())do
        if player ~= v114 and player.Backpack:FindFirstChild('Gun') then
            return player
        end
    end

    local v375, v376, v377 = ipairs(game.Players:GetPlayers())
    local v378

    repeat
        v377, v378 = v375(v376, v377)

        if not v377 then
            if t53 then
                local v379
                local v380 = t53

                repeat
                    local v381

                    v379, v381 = v380(nil, v379)

                    if not v379 then
                        return nil
                    end
                until v381.Role == 'Sheriff' and game.Players:FindFirstChild(v379) and game.Players:FindFirstChild(v379) ~= v114

                return game.Players:FindFirstChild(v379)
            end

            return nil
        end
    until v378 ~= v114 and v378.Character and v378.Character:FindFirstChild('Gun')

    return v378
end

pcall(function()
    if not game.ReplicatedStorage:WaitForChild('Remotes', 5) then
        t52.dialog('Not MM2', "Looks like this game isn't MM2. Do you want to load the module anyway?", {
            'Load',
            'No',
        })

        if t52.waitfordialog() == 'No' then
            t52.closedialog()
            t52.notification('MM2 will not be loaded until you rejoin.', Color3.fromRGB(255, 0, 0), 'x')

            return
        end

        t52.closedialog()

        return
    end

    game.ReplicatedStorage:WaitForChild('Remotes'):WaitForChild('Gameplay'):WaitForChild('PlayerDataChanged', 5).OnClientEvent:Connect(function(p38)
        t53 = p38
    end)
end)

local function v118(p39, p40)
    local v389 = p39

    pcall(function()
        p39 = p39.Character

        if not p39.Character then
            t52.notification('No murderer to predict position.')

            return
        end
    end)

    local UpperTorso = p39:FindFirstChild('UpperTorso')
    local Humanoid = p39:FindFirstChild('Humanoid')

    if not UpperTorso or not Humanoid then
        return Vector3.new(0, 0, 0), "Could not find the player's HumanoidRootPart."
    end

    local UpperTorsoPosition = UpperTorso.Position
    local v393 = false

    if v393 then
        v393 = false
    end
    if v393 then
        if (UpperTorsoPosition - v114.Character:FindFirstChild('UpperTorso').Position).Magnitude > 20 then
            t52.notification('Calculating trajectory...')

            local v394 = getgenv().YARHMNetwork_predictPos(v389)

            task.spawn(function()
                task.wait(5)
            end)

            return v394
        end

        t52.notification('Murderer is too close for trajectory prediction. Reverting to basic prediction.')
    elseif false then
        t52.notification('YARHM AI Engine is not available. Reverting to basic prediction.')
    end

    Vector3.new()

    local AssemblyLinearVelocity = UpperTorso.AssemblyLinearVelocity
    local MoveDirection = Humanoid.MoveDirection
    local _ = UpperTorso.CFrame.LookVector

    if AssemblyLinearVelocity.Y > 0 then
    end

    return (UpperTorso.Position + AssemblyLinearVelocity * Vector3.new(0.75, 0.5, 0.75) * (p40 / 15) + MoveDirection * p40) * (v114:GetNetworkPing() * 1000 * 0 + 1)
end

local u30 = t1[1]

local function v119(p41)
    if not p41 or not p41.Character then
        return false
    end
    if not u30() then
        t52.notification("You don't have the gun..?")

        return false
    end
    if not p41.Character:FindFirstChild('HumanoidRootPart') then
        t52.notification("Could not find the murderer's HumanoidRootPart.")

        return
    end

    local v399 = v118(p41, 2.8)
    local v400 = v114.Character:FindFirstChild('RightHand') or v114.Character:FindFirstChild('Right Arm')
    local v401 = v400 and v400.Position or v114.Character.HumanoidRootPart.Position
    local t54 = {
        CFrame.new(v401),
        CFrame.new(v399),
    }
    local timestamp = tick()

    if timestamp - 0 < 1.05 then
        return false
    end

    local v404 = tostring(timestamp) .. '_' .. tostring(p41.UserId)
    local Shoot = v114.Character:WaitForChild('Gun'):WaitForChild('Shoot')
    local t55 = {
        unpack(t54),
    }

    Shoot:FireServer(v2(t55))
    v110(v399, v401, v404)

    return true
end

task.spawn(function()
    while task.wait(0.2) do
        if u112 or wallShooting and v116() == v114 then
            u30()
        end
    end
end)

local u120

t1[1] = function()
    if v116() == v114 and u120 then
        t52.notification('WallShot auto-shooting started.')

        repeat
            task.wait(0.08)

            local v421 = v115() or v117()

            if not v421 then
                warn('[YARHM] > MM2 Autoshoot - No murderer.')
            else
                local HumanoidRootPartPosition = v421.Character.HumanoidRootPart.Position
                local HumanoidRootPart = v114.Character.HumanoidRootPart
                local v424 = HumanoidRootPartPosition - HumanoidRootPart.Position
                local raycastParams = RaycastParams.new()

                raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                raycastParams.FilterDescendantsInstances = {
                    v114.Character,
                }

                local raycastResult = workspace:Raycast(HumanoidRootPart.Position, v424, raycastParams)

                if not raycastResult or raycastResult.Instance.Parent == v421.Character then
                    v119(v421)
                elseif raycastResult then
                    local v427 = v424.Magnitude > 0.01 and v424.Unit or Vector3.new(0, 0, -1)
                    local v428 = raycastResult.Position + v427 * 5 + Vector3.new(0, 1.5, 0)

                    HumanoidRootPart.CFrame = CFrame.new(v428, HumanoidRootPartPosition)

                    task.wait(0.03)
                    v119(v421)
                end
            end
        until not u120
    end
end

local function v123()
    if v116() == v114 and u112 then
        t52.notification('Auto-shooting started.')

        repeat
            task.wait(0.08)

            local v414 = v115() or v117()

            if not v414 then
                warn('[YARHM] > MM2 Autoshoot - No murderer.')
            else
                local HumanoidRootPartPosition = v414.Character.HumanoidRootPart.Position
                local HumanoidRootPart = v114.Character.HumanoidRootPart
                local v417 = (HumanoidRootPartPosition - HumanoidRootPart.Position).Unit * 50
                local raycastParams = RaycastParams.new()

                raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                raycastParams.FilterDescendantsInstances = {
                    v114.Character,
                }

                local raycastResult = workspace:Raycast(HumanoidRootPart.Position, v417, raycastParams)

                if not raycastResult or raycastResult.Instance.Parent == v414.Character then
                    v119(v414)
                end
            end
        until not u112
    end
end

u120 = false

local n4 = 0
local v124 = t1[1]

local function v125()
    u120 = false

    n4 += 1
end

t1[1] = function()
    v125()

    u120 = true

    task.spawn(function()
        while u120 and (v53.WallShotMurder.Enabled and true) do
            if v116() == v114 then
                v124()

                return
            end

            task.wait(0.5)
        end
    end)
end

local v126 = t1[1]
local n5 = 0

local function v127()
    u112 = false

    n5 += 1
end

local t56 = {
    assetId = 90816193741219,
    scale = 0.34,
}
local t57 = {
    assetId = 108484995254710,
    scale = 0.34,
}
local t58 = {
    assetId = 81562119173687,
    scale = 0.34,
}
local t59 = {
    WingsAura = t56,
    StarrBallAura = t57,
    RedAura = t58,
}
local Folder2 = Instance.new('Folder')

Folder2.Name = 'KitagawaJumpCircles'
Folder2.Parent = workspace
t1[1] = function(p42)
    local Character = u12.Character

    if not Character then
        return
    end

    local v434 = 'KitagawaAuraAtt_' .. p42
    local v435 = 'KitagawaAura_' .. p42
    local GetDescendants = Character.GetDescendants

    for _, v in ipairs(GetDescendants(Character))do
        if v435 == v.Name or v434 == string.sub(v.Name, 1, #v434) then
            v:Destroy()
        end
    end
end

local t60 = {
    'JumpCircleNeon',
    'JumpCircleShock',
    'JumpCirclePulse',
}

local function v134(p43, p44)
    local t61 = {}

    for _, v in ipairs(p43.Size.Keypoints)do
        t61[#t61 + 1] = NumberSequenceKeypoint.new(v.Time, v.Value * p44, v.Envelope * p44)
    end

    p43.Size = NumberSequence.new(t61)
    p43.Speed = NumberRange.new(p43.Speed.Min * p44, p43.Speed.Max * p44)

    if typeof(p43.Acceleration) == 'Vector3' then
        p43.Acceleration = p43.Acceleration * p44
    end
end
local function v135(p45)
    local u440

    pcall(function()
        local Objects = game:GetObjects('rbxassetid://' .. tostring(p45))

        for _, v in ipairs(Objects)do
            if v:IsA('Model') or (v:IsA('Folder') or v:IsA('Tool')) then
                u440 = v

                break
            end
        end

        if not u440 and Objects[1] then
            u440 = Objects[1]
        end
    end)

    if not u440 then
        pcall(function()
            u440 = v8:LoadAsset(p45)
        end)
    end

    return u440
end
local function v136(p46, p47)
    if not p46:IsA('BasePart') then
        return false
    end

    local Model = p46:FindFirstAncestorOfClass('Model')

    if not Model or Model == p47 then
        return false
    end

    return Model:FindFirstChildOfClass('Humanoid') ~= nil
end

local u137 = t1[1]

local function v138()
    for k in pairs(t59)do
        u137(k)
    end
end

t1[1] = function(p48, p49)
    if not p49 then
        return
    end

    local v470 = p49.Position - Vector3.new(0, p49.Size.Y * 0.5 + 0.05, 0)

    if p48 == 'Neon' then
        local Part = Instance.new('Part')

        Part.Name = 'JumpCircleNeon'
        Part.Shape = Enum.PartType.Cylinder
        Part.Size = Vector3.new(0.08, 1.6, 1.6)
        Part.CFrame = CFrame.new(v470) * CFrame.Angles(0, 0, 1.5707963267948966)
        Part.Material = Enum.Material.Neon
        Part.Color = Color3.fromRGB(0, 195, 255)
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.Transparency = 0.15
        Part.Parent = Folder2

        local v472 = v6
        local tweenInfo = TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local vector3 = Vector3.new(0.08, 9, 9)
        local fromRGB = Color3.fromRGB
        local Create = v472.Create
        local v477 = fromRGB(120, 230, 255)

        Create(v472, Part, tweenInfo, {
            Size = vector3,
            Transparency = 1,
            Color = v477,
        }):Play()
        v9:AddItem(Part, 0.65)

        return
    end
    if p48 == 'Shock' then
        for i = 1, 2 do
            local Part = Instance.new('Part')

            Part.Name = 'JumpCircleShock'
            Part.Shape = Enum.PartType.Cylinder
            Part.Size = Vector3.new(0.06, i * 0.4 + 1.2, i * 0.4 + 1.2)
            Part.CFrame = CFrame.new(v470) * CFrame.Angles(0, 0, 1.5707963267948966)
            Part.Material = Enum.Material.Neon
            Part.Color = i == 1 and Color3.fromRGB(255, 90, 40) or Color3.fromRGB(255, 200, 60)
            Part.Anchored = true
            Part.CanCollide = false
            Part.CanQuery = false
            Part.CanTouch = false
            Part.Transparency = 0.2
            Part.Parent = Folder2

            task.delay((i - 1) * 0.06, function()
                if Part.Parent then
                    local v840 = v6
                    local v841 = Part
                    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                    local new = Vector3.new
                    local v844 = i
                    local v845 = i

                    v840:Create(v841, tweenInfo, {
                        Size = new(0.06, 10 + v844, 10 + v845),
                        Transparency = 1,
                    }):Play()
                end
            end)
            v9:AddItem(Part, 0.7)
        end

        return
    end
    if p48 == 'Pulse' then
        local Part = Instance.new('Part')

        Part.Name = 'JumpCirclePulse'
        Part.Shape = Enum.PartType.Cylinder
        Part.Size = Vector3.new(0.1, 2, 2)
        Part.CFrame = CFrame.new(v470) * CFrame.Angles(0, 0, 1.5707963267948966)
        Part.Material = Enum.Material.ForceField
        Part.Color = Color3.fromRGB(170, 80, 255)
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.Transparency = 0.05
        Part.Parent = Folder2

        local SpecialMesh = Instance.new('SpecialMesh', Part)

        SpecialMesh.MeshType = Enum.MeshType.Sphere
        SpecialMesh.Scale = Vector3.new(1, 0.04, 1)

        local v482 = v6
        local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        local _Vector3 = Vector3
        local Create = v482.Create
        local v486 = _Vector3.new(0.1, 11, 11)
        local color3_11 = Color3.fromRGB(220, 140, 255)

        Create(v482, Part, tweenInfo, {
            Size = v486,
            Transparency = 1,
            Color = color3_11,
        }):Play()
        task.spawn(function()
            local timestamp = tick()

            while Part.Parent and tick() - timestamp < 0.6 do
                Part.CFrame = CFrame.new(v470) * CFrame.Angles(0, math.rad((tick() - timestamp) * 420), 1.5707963267948966)

                task.wait()
            end
        end)
        v9:AddItem(Part, 0.7)
    end
end

local function u139(p50)
    local v447 = t59[p50]
    local v448 = v53[p50]

    if not v447 or (not v448 or not v448.Enabled) then
        return
    end

    local Character = u12.Character

    if not Character then
        return
    end

    u137(p50)

    local v450 = Character:FindFirstChild('UpperTorso') or (Character:FindFirstChild('Torso') or Character:FindFirstChild('HumanoidRootPart'))

    if not v450 then
        return
    end

    local v451 = v135(v447.assetId)

    if not v451 then
        return
    end

    local Folder3 = Instance.new('Folder')

    Folder3.Name = 'KitagawaAura_' .. p50
    Folder3.Parent = v450

    local n6 = 0
    local descendants = v451:GetDescendants()

    table.insert(descendants, v451)

    for _, v in ipairs(descendants)do
        if v:IsA('ParticleEmitter') then
            n6 += 1

            local Attachment = Instance.new('Attachment')

            Attachment.Name = 'KitagawaAuraAtt_' .. p50 .. '_' .. n6

            local vParent = v.Parent

            if vParent:IsA('Attachment') then
                Attachment.Position = vParent.Position
                Attachment.Orientation = vParent.Orientation
            elseif vParent:IsA('BasePart') then
                Attachment.CFrame = v450.CFrame:ToObjectSpace(vParent.CFrame)
            end

            Attachment.Parent = v450

            local clone = v:Clone()

            v134(clone, v447.scale)

            clone.Rate = math.max(3, clone.Rate * 0.55)
            clone.Enabled = true
            clone.Parent = Attachment
        elseif v:IsA('BasePart') and not v136(v, Character) and v:FindFirstChildWhichIsA('ParticleEmitter', true) then
            local clone = v:Clone()

            for v463, v464 in ipairs(clone:GetDescendants())do
                if v464:IsA('BasePart') then
                    v464.Anchored = false
                    v464.CanCollide = false
                    v464.CanQuery = false
                    v464.CanTouch = false
                    v464.Massless = true

                    if v464.Transparency < 1 then
                        v464.Transparency = math.max(v464.Transparency, 0.95)
                    end
                elseif v464:IsA('ParticleEmitter') then
                    v134(v464, v447.scale)

                    v464.Enabled = true
                elseif v464:IsA('Humanoid') or (v464:IsA('Script') or v464:IsA('LocalScript')) then
                    v464:Destroy()
                end
            end

            if clone:IsA('BasePart') then
                clone.Anchored = false
                clone.CanCollide = false
                clone.Massless = true
                clone.Transparency = 1
            end

            clone.Parent = Folder3

            local v465 = clone:IsA('BasePart') and clone or clone:FindFirstChildWhichIsA('BasePart')

            if v465 then
                v465.CFrame = v450.CFrame

                local WeldConstraint = Instance.new('WeldConstraint')

                WeldConstraint.Part0 = v450
                WeldConstraint.Part1 = v465
                WeldConstraint.Parent = v465
            else
                clone:Destroy()
            end
        end
    end

    pcall(function()
        v451:Destroy()
    end)

    if n6 == 0 and #Folder3:GetChildren() == 0 then
        Folder3:Destroy()
    end
end
local function v140()
    for k in pairs(t59)do
        local v489 = k

        if v53[v489] and v53[v489].Enabled then
            u139(v489)
        end
    end
end

local v141 = t1[1]

local function v142()
    if v53.JumpCircleNeon.Enabled then
        return 'Neon'
    end
    if v53.JumpCircleShock.Enabled then
        return 'Shock'
    end
    if v53.JumpCirclePulse.Enabled then
        return 'Pulse'
    end

    return nil
end
local function v143(p51, p52)
    if not p52 then
        return
    end

    for _, v in ipairs(t60)do
        if v ~= p51 and (v53[v].Enabled and t38[v]) then
            t38[v](false)
        end
    end
end

t1[1] = u12.CharacterAdded

t1[1]:Connect(function(p53)
    p53:WaitForChild('HumanoidRootPart', 10)
    task.wait(0.5)
    v140()

    local Humanoid = p53:WaitForChild('Humanoid', 8)

    if not Humanoid then
        return
    end

    Humanoid.StateChanged:Connect(function(_, newState)
        if newState ~= Enum.HumanoidStateType.Jumping then
            return
        end

        local v853 = v142()

        if not v853 then
            return
        end
        if tick() - 0 < 0.12 then
            return
        end

        local HumanoidRootPart = p53:FindFirstChild('HumanoidRootPart')

        if HumanoidRootPart then
            v141(v853, HumanoidRootPart)
        end
    end)
end)

t1[1] = u12

if t1[1].Character then
    task.spawn(function()
        v140()

        local Character = u12.Character
        local Humanoid = Character:WaitForChild('Humanoid', 8)

        if not Humanoid then
            return
        end

        Humanoid.StateChanged:Connect(function(_, newState)
            if newState ~= Enum.HumanoidStateType.Jumping then
                return
            end

            local v857 = v142()

            if not v857 then
                return
            end
            if tick() - 0 < 0.12 then
                return
            end

            local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart')

            if HumanoidRootPart then
                v141(v857, HumanoidRootPart)
            end
        end)
    end)
end

local t62 = {}

(function()
    local t63 = {}
    local Frame4 = Instance.new('Frame')

    Frame4.Name = 'MainFrame'
    Frame4.Size = UDim2.new(0, 600, 0, 500)
    Frame4.Position = UDim2.new(0.5, -300, 0.5, -250)
    Frame4.BackgroundColor3 = color3_2
    Frame4.BackgroundTransparency = 0.22
    Frame4.BorderSizePixel = 0
    Frame4.ClipsDescendants = true
    Frame4.Parent = v60
    Instance.new('UICorner', Frame4).CornerRadius = UDim.new(0, 8)

    local UIStroke3 = Instance.new('UIStroke', Frame4)

    UIStroke3.Color = color3_4
    UIStroke3.Thickness = 1
    UIStroke3.Transparency = 0.25

    v67(Frame4)
    TextButton.MouseButton1Click:Connect(function()
        Frame4.Visible = not Frame4.Visible
    end)
    pcall(function()
        v67(Frame, nil, TextButton)
    end)

    local Frame5 = Instance.new('Frame', Frame4)

    Frame5.Size = UDim2.new(0, 180, 1, 0)
    Frame5.BackgroundColor3 = color3_2
    Frame5.BackgroundTransparency = 0.22
    Frame5.BorderSizePixel = 0
    Frame5.ZIndex = 1
    Instance.new('UICorner', Frame5).CornerRadius = UDim.new(0, 8)

    local Frame6 = Instance.new('Frame', Frame5)

    Frame6.Size = UDim2.new(0, 1, 1, 0)
    Frame6.Position = UDim2.new(1, 0, 0, 0)
    Frame6.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    Frame6.BorderSizePixel = 0
    Frame6.ZIndex = 1

    local ImageLabel = Instance.new('ImageLabel', Frame5)

    ImageLabel.Size = UDim2.new(0, 56, 0, 56)
    ImageLabel.Position = UDim2.new(0, 10, 0, 12)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Image = 'rbxassetid://76859573847035'
    ImageLabel.ScaleType = Enum.ScaleType.Fit
    ImageLabel.ZIndex = 2
    Instance.new('UICorner', ImageLabel).CornerRadius = UDim.new(0, 8)

    local TextLabel2 = Instance.new('TextLabel', Frame5)

    TextLabel2.Size = UDim2.new(1, -54, 0, 70)
    TextLabel2.Position = UDim2.new(0, 72, 0, 3)
    TextLabel2.BackgroundTransparency = 1
    TextLabel2.Text = 'KitagawaHub'
    TextLabel2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel2.TextTransparency = 0.4
    TextLabel2.TextSize = 19
    TextLabel2.Font = Enum.Font.FredokaOne
    TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel2.ZIndex = 1

    local TextLabel3 = Instance.new('TextLabel', Frame5)

    TextLabel3.Size = UDim2.new(1, -54, 0, 70)
    TextLabel3.Position = UDim2.new(0, 70, 0, 0)
    TextLabel3.BackgroundTransparency = 1
    TextLabel3.RichText = true
    TextLabel3.Text = '<font color="#DDDDDD">Kitagawa</font><font color="#00A2FF">Hub</font>'
    TextLabel3.TextSize = 19
    TextLabel3.Font = Enum.Font.FredokaOne
    TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel3.ZIndex = 2

    local ScrollingFrame = Instance.new('ScrollingFrame', Frame5)

    ScrollingFrame.Size = UDim2.new(1, 0, 1, -162)
    ScrollingFrame.Position = UDim2.new(0, 0, 0, 70)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.ScrollBarThickness = 2
    ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 95)
    ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingFrame.ZIndex = 2

    local UIListLayout = Instance.new('UIListLayout', ScrollingFrame)

    UIListLayout.Padding = UDim.new(0, 5)
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local UIPadding = Instance.new('UIPadding', ScrollingFrame)

    UIPadding.PaddingTop = UDim.new(0, 5)
    UIPadding.PaddingBottom = UDim.new(0, 10)

    local u513 = false
    local Frame7 = Instance.new('Frame', Frame5)

    Frame7.Name = 'ProfileCard'
    Frame7.Size = UDim2.new(1, -16, 0, 88)
    Frame7.Position = UDim2.new(0, 8, 1, -92)
    Frame7.BackgroundColor3 = color3_3
    Frame7.BackgroundTransparency = 0.32
    Frame7.BorderSizePixel = 0
    Frame7.ZIndex = 1
    Instance.new('UICorner', Frame7).CornerRadius = UDim.new(0, 8)

    local UIStroke4 = Instance.new('UIStroke', Frame7)

    UIStroke4.Color = color3_4
    UIStroke4.Thickness = 1
    UIStroke4.Transparency = 0.35

    local Frame8 = Instance.new('Frame', Frame7)

    Frame8.Size = UDim2.new(0, 44, 0, 44)
    Frame8.Position = UDim2.new(0, 8, 0, 8)
    Frame8.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    Frame8.BackgroundTransparency = 0
    Frame8.ZIndex = 2
    Instance.new('UICorner', Frame8).CornerRadius = UDim.new(1, 0)
    Instance.new('UIStroke', Frame8).Color = color3_4

    local ImageLabel2 = Instance.new('ImageLabel', Frame8)

    ImageLabel2.Size = UDim2.new(1, -4, 1, -4)
    ImageLabel2.Position = UDim2.new(0, 2, 0, 2)
    ImageLabel2.BackgroundTransparency = 1
    ImageLabel2.ScaleType = Enum.ScaleType.Crop
    ImageLabel2.ZIndex = 3
    Instance.new('UICorner', ImageLabel2).CornerRadius = UDim.new(1, 0)

    local TextLabel4 = Instance.new('TextLabel', Frame7)

    TextLabel4.Size = UDim2.new(1, -60, 0, 16)
    TextLabel4.Position = UDim2.new(0, 58, 0, 10)
    TextLabel4.BackgroundTransparency = 1
    TextLabel4.Font = Enum.Font.GothamBold
    TextLabel4.TextSize = 12
    TextLabel4.TextColor3 = color3_6
    TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel4.TextTruncate = Enum.TextTruncate.AtEnd
    TextLabel4.ZIndex = 2

    local TextLabel5 = Instance.new('TextLabel', Frame7)

    TextLabel5.Size = UDim2.new(1, -60, 0, 14)
    TextLabel5.Position = UDim2.new(0, 58, 0, 28)
    TextLabel5.BackgroundTransparency = 1
    TextLabel5.Font = Enum.Font.Gotham
    TextLabel5.TextSize = 10
    TextLabel5.TextColor3 = color3_7
    TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel5.TextTruncate = Enum.TextTruncate.AtEnd
    TextLabel5.ZIndex = 2

    local TextButton2 = Instance.new('TextButton', Frame7)

    TextButton2.Size = UDim2.new(1, -16, 0, 22)
    TextButton2.Position = UDim2.new(0, 8, 1, -28)
    TextButton2.BackgroundColor3 = color3_2
    TextButton2.BackgroundTransparency = 0.15
    TextButton2.Text = 'Anonymous'
    TextButton2.Font = Enum.Font.GothamMedium
    TextButton2.TextSize = 10
    TextButton2.TextColor3 = color3_6
    TextButton2.ZIndex = 2
    Instance.new('UICorner', TextButton2).CornerRadius = UDim.new(1, 0)

    local function v521()
        if u513 then
            ImageLabel2.Image = ''
            ImageLabel2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            ImageLabel2.BackgroundTransparency = 0
            TextLabel4.Text = '?'
            TextLabel5.Text = '@?'
            TextButton2.Text = 'Show profile'

            return
        end

        ImageLabel2.BackgroundTransparency = 1

        local v859 = ImageLabel2
        local s3

        if not s3 then
            s3 = ''
        end

        v859.Image = s3
        TextLabel4.Text = u12.DisplayName
        TextLabel5.Text = '@' .. u12.Name
        TextButton2.Text = 'Anonymous'
    end

    task.spawn(function()
        local ok, result = pcall(function()
            return v3:GetUserThumbnailAsync(u12.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        end)

        if ok and result and not u513 then
            ImageLabel2.Image = result
        end
    end)
    TextButton2.MouseButton1Click:Connect(function()
        u513 = not u513

        v521()
    end)
    v521()

    local Frame9 = Instance.new('Frame', Frame4)

    Frame9.Size = UDim2.new(1, -180, 1, 0)
    Frame9.Position = UDim2.new(0, 180, 0, 0)
    Frame9.BackgroundTransparency = 1
    Frame9.ZIndex = 1

    local function v523()
        for _, v in pairs(t41)do
            if v53.DeviceMode == 'Mobile' then
                v.Button.Text = 'Create Btn'
            else
                v.Button.Text = v53[v.ConfigName].Bind and v53[v.ConfigName].Bind.Name or 'Bind'
            end
        end
    end
    local function v524(p56)
        local Frame10 = Instance.new('Frame', p56)

        Frame10.Size = UDim2.new(0, 370, 0, 40)
        Frame10.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        Frame10.BackgroundTransparency = 0.6
        Instance.new('UICorner', Frame10).CornerRadius = UDim.new(0, 6)
        Instance.new('UIStroke', Frame10).Color = Color3.fromRGB(45, 45, 55)
        Frame10.LayoutOrder = -2
        Frame10.ZIndex = 1

        local TextButton3 = Instance.new('TextButton', Frame10)

        TextButton3.Size = UDim2.new(0.5, -5, 1, -10)
        TextButton3.Position = UDim2.new(0, 5, 0, 5)
        TextButton3.BackgroundColor3 = v53.DeviceMode == 'PC' and Color3.fromRGB(50, 50, 60) or Color3.fromRGB(35, 35, 40)
        TextButton3.Text = '\u{1f4bb} \u{414}\u{41b}\u{42f} \u{41f}\u{41a}'
        TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton3.Font = Enum.Font.GothamBold
        TextButton3.TextSize = 12
        TextButton3.ZIndex = 1
        TextButton3.BackgroundTransparency = 0.2
        Instance.new('UICorner', TextButton3).CornerRadius = UDim.new(0, 6)

        local TextButton4 = Instance.new('TextButton', Frame10)

        TextButton4.Size = UDim2.new(0.5, -10, 1, -10)
        TextButton4.Position = UDim2.new(0.5, 5, 0, 5)
        TextButton4.BackgroundColor3 = v53.DeviceMode == 'Mobile' and Color3.fromRGB(50, 50, 60) or Color3.fromRGB(35, 35, 40)
        TextButton4.Text = '\u{1f4f1} \u{414}\u{41b}\u{42f} \u{422}\u{415}\u{41b}\u{415}\u{424}\u{41e}\u{41d}\u{410}'
        TextButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton4.Font = Enum.Font.GothamBold
        TextButton4.TextSize = 12
        TextButton4.ZIndex = 1
        TextButton4.BackgroundTransparency = 0.2
        Instance.new('UICorner', TextButton4).CornerRadius = UDim.new(0, 6)

        table.insert(t42, {
            PC = TextButton3,
            Mobile = TextButton4,
        })

        local function v869()
            for _, v in pairs(t42)do
                v.PC.BackgroundColor3 = v53.DeviceMode == 'PC' and Color3.fromRGB(50, 50, 60) or Color3.fromRGB(35, 35, 40)
                v.Mobile.BackgroundColor3 = v53.DeviceMode == 'Mobile' and Color3.fromRGB(50, 50, 60) or Color3.fromRGB(35, 35, 40)
            end

            v523()
        end

        TextButton3.MouseButton1Click:Connect(function()
            v53.DeviceMode = 'PC'

            v869()
        end)
        TextButton4.MouseButton1Click:Connect(function()
            v53.DeviceMode = 'Mobile'

            v869()
        end)
    end
    local function v525(p57)
        local ScrollingFrame2 = Instance.new('ScrollingFrame', Frame9)

        ScrollingFrame2.Name = p57 .. 'Page'
        ScrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
        ScrollingFrame2.BackgroundTransparency = 1
        ScrollingFrame2.ScrollBarThickness = 2
        ScrollingFrame2.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 95)
        ScrollingFrame2.AutomaticCanvasSize = Enum.AutomaticSize.Y
        ScrollingFrame2.Visible = false
        ScrollingFrame2.ZIndex = 1

        local UIListLayout2 = Instance.new('UIListLayout', ScrollingFrame2)

        UIListLayout2.Padding = UDim.new(0, 12)
        UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
        Instance.new('UIPadding', ScrollingFrame2).PaddingTop = UDim.new(0, 20)
        Instance.new('UIPadding', ScrollingFrame2).PaddingBottom = UDim.new(0, 20)

        local Frame11 = Instance.new('Frame', ScrollingFrame2)

        Frame11.Size = UDim2.new(0, 390, 0, 40)
        Frame11.BackgroundTransparency = 1
        Frame11.LayoutOrder = -2
        Frame11.ZIndex = 1

        v524(Frame11)

        return ScrollingFrame2
    end

    local v526 = v525('Main')
    local v527 = v525('Combat')
    local v528 = v525('AutoFarm')
    local v529 = v525('Fun')
    local v530 = v525('Misc')
    local v531 = v525('Visuals')
    local v532 = v525('Troll')

    v526.Visible = true

    local u533

    local function v534(p58, p59, p60)
        local TextButton5 = Instance.new('TextButton', ScrollingFrame)

        TextButton5.Size = UDim2.new(0, 160, 0, 42)
        TextButton5.BackgroundColor3 = p58 == 'Main' and Color3.fromRGB(35, 35, 45) or Color3.fromRGB(20, 20, 26)
        TextButton5.BackgroundTransparency = p58 ~= 'Main' and 0.8 or 0.4
        TextButton5.Text = p58
        TextButton5.TextColor3 = p58 == 'Main' and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(140, 140, 155)
        TextButton5.Font = Enum.Font.GothamMedium
        TextButton5.TextSize = 13
        TextButton5.TextXAlignment = Enum.TextXAlignment.Left
        TextButton5.ZIndex = 1
        Instance.new('UICorner', TextButton5).CornerRadius = UDim.new(0, 6)
        Instance.new('UIPadding', TextButton5).PaddingLeft = UDim.new(0, 42)

        local Frame12 = Instance.new('Frame', TextButton5)

        Frame12.Size = UDim2.new(0, 3, 0, 20)
        Frame12.Position = UDim2.new(0, -38, 0.5, -10)
        Frame12.BackgroundColor3 = color3
        Frame12.BackgroundTransparency = p58 ~= 'Main' and 1 or 0
        Frame12.ZIndex = 1
        Instance.new('UICorner', Frame12).CornerRadius = UDim.new(1, 0)

        local ImageLabel3 = Instance.new('ImageLabel', TextButton5)

        ImageLabel3.Size = UDim2.new(0, 20, 0, 20)
        ImageLabel3.Position = UDim2.new(0, -28, 0.5, -10)
        ImageLabel3.BackgroundTransparency = 1
        ImageLabel3.Image = 'rbxthumb://type=Asset&id=' .. tostring(p60) .. '&w=150&h=150'
        ImageLabel3.ImageColor3 = p58 == 'Main' and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(140, 140, 155)
        ImageLabel3.ZIndex = 1

        if p58 == 'Main' then
            u533 = TextButton5
        end

        TextButton5.MouseEnter:Connect(function()
            if u533 ~= TextButton5 then
                v6:Create(TextButton5, TweenInfo.new(0.2), {BackgroundTransparency = 0.5}):Play()
                v6:Create(ImageLabel3, TweenInfo.new(0.2), {
                    ImageColor3 = Color3.fromRGB(200, 200, 215),
                }):Play()
                v6:Create(TextButton5, TweenInfo.new(0.2), {
                    TextColor3 = Color3.fromRGB(200, 200, 215),
                }):Play()
            end
        end)
        TextButton5.MouseLeave:Connect(function()
            if u533 ~= TextButton5 then
                v6:Create(TextButton5, TweenInfo.new(0.2), {BackgroundTransparency = 0.8}):Play()
                v6:Create(ImageLabel3, TweenInfo.new(0.2), {
                    ImageColor3 = Color3.fromRGB(140, 140, 155),
                }):Play()
                v6:Create(TextButton5, TweenInfo.new(0.2), {
                    TextColor3 = Color3.fromRGB(140, 140, 155),
                }):Play()
            end
        end)
        TextButton5.MouseButton1Click:Connect(function()
            if u533 == TextButton5 then
                return
            end

            for v1125, v1126 in pairs(Frame9:GetChildren())do
                if v1126.Name:match('Page') then
                    v1126.Visible = false
                end
            end

            p59.Visible = true

            if u533 then
                local v1127 = v6
                local v1128 = u533
                local tweenInfo = TweenInfo.new(0.2)
                local _Color3 = Color3
                local Create = v1127.Create
                local v1132 = _Color3.fromRGB(140, 140, 155)

                Create(v1127, v1128, tweenInfo, {
                    BackgroundTransparency = 0.8,
                    TextColor3 = v1132,
                }):Play()
                v6:Create(u533:FindFirstChild('ImageLabel'), TweenInfo.new(0.2), {
                    ImageColor3 = Color3.fromRGB(140, 140, 155),
                }):Play()
                v6:Create(u533:FindFirstChild('Frame'), TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            end

            local v1133 = v6
            local v1134 = TextButton5
            local tweenInfo = TweenInfo.new(0.2)
            local Create = v1133.Create
            local color3_12 = Color3.fromRGB(255, 255, 255)

            Create(v1133, v1134, tweenInfo, {
                BackgroundTransparency = 0.4,
                TextColor3 = color3_12,
            }):Play()
            v6:Create(ImageLabel3, TweenInfo.new(0.2), {
                ImageColor3 = Color3.fromRGB(255, 255, 255),
            }):Play()
            v6:Create(Frame12, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
        end)
    end

    v534('Main', v526, 75381660392048)
    v534('Combat', v527, 6116845229)
    v534('AutoFarm', v528, 4335482575)
    v534('Fun', v529, 79306765534693)
    v534('Misc', v530, 13571270219)
    v534('Visuals', v531, 114167292947810)
    v534('Flings', v532, 14488863778)

    local t64 = {}

    local function v536(p61, p62)
        if t64[p61] then
            return
        end

        t64[p61] = true

        local Frame13 = Instance.new('Frame', v61)

        Frame13.Size = UDim2.new(0, 140, 0, 45)
        Frame13.Position = UDim2.new(0.8, 0, 0.4, 0)
        Frame13.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        Instance.new('UICorner', Frame13).CornerRadius = UDim.new(0, 8)

        local UIStroke5 = Instance.new('UIStroke', Frame13)

        UIStroke5.Thickness = 1.5
        UIStroke5.Color = color3

        local TextButton6 = Instance.new('TextButton', Frame13)

        TextButton6.Size = UDim2.new(1, -35, 1, 0)
        TextButton6.Position = UDim2.new(0, 35, 0, 0)
        TextButton6.BackgroundTransparency = 1
        TextButton6.Text = p62
        TextButton6.TextColor3 = v53[p61].Enabled and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(220, 220, 220)
        TextButton6.Font = Enum.Font.GothamMedium
        TextButton6.TextSize = 12
        TextButton6.TextWrapped = true

        local TextButton7 = Instance.new('TextButton', Frame13)

        TextButton7.Size = UDim2.new(0, 35, 1, 0)
        TextButton7.Position = UDim2.new(0, 0, 0, 0)
        TextButton7.BackgroundTransparency = 1
        TextButton7.Text = 'X'
        TextButton7.TextColor3 = Color3.fromRGB(255, 80, 80)
        TextButton7.Font = Enum.Font.GothamBold
        TextButton7.TextSize = 14

        local Frame14 = Instance.new('Frame', Frame13)

        Frame14.Size = UDim2.new(0, 1, 0.6, 0)
        Frame14.Position = UDim2.new(0, 35, 0.2, 0)
        Frame14.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        Frame14.BorderSizePixel = 0

        v67(Frame13, nil, TextButton6)
        TextButton6.MouseButton1Click:Connect(function()
            if t38[p61] then
                t38[p61](not v53[p61].Enabled)
            end
        end)

        local v887 = t38[p61]
        local u888 = v887

        t38[p61] = function(p63)
            u888(p63)

            if TextButton6 and TextButton6.Parent then
                TextButton6.TextColor3 = p63 and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(220, 220, 220)
            end
        end

        TextButton7.MouseButton1Click:Connect(function()
            t64[p61] = false

            Frame13:Destroy()
        end)
    end

    local ScrollingFrame3 = Instance.new('ScrollingFrame', v532)

    ScrollingFrame3.Size = UDim2.new(1, 0, 1, -55)
    ScrollingFrame3.Position = UDim2.new(0, 0, 0, 55)
    ScrollingFrame3.BackgroundTransparency = 1
    ScrollingFrame3.ScrollBarThickness = 2
    ScrollingFrame3.ZIndex = 1

    local UIListLayout3 = Instance.new('UIListLayout', ScrollingFrame3)

    UIListLayout3.Padding = UDim.new(0, 8)
    UIListLayout3.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
    Instance.new('UIPadding', ScrollingFrame3).PaddingBottom = UDim.new(0, 10)

    local TextBox = Instance.new('TextBox', v532)

    TextBox.Size = UDim2.new(0, 390, 0, 40)
    TextBox.Position = UDim2.new(0.5, -195, 0, 10)
    TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    TextBox.BackgroundTransparency = 0.5
    TextBox.PlaceholderText = 'Search player by name...'
    TextBox.Text = ''
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Font = Enum.Font.GothamMedium
    TextBox.TextSize = 13
    TextBox.ZIndex = 1
    Instance.new('UICorner', TextBox).CornerRadius = UDim.new(0, 6)
    Instance.new('UIStroke', TextBox).Color = Color3.fromRGB(50, 50, 65)

    local t65 = {}
    local u541 = false

    local function u542()
        pcall(function()
            local v1139 = TextBox.Text:lower()
            local t66 = {}

            for v1143, v1144 in ipairs(v3:GetPlayers())do
                if v1144 ~= u12 and (v1139 == '' or (v1144.Name:lower():find(v1139, 1, true) or v1144.DisplayName:lower():find(v1139, 1, true))) then
                    t66[v1144.UserId] = v1144
                end
            end
            for v1147, v1148 in pairs(t65)do
                if not t66[v1147] then
                    v1148:Destroy()

                    t65[v1147] = nil
                end
            end
            for v1151, v1152 in ipairs(ScrollingFrame3:GetChildren())do
                if v1152:IsA('Frame') and v1152.Name ~= '' then
                    local num = tonumber(v1152.Name)

                    if num and not t66[num] then
                        v1152:Destroy()
                    elseif num and not t65[num] then
                        t65[num] = v1152
                    end
                end
            end
            for k, v in pairs(t66)do
                local v1156 = k
                local v1157 = v
                local v1158 = v101(v1157)
                local s4 = 'Innocent'
                local color3_13 = Color3.fromRGB(150, 150, 150)
                local n7 = 3

                if v1158 == 'Knife' then
                    s4 = 'Murderer'
                    color3_13 = Color3.fromRGB(255, 60, 60)
                    n7 = 1
                elseif v1158 == 'Weapon' then
                    s4 = 'Sheriff'
                    color3_13 = Color3.fromRGB(60, 160, 255)
                    n7 = 2
                end

                local u1162 = t65[v1156]

                if not u1162 then
                    u1162 = Instance.new('Frame', ScrollingFrame3)
                    u1162.Name = tostring(v1156)
                    u1162.Size = UDim2.new(0, 390, 0, 56)
                    u1162.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
                    u1162.BackgroundTransparency = 0.7
                    u1162.ZIndex = 1
                    Instance.new('UICorner', u1162).CornerRadius = UDim.new(0, 6)
                    Instance.new('UIStroke', u1162).Color = Color3.fromRGB(45, 45, 55)

                    local ImageLabel4 = Instance.new('ImageLabel', u1162)

                    ImageLabel4.Size = UDim2.new(0, 44, 0, 44)
                    ImageLabel4.Position = UDim2.new(0, 8, 0, 6)
                    ImageLabel4.BackgroundTransparency = 1
                    ImageLabel4.ZIndex = 1

                    pcall(function()
                        ImageLabel4.Image = v3:GetUserThumbnailAsync(v1157.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                    end)

                    Instance.new('UICorner', ImageLabel4).CornerRadius = UDim.new(1, 0)

                    local TextLabel6 = Instance.new('TextLabel', u1162)

                    TextLabel6.Name = 'PlayerNameLabel'
                    TextLabel6.Size = UDim2.new(1, -70, 0, 18)
                    TextLabel6.Position = UDim2.new(0, 60, 0, 10)
                    TextLabel6.BackgroundTransparency = 1
                    TextLabel6.Text = v1157.DisplayName .. ' (@' .. v1157.Name .. ')'
                    TextLabel6.TextColor3 = Color3.fromRGB(240, 240, 245)
                    TextLabel6.TextSize = 13
                    TextLabel6.Font = Enum.Font.GothamMedium
                    TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel6.ZIndex = 1

                    local TextLabel7 = Instance.new('TextLabel', u1162)

                    TextLabel7.Name = 'PlayerRoleLabel'
                    TextLabel7.Size = UDim2.new(1, -70, 0, 16)
                    TextLabel7.Position = UDim2.new(0, 60, 0, 30)
                    TextLabel7.BackgroundTransparency = 1
                    TextLabel7.TextSize = 11
                    TextLabel7.Font = Enum.Font.GothamBold
                    TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel7.ZIndex = 1

                    local TextButton8 = Instance.new('TextButton', u1162)

                    TextButton8.Size = UDim2.new(1, 0, 1, 0)
                    TextButton8.BackgroundTransparency = 1
                    TextButton8.Text = ''
                    TextButton8.ZIndex = 1

                    TextButton8.MouseEnter:Connect(function()
                        v6:Create(u1162, TweenInfo.new(0.2), {BackgroundTransparency = 0.4}):Play()
                    end)
                    TextButton8.MouseLeave:Connect(function()
                        v6:Create(u1162, TweenInfo.new(0.2), {BackgroundTransparency = 0.7}):Play()
                    end)
                    TextButton8.MouseButton1Click:Connect(function()
                        v100(v1157)
                    end)

                    t65[v1156] = u1162
                end

                local PlayerRoleLabel = u1162:FindFirstChild('PlayerRoleLabel')

                if PlayerRoleLabel then
                    PlayerRoleLabel.Text = s4
                    PlayerRoleLabel.TextColor3 = color3_13
                end

                u1162.LayoutOrder = n7 * 1000 + (v1157.Name:lower():byte(1) or 0)
            end
        end)

        if u541 then
            task.defer(u542)
        end
    end

    TextBox:GetPropertyChangedSignal('Text'):Connect(u542)
    v3.PlayerAdded:Connect(function()
        task.defer(u542)
    end)
    v3.PlayerRemoving:Connect(u542)
    u12.CharacterAdded:Connect(function()
        task.defer(u542)
    end)
    task.defer(u542)
    task.spawn(function()
        while true do
            task.wait(0.25)
            u542()
        end
    end)
    task.spawn(function()
        task.wait(0.5)

        for _, player in ipairs(v3:GetPlayers())do
            local Backpack = player:FindFirstChild('Backpack')

            if Backpack then
                Backpack.ChildAdded:Connect(function()
                    task.defer(u542)
                end)
                Backpack.ChildRemoved:Connect(function()
                    task.defer(u542)
                end)
            end
            if player.Character then
                player.Character.ChildAdded:Connect(function()
                    task.defer(u542)
                end)
                player.Character.ChildRemoved:Connect(function()
                    task.defer(u542)
                end)
            end
        end

        v3.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(character)
                character.ChildAdded:Connect(function()
                    task.defer(u542)
                end)
                character.ChildRemoved:Connect(function()
                    task.defer(u542)
                end)
            end)
            task.spawn(function()
                local Backpack = player:WaitForChild('Backpack', 8)

                if Backpack then
                    Backpack.ChildAdded:Connect(function()
                        task.defer(u542)
                    end)
                    Backpack.ChildRemoved:Connect(function()
                        task.defer(u542)
                    end)
                end
            end)
        end)
    end)

    local t67 = {
        AutoLoot = 'Auto Loot',
        TouchFling = 'Touch Fling',
        AutoShootMurder = 'AutoShoot Murder',
        WallShotMurder = 'WallShot Murder',
        MurderKillAll = 'Murder KillAll',
        KillOnlySheriff = 'Kill Only Sheriff',
        TriggerBot = 'TriggerBot',
        SpinBot = 'SpinBot',
        BHop = 'BHop',
        InfJump = 'Inf Jump',
        Fly = 'Fly',
        AntiFling = 'Anti-Fling',
        ElEtoYa = 'El Eto Ya',
        LightYagami = 'Light Yagami',
        RonaldoSkin = 'Ronaldo Skin',
        RonaldoEmote = 'Ronaldo Emote',
        JerkOff = 'Jerk Off',
        AutoFarmCoin = 'Auto Farm Coin',
    }

    local function v544(p64, p65)
        local Frame15 = Instance.new('Frame')

        Frame15.Name = 'KeyCap'
        Frame15.Size = UDim2.new(0, 28, 0, 22)
        Frame15.BackgroundColor3 = Color3.fromRGB(35, 40, 52)
        Frame15.BackgroundTransparency = 0.12
        Frame15.Parent = p64
        Instance.new('UICorner', Frame15).CornerRadius = UDim.new(0, 6)

        local UIStroke6 = Instance.new('UIStroke', Frame15)

        UIStroke6.Color = color3_4
        UIStroke6.Thickness = 1
        UIStroke6.Transparency = 0.15

        local TextLabel8 = Instance.new('TextLabel', Frame15)

        TextLabel8.Size = UDim2.new(1, 0, 1, 0)
        TextLabel8.BackgroundTransparency = 1

        local s5

        if not p65 then
            s5 = '?'
        else
            local p65Name = p65.Name
            local v903 = string.gsub(p65Name, 'Left', 'L')

            s5 = string.gsub(v903, 'Right', 'R')

            if #s5 > 4 then
                s5 = string.sub(s5, 1, 4)
            end
        end

        TextLabel8.Text = s5
        TextLabel8.TextColor3 = Color3.fromRGB(240, 248, 255)
        TextLabel8.Font = Enum.Font.GothamBold
        TextLabel8.TextSize = 9

        return Frame15
    end

    local color3_14 = Color3.fromRGB(95, 220, 140)
    local color3_15 = Color3.fromRGB(255, 110, 110)
    local Frame16 = Instance.new('Frame')

    Frame16.Size = UDim2.new(0, 226, 0, 0)
    Frame16.Position = UDim2.new(0.82, -218, 0.34, 0)
    Frame16.BackgroundTransparency = 1

    pcall(function()
        Frame16.AutomaticSize = Enum.AutomaticSize.Y
    end)

    Frame16.Visible = false
    Frame16.Parent = v60

    pcall(function()
        v67(Frame16)
    end)

    local UIListLayout4 = Instance.new('UIListLayout', Frame16)

    UIListLayout4.Padding = UDim.new(0, 6)
    UIListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder

    local v549, v550, v551 = v74(Frame16, 210, 34, 8)

    t63[2] = v550
    t63[3] = v551
    v549.LayoutOrder = 0

    local TextLabel9 = Instance.new('TextLabel', v549)

    TextLabel9.Size = UDim2.new(1, -56, 1, 0)
    TextLabel9.Position = UDim2.new(0, 12, 0, 0)
    TextLabel9.BackgroundTransparency = 1
    TextLabel9.Text = 'Keybinds'
    TextLabel9.TextColor3 = Color3.fromRGB(252, 254, 255)
    TextLabel9.Font = Enum.Font.GothamBold
    TextLabel9.TextSize = 12
    TextLabel9.TextXAlignment = Enum.TextXAlignment.Left

    local TextLabel10 = Instance.new('TextLabel', v549)

    TextLabel10.Size = UDim2.new(0, 24, 1, 0)
    TextLabel10.Position = UDim2.new(1, -30, 0, 0)
    TextLabel10.BackgroundTransparency = 1
    TextLabel10.Text = '0'
    TextLabel10.TextColor3 = color3_5
    TextLabel10.Font = Enum.Font.GothamBold
    TextLabel10.TextSize = 11

    local Frame17 = Instance.new('Frame', Frame16)

    Frame17.Size = UDim2.new(0, 226, 0, 0)
    Frame17.BackgroundTransparency = 1
    Frame17.AutomaticSize = Enum.AutomaticSize.Y
    Frame17.LayoutOrder = 1

    local UIListLayout5 = Instance.new('UIListLayout', Frame17)

    UIListLayout5.Padding = UDim.new(0, 5)
    UIListLayout5.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder

    local function v556()
        for _, child in pairs(Frame17:GetChildren())do
            if child:IsA('Frame') then
                child:Destroy()
            end
        end

        local t68 = {}

        for k, v in pairs(v53)do
            local v928 = k

            if type(v) == 'table' and v.Bind then
                local insert = table.insert
                local v930 = t67[v928] or v928

                insert(t68, {
                    Key = v928,
                    Data = v,
                    Name = v930,
                })
            end
        end

        table.sort(t68, function(p66, p67)
            return p66.Name < p67.Name
        end)

        TextLabel10.Text = tostring(#t68)

        if #t68 == 0 then
            local v931, _ = v74(Frame17, 210, 30, 6)

            v931.LayoutOrder = 1

            local TextLabel11 = Instance.new('TextLabel', v931)

            TextLabel11.Size = UDim2.new(1, 0, 1, 0)
            TextLabel11.BackgroundTransparency = 1
            TextLabel11.Text = 'No binds'
            TextLabel11.TextColor3 = color3_7
            TextLabel11.Font = Enum.Font.Gotham
            TextLabel11.TextSize = 10

            return
        end

        for i, v in ipairs(t68)do
            local Data = v.Data
            local v937 = not not Data.Enabled
            local v938, _, v940 = v74(Frame17, 210, 32, 6)

            v938.LayoutOrder = i

            if v940 then
                v940.Color = v937 and Color3.fromRGB(70, 170, 120) or color3_4
            end

            local Frame18 = Instance.new('Frame', v938)

            Frame18.Size = UDim2.new(0, 34, 1, 0)
            Frame18.Position = UDim2.new(0, 8, 0, 0)
            Frame18.BackgroundTransparency = 1
            v544(Frame18, Data.Bind).Position = UDim2.new(0, 0, 0.5, -12)

            local TextLabel12 = Instance.new('TextLabel', v938)

            TextLabel12.Size = UDim2.new(1, -92, 1, 0)
            TextLabel12.Position = UDim2.new(0, 44, 0, 0)
            TextLabel12.BackgroundTransparency = 1
            TextLabel12.Text = v.Name
            TextLabel12.TextColor3 = v937 and Color3.fromRGB(252, 254, 255) or Color3.fromRGB(232, 240, 252)
            TextLabel12.Font = Enum.Font.GothamMedium
            TextLabel12.TextSize = 10
            TextLabel12.TextXAlignment = Enum.TextXAlignment.Left

            local TextLabel13 = Instance.new('TextLabel', v938)

            TextLabel13.Size = UDim2.new(0, 34, 1, 0)
            TextLabel13.Position = UDim2.new(1, -40, 0, 0)
            TextLabel13.BackgroundTransparency = 1
            TextLabel13.Text = not v937 and 'OFF' or 'ON'
            TextLabel13.TextColor3 = v937 and color3_14 or color3_15
            TextLabel13.Font = Enum.Font.GothamBold
            TextLabel13.TextSize = 10
        end
    end

    v5.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            gameProcessed = false
        end
        if gameProcessed then
            return
        end

        for k, v in pairs(v53)do
            local v948 = k

            if type(v) == 'table' and (v.Bind and input.KeyCode == v.Bind) and t38[v948] then
                t38[v948](not v.Enabled)
            end
        end
    end)

    local function v557(p68, p69, p70)
        local _Instance2 = Instance
        local v953 = p70 or 390
        local v954 = _Instance2.new('Frame', p68)

        v954.Size = UDim2.new(0, v953, 0, 32)
        v954.AutomaticSize = Enum.AutomaticSize.Y
        v954.BackgroundColor3 = color3_2
        v954.BackgroundTransparency = 0.22
        v954.ClipsDescendants = true
        v954.ZIndex = 1
        Instance.new('UICorner', v954).CornerRadius = UDim.new(0, 6)
        Instance.new('UIStroke', v954).Color = Color3.fromRGB(45, 45, 55)

        local TextButton9 = Instance.new('TextButton', v954)

        TextButton9.Size = UDim2.new(1, 0, 0, 32)
        TextButton9.BackgroundTransparency = 1
        TextButton9.Text = '   ' .. p69
        TextButton9.TextColor3 = color3
        TextButton9.Font = Enum.Font.GothamBold
        TextButton9.TextSize = 13
        TextButton9.TextXAlignment = Enum.TextXAlignment.Left
        TextButton9.ZIndex = 1

        local TextLabel14 = Instance.new('TextLabel', TextButton9)

        TextLabel14.Size = UDim2.new(0, 30, 1, 0)
        TextLabel14.Position = UDim2.new(1, -30, 0, 0)
        TextLabel14.BackgroundTransparency = 1
        TextLabel14.Text = '\u{25bc}'
        TextLabel14.TextColor3 = Color3.fromRGB(150, 150, 150)
        TextLabel14.Font = Enum.Font.GothamBold
        TextLabel14.TextSize = 12
        TextLabel14.ZIndex = 1

        local Frame19 = Instance.new('Frame', v954)

        Frame19.Size = UDim2.new(1, 0, 0, 0)
        Frame19.Position = UDim2.new(0, 0, 0, 32)
        Frame19.AutomaticSize = Enum.AutomaticSize.Y
        Frame19.BackgroundTransparency = 1
        Frame19.Visible = true
        Frame19.ZIndex = 1

        local UIListLayout6 = Instance.new('UIListLayout', Frame19)

        UIListLayout6.Padding = UDim.new(0, 6)
        UIListLayout6.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder

        local UIPadding2 = Instance.new('UIPadding', Frame19)

        UIPadding2.PaddingTop = UDim.new(0, 6)
        UIPadding2.PaddingBottom = UDim.new(0, 8)

        local u960 = true

        TextButton9.MouseButton1Click:Connect(function()
            u960 = not u960
            Frame19.Visible = u960
            TextLabel14.Text = not u960 and '\u{25ba}' or '\u{25bc}'
        end)

        return Frame19
    end
    local function v558(p71, p72, p73, p74, p75, p76)
        local v967 = p76 or 390
        local Frame20 = Instance.new('Frame', p71)

        Frame20.Size = UDim2.new(0, v967, 0, 52)
        Frame20.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        Frame20.BackgroundTransparency = 0.8
        Frame20.ZIndex = 1
        Instance.new('UICorner', Frame20).CornerRadius = UDim.new(0, 6)
        Instance.new('UIStroke', Frame20).Color = Color3.fromRGB(50, 50, 60)

        local TextLabel15 = Instance.new('TextLabel', Frame20)

        TextLabel15.Size = UDim2.new(1, not p74 and -50 or -85, 1, 0)
        TextLabel15.Position = UDim2.new(0, 12, 0, 0)
        TextLabel15.BackgroundTransparency = 1
        TextLabel15.Text = p73
        TextLabel15.TextColor3 = Color3.fromRGB(240, 240, 245)
        TextLabel15.TextSize = 13
        TextLabel15.Font = Enum.Font.GothamMedium
        TextLabel15.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel15.TextWrapped = true
        TextLabel15.ZIndex = 1

        local TextButton10 = Instance.new('TextButton', Frame20)

        TextButton10.Size = UDim2.new(0, 36, 0, 20)
        TextButton10.Position = UDim2.new(1, -45, 0.5, -10)
        TextButton10.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        TextButton10.Text = ''
        TextButton10.ZIndex = 1
        Instance.new('UICorner', TextButton10).CornerRadius = UDim.new(1, 0)

        local Frame21 = Instance.new('Frame', TextButton10)

        Frame21.Size = UDim2.new(0, 16, 0, 16)
        Frame21.Position = UDim2.new(0, 2, 0.5, -8)
        Frame21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame21.ZIndex = 1
        Instance.new('UICorner', Frame21).CornerRadius = UDim.new(1, 0)

        local function v972(p77)
            v53[p72].Enabled = p77

            local v1172 = p77 and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            local v1173 = p77 and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(45, 45, 55)

            v6:Create(Frame21, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Position = v1172}):Play()
            v6:Create(TextButton10, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = v1173}):Play()
            v556()

            if p75 then
                p75(p77)
            end
        end

        t38[p72] = v972
        t39[p72] = function()
            v972(false)
        end

        TextButton10.MouseButton1Click:Connect(function()
            v972(not v53[p72].Enabled)
        end)

        if p74 then
            local TextButton11 = Instance.new('TextButton', Frame20)

            TextButton11.Size = UDim2.new(0, 35, 0, 24)
            TextButton11.Position = UDim2.new(1, -85, 0.5, -12)
            TextButton11.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            TextButton11.BackgroundTransparency = 0.3
            TextButton11.Text = 'Bind'
            TextButton11.TextColor3 = Color3.fromRGB(190, 190, 200)
            TextButton11.Font = Enum.Font.GothamMedium
            TextButton11.TextSize = 11
            TextButton11.ZIndex = 1
            Instance.new('UICorner', TextButton11).CornerRadius = UDim.new(0, 6)

            table.insert(t41, {
                Button = TextButton11,
                ConfigName = p72,
            })

            local u974 = false

            TextButton11.MouseButton1Click:Connect(function()
                if v53.DeviceMode == 'Mobile' then
                    v536(p72, p73)

                    return
                end

                u974 = true
                TextButton11.Text = '...'
                TextButton11.TextColor3 = Color3.fromRGB(255, 210, 50)

                v6:Create(TextButton11, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(50, 50, 65),
                }):Play()
            end)
            v5.InputBegan:Connect(function(input)
                local v1175 = u974

                if v1175 then
                    v1175 = input.UserInputType == Enum.UserInputType.Keyboard
                end
                if v1175 then
                    if input.KeyCode == Enum.KeyCode.Backspace or input.KeyCode == Enum.KeyCode.Delete then
                        v53[p72].Bind = nil
                        TextButton11.Text = 'Bind'
                        TextButton11.TextColor3 = Color3.fromRGB(190, 190, 200)
                    else
                        v53[p72].Bind = input.KeyCode
                        TextButton11.Text = input.KeyCode.Name
                        TextButton11.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end

                    v6:Create(TextButton11, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(40, 40, 50),
                    }):Play()
                    v556()
                end
            end)
        end
    end
    local function v559(p78, p79, p80, p81, p82, p83, p84)
        local v1004 = p84 or 390
        local Frame22 = Instance.new('Frame', p78)

        Frame22.Size = UDim2.new(0, v1004, 0, 60)
        Frame22.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        Frame22.BackgroundTransparency = 0.8
        Frame22.ZIndex = 1
        Instance.new('UICorner', Frame22).CornerRadius = UDim.new(0, 6)
        Instance.new('UIStroke', Frame22).Color = Color3.fromRGB(50, 50, 60)

        local TextLabel16 = Instance.new('TextLabel', Frame22)

        TextLabel16.Size = UDim2.new(1, -50, 0, 26)
        TextLabel16.Position = UDim2.new(0, 12, 0, 8)
        TextLabel16.BackgroundTransparency = 1
        TextLabel16.Text = p79
        TextLabel16.TextColor3 = Color3.fromRGB(220, 220, 230)
        TextLabel16.TextSize = 13
        TextLabel16.Font = Enum.Font.GothamMedium
        TextLabel16.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel16.TextWrapped = true
        TextLabel16.ZIndex = 1

        local TextLabel17 = Instance.new('TextLabel', Frame22)

        TextLabel17.Size = UDim2.new(0, 30, 0, 26)
        TextLabel17.Position = UDim2.new(1, -40, 0, 8)
        TextLabel17.BackgroundTransparency = 1
        TextLabel17.Text = tostring(p82)
        TextLabel17.TextColor3 = Color3.fromRGB(46, 204, 113)
        TextLabel17.TextSize = 13
        TextLabel17.Font = Enum.Font.GothamBold
        TextLabel17.TextXAlignment = Enum.TextXAlignment.Right
        TextLabel17.ZIndex = 1

        local TextButton12 = Instance.new('TextButton', Frame22)

        TextButton12.Size = UDim2.new(1, -24, 0, 6)
        TextButton12.Position = UDim2.new(0, 12, 0, 42)
        TextButton12.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        TextButton12.Text = ''
        TextButton12.ZIndex = 1
        Instance.new('UICorner', TextButton12).CornerRadius = UDim.new(1, 0)

        local Frame23 = Instance.new('Frame', TextButton12)

        Frame23.Size = UDim2.new((p82 - p80) / (p81 - p80), 0, 1, 0)
        Frame23.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        Frame23.ZIndex = 1
        Instance.new('UICorner', Frame23).CornerRadius = UDim.new(1, 0)

        local u1010 = false

        local function v1011()
            local v1179 = math.clamp((v5:GetMouseLocation().X - TextButton12.AbsolutePosition.X) / TextButton12.AbsoluteSize.X, 0, 1)

            v6:Create(Frame23, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(v1179, 0, 1, 0),
            }):Play()

            local v1180 = math.round(p80 + (p81 - p80) * v1179)

            TextLabel17.Text = tostring(v1180)

            p83(v1180)
        end

        TextButton12.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                u1010 = true

                v1011()
            end
        end)
        v5.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                u1010 = false
            end
        end)
        v5.InputChanged:Connect(function(input)
            if u1010 and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                v1011()
            end
        end)
    end

    local Frame24 = Instance.new('Frame', v526)

    Frame24.Size = UDim2.new(0, 390, 0, 0)
    Frame24.AutomaticSize = Enum.AutomaticSize.Y
    Frame24.BackgroundTransparency = 1
    Frame24.LayoutOrder = 1
    Frame24.ZIndex = 1

    local UIListLayout7 = Instance.new('UIListLayout', Frame24)

    UIListLayout7.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout7.Padding = UDim.new(0, 10)
    UIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder

    local Frame25 = Instance.new('Frame', Frame24)

    Frame25.Size = UDim2.new(0, 190, 0, 0)
    Frame25.AutomaticSize = Enum.AutomaticSize.Y
    Frame25.BackgroundTransparency = 1
    Frame25.ZIndex = 1
    Instance.new('UIListLayout', Frame25).Padding = UDim.new(0, 10)

    local Frame26 = Instance.new('Frame', Frame24)

    Frame26.Size = UDim2.new(0, 190, 0, 0)
    Frame26.AutomaticSize = Enum.AutomaticSize.Y
    Frame26.BackgroundTransparency = 1
    Frame26.ZIndex = 1
    Instance.new('UIListLayout', Frame26).Padding = UDim.new(0, 10)

    local v564 = v557(Frame25, 'ESP', 190);

    (function(p85, p86, p87, p88, p89, p90, p91, p92)
        local v983 = p92 or 390
        local Frame27 = Instance.new('Frame', p85)

        Frame27.Size = UDim2.new(0, v983, 0, 75)
        Frame27.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        Frame27.BackgroundTransparency = 0.8
        Frame27.ClipsDescendants = true
        Frame27.ZIndex = 1
        Instance.new('UICorner', Frame27).CornerRadius = UDim.new(0, 6)
        Instance.new('UIStroke', Frame27).Color = Color3.fromRGB(50, 50, 60)

        local TextLabel18 = Instance.new('TextLabel', Frame27)

        TextLabel18.Size = UDim2.new(1, -50, 0, 35)
        TextLabel18.Position = UDim2.new(0, 12, 0, 0)
        TextLabel18.BackgroundTransparency = 1
        TextLabel18.Text = p87
        TextLabel18.TextColor3 = Color3.fromRGB(240, 240, 245)
        TextLabel18.TextSize = 13
        TextLabel18.Font = Enum.Font.GothamMedium
        TextLabel18.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel18.TextWrapped = true
        TextLabel18.ZIndex = 1

        local TextButton13 = Instance.new('TextButton', Frame27)

        TextButton13.Size = UDim2.new(0, 36, 0, 20)
        TextButton13.Position = UDim2.new(1, -45, 0, 8)
        TextButton13.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        TextButton13.Text = ''
        TextButton13.ZIndex = 1
        Instance.new('UICorner', TextButton13).CornerRadius = UDim.new(1, 0)

        local Frame28 = Instance.new('Frame', TextButton13)

        Frame28.Size = UDim2.new(0, 16, 0, 16)
        Frame28.Position = UDim2.new(0, 2, 0.5, -8)
        Frame28.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame28.ZIndex = 1
        Instance.new('UICorner', Frame28).CornerRadius = UDim.new(1, 0)

        local function v988(p93)
            v53[p86].Enabled = p93

            local v1177 = p93 and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            local v1178 = p93 and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(45, 45, 55)

            v6:Create(Frame28, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Position = v1177}):Play()
            v6:Create(TextButton13, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundColor3 = v1178}):Play()
            v556()

            if p91 then
                p91(p93)
            end
        end

        t38[p86] = v988
        t39[p86] = function()
            v988(false)
        end

        TextButton13.MouseButton1Click:Connect(function()
            v988(not v53[p86].Enabled)
        end)

        local TextButton14 = Instance.new('TextButton', Frame27)

        TextButton14.Size = UDim2.new(1, -24, 0, 24)
        TextButton14.Position = UDim2.new(0, 12, 0, 40)
        TextButton14.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        TextButton14.BackgroundTransparency = 0.3
        TextButton14.Text = p89 .. ' \u{25bc}'
        TextButton14.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton14.Font = Enum.Font.GothamBold
        TextButton14.TextSize = 11
        TextButton14.ZIndex = 1
        Instance.new('UICorner', TextButton14).CornerRadius = UDim.new(0, 6)

        local Frame29 = Instance.new('Frame', Frame27)

        Frame29.Size = UDim2.new(1, 0, 0, #p88 * 32)
        Frame29.Position = UDim2.new(0, 0, 0, 75)
        Frame29.BackgroundTransparency = 1
        Frame29.ZIndex = 1

        local UIListLayout8 = Instance.new('UIListLayout', Frame29)

        UIListLayout8.Padding = UDim.new(0, 4)
        UIListLayout8.HorizontalAlignment = Enum.HorizontalAlignment.Center

        local u992 = false

        TextButton14.MouseButton1Click:Connect(function()
            u992 = not u992
            TextButton14.Text = v53[p90] .. (not u992 and ' \u{25bc}' or ' \u{25b2}')

            v6:Create(Frame27, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, v983, 0, u992 and #p88 * 32 + 75 + 8 or 75),
            }):Play()
        end)

        for _, v in ipairs(p88)do
            local v995 = v
            local TextButton15 = Instance.new('TextButton', Frame29)

            TextButton15.Size = UDim2.new(1, -24, 0, 28)
            TextButton15.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            TextButton15.BackgroundTransparency = 0.3
            TextButton15.Text = v995
            TextButton15.TextColor3 = Color3.fromRGB(220, 220, 230)
            TextButton15.Font = Enum.Font.GothamMedium
            TextButton15.TextSize = 12
            TextButton15.ZIndex = 1
            Instance.new('UICorner', TextButton15).CornerRadius = UDim.new(0, 6)

            TextButton15.MouseButton1Click:Connect(function()
                v53[p90] = v995
                TextButton14.Text = v995 .. ' \u{25bc}'

                v6:Create(Frame27, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, v983, 0, 75),
                }):Play()

                if p91 then
                    p91(v995)
                end
            end)
        end
    end)(v564, 'RoleESP', 'Role ESP', {
        'Glow',
        'Minimalistic',
        'Ghost',
        'Pulse',
    }, 'Glow', 'RoleESPMode', nil, 180)
    v558(v564, 'NameESP', 'Name ESP', false, nil, 180)
    v558(v564, 'GunESP', 'Drop Gun ESP', false, nil, 180)
    v558(v564, 'PlayerMenu', 'Player Menu (\u{1f446})', false, nil, 180)

    local v565 = v557(Frame26, 'Movement', 190)

    v558(v565, 'InfJump', 'Inf Jump', true, nil, 180)
    v558(v565, 'Fly', 'Fly', true, nil, 180)
    v558(v565, 'Noclip', 'Noclip', false, nil, 180)

    local Frame30 = Instance.new('Frame', v527)

    Frame30.Size = UDim2.new(0, 390, 0, 0)
    Frame30.AutomaticSize = Enum.AutomaticSize.Y
    Frame30.BackgroundTransparency = 1
    Frame30.LayoutOrder = 1
    Frame30.ZIndex = 1

    local UIListLayout9 = Instance.new('UIListLayout', Frame30)

    UIListLayout9.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout9.Padding = UDim.new(0, 10)
    UIListLayout9.SortOrder = Enum.SortOrder.LayoutOrder

    local Frame31 = Instance.new('Frame', Frame30)

    Frame31.Size = UDim2.new(0, 190, 0, 0)
    Frame31.AutomaticSize = Enum.AutomaticSize.Y
    Frame31.BackgroundTransparency = 1
    Frame31.ZIndex = 1
    Instance.new('UIListLayout', Frame31).Padding = UDim.new(0, 10)

    local Frame32 = Instance.new('Frame', Frame30)

    Frame32.Size = UDim2.new(0, 190, 0, 0)
    Frame32.AutomaticSize = Enum.AutomaticSize.Y
    Frame32.BackgroundTransparency = 1
    Frame32.ZIndex = 1
    Instance.new('UIListLayout', Frame32).Padding = UDim.new(0, 10)

    local v570 = v557(Frame31, 'Sheriff', 190)

    v558(v570, 'AutoLoot', 'AutoLootGun', true, nil, 180)
    v558(v570, 'TriggerBot', 'TriggerBot', true, nil, 180)
    v559(v570, 'Trigger Delay (ms)', 0, 800, 80, function(p94)
        v53.TriggerBot.Delay = p94
    end, 180)
    v558(v570, 'AutoShootMurder', 'AutoShoot Murder', true, function(p95)
        if p95 then
            v127()

            u112 = true

            task.spawn(function()
                while u112 and (v53.AutoShootMurder.Enabled and true) do
                    if v116() == v114 then
                        v123()

                        return
                    end

                    task.wait(0.5)
                end
            end)

            return
        end

        v127()
    end, 180)
    v558(v570, 'WallShotMurder', 'WallShot Murder', true, function(p96)
        if p96 then
            v126()

            return
        end

        v125()
    end, 180)

    local v571 = v557(Frame32, 'Murderer', 190)

    v558(v571, 'MurderKillAll', 'Kill All', false, nil, 180)
    v558(v571, 'KillOnlySheriff', 'Kill Sheriff Only', false, nil, 180)
    v558(v557(v528, 'AutoFarmCoin', 390), 'AutoFarmCoin', 'Start Farm', false, nil, 380)

    local v572 = v557(v529, 'Fun', 390)

    v558(v572, 'SpinBot', 'SpinBot', true, nil, 380)
    v559(v572, 'Spin Speed', 1, 100, 10, function(p97)
        v53.SpinBot.Speed = p97
    end, 380)
    v558(v572, 'BHop', 'BunnyHop', true, nil, 380)
    v559(v572, 'Bhop Power', 1, 10, 1, function(p98)
        v53.BHop.Power = p98
    end, 380)

    local connection

    v558(v572, 'JerkOff', 'Jerk Off Tool', false, function(p99)
        if p99 then
            local function v1046()
                local LocalPlayer = v3.LocalPlayer
                local Character = LocalPlayer.Character
                local Backpack = LocalPlayer:FindFirstChild('Backpack')

                if not Character or not Backpack then
                    return
                end
                if Backpack:FindFirstChild('Jerk Off') or Character:FindFirstChild('Jerk Off') then
                    return
                end

                local Tool = Instance.new('Tool')

                Tool.Name = 'Jerk Off'
                Tool.RequiresHandle = false
                Tool.Parent = Backpack

                local u1205 = false
                local u1206

                local function v1207()
                    u1205 = false

                    if u1206 then
                        u1206:Stop()

                        u1206 = nil
                    end
                end

                Tool.Equipped:Connect(function()
                    u1205 = true

                    task.spawn(function()
                        local Humanoid = Character:FindFirstChildWhichIsA('Humanoid')

                        while u1205 and task.wait() and Humanoid do
                            local v1212 = Humanoid.RigType == Enum.HumanoidRigType.R15

                            if not u1206 then
                                local Animation = Instance.new('Animation')

                                Animation.AnimationId = v1212 and 'rbxassetid://698251653' or 'rbxassetid://72042024'
                                u1206 = Humanoid:LoadAnimation(Animation)
                            end

                            u1206:Play()
                            u1206:AdjustSpeed(not v1212 and 0.65 or 0.7)

                            u1206.TimePosition = 0.6

                            task.wait(0.1)

                            while true do
                                local v1214 = u1206

                                if v1214 then
                                    v1214 = u1206.TimePosition < (v1212 and 0.7 or 0.65) and u1205
                                end
                                if not v1214 then
                                    break
                                end

                                task.wait(0.1)
                            end

                            if u1206 then
                                u1206:Stop()

                                u1206 = nil
                            end
                        end
                    end)
                end)
                Tool.Unequipped:Connect(v1207)

                local Humanoid = Character:FindFirstChildWhichIsA('Humanoid')

                if Humanoid then
                    Humanoid.Died:Connect(v1207)
                end
            end

            v1046()

            connection = u12.CharacterAdded:Connect(function()
                task.wait(1)

                if v53.JerkOff.Enabled then
                    v1046()
                end
            end)

            return
        end
        if connection then
            connection:Disconnect()
        end

        local Backpack = u12:FindFirstChild('Backpack')

        if Backpack and Backpack:FindFirstChild('Jerk Off') then
            Backpack['Jerk Off']:Destroy()
        end

        local Character = u12.Character

        if Character and Character:FindFirstChild('Jerk Off') then
            Character['Jerk Off']:Destroy()
        end
    end, 380)

    local v574 = v557(v530, 'Miscellaneous', 390)

    v558(v574, 'AntiFling', 'Anti-Fling', false, nil, 380)
    v558(v574, 'TouchFling', 'Touch Fling', true, nil, 380)

    local Frame33 = Instance.new('Frame', v531)

    Frame33.Size = UDim2.new(0, 390, 0, 0)
    Frame33.AutomaticSize = Enum.AutomaticSize.Y
    Frame33.BackgroundTransparency = 1
    Frame33.LayoutOrder = 1
    Frame33.ZIndex = 1

    local UIListLayout10 = Instance.new('UIListLayout', Frame33)

    UIListLayout10.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout10.Padding = UDim.new(0, 10)
    UIListLayout10.SortOrder = Enum.SortOrder.LayoutOrder

    local Frame34 = Instance.new('Frame', Frame33)

    Frame34.Size = UDim2.new(0, 190, 0, 0)
    Frame34.AutomaticSize = Enum.AutomaticSize.Y
    Frame34.BackgroundTransparency = 1
    Frame34.ZIndex = 1
    Instance.new('UIListLayout', Frame34).Padding = UDim.new(0, 10)

    local Frame35 = Instance.new('Frame', Frame33)

    Frame35.Size = UDim2.new(0, 190, 0, 0)
    Frame35.AutomaticSize = Enum.AutomaticSize.Y
    Frame35.BackgroundTransparency = 1
    Frame35.ZIndex = 1
    Instance.new('UIListLayout', Frame35).Padding = UDim.new(0, 10)

    local v579 = v557(Frame34, 'Main Visuals', 190)

    v558(v579, 'KeyBindList', 'KeyBind List UI', false, function(p100)
        Frame16.Visible = p100
    end, 180)
    v558(v579, 'FpsBanner', 'FPS Banner', false, nil, 180)
    v558(v579, 'PingBanner', 'Ping Banner', false, nil, 180)

    local v580 = v557(Frame34, 'ShootVisual', 190)

    v558(v580, 'BulletTracker', 'Bullet Tracker', false, nil, 180);
    (function(p101, p102, p103, p104, p105, p106, p107)
        local v1019 = p107 or 390
        local Frame36 = Instance.new('Frame', p101)

        Frame36.Size = UDim2.new(0, v1019, 0, 78)
        Frame36.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        Frame36.BackgroundTransparency = 0.8
        Frame36.ZIndex = 1
        Instance.new('UICorner', Frame36).CornerRadius = UDim.new(0, 6)
        Instance.new('UIStroke', Frame36).Color = Color3.fromRGB(50, 50, 60)

        local TextLabel19 = Instance.new('TextLabel', Frame36)

        TextLabel19.Size = UDim2.new(1, -70, 0, 24)
        TextLabel19.Position = UDim2.new(0, 12, 0, 6)
        TextLabel19.BackgroundTransparency = 1
        TextLabel19.Text = p102
        TextLabel19.TextColor3 = Color3.fromRGB(220, 220, 230)
        TextLabel19.TextSize = 13
        TextLabel19.Font = Enum.Font.GothamMedium
        TextLabel19.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel19.ZIndex = 1

        local Frame37 = Instance.new('Frame', Frame36)

        Frame37.Size = UDim2.new(0, 46, 0, 22)
        Frame37.Position = UDim2.new(1, -58, 0, 7)
        Frame37.BackgroundColor3 = Color3.fromRGB(18, 19, 26)
        Frame37.BackgroundTransparency = 0.2
        Frame37.ZIndex = 1
        Instance.new('UICorner', Frame37).CornerRadius = UDim.new(1, 0)

        local UIStroke7 = Instance.new('UIStroke', Frame37)

        UIStroke7.Color = Color3.fromRGB(p103, p104, p105)
        UIStroke7.Thickness = 1.2
        UIStroke7.Transparency = 0.25

        local Frame38 = Instance.new('Frame', Frame37)

        Frame38.Size = UDim2.new(1, -8, 1, -8)
        Frame38.Position = UDim2.new(0, 4, 0, 4)
        Frame38.BackgroundColor3 = Color3.fromRGB(p103, p104, p105)
        Frame38.ZIndex = 1
        Instance.new('UICorner', Frame38).CornerRadius = UDim.new(1, 0)

        local UIGradient = Instance.new('UIGradient', Frame38)

        UIGradient.Rotation = 90
        UIGradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.05),
            NumberSequenceKeypoint.new(1, 0.35),
        })

        local Frame39 = Instance.new('Frame', Frame36)

        Frame39.Size = UDim2.new(1, -24, 0, 32)
        Frame39.Position = UDim2.new(0, 12, 0, 38)
        Frame39.BackgroundColor3 = Color3.fromRGB(18, 19, 26)
        Frame39.BackgroundTransparency = 0.35
        Frame39.ZIndex = 1
        Instance.new('UICorner', Frame39).CornerRadius = UDim.new(0, 8)

        local UIStroke8 = Instance.new('UIStroke', Frame39)

        UIStroke8.Color = Color3.fromRGB(45, 48, 62)
        UIStroke8.Transparency = 0.3

        local UIListLayout11 = Instance.new('UIListLayout', Frame39)

        UIListLayout11.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout11.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout11.VerticalAlignment = Enum.VerticalAlignment.Center
        UIListLayout11.Padding = UDim.new(0, 5)

        local t69 = {
            Color3.fromRGB(255, 200, 50),
            Color3.fromRGB(255, 80, 80),
            Color3.fromRGB(80, 200, 255),
            Color3.fromRGB(180, 80, 255),
            Color3.fromRGB(80, 255, 150),
            Color3.fromRGB(255, 255, 255),
        }
        local t70 = {}
        local color3_16 = Color3.fromRGB(p103, p104, p105)

        local function v1032(p108, p109)
            for i, v in ipairs(t70)do
                local v1188 = i == p108
                local v1189 = v6
                local Stroke = v.Stroke
                local tweenInfo = TweenInfo.new(0.15)
                local v1192 = v1188 and Color3.fromRGB(235, 240, 255) or Color3.fromRGB(40, 44, 58)
                local v1193 = not v1188 and 1 or 2
                local Create = v1189.Create
                local v1195 = not v1188 and 0.35 or 0

                Create(v1189, Stroke, tweenInfo, {
                    Color = v1192,
                    Thickness = v1193,
                    Transparency = v1195,
                }):Play()

                local v1196 = v6
                local Fill = v.Fill
                local tweenInfo2 = TweenInfo.new(0.15)
                local v1199 = v1188 and UDim2.new(1, -4, 1, -4) or UDim2.new(1, -8, 1, -8)
                local v1200 = v1188 and UDim2.new(0, 2, 0, 2) or UDim2.new(0, 4, 0, 4)

                v1196:Create(Fill, tweenInfo2, {
                    Size = v1199,
                    Position = v1200,
                }):Play()
            end

            Frame38.BackgroundColor3 = p109
            UIStroke7.Color = p109
        end

        for i, v in ipairs(t69)do
            local v1035 = v
            local TextButton16 = Instance.new('TextButton', Frame39)

            TextButton16.Size = UDim2.new(0, 21, 0, 21)
            TextButton16.BackgroundColor3 = Color3.fromRGB(24, 26, 34)
            TextButton16.Text = ''
            TextButton16.AutoButtonColor = false
            TextButton16.ZIndex = 1
            Instance.new('UICorner', TextButton16).CornerRadius = UDim.new(0, 7)

            local UIStroke9 = Instance.new('UIStroke', TextButton16)

            UIStroke9.Color = Color3.fromRGB(40, 44, 58)
            UIStroke9.Thickness = 1
            UIStroke9.Transparency = 0.35

            local Frame40 = Instance.new('Frame', TextButton16)

            Frame40.Size = UDim2.new(1, -8, 1, -8)
            Frame40.Position = UDim2.new(0, 4, 0, 4)
            Frame40.BackgroundColor3 = v1035
            Frame40.ZIndex = 1
            Instance.new('UICorner', Frame40).CornerRadius = UDim.new(0, 5)

            local UIGradient2 = Instance.new('UIGradient', Frame40)

            UIGradient2.Rotation = 90
            UIGradient2.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.05),
                NumberSequenceKeypoint.new(1, 0.3),
            })

            table.insert(t70, {
                Stroke = UIStroke9,
                Fill = Frame40,
            })
            TextButton16.MouseButton1Click:Connect(function()
                v1032(i, v1035)
                p106(math.round(v1035.R * 255), math.round(v1035.G * 255), (math.round(v1035.B * 255)))
            end)

            if math.abs(v1035.R - color3_16.R) < 0.01 and (math.abs(v1035.G - color3_16.G) < 0.01 and math.abs(v1035.B - color3_16.B) < 0.01) then
                task.spawn(function()
                    v1032(i, v1035)
                end)
            end
        end
    end)(v580, 'Trail Color', 255, 200, 50, function(p110, p111, p112)
        v53.BulletTracker.R = p110
        v53.BulletTracker.G = p111
        v53.BulletTracker.B = p112
    end, 180)
    v559(v580, 'Trail Size', 5, 40, 15, function(p113)
        v53.BulletTracker.Size = p113
    end, 180)

    local v581 = v557(Frame34, 'Aura', 190)

    v558(v581, 'WingsAura', 'Wings Aura', false, function(p114)
        if p114 then
            u139('WingsAura')

            return
        end

        u137('WingsAura')
    end, 180)
    v558(v581, 'StarrBallAura', 'Starr Ball', false, function(p115)
        if p115 then
            u139('StarrBallAura')

            return
        end

        u137('StarrBallAura')
    end, 180)
    v558(v581, 'RedAura', 'Red Aura', false, function(p116)
        if p116 then
            u139('RedAura')

            return
        end

        u137('RedAura')
    end, 180)

    local v582 = v557(Frame34, 'JumpCircle', 190)

    v558(v582, 'JumpCircleNeon', 'Neon Ring', false, function(p117)
        v143('JumpCircleNeon', p117)
    end, 180)
    v558(v582, 'JumpCircleShock', 'Shock Wave', false, function(p118)
        v143('JumpCircleShock', p118)
    end, 180)
    v558(v582, 'JumpCirclePulse', 'Pulse Spin', false, function(p119)
        v143('JumpCirclePulse', p119)
    end, 180)

    local v583 = v557(Frame35, 'Custom Sky', 190)

    v558(v583, 'CustomSky', 'Custom Sky', false, function(p120)
        v96(v53.CustomSky.Mode, p120)

        if v53.CustomAtmosphere and v53.CustomAtmosphere.Enabled then
            v90()
        end
    end, 180)

    local Frame41 = Instance.new('Frame', v583)

    Frame41.Size = UDim2.new(0, 180, 0, 28)
    Frame41.BackgroundTransparency = 1
    Frame41.ClipsDescendants = false
    Frame41.ZIndex = 2

    local TextButton17 = Instance.new('TextButton', Frame41)

    TextButton17.Size = UDim2.new(1, 0, 0, 28)
    TextButton17.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    TextButton17.BackgroundTransparency = 0.3
    TextButton17.Text = 'Tropical Summer \u{25bc}'
    TextButton17.TextColor3 = Color3.fromRGB(230, 235, 245)
    TextButton17.Font = Enum.Font.GothamBold
    TextButton17.TextSize = 11
    TextButton17.ZIndex = 2
    Instance.new('UICorner', TextButton17).CornerRadius = UDim.new(0, 6)

    local t71 = {
        'Pink',
        'PinkIshak',
        'Night',
        'Sunset',
        'Tropical',
        'RedNight',
    }
    local v587 = t44
    local Frame42 = Instance.new('Frame', Frame41)
    local new = UDim2.new
    local v590 = #t71

    Frame42.Size = new(1, 0, 0, v590 * 26)
    Frame42.Position = UDim2.new(0, 0, 0, 32)
    Frame42.BackgroundTransparency = 1
    Frame42.Visible = false
    Frame42.ZIndex = 5
    Instance.new('UIListLayout', Frame42).Padding = UDim.new(0, 3)

    local u591 = false

    TextButton17.MouseButton1Click:Connect(function()
        u591 = not u591
        Frame42.Visible = u591
        TextButton17.Text = (v587[v53.CustomSky.Mode] or 'Tropical Summer') .. (not u591 and ' \u{25bc}' or ' \u{25b2}')

        v6:Create(Frame41, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 180, 0, u591 and #t71 * 26 + 32 + 4 or 28),
        }):Play()
    end)

    for _, v in ipairs(t71)do
        local v594 = v

        t63[4] = Instance.new('TextButton', Frame42)
        t63[6] = UDim2.new(1, 0, 0, 24)
        t63[4].Size = t63[6]
        t63[6] = Color3.fromRGB(35, 38, 48)
        t63[4].BackgroundColor3 = t63[6]
        t63[4].BackgroundTransparency = 0.2
        t63[8] = v587
        t63[6] = 'Text'
        t63[5] = t63[8][v594] or v594
        t63[4][t63[6] ] = t63[5]
        t63[6] = Color3.fromRGB(210, 220, 235)
        t63[4].TextColor3 = t63[6]
        t63[5] = Enum.Font.GothamMedium
        t63[4].Font = t63[5]
        t63[4].TextSize = 10
        t63[4].ZIndex = 5
        t63[5] = Instance.new('UICorner', t63[4])
        t63[7] = UDim.new(0, 5)
        t63[5].CornerRadius = t63[7]

        local MouseButton1Click = t63[4].MouseButton1Click

        t63[6] = function()
            v53.CustomSky.Mode = v594
            TextButton17.Text = (v587[v594] or v594) .. ' \u{25bc}'
            Frame42.Visible = false

            v6:Create(Frame41, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 180, 0, 28),
            }):Play()

            if v53.CustomSky.Enabled then
                v96(v594, true)
            end
            if v594 == 'RedNight' then
                v53.CustomAtmosphere.Enabled = true

                if t38.CustomAtmosphere then
                    t38.CustomAtmosphere(true)
                end
            end
            if v53.CustomAtmosphere and v53.CustomAtmosphere.Enabled then
                v90()
            end
        end
        t63[5] = MouseButton1Click.Connect

        t63[5](MouseButton1Click, t63[6])
    end

    local v596 = v557(Frame35, 'Atmosphere', 190)

    v558(v596, 'CustomAtmosphere', 'Custom Atmosphere', false, function(_)
        v90()
    end, 180)
    v559(v596, 'Fog Density', 0, 100, 35, function(p122)
        v53.CustomAtmosphere.Density = p122 / 100

        if v53.CustomAtmosphere.Enabled then
            v90()
        end
    end, 180)
    v559(v596, 'Haze', 0, 200, 90, function(p123)
        v53.CustomAtmosphere.Haze = p123 / 100

        if v53.CustomAtmosphere.Enabled then
            v90()
        end
    end, 180)
    v559(v596, 'Glare', 0, 100, 12, function(p124)
        v53.CustomAtmosphere.Glare = p124 / 100

        if v53.CustomAtmosphere.Enabled then
            v90()
        end
    end, 180)

    local function v597(p125, p126)
        if p125 and p126 then
            p125.Color = p126
        end
    end

    t63[4] = 366
    t63[5] = Instance.new('Frame')
    t63[5].Name = 'TopToggleFrame'
    t63[5].Size = UDim2.new(0, t63[4], 0, 34)
    t63[5].Position = UDim2.new(0.5, -math.floor(t63[4] / 2), 0, 14)
    t63[5].BackgroundTransparency = 1
    t63[5].ZIndex = 150
    t63[5].Parent = v60

    local v598, v599, v600 = v74(t63[5], 88, 30, 150)

    t63[11] = v598
    t63[12] = v599
    t63[13] = v600

    local v601 = t63[11]

    v601.Name = 'FpsBanner'
    v601.Position = UDim2.new(0, 0, 0, 2)
    v601.Visible = false
    t63[6] = Instance.new('Frame', v601)
    t63[6].Size = UDim2.new(0, 20, 0, 16)
    t63[6].Position = UDim2.new(0, 10, 0.5, -8)
    t63[6].BackgroundTransparency = 1
    t63[6].ZIndex = 151

    local v602 = (function(p127)
        local Frame43 = Instance.new('Frame')

        Frame43.Size = UDim2.new(0, 18, 0, 16)
        Frame43.BackgroundTransparency = 1
        Frame43.Name = 'FpsIcon'
        Frame43.Parent = p127

        for i = 1, 4 do
            local Frame44 = Instance.new('Frame', Frame43)

            Frame44.Name = 'Bar' .. i
            Frame44.Size = UDim2.new(0, 3, 0, i * 2 + 4)
            Frame44.Position = UDim2.new(0, (i - 1) * 4, 1, -(i * 2 + 4))
            Frame44.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
            Instance.new('UICorner', Frame44).CornerRadius = UDim.new(0, 2)
        end

        return Frame43
    end)(t63[6])
    local TextLabel20 = Instance.new('TextLabel', v601)

    TextLabel20.Size = UDim2.new(1, -34, 1, 0)
    TextLabel20.Position = UDim2.new(0, 32, 0, 0)
    TextLabel20.BackgroundTransparency = 1
    TextLabel20.Text = 'FPS 60'
    TextLabel20.TextColor3 = color3_6
    TextLabel20.Font = Enum.Font.GothamBold
    TextLabel20.TextSize = 11
    TextLabel20.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel20.ZIndex = 151

    local v604, v605, v606 = v74(t63[5], v590, 34, 150)

    t63[9] = v605
    t63[10] = v606
    v604.Position = UDim2.new(0, 98, 0, 0)

    local TextButton18 = Instance.new('TextButton', v604)

    TextButton18.Name = 'ToggleBtn'
    TextButton18.Size = UDim2.new(1, 0, 1, 0)
    TextButton18.BackgroundTransparency = 1
    TextButton18.RichText = true
    TextButton18.Text = '<font color="#E8EEF7">Kitagawa</font><font color="#5FAFFF">Hub</font>'
    TextButton18.Font = Enum.Font.GothamBold
    TextButton18.TextSize = 13
    TextButton18.ZIndex = 151

    local v608, v609, v610 = v74(t63[5], 88, 30, 150)

    t63[14] = v608
    t63[15] = v609
    t63[16] = v610

    local v611 = t63[14]

    v611.Name = 'PingBanner'
    v611.Position = UDim2.new(0, 98 + v590 + 10, 0, 2)
    v611.Visible = false

    local Frame45 = Instance.new('Frame', v611)

    Frame45.Size = UDim2.new(0, 20, 0, 16)
    Frame45.Position = UDim2.new(0, 10, 0.5, -8)
    Frame45.BackgroundTransparency = 1
    Frame45.ZIndex = 151

    local v613 = (function(p128)
        local Frame46 = Instance.new('Frame')

        Frame46.Size = UDim2.new(0, 20, 0, 16)
        Frame46.BackgroundTransparency = 1
        Frame46.Name = 'WifiIcon'
        Frame46.Parent = p128

        local Frame47 = Instance.new('Frame', Frame46)

        Frame47.Name = 'Dot'
        Frame47.Size = UDim2.new(0, 4, 0, 4)
        Frame47.Position = UDim2.new(0.5, -2, 1, -4)
        Frame47.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        Instance.new('UICorner', Frame47).CornerRadius = UDim.new(1, 0)

        for i = 1, 3 do
            local Frame48 = Instance.new('Frame', Frame46)

            Frame48.Name = 'Arc' .. i
            Frame48.Size = UDim2.new(0, i * 4 + 6, 0, 3)
            Frame48.Position = UDim2.new(0.5, -(i * 2 + 3), 1, -6 - i * 3)
            Frame48.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
            Instance.new('UICorner', Frame48).CornerRadius = UDim.new(1, 0)
        end

        return Frame46
    end)(Frame45)
    local TextLabel21 = Instance.new('TextLabel', v611)

    TextLabel21.Size = UDim2.new(1, -34, 1, 0)
    TextLabel21.Position = UDim2.new(0, 32, 0, 0)
    TextLabel21.BackgroundTransparency = 1
    TextLabel21.Text = '0ms'
    TextLabel21.TextColor3 = color3_6
    TextLabel21.Font = Enum.Font.GothamBold
    TextLabel21.TextSize = 11
    TextLabel21.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel21.ZIndex = 151

    v67(t63[5], nil, TextButton18);
    (function(p129, p130)
        if not p129 then
            return
        end

        for _, descendant in pairs(p129:GetDescendants())do
            if descendant:IsA('Frame') then
                descendant.BackgroundColor3 = p130
            end
        end
    end)(v602, color3_5);
    (function(p131, p132)
        if not p131 then
            return
        end

        for _, descendant in pairs(p131:GetDescendants())do
            if descendant:IsA('Frame') then
                descendant.BackgroundColor3 = p132
            end
        end
    end)(v613, color3_5)
    v597(t63[13], color3_4)
    v597(t63[16], color3_4)

    TextLabel20.TextColor3 = color3_6
    TextLabel21.TextColor3 = color3_6

    TextButton18.MouseButton1Click:Connect(function()
        Frame4.Visible = not Frame4.Visible
    end)

    local n8 = 0
    local timestamp = tick()

    v4.RenderStepped:Connect(function()
        v601.Visible = v53.FpsBanner.Enabled
        v611.Visible = v53.PingBanner.Enabled

        if v53.FpsBanner.Enabled then
            n8 += 1

            if tick() - timestamp >= 1 then
                TextLabel20.Text = 'FPS ' .. tostring(n8)

                tick()
            end
        end
        if v53.PingBanner.Enabled then
            local v1067 = TextLabel21
            local n9 = 50

            pcall(function()
                n9 = math.clamp(math.round(u12:GetNetworkPing() * 1000), 1, 999)
            end)

            v1067.Text = tostring(n9) .. 'ms'
        end
    end)

    t62.MainFrame = Frame4
    t62.TopToggleFrame = t63[5]
end)()

local BodyVelocity
local BodyGyro

t1[1] = v4.RenderStepped

t1[1]:Connect(function()
    local Character = u12.Character
    local v618 = Character and Character:FindFirstChild('HumanoidRootPart')

    if v53.Fly.Enabled and v618 then
        if not BodyVelocity then
            BodyVelocity = Instance.new('BodyVelocity')
            BodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
            BodyVelocity.Parent = v618
        end
        if not BodyGyro then
            BodyGyro = Instance.new('BodyGyro')
            BodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
            BodyGyro.P = 90000
            BodyGyro.Parent = v618
        end

        local CurrentCamera = workspace.CurrentCamera
        local zero = Vector3.zero

        if v5:IsKeyDown(Enum.KeyCode.W) then
            zero += CurrentCamera.CFrame.LookVector
        end
        if v5:IsKeyDown(Enum.KeyCode.S) then
            zero -= CurrentCamera.CFrame.LookVector
        end
        if v5:IsKeyDown(Enum.KeyCode.A) then
            zero -= CurrentCamera.CFrame.RightVector
        end
        if v5:IsKeyDown(Enum.KeyCode.D) then
            zero += CurrentCamera.CFrame.RightVector
        end
        if v5:IsKeyDown(Enum.KeyCode.Space) then
            zero += Vector3.new(0, 1, 0)
        end
        if v5:IsKeyDown(Enum.KeyCode.LeftControl) then
            zero -= Vector3.new(0, 1, 0)
        end

        BodyGyro.CFrame = CurrentCamera.CFrame
        BodyVelocity.Velocity = zero * 50

        local Humanoid = Character:FindFirstChildOfClass('Humanoid')

        if Humanoid then
            Humanoid.PlatformStand = true

            return
        end
    else
        if BodyVelocity then
            BodyVelocity:Destroy()
        end
        if BodyGyro then
            BodyGyro:Destroy()
        end
        if v618 then
            local Humanoid = Character:FindFirstChildOfClass('Humanoid')

            if Humanoid then
                Humanoid.PlatformStand = false
            end
        end
    end
end)

t1[1] = v4.Stepped

t1[1]:Connect(function()
    if v53.Noclip.Enabled and u12.Character then
        for _, descendant in pairs(u12.Character:GetDescendants())do
            if descendant:IsA('BasePart') then
                descendant.CanCollide = false
            end
        end
    end
end)
task.spawn(function()
    local n10 = 0.1

    while true do
        v4.Heartbeat:Wait()

        if v53.TouchFling.Enabled then
            local Character = v3.LocalPlayer.Character
            local v627 = Character and Character:FindFirstChild('HumanoidRootPart')

            if v627 then
                local Velocity = v627.Velocity

                v627.Velocity = Velocity * 10000 + Vector3.new(0, 10000, 0)

                v4.RenderStepped:Wait()

                if Character and (Character.Parent and (v627 and v627.Parent)) then
                    v627.Velocity = Velocity
                end

                v4.Stepped:Wait()

                if Character and (Character.Parent and (v627 and v627.Parent)) then
                    v627.Velocity = Velocity + Vector3.new(0, n10, 0)

                    n10 *= -1
                end
            end
        end
    end
end)

local function v147(p133, p134)
    if not p133 then
        return nil
    end

    for _, child in ipairs(p133:GetChildren())do
        if child:IsA('Tool') and string.find(string.lower(child.Name), p134) then
            return child
        end
    end

    return nil
end

t1[1] = {
    'HumanoidRootPart',
    'UpperTorso',
    'Torso',
    'LowerTorso',
    'Head',
}

local u148 = t1[1]

local function v149(p135, p136)
    local v635 = p135:FindFirstChild('Handle') or p135:FindFirstChildWhichIsA('BasePart')

    if v635 and firetouchinterest then
        for _, v in ipairs(u148)do
            local v12 = p136:FindFirstChild(v)

            if v12 and v12:IsA('BasePart') then
                pcall(function()
                    firetouchinterest(v635, v12, 0)
                    firetouchinterest(v635, v12, 1)
                end)
            end
        end
    end

    pcall(function()
        p135:Activate()
    end)

    if u91 then
        pcall(function()
            u91()
        end)
    end

    local CurrentCamera = workspace.CurrentCamera
    local v640 = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)

    v106(v640.X / 2, v640.Y / 2, 0.015)
end

local u150 = false

task.spawn(function()
    while true do
        task.wait(0.05)

        if v53.MurderKillAll.Enabled and not u150 then
            u150 = true

            task.spawn(function()
                local g1075
                local g1076
                local v1079

                while v53.MurderKillAll.Enabled do
                    local Character = u12.Character
                    local u1070 = Character and Character:FindFirstChild('HumanoidRootPart')
                    local v1071 = Character and Character:FindFirstChildOfClass('Humanoid')

                    if not u1070 or (not v1071 or v1071.Health <= 0) then
                        break
                    end

                    local Backpack = u12:FindFirstChild('Backpack')
                    local v1073 = v147(Character, 'knife')

                    if not v1073 then
                        v1073 = v147(Backpack, 'knife')
                    end

                    local u1074 = v1073

                    repeat
                        if g1075 or not u1074 then
                            g1075 = false
                            g1076 = true

                            break
                        end
                        if Character ~= u1074.Parent then
                            local Humanoid = Character:FindFirstChildOfClass('Humanoid')

                            if Humanoid then
                                pcall(function()
                                    Humanoid:EquipTool(u1074)
                                end)
                            end

                            task.wait(0.1)

                            local Character6 = u12.Character

                            u1070 = Character6 and Character6:FindFirstChild('HumanoidRootPart')
                        end

                        v1079 = nil

                        local huge = math.huge

                        for v1083, v1084 in ipairs(v3:GetPlayers())do
                            if v1084 ~= u12 and v1084.Character then
                                local HumanoidRootPart = v1084.Character:FindFirstChild('HumanoidRootPart')
                                local Humanoid = v1084.Character:FindFirstChildOfClass('Humanoid')
                                local v1087 = HumanoidRootPart

                                if HumanoidRootPart then
                                    v1087 = Humanoid and (Humanoid.Health > 0 and v101(v1084) ~= 'Knife')
                                end
                                if v1087 then
                                    local Magnitude = (HumanoidRootPart.Position - u1070.Position).Magnitude

                                    if Magnitude < huge then
                                        v1079 = v1084
                                        huge = Magnitude
                                    end
                                end
                            end
                        end

                        if not v1079 then
                            g1075 = true
                        end
                    until not g1075

                    if g1076 then
                        g1076 = false

                        break
                    end

                    local Character7 = v1079.Character
                    local v1090 = Character7 and Character7:FindFirstChild('HumanoidRootPart')
                    local v1091 = Character7 and Character7:FindFirstChildOfClass('Humanoid')
                    local v1092 = not v1090

                    if not v1092 then
                        v1092 = not v1091 or v1091.Health <= 0
                    end
                    if v1092 then
                        task.wait(0.1)
                    else
                        local CFrame2 = u1070.CFrame
                        local v1094 = tick() + 2.2

                        while v1094 > tick() and v53.MurderKillAll.Enabled do
                            local Character8 = u12.Character

                            u1070 = Character8 and Character8:FindFirstChild('HumanoidRootPart')
                            u1074 = v147(Character8, 'knife') or v147(u12:FindFirstChild('Backpack'), 'knife')

                            local Character9 = v1079.Character
                            local v1097 = Character9 and Character9:FindFirstChild('HumanoidRootPart')
                            local v1098 = Character9 and Character9:FindFirstChildOfClass('Humanoid')
                            local v1099 = not u1070

                            if not v1099 then
                                v1099 = not u1074 or (not v1097 or (not v1098 or v1098.Health <= 0))
                            end
                            if v1099 then
                                break
                            end

                            u1070.CFrame = v1097.CFrame * CFrame.new(0, 0, 1.6)
                            u1070.AssemblyLinearVelocity = Vector3.zero

                            v149(u1074, Character9)
                            task.wait(0.06)
                        end

                        if u1070 and u1070.Parent then
                            pcall(function()
                                u1070.CFrame = CFrame2
                            end)
                        end

                        task.wait(0.08)
                    end
                end

                u150 = false

                if t38.MurderKillAll then
                    t38.MurderKillAll(false)
                end
            end)
        end
    end
end)

local u151 = false

task.spawn(function()
    local g650

    while task.wait(0.1) do
        if v53.KillOnlySheriff.Enabled and not u151 then
            local Character = u12.Character
            local v642 = Character and Character:FindFirstChild('HumanoidRootPart')

            local function v643(p137)
                if not p137 then
                    return
                end

                local GetChildren = p137.GetChildren

                for _, v in pairs(GetChildren(p137))do
                    if v:IsA('Tool') and string.find(v.Name:lower(), 'knife') then
                        return v
                    end
                end
            end

            local v644 = v643(Character) or v643(u12:FindFirstChild('Backpack'))

            if v644 and v642 then
                local v645
                local v646, v647, v648 = pairs(v3:GetPlayers())
                local v649

                repeat
                    repeat
                        v648, v649 = v646(v647, v648)

                        if not v648 then
                            g650 = true
                        end
                        if g650 then
                            break
                        end
                    until v649 ~= u12 and v101(v649) == 'Weapon'

                    if g650 then
                        break
                    end

                    local v651 = v649.Character and v649.Character:FindFirstChild('Humanoid')
                until v651 and v651.Health > 0

                if not g650 then
                    v645 = v649
                end

                g650 = false

                if v645 and (v645.Character and v645.Character:FindFirstChild('HumanoidRootPart')) then
                    u151 = true

                    if Character ~= v644.Parent then
                        v644.Parent = Character

                        task.wait(0.05)
                    end

                    local CFrame3 = v642.CFrame

                    v642.CFrame = v645.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.5)
                    v642.AssemblyLinearVelocity = Vector3.zero

                    task.wait(0.05)
                    v644:Activate()

                    if mouse1click then
                        mouse1click()
                    end

                    pcall(function()
                        local ViewportSize = workspace.CurrentCamera.ViewportSize

                        v7:SendMouseButtonEvent(ViewportSize.X / 2, ViewportSize.Y / 2, 0, true, game, 1)
                        task.wait(0.01)
                        v7:SendMouseButtonEvent(ViewportSize.X / 2, ViewportSize.Y / 2, 0, false, game, 1)
                    end)
                    task.wait(0.3)

                    v642.CFrame = CFrame3
                    v642.AssemblyLinearVelocity = Vector3.zero

                    if t38.KillOnlySheriff then
                        t38.KillOnlySheriff(false)
                    end

                    u151 = false
                end
            end
        end
    end
end)

local function v152(p138)
    if not p138 or not p138.Parent then
        return nil
    end

    local v654 = p138:FindFirstChild('Coin') or (p138:FindFirstChild('TouchPart') or p138:FindFirstChild('Main'))

    if v654 and v654:IsA('BasePart') then
        return v654.Position
    end
    if p138:IsA('Model') then
        local ok, result = pcall(function()
            return p138:GetPivot().Position
        end)

        if ok and result then
            return result
        end
        if p138.PrimaryPart then
            return p138.PrimaryPart.Position
        end

        local BasePart = p138:FindFirstChildWhichIsA('BasePart', true)

        if BasePart then
            return BasePart.Position
        end
    elseif p138:IsA('BasePart') then
        return p138.Position
    end

    return nil
end
local function v153(p139)
    local t72 = {}

    for _, descendant in ipairs(workspace:GetDescendants())do
        if descendant.Name == 'CoinContainer' and descendant.Parent then
            local v662 = v152(descendant)

            if v662 then
                local insert = table.insert
                local Magnitude = (v662 - p139.Position).Magnitude

                insert(t72, {
                    inst = descendant,
                    pos = v662,
                    dist = Magnitude,
                })
            end
        end
    end

    table.sort(t72, function(p140, p141)
        return p140.dist < p141.dist
    end)

    return t72
end

local t73 = {}

t1[1] = function(p142)
    if p142 <= 8 then
        return 17
    end
    if p142 >= 28 then
        return 30
    end

    return 17 + 13 * ((p142 - 8) / 20)
end

local n11 = 1
local v156 = t1[1]

t1[1] = v4.Heartbeat

t1[1]:Connect(function(p143)
    if not v53.AutoFarmCoin.Enabled then
        t73 = {}
        n11 = 1

        return
    end

    local Character = u12.Character
    local v668 = Character and Character:FindFirstChild('HumanoidRootPart')

    if not v668 then
        return
    end

    for v671, v672 in ipairs(Character:GetDescendants())do
        if v672:IsA('BasePart') then
            v672.CanCollide = false
        end
    end

    if tick() - 0 > 1.5 or (#t73 == 0 or n11 > #t73) then
        t73 = v153(v668)
        n11 = 1

        tick()
    end

    while n11 <= #t73 do
        local v673 = t73[n11]

        if not (not v673.inst or not v673.inst.Parent) then
            local v674 = v152(v673.inst)

            if v674 then
                v673.pos = v674
            end

            break
        end

        table.remove(t73, n11)
    end

    local v675 = t73[n11]

    if not v675 then
        return
    end

    local pos = v675.pos
    local Magnitude = (pos - v668.Position).Magnitude

    if Magnitude <= 3 then
        local _ = n11 + 1

        v668.AssemblyLinearVelocity = Vector3.zero

        return
    end

    local v679 = v156(Magnitude)
    local v680 = Vector3.new(pos.X, pos.Y + 0.8, pos.Z) - v668.Position
    local v681 = v680.Unit * math.min(v679 * p143, v680.Magnitude)

    v668.CFrame = v668.CFrame + v681
    v668.AssemblyLinearVelocity = Vector3.zero
    v668.AssemblyAngularVelocity = Vector3.zero
end)

local Mouse = u12:GetMouse()
local RenderStepped = v4.RenderStepped

t1[1] = function()
    if v53.TriggerBot.Enabled then
        if math.clamp((v53.TriggerBot.Delay or 80) / 1000, 0, 1.2) > tick() - 0 then
            return
        end

        local MouseTarget = Mouse.Target

        if MouseTarget and MouseTarget.Parent then
            local v683 = v3:GetPlayerFromCharacter(MouseTarget.Parent) or v3:GetPlayerFromCharacter(MouseTarget.Parent.Parent)

            if v683 and v683 ~= u12 and v101(v683) == 'Knife' then
                tick()

                if mouse1click then
                    mouse1click()
                end

                pcall(function()
                    local ViewportSize = workspace.CurrentCamera.ViewportSize

                    v7:SendMouseButtonEvent(ViewportSize.X / 2, ViewportSize.Y / 2, 0, true, game, 1)
                    v7:SendMouseButtonEvent(ViewportSize.X / 2, ViewportSize.Y / 2, 0, false, game, 1)
                end)

                if tick() - 0 >= 3.5 then
                    tick()

                    local Character = v683.Character
                    local v685 = Character and v77(Character)
                    local v686 = u12.Character and u12.Character:FindFirstChild('HumanoidRootPart')
                    local v687 = v686 and v686.Position + Vector3.new(0, 1.15, 0)

                    v110(v685, v687)
                end
            end
        end
    end
end

RenderStepped:Connect(t1[1])

local Stepped = v4.Stepped

t1[1] = function()
    if v53.AntiFling.Enabled and (not u15 and u12.Character) then
        for _, player in pairs(v3:GetPlayers())do
            if player ~= u12 and player.Character then
                for _, child in pairs(player.Character:GetChildren())do
                    if child:IsA('BasePart') then
                        child.CanCollide = false
                    end
                end
            end
        end
    end
end

Stepped:Connect(t1[1])

local t74

t1[1] = function(p144)
    if v103(p144) then
        t74[p144] = true
    end
end
t74 = {}

local v161 = t1[1]

t1[1] = ipairs

local _workspace = workspace

for _, v164 in t1[1](_workspace:GetDescendants())do
    v161(v164)
end

t1[1] = workspace.DescendantAdded

t1[1]:Connect(function(p145)
    task.wait(0.1)
    v161(p145)
end)
workspace.DescendantRemoving:Connect(function(descendant)
    if t74[descendant] then
        t74[descendant] = nil
    end
end)
task.spawn(function()
    local g713

    while task.wait(0.2) do
        if not v53.GunESP.Enabled then
            if next(t40) then
                v104()
            end
        else
            for v697 in pairs(t74)do
                if v103(v697) then
                    local v698 = not v697:IsDescendantOf(u12.Character)

                    if v698 then
                        local t75 = {
                            u12:FindFirstChild('Backpack'),
                        }

                        v698 = not v697:IsDescendantOf(v2(t75))
                    end
                    if v698 and not t40[v697] then
                        local Highlight = Instance.new('Highlight')

                        Highlight.Name = 'KitagawaGunESP'
                        Highlight.FillColor = Color3.fromRGB(46, 204, 113)
                        Highlight.OutlineColor = Color3.fromRGB(20, 255, 100)
                        Highlight.FillTransparency = 0.5
                        Highlight.Parent = v697

                        local BillboardGui = Instance.new('BillboardGui')

                        BillboardGui.Name = 'KitagawaGunText'
                        BillboardGui.Size = UDim2.new(0, 100, 0, 30)
                        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        BillboardGui.AlwaysOnTop = true

                        local TextLabel22 = Instance.new('TextLabel')

                        TextLabel22.Parent = BillboardGui
                        TextLabel22.Size = UDim2.new(1, 0, 1, 0)
                        TextLabel22.BackgroundTransparency = 1
                        TextLabel22.Text = 'Gun Dropped'
                        TextLabel22.TextColor3 = Color3.fromRGB(46, 204, 113)
                        TextLabel22.TextStrokeTransparency = 0
                        TextLabel22.Font = Enum.Font.GothamBold
                        TextLabel22.TextSize = 12
                        BillboardGui.Parent = v697
                        t40[v697] = {
                            Highlight = Highlight,
                            Billboard = BillboardGui,
                        }
                    end
                end
            end
            for k, v in pairs(t40)do
                local v705 = k
                local v706 = not v705

                if not v706 then
                    v706 = not v705.Parent

                    if not v706 then
                        v706 = not v103(v705)

                        if not v706 then
                            v706 = v705:IsDescendantOf(u12.Character)

                            if not v706 then
                                v706 = v705:IsDescendantOf(u12:FindFirstChild('Backpack'))
                            end
                        end
                    end
                end
                if v706 then
                    if v.Highlight then
                        v.Highlight:Destroy()
                    end
                    if v.Billboard then
                        v.Billboard:Destroy()
                    end

                    t40[v705] = nil
                end
            end

            local AutoLootEnabled = v53.AutoLoot.Enabled

            if AutoLootEnabled then
                AutoLootEnabled = u12.Character

                if AutoLootEnabled then
                    AutoLootEnabled = u12.Character:FindFirstChild('HumanoidRootPart')
                end
            end
            if AutoLootEnabled and v101(u12) == 'Default' then
                local u708
                local v709, v710, v711 = pairs(t40)

                repeat
                    local v712

                    v711, v712 = v709(v710, v711)

                    if not v711 then
                        g713 = true
                    end
                    if g713 then
                        break
                    end
                until v712.Highlight and v711 == v712.Highlight.Parent

                if not g713 then
                    u708 = v711
                end

                g713 = false

                if u708 then
                    local HumanoidRootPart = u12.Character.HumanoidRootPart
                    local HumanoidRootPartPosition = HumanoidRootPart.Position

                    if not (HumanoidRootPartPosition.X >= -99.6) or (not (HumanoidRootPartPosition.X <= 152.6) or (not (HumanoidRootPartPosition.Y >= -86.8) or (not (HumanoidRootPartPosition.Y <= 27.4) or (not (HumanoidRootPartPosition.Z >= -164.7) or not (HumanoidRootPartPosition.Z <= 82.8))))) then
                        local v716 = u708:IsA('Model') and u708:GetPivot() or u708.CFrame

                        if not u708:IsDescendantOf(u12.Character) then
                            v105(v716, 0.08, function()
                                if firetouchinterest then
                                    local v1108 = u708:IsA('Model') and u708.PrimaryPart or (u708:FindFirstChildWhichIsA('BasePart') or u708)

                                    if v1108 then
                                        firetouchinterest(HumanoidRootPart, v1108, 0)
                                        task.wait(0.02)
                                        firetouchinterest(HumanoidRootPart, v1108, 1)
                                    end
                                end
                            end)
                            task.wait(0.2)
                        end
                    end
                end
            end
        end
    end
end)
v4.RenderStepped:Connect(function()
    if v53.SpinBot.Enabled and (u12.Character and u12.Character:FindFirstChild('HumanoidRootPart')) then
        local HumanoidRootPart = u12.Character.HumanoidRootPart

        HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(v53.SpinBot.Speed), 0)
    end
end)

t1[1] = v5.JumpRequest

t1[1]:Connect(function()
    if v53.InfJump.Enabled and u12.Character then
        local Humanoid = u12.Character:FindFirstChildOfClass('Humanoid')

        if Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local n12 = 0

t1[1] = v4.Heartbeat

t1[1]:Connect(function()
    local BHopEnabled = v53.BHop.Enabled

    if BHopEnabled then
        BHopEnabled = u12.Character and (u12.Character:FindFirstChild('Humanoid') and u12.Character:FindFirstChild('HumanoidRootPart'))
    end
    if BHopEnabled then
        local Humanoid = u12.Character.Humanoid
        local HumanoidRootPart = u12.Character.HumanoidRootPart

        if v5:IsKeyDown(Enum.KeyCode.Space) and Humanoid.FloorMaterial ~= Enum.Material.Air then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

            n12 = math.clamp(n12 + v53.BHop.Power * 0.45, 0, v53.BHop.Power * 5.5)
            HumanoidRootPart.AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity + Humanoid.MoveDirection * n12
        end
    end
end)

t1[1] = v4.RenderStepped

t1[1]:Connect(function()
    for _, child in ipairs(Folder:GetChildren())do
        local childName = v3:FindFirstChild(child.Name)
        local v725 = not childName

        if not v725 then
            v725 = not v53.PlayerMenu.Enabled or (not childName.Character or not childName.Character:FindFirstChild('HumanoidRootPart'))
        end
        if v725 then
            child:Destroy()
        else
            local HumanoidRootPart = childName.Character:FindFirstChild('HumanoidRootPart')

            if HumanoidRootPart then
                local v727, v728 = workspace.CurrentCamera:WorldToScreenPoint(HumanoidRootPart.Position)

                if v728 then
                    child.Position = UDim2.new(0, v727.X + 20, 0, v727.Y)
                    child.Visible = true
                else
                    child.Visible = false
                end
            end
        end
    end
end)
task.spawn(function()
    while task.wait(0.3) do
        for _, player in ipairs(v3:GetPlayers())do
            local v731 = player
            local v732 = v731 ~= u12

            if v732 then
                v732 = v731.Character and (v731.Character:FindFirstChild('HumanoidRootPart') and v731.Character:FindFirstChild('Head'))
            end
            if v732 then
                local Character = v731.Character
                local v734 = v101(v731)

                if v53.RoleESP.Enabled then
                    local v735 = Character:FindFirstChild('KitagawaHighlight') or Instance.new('Highlight', Character)

                    if v735.Name ~= 'KitagawaHighlight' then
                        v735.Name = 'KitagawaHighlight'
                    end

                    v735.Adornee = Character
                    v735.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

                    local n13, n14

                    if v53.RoleESPMode == 'Minimalistic' then
                        n13 = 1
                        n14 = 0
                    elseif v53.RoleESPMode == 'Ghost' then
                        n14 = 1
                        n13 = 0.5
                    elseif v53.RoleESPMode == 'Pulse' then
                        n14 = 0
                        n13 = math.abs((math.sin(tick() * 2))) * 0.6 + 0.2
                    else
                        n13 = 0.45
                        n14 = 0
                    end
                    if n13 ~= v735.FillTransparency then
                        v735.FillTransparency = n13
                    end
                    if n14 ~= v735.OutlineTransparency then
                        v735.OutlineTransparency = n14
                    end

                    local color3_17, color3_18

                    if v734 == 'Knife' then
                        color3_17 = Color3.fromRGB(255, 35, 75)
                        color3_18 = Color3.fromRGB(255, 10, 50)
                    elseif v734 == 'Weapon' then
                        color3_17 = Color3.fromRGB(10, 100, 255)
                        color3_18 = Color3.fromRGB(0, 150, 255)
                    else
                        color3_17 = Color3.fromRGB(46, 204, 113)
                        color3_18 = Color3.fromRGB(46, 204, 113)
                    end
                    if color3_17 ~= v735.FillColor then
                        v735.FillColor = color3_17
                    end
                    if color3_18 ~= v735.OutlineColor then
                        v735.OutlineColor = color3_18
                    end
                elseif Character:FindFirstChild('KitagawaHighlight') then
                    Character.KitagawaHighlight:Destroy()
                end
                if v53.NameESP.Enabled then
                    local KitagawaName = Character.Head:FindFirstChild('KitagawaName')

                    if not KitagawaName then
                        KitagawaName = Instance.new('BillboardGui', Character.Head)
                        KitagawaName.Name = 'KitagawaName'
                        KitagawaName.Size = UDim2.new(0, 140, 0, 40)
                        KitagawaName.StudsOffset = Vector3.new(0, 2.6, 0)
                        KitagawaName.AlwaysOnTop = true

                        local TextLabel23 = Instance.new('TextLabel', KitagawaName)

                        TextLabel23.Name = 'PlayerName'
                        TextLabel23.Size = UDim2.new(1, 0, 0, 18)
                        TextLabel23.Position = UDim2.new(0, 0, 0, 0)
                        TextLabel23.BackgroundTransparency = 1
                        TextLabel23.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel23.TextStrokeTransparency = 0.25
                        TextLabel23.Font = Enum.Font.GothamBold
                        TextLabel23.TextSize = 12
                        TextLabel23.Text = v731.Name

                        local TextLabel24 = Instance.new('TextLabel', KitagawaName)

                        TextLabel24.Name = 'PlayerRole'
                        TextLabel24.Size = UDim2.new(1, 0, 0, 14)
                        TextLabel24.Position = UDim2.new(0, 0, 0, 18)
                        TextLabel24.BackgroundTransparency = 1
                        TextLabel24.TextStrokeTransparency = 0.25
                        TextLabel24.Font = Enum.Font.GothamBold
                        TextLabel24.TextSize = 11
                    end

                    local PlayerRole = KitagawaName:FindFirstChild('PlayerRole')

                    if PlayerRole then
                        local s6, color3_19

                        if v734 == 'Knife' then
                            s6 = '[MURDERER]'
                            color3_19 = Color3.fromRGB(255, 35, 75)
                        elseif v734 == 'Weapon' then
                            s6 = '[SHERIFF]'
                            color3_19 = Color3.fromRGB(10, 100, 255)
                        else
                            s6 = '[INNOCENT]'
                            color3_19 = Color3.fromRGB(46, 204, 113)
                        end
                        if s6 ~= PlayerRole.Text then
                            PlayerRole.Text = s6
                        end
                        if color3_19 ~= PlayerRole.TextColor3 then
                            PlayerRole.TextColor3 = color3_19
                        end
                    end
                elseif Character.Head:FindFirstChild('KitagawaName') then
                    Character.Head.KitagawaName:Destroy()
                end
                if v53.PlayerMenu.Enabled then
                    if not Folder:FindFirstChild(v731.Name) then
                        local Frame49 = Instance.new('Frame')

                        Frame49.Name = v731.Name
                        Frame49.Size = UDim2.new(0, 30, 0, 30)
                        Frame49.AnchorPoint = Vector2.new(0.5, 0.5)
                        Frame49.BackgroundTransparency = 1
                        Frame49.ZIndex = 50
                        Frame49.Parent = Folder

                        local TextButton19 = Instance.new('TextButton', Frame49)

                        TextButton19.Size = UDim2.new(1, 0, 1, 0)
                        TextButton19.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
                        TextButton19.Text = '\u{1f446}'
                        TextButton19.TextSize = 16
                        TextButton19.ZIndex = 50
                        Instance.new('UICorner', TextButton19).CornerRadius = UDim.new(1, 0)
                        Instance.new('UIStroke', TextButton19).Color = color3

                        local Frame50 = Instance.new('Frame', Frame49)

                        Frame50.Size = UDim2.new(0, 140, 0, 100)
                        Frame50.Position = UDim2.new(1, 10, 0.5, -50)
                        Frame50.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
                        Frame50.BackgroundTransparency = 0.1
                        Frame50.Visible = false
                        Frame50.ZIndex = 55
                        Instance.new('UICorner', Frame50).CornerRadius = UDim.new(0, 6)
                        Instance.new('UIStroke', Frame50).Color = color3

                        local ImageLabel = Instance.new('ImageLabel', Frame50)

                        ImageLabel.Size = UDim2.new(0, 30, 0, 30)
                        ImageLabel.Position = UDim2.new(0, 5, 0, 5)
                        ImageLabel.BackgroundTransparency = 1
                        ImageLabel.ZIndex = 56

                        pcall(function()
                            ImageLabel.Image = v3:GetUserThumbnailAsync(v731.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                        end)

                        Instance.new('UICorner', ImageLabel).CornerRadius = UDim.new(1, 0)

                        local TextLabel25 = Instance.new('TextLabel', Frame50)

                        TextLabel25.Size = UDim2.new(1, -45, 0, 30)
                        TextLabel25.Position = UDim2.new(0, 40, 0, 5)
                        TextLabel25.BackgroundTransparency = 1
                        TextLabel25.Text = v731.Name
                        TextLabel25.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel25.TextSize = 11
                        TextLabel25.Font = Enum.Font.GothamMedium
                        TextLabel25.TextXAlignment = Enum.TextXAlignment.Left
                        TextLabel25.TextScaled = true
                        TextLabel25.ZIndex = 56

                        local TextButton20 = Instance.new('TextButton', Frame50)

                        TextButton20.Size = UDim2.new(1, -10, 0, 25)
                        TextButton20.Position = UDim2.new(0, 5, 0, 40)
                        TextButton20.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                        TextButton20.Text = 'Fling player'
                        TextButton20.TextColor3 = Color3.fromRGB(255, 100, 100)
                        TextButton20.Font = Enum.Font.GothamBold
                        TextButton20.TextSize = 11
                        TextButton20.ZIndex = 57
                        Instance.new('UICorner', TextButton20).CornerRadius = UDim.new(0, 4)

                        local TextButton21 = Instance.new('TextButton', Frame50)

                        TextButton21.Size = UDim2.new(1, -10, 0, 25)
                        TextButton21.Position = UDim2.new(0, 5, 0, 70)
                        TextButton21.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                        TextButton21.Text = 'Teleport to player'
                        TextButton21.TextColor3 = Color3.fromRGB(100, 255, 100)
                        TextButton21.Font = Enum.Font.GothamBold
                        TextButton21.TextSize = 11
                        TextButton21.ZIndex = 57
                        Instance.new('UICorner', TextButton21).CornerRadius = UDim.new(0, 4)

                        TextButton19.MouseButton1Click:Connect(function()
                            Frame50.Visible = not Frame50.Visible
                        end)
                        TextButton20.MouseButton1Click:Connect(function()
                            v100(v731)

                            Frame50.Visible = false
                        end)
                        TextButton21.MouseButton1Click:Connect(function()
                            local Character10 = u12.Character

                            if Character10 then
                                Character10 = u12.Character:FindFirstChild('HumanoidRootPart') and (v731.Character and v731.Character:FindFirstChild('HumanoidRootPart'))
                            end
                            if Character10 then
                                u12.Character.HumanoidRootPart.CFrame = v731.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                            end

                            Frame50.Visible = false
                        end)
                    end
                else
                    local Name = Folder:FindFirstChild(v731.Name)

                    if Name then
                        Name:Destroy()
                    end
                end
            end
        end
    end
end)
pcall(function()
    if t62.MainFrame then
        t62.MainFrame.Visible = true
    end
    if t62.TopToggleFrame then
        t62.TopToggleFrame.Visible = true
    end

    v60.Enabled = true

    if Frame and (Frame.Parent and t62.TopToggleFrame) then
        Frame:Destroy()

        return
    end
    if TextLabel and TextLabel.Parent then
        TextLabel.Text = 'Ready'
    end
end)

if getgenv then
    local v166 = getgenv()

    t1[1] = 'KitagawaHubRunning'
    v166[t1[1] ] = true

    local v167 = getgenv()

    t1[1] = 'KitagawaHubUnload'
    v167[t1[1] ] = function()
        pcall(function()
            v127()
        end)
        pcall(function()
            v125()
        end)
        pcall(function()
            v138()
        end)
        pcall(function()
            if Folder2 then
                Folder2:ClearAllChildren()
            end
        end)
        pcall(function()
            v60:Destroy()
        end)
        pcall(function()
            v61:Destroy()
        end)
        pcall(function()
            local KitagawaBulletTrails = workspace:FindFirstChild('KitagawaBulletTrails')

            if KitagawaBulletTrails then
                KitagawaBulletTrails:Destroy()
            end
        end)
        pcall(function()
            v96('', false)
        end)
        pcall(function()
            v90()
        end)

        getgenv().KitagawaHubHeartbeatStop = true
        getgenv().KitagawaHubRunning = nil
        getgenv().KitagawaHubUnload = nil
    end
end

task.spawn(function()
    task.wait(8)

    while(not getgenv() or not getgenv().KitagawaHubHeartbeatStop) and (getgenv() and getgenv().KitagawaHubRunning) do
        local v754

        if not u12 then
            v754 = false
        else
            local v755 = (function(p146)
                local t76 = {
                    ['Content-Type'] = 'application/json',
                    ['X-Api-Key'] = 'db5cbd688fcc72b4221dd2e8f892cf1dccefd52c47bcdc4e',
                }

                if syn and type(syn.request) == 'function' then
                    return syn.request({
                        Url = 'http://62.233.43.59:8787/api/heartbeat',
                        Method = 'POST',
                        Headers = t76,
                        Body = p146,
                    })
                end
                if type(request) == 'function' then
                    return request({
                        Url = 'http://62.233.43.59:8787/api/heartbeat',
                        Method = 'POST',
                        Headers = t76,
                        Body = p146,
                    })
                end
                if http and type(http.request) == 'function' then
                    return http.request({
                        Url = 'http://62.233.43.59:8787/api/heartbeat',
                        Method = 'POST',
                        Headers = t76,
                        Body = p146,
                    })
                end
                if type(http_request) == 'function' then
                    return http_request('http://62.233.43.59:8787/api/heartbeat', 'POST', t76, p146)
                end

                local HttpService = game:GetService('HttpService')
                local u1114 = HttpService
                local success, result = pcall(function()
                    return u1114:RequestAsync({
                        Url = 'http://62.233.43.59:8787/api/heartbeat',
                        Method = 'POST',
                        Headers = t76,
                        Body = p146,
                    })
                end)

                if success then
                    return result
                end

                return nil
            end)('{"userId":"' .. tostring(u12.UserId) .. '"}')

            v754 = if v755 then v755.StatusCode or (v755.status or (v755.Success and 200) == 200)else false
        end
        if not v754 then
            warn('[KitagawaHub] Heartbeat failed (no executor HTTP?)')
        end

        for _ = 1, 45 do
            if getgenv() and getgenv().KitagawaHubHeartbeatStop then
                break
            end

            task.wait(1)
        end
    end
end)

t1[1] = v60.Parent

print('[KitagawaHub V11.5] Loaded successfully | Parent: ' .. (t1[1] and t1[1]:GetFullName() or 'nil'))
