local t1 = {
	[1] = game:GetService("Players"),
	[2] = game:GetService("RunService"),
	[3] = game:GetService("Workspace"),
	[4] = game:GetService("UserInputService")
}

game:GetService("StarterGui")
t1[5] = game:GetService("Lighting")
t1[6] = game:GetService("TweenService")
t1[7] = game:GetService("VirtualInputManager")
t1[8] = game:GetService("MaterialService")
t1[9] = game:GetService("ContentProvider")
t1[10] = game:GetService("ReplicatedStorage")
t1[11] = t1[1].LocalPlayer
t1[12] = workspace.CurrentCamera
t1[13] = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
if not t1[13] then
    game.StarterGui:SetCore("SendNotification", {
		Title = "Error",
		Text = "WindUI not loaded!",
		Duration = 5
	})

    return
end
local t2 = {}
t1[13]:SetTheme("Violet")
t1[13].TransparencyValue = 0.1
local v3 = t1[13]
local _UDim2 = UDim2
local CreateWindow = v3.CreateWindow
local v6 = _UDim2.fromOffset(720, 600)

t2[1] = CreateWindow(v3, {
	Title = "PlanetHub",
	Author = "MMV and MM2",
	Icon = "crown",
	Folder = "PlanetHubSettings",
	Size = v6,
	Resizable = true,
	Transparent = true,
	Theme = "Violet",
	SideBarWidth = 190,
	HideSearchBar = false
});
(function()
    local TextLabel = Instance.new("TextLabel")

    TextLabel.Name = "ReleaseBadge"
    TextLabel.Size = UDim2.new(0, 65, 0, 20)
    TextLabel.Position = UDim2.new(0, 160, 0, 12)
    TextLabel.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    TextLabel.BackgroundTransparency = 0.15
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.Text = "Релиз"
    TextLabel.TextSize = 11
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.BorderSizePixel = 0
    TextLabel.TextStrokeColor3 = Color3.fromRGB(138, 43, 226)
    TextLabel.TextStrokeTransparency = 0

    local UICorner = Instance.new("UICorner")

    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = TextLabel

    return TextLabel
end)().Parent = t2[1].UIElements.Main
t2[2] = function(p1, p2, p3)
    pcall(function()
        local v647 = t1[13]
        local v648 = p1
        local v649 = p2
        local v650 = p3 or 3

        v647:Notify({
			Title = v648,
			Content = v649,
			Duration = v650
		})
    end)
end
local color3 = Color3.fromRGB(0, 255, 255)
local color3_2 = Color3.fromRGB(133, 220, 255)

t2[3] = {
	MurderESP = false,
	SheriffESP = false,
	InnocentESP = false,
	ChamsEnabled = false,
	ChamsColor = "Purple",
	TracersEnabled = false,
	JumpCircles = false,
	Trails = false,
	RGBHumanoid = false,
	XRayEnabled = false,
	BloomEnabled = false,
	ColorCorrectionEnabled = false,
	VignetteEnabled = false,
	CustomSkyId = "",
	FlyEnabled = false,
	FlySpeed = 50,
	BHopEnabled = false,
	BHopSpeed = 30,
	SpinBotEnabled = false,
	SpinBotSpeed = 9999,
	AntiFlingEnabled = false,
	FovAimbotEnabled = false,
	FovRadius = 120,
	AutoFarmEnabled = false,
	AutoFarmSpeed = 20,
	AutoFarmCoinLimit = 40,
	AutoFarmCoinDelay = 0.15,
	AutoRespawn = true,
	AntiAFKEnabled = false,
	ShootButtonEnabled = false,
	GrabGunEnabled = false,
	SheriffAutoShootEnabled = false,
	WallHopEnabled = false,
	TexturePackEnabled = false,
	ChinaHatEnabled = false,
	ChinaHatStyle = "Classic",
	ChinaHatTransparency = 0.3,
	ChinaHatRainbow = false,
	ChinaHatRainbowSpeed = 5,
	ChinaHatColor = color3,
	ChinaHatRadius = 2.4,
	ChinaHatHeight = 1.6,
	ChinaHatReflectance = 0,
	ChinaHatSides = 25,
	AuraEnabled = false,
	AuraColor = color3_2,
	JerkEnabled = false,
	OrbizEnabled = false,
	SilentAimEnabled = false,
	SilentAimFov = 120,
	KillAllEnabled = false,
	AnimPackEnabled = false,
	AnimPack = "",
	TeleportGunEnabled = false,
	TeleportGunKey = "T"
}
local t3 = {
	wasJumping = false
}
local t4 = {
	F = 0,
	B = 0,
	L = 0,
	R = 0
}
t2[4] = {
	Highlights = {},
	ChamsPartsList = {},
	PostEffects = {},
	JumpTracking = t3,
	RGBConnection = nil,
	AutoFarmConn = nil,
	CurrentTween = nil,
	XRayParts = {},
	Tracers = {},
	TrailAttachments = {},
	FovCircle = nil,
	FovConnection = nil,
	FlyRunning = false,
	FlyKeys = t4,
	FlyBodyGyro = nil,
	FlyBodyVelocity = nil,
	FlyConn = nil,
	FlyKeyConn = nil,
	FlyKeyEndConn = nil,
	mainConn = nil,
	GrabGunRunning = false,
	WallHopConnection = nil,
	SheriffAutoShootConnection = nil,
	ChinaHatParts = {},
	ChinaHatConnection = nil,
	ChinaHatDrawings = {},
	TextureState = {},
	TextureVariantsBuilt = false,
	AuraParticles = {},
	AuraCache = {},
	JerkConnection = nil,
	BHopConn = nil,
	BHopBV = nil,
	BHopActive = false,
	SpinConn = nil,
	OrbizFolder = nil,
	OrbizParticles = {},
	OrbizConnection = nil,
	SilentAimConn = nil,
	SilentAimCircle = nil,
	KillAllConn = nil,
	KillAllRemote = nil,
	TeleportGunConn = nil
}
local color3_3 = Color3.fromRGB(255, 0, 0)
local color3_4 = Color3.fromRGB(0, 100, 255)
local color3_5 = Color3.fromRGB(138, 43, 226)
local color3_6 = Color3.fromRGB(138, 43, 226)
local color3_7 = Color3.fromRGB(255, 255, 255)
local color3_8 = Color3.fromRGB(255, 50, 50)
local color3_9 = Color3.fromRGB(0, 100, 255)
local color3_10 = Color3.fromRGB(0, 255, 0)

t2[5] = {
	Murder = color3_3,
	Sheriff = color3_4,
	Innocent = color3_5,
	Purple = color3_6,
	White = color3_7,
	Red = color3_8,
	Blue = color3_9,
	Green = color3_10
}
Color3.fromRGB(138, 43, 226)
Color3.fromRGB(0, 100, 255)
Color3.fromRGB(255, 0, 0)
Color3.fromRGB(0, 255, 0)
t2[6] = function(p4)
    if p4 and typeof(p4) == "RBXScriptConnection" then
        pcall(function()
            p4:Disconnect()
        end)
    end
end
t2[7] = function(p5)
    if not p5 or not p5.Character then
        return false
    end

    for _, descendant in ipairs(p5.Character:GetDescendants()) do
        if not descendant:IsA("Tool") then
            continue
        end

        local v153 = descendant.Name:lower()

        if v153:find("knife") or v153:find("blade") then
            return true
        end
    end

    local Backpack = p5:FindFirstChild("Backpack")

    if Backpack then
        for _, child in ipairs(Backpack:GetChildren()) do
            if not child:IsA("Tool") then
                continue
            end

            local v157 = child.Name:lower()

            if v157:find("knife") or v157:find("blade") then
                return true
            end
        end
    end

    return false
end
t2[8] = function(p6)
    if not p6 or not p6.Character then
        return false
    end

    for _, descendant in ipairs(p6.Character:GetDescendants()) do
        if not descendant:IsA("Tool") then
            continue
        end

        local v144 = descendant.Name:lower()

        if v144:find("gun") or (v144:find("pistol") or v144:find("revolver")) then
            return true
        end
    end

    local Backpack = p6:FindFirstChild("Backpack")

    if Backpack then
        for _, child in ipairs(Backpack:GetChildren()) do
            if not child:IsA("Tool") then
                continue
            end

            local v148 = child.Name:lower()

            if v148:find("gun") or (v148:find("pistol") or v148:find("revolver")) then
                return true
            end
        end
    end

    return false
end
t2[9] = function(p7)
    if t2[7](p7) then
        return "Убийца"
    end

    if t2[8](p7) then
        return "Шериф"
    end

    return "Невинный"
end
t2[10] = function()
    if not t1[11].Character then
        return false
    end

    for _, descendant in ipairs(t1[11].Character:GetDescendants()) do
        local v165 = descendant

        if v165:IsA("Tool") then
            local v166 = v165.Name:lower()

            if v166:find("gun") or (v166:find("pistol") or v166:find("revolver")) then
                pcall(function()
                    t1[11].Character.Humanoid:EquipTool(v165)
                end)

                return true
            end
        end
    end

    local Backpack = t1[11]:FindFirstChild("Backpack")

    if Backpack then
        for _, child in ipairs(Backpack:GetChildren()) do
            local v170 = child

            if v170:IsA("Tool") then
                local v171 = v170.Name:lower()

                if v171:find("gun") or (v171:find("pistol") or v171:find("revolver")) then
                    pcall(function()
                        t1[11].Character.Humanoid:EquipTool(v170)
                    end)

                    return true
                end
            end
        end
    end

    return false
end
t2[11] = function(p8)
    local vector3 = Vector3.new(0, -50, 0)
    local raycastParams = RaycastParams.new()

    raycastParams.FilterType = Enum.RaycastFilterType.Exclude

    local Character = t1[11].Character

    if Character then
        raycastParams.FilterDescendantsInstances = { Character }
    end

    local raycastResult = t1[3]:Raycast(p8, vector3, raycastParams)

    if raycastResult then
        return raycastResult.Position.Y
    end

    return p8.Y - 3
end
t2[12] = function(p9)
    if not p9 or not p9.Character then
        return false
    end

    local HumanoidRootPart = p9.Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        return false
    end

    local v183 = t1[11].Character and t1[11].Character:FindFirstChild("HumanoidRootPart")

    if not v183 then
        return false
    end

    local raycastParams = RaycastParams.new()

    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {
		t1[11].Character,
		p9.Character
	}

    return not t1[3]:Raycast(v183.Position, HumanoidRootPart.Position - v183.Position, raycastParams)
end
t2[13] = function(p10, p11, p12, p13)
    local v176 = p13 or 0.2

    if not p12 then
        p12 = Color3.fromRGB(180, 50, 255)
    end

    local Magnitude = (p10 - p11).Magnitude

    if Magnitude < 1 then
        return
    end

    local Part = Instance.new("Part")

    Part.Name = "GunBeam"
    Part.Size = Vector3.new(0.15, 0.15, Magnitude)
    Part.CFrame = CFrame.lookAt(p10, p11) * CFrame.new(0, 0, -Magnitude / 2)
    Part.Anchored = true
    Part.CanCollide = false
    Part.Material = Enum.Material.Neon
    Part.Color = p12
    Part.Transparency = 0.1
    Part.Parent = workspace

    local PointLight = Instance.new("PointLight")

    PointLight.Color = p12
    PointLight.Brightness = 10
    PointLight.Range = 15
    PointLight.Parent = Part
    task.spawn(function()
        for _ = 1, 10 do
            task.wait(v176 / 10)
            Part.Transparency = Part.Transparency + 0.09
            Part.Size = Vector3.new(Part.Size.X * 0.95, Part.Size.Y * 0.95, Part.Size.Z)
        end

        Part:Destroy()
    end)

    return Part
end
t2[14] = {
	angel = "97658130917593",
	starlight = "134645216613107",
	heavenly = "139300897520961",
	ribbon = "132069507632161",
	sakura = "81755778619404",
	wind = "80694081850877",
	flow = "119913533725648",
	star = "73754563740680"
}
t2[15] = {
	"angel",
	"starlight",
	"heavenly",
	"ribbon",
	"sakura",
	"wind",
	"flow",
	"star"
}
t2[16] = {}
for _, v in ipairs(t2[15]) do
    t2[16][v] = false
end
t2[17] = function()
    for _, v in ipairs(t2[4].AuraParticles) do
        local v197 = v

        pcall(function()
            v197:Destroy()
        end)
    end

    t2[4].AuraParticles = {}
end
t2[18] = function(p14)
    if t2[4].AuraCache[p14] then
        return t2[4].AuraCache[p14]
    end

    local v199 = t2[14][p14]

    if not v199 then
        return nil
    end

    local ok, result = pcall(game.GetObjects, game, "rbxassetid://" .. v199)

    if ok then
        ok = result and result[1]
    end

    if ok then
        t2[4].AuraCache[p14] = result[1]

        return result[1]
    end

    return nil
end
t2[19] = nil
t2[19] = function(p15, p16)
    local colorSequence = ColorSequence.new(p16)
    local GetDescendants = p15.GetDescendants

    for _, v in ipairs(GetDescendants(p15)) do
        if v:IsA("PointLight") then
            v.Color = p16
        elseif v:IsA("ParticleEmitter") or (v:IsA("Beam") or v:IsA("Trail")) then
            v.Color = colorSequence
        end
    end
end
t2[20] = nil
t2[20] = function()
    t2[17]()

    if not t2[3].AuraEnabled then
        return
    end

    local Character = t1[11].Character

    if not Character then
        return
    end

    if Character.Parent ~= workspace then
        Character = nil

        for _, child in ipairs(workspace:GetChildren()) do
            local v205 = child:IsA("Model")

            if v205 then
                v205 = child.Name == t1[11].Name
            end

            if not v205 then
                continue
            end

            local v206 = child:GetAttribute("1")

            if not v206 then
                v206 = child == _G.VIEWPORT_CLONE
            end

            if v206 then
                continue
            end

            local HumanoidRootPart = child:FindFirstChild("HumanoidRootPart")

            if HumanoidRootPart then
                HumanoidRootPart = HumanoidRootPart:IsA("BasePart")
            end

            if HumanoidRootPart then
                Character = child

                break
            end
        end
    end

    if not Character then
        return
    end

    for _, v in ipairs(t2[15]) do
        if t2[16][v] then
            local v210 = t2[18](v)

            if v210 then
                t2[19](v210, t2[3].AuraColor)

                local clone = v210:Clone()
                local GetChildren = clone.GetChildren

                for _, v2 in ipairs(GetChildren(clone)) do
                    local v2Name = Character:FindFirstChild(v2.Name)

                    if v2Name and v2Name:IsA("BasePart") then
                        for _, child in ipairs(v2:GetChildren()) do
                            child.Parent = v2Name
                            table.insert(t2[4].AuraParticles, child)
                        end
                    end
                end

                clone:Destroy()
            end
        end
    end
end
t2[21] = function(p17)
    t2[3].AuraEnabled = p17

    if p17 then
        t2[20]()

        return
    end

    t2[17]()
end
t2[22] = function(p18)
    t2[3].JerkEnabled = p18

    if p18 then
        if t2[4].JerkConnection then
            t2[4].JerkConnection:Disconnect()
            t2[4].JerkConnection = nil
        end

        t2[4].JerkConnection = t1[2].Heartbeat:Connect(function()
            if not t1[11].Character then
                return
            end

            local HumanoidRootPart = t1[11].Character:FindFirstChild("HumanoidRootPart")

            if not HumanoidRootPart then
                return
            end

            HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(math.random(-50, 50), math.random(-30, 30), math.random(-50, 50))
        end)
        t2[2]("Jerk", "Включен", 2)

        return
    end

    if t2[4].JerkConnection then
        t2[4].JerkConnection:Disconnect()
        t2[4].JerkConnection = nil
    end

    t2[2]("Jerk", "Выключен", 2)
end
t2[23] = nil
t2[24] = function()
    t2[4].FlyRunning = false

    if t2[4].FlyBodyGyro then
        pcall(function()
            t2[4].FlyBodyGyro:Destroy()
        end)
        t2[4].FlyBodyGyro = nil
    end

    if t2[4].FlyBodyVelocity then
        pcall(function()
            t2[4].FlyBodyVelocity:Destroy()
        end)
        t2[4].FlyBodyVelocity = nil
    end

    if t1[11].Character and t1[11].Character:FindFirstChild("Humanoid") then
        t1[11].Character.Humanoid.PlatformStand = false
    end

    t2[4].FlyKeys = {
		F = 0,
		B = 0,
		L = 0,
		R = 0
	}
end
t2[25] = nil
t2[25] = function()
    if t2[4].FlyRunning then
        return
    end

    local Character = t1[11].Character

    if not Character then
        return
    end

    local v221 = Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso")

    if not v221 then
        return
    end

    t2[4].FlyRunning = true
    t2[4].FlyKeys = {
		F = 0,
		B = 0,
		L = 0,
		R = 0
	}
    t2[4].FlyBodyGyro = Instance.new("BodyGyro", v221)
    t2[4].FlyBodyGyro.P = 90000
    t2[4].FlyBodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
    t2[4].FlyBodyGyro.cframe = v221.CFrame
    t2[4].FlyBodyVelocity = Instance.new("BodyVelocity", v221)
    t2[4].FlyBodyVelocity.velocity = Vector3.new(0, 0.1, 0)
    t2[4].FlyBodyVelocity.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)
    Character.Humanoid.PlatformStand = true
    t2[6](t2[4].FlyConn)
    t2[4].FlyConn = t1[2].RenderStepped:Connect(function()
        if not t2[4].FlyRunning or not t1[11].Character then
            t2[24]()

            return
        end

        local CurrentCamera = workspace.CurrentCamera
        local LookVector = CurrentCamera.CFrame.LookVector
        local RightVector = CurrentCamera.CFrame.RightVector
        local v656 = Vector3.new((t2[4].FlyKeys.R - t2[4].FlyKeys.L) * RightVector.X + (t2[4].FlyKeys.F - t2[4].FlyKeys.B) * LookVector.X, (t2[4].FlyKeys.R - t2[4].FlyKeys.L) * RightVector.Y + (t2[4].FlyKeys.F - t2[4].FlyKeys.B) * LookVector.Y, (t2[4].FlyKeys.R - t2[4].FlyKeys.L) * RightVector.Z + (t2[4].FlyKeys.F - t2[4].FlyKeys.B) * LookVector.Z) * t2[3].FlySpeed

        if v656.Magnitude > 0 then
            t2[4].FlyBodyVelocity.velocity = v656
        else
            t2[4].FlyBodyVelocity.velocity = Vector3.new(0, 0.1, 0)
        end

        t2[4].FlyBodyGyro.cframe = CurrentCamera.CFrame
    end)
    t2[2]("Fly", "Включен (WASD - движение)", 2)
end
t2[26] = function(p19)
    t2[3].FlyEnabled = p19

    if p19 then
        t2[25]()

        return
    end

    t2[24]()
end;
(function()
    t2[6](t2[4].FlyKeyConn)
    t2[4].FlyKeyConn = nil
    t2[4].FlyKeyConn = t1[4].InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end

        if not t2[4].FlyRunning then
            return
        end

        local KeyCode = input.KeyCode

        if KeyCode == Enum.KeyCode.W then
            t2[4].FlyKeys.F = 1

            return
        end

        if KeyCode == Enum.KeyCode.S then
            t2[4].FlyKeys.B = 1

            return
        end

        if KeyCode == Enum.KeyCode.A then
            t2[4].FlyKeys.L = 1

            return
        end

        if KeyCode == Enum.KeyCode.D then
            t2[4].FlyKeys.R = 1
        end
    end)
    t2[6](t2[4].FlyKeyEndConn)
    t2[4].FlyKeyEndConn = nil
    t2[4].FlyKeyEndConn = t1[4].InputEnded:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end

        if not t2[4].FlyRunning then
            return
        end

        local KeyCode = input.KeyCode

        if KeyCode == Enum.KeyCode.W then
            t2[4].FlyKeys.F = 0

            return
        end

        if KeyCode == Enum.KeyCode.S then
            t2[4].FlyKeys.B = 0

            return
        end

        if KeyCode == Enum.KeyCode.A then
            t2[4].FlyKeys.L = 0

            return
        end

        if KeyCode == Enum.KeyCode.D then
            t2[4].FlyKeys.R = 0
        end
    end)
end)()
t2[27] = function()
    t2[4].BHopActive = false

    if t2[4].BHopConn then
        t2[4].BHopConn:Disconnect()
        t2[4].BHopConn = nil
    end

    if t2[4].BHopBV then
        pcall(function()
            t2[4].BHopBV:Destroy()
        end)
        t2[4].BHopBV = nil
    end
end
t2[28] = function()
    if not t1[11].Character then
        return
    end

    if t2[4].BHopActive then
        t2[27]()
    end

    local Character = t1[11].Character
    local v234 = not Character:FindFirstChildOfClass("Humanoid")
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

    if not v234 then
        v234 = not HumanoidRootPart
    end

    if v234 then
        return
    end

    t2[4].BHopActive = true

    if t2[4].BHopBV then
        pcall(function()
            t2[4].BHopBV:Destroy()
        end)
        t2[4].BHopBV = nil
    end

    t2[4].BHopBV = Instance.new("BodyVelocity")
    t2[4].BHopBV.Name = "BHopBV"
    t2[4].BHopBV.MaxForce = Vector3.new(100000, 0, 100000)
    t2[4].BHopBV.Velocity = Vector3.new(0, 0, 0)
    t2[4].BHopBV.Parent = HumanoidRootPart

    if t2[4].BHopConn then
        t2[4].BHopConn:Disconnect()
        t2[4].BHopConn = nil
    end

    t2[4].BHopConn = t1[2].Stepped:Connect(function()
        if not t2[4].BHopActive then
            t2[27]()

            return
        end

        local Character2 = t1[11].Character

        if not Character2 then
            return
        end

        local Humanoid = Character2:FindFirstChildOfClass("Humanoid")
        local v665 = not Humanoid
        local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart")

        if not v665 then
            v665 = not HumanoidRootPart2
        end

        if v665 then
            return
        end

        if not t2[4].BHopBV or not t2[4].BHopBV.Parent then
            t2[4].BHopBV = Instance.new("BodyVelocity")
            t2[4].BHopBV.Name = "BHopBV"
            t2[4].BHopBV.MaxForce = Vector3.new(100000, 0, 100000)
            t2[4].BHopBV.Velocity = Vector3.new(0, 0, 0)
            t2[4].BHopBV.Parent = HumanoidRootPart2
        end

        local MoveDirection = Humanoid.MoveDirection
        local v668 = MoveDirection.Magnitude > 0.1
        local State = Humanoid:GetState()
        local v670 = State == Enum.HumanoidStateType.Running or (State == Enum.HumanoidStateType.Landed or State == Enum.HumanoidStateType.RunningNoPhysics)

        if v668 then
            local vector3 = Vector3.new(MoveDirection.X, 0, MoveDirection.Z)

            if vector3.Magnitude > 0.01 then
                t2[4].BHopBV.Velocity = vector3.Unit * t2[3].BHopSpeed
            end

            if v670 then
                v670 = tick() - 0 > 0.15
            end

            if v670 then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                tick()

                return
            end
        else
            t2[4].BHopBV.Velocity = Vector3.new(0, 0, 0)
        end
    end)
    t2[2]("BHop", "Включен", 2)
end
local t5 = {
	Enabled = false,
	Speed = 9999
}
t2[29] = nil
t2[29] = t5
t2[30] = nil
t2[30] = function()
    if t2[4].SpinConn then
        t2[4].SpinConn:Disconnect()
        t2[4].SpinConn = nil
    end

    if not t2[29].Enabled then
        return
    end

    t2[4].SpinConn = t1[2].Heartbeat:Connect(function(dt)
        if not t1[11].Character then
            return
        end

        local HumanoidRootPart = t1[11].Character:FindFirstChild("HumanoidRootPart")

        if HumanoidRootPart then
            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(t2[29].Speed * dt), 0)
        end
    end)
end
t2[31] = function(p20)
    t2[29].Enabled = p20
    t2[30]()

    local v260 = t2[2]

    if p20 then
        p20 = "Включен"
    end

    v260("Spin Bot", p20 or "Выключен", 2)
end
t2[32] = function()
    if t2[4].OrbizFolder then
        t2[4].OrbizFolder:Destroy()
        t2[4].OrbizFolder = nil
    end

    if t2[4].OrbizConnection then
        t2[4].OrbizConnection:Disconnect()
        t2[4].OrbizConnection = nil
    end

    t2[4].OrbizParticles = {}

    if not t2[3].OrbizEnabled then
        return
    end

    local Character = t1[11].Character

    if not Character then
        return
    end

    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        return
    end

    local Folder = Instance.new("Folder")

    Folder.Name = "Orbiz3D"
    Folder.Parent = workspace
    t2[4].OrbizFolder = Folder

    for _ = 1, 800 do
        local Part = Instance.new("Part")

        Part.Shape = Enum.PartType.Ball
        Part.Size = Vector3.new(0.2 + math.random() * 0.3, 0.2 + math.random() * 0.3, 0.2 + math.random() * 0.3)
        Part.BrickColor = BrickColor.new("Bright violet")
        Part.Material = Enum.Material.Neon
        Part.Transparency = 0.2 + math.random() * 0.5
        Part.Anchored = true
        Part.CanCollide = false
        Part.Parent = Folder
        Part.Position = HumanoidRootPart.Position + Vector3.new((math.random() - 0.5) * 80 * 2, math.random() * 50 + 20, (math.random() - 0.5) * 80 * 2)

        local insert = table.insert
        local OrbizParticles = t2[4].OrbizParticles
        local v244 = 0.2 + math.random() * 0.8
        local v245 = (math.random() - 0.5) * 0.5
        local v246 = (math.random() - 0.5) * 0.5
        local PositionY = Part.Position.Y

        insert(OrbizParticles, {
			part = Part,
			speed = v244,
			driftX = v245,
			driftZ = v246,
			startY = PositionY
		})
    end

    t2[4].OrbizConnection = t1[2].Heartbeat:Connect(function()
        if not t2[3].OrbizEnabled then
            return
        end

        local n1 = 80
        local v673 = HumanoidRootPart and HumanoidRootPart.Position or Vector3.new(0, 0, 0)

        for _, v in pairs(t2[4].OrbizParticles) do
            local part = v.part

            if part and part.Parent then
                local v677 = part.Position - Vector3.new(0, v.speed * 0.08, 0) + Vector3.new(v.driftX * 0.03, 0, v.driftZ * 0.03)

                if v677.Y < v673.Y - 10 then
                    v677 = Vector3.new(v673.X + (math.random() - 0.5) * n1 * 2, v673.Y + 30 + math.random() * 40, v673.Z + (math.random() - 0.5) * n1 * 2)
                    part.Transparency = 0.2 + math.random() * 0.5
                    part.Size = Vector3.new(0.2 + math.random() * 0.4, 0.2 + math.random() * 0.4, 0.2 + math.random() * 0.4)
                end

                part.Position = v677
            end
        end
    end)
end
t2[33] = function(p21)
    if not p21 or not p21.Character then
        return false
    end

    local Character = p21.Character

    for _, descendant in ipairs(Character:GetDescendants()) do
        if not (descendant:IsA("Tool") or (descendant:IsA("Part") or descendant:IsA("MeshPart"))) then
            continue
        end

        local v252 = descendant.Name:lower()
        local v253 = v252:find("knife")

        if not v253 then
            v253 = v252:find("blade") or (v252:find("dagger") or (v252:find("murder") or v252:find("butcher")))
        end

        if v253 then
            return true
        end
    end

    local Backpack = p21:FindFirstChild("Backpack")

    if Backpack then
        for _, child in ipairs(Backpack:GetChildren()) do
            local v257 = child.Name:lower()
            local v258 = v257:find("knife")

            if not v258 then
                v258 = v257:find("blade") or (v257:find("dagger") or (v257:find("murder") or v257:find("butcher")))
            end

            if v258 then
                return true
            end
        end
    end

    return false
end
local function v22()
    local vector2 = Vector2.new(t1[12].ViewportSize.X / 2, t1[12].ViewportSize.Y / 2)
    local v272
    local n2 = 1e999
    for _, player in ipairs(t1[1]:GetPlayers()) do
        if player ~= t1[11] and player.Character and t2[33](player) then
            local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

            if HumanoidRootPart then
                local v278, t6Result = t1[12]:WorldToScreenPoint(HumanoidRootPart.Position)
                if t6Result then
                    local Magnitude = (Vector2.new(v278.X, v278.Y) - vector2).Magnitude

                    if Magnitude <= t2[3].SilentAimFov and Magnitude < n2 then
                        n2 = Magnitude
                        v272 = player
                    end
                end
            end
        end
    end

    return v272
end
t2[34] = function()
    local v261, v262, v263 = ipairs(t1[10]:GetDescendants())
    local v264

    repeat
        repeat
            v263, v264 = v261(v262, v263)

            if not v263 then
                for _, descendant in ipairs(t1[10]:GetDescendants()) do
                    if descendant:IsA("RemoteEvent") then
                        return descendant
                    end
                end

                return nil
            end
        until v264:IsA("RemoteEvent") or v264:IsA("RemoteFunction")

        local v267 = v264.Name:lower()
        local v268 = v267:find("attack")

        if not v268 then
            v268 = v267:find("slash")

            if not v268 then
                v268 = v267:find("stab")

                if not v268 then
                    v268 = v267:find("kill")

                    if not v268 then
                        v268 = v267:find("damage") or (v267:find("hit") or (v267:find("click") or v267:find("swing")))
                    end
                end
            end
        end
    until v268

    return v264
end
t2[35] = t2[34]()
t2[36] = function(p22)
    if not p22 or not p22.Character then
        return nil
    end

    local HumanoidRootPart = p22.Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        return nil
    end

    local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity

    return HumanoidRootPart.Position + AssemblyLinearVelocity * 0.15
end
local function v23()
    if not t2[3].SilentAimEnabled then
        return
    end

    if not t1[11].Character then
        return
    end

    if not t2[33](t1[11]) then
        return
    end

    local v280 = v22()

    if not v280 then
        return
    end

    local v281 = t2[36](v280)

    if not v281 then
        return
    end

    if not t2[35] then
        t2[35] = t2[34]()

        if not t2[35] then
            return
        end
    end

    local HumanoidRootPart = t1[11].Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        return
    end

    local Unit = (v281 - HumanoidRootPart.Position).Unit

    pcall(function()
        t2[35]:FireServer(v281, v280.Character)
        t2[35]:FireServer(v280)

        local HumanoidRootPart3 = v280.Character:FindFirstChild("HumanoidRootPart")

        if HumanoidRootPart3 then
            t2[35]:FireServer(HumanoidRootPart3)
        end

        t2[35]:FireServer(Unit)
        t2[35]:FireServer(v280.Character.HumanoidRootPart.Position, v280)
        t2[35]:FireServer(v280.Character.HumanoidRootPart, v280)
    end)
end
t2[37] = function()
    if t2[4].SilentAimCircle then
        pcall(function()
            t2[4].SilentAimCircle:Remove()
        end)
        t2[4].SilentAimCircle = nil
    end

    local drawing = Drawing.new("Circle")

    drawing.Radius = t2[3].SilentAimFov
    drawing.Color = Color3.fromRGB(0, 255, 0)
    drawing.Thickness = 1.5
    drawing.Transparency = 0.6
    drawing.Filled = false
    drawing.Visible = false
    drawing.NumSides = 64
    t2[4].SilentAimCircle = drawing
end
t2[23] = nil
t2[38] = nil
t2[38] = function()
    if t2[23] then
        t2[23]:Disconnect()
        t2[23] = nil
    end

    if not t2[3].SilentAimEnabled then
        return
    end

    t2[23] = t1[4].InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end

        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            v23()
        end
    end)
end
t2[39] = function(p23)
    t2[3].SilentAimEnabled = p23

    if p23 then
        t2[37]()
        t2[38]()

        if not t2[4].SilentAimConn then
            t2[4].SilentAimConn = t1[2].RenderStepped:Connect(function()
                if not t2[3].SilentAimEnabled then
                    if t2[4].SilentAimCircle then
                        t2[4].SilentAimCircle.Visible = false
                    end

                    return
                end

                local SilentAimCircle = t2[4].SilentAimCircle

                if not SilentAimCircle then
                    return
                end

                SilentAimCircle.Position = Vector2.new(t1[12].ViewportSize.X / 2, t1[12].ViewportSize.Y / 2)
                SilentAimCircle.Radius = t2[3].SilentAimFov
                SilentAimCircle.Visible = true

                if v22() then
                    SilentAimCircle.Color = Color3.fromRGB(255, 50, 50)

                    return
                end

                SilentAimCircle.Color = Color3.fromRGB(0, 255, 0)
            end)
        end

        t2[2]("Silent Aim", "Включен (наводится на сервер)", 2)

        return
    end

    if t2[23] then
        t2[23]:Disconnect()
    end

    if t2[4].SilentAimConn then
        t2[4].SilentAimConn:Disconnect()
        t2[4].SilentAimConn = nil
    end

    if t2[4].SilentAimCircle then
        t2[4].SilentAimCircle.Visible = false
    end

    t2[2]("Silent Aim", "Выключен", 2)
end
t2[40] = function()
    local v225, v226, v227 = ipairs(t1[10]:GetDescendants())
    local v228

    repeat
        repeat
            v227, v228 = v225(v226, v227)

            if not v227 then
                for _, descendant in ipairs(t1[10]:GetDescendants()) do
                    if descendant:IsA("RemoteEvent") then
                        t2[4].KillAllRemote = descendant

                        return
                    end
                end

                return
            end
        until v228:IsA("RemoteEvent")

        local v231 = v228.Name:lower()
        local v232 = v231:find("kill")

        if not v232 then
            v232 = v231:find("attack")

            if not v232 then
                v232 = v231:find("damage") or (v231:find("murder") or (v231:find("slash") or v231:find("stab")))
            end
        end
    until v232

    t2[4].KillAllRemote = v228
end
t2[40]()
t2[41] = function()
    if not t2[4].KillAllRemote then
        return
    end

    for _, player in ipairs(t1[1]:GetPlayers()) do
        local v287 = player
        local v288 = v287 ~= t1[11]

        if v288 then
            v288 = v287.Character and (v287.Character:FindFirstChild("Humanoid") and v287.Character.Humanoid.Health > 0)
        end

        if v288 then
            pcall(function()
                t2[4].KillAllRemote:FireServer(v287)
                t2[4].KillAllRemote:FireServer(v287.Character)
                t2[4].KillAllRemote:FireServer(v287.Character.HumanoidRootPart)
            end)
        end
    end
end
t2[42] = nil
t2[42] = function()
    t2[6](t2[4].KillAllConn)
    t2[4].KillAllConn = nil

    if not t2[3].KillAllEnabled then
        return
    end

    t2[4].KillAllConn = t1[2].Stepped:Connect(function()
        if t2[3].KillAllEnabled then
            t2[41]()
        end
    end)
end
t2[43] = function(p24)
    t2[3].KillAllEnabled = p24

    if p24 then
        if not t2[4].KillAllRemote then
            t2[40]()
        end

        t2[42]()
        t2[2]("Kill All", "Включен (нужна роль убийцы)", 2)

        return
    end

    t2[6](t2[4].KillAllConn)
    t2[4].KillAllConn = nil
    t2[2]("Kill All", "Выключен", 2)
end
local t7 = {
	WalkAnim = 18537392113,
	RunAnim = 18537384940,
	JumpAnim = 18537380791,
	FallAnim = 18537367238,
	SwimIdle = 18537387180,
	Swim = 18537389531,
	Animation1 = 18537376492,
	Animation2 = 18537371272,
	ClimbAnim = 18537363391
}
local t8 = {
	WalkAnim = 122150855457010,
	RunAnim = 82598234841035,
	JumpAnim = 75290611992385,
	FallAnim = 98600215928904,
	SwimIdle = 109346520324160,
	Swim = 133308483266210,
	Animation1 = 122257458498460,
	Animation2 = 102357151005770,
	ClimbAnim = 88763136693023
}
local t9 = {
	WalkAnim = 83842218823011,
	RunAnim = 118320322718870,
	JumpAnim = 109996626521204,
	FallAnim = 95603166884636,
	SwimIdle = 94922130551805,
	Swim = 134530128383900,
	Animation1 = 110211186840350,
	Animation2 = 114191137265060,
	ClimbAnim = 97824616490448
}
local t10 = {
	WalkAnim = 92072849924640,
	RunAnim = 72301599441680,
	JumpAnim = 104325245285200,
	FallAnim = 121152442762480,
	Animation1 = 118832222982050,
	ClimbAnim = 131326830509780,
	SwimIdle = 113199415118200,
	Swim = 99384245425157,
	Animation2 = 76049494037641
}
local t11 = {
	WalkAnim = 10921111375,
	RunAnim = 10921104374,
	JumpAnim = 10921107367,
	FallAnim = 10921105765,
	SwimIdle = 10921110146,
	Swim = 10921108971,
	ClimbAnim = 10921100400,
	Animation1 = 10921101664,
	Animation2 = 10921102574
}
local t12 = {
	WalkAnim = 10921355261,
	RunAnim = 616163682,
	JumpAnim = 10921351278,
	FallAnim = 10921350320,
	SwimIdle = 10921353442,
	Swim = 10921352344,
	Animation1 = 10921344533,
	Animation2 = 10921345304,
	ClimbAnim = 10921343576
}
local t13 = {
	WalkAnim = 10921152678,
	RunAnim = 10921148209,
	JumpAnim = 10921149743,
	FallAnim = 10921148939,
	SwimIdle = 10921151661,
	Swim = 10921150788,
	ClimbAnim = 10921143404,
	Animation1 = 10921144709,
	Animation2 = 10921145797
}
local t14 = {
	WalkAnim = 109168724482750,
	RunAnim = 81024476153754,
	JumpAnim = 116936326516980,
	FallAnim = 92294537340807,
	SwimIdle = 98854111361360,
	Swim = 134591743181630,
	ClimbAnim = 119377220967550,
	Animation1 = 133806214992290,
	Animation2 = 94970088341563
}
local t15 = {
	WalkAnim = 10921046031,
	RunAnim = 10921039308,
	JumpAnim = 10921042494,
	FallAnim = 10921040576,
	SwimIdle = 10921045006,
	Swim = 10921044000,
	ClimbAnim = 10921032124,
	Animation1 = 10921034824,
	Animation2 = 10921036806
}
local t16 = {
	WalkAnim = 73718308412641,
	RunAnim = 135515454877970,
	JumpAnim = 78508480717326,
	FallAnim = 78147885297412,
	SwimIdle = 129183123083280,
	Swim = 110657013921770,
	ClimbAnim = 129447497744820,
	Animation1 = 92849173543269,
	Animation2 = 132238900951110
}
local t17 = {
	WalkAnim = 10921342074,
	RunAnim = 10921336997,
	JumpAnim = nil,
	FallAnim = 10921337907,
	SwimIdle = 10921341319,
	Swim = 10921340419,
	ClimbAnim = 10921329322,
	Animation1 = 10921330408,
	Animation2 = 10921333667
}
local t18 = {
	WalkAnim = 10921298616,
	RunAnim = 10921291831,
	JumpAnim = 10921294559,
	FallAnim = 10921293373,
	SwimIdle = 10921297391,
	Swim = 10921295495,
	ClimbAnim = 10921286911,
	Animation1 = 10921288909,
	Animation2 = 10921290167
}
local t19 = {
	WalkAnim = 10921312010,
	RunAnim = 10921306285,
	JumpAnim = 10921308158,
	FallAnim = 10921307241,
	SwimIdle = 10921310341,
	Swim = 10921309319,
	ClimbAnim = 10921300839,
	Animation1 = 10921301576,
	Animation2 = nil
}
local t20 = {
	WalkAnim = 18747074203,
	RunAnim = 18747070484,
	JumpAnim = 18747069148,
	FallAnim = 18747062535,
	SwimIdle = 18747071682,
	Swim = 18747073181,
	ClimbAnim = 18747060903,
	Animation1 = 18747067405,
	Animation2 = 18747063918
}
local t21 = {
	WalkAnim = 110358958299420,
	RunAnim = 117333533048080,
	JumpAnim = 119846112151350,
	FallAnim = 129773241321030,
	SwimIdle = 79090109939093,
	Swim = 132697394189920,
	ClimbAnim = 134630013742019,
	Animation1 = 92080889861410,
	Animation2 = 74451233229259
}
local t22 = {
	WalkAnim = 90478085024465,
	RunAnim = 134824450619860,
	JumpAnim = 121454505477200,
	FallAnim = 94788218468396,
	SwimIdle = 129126268464850,
	Swim = 105962919001086,
	ClimbAnim = 121145883950230,
	Animation1 = 98281136301627,
	Animation2 = nil
}
local t23 = {
	WalkAnim = 10921326949,
	RunAnim = 10921320299,
	JumpAnim = 10921322186,
	FallAnim = 10921321317,
	SwimIdle = 10921325443,
	Swim = 10921324408,
	ClimbAnim = 10921314188,
	Animation1 = 10921315373,
	Animation2 = nil
}
local t24 = {
	Run = 656118852,
	Walk = 656121766,
	Jump = 656117878,
	Fall = 656115606,
	Swim = 656119721,
	SwimIdle = 656121397,
	Climb = 656114359,
	Idle = {
		656117400,
		656118341,
		886742569
	}
}
local t25 = {
	Run = 616091570,
	Walk = 616095330,
	Jump = 616090535,
	Fall = 616087089,
	Swim = 616092998,
	SwimIdle = 616094091,
	Climb = 616086039,
	Idle = {
		616088211,
		616089559,
		885531463
	}
}
local t26 = {
	Run = 616010382,
	Walk = 616013216,
	Jump = 616008936,
	Fall = 616005863,
	Swim = 616011509,
	SwimIdle = 616012453,
	Climb = 616003713,
	Idle = {
		616006778,
		616008087,
		886862142
	}
}
local t27 = {
	Run = 616140816,
	Walk = 616146177,
	Jump = 616139451,
	Fall = 616134815,
	Swim = 616143378,
	SwimIdle = 616144772,
	Climb = 616133594,
	Idle = {
		616136790,
		616138447,
		886888594
	}
}
local t28 = {
	Run = 910025107,
	Walk = 910034870,
	Jump = 910016857,
	Fall = 910001910,
	Swim = 910028158,
	SwimIdle = 910030921,
	Climb = 909997997,
	Idle = {
		910004836,
		910009958,
		1018536639
	}
}
t2[44] = {
	["Adidas Sports"] = t7,
	["Adidas Community"] = t8,
	["Adidas Aura"] = t9,
	["Wicked Popular"] = t10,
	Elder = t11,
	Zombie = t12,
	Mage = t13,
	["Catwalk Glam"] = t14,
	Astronaut = t15,
	["Wicked \"Dancing Through Life\""] = t16,
	Werewolf = t17,
	Superhero = t18,
	Toy = t19,
	["No Boundaries"] = t20,
	NFL = t21,
	["Amazon Unboxed"] = t22,
	Vampire = t23,
	Ninja = t24,
	Robot = t25,
	Levitation = t26,
	Stylish = t27,
	Bubbly = t28,
	Cartoon = {
		Run = 742638842,
		Walk = 742640026,
		Jump = 742637942,
		Fall = 742637151,
		Swim = 742639220,
		SwimIdle = 742639812,
		Climb = 742636889,
		Idle = {
			742637544,
			742638445,
			885477856
		}
	}
}
t2[45] = nil
t2[45] = function(p25)
    local v291 = t2[44][p25]

    if not v291 then
        return false
    end

    local Character = t1[11].Character

    if not Character then
        return false
    end

    local Animate = Character:FindFirstChild("Animate")

    if not Animate then
        return false
    end

    local function v294(p26, p27)
        if p26 and p27 then
            p26.AnimationId = "rbxassetid://" .. tostring(p27)
        end
    end
    local function v295(p28, p29)
        if not p28 then
            return nil
        end

        local p29_2 = p28:FindFirstChild(p29)

        if not p29_2 then
            p29_2 = Instance.new("Animation")
            p29_2.Name = p29
            p29_2.Parent = p28
        end

        return p29_2
    end

    local v296 = v295(Animate:FindFirstChild("run"), "RunAnim")
    local v297 = v295(Animate:FindFirstChild("walk"), "WalkAnim")
    local v298 = v295(Animate:FindFirstChild("jump"), "JumpAnim")
    local v299 = v295(Animate:FindFirstChild("fall"), "FallAnim")
    local v300 = v295(Animate:FindFirstChild("climb"), "ClimbAnim")
    local v301 = v295(Animate:FindFirstChild("swim"), "Swim")
    local v302 = v295(Animate:FindFirstChild("swimidle"), "SwimIdle")
    local idle = Animate:FindFirstChild("idle")

    v294(v297, v291.WalkAnim or v291.Walk)
    v294(v296, v291.RunAnim or v291.Run)
    v294(v298, v291.JumpAnim or v291.Jump)
    v294(v299, v291.FallAnim or v291.Fall)
    v294(v300, v291.ClimbAnim or v291.Climb)
    v294(v301, v291.Swim)
    v294(v302, v291.SwimIdle or v291.Swim)

    if idle then
        local Animation1 = idle:FindFirstChild("Animation1")
        local Animation2 = idle:FindFirstChild("Animation2")

        if v291.Animation1 then
            v294(Animation1, v291.Animation1)
        end

        if v291.Animation2 then
            v294(Animation2, v291.Animation2)
        end

        if v291.Idle then
            if Animation1 and v291.Idle[1] then
                v294(Animation1, v291.Idle[1])
            end

            if Animation2 and v291.Idle[2] then
                v294(Animation2, v291.Idle[2] or v291.Idle[1])
            end
        end
    end

    Animate.Disabled = true
    task.wait(0.06)
    Animate.Disabled = false

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if Humanoid then
        pcall(function()
            Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
            task.wait(0.03)
            Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end)
    end

    t2[3].AnimPack = p25

    return true
end
t2[46] = function(p30)
    t2[3].AnimPackEnabled = p30

    if p30 then
        if t2[3].AnimPack ~= "" then
            t2[45](t2[3].AnimPack)
            t2[2]("Анимации", "Применён: " .. t2[3].AnimPack, 2)

            return
        end

        t2[2]("Анимации", "Сначала выбери пачку!", 2)
    end
end
t2[47] = nil
t2[47] = function()
    local GunDrop = workspace:FindFirstChild("GunDrop")

    if GunDrop then
        local Character = t1[11].Character

        if Character and Character:FindFirstChild("HumanoidRootPart") then
            GunDrop.CFrame = Character.HumanoidRootPart.CFrame
            t2[2]("Teleport Gun", "Пушка притянута!", 2)

            return
        end

        t2[2]("Teleport Gun", "Персонаж не найден!", 2)

        return
    end

    t2[2]("Teleport Gun", "Пушки нет на земле!", 2)
end
t2[48] = function(p31)
    t2[6](t2[4].TeleportGunConn)
    t2[4].TeleportGunConn = nil

    if not p31 or p31 == "" then
        return
    end

    local v333 = Enum.KeyCode[p31]

    if not v333 then
        return
    end

    t2[4].TeleportGunConn = t1[4].InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end

        if input.KeyCode == v333 then
            t2[47]()
        end
    end)
end
t2[49] = function(p32)
    t2[3].TeleportGunEnabled = p32

    if p32 then
        t2[48](t2[3].TeleportGunKey)
        t2[2]("Teleport Gun", "Включен (хоткей: " .. t2[3].TeleportGunKey .. ")", 2)

        return
    end

    t2[6](t2[4].TeleportGunConn)
    t2[4].TeleportGunConn = nil
    t2[2]("Teleport Gun", "Выключен", 2)
end
t2[50] = function()
    for _, descendant in ipairs(t1[3]:GetDescendants()) do
        if not descendant:IsA("Tool") then
            continue
        end

        local v320 = descendant.Name:lower()
        local v321 = v320:find("gun")

        if not v321 then
            v321 = v320:find("pistol")

            if not v321 then
                v321 = v320:find("weapon")

                if not v321 then
                    v321 = v320:find("rifle")

                    if not v321 then
                        v321 = v320:find("shotgun") or (v320:find("gundrop") or v320:find("droppedgun"))
                    end
                end
            end
        end

        if v321 then
            return descendant
        end
    end

    return nil
end
t2[51] = nil
t2[51] = function()
    if t2[4].GrabGunRunning then
        return
    end

    t2[4].GrabGunRunning = true

    if not t1[11].Character then
        t2[2]("Grab Gun", "Персонаж не найден", 2)
        t2[4].GrabGunRunning = false

        return
    end

    local HumanoidRootPart = t1[11].Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        t2[2]("Grab Gun", "HRP не найден", 2)
        t2[4].GrabGunRunning = false

        return
    end

    local HumanoidRootPartCFrame = HumanoidRootPart.CFrame
    local v359 = t2[50]()

    if not v359 then
        t2[2]("Grab Gun", "Оружие не найдено", 2)
        t2[4].GrabGunRunning = false

        return
    end

    local Handle = v359:FindFirstChild("Handle")

    if not Handle then
        t2[2]("Grab Gun", "Нет Handle", 2)
        t2[4].GrabGunRunning = false

        return
    end

    HumanoidRootPart.CFrame = Handle.CFrame * CFrame.new(0, 2, 2)
    task.wait(0.1)
    HumanoidRootPart.CFrame = HumanoidRootPartCFrame

    local Humanoid = t1[11].Character:FindFirstChildOfClass("Humanoid")

    if Humanoid and not t1[11].Character:FindFirstChildOfClass("Tool") then
        Humanoid:EquipTool(v359)
        t2[2]("Grab Gun", "Подобрано: " .. v359.Name, 2)
    end

    t2[4].GrabGunRunning = false
end
t2[52] = function()
    t2[3].GrabGunEnabled = not t2[3].GrabGunEnabled

    if t2[3].GrabGunEnabled then
        t2[51]()
        t2[3].GrabGunEnabled = false
    end
end
t2[53] = nil
t2[53] = function()
    while t2[3].SheriffAutoShootEnabled do
        task.wait(0.05)

        if t1[11].Character and t2[8](t1[11]) then
            local HumanoidRootPart = t1[11].Character:FindFirstChild("HumanoidRootPart")

            if HumanoidRootPart then
                local v345
                local huge = math.huge
                for v349, v350 in ipairs(t1[1]:GetPlayers()) do

                    if v350 ~= t1[11] and v350.Character and (t2[7](v350) and t2[12](v350)) then
                        local HumanoidRootPart4 = v350.Character:FindFirstChild("HumanoidRootPart")

                        if HumanoidRootPart4 then
                            local Magnitude = (HumanoidRootPart.Position - HumanoidRootPart4.Position).Magnitude

                            if Magnitude < huge and Magnitude <= 100 then
                                huge = Magnitude
                                v345 = v350
                            end
                        end
                    end
                end
                if v345 then
                    local HumanoidRootPart5 = v345.Character:FindFirstChild("HumanoidRootPart")

                    if HumanoidRootPart5 then
                        local HumanoidRootPart5Position = HumanoidRootPart5.Position

                        t1[12].CFrame = CFrame.lookAt(t1[12].CFrame.Position, HumanoidRootPart5Position)

                        local CFramePosition = t1[12].CFrame.Position

                        t2[13](CFramePosition, HumanoidRootPart5Position, Color3.fromRGB(180, 50, 255), 0.2)
                        pcall(function()
                            t1[7]:SendKeyEvent(true, Enum.KeyCode.MouseButton1, false, game)
                            task.wait(0.05)
                            t1[7]:SendKeyEvent(false, Enum.KeyCode.MouseButton1, false, game)
                        end)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
end
t2[54] = function(p33)
    t2[3].SheriffAutoShootEnabled = p33
    t2[6](t2[4].SheriffAutoShootConnection)
    t2[4].SheriffAutoShootConnection = nil

    if p33 then
        t2[4].SheriffAutoShootConnection = task.spawn(t2[53])
        t2[2]("Sheriff AutoShoot", "Включен", 2)

        return
    end

    t2[2]("Sheriff AutoShoot", "Выключен", 2)
end
t2[55] = function()
    t2[6](t2[4].WallHopConnection)
    t2[4].WallHopConnection = nil

    if not t2[3].WallHopEnabled then
        return
    end

    t2[4].WallHopConnection = t1[2].Heartbeat:Connect(function()
        if not t1[11].Character then
            return
        end

        local Humanoid = t1[11].Character:FindFirstChildOfClass("Humanoid")

        if not Humanoid then
            return
        end

        if t1[4]:IsKeyDown(Enum.KeyCode.Space) then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end
t2[56] = function(p34)
    t2[3].WallHopEnabled = p34

    if p34 then
        t2[55]()
        t2[2]("Wall Hop", "Включен (зажми Space)", 2)

        return
    end

    t2[6](t2[4].WallHopConnection)
    t2[4].WallHopConnection = nil
    t2[2]("Wall Hop", "Выключен", 2)
end
t2[57] = function(p35)
    if not p35 or not p35.Character then
        return
    end

    local t29 = {}

    for _, descendant in ipairs(p35.Character:GetDescendants()) do
        if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
            local descendantMaterial = descendant.Material
            local descendantColor = descendant.Color
            local descendantTransparency = descendant.Transparency
            local CastShadow = descendant.CastShadow

            t29[descendant] = {
				ogMaterial = descendantMaterial,
				ogColor = descendantColor,
				ogTransparency = descendantTransparency,
				ogCastShadow = CastShadow
			}
        end
    end

    t2[4].ChamsPartsList[p35.UserId] = t29
end
t2[58] = function()
    local color3_11 = Color3.fromRGB(138, 43, 226)
    local color3_12 = Color3.fromRGB(0, 100, 255)
    local color3_13 = Color3.fromRGB(255, 0, 0)
    local color3_14 = Color3.fromRGB(0, 255, 0)

    return ({
		Purple = color3_11,
		Blue = color3_12,
		Red = color3_13,
		Green = color3_14
	})[t2[3].ChamsColor] or Color3.fromRGB(138, 43, 226)
end
t2[59] = function(p36)
    if not p36 or not p36.Character then
        return
    end

    local Character = p36.Character
    local PH_Chams = Character:FindFirstChild("PH_Chams")

    if PH_Chams then
        pcall(function()
            PH_Chams:Destroy()
        end)
    end

    if not t2[4].ChamsPartsList[p36.UserId] then
        t2[57](p36)
    end

    local v385 = t2[58]()

    for _, descendant in ipairs(Character:GetDescendants()) do
        if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
            if not t2[4].ChamsPartsList[p36.UserId] then
                t2[4].ChamsPartsList[p36.UserId] = {}
            end

            if not t2[4].ChamsPartsList[p36.UserId][descendant] then
                local v388 = t2[4].ChamsPartsList[p36.UserId]
                local descendantMaterial = descendant.Material
                local descendantColor = descendant.Color
                local descendantTransparency = descendant.Transparency
                local CastShadow = descendant.CastShadow

                v388[descendant] = {
					ogMaterial = descendantMaterial,
					ogColor = descendantColor,
					ogTransparency = descendantTransparency,
					ogCastShadow = CastShadow
				}
            end

            descendant.Material = Enum.Material.ForceField
            descendant.Color = v385
            descendant.Transparency = 0
            descendant.CastShadow = false
        end
    end
end
t2[60] = function(p37)
    if not p37 or not p37.Character then
        return
    end

    local PH_Chams = p37.Character:FindFirstChild("PH_Chams")

    if PH_Chams then
        pcall(function()
            PH_Chams:Destroy()
        end)
    end

    local v309 = t2[4].ChamsPartsList[p37.UserId]

    if not v309 then
        return
    end

    for k, v in pairs(v309) do
        local v312 = v

        if k and k.Parent then
            pcall(function()
                k.Material = v312.ogMaterial
                k.Color = v312.ogColor
                k.Transparency = v312.ogTransparency
                k.CastShadow = v312.ogCastShadow
            end)
        end
    end

    t2[4].ChamsPartsList[p37.UserId] = nil
end
t2[61] = function()
    for k, _ in pairs(t2[4].ChamsPartsList) do
        local PlayerByUserId = t1[1]:GetPlayerByUserId(k)

        if PlayerByUserId then
            t2[60](PlayerByUserId)
        end
    end

    t2[4].ChamsPartsList = {}
end
local function v46()
    if t2[3].ChamsEnabled then
        for _, player in ipairs(t1[1]:GetPlayers()) do
            t2[57](player)
            t2[59](player)
        end

        return
    end

    t2[61]()
end
t2[62] = function(p38, p39)
    local v378 = not p38

    if not v378 then
        v378 = not p38.Character
    end

    if v378 then
        return
    end

    local Character = p38.Character
    local PH_ESP = Character:FindFirstChild("PH_ESP")

    if not PH_ESP then
        PH_ESP = Instance.new("Highlight")
        PH_ESP.Name = "PH_ESP"
        PH_ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        PH_ESP.Parent = Character
    end

    PH_ESP.FillColor = p39
    PH_ESP.OutlineColor = p39
    PH_ESP.FillTransparency = 0.4
    PH_ESP.OutlineTransparency = 0
    PH_ESP.Enabled = true
    t2[4].Highlights[p38.UserId] = PH_ESP
end
t2[63] = function(p40)
    if not p40 or not p40.Character then
        return
    end

    local PH_ESP = p40.Character:FindFirstChild("PH_ESP")

    if PH_ESP then
        pcall(function()
            PH_ESP:Destroy()
        end)
    end

    t2[4].Highlights[p40.UserId] = nil
end
t2[64] = function()
    for _, v in pairs(t2[4].Highlights) do
        local v367 = v

        if v367 then
            pcall(function()
                v367:Destroy()
            end)
        end
    end

    t2[4].Highlights = {}
end
t2[65] = function(p41)
    if not p41 or p41 == t1[11] then
        return
    end

    if t2[4].Tracers[p41.UserId] then
        return
    end

    local drawing = Drawing.new("Line")

    drawing.Thickness = 2
    drawing.Transparency = 0.8
    drawing.Visible = false

    local v364 = t2[9](p41)

    drawing.Color = if v364 ~= "Убийца" then if v364 ~= "Шериф" then t2[5].Purple else t2[5].Sheriff else t2[5].Murder
    t2[4].Tracers[p41.UserId] = drawing
end
t2[66] = function()
    if not t2[3].TracersEnabled then
        for _, v in pairs(t2[4].Tracers) do
            v.Visible = false
        end

        return
    end

    local vector2 = Vector2.new(t1[12].ViewportSize.X / 2, t1[12].ViewportSize.Y)

    for k, v in pairs(t2[4].Tracers) do
        local PlayerByUserId = t1[1]:GetPlayerByUserId(k)

        if not PlayerByUserId or not PlayerByUserId.Character then
            v.Visible = false
        else
            local HumanoidRootPart = PlayerByUserId.Character:FindFirstChild("HumanoidRootPart")

            if not HumanoidRootPart then
                v.Visible = false
            else
                local v341, v342 = t1[12]:WorldToViewportPoint(HumanoidRootPart.Position)

                if not v342 then
                    v.Visible = false
                else
                    v.From = vector2
                    v.To = Vector2.new(v341.X, v341.Y)
                    v.Visible = true

                    local v343 = t2[9](PlayerByUserId)

                    v.Color = if v343 ~= "Убийца" then if v343 ~= "Шериф" then t2[5].Purple else t2[5].Sheriff else t2[5].Murder
                end
            end
        end
    end
end
t2[67] = function()
    for _, v in pairs(t2[4].Tracers) do
        local v370 = v

        pcall(function()
            v370:Remove()
        end)
    end

    t2[4].Tracers = {}
end
t2[68] = function()
    local Character = t1[11].Character

    if not Character then
        return
    end

    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        return
    end

    if t2[4].TrailAttachments.trail and t2[4].TrailAttachments.trail.Parent then
        return
    end

    local Attachment = Instance.new("Attachment")

    Attachment.Position = Vector3.new(-1, 0, 0)
    Attachment.Parent = HumanoidRootPart

    local Attachment2 = Instance.new("Attachment")

    Attachment2.Position = Vector3.new(1, 0, 0)
    Attachment2.Parent = HumanoidRootPart

    local Trail = Instance.new("Trail")

    Trail.Attachment0 = Attachment
    Trail.Attachment1 = Attachment2
    Trail.Lifetime = 0.8
    Trail.MinLength = 0
    Trail.FaceCamera = true
    Trail.LightEmission = 1
    Trail.LightInfluence = 0
    Trail.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(1, 1)
	})
    Trail.Color = ColorSequence.new(t2[5].Purple)
    Trail.Parent = HumanoidRootPart
    t2[4].TrailAttachments = {
		trail = Trail,
		att1 = Attachment,
		att2 = Attachment2
	}
end
t2[69] = function()
    if t2[4].TrailAttachments.trail then
        pcall(function()
            t2[4].TrailAttachments.trail:Destroy()
        end)
    end

    if t2[4].TrailAttachments.att1 then
        pcall(function()
            t2[4].TrailAttachments.att1:Destroy()
        end)
    end

    if t2[4].TrailAttachments.att2 then
        pcall(function()
            t2[4].TrailAttachments.att2:Destroy()
        end)
    end

    t2[4].TrailAttachments = {}
end
t2[70] = function(p42)
    t1[5].Brightness = not p42 and 1 or 1.5
end
t2[71] = function(p43)
    t1[5].Ambient = p43 and t2[5].Purple or Color3.fromRGB(0, 0, 0)
    t1[5].OutdoorAmbient = p43 and t2[5].Purple or Color3.fromRGB(0, 0, 0)
end
t2[72] = function(p44)
    if p44 then
        if t2[4].PostEffects.vignette then
            return
        end

        local ScreenGui = Instance.new("ScreenGui")

        ScreenGui.Name = "VignetteEffect"
        ScreenGui.ResetOnSpawn = false
        ScreenGui.IgnoreGuiInset = true

        local Frame = Instance.new("Frame")

        Frame.Size = UDim2.new(1, 0, 1, 0)
        Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Frame.BackgroundTransparency = 0.5
        Frame.BorderSizePixel = 0
        Frame.Parent = ScreenGui
        ScreenGui.Parent = t1[11]:WaitForChild("PlayerGui")
        t2[4].PostEffects.vignette = ScreenGui

        return
    end

    if t2[4].PostEffects.vignette then
        pcall(function()
            t2[4].PostEffects.vignette:Destroy()
        end)
        t2[4].PostEffects.vignette = nil
    end
end
local t30 = {
	Bk = "rbxassetid://15502511288",
	Dn = "rbxassetid://15502508460",
	Ft = "rbxassetid://15502510289",
	Lf = "rbxassetid://15502507918",
	Rt = "rbxassetid://15502509398",
	Up = "rbxassetid://15502511911"
}
local t31 = {
	Bk = "http://www.roblox.com/asset/?id=16553658937",
	Dn = "http://www.roblox.com/asset/?id=16553660713",
	Ft = "http://www.roblox.com/asset/?id=16553662144",
	Lf = "http://www.roblox.com/asset/?id=16553664042",
	Rt = "http://www.roblox.com/asset/?id=16553665766",
	Up = "http://www.roblox.com/asset/?id=16553667750"
}
local t32 = {
	Bk = "http://www.roblox.com/asset/?id=155657655",
	Dn = "http://www.roblox.com/asset/?id=155674246",
	Ft = "http://www.roblox.com/asset/?id=155657609",
	Lf = "http://www.roblox.com/asset/?id=155657671",
	Rt = "http://www.roblox.com/asset/?id=155657619",
	Up = "http://www.roblox.com/asset/?id=155674931"
}
local t33 = {
	Bk = "rbxassetid://15536110634",
	Dn = "rbxassetid://15536112543",
	Ft = "rbxassetid://15536116141",
	Lf = "rbxassetid://15536114370",
	Rt = "rbxassetid://15536118762",
	Up = "rbxassetid://15536117282"
}
local t34 = {
	Bk = "rbxassetid://653719502",
	Dn = "rbxassetid://653718790",
	Ft = "rbxassetid://653719067",
	Lf = "rbxassetid://653719190",
	Rt = "rbxassetid://653718931",
	Up = "rbxassetid://653719321"
}
local t35 = {
	Bk = "http://www.roblox.com/asset/?id=18703245834",
	Dn = "http://www.roblox.com/asset/?id=18703243349",
	Ft = "http://www.roblox.com/asset/?id=18703240532",
	Lf = "http://www.roblox.com/asset/?id=18703237556",
	Rt = "http://www.roblox.com/asset/?id=18703235430",
	Up = "http://www.roblox.com/asset/?id=18703232671"
}
local t36 = {
	Bk = "rbxassetid://12216109205",
	Dn = "rbxassetid://12216109875",
	Ft = "rbxassetid://12216109489",
	Lf = "rbxassetid://12216110170",
	Rt = "rbxassetid://12216110471",
	Up = "rbxassetid://12216108877"
}
local t37 = {
	Bk = "rbxassetid://600830446",
	Dn = "rbxassetid://600831635",
	Ft = "rbxassetid://600832720",
	Lf = "rbxassetid://600886090",
	Rt = "rbxassetid://600833862",
	Up = "rbxassetid://600835177"
}
local t38 = {
	Bk = "http://www.roblox.com/asset/?id=166509999",
	Dn = "http://www.roblox.com/asset/?id=166510057",
	Ft = "http://www.roblox.com/asset/?id=166510116",
	Lf = "http://www.roblox.com/asset/?id=166510092",
	Rt = "http://www.roblox.com/asset/?id=166510131",
	Up = "http://www.roblox.com/asset/?id=166510114"
}
local t39 = {
	Bk = "rbxasset://textures/sky/sky512_bk.tex",
	Dn = "rbxasset://textures/sky/sky512_dn.tex",
	Ft = "rbxasset://textures/sky/sky512_ft.tex",
	Lf = "rbxasset://textures/sky/sky512_lf.tex",
	Rt = "rbxasset://textures/sky/sky512_rt.tex",
	Up = "rbxasset://textures/sky/sky512_up.tex"
}
local t40 = {
	Bk = "http://www.roblox.com/asset/?id=401664839",
	Dn = "http://www.roblox.com/asset/?id=401664862",
	Ft = "http://www.roblox.com/asset/?id=401664960",
	Lf = "http://www.roblox.com/asset/?id=401664881",
	Rt = "http://www.roblox.com/asset/?id=401664901",
	Up = "http://www.roblox.com/asset/?id=401664936"
}
local t41 = {
	Bk = "http://www.roblox.com/asset/?id=151165214",
	Dn = "http://www.roblox.com/asset/?id=151165197",
	Ft = "http://www.roblox.com/asset/?id=151165224",
	Lf = "http://www.roblox.com/asset/?id=151165191",
	Rt = "http://www.roblox.com/asset/?id=151165206",
	Up = "http://www.roblox.com/asset/?id=151165227"
}
local t42 = {
	Bk = "rbxassetid://264908339",
	Dn = "rbxassetid://264907909",
	Ft = "rbxassetid://264909420",
	Lf = "rbxassetid://264909758",
	Rt = "rbxassetid://264908886",
	Up = "rbxassetid://264907379"
}
local t43 = {
	Bk = "http://www.roblox.com/asset/?id=12064107",
	Dn = "http://www.roblox.com/asset/?id=12064152",
	Ft = "http://www.roblox.com/asset/?id=12064121",
	Lf = "http://www.roblox.com/asset/?id=12063984",
	Rt = "http://www.roblox.com/asset/?id=12064115",
	Up = "http://www.roblox.com/asset/?id=12064131"
}
local t44 = {
	Bk = "rbxassetid://16648590964",
	Dn = "rbxassetid://16648617436",
	Ft = "rbxassetid://16648595424",
	Lf = "rbxassetid://16648566370",
	Rt = "rbxassetid://16648577071",
	Up = "rbxassetid://16648598180"
}
local t45 = {
	Bk = "rbxassetid://15983968922",
	Dn = "rbxassetid://15983966825",
	Ft = "rbxassetid://15983965025",
	Lf = "rbxassetid://15983967420",
	Rt = "rbxassetid://15983966246",
	Up = "rbxassetid://15983964246"
}
local t46 = {
	Bk = "rbxassetid://8735166756",
	Dn = "http://www.roblox.com/asset/?id=8735166707",
	Ft = "http://www.roblox.com/asset/?id=8735231668",
	Lf = "http://www.roblox.com/asset/?id=8735166755",
	Rt = "http://www.roblox.com/asset/?id=8735166751",
	Up = "http://www.roblox.com/asset/?id=8735166729"
}
t2[73] = {
	["Black Storm"] = t30,
	HD = t31,
	Snow = t32,
	["Blue Space"] = t33,
	Realistic = t34,
	Stormy = t35,
	Pink = t36,
	Sunset = t37,
	Space = t38,
	["Roblox Default"] = t39,
	["Red Night"] = t40,
	["Pink Skies"] = t41,
	["Purple Sunset"] = t42,
	["Blue Night"] = t43,
	Summer = t44,
	Galaxy = t45,
	Minecraft = t46
}
local Sky = t1[5]:FindFirstChildOfClass("Sky")
local t47 = {}
if Sky then
    t47.SkyboxBk = Sky.SkyboxBk
    t47.SkyboxDn = Sky.SkyboxDn
    t47.SkyboxFt = Sky.SkyboxFt
    t47.SkyboxLf = Sky.SkyboxLf
    t47.SkyboxRt = Sky.SkyboxRt
    t47.SkyboxUp = Sky.SkyboxUp
end
t2[74] = function(p45)
    local v409 = t2[73][p45]

    if not v409 then
        local v410 = tostring(p45):gsub("%s+", ""):gsub("rbxassetid://", "")

        if v410:match("^%d+$") then
            local v411 = "rbxassetid://" .. v410

            for _, child in ipairs(t1[5]:GetChildren()) do
                if child:IsA("Sky") then
                    child:Destroy()
                end
            end

            local Sky2 = Instance.new("Sky")

            Sky2.SkyboxBk = v411
            Sky2.SkyboxDn = v411
            Sky2.SkyboxFt = v411
            Sky2.SkyboxLf = v411
            Sky2.SkyboxRt = v411
            Sky2.SkyboxUp = v411
            Sky2.Parent = t1[5]
            t2[2]("Небо", "Загружено: " .. v410, 2)

            return
        end

        t2[2]("Небо", "Неизвестный скибокс", 2)

        return
    end

    local t48 = {
		v409.Bk,
		v409.Dn,
		v409.Ft,
		v409.Lf,
		v409.Rt,
		v409.Up
	}

    task.spawn(function()
        t1[9]:PreloadAsync(t48)
    end)

    local Sky3 = t1[5]:FindFirstChildOfClass("Sky")

    if not Sky3 then
        Sky3 = Instance.new("Sky")
        Sky3.Name = "Sky"
        Sky3.Parent = t1[5]
    end

    Sky3.SkyboxBk = v409.Bk
    Sky3.SkyboxDn = v409.Dn
    Sky3.SkyboxFt = v409.Ft
    Sky3.SkyboxLf = v409.Lf
    Sky3.SkyboxRt = v409.Rt
    Sky3.SkyboxUp = v409.Up
    t2[2]("Небо", "Загружено: " .. p45, 2)
end
t2[75] = function()
    for _, child in ipairs(t1[5]:GetChildren()) do
        if child:IsA("Sky") then
            child:Destroy()
        end
    end

    t2[2]("Небо", "Удалено", 2)
end
t2[76] = nil
local t49 = {
	BaseMaterial = Enum.Material.Brick,
	Texture = "rbxassetid://10777285622"
}
local t50 = {
	BaseMaterial = Enum.Material.Concrete,
	Texture = "rbxassetid://15622710576"
}
local t51 = {
	BaseMaterial = Enum.Material.CorrodedMetal,
	Texture = "rbxassetid://78612695839404"
}
local t52 = {
	BaseMaterial = Enum.Material.Grass,
	Texture = "rbxassetid://9267183930"
}
local t53 = {
	BaseMaterial = Enum.Material.Metal,
	Texture = "rbxassetid://121650613091353"
}
local t54 = {
	BaseMaterial = Enum.Material.Sand,
	Texture = "rbxassetid://12624140843"
}
local t55 = {
	BaseMaterial = Enum.Material.Slate,
	Texture = "rbxassetid://8676746437"
}
local t56 = {
	BaseMaterial = Enum.Material.Wood,
	Texture = "rbxassetid://3258599312"
}
local WoodPlanks = Enum.Material.WoodPlanks
t2[77] = {
	Brick = t49,
	Concrete = t50,
	CorrodedMetal = t51,
	Grass = t52,
	Metal = t53,
	Sand = t54,
	Slate = t55,
	Wood = t56,
	WoodPlanks = {
		BaseMaterial = WoodPlanks,
		Texture = "rbxassetid://8676581022"
	}
}
local Brick = Enum.Material.Brick
local Concrete = Enum.Material.Concrete
local CorrodedMetal = Enum.Material.CorrodedMetal
local Grass = Enum.Material.Grass
local Metal = Enum.Material.Metal
t2[78] = nil
local Sand = Enum.Material.Sand
local Slate = Enum.Material.Slate
local Wood = Enum.Material.Wood
local WoodPlanks2 = Enum.Material.WoodPlanks
t2[79] = {
	[Brick] = "Brick",
	[Concrete] = "Concrete",
	[CorrodedMetal] = "CorrodedMetal",
	[Grass] = "Grass",
	[Metal] = "Metal",
	[Sand] = "Sand",
	[Slate] = "Slate",
	[Wood] = "Wood",
	[WoodPlanks2] = "WoodPlanks"
}
local Grass2 = Enum.Material.Grass
local color3_15 = Color3.fromRGB(106, 170, 64)
local Ground = Enum.Material.Ground
local color3_16 = Color3.fromRGB(134, 96, 67)
local Mud = Enum.Material.Mud
local fromRGB = Color3.fromRGB
t2[80] = nil
local v90 = fromRGB(102, 76, 51)
local Sand2 = Enum.Material.Sand
local color3_17 = Color3.fromRGB(219, 211, 160)
local Rock = Enum.Material.Rock
local color3_18 = Color3.fromRGB(122, 122, 122)
local Slate2 = Enum.Material.Slate
local color3_19 = Color3.fromRGB(90, 90, 90)
local Snow = Enum.Material.Snow
local color3_20 = Color3.fromRGB(245, 245, 245)
local Water = Enum.Material.Water
local color3_21 = Color3.fromRGB(63, 118, 228)

t2[81] = {
	[Grass2] = color3_15,
	[Ground] = color3_16,
	[Mud] = v90,
	[Sand2] = color3_17,
	[Rock] = color3_18,
	[Slate2] = color3_19,
	[Snow] = color3_20,
	[Water] = color3_21
}
t2[82] = function()
    if t2[4].TextureVariantsBuilt then
        return
    end

    for k, v in pairs(t2[77]) do
        local v452 = k
        local v453 = v
        local u454 = t1[8]:FindFirstChild(v452)

        if not u454 then
            u454 = Instance.new("MaterialVariant")
            u454.Name = v452
            u454.Parent = t1[8]
        end

        pcall(function()
            u454.BaseMaterial = v453.BaseMaterial
            u454.ColorMap = v453.Texture
            u454.MetalnessMap = v453.Texture
            u454.NormalMap = v453.Texture
            u454.RoughnessMap = v453.Texture
            u454.MaterialPattern = Enum.MaterialPattern.Regular
            u454.StudsPerTile = 5
        end)
    end

    t2[4].TextureVariantsBuilt = true
end
t2[83] = function(p46)
    if not t2[4].TextureState[p46] then
        local TextureState = t2[4].TextureState
        local p46Color = p46.Color
        local p46Material = p46.Material
        local MaterialVariant = p46.MaterialVariant

        TextureState[p46] = {
			Color = p46Color,
			Material = p46Material,
			MaterialVariant = MaterialVariant
		}
    end

    return t2[4].TextureState[p46]
end
t2[84] = nil
t2[84] = function(p47)
    if not p47:IsDescendantOf(workspace) then
        return true
    end

    if p47.Name == "LarpticWeather" or p47.Name == "Part" then
        return true
    end

    local p47Parent = p47.Parent

    if p47Parent and p47Parent:IsA("Tool") or p47Parent:IsA("Accessory") then
        return true
    end

    local Model = p47:FindFirstAncestorOfClass("Model")

    if Model and game.Players:GetPlayerFromCharacter(Model) then
        return true
    end

    return false
end
t2[85] = function()
    if not t2[3].TexturePackEnabled then
        return
    end

    t2[82]()

    for _, descendant in ipairs(workspace:GetDescendants()) do
        local v480 = descendant

        if v480:IsA("BasePart") and not t2[84](v480) then
            t2[83](v480)

            local v481 = t2[79][v480.Material]

            if v481 then
                pcall(function()
                    v480.MaterialVariant = v481
                end)
            end
        end
    end

    local Terrain = workspace:FindFirstChildOfClass("Terrain")

    if Terrain then
        for k, v in pairs(t2[81]) do
            local v485 = v

            pcall(function()
                Terrain:SetMaterialColor(k, v485)
            end)
        end
    end
end
t2[86] = function()

    for v488, v489 in pairs(t2[4].TextureState) do

        local v490 = v488
        local v491 = v489

        if v490 and (v490.Parent and v491) then
            pcall(function()
                v490.Color = v491.Color
                v490.Material = v491.Material
                v490.MaterialVariant = v491.MaterialVariant or ""
            end)
        end
    end
    t2[4].TextureState = {}
    for k, _ in pairs(t2[77]) do
        local k2 = t1[8]:FindFirstChild(k)

        if k2 and k2:IsA("MaterialVariant") then
            pcall(function()
                k2:Destroy()
            end)
        end
    end
    t2[4].TextureVariantsBuilt = false
end
t2[87] = function(p48)
    t2[3].TexturePackEnabled = p48

    if p48 then
        t2[85]()
        t2[2]("Texture Pack", "Включен", 2)

        return
    end

    t2[86]()
    t2[2]("Texture Pack", "Выключен", 2)
end
local pi = math.pi
t2[88] = nil
t2[89] = pi * 2
t2[90] = function()
    for i = 1, #t2[4].ChinaHatDrawings do
        local u510 = i
        pcall(function()
            t2[4].ChinaHatDrawings[u510][1]:Remove()
            t2[4].ChinaHatDrawings[u510][2]:Remove()
        end)
    end

    t2[4].ChinaHatDrawings = {}

    for i = 1, t2[3].ChinaHatSides do
        t2[4].ChinaHatDrawings[i] = {
			Drawing.new("Line"),
			Drawing.new("Triangle")
		}
        t2[4].ChinaHatDrawings[i][1].ZIndex = 2
        t2[4].ChinaHatDrawings[i][1].Thickness = 2
        t2[4].ChinaHatDrawings[i][2].ZIndex = 1
        t2[4].ChinaHatDrawings[i][2].Filled = true
    end
end
t2[91] = function()
    if t2[4].ChinaHatParts[t1[11].Character] then
        pcall(function()
            t2[4].ChinaHatParts[t1[11].Character]:Destroy()
        end)
        t2[4].ChinaHatParts[t1[11].Character] = nil
    end
end
t2[92] = function(p49)
    task.wait(0.1)

    local Head = p49:WaitForChild("Head", 5)

    if not Head then
        return
    end

    t2[91]()

    local Part = Instance.new("Part")

    Part.Name = "ChineseHat"
    Part.Transparency = t2[3].ChinaHatTransparency
    Part.Color = t2[3].ChinaHatColor
    Part.Material = Enum.Material.Neon
    Part.CanCollide = false
    Part.Reflectance = t2[3].ChinaHatReflectance

    local SpecialMesh = Instance.new("SpecialMesh")

    SpecialMesh.MeshId = "rbxassetid://1033714"
    SpecialMesh.Scale = Vector3.new(t2[3].ChinaHatRadius, t2[3].ChinaHatHeight, t2[3].ChinaHatRadius)
    SpecialMesh.Parent = Part

    local WeldConstraint = Instance.new("WeldConstraint")

    WeldConstraint.Part0 = Head
    WeldConstraint.Part1 = Part
    WeldConstraint.Parent = Part
    Part.CFrame = Head.CFrame * CFrame.new(0, 1.1, 0)
    Part.Parent = p49
    t2[4].ChinaHatParts[p49] = Part
end
t2[93] = nil
t2[93] = function()
    for k, v in pairs(t2[4].ChinaHatParts) do
        local v498 = v

        if v then
            v498 = v.Parent and k == t1[11].Character
        end

        if v498 then
            v.Transparency = t2[3].ChinaHatTransparency
            v.Reflectance = t2[3].ChinaHatReflectance

            if t2[3].ChinaHatRainbow then
                v.Color = Color3.fromHSV(tick() % t2[3].ChinaHatRainbowSpeed / t2[3].ChinaHatRainbowSpeed, 1, 1)
            else
                v.Color = t2[3].ChinaHatColor
            end

            local SpecialMesh = v:FindFirstChildOfClass("SpecialMesh")

            if SpecialMesh then
                SpecialMesh.Scale = Vector3.new(t2[3].ChinaHatRadius, t2[3].ChinaHatHeight, t2[3].ChinaHatRadius)
            end
        end
    end
end
t2[88] = function(p50)
    t2[3].ChinaHatEnabled = p50

    if p50 then
        t2[90]()

        if t2[3].ChinaHatStyle == "Classic" and t1[11].Character then
            t2[92](t1[11].Character)
        end

        if t2[4].ChinaHatConnection then
            t2[6](t2[4].ChinaHatConnection)
        end

        t2[4].ChinaHatConnection = t1[2].Heartbeat:Connect(function()
            if t2[3].ChinaHatStyle == "Classic" then
                t2[93]()
            end
        end)
        t2[2]("China Hat", "Включен (" .. t2[3].ChinaHatStyle .. ")", 2)

        return
    end

    t2[91]()

    for i = 1, #t2[4].ChinaHatDrawings do
        pcall(function()
            t2[4].ChinaHatDrawings[i][1].Visible = false
            t2[4].ChinaHatDrawings[i][2].Visible = false
        end)
    end

    if t2[4].ChinaHatConnection then
        t2[6](t2[4].ChinaHatConnection)
        t2[4].ChinaHatConnection = nil
    end

    t2[2]("China Hat", "Выключен", 2)
end
t2[94] = function(p51)
    local ChinaHatEnabled = t2[3].ChinaHatEnabled

    t2[3].ChinaHatStyle = p51

    if ChinaHatEnabled then
        t2[88](false)
        task.wait(0.1)
        t2[88](true)
    end

    t2[2]("China Hat", "Стиль: " .. p51, 2)
end
t2[95] = function()
    t2[6](t2[4].RGBConnection)
    t2[4].RGBConnection = nil

    if not t2[3].RGBHumanoid then
        if t1[11].Character then
            for _, descendant in ipairs(t1[11].Character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.Material = Enum.Material.Plastic
                    descendant.Color = Color3.fromRGB(255, 255, 255)
                    descendant.Transparency = 0
                end
            end
        end

        return
    end

    t2[4].RGBConnection = t1[2].Heartbeat:Connect(function()
        if not t1[11].Character then
            return
        end

        local color3_22 = Color3.fromHSV(tick() % 1, 1, 1)

        for _, descendant in ipairs(t1[11].Character:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
                descendant.Material = Enum.Material.ForceField
                descendant.Color = color3_22
                descendant.Transparency = 0.3
            end
        end
    end)
end
t2[96] = function()
    if t2[3].XRayEnabled then
        for _, descendant in ipairs(t1[3]:GetDescendants()) do
            if descendant:IsA("BasePart") and not descendant:IsA("Terrain") then
                t2[4].XRayParts[descendant] = descendant.LocalTransparencyModifier
                descendant.LocalTransparencyModifier = 0.6
            end
        end

        return
    end

    for k, v in pairs(t2[4].XRayParts) do
        local v467 = v

        if k and k.Parent then
            pcall(function()
                k.LocalTransparencyModifier = v467
            end)
        end
    end

    t2[4].XRayParts = {}
end
t2[97] = nil
t2[97] = function(p52)
    local v515 = t2[11](p52)
    local vector3 = Vector3.new(p52.X, v515 + 0.08, p52.Z)
    local Part = Instance.new("Part")
    Part.Shape = Enum.PartType.Cylinder
    Part.Size = Vector3.new(0.08, 0.5, 0.5)
    Part.Material = Enum.Material.Neon
    Part.Color = t2[5].Purple
    Part.Transparency = 0
    Part.Anchored = true
    Part.CanCollide = false
    Part.CastShadow = false
    Part.CFrame = CFrame.new(vector3) * CFrame.Angles(0, 0, 1.5707963267948966)
    Part.Parent = t1[3]
    local PointLight = Instance.new("PointLight")
    PointLight.Brightness = 4
    PointLight.Color = t2[5].Purple
    PointLight.Range = 20
    PointLight.Parent = Part
    local timestamp = tick()
    local connection
    connection = t1[2].Heartbeat:Connect(function()
        if not Part or not Part.Parent then
            t2[6](connection)

            return
        end

        local v699 = (tick() - timestamp) / 0.7

        if v699 >= 1 then
            pcall(function()
                Part:Destroy()
            end)
            t2[6](connection)

            return
        end

        local v700 = 0.5 + v699 * 6

        Part.Size = Vector3.new(0.08, v700, v700)
        Part.Transparency = v699
        Part.CFrame = CFrame.new(vector3) * CFrame.Angles(0, 0, 1.5707963267948966)
        PointLight.Brightness = 4 * (1 - v699)
    end)
end
t2[98] = function()
    if not t2[3].JumpCircles or not t1[11].Character then
        return
    end

    local Humanoid = t1[11].Character:FindFirstChildOfClass("Humanoid")
    local HumanoidRootPart = t1[11].Character:FindFirstChild("HumanoidRootPart")

    if not Humanoid or not HumanoidRootPart then
        return
    end

    local v547 = Humanoid:GetState() == Enum.HumanoidStateType.Jumping

    if v547 and not t2[4].JumpTracking.wasJumping then
        t2[97](HumanoidRootPart.Position)
    end

    t2[4].JumpTracking.wasJumping = v547
end
t2[99] = function()
    local vector2 = Vector2.new(t1[12].ViewportSize.X / 2, t1[12].ViewportSize.Y / 2)
    local v501
    local n3 = 1e999
    for _, player in ipairs(t1[1]:GetPlayers()) do
        if player ~= t1[11] and t2[7](player) and player.Character then
            local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

            if HumanoidRootPart then
                local v506, v507 = t1[12]:WorldToScreenPoint(HumanoidRootPart.Position)

                if v507 and not (v506.Z < 0) then
                    local Magnitude = (vector2 - Vector2.new(v506.X, v506.Y)).Magnitude

                    if Magnitude <= t2[3].FovRadius and Magnitude < n3 then
                        n3 = Magnitude
                        v501 = player
                    end
                end
            end
        end
    end

    return v501
end
t2[100] = function()
    if t2[4].FovCircle then
        pcall(function()
            t2[4].FovCircle:Remove()
        end)
    end

    local drawing = Drawing.new("Circle")

    drawing.Radius = t2[3].FovRadius
    drawing.Color = t2[5].White
    drawing.Thickness = 1.5
    drawing.Transparency = 0.7
    drawing.Filled = false
    drawing.Visible = false
    drawing.NumSides = 64
    t2[4].FovCircle = drawing
end
t2[101] = function()
    t2[6](t2[4].FovConnection)
    t2[4].FovConnection = nil

    if t2[4].FovCircle then
        t2[4].FovCircle.Visible = false
    end

    if not t2[3].FovAimbotEnabled then
        return
    end

    if not t2[4].FovCircle then
        t2[100]()
    end

    local FovCircle = t2[4].FovCircle

    t2[4].FovConnection = t1[2].RenderStepped:Connect(function()
        if not t2[3].FovAimbotEnabled then
            FovCircle.Visible = false

            return
        end

        FovCircle.Position = Vector2.new(t1[12].ViewportSize.X / 2, t1[12].ViewportSize.Y / 2)
        FovCircle.Radius = t2[3].FovRadius
        FovCircle.Visible = true

        local v704 = t2[99]()

        if v704 then
            FovCircle.Color = t2[5].Red
            FovCircle.Thickness = 2

            local HumanoidRootPart = v704.Character:FindFirstChild("HumanoidRootPart")

            if HumanoidRootPart then
                local CFramePosition = t1[12].CFrame.Position
                local cFrame = CFrame.lookAt(CFramePosition, HumanoidRootPart.Position, t1[12].CFrame.UpVector)

                t1[12].CFrame = cFrame

                return
            end
        else
            FovCircle.Color = t2[5].White
            FovCircle.Thickness = 1.5
        end
    end)
end
t2[102] = function(p53)
    if not t1[11].Character then
        return
    end
    local HumanoidRootPart = t1[11].Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return
    end
    local v470
    local n4 = 1e999
    for v474, v475 in ipairs(t1[1]:GetPlayers()) do

        if v475 ~= t1[11] and v475.Character and (p53 == "Убийца" and t2[7](v475) or p53 == "Шериф" and t2[8](v475)) then
            local Magnitude = (HumanoidRootPart.Position - v475.Character.HumanoidRootPart.Position).Magnitude

            if Magnitude < n4 then
                n4 = Magnitude
                v470 = v475
            end
        end
    end
    if not v470 then
        t2[2]("Телепорт", p53 .. " не найден", 2)

        return
    end
    local HumanoidRootPart6 = v470.Character:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart6 then
        HumanoidRootPart.CFrame = HumanoidRootPart6.CFrame * CFrame.new(0, 3, 2)
        t2[2]("Телепорт", "Телепорт к " .. p53, 2)
    end
end
t2[80] = nil
t2[103] = function()
    t2[6](t2[80])
    t2[80] = nil

    if not t2[3].AntiAFKEnabled then
        return
    end

    t2[80] = t1[2].Heartbeat:Connect(function()
        if not t1[11].Character then
            return
        end

        if tick() - 0 > 60 then
            local Humanoid = t1[11].Character:FindFirstChildOfClass("Humanoid")

            if Humanoid then
                Humanoid.Jump = true
            end
        end
    end)
end
t2[104] = function()
    local ok, result = pcall(function()
        return t1[11].PlayerGui.MainGUI.Game.CoinBags.Container.Coin.CurrencyFrame.Icon.Coins.Text
    end)

    if ok then
        ok = tonumber(result) or 0
    end

    return ok or 0
end
t2[105] = function()
    local t57 = {}
    local v427 = t1[11].Character and t1[11].Character:FindFirstChild("HumanoidRootPart")

    if not v427 then
        return t57
    end

    for _, child in pairs(t1[3]:GetChildren()) do
        local CoinContainer = child:FindFirstChild("CoinContainer")

        if CoinContainer then
            local GetChildren = CoinContainer.GetChildren

            for _, v in pairs(GetChildren(CoinContainer)) do
                if v.Name == "Coin_Server" and (v:IsA("BasePart") and v:FindFirstChild("TouchInterest")) then
                    local insert = table.insert
                    local Magnitude = (v427.Position - v.Position).Magnitude

                    insert(t57, {
						part = v,
						distance = Magnitude
					})
                end
            end
        end
    end

    table.sort(t57, function(p54, p55)
        return p54.distance < p55.distance
    end)

    return t57
end
t2[106] = function(p56)
    if not p56 or (not p56.Parent or not p56:FindFirstChild("TouchInterest")) then
        return false
    end
    local Character = t1[11].Character
    if not Character then
        return false
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if not HumanoidRootPart or not Humanoid then
        return false
    end
    local v440 = p56.Position + Vector3.new(0, 2, 0)
    if (HumanoidRootPart.Position - v440).Magnitude < 5 then
        return true
    end
    if t2[4].CurrentTween then
        pcall(function()
            t2[4].CurrentTween:Cancel()
        end)
    end
    t2[4].CurrentTween = t1[6]:Create(HumanoidRootPart, TweenInfo.new((HumanoidRootPart.Position - v440).Magnitude / t2[3].AutoFarmSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		CFrame = CFrame.new(v440)
	})
    Humanoid.Sit = true
    t2[4].CurrentTween:Play()
    local u441 = false
    local connection
    connection = t2[4].CurrentTween.Completed:Connect(function()
        u441 = true
        t2[6](connection)
    end)
    local timestamp = tick()
    repeat
        if not (not u441 and t2[3].AutoFarmEnabled) then
            Humanoid.Sit = false

            return u441
        end

        task.wait(0.1)

        if not p56 or (not p56.Parent or not p56:FindFirstChild("TouchInterest")) then
            if t2[4].CurrentTween then
                pcall(function()
                    t2[4].CurrentTween:Cancel()
                end)
            end

            Humanoid.Sit = false

            return false
        end
    until tick() - timestamp > 30
    if t2[4].CurrentTween then
        pcall(function()
            t2[4].CurrentTween:Cancel()
        end)
    end
    Humanoid.Sit = false

    return false
end
t2[107] = nil
t2[107] = function(p57)
    if not p57 or not p57.Parent then
        return
    end

    local v425 = t1[11].Character and t1[11].Character:FindFirstChild("HumanoidRootPart")

    if not v425 then
        return
    end

    pcall(function()
        firetouchinterest(v425, p57, 0)
        task.wait(0.05)
        firetouchinterest(v425, p57, 1)
    end)
end
t2[108] = function()
    while t2[3].AutoFarmEnabled do
        if t1[11].Character then
            local v549 = t2[104]()

            if not (v549 >= t2[3].AutoFarmCoinLimit) then
                local v550 = t2[105]()

                if #v550 == 0 then
                    task.wait(2)
                else
                    if t2[106](v550[1].part) and t2[3].AutoFarmEnabled then
                        t2[107](v550[1].part)
                        task.wait(t2[3].AutoFarmCoinDelay)
                    end

                    task.wait(0.1)
                end

                continue
            end

            if t2[3].AutoRespawn then
                t2[2]("Авто фарм", "Респавн... (" .. v549 .. " монет)", 2)

                local Character = t1[11].Character

                if Character then
                    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

                    if Humanoid then
                        Humanoid.Health = 0
                    end
                end

                task.wait(5)

                continue
            end

            t2[3].AutoFarmEnabled = false
            t2[2]("Авто фарм", "Сумка полна - остановлено", 3)

            break
        end

        task.wait(1)
    end

    t2[4].AutoFarmConn = nil
end
t2[109] = function()
    if t2[3].AutoFarmEnabled then
        if not t1[11].Character then
            return
        end

        t2[4].AutoFarmConn = task.spawn(t2[108])
        t2[2]("Авто фарм", "Запущен", 3)

        return
    end

    if t1[11].Character then
        local Humanoid = t1[11].Character:FindFirstChildOfClass("Humanoid")

        if Humanoid then
            Humanoid.Sit = false
        end
    end

    if t2[4].CurrentTween then
        pcall(function()
            t2[4].CurrentTween:Cancel()
        end)
        t2[4].CurrentTween = nil
    end
end
t2[76] = nil
t2[78] = nil
t2[110] = nil
t2[110] = function()
    t2[6](t2[76])
    t2[76] = nil
    t2[6](t2[78])
    t2[78] = nil
end
t2[111] = function()
    t2[110]()

    if not t2[3].AntiFlingEnabled then
        return
    end

    t1[2].Heartbeat:Connect(function()
        if not t2[3].AntiFlingEnabled then
            t2[110]()

            return
        end
        for v710, v711 in ipairs(t1[1]:GetPlayers()) do

            if v711 ~= t1[11] and v711.Character then
                for _, descendant in ipairs(v711.Character:GetDescendants()) do
                    if descendant:IsA("BasePart") and descendant.CanCollide then
                        descendant.CanCollide = false
                    end
                end
            end
        end
        local Character = t1[11].Character
        if not Character then
            return
        end
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if not HumanoidRootPart then
            return
        end
        if HumanoidRootPart.AssemblyLinearVelocity.Magnitude > 200 then
            HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        end
        if HumanoidRootPart.AssemblyAngularVelocity.Magnitude > 20 then
            HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        end
    end)
    t1[1].PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            task.wait(0.5)

            if not t2[3].AntiFlingEnabled then
                return
            end

            for _, descendant in ipairs(character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.CanCollide = false
                end
            end
        end)
    end)
end
t2[112] = nil
t2[113] = function()
    if t2[4].ShootButton then
        pcall(function()
            t2[4].ShootButton:Destroy()
        end)
        t2[4].ShootButton = nil
    end
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ShootButton"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = t1[11]:WaitForChild("PlayerGui")
    local TextButton = Instance.new("TextButton")
    TextButton.Size = UDim2.new(0, 100, 0, 50)
    TextButton.Position = UDim2.new(0.5, -50, 0.6, 0)
    TextButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TextButton.BackgroundTransparency = 0.15
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.Text = "Выстрел"
    TextButton.TextSize = 18
    TextButton.Font = Enum.Font.GothamBold
    TextButton.BorderSizePixel = 2
    TextButton.BorderColor3 = Color3.fromRGB(60, 60, 60)
    TextButton.BorderTransparency = 0.3
    TextButton.Parent = ScreenGui
    TextButton.ClipsDescendants = true
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = TextButton
    local u420 = false
    local inputPosition
    local TextButtonPosition
    local inputPosition2
    TextButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            u420 = false
            inputPosition = input.Position
            inputPosition2 = input.Position
            TextButtonPosition = TextButton.Position
            TextButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            TextButton.BackgroundTransparency = 0.1
        end
    end)
    TextButton.InputChanged:Connect(function(input)
        if not inputPosition then
            return
        end

        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            local v694 = input.Position - inputPosition

            if v694.Magnitude > 10 then
                u420 = true
            end

            if u420 then
                TextButton.Position = UDim2.new(TextButtonPosition.X.Scale, TextButtonPosition.X.Offset + v694.X, TextButtonPosition.Y.Scale, TextButtonPosition.Y.Offset + v694.Y)
            end
        end
    end)
    TextButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            TextButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            TextButton.BackgroundTransparency = 0.15

            if inputPosition2 and (input.Position - inputPosition2).Magnitude < 10 then
                task.spawn(function()
                    if not t1[11].Character then
                        return
                    end
                    if not t2[10]() then
                        t2[2]("Выстрел", "Оружие не найдено", 2)

                        return
                    end
                    local v722
                    local n5 = 1e999
                    local HumanoidRootPart = t1[11].Character:FindFirstChild("HumanoidRootPart")
                    if not HumanoidRootPart then
                        return
                    end
                    for v727, v728 in ipairs(t1[1]:GetPlayers()) do

                        if v728 ~= t1[11] and v728.Character and (t2[7](v728) and t2[12](v728)) then
                            local HumanoidRootPart7 = v728.Character:FindFirstChild("HumanoidRootPart")

                            if HumanoidRootPart7 then
                                local Magnitude = (HumanoidRootPart.Position - HumanoidRootPart7.Position).Magnitude

                                if Magnitude < n5 then
                                    v722 = v728
                                    n5 = Magnitude
                                end
                            end
                        end
                    end
                    if not v722 then
                        t2[2]("Выстрел", "Убийца не найден", 2)

                        return
                    end
                    local HumanoidRootPart8 = v722.Character:FindFirstChild("HumanoidRootPart")
                    if not HumanoidRootPart8 then
                        return
                    end
                    local CFramePosition = t1[12].CFrame.Position
                    local HumanoidRootPart8Position = HumanoidRootPart8.Position
                    t2[13](CFramePosition, HumanoidRootPart8Position, Color3.fromRGB(180, 50, 255), 0.2)
                    local AssemblyLinearVelocity = HumanoidRootPart8.AssemblyLinearVelocity
                    local v735 = HumanoidRootPart8.Position + Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z) * 0.1
                    t1[12].CFrame = CFrame.lookAt(t1[12].CFrame.Position, v735)
                    pcall(function()
                        t1[7]:SendKeyEvent(true, Enum.KeyCode.MouseButton1, false, game)
                        task.wait(0.05)
                        t1[7]:SendKeyEvent(false, Enum.KeyCode.MouseButton1, false, game)
                    end)
                end)
            end
        end
    end)
    t2[4].ShootButton = ScreenGui

    return ScreenGui
end
t2[114] = function(p58)
    t2[3].ShootButtonEnabled = p58

    if p58 then
        t2[113]()

        return
    end

    if t2[4].ShootButton then
        pcall(function()
            t2[4].ShootButton:Destroy()
        end)
        t2[4].ShootButton = nil
    end
end
t2[115] = function()
    for _, player in ipairs(t1[1]:GetPlayers()) do
        if player == t1[11] then
            if t2[3].ChamsEnabled then
                t2[59](player)
            elseif t2[4].ChamsPartsList[player.UserId] then
                t2[60](player)
            end
        elseif player.Character then
            local v446 = t2[9](player)

            if t2[3].MurderESP and v446 == "Убийца" then
                t2[62](player, t2[5].Murder)
            elseif t2[3].SheriffESP and v446 == "Шериф" then
                t2[62](player, t2[5].Sheriff)
            elseif t2[3].InnocentESP and v446 == "Невинный" then
                t2[62](player, t2[5].Innocent)
            else
                t2[63](player)
            end

            if t2[3].ChamsEnabled then
                t2[59](player)
            elseif t2[4].ChamsPartsList[player.UserId] then
                t2[60](player)
            end
        end
    end
end
t2[116] = function()
    if t2[4].mainConn then
        t2[6](t2[4].mainConn)
        t2[4].mainConn = nil
    end

    t2[4].mainConn = t1[2].Heartbeat:Connect(function()
        local MurderESP = t2[3].MurderESP

        if not MurderESP then
            MurderESP = t2[3].SheriffESP

            if not MurderESP then
                MurderESP = t2[3].InnocentESP

                if not MurderESP then
                    MurderESP = t2[3].ChamsEnabled or (t2[3].Trails or t2[3].TracersEnabled)
                end
            end
        end

        if MurderESP then
            t2[115]()
        end

        if t2[3].TracersEnabled then
            t2[66]()
        end

        if t2[3].JumpCircles then
            t2[98]()
        end
    end)
end
local v102 = t2[1]:Tab({
	Title = "Визуал",
	Icon = "eye"
})
local v103 = v102:Section({
	Title = "ESP",
	Side = "Left"
})
v103:Toggle({
	Title = "ESP Убийца",
	Default = false,
	Callback = function(p59)
    t2[3].MurderESP = p59
    t2[116]()
end
})
v103:Toggle({
	Title = "ESP Шериф",
	Default = false,
	Callback = function(p60)
    t2[3].SheriffESP = p60
    t2[116]()
end
})
v103:Toggle({
	Title = "ESP Невинный",
	Default = false,
	Callback = function(p61)
    t2[3].InnocentESP = p61
    t2[116]()
end
})
local v104 = v102:Section({
	Title = "Chams",
	Side = "Right"
})
v104:Toggle({
	Title = "Включить Chams",
	Default = false,
	Callback = function(p62)
    t2[3].ChamsEnabled = p62
    v46()
    t2[116]()
end
})
v104:Input({
	Title = "Цвет Chams",
	Default = "Purple",
	Placeholder = "Purple, Blue, Red, Green",
	Callback = function(p63)
    if p63 == "Purple" or (p63 == "Blue" or (p63 == "Red" or p63 == "Green")) then
        t2[3].ChamsColor = p63

        if t2[3].ChamsEnabled then
            v46()

            return
        end
    else
        t2[2]("Chams", "Доступные цвета: Purple, Blue, Red, Green", 3)
    end
end
})
v104:Toggle({
	Title = "RGB Humanoid (отдельно)",
	Default = false,
	Callback = function(p64)
    t2[3].RGBHumanoid = p64
    t2[95]()
end
})
v103:Toggle({
	Title = "Трассеры",
	Default = false,
	Callback = function(p65)
    t2[3].TracersEnabled = p65

    if p65 then
        for _, player in ipairs(t1[1]:GetPlayers()) do
            if player ~= t1[11] then
                t2[65](player)
            end
        end
    else
        t2[67]()
    end

    t2[116]()
end
})
local v105 = v102:Section({
	Title = "World",
	Side = "Left"
})
v105:Toggle({
	Title = "Texture Pack",
	Default = false,
	Callback = function(p66)
    t2[87](p66)
end
})
v105:Toggle({
	Title = "Орбизы / Снег",
	Default = false,
	Callback = function(p67)
    t2[3].OrbizEnabled = p67
    t2[32]()

    local v569 = t2[2]

    if p67 then
        p67 = "Включены"
    end

    v569("Орбизы", p67 or "Выключены", 2)
end
})
local v106 = v102:Section({
	Title = "Аура",
	Side = "Right"
})
v106:Toggle({
	Title = "Включить ауру",
	Default = false,
	Callback = function(p68)
    t2[21](p68)
end
})
for _, v in ipairs(t2[15]) do
    local v109 = v

    v106:Toggle({
		Title = v109:upper(),
		Default = false,
		Callback = function(p69)
        t2[16][v109] = p69

        if t2[3].AuraEnabled then
            t2[20]()
        end
    end
	})
end
v106:Input({
	Title = "Цвет (R,G,B)",
	Default = "133,220,255",
	Placeholder = "133,220,255",
	Callback = function(p70)
    local t58 = {}
    for v576 in p70:gmatch("[^,]+") do

        table.insert(t58, (tonumber(v576)))
    end
    if #t58 == 3 then
        t2[3].AuraColor = Color3.fromRGB(t58[1], t58[2], t58[3])

        if t2[3].AuraEnabled then
            t2[20]()
        end
    end
end
})
local v110 = t2[1]:Tab({
	Title = "Эффекты",
	Icon = "sparkles"
})
local v111 = v110:Section({
	Title = "Эффекты",
	Side = "Left"
})
local v112 = v110:Section({
	Title = "Мир",
	Side = "Right"
})
v111:Toggle({
	Title = "Круги прыжка",
	Default = false,
	Callback = function(p71)
    t2[3].JumpCircles = p71
    t2[116]()
end
})
v111:Toggle({
	Title = "Фиолетовый след",
	Default = false,
	Callback = function(p72)
    t2[3].Trails = p72

    if p72 then
        t2[68]()
    else
        t2[69]()
    end

    t2[116]()
end
})
v111:Toggle({
	Title = "XRay",
	Default = false,
	Callback = function(p73)
    t2[3].XRayEnabled = p73
    t2[96]()
end
})
v111:Toggle({
	Title = "Bloom",
	Default = false,
	Callback = function(p74)
    t2[3].BloomEnabled = p74
    t2[70](p74)
end
})
v111:Toggle({
	Title = "Цветокоррекция",
	Default = false,
	Callback = function(p75)
    t2[3].ColorCorrectionEnabled = p75
    t2[71](p75)
end
})
v111:Toggle({
	Title = "Виньетка",
	Default = false,
	Callback = function(p76)
    t2[3].VignetteEnabled = p76
    t2[72](p76)
end
})
local v113 = v110:Section({
	Title = "China Hat",
	Side = "Left"
})
v113:Toggle({
	Title = "Включить",
	Default = false,
	Callback = function(p77)
    t2[88](p77)
end
})
v113:Input({
	Title = "Стиль (Classic/Drawing)",
	Default = "Classic",
	Placeholder = "Classic или Drawing",
	Callback = function(p78)
    if p78 == "Classic" or p78 == "Drawing" then
        t2[94](p78)

        return
    end

    t2[2]("China Hat", "Доступно: Classic, Drawing", 2)
end
})
v113:Input({
	Title = "Прозрачность (0-1)",
	Default = "0.3",
	Placeholder = "0.3",
	Callback = function(p79)
    local num = tonumber(p79)

    if num then
        t2[3].ChinaHatTransparency = math.clamp(num, 0, 1)
    end
end
})
v113:Input({
	Title = "Радиус",
	Default = "2.4",
	Placeholder = "2.4",
	Callback = function(p80)
    local num = tonumber(p80)

    if num then
        t2[3].ChinaHatRadius = math.max(num, 0.5)
    end
end
})
v113:Input({
	Title = "Высота",
	Default = "1.6",
	Placeholder = "1.6",
	Callback = function(p81)
    local num = tonumber(p81)

    if num then
        t2[3].ChinaHatHeight = math.max(num, 0.5)
    end
end
})
v113:Toggle({
	Title = "Радужный режим",
	Default = false,
	Callback = function(p82)
    t2[3].ChinaHatRainbow = p82
end
})
v113:Input({
	Title = "Цвет (R,G,B)",
	Default = "0,255,255",
	Placeholder = "0,255,255",
	Callback = function(p83)
    local t59 = {}
    for v596 in p83:gmatch("[^,]+") do

        table.insert(t59, (tonumber(v596)))
    end
    if #t59 == 3 then
        t2[3].ChinaHatColor = Color3.fromRGB(t59[1], t59[2], t59[3])
    end
end
})
v112:Input({
	Title = "Выбор неба",
	Default = "HD",
	Placeholder = "HD, Space, Galaxy, etc.",
	Callback = function(p84)
    t2[3].CustomSkyId = p84
end
})
v112:Button({
	Title = "Применить небо",
	Callback = function()
    if t2[3].CustomSkyId and t2[3].CustomSkyId ~= "" then
        t2[74](t2[3].CustomSkyId)
    end
end
})
v112:Button({
	Title = "Удалить небо",
	Callback = function()
    t2[75]()
end
})
v112:Button({
	Title = "Космос",
	Callback = function()
    t2[74]("Space")
end
})
v112:Button({
	Title = "Галактика",
	Callback = function()
    t2[74]("Galaxy")
end
})
local v114 = t2[1]:Tab({
	Title = "Рейдж",
	Icon = "sword"
})
local v115 = v114:Section({
	Title = "Движение",
	Side = "Left"
})
local v116 = v114:Section({
	Title = "Полёт",
	Side = "Right"
})
local v117 = v114:Section({
	Title = "Телепорты",
	Side = "Left"
})
local v118 = v114:Section({
	Title = "Действия",
	Side = "Right"
})
v116:Toggle({
	Title = "Полёт",
	Default = false,
	Callback = function(p85)
    t2[26](p85)
end
})
v116:Input({
	Title = "Скорость полёта",
	Default = "50",
	Placeholder = "50",
	Callback = function(p86)
    local num = tonumber(p86)

    if num then
        t2[3].FlySpeed = num
    end
end
})
v115:Toggle({
	Title = "Бани Хоп",
	Default = false,
	Callback = function(p87)
    t2[3].BHopEnabled = p87

    if p87 then
        t2[28]()

        return
    end

    t2[27]()
end
})
v115:Input({
	Title = "Скорость BHop",
	Default = "30",
	Placeholder = "30",
	Callback = function(p88)
    local num = tonumber(p88)

    if num then
        t2[3].BHopSpeed = num
    end
end
})
v115:Toggle({
	Title = "Спин Бот",
	Default = false,
	Callback = function(p89)
    t2[31](p89)
end
})
v115:Input({
	Title = "Скорость спина",
	Default = "9999",
	Placeholder = "9999",
	Callback = function(p90)
    local num = tonumber(p90)

    if num then
        t2[29].Speed = num
    end
end
})
v115:Toggle({
	Title = "Ноклип",
	Default = false,
	Callback = function(p91)
    if p91 then
        if not t2[112] then
            t2[112] = t1[2].Stepped:Connect(function()
                if not t1[11].Character then
                    return
                end

                for _, descendant in ipairs(t1[11].Character:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        descendant.CanCollide = false
                    end
                end
            end)

            return
        end
    elseif t2[112] then
        t2[112]:Disconnect()
    end
end
})
v117:Button({
	Title = "Телепорт к убийце",
	Callback = function()
    t2[102]("Убийца")
end
})
v117:Button({
	Title = "Телепорт к шерифу",
	Callback = function()
    t2[102]("Шериф")
end
})
v118:Button({
	Title = "Grab Gun",
	Callback = function()
    t2[52]()
end
})
local v119 = t2[1]:Tab({
	Title = "Fun",
	Icon = "smile"
}):Section({
	Title = "Приколы",
	Side = "Left"
})
v119:Toggle({
	Title = "Jerk (дёрганье)",
	Default = false,
	Callback = function(p92)
    t2[22](p92)
end
})
v119:Toggle({
	Title = "Анимации",
	Default = false,
	Callback = function(p93)
    t2[46](p93)
end
})
v119:Input({
	Title = "Выбор пачки",
	Default = "",
	Placeholder = "Adidas Sports, Zombie, Ninja, etc.",
	Callback = function(p94)
    if t2[44][p94] then
        t2[3].AnimPack = p94

        if t2[3].AnimPackEnabled then
            t2[45](p94)
            t2[2]("Анимации", "Применено: " .. p94, 2)

            return
        end
    else
        t2[2]("Анимации", "Пачка не найдена!", 2)
    end
end
})
local v120 = t2[1]:Tab({
	Title = "Комбат",
	Icon = "crosshair"
})
local v121 = v120:Section({
	Title = "Комбат",
	Side = "Left"
})
local v122 = v120:Section({
	Title = "Аимбот",
	Side = "Right"
})
v121:Toggle({
	Title = "Кнопка выстрела",
	Default = false,
	Callback = function(p95)
    t2[114](p95)
end
})
v121:Toggle({
	Title = "Sheriff AutoShoot",
	Default = false,
	Callback = function(p96)
    t2[54](p96)
end
})
v121:Toggle({
	Title = "Защита от флинга",
	Default = false,
	Callback = function(p97)
    t2[3].AntiFlingEnabled = p97
    t2[111]()
end
})
v121:Toggle({
	Title = "Wall Hop (Infinity Jump)",
	Default = false,
	Callback = function(p98)
    t2[56](p98)
end
})
v121:Toggle({
	Title = "Kill All (убийца)",
	Default = false,
	Callback = function(p99)
    t2[43](p99)
end
})
v122:Toggle({
	Title = "FOV Аимбот",
	Default = false,
	Callback = function(p100)
    t2[3].FovAimbotEnabled = p100

    if p100 then
        t2[100]()
    end

    t2[101]()
end
})
v122:Input({
	Title = "Радиус FOV",
	Default = "120",
	Placeholder = "120",
	Callback = function(p101)
    local num = tonumber(p101)

    if num then
        t2[3].FovRadius = math.clamp(num, 10, 600)

        if t2[4].FovCircle then
            t2[4].FovCircle.Radius = t2[3].FovRadius
        end
    end
end
})
v122:Toggle({
	Title = "Silent Aim (убийца)",
	Default = false,
	Callback = function(p102)
    t2[39](p102)
end
})
v122:Input({
	Title = "FOV Silent Aim",
	Default = "120",
	Placeholder = "120",
	Callback = function(p103)
    local num = tonumber(p103)

    if num then
        t2[3].SilentAimFov = math.clamp(num, 10, 600)

        if t2[4].SilentAimCircle then
            t2[4].SilentAimCircle.Radius = t2[3].SilentAimFov
        end
    end
end
})
v122:Toggle({
	Title = "Teleport Gun",
	Default = false,
	Callback = function(p104)
    t2[49](p104)
end
})
v122:Input({
	Title = "Хоткей Teleport Gun",
	Default = "T",
	Placeholder = "T, G, F, etc.",
	Callback = function(p105)
    t2[3].TeleportGunKey = p105

    if t2[3].TeleportGunEnabled then
        t2[48](p105)
    end
end
})
local v123 = t2[1]:Tab({
	Title = "Авто фарм",
	Icon = "star"
})
local v124 = v123:Section({
	Title = "Фарм",
	Side = "Left"
})
local v125 = v123:Section({
	Title = "Настройки",
	Side = "Right"
})
v124:Toggle({
	Title = "Авто фарм",
	Default = false,
	Callback = function(p106)
    t2[3].AutoFarmEnabled = p106
    t2[109]()
end
})
v124:Toggle({
	Title = "Авто респавн",
	Default = true,
	Callback = function(p107)
    t2[3].AutoRespawn = p107
end
})
v125:Input({
	Title = "Скорость фарма",
	Default = "20",
	Placeholder = "20",
	Callback = function(p108)
    local num = tonumber(p108)

    if num then
        t2[3].AutoFarmSpeed = num
    end
end
})
v125:Input({
	Title = "Лимит монет",
	Default = "40",
	Placeholder = "40",
	Callback = function(p109)
    local num = tonumber(p109)

    if num then
        t2[3].AutoFarmCoinLimit = num
    end
end
})
v125:Input({
	Title = "Задержка монет",
	Default = "0.15",
	Placeholder = "0.15",
	Callback = function(p110)
    local num = tonumber(p110)

    if num then
        t2[3].AutoFarmCoinDelay = num
    end
end
})
local v126 = t2[1]:Tab({
	Title = "Разное",
	Icon = "timer"
}):Section({
	Title = "Разное",
	Side = "Left"
})
v126:Toggle({
	Title = "Защита от АФК",
	Default = false,
	Callback = function(p111)
    t2[3].AntiAFKEnabled = p111
    t2[103]()
end
})
v126:Button({
	Title = "Рейджоин",
	Callback = function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, t1[11])
end
})
t1[1].PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(0.5)

        if t2[3].ChamsEnabled then
            t2[57](player)
            t2[59](player)
        end

        if t2[3].TracersEnabled and player ~= t1[11] then
            t2[65](player)
        end

        if t2[3].MurderESP or (t2[3].SheriffESP or t2[3].InnocentESP) then
            local v721 = t2[9](player)

            if t2[3].MurderESP and v721 == "Убийца" then
                t2[62](player, t2[5].Murder)
            elseif t2[3].SheriffESP and v721 == "Шериф" then
                t2[62](player, t2[5].Sheriff)
            elseif t2[3].InnocentESP and v721 == "Невинный" then
                t2[62](player, t2[5].Innocent)
            end
        end

        if t2[3].AntiFlingEnabled and player ~= t1[11] then
            task.spawn(function()
                task.wait(0.5)

                if player.Character then
                    for _, descendant in ipairs(player.Character:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            descendant.CanCollide = false
                        end
                    end
                end
            end)
        end
    end)
end)
t1[1].PlayerRemoving:Connect(function(player)
    t2[4].ChamsPartsList[player.UserId] = nil
    t2[4].Highlights[player.UserId] = nil

    if t2[4].Tracers[player.UserId] then
        pcall(function()
            t2[4].Tracers[player.UserId]:Remove()
        end)
        t2[4].Tracers[player.UserId] = nil
    end
end)
t1[11].CharacterAdded:Connect(function()
    task.wait(0.5)
    t2[64]()
    t2[61]()
    t2[67]()
    t2[4].ChamsPartsList = {}

    for _, player in ipairs(t1[1]:GetPlayers()) do
        if t2[3].ChamsEnabled then
            t2[57](player)
            t2[59](player)
        end

        local TracersEnabled = t2[3].TracersEnabled

        if TracersEnabled then
            TracersEnabled = player ~= t1[11]
        end

        if TracersEnabled then
            t2[65](player)
        end

        if t2[3].MurderESP or (t2[3].SheriffESP or t2[3].InnocentESP) then
            local v638 = t2[9](player)

            if t2[3].MurderESP and v638 == "Убийца" then
                t2[62](player, t2[5].Murder)
            elseif t2[3].SheriffESP and v638 == "Шериф" then
                t2[62](player, t2[5].Sheriff)
            elseif t2[3].InnocentESP and v638 == "Невинный" then
                t2[62](player, t2[5].Innocent)
            end
        end
    end

    t2[95]()
    t2[4].JumpTracking = {
		wasJumping = false
	}

    if t2[3].Trails then
        task.wait(0.1)
        t2[68]()
    end

    if t2[3].FlyEnabled then
        task.wait(0.5)
        t2[25]()
    end

    if t2[3].BHopEnabled then
        t2[28]()
    end

    if t2[3].AntiFlingEnabled then
        t2[111]()
    end

    if t2[3].FovAimbotEnabled then
        t2[101]()
    end

    if t2[3].ShootButtonEnabled then
        t2[113]()
    end

    if t2[3].WallHopEnabled then
        t2[55]()
    end

    if t2[3].SheriffAutoShootEnabled then
        t2[54](true)
    end

    if t2[3].TexturePackEnabled then
        task.wait(0.3)
        t2[85]()
    end

    if t2[3].ChinaHatEnabled then
        task.wait(0.2)

        if t2[3].ChinaHatStyle == "Classic" then
            t2[92](t1[11].Character)
        end
    end

    if t2[3].AuraEnabled then
        task.wait(0.3)
        t2[20]()
    end

    if t2[3].OrbizEnabled then
        task.wait(0.2)
        t2[32]()
    end

    if t2[3].SilentAimEnabled then
        task.wait(0.2)
        t2[37]()
        setupSilentAim()
    end

    if t2[3].KillAllEnabled then
        task.wait(0.2)

        if not t2[4].KillAllRemote then
            t2[40]()
        end

        t2[42]()
    end

    if t2[3].AnimPackEnabled and t2[3].AnimPack ~= "" then
        task.wait(0.3)
        t2[45](t2[3].AnimPack)
    end
end)
t2[116]();
(function()
    for _, player in ipairs(t1[1]:GetPlayers()) do
        local v557 = player

        if v557 ~= t1[11] then
            v557.CharacterRemoving:Connect(function()
                if t2[8](v557) then
                    t2[2]("Шериф", v557.Name .. " мёртв", 3)
                end
            end)
        end
    end

    t1[1].PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            local Humanoid = character:FindFirstChildOfClass("Humanoid")

            if Humanoid then
                Humanoid.Died:Connect(function()
                    if t2[8](player) then
                        t2[2]("Шериф", player.Name .. " мёртв", 3)
                    end
                end)
            end
        end)
    end)
end)()
t2[100]()
t2[90]()
t2[37]()
t2[2]("PlanetHub", "Загружен - Violet тема", 4)

local PlanetHubOverlay = t1[11].PlayerGui:FindFirstChild("PlanetHubOverlay")

if PlanetHubOverlay then
    PlanetHubOverlay:Destroy()
end
local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "PlanetHubOverlay"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = t1[11]:WaitForChild("PlayerGui")
t2[117] = Instance.new("Frame")
t2[117].Name = "Header"
t2[117].Size = UDim2.new(0, 150, 0, 30)
t2[117].Position = UDim2.new(1, -160, 0, 10)
t2[117].BackgroundColor3 = Color3.fromRGB(15, 15, 20)
t2[117].BackgroundTransparency = 0.05
t2[117].BorderSizePixel = 0
t2[117].ClipsDescendants = true
t2[117].Parent = ScreenGui
t2[117].Active = true
t2[117].Draggable = true
local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = t2[117]

local UIStroke = Instance.new("UIStroke")

UIStroke.Color = Color3.fromRGB(40, 40, 50)
UIStroke.Thickness = 1
UIStroke.Transparency = 0.5
UIStroke.Parent = t2[117]

local TextLabel = Instance.new("TextLabel")

TextLabel.Size = UDim2.new(0, 48, 1, 0)
TextLabel.Position = UDim2.new(0, 4, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "PLANET"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 12
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextXAlignment = Enum.TextXAlignment.Center
TextLabel.TextYAlignment = Enum.TextYAlignment.Center
TextLabel.Parent = t2[117]

local Frame = Instance.new("Frame")

Frame.Size = UDim2.new(0, 1, 0, 16)
Frame.Position = UDim2.new(0, 56, 0.5, -8)
Frame.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
Frame.BorderSizePixel = 0
Frame.Parent = t2[117]
t2[118] = Instance.new("TextLabel")
t2[118].Size = UDim2.new(0, 38, 1, 0)
t2[118].Position = UDim2.new(0, 61, 0, 0)
t2[118].BackgroundTransparency = 1
t2[118].Text = "60"
t2[118].TextColor3 = Color3.fromRGB(180, 255, 180)
t2[118].TextSize = 12
t2[118].Font = Enum.Font.GothamMedium
t2[118].TextXAlignment = Enum.TextXAlignment.Center
t2[118].TextYAlignment = Enum.TextYAlignment.Center
t2[118].Parent = t2[117]
t2[119] = 0
t2[120] = tick()
t1[2].RenderStepped:Connect(function()
    t2[119] = t2[119] + 1

    local timestamp = tick()

    if timestamp - t2[120] >= 1 then
        local v640 = math.floor(t2[119] / (timestamp - t2[120]))

        t2[118].Text = v640

        if v640 >= 60 then
            t2[118].TextColor3 = Color3.fromRGB(180, 255, 180)

            return
        end

        if v640 >= 30 then
            t2[118].TextColor3 = Color3.fromRGB(255, 255, 150)

            return
        end

        t2[118].TextColor3 = Color3.fromRGB(255, 150, 150)
    end
end)

local Frame2 = Instance.new("Frame")

Frame2.Size = UDim2.new(0, 1, 0, 16)
Frame2.Position = UDim2.new(0, 103, 0.5, -8)
Frame2.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
Frame2.BorderSizePixel = 0
Frame2.Parent = t2[117]

local TextLabel2 = Instance.new("TextLabel")

TextLabel2.Size = UDim2.new(0, 40, 1, 0)
TextLabel2.Position = UDim2.new(0, 108, 0, 0)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = "Free"
TextLabel2.TextColor3 = Color3.fromRGB(150, 255, 150)
TextLabel2.TextSize = 11
TextLabel2.Font = Enum.Font.GothamMedium
TextLabel2.TextXAlignment = Enum.TextXAlignment.Center
TextLabel2.TextYAlignment = Enum.TextYAlignment.Center
TextLabel2.Parent = t2[117]
t2[121] = true
local TextButton = Instance.new("TextButton")

TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.BackgroundTransparency = 1
TextButton.Text = ""
TextButton.ZIndex = 10
TextButton.Parent = t2[117]
TextButton.MouseButton1Click:Connect(function()
    t2[121] = not t2[121]
    t2[1].Visible = t2[121]
end)
t2[122] = nil
t2[123] = nil
t2[117].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        t2[122] = input.Position
        t2[123] = t2[117].Position
    end
end)
t1[4].InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and t2[122] then
        local v643 = input.Position - t2[122]

        t2[117].Position = UDim2.new(t2[123].X.Scale, t2[123].X.Offset + v643.X, t2[123].Y.Scale, t2[123].Y.Offset + v643.Y)
    end
end)
t1[4].InputEnded:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
    end
end)
t1[4].InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end

    if input.KeyCode == Enum.KeyCode.T then
        t2[121] = not t2[121]
        t2[1].Visible = t2[121]
    end
end)
print("✅ Planet Hub v3.0 ULTIMATE загружен!")
print("✅ Нажми T или кликни на плашку PLANET для открытия меню")
