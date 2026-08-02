local t1 = {}
local v2 = unpack or table.unpack
if getgenv().OnyxHubLoaded then
    warn("⚠ OnyxHubはもう起動しています！")

    return
end
t1[15] = getgenv()
t1[15].OnyxHubLoaded = true
t1[15] = game:GetService("Players")
local v3 = t1[15]
local TweenService = game:GetService("TweenService")
t1[3] = game:GetService("RunService")
local v5 = t1[3]
t1[2] = game:GetService("ReplicatedStorage")
local v6 = t1[2]
game:GetService("UserInputService")
t1[6] = game:GetService("CoreGui")
local v7 = t1[6]
t1[4] = game:GetService("SoundService")
local v8 = t1[4]
t1[5] = game:GetService("Debris")
local v9 = t1[5]
game:GetService("TeleportService")
t1[7] = game:GetService("Stats")
local v10 = t1[7]
t1[7] = v3.LocalPlayer
local v11 = t1[7]
t1[8] = Color3.fromRGB(150, 100, 255)
t1[13] = {
	"Sheriff",
	"Hero",
	"Innocent"
}
local t2 = {
	MAIN_COLOR = t1[8],
	DEFAULT_WALK_SPEED = 16,
	DEFAULT_JUMP_POWER = 50,
	VALID_TARGET_ROLES = t1[13],
	TOGGLE_SPACING = 52,
	BUTTON_HEIGHT = 48,
	SPACING = 8
}
t1[8] = {
	Enabled = false,
	Farming = false,
	BagFull = false,
	Resetting = false,
	StartPosition = nil
}
t1[11] = {
	Enabled = false,
	AttackDelay = 0.5
}
t1[18] = t2.DEFAULT_WALK_SPEED
t1[12] = {
	Enabled = false,
	Value = t1[18]
}
t1[20] = t2.DEFAULT_JUMP_POWER
t1[10] = {
	SpeedWalk = t1[12],
	JumpPower = {
		Enabled = false,
		Value = t1[20]
	}
}
t1[12] = {
	ButtonData = nil,
	Position = nil
}
t1[16] = {
	ButtonData = nil,
	Position = nil
}
t1[18] = {
	ButtonData = nil,
	Position = nil
}
t1[22] = {
	Enabled = false,
	Overlay = nil,
	Position = nil
}
local t3 = {
	AutoFarm = t1[8],
	KillAll = t1[11],
	Movement = t1[10],
	ShootMurderer = t1[12],
	FakeBombJump = t1[16],
	GrabGun = t1[18],
	GUIVisible = true,
	Performance = t1[22],
	AntiFling = {
		Enabled = false,
		Connections = nil
	}
}
local t4 = {
	CoinsCollected = 0,
	StartTime = 0,
	IsRunning = false
}
local t5 = {
	CoinCollected = nil,
	RoundStart = nil,
	RoundEnd = nil
}
t1[9] = ColorSequence.new
t1[14] = ColorSequenceKeypoint.new(0, t2.MAIN_COLOR)
t1[16] = ColorSequenceKeypoint.new(0.3, t2.MAIN_COLOR)
t1[17] = ColorSequenceKeypoint.new(0.7, t2.MAIN_COLOR)
t1[12] = ColorSequenceKeypoint.new
t1[20] = t2.MAIN_COLOR
t1[10] = t1[9]({
	t1[14],
	t1[16],
	t1[17],
	t1[12](1, t1[20])
})
t1[13] = NumberSequence.new
t1[17] = NumberSequenceKeypoint.new(0, 0)
t1[18] = NumberSequenceKeypoint.new(0.2, 0)
t1[19] = NumberSequenceKeypoint.new(0.5, 0.5)
t1[20] = NumberSequenceKeypoint.new(0.8, 0.8)
t1[16] = NumberSequenceKeypoint.new
t1[12] = t1[13]({
	t1[17],
	t1[18],
	t1[19],
	t1[20],
	t1[16](1, 1)
})
local t6 = {
	Color = t1[10],
	Transparency = t1[12]
}
t1[22] = {}
t1[24] = {}
local t7 = {
	ScreenGui = nil,
	OpenCloseGui = nil,
	MainFrame = nil,
	TabButtonsContainer = nil,
	ContentFrame = nil,
	Tabs = t1[22],
	ToggleCallbacks = t1[24],
	ToggleStates = {}
}
local t8 = {}
local t9 = {}
t1[7] = function()
    local Sound = Instance.new("Sound")

    Sound.SoundId = "rbxassetid://138656262630730"
    Sound.Volume = 0.7
    Sound.Parent = v8
    Sound:Play()
    v9:AddItem(Sound, 2)
end
t9.playClickSound = t1[7]
t1[7] = function(p1, p2, p3)
    local v36 = p3 or 5
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://106553517979212"
    Sound.Volume = 0.5
    Sound.Parent = v8
    Sound:Play()
    v9:AddItem(Sound, 3)
    if not t7.ScreenGui then
        local v38 = t7
        local createInstance = t9.createInstance
        local v40 = v7
        local Global = Enum.ZIndexBehavior.Global

        v38.ScreenGui = createInstance("ScreenGui", v40, {
			Name = "MM2GUI",
			ZIndexBehavior = Global,
			ResetOnSpawn = false,
			DisplayOrder = 100
		})
    end
    local function v42()
        for i, v in ipairs(t8) do
            local v831 = v

            if v then
                v831 = v.Parent
            end

            if v831 then
                local v832 = -105 - (#t8 - i) * 85

                TweenService:Create(v, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Position = UDim2.new(1, -300, 1, v832)
				}):Play()
            end
        end
    end
    local function v43(p4)
        local v834 = table.find(t8, p4)

        if v834 then
            table.remove(t8, v834)
            p4:TweenPosition(UDim2.new(1, 300, p4.Position.Y.Scale, p4.Position.Y.Offset), "In", "Quad", 0.4, true, function()
                p4:Destroy()
                v42()
            end)
        end
    end
    if #t8 >= 5 then
        local v44 = t8[1]

        if v44 then
            v43(v44)
            task.wait(0.1)
        end
    end
    local createWithStaticStroke = t9.createWithStaticStroke
    local ScreenGui = t7.ScreenGui
    local uDim2 = UDim2.new(0, 280, 0, 75)
    local uDim2_2 = UDim2.new(1, 20, 1, -105)
    local color3 = Color3.fromRGB(25, 15, 35)
    local v50 = createWithStaticStroke("Frame", ScreenGui, {
		Name = "Notification",
		Size = uDim2,
		Position = uDim2_2,
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.1,
		ZIndex = 100,
		ClipsDescendants = true
	})
    t9.createInstance("UICorner", v50, {
		CornerRadius = UDim.new(0, 10)
	})
    local createInstance = t9.createInstance
    local uDim2_3 = UDim2.new(1, -40, 0, 22)
    local uDim2_4 = UDim2.new(0, 10, 0, 6)
    local MAIN_COLOR = t2.MAIN_COLOR
    local GothamBold = Enum.Font.GothamBold
    local Left = Enum.TextXAlignment.Left
    createInstance("TextLabel", v50, {
		Text = p1,
		Size = uDim2_3,
		Position = uDim2_4,
		BackgroundTransparency = 1,
		TextColor3 = MAIN_COLOR,
		TextSize = 15,
		Font = GothamBold,
		TextXAlignment = Left,
		ZIndex = 101
	})
    local createInstance2 = t9.createInstance
    local uDim2_5 = UDim2.new(1, -40, 0, 28)
    local uDim2_6 = UDim2.new(0, 10, 0, 28)
    local color3_2 = Color3.fromRGB(245, 235, 255)
    local Gotham = Enum.Font.Gotham
    local Left2 = Enum.TextXAlignment.Left
    local Top = Enum.TextYAlignment.Top
    createInstance2("TextLabel", v50, {
		Text = p2,
		Size = uDim2_5,
		Position = uDim2_6,
		BackgroundTransparency = 1,
		TextColor3 = color3_2,
		TextSize = 13,
		Font = Gotham,
		TextWrapped = true,
		TextXAlignment = Left2,
		TextYAlignment = Top,
		RichText = true,
		ZIndex = 101
	})
    local createInstance3 = t9.createInstance
    local uDim2_7 = UDim2.new(1, -70, 0, 3)
    local uDim2_8 = UDim2.new(0, 10, 1, -10)
    local color3_3 = Color3.fromRGB(40, 30, 55)
    local v68 = createInstance3("Frame", v50, {
		Name = "ProgressContainer",
		Size = uDim2_7,
		Position = uDim2_8,
		BackgroundColor3 = color3_3,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		ZIndex = 102
	})
    t9.createInstance("UICorner", v68, {
		CornerRadius = UDim.new(1, 0)
	})
    local createInstance4 = t9.createInstance
    local uDim2_9 = UDim2.new(1, 0, 1, 0)
    local uDim2_10 = UDim2.new(0, 0, 0, 0)
    local MAIN_COLOR2 = t2.MAIN_COLOR
    local v73 = createInstance4("Frame", v68, {
		Name = "ProgressBar",
		Size = uDim2_9,
		Position = uDim2_10,
		BackgroundColor3 = MAIN_COLOR2,
		BorderSizePixel = 0,
		ZIndex = 103
	})
    t9.createInstance("UICorner", v73, {
		CornerRadius = UDim.new(1, 0)
	})
    local createInstance5 = t9.createInstance
    local uDim2_11 = UDim2.new(0, 40, 0, 14)
    local uDim2_12 = UDim2.new(1, -50, 1, -20)
    local v77 = tostring(v36) .. "s"
    local color3_4 = Color3.fromRGB(200, 200, 200)
    local GothamBold2 = Enum.Font.GothamBold
    local Right = Enum.TextXAlignment.Right
    local v81 = createInstance5("TextLabel", v50, {
		Name = "TimeText",
		Size = uDim2_11,
		Position = uDim2_12,
		BackgroundTransparency = 1,
		Text = v77,
		TextColor3 = color3_4,
		TextSize = 11,
		Font = GothamBold2,
		TextXAlignment = Right,
		ZIndex = 102
	})
    local createInstance6 = t9.createInstance
    local uDim2_13 = UDim2.new(0, 24, 0, 24)
    local uDim2_14 = UDim2.new(1, -28, 0, 6)
    local color3_5 = Color3.fromRGB(60, 40, 80)
    local color3_6 = Color3.fromRGB(220, 220, 220)
    local GothamBold3 = Enum.Font.GothamBold
    local v88 = createInstance6("TextButton", v50, {
		Name = "CloseButton",
		Size = uDim2_13,
		Position = uDim2_14,
		BackgroundColor3 = color3_5,
		BackgroundTransparency = 0.3,
		Text = "×",
		TextColor3 = color3_6,
		TextSize = 18,
		Font = GothamBold3,
		ZIndex = 105,
		AutoButtonColor = false
	})
    t9.createInstance("UICorner", v88, {
		CornerRadius = UDim.new(1, 0)
	})
    v88.MouseEnter:Connect(function()
        v88.BackgroundColor3 = Color3.fromRGB(80, 60, 100)
        v88.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    v88.MouseLeave:Connect(function()
        v88.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
        v88.TextColor3 = Color3.fromRGB(220, 220, 220)
    end)
    v88.MouseButton1Click:Connect(function()
        t9.playClickSound()
        v43(v50)
    end)
    table.insert(t8, v50)
    v42()
    local timestamp = tick()
    local connection
    local connection2
    connection = v5.Heartbeat:Connect(function()
        local v835 = not v50

        if not v835 then
            v835 = not v50.Parent
        end

        if v835 then
            if connection then
                connection:Disconnect()
            end

            return
        end

        local v836 = tick() - timestamp
        local v837 = math.max(0, v36 - v836) / v36

        v73.Size = UDim2.new(v837, 0, 1, 0)

        if v837 < 0.3 then
            local v838 = math.sin(tick() * 8) * 0.3 + 0.7

            v73.BackgroundColor3 = Color3.fromRGB(t2.MAIN_COLOR.R * 255 * v838, t2.MAIN_COLOR.G * 255 * v838, t2.MAIN_COLOR.B * 255 * v838)

            return
        end

        v73.BackgroundColor3 = t2.MAIN_COLOR
    end)
    connection2 = v5.Heartbeat:Connect(function()
        local v839 = not v50

        if not v839 then
            v839 = not v50.Parent
        end

        if v839 then
            if connection2 then
                connection2:Disconnect()
            end

            return
        end

        local v840 = tick() - timestamp

        v81.Text = math.ceil((math.max(0, v36 - v840))) .. "s"
    end)
    task.delay(v36, function()
        local v841 = v50

        if v841 then
            v841 = v50.Parent
        end

        if v841 then
            v43(v50)
        end

        if connection then
            connection:Disconnect()
        end

        if connection2 then
            connection2:Disconnect()
        end
    end)

    return v50
end
t9.showNotification = t1[7]
t1[7] = function(p5, p6, p7)
    local v95 = Instance.new(p5, p6)

    for k, v in pairs(p7) do
        v95[k] = v
    end

    return v95
end
t9.createInstance = t1[7]
t1[7] = function(p8)
    if p8 and p8.Parent then
        p8:Destroy()
    end
end
t9.safeDestroy = t1[7]
t1[7] = function(p9)
    if p9 == -1 then
        return ""
    end

    local v100 = math.floor(p9 / 60)
    local v101 = p9 % 60

    return string.format("%dm %ds", v100, v101)
end
t9.secondsToMinutes = t1[7]
t1[7] = function()
    local Character = v11.Character

    if Character then
        Character = v11.Character:FindFirstChild("HumanoidRootPart")
    end

    if Character then
        return v11.Character.HumanoidRootPart
    end

    return nil
end
t9.getHRP = t1[7]
t1[7] = function(p10, p11, p12)
    local createInstance = t9.createInstance
    local uDim2 = UDim2.new(1, 0, 0, p12)
    local uDim2_15 = UDim2.new(0, 0, 0, p11)

    return createInstance("Frame", p10, {
		Name = "Spacer",
		BackgroundTransparency = 1,
		Size = uDim2,
		Position = uDim2_15
	})
end
t9.addSpacer = t1[7]
t1[7] = function(p13, p14)
    local v111 = not p13

    if not v111 then
        v111 = not p14

        if not v111 then
            v111 = not p13:IsA("ScrollingFrame")
        end
    end

    if v111 then
        return
    end

    local n1 = 0

    for _, child in ipairs(p14:GetChildren()) do
        if child:IsA("GuiObject") then
            n1 += child.AbsoluteSize.Y
        end
    end

    p13.CanvasSize = UDim2.new(0, 0, 0, n1 + 100)
    p14.Size = UDim2.new(1, 0, 0, n1 + 80)
end
t9.updateCanvasSize = t1[7]
t1[7] = function(p15)
    local n2 = 0

    for _, child in ipairs(p15:GetChildren()) do
        if child:IsA("GuiObject") then
            n2 = n2 + child.AbsoluteSize.Y + 8
        end
    end

    p15.CanvasSize = UDim2.new(0, 0, 0, n2)
end
t9.updateTabButtonsContainerSize = t1[7]
t1[7] = function()
    local TeleportService = game:GetService("TeleportService")
    local ok, _ = pcall(function()
        local v842 = TeleportService:ReserveServer(game.PlaceId)

        if v842 then
            TeleportService:TeleportToPrivateServer(game.PlaceId, v842, { v11 })

            return
        end

        TeleportService:Teleport(game.PlaceId, v11)
    end)

    if not ok then
        pcall(function()
            TeleportService:Teleport(game.PlaceId, v11)
        end)
    end
end
t9.joinAnotherServer = t1[7]
t1[7] = function()
    local TeleportService = game:GetService("TeleportService")
    local JobId = game.JobId
    local u124 = JobId
    pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, u124, v11)
    end)
end
t9.rejoinServer = t1[7]
t1[7] = function(p16)
    local createInstance = t9.createInstance
    local color3 = Color3.fromRGB(255, 255, 255)
    local Border = Enum.ApplyStrokeMode.Border
    local v129 = createInstance("UIStroke", p16, {
		Thickness = 2,
		Color = color3,
		Transparency = 0,
		ApplyStrokeMode = Border
	})
    local createInstance7 = t9.createInstance
    local t6Color = t6.Color
    local t6Transparency = t6.Transparency

    createInstance7("UIGradient", v129, {
		Color = t6Color,
		Transparency = t6Transparency,
		Rotation = 0
	})

    return v129
end
t9.createStaticStroke = t1[7]
t1[14] = t9
t1[7] = function(p17, p18, p19)
    local v136 = t9.createInstance(p17, p18, p19)
    local v137 = p17 == "Frame"

    if not v137 then
        v137 = p17 == "TextButton" or p17 == "ScrollingFrame"
    end

    if v137 then
        t9.createStaticStroke(v136)
    end

    return v136
end
t1[14].createWithStaticStroke = t1[7]
local t10 = {}
t10.ESP_STATES = {
	ESPName = false,
	MurdererName = true,
	SheriffName = true,
	HeroName = true,
	InnocentName = true
}
t10.ESP_HIGHLIGHT_STATES = {
	ESPHighlight = false,
	ESPHighlightMurderer = true,
	ESPHighlightSheriff = true,
	ESPHighlightHero = true,
	ESPHighlightInnocent = true
}
t10.ESP_LINE_STATES = {
	ESPLine = false,
	MurdererLine = true,
	SheriffLine = true,
	HeroLine = true,
	InnocentLine = true,
	LineThickness = 1.4,
	LineTransparency = 1
}
t1[7] = t10
t1[20] = Color3.fromRGB(255, 0, 0)
t1[22] = Color3.fromRGB(0, 0, 255)
t1[24] = Color3.fromRGB(255, 255, 0)
t1[26] = Color3.fromRGB(0, 255, 0)
t1[7].ROLE_COLORS = {
	Murderer = t1[20],
	Sheriff = t1[22],
	Hero = t1[24],
	Innocent = t1[26]
}
t10.billboards = {}
t10.currentRoles = {}
t1[7] = t10
t1[17] = workspace.CurrentCamera
t1[7].Camera = t1[17]
t10.LineDrawings = {}
t10.MIN_DISTANCE = 5
t10.MAX_DISTANCE = 100
t1[7] = t10
t1[18] = UDim2.new(0, 50, 0, 12)
t1[7].MIN_SIZE = t1[18]
t1[7] = t10
t1[18] = UDim2.new(0, 200, 0, 50)
t1[7].MAX_SIZE = t1[18]
t10.MIN_TEXT_SIZE = 8
t10.MAX_TEXT_SIZE = 18
local t11 = {}
local t12 = {}
t1[7] = function(p20)
    if not t10.Camera then
        return true
    end
    local Character = p20.Character
    if not Character then
        return false
    end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then
        return false
    end
    local v142, t13Result = t10.Camera:WorldToViewportPoint(HumanoidRootPart.Position)
    if t13Result then
        local ViewportSize = t10.Camera.ViewportSize
        local v144 = v142.X >= -50

        if v144 then
            v144 = v142.X <= ViewportSize.X + 50

            if v144 then
                v144 = v142.Y >= -50

                if v144 then
                    v144 = v142.Y <= ViewportSize.Y + 50
                end
            end
        end

        if v144 then
            return true
        end
    end

    return false
end
t10.IsPlayerOnScreen = t1[7]
t1[7] = function(p21)
    if not t10.IsPlayerOnScreen(p21) then
        return false
    end

    return true
end
t10.IsPlayerVisible = t1[7]
t1[7] = function()
    if tick() - 0 < 0.5 then
        return t11
    end

    local ok, result = pcall(function()
        local GetPlayerData = v6:FindFirstChild("GetPlayerData", true)
        local v844 = GetPlayerData

        if GetPlayerData then
            v844 = GetPlayerData:IsA("RemoteFunction")
        end

        if v844 then
            return GetPlayerData:InvokeServer()
        end

        return {}
    end)

    if ok and result then
        t11 = result
    end

    return t11
end
t10.GetRolesData = t1[7]
t1[7] = function(p22, p23)
    if not p23 then
        return false
    end

    local v150 = p23[p22.Name]

    if v150 then
        v150 = not v150.Killed and not v150.Dead
    end

    return v150
end
t10.IsAlive = t1[7]
t1[7] = function(p24, p25)
    if not p25 then
        return nil, false
    end

    local v153 = p25[p24.Name]

    if not v153 then
        return nil, false
    end

    return v153.Role, t10.IsAlive(p24, p25)
end
t10.getPlayerRole = t1[7]
t1[7] = function(p26, p27)
    if not p27 then
        return Color3.fromRGB(150, 150, 150)
    end

    if p26 == "Murderer" then
        return Color3.fromRGB(255, 0, 0)
    end

    if p26 == "Sheriff" then
        return Color3.fromRGB(0, 0, 255)
    end

    if p26 == "Hero" then
        return Color3.fromRGB(255, 255, 0)
    end

    if p26 == "Innocent" then
        return Color3.fromRGB(0, 255, 0)
    end

    return Color3.fromRGB(255, 255, 255)
end
t10.GetPlayerColorByRole = t1[7]
t1[7] = function(p28)
    if not t10.ESP_LINE_STATES.ESPLine then
        return false
    end

    local v157 = p28 == "Murderer"

    if v157 then
        v157 = t10.ESP_LINE_STATES.MurdererLine
    end

    if v157 then
        return true
    end

    local v158 = p28 == "Sheriff"

    if v158 then
        v158 = t10.ESP_LINE_STATES.SheriffLine
    end

    if v158 then
        return true
    end

    local v159 = p28 == "Hero"

    if v159 then
        v159 = t10.ESP_LINE_STATES.HeroLine
    end

    if v159 then
        return true
    end

    local v160 = p28 == "Innocent"

    if v160 then
        v160 = t10.ESP_LINE_STATES.InnocentLine
    end

    if v160 then
        return true
    end

    return false
end
t10.ShouldShowLineForRole = t1[7]
t1[7] = function()
    local drawing = Drawing.new("Line")

    drawing.Visible = false
    drawing.From = Vector2.new(0, 0)
    drawing.To = Vector2.new(1, 1)
    drawing.Color = Color3.fromRGB(0, 255, 50)
    drawing.Thickness = t10.ESP_LINE_STATES.LineThickness
    drawing.Transparency = t10.ESP_LINE_STATES.LineTransparency

    return drawing
end
t10.CreateLineDrawing = t1[7]
t1[7] = function(p29)
    local v163 = t10.LineDrawings[p29]

    if not v163 then
        v163 = t10.CreateLineDrawing()
        t10.LineDrawings[p29] = v163
    end

    return v163
end
t10.GetLineForPlayer = t1[7]
t1[7] = function(p30)
    if t10.LineDrawings[p30] then
        t10.LineDrawings[p30]:Remove()
        t10.LineDrawings[p30] = nil
    end
end
t10.RemoveLineForPlayer = t1[7]
t1[7] = function()
    for _, v in pairs(t10.LineDrawings) do
        if v then
            v:Remove()
        end
    end

    t10.LineDrawings = {}
end
t10.ClearAllLines = t1[7]
t1[7] = function()
    t10.Camera = workspace.CurrentCamera
end
t10.UpdateCamera = t1[7]
t1[7] = function()
    for _, v in ipairs(t12) do
        local v169 = v

        if v169 then
            pcall(function()
                v169:Disconnect()
            end)
        end
    end

    t12 = {}
    t10.ClearAllLines()
end
t10.StopAllLines = t1[7]
t1[7] = function(p31)
    if not pcall(function()
        return Drawing.new("Line")
    end) then
        warn("OnyxHub: Ваш исполнитель не поддерживает Drawing API для линий.")

        return nil
    end
    if not t10.LineDrawings[p31.Name] then
        local drawing = Drawing.new("Line")

        drawing.Visible = false
        drawing.Color = Color3.fromRGB(255, 255, 255)
        drawing.Thickness = t10.ESP_LINE_STATES.LineThickness
        drawing.Transparency = t10.ESP_LINE_STATES.LineTransparency
        t10.LineDrawings[p31.Name] = drawing
    end
    local u172
    local u173 = false

    return (v5.RenderStepped:Connect(function()
        if not t10.ESP_LINE_STATES.ESPLine then
            if t10.LineDrawings[p31.Name] then
                t10.LineDrawings[p31.Name].Visible = false
            end

            return
        end

        t10.UpdateCamera()

        local v845 = p31

        if v845 then
            v845 = p31.Character

            if v845 then
                v845 = p31.Character:FindFirstChild("Humanoid")

                if v845 then
                    v845 = p31.Character:FindFirstChild("HumanoidRootPart")

                    if v845 then
                        v845 = p31.Name ~= v11.Name

                        if v845 then
                            v845 = p31.Character.Humanoid.Health > 0
                        end
                    end
                end
            end
        end

        if v845 then
            if tick() - 0 >= 0.1 then
                local v846 = t10.GetRolesData()
                local v847, v848 = t10.getPlayerRole(p31, v846)

                u172 = v847
                u173 = v848
            end
            if not t10.ShouldShowLineForRole(u172) or not u173 then
                if t10.LineDrawings[p31.Name] then
                    t10.LineDrawings[p31.Name].Visible = false
                end

                return
            end
            local HumanoidRootPartPosition = p31.Character.HumanoidRootPart.Position
            local v851, t14Result = t10.Camera:WorldToViewportPoint(HumanoidRootPartPosition)
            if t14Result then
                local v852 = t10.Camera.ViewportSize.X / 2
                local v853 = t10.Camera.ViewportSize.Y / 2
                local v854 = t10.LineDrawings[p31.Name]

                if v854 then
                    v854.From = Vector2.new(v852, v853)
                    v854.To = Vector2.new(v851.X, v851.Y)
                    v854.Color = t10.GetPlayerColorByRole(u172, u173)
                    v854.Thickness = t10.ESP_LINE_STATES.LineThickness
                    v854.Transparency = t10.ESP_LINE_STATES.LineTransparency
                    v854.Visible = true

                    return
                end
            elseif t10.LineDrawings[p31.Name] then
                t10.LineDrawings[p31.Name].Visible = false

                return
            end
        elseif t10.LineDrawings[p31.Name] then
            t10.LineDrawings[p31.Name].Visible = false
        end
    end))
end
t10.InitializePlayerLines = t1[7]
t1[7] = function()
    t10.StopAllLines()

    for _, player in ipairs(v3:GetPlayers()) do
        if player ~= v11 then
            local v176 = t10.InitializePlayerLines(player)

            table.insert(t12, v176)
        end
    end
end
t10.StartAllLines = t1[7]
t1[7] = function(p32, p33, p34)
    if p32 == v11 then
        return
    end

    local Character = p32.Character

    if not Character then
        return
    end

    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        return
    end

    local _ = (t10.Camera.CFrame.Position - HumanoidRootPart.Position).Magnitude
    local PlayerBillboard = HumanoidRootPart:FindFirstChild("PlayerBillboard")
    local v184 = if not (p33 == "Murderer" and p34) then if not (p33 == "Sheriff" and p34) then if not (p33 == "Hero" and p34) then if not (p33 == "Innocent" and p34) then Color3.fromRGB(255, 255, 255) else t10.ROLE_COLORS.Innocent else t10.ROLE_COLORS.Hero else t10.ROLE_COLORS.Sheriff else t10.ROLE_COLORS.Murderer

    if PlayerBillboard then
        local PlayerName = PlayerBillboard:FindFirstChild("PlayerName")

        if PlayerName then
            PlayerName.TextColor3 = v184
            PlayerName.Text = p32.Name

            return
        end
    else
        local BillboardGui = Instance.new("BillboardGui")

        BillboardGui.Name = "PlayerBillboard"
        BillboardGui.Adornee = HumanoidRootPart
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(0, 100, 0, 30)
        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
        BillboardGui.ResetOnSpawn = false

        local TextLabel = Instance.new("TextLabel")

        TextLabel.Name = "PlayerName"
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = p32.Name
        TextLabel.TextColor3 = v184
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.TextSize = 14
        TextLabel.TextStrokeTransparency = 0.5
        TextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        TextLabel.Parent = BillboardGui
        BillboardGui.Parent = HumanoidRootPart
        t10.billboards[p32] = BillboardGui
    end
end
t10.updatePlayerBillboard = t1[7]
t1[7] = function(p35)
    if p35 == v11 then
        return
    end

    if t10.billboards[p35] then
        t10.billboards[p35]:Destroy()
        t10.billboards[p35] = nil
    end

    local Character = p35.Character

    if Character then
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

        if HumanoidRootPart then
            local PlayerBillboard = HumanoidRootPart:FindFirstChild("PlayerBillboard")

            if PlayerBillboard then
                PlayerBillboard:Destroy()
            end
        end
    end
end
t10.removePlayerBillboard = t1[7]
t1[7] = function()
    for _, v in pairs(t10.billboards) do
        if v and v.Parent then
            v:Destroy()
        end
    end

    t10.billboards = {}
end
t10.clearAllESP = t1[7]
t1[7] = function(p36, p37, p38)
    if p36 == v11 then
        return
    end

    local Character = p36.Character

    if not Character then
        return
    end

    local PlayerHighlight = Character:FindFirstChild("PlayerHighlight")
    local v199 = not PlayerHighlight

    if not v199 then
        v199 = not PlayerHighlight:IsA("Highlight")
    end

    if v199 then
        if PlayerHighlight then
            PlayerHighlight:Destroy()
        end

        PlayerHighlight = Instance.new("Highlight")
        PlayerHighlight.Name = "PlayerHighlight"
        PlayerHighlight.Adornee = Character
        PlayerHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        PlayerHighlight.FillTransparency = 0.7
        PlayerHighlight.OutlineTransparency = 0.4
        PlayerHighlight.OutlineColor = Color3.new(1, 1, 1)
        PlayerHighlight.Parent = Character
    end

    PlayerHighlight.FillColor = if not (p37 == "Murderer" and p38) then if not (p37 == "Sheriff" and p38) then if not (p37 == "Hero" and p38) then if not (p37 == "Innocent" and p38) then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 255, 0) else Color3.fromRGB(0, 0, 255) else Color3.fromRGB(255, 0, 0)
end
t10.updatePlayerHighlight = t1[7]
t1[7] = function(p39)
    if p39 == v11 then
        return
    end

    local Character = p39.Character

    if Character then
        local PlayerHighlight = Character:FindFirstChild("PlayerHighlight")
        local v203 = PlayerHighlight

        if PlayerHighlight then
            v203 = PlayerHighlight:IsA("Highlight")
        end

        if v203 then
            PlayerHighlight:Destroy()
        end
    end
end
t10.removePlayerHighlight = t1[7]
t1[7] = function()
    for _, player in ipairs(v3:GetPlayers()) do
        if player ~= v11 then
            t10.removePlayerHighlight(player)
        end
    end
end
t10.clearAllHighlights = t1[7]
t1[28] = function(p40, p41, p42, p43, p44, p45)
    local createWithStaticStroke = t9.createWithStaticStroke
    local v213 = p41 .. "Toggle"
    local uDim2 = UDim2.new(1, -20, 0, 45)
    local uDim2_16 = UDim2.new(0, 10, 0, p42)
    local color3 = Color3.fromRGB(35, 25, 45)
    local v217 = createWithStaticStroke("Frame", p40, {
		Name = v213,
		Size = uDim2,
		Position = uDim2_16,
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.5,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v217, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance = t9.createInstance
    local uDim2_17 = UDim2.new(1, -60, 1, 0)
    local uDim2_18 = UDim2.new(0, 15, 0, 0)
    local color3_7 = Color3.fromRGB(230, 230, 230)
    local Gotham = Enum.Font.Gotham
    local Left = Enum.TextXAlignment.Left

    createInstance("TextLabel", v217, {
		Text = p41,
		Size = uDim2_17,
		Position = uDim2_18,
		BackgroundTransparency = 1,
		TextColor3 = color3_7,
		TextSize = 14,
		Font = Gotham,
		TextXAlignment = Left,
		ZIndex = 6
	})

    local createInstance8 = t9.createInstance
    local uDim2_19 = UDim2.new(0, 40, 0, 20)
    local uDim2_20 = UDim2.new(1, -55, 0.5, -10)
    local v227 = p43[p44]

    if v227 then
        v227 = t2.MAIN_COLOR
    end

    if not v227 then
        v227 = Color3.fromRGB(60, 50, 70)
    end

    local v228 = createInstance8("Frame", v217, {
		Size = uDim2_19,
		Position = uDim2_20,
		BackgroundColor3 = v227,
		ZIndex = 6
	})

    t9.createInstance("UICorner", v228, {
		CornerRadius = UDim.new(1, 0)
	})

    local createInstance9 = t9.createInstance
    local uDim2_21 = UDim2.new(0, 16, 0, 16)
    local v231 = p43[p44]

    if v231 then
        v231 = UDim2.new(1, -18, 0.5, -8)
    end

    if not v231 then
        v231 = UDim2.new(0, 2, 0.5, -8)
    end

    local color3_8 = Color3.fromRGB(255, 255, 255)
    local v233 = createInstance9("Frame", v228, {
		Size = uDim2_21,
		Position = v231,
		BackgroundColor3 = color3_8,
		ZIndex = 7
	})

    t9.createInstance("UICorner", v233, {
		CornerRadius = UDim.new(1, 0)
	})

    local v234 = t9.createInstance("TextButton", v217, {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 8
	})

    v234.MouseButton1Click:Connect(function()
        local v855 = p43[p44]

        p43[p44] = not v855

        local v856 = p43[p44]
        local v857 = TweenService
        local v858 = v228
        local tweenInfo = TweenInfo.new(0.3)
        local v860 = v856

        if v856 then
            v860 = t2.MAIN_COLOR
        end

        if not v860 then
            v860 = Color3.fromRGB(60, 50, 70)
        end

        v857:Create(v858, tweenInfo, {
			BackgroundColor3 = v860
		}):Play()

        local v861 = TweenService
        local v862 = v233
        local tweenInfo2 = TweenInfo.new(0.3, Enum.EasingStyle.Back)
        local v864 = v856

        if v856 then
            v864 = UDim2.new(1, -18, 0.5, -8)
        end

        if not v864 then
            v864 = UDim2.new(0, 2, 0.5, -8)
        end

        v861:Create(v862, tweenInfo2, {
			Position = v864
		}):Play()
        TweenService:Create(v217, TweenInfo.new(0.1), {
			Size = UDim2.new(1, -20, 0, 43)
		}):Play()
        task.wait(0.1)
        TweenService:Create(v217, TweenInfo.new(0.1), {
			Size = UDim2.new(1, -20, 0, 45)
		}):Play()

        if p45 then
            task.spawn(p45, v856)
        end

        t9.playClickSound()
    end)
    v234.MouseEnter:Connect(function()
        TweenService:Create(v217, TweenInfo.new(0.2), {
			BackgroundColor3 = Color3.fromRGB(45, 35, 55),
			BackgroundTransparency = 0.3
		}):Play()
    end)
    v234.MouseLeave:Connect(function()
        TweenService:Create(v217, TweenInfo.new(0.2), {
			BackgroundColor3 = Color3.fromRGB(35, 25, 45),
			BackgroundTransparency = 0.5
		}):Play()
    end)

    return v217, v234
end
t1[7] = function()
    if not t10.ESP_STATES.ESPName then
        t10.clearAllESP()

        return
    end

    local v235 = t10.GetRolesData()

    for _, player in ipairs(v3:GetPlayers()) do
        if player ~= v11 then
            local Character = player.Character
            local v239 = Character

            if Character then
                v239 = Character:FindFirstChild("HumanoidRootPart")
            end

            if not Character or not v239 then
                t10.removePlayerBillboard(player)
            elseif not t10.IsPlayerVisible(player) then
                t10.removePlayerBillboard(player)
            else
                local v240, v241 = t10.getPlayerRole(player, v235)
                local v242 = v240 == "Murderer"
                local v243 = false

                if v242 then
                    v242 = t10.ESP_STATES.MurdererName
                end

                if v242 then
                    v243 = true
                else
                    local v244 = v240 == "Sheriff"

                    if v244 then
                        v244 = t10.ESP_STATES.SheriffName
                    end

                    if v244 then
                        v243 = true
                    else
                        local v245 = v240 == "Hero"

                        if v245 then
                            v245 = t10.ESP_STATES.HeroName
                        end

                        if v245 then
                            v243 = true
                        else
                            local v246 = v240 == "Innocent"

                            if v246 then
                                v246 = t10.ESP_STATES.InnocentName
                            end

                            if v246 then
                                v243 = true
                            elseif not v240 then
                                v243 = true
                            end
                        end
                    end
                end

                if v243 then
                    t10.updatePlayerBillboard(player, v240, v241)
                else
                    t10.removePlayerBillboard(player)
                end
            end
        end
    end
end
t10.updateESP = t1[7]
t1[7] = function()
    if not t10.ESP_HIGHLIGHT_STATES.ESPHighlight then
        t10.clearAllHighlights()

        return
    end

    local v247 = t10.GetRolesData()

    for _, player in ipairs(v3:GetPlayers()) do
        if player ~= v11 then
            if not player.Character then
                t10.removePlayerHighlight(player)
            elseif not t10.IsPlayerVisible(player) then
                t10.removePlayerHighlight(player)
            else
                local v250, v251 = t10.getPlayerRole(player, v247)
                local v252 = false
                local v253 = v250 == "Murderer"

                if v253 then
                    v253 = t10.ESP_HIGHLIGHT_STATES.ESPHighlightMurderer
                end

                if v253 then
                    v252 = true
                else
                    local v254 = v250 == "Sheriff"

                    if v254 then
                        v254 = t10.ESP_HIGHLIGHT_STATES.ESPHighlightSheriff
                    end

                    if v254 then
                        v252 = true
                    else
                        local v255 = v250 == "Hero"

                        if v255 then
                            v255 = t10.ESP_HIGHLIGHT_STATES.ESPHighlightHero
                        end

                        if v255 then
                            v252 = true
                        else
                            local v256 = v250 == "Innocent"

                            if v256 then
                                v256 = t10.ESP_HIGHLIGHT_STATES.ESPHighlightInnocent
                            end

                            if v256 then
                                v252 = true
                            end
                        end
                    end
                end

                if v252 then
                    t10.updatePlayerHighlight(player, v250, v251)
                else
                    t10.removePlayerHighlight(player)
                end
            end
        end
    end
end
t10.updateHighlights = t1[7]
t1[20] = t10
t1[7] = function(p46)
    if p46 == v11 then
        return
    end

    local function v258(_)
        task.wait(0.5)
        t10.updateESP()
    end

    p46.CharacterAdded:Connect(v258)
    p46.CharacterRemoving:Connect(function()
        t10.removePlayerBillboard(p46)
        t10.removePlayerHighlight(p46)
    end)

    if p46.Character then
        task.spawn(v258, p46.Character)
    end
end
t1[20].initializePlayer = t1[7]
local t15 = {}
t1[7] = function()
    if t3.AntiFling.Enabled then
        return
    end

    t3.AntiFling.Enabled = true

    local v259 = v11
    local Character = v259.Character

    if not Character then
        Character = v259.CharacterAdded:Wait()
    end

    local u261 = Character
    local Humanoid = u261:WaitForChild("Humanoid")

    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

    local function v263()
        for _, player in ipairs(v3:GetPlayers()) do
            if player ~= v259 and player.Character then
                for _, descendant in ipairs(player.Character:GetDescendants()) do
                    if descendant:IsA("BasePart") and not descendant.Anchored then
                        descendant.CanCollide = false
                    end
                end
            end
        end
    end

    v263()

    local thread = task.spawn(function()
        while t3.AntiFling.Enabled do
            task.wait(0.3)

            local v870 = not u261

            if not v870 then
                v870 = u261.Parent == nil
            end

            if v870 then
                u261 = v259.Character

                if u261 then
                    Humanoid = u261:FindFirstChild("Humanoid")

                    if Humanoid then
                        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    end
                end
            end

            v263()
        end
    end)

    local function v265(p48)
        if p48 ~= v259 then
            p48.CharacterAdded:Connect(function(character)
                task.wait(0.2)

                if t3.AntiFling.Enabled then
                    for _, descendant in ipairs(character:GetDescendants()) do
                        if descendant:IsA("BasePart") and not descendant.Anchored then
                            descendant.CanCollide = false
                        end
                    end
                end
            end)
        end
    end

    for _, player in ipairs(v3:GetPlayers()) do
        v265(player)
    end

    local connection = v3.PlayerAdded:Connect(v265)
    local connection3 = v259.CharacterAdded:Connect(function(character)
        u261 = character
        Humanoid = u261:FindFirstChild("Humanoid")

        local v873 = Humanoid

        if v873 then
            v873 = t3.AntiFling.Enabled
        end

        if v873 then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        end

        task.wait(0.2)

        if t3.AntiFling.Enabled then
            v263()
        end
    end)

    t3.AntiFling.Connections = {
		task = thread,
		playerAdded = connection,
		characterAdded = connection3
	}
end
t15.enable = t1[7]
t1[21] = t15
t1[7] = function()
    if not t3.AntiFling.Enabled then
        return
    end
    t3.AntiFling.Enabled = false
    local Connections = t3.AntiFling.Connections
    if Connections then
        Connections = t3.AntiFling.Connections.task
    end
    if Connections then
        task.cancel(t3.AntiFling.Connections.task)
    end
    local Connections2 = t3.AntiFling.Connections
    if Connections2 then
        Connections2 = t3.AntiFling.Connections.playerAdded
    end
    if Connections2 then
        t3.AntiFling.Connections.playerAdded:Disconnect()
    end
    local Connections3 = t3.AntiFling.Connections
    if Connections3 then
        Connections3 = t3.AntiFling.Connections.characterAdded
    end
    if Connections3 then
        t3.AntiFling.Connections.characterAdded:Disconnect()
    end
    for v275, v276 in ipairs(v3:GetPlayers()) do

        if v276 ~= v11 and v276.Character then
            for _, descendant in ipairs(v276.Character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.CanCollide = true
                end
            end
        end
    end
    local Character = v11.Character
    if Character then
        local Humanoid = Character:FindFirstChild("Humanoid")

        if Humanoid then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        end
    end
    t3.AntiFling.Connections = nil
end
t1[21].disable = t1[7]
local t16 = {}
t1[22] = t16
t1[7] = function()
    local v281 = t9.getHRP()
    if not v281 then
        return nil, math.huge
    end
    local v282
    local huge = math.huge
    for _, child in ipairs(workspace:GetChildren()) do
        if child:FindFirstChild("CoinContainer") then
            for _, child2 in ipairs(child.CoinContainer:GetChildren()) do
                local v288 = child2:IsA("BasePart")

                if v288 then
                    v288 = child2:GetAttribute("CoinID") == "Coin" and child2:FindFirstChild("TouchInterest")
                end

                if v288 then
                    local Magnitude = (v281.Position - child2.Position).Magnitude

                    if Magnitude < huge then
                        huge = Magnitude
                        v282 = child2
                    end
                end
            end
        end
    end

    return v282, huge
end
t1[22].getNearestCoin = t1[7]
t1[7] = function()
    task.spawn(function()
        while true do
            local n3 = 0.1
            local AutoFarmEnabled = t3.AutoFarm.Enabled

            if AutoFarmEnabled then
                AutoFarmEnabled = t3.AutoFarm.Farming

                if AutoFarmEnabled then
                    AutoFarmEnabled = not t3.AutoFarm.BagFull
                end
            end

            if AutoFarmEnabled then
                local v876, v877 = t16.getNearestCoin()
                local v878 = t9.getHRP()

                if v876 and v878 then
                    if v877 > 150 then
                        v878.CFrame = v876.CFrame
                    else
                        local tween = TweenService:Create(v878, TweenInfo.new(v877 / 25, Enum.EasingStyle.Linear), {
							CFrame = v876.CFrame
						})

                        tween:Play()

                        local timestamp = tick()

                        if v876:FindFirstChild("TouchInterest") and t3.AutoFarm.Farming then
                            local _ = t3.AutoFarm.Enabled
                        end

                        repeat
                            task.wait()

                            if tick() - timestamp > 5 then
                                break
                            end

                            local v882 = not v876:FindFirstChild("TouchInterest")

                            if not v882 then
                                v882 = not t3.AutoFarm.Farming

                                if not v882 then
                                    v882 = not t3.AutoFarm.Enabled
                                end
                            end
                        until v882

                        if tween then
                            tween:Cancel()
                        end
                    end
                end
            else
                n3 = not t3.AutoFarm.Enabled and 1 or 0.5
            end

            task.wait(n3)
        end
    end)
end
t16.startFarmingLoop = t1[7]
t1[7] = function()
    local AutoFarmEnabled = t3.AutoFarm.Enabled

    if AutoFarmEnabled then
        AutoFarmEnabled = t3.AutoFarm.BagFull

        if AutoFarmEnabled then
            AutoFarmEnabled = not t3.AutoFarm.Resetting
        end
    end

    if AutoFarmEnabled then
        t3.AutoFarm.Resetting = true

        local v291 = t9.getHRP()
        local v292 = v291

        if v291 then
            v292 = t3.AutoFarm.StartPosition
        end

        if v292 then
            local tween = TweenService:Create(v291, TweenInfo.new(2, Enum.EasingStyle.Linear), {
				CFrame = t3.AutoFarm.StartPosition
			})

            tween:Play()
            tween.Completed:Wait()
        end

        task.wait(0.5)

        local Character = v11.Character

        if Character then
            Character = v11.Character:FindFirstChild("Humanoid")
        end

        if Character then
            v11.Character.Humanoid.Health = 0
        end

        v11.CharacterAdded:Wait()
        task.wait(1.5)
        t3.AutoFarm.Resetting = false
        t3.AutoFarm.BagFull = false
    end
end
t16.autoReset = t1[7]
local t17 = {}
t1[7] = function(p49)
    local GetPlayerData = v6:FindFirstChild("GetPlayerData", true)
    local v297 = GetPlayerData

    if GetPlayerData then
        v297 = GetPlayerData:IsA("RemoteFunction")
    end

    if v297 then
        local v298 = GetPlayerData:InvokeServer()

        if v298 then
            local v299 = v298[p49.Name]

            if v299 then
                v299 = v298[p49.Name].Role
            end

            v298 = v299
        end

        return v298
    end

    return nil
end
t17.getPlayerRoleFromServer = t1[7]
t1[7] = function()
    local Character = v11.Character

    if not Character then
        return false
    end

    if Character:FindFirstChild("Knife") then
        return true
    end

    local Knife = v11.Backpack:FindFirstChild("Knife")

    if Knife then
        Knife.Parent = Character

        return true
    end

    return false
end
t17.hasKnife = t1[7]
t1[7] = function()
    local Backpack = v11:FindFirstChild("Backpack")
    local Character = v11.Character

    if not Character then
        return false
    end

    local v304 = Backpack and Backpack:FindFirstChild("Knife") or Character:FindFirstChild("Knife")

    if v304 then
        if Character ~= v304.Parent then
            v304.Parent = Character
        end

        return true
    end

    return false
end
t17.equipKnife = t1[7]
t1[7] = function()
    local t18 = {}
    local v306 = t9.getHRP()

    if not v306 then
        return nil
    end

    for _, player in ipairs(v3:GetPlayers()) do
        if player ~= v11 and player.Character then
            local v309 = t17.getPlayerRoleFromServer(player)
            local Humanoid = player.Character:FindFirstChild("Humanoid")
            local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if v309 then
                if Humanoid then
                    Humanoid = Humanoid.Health > 0

                    if Humanoid then
                        Humanoid = HumanoidRootPart and table.find(t2.VALID_TARGET_ROLES, v309)
                    end
                end

                v309 = Humanoid
            end
            if v309 then
                local Magnitude = (v306.Position - HumanoidRootPart.Position).Magnitude

                table.insert(t18, {
					Player = player,
					Distance = Magnitude
				})
            end
        end
    end

    table.sort(t18, function(p50, p51)
        return p50.Distance < p51.Distance
    end)

    local v313 = t18[1]

    if v313 then
        v313 = t18[1].Player
    end

    return v313 or nil
end
t17.getNearestTarget = t1[7]
t1[7] = function()
    local t19 = {}

    for _, player in ipairs(v3:GetPlayers()) do
        if player ~= v11 and player.Character then
            local v317 = t17.getPlayerRoleFromServer(player)
            local Humanoid = player.Character:FindFirstChild("Humanoid")

            if v317 then
                if Humanoid then
                    Humanoid = Humanoid.Health > 0

                    if Humanoid then
                        Humanoid = table.find(t2.VALID_TARGET_ROLES, v317)
                    end
                end

                v317 = Humanoid
            end

            if v317 then
                table.insert(t19, player)
            end
        end
    end

    return t19
end
t17.getAllValidTargets = t1[7]
t1[24] = t17
t1[7] = function(p52)
    local v320 = not p52

    if not v320 then
        v320 = not p52.Character
    end

    if v320 then
        return false
    end

    local Humanoid = p52.Character:FindFirstChild("Humanoid")

    if not Humanoid or Humanoid.Health <= 0 then
        return false
    end

    if not t17.equipKnife() then
        return false
    end

    task.wait(0.1)

    local v322 = t9.getHRP()
    local HumanoidRootPart = p52.Character:FindFirstChild("HumanoidRootPart")

    if not v322 or not HumanoidRootPart then
        return false
    end

    local Remotes = v6:FindFirstChild("Remotes")

    if Remotes then
        local Gameplay = Remotes:FindFirstChild("Gameplay")

        if Gameplay then
            Gameplay = Remotes.Gameplay:FindFirstChild("KillEvent")
        end

        Remotes = Gameplay
    end

    local v326 = Remotes

    if not v326 then
        local Knife = v11.Character:FindFirstChild("Knife")

        if Knife and Knife:FindFirstChild("Stab") then
            Knife.Stab:FireServer("Down")
            task.wait(0.1)
            Knife.Stab:FireServer("Down")

            return true
        end

        return false
    end

    HumanoidRootPart.CFrame = v322.CFrame * CFrame.new(0, 0, -3)
    pcall(function()
        v326:FireServer(p52.Name, Color3.new(1, 0, 0))
    end)

    return true
end
t1[24].killTargetThroughEvent = t1[7]
t1[7] = function()
    if not t3.KillAll.Enabled then
        return
    end

    if not t17.equipKnife() then
        return
    end

    task.wait(0.1)

    local Remotes = v6:FindFirstChild("Remotes")

    if Remotes then
        local Gameplay = Remotes:FindFirstChild("Gameplay")

        if Gameplay then
            Gameplay = Remotes.Gameplay:FindFirstChild("KillEvent")
        end

        Remotes = Gameplay
    end

    local v330 = Remotes

    if not v330 then
        return
    end

    local v331 = t17.getAllValidTargets()
    local v332 = t9.getHRP()

    if not v332 then
        return
    end

    for _, v in ipairs(v331) do
        if not t3.KillAll.Enabled then
            return
        end

        local Character = v.Character

        if Character then
            Character = v.Character:FindFirstChild("Humanoid")

            if Character then
                Character = v.Character.Humanoid.Health > 0

                if Character then
                    Character = v.Character:FindFirstChild("HumanoidRootPart")
                end
            end
        end

        if Character then
            v.Character.HumanoidRootPart.CFrame = v332.CFrame * CFrame.new(0, 0, -3)
            pcall(function()
                v330:FireServer(v.Name, Color3.new(1, 0, 0))
            end)
            task.wait(t3.KillAll.AttackDelay or 0.2)
        end
    end
end
t17.killAllPlayers = t1[7]
t1[25] = t17
t1[7] = function()
    task.spawn(function()
        while true do
            local KillAllEnabled = t3.KillAll.Enabled

            if KillAllEnabled then
                KillAllEnabled = t3.AutoFarm.BagFull
            end

            local n4

            if KillAllEnabled then
                if t17.hasKnife() then
                    t17.killAllPlayers()
                    n4 = 3
                else
                    n4 = 1
                end
            else
                n4 = 0.5
            end

            task.wait(n4)
        end
    end)
end
t1[25].startKillAllLoop = t1[7]
local t20 = {}
t1[7] = function()
    local Character = v11.Character

    if Character then
        Character = v11.Character:FindFirstChild("Humanoid")
    end

    if Character then
        local Humanoid = v11.Character.Humanoid
        local SpeedWalkEnabled = t3.Movement.SpeedWalk.Enabled

        if SpeedWalkEnabled then
            SpeedWalkEnabled = t3.Movement.SpeedWalk.Value
        end

        if not SpeedWalkEnabled then
            SpeedWalkEnabled = t2.DEFAULT_WALK_SPEED
        end

        Humanoid.WalkSpeed = SpeedWalkEnabled
    end
end
t20.updateWalkSpeed = t1[7]
t1[7] = function()
    local Character = v11.Character

    if Character then
        Character = v11.Character:FindFirstChild("Humanoid")
    end

    if Character then
        local Humanoid = v11.Character.Humanoid
        local JumpPowerEnabled = t3.Movement.JumpPower.Enabled

        if JumpPowerEnabled then
            JumpPowerEnabled = t3.Movement.JumpPower.Value
        end

        if not JumpPowerEnabled then
            JumpPowerEnabled = t2.DEFAULT_JUMP_POWER
        end

        Humanoid.JumpPower = JumpPowerEnabled
    end
end
t20.updateJumpPower = t1[7]
local t21 = {}
t1[7] = function()
    for _, descendant in ipairs(v6:GetDescendants()) do
        if descendant:IsA("RemoteEvent") then
            if descendant.Name == "CoinCollected" then
                t5.CoinCollected = descendant
            elseif descendant.Name == "RoundStart" then
                t5.RoundStart = descendant
            elseif descendant.Name == "RoundEnd" then
                t5.RoundEnd = descendant
            end
        end

        local CoinCollected = t5.CoinCollected

        if CoinCollected then
            CoinCollected = t5.RoundStart

            if CoinCollected then
                CoinCollected = t5.RoundEnd
            end
        end

        if CoinCollected then
            return
        end
    end
end
t21.findRemoteEvents = t1[7]
t1[7] = function()
    if t5.CoinCollected then
        t5.CoinCollected.OnClientEvent:Connect(function(_, p54, p55)
            if t3.AutoFarm.Enabled then
                t4.CoinsCollected = t4.CoinsCollected + 1
            end

            local v890 = p54 == p55

            if v890 then
                v890 = not t3.AutoFarm.Resetting
            end

            if v890 then
                t3.AutoFarm.BagFull = true

                if t3.AutoFarm.Enabled then
                    task.spawn(t16.autoReset)
                end
            end
        end)
    end

    if t5.RoundStart then
        t5.RoundStart.OnClientEvent:Connect(function()
            t3.AutoFarm.Farming = true
            t3.AutoFarm.BagFull = false

            local v891 = t9.getHRP()

            if v891 then
                t3.AutoFarm.StartPosition = v891.CFrame
            end
        end)
    end

    if t5.RoundEnd then
        t5.RoundEnd.OnClientEvent:Connect(function()
            t3.AutoFarm.Farming = false
            t3.KillAll.Enabled = false
        end)
    end
end
t21.connectRemoteEvents = t1[7]
local function v28()
    if t3.Performance.Overlay then
        return
    end
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "StatsOverlay"
    ScreenGui.Parent = v7
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    ScreenGui.DisplayOrder = 95
    ScreenGui.ResetOnSpawn = false
    local createWithStaticStroke = t9.createWithStaticStroke
    local uDim2 = UDim2.new(0, 100, 0, 40)
    local PerformancePosition = t3.Performance.Position
    if not PerformancePosition then
        PerformancePosition = UDim2.new(0.5, -50, 0.5, -20)
    end
    local color3 = Color3.fromRGB(30, 20, 40)
    local v350 = createWithStaticStroke("Frame", ScreenGui, {
		Name = "StatsFrame",
		Size = uDim2,
		Position = PerformancePosition,
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		Active = true,
		ZIndex = 5
	})
    t9.createInstance("UICorner", v350, {
		CornerRadius = UDim.new(0, 4)
	})
    t9.createInstance("UIGradient", v350, {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 40, 70)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 25, 50))
		}),
		Rotation = 90
	})
    local createInstance = t9.createInstance
    local uDim2_22 = UDim2.new(1, -4, 1, -4)
    local uDim2_23 = UDim2.new(0, 2, 0, 2)
    local v354 = createInstance("Frame", v350, {
		Name = "StatsContainer",
		Size = uDim2_22,
		Position = uDim2_23,
		BackgroundTransparency = 1,
		ZIndex = 6
	})
    local createInstance10 = t9.createInstance
    local uDim2_24 = UDim2.new(1, 0, 0.5, 0)
    local uDim2_25 = UDim2.new(0, 0, 0, 0)
    local color3_9 = Color3.fromRGB(245, 235, 255)
    local Center = Enum.TextXAlignment.Center
    local Center2 = Enum.TextYAlignment.Center
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    local v362 = createInstance10("TextLabel", v354, {
		Name = "PingLabel",
		Size = uDim2_24,
		Position = uDim2_25,
		BackgroundTransparency = 1,
		TextColor3 = color3_9,
		TextXAlignment = Center,
		TextYAlignment = Center2,
		FontFace = font,
		TextSize = 10,
		RichText = true,
		Text = "<font color='rgb(150, 100, 255)'>●</font> Ping: ...",
		ZIndex = 7
	})
    local createInstance11 = t9.createInstance
    local uDim2_26 = UDim2.new(1, 0, 0.5, 0)
    local uDim2_27 = UDim2.new(0, 0, 0.5, 0)
    local color3_10 = Color3.fromRGB(245, 235, 255)
    local Center3 = Enum.TextXAlignment.Center
    local Center4 = Enum.TextYAlignment.Center
    local font2 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    local v370 = createInstance11("TextLabel", v354, {
		Name = "FPSLabel",
		Size = uDim2_26,
		Position = uDim2_27,
		BackgroundTransparency = 1,
		TextColor3 = color3_10,
		TextXAlignment = Center3,
		TextYAlignment = Center4,
		FontFace = font2,
		TextSize = 10,
		RichText = true,
		Text = "<font color='rgb(150, 100, 255)'>●</font> FPS: ...",
		ZIndex = 7
	})
    local u371 = false
    local vector2
    local Position
    local u374
    local createInstance12 = t9.createInstance
    local uDim2_28 = UDim2.new(1, 0, 1, 0)
    local v377 = createInstance12("TextButton", v350, {
		Name = "DragButton",
		Size = uDim2_28,
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
		ZIndex = 10
	})
    v377.AutoButtonColor = false
    v377.Selected = false
    v377.InputBegan:Connect(function(input)
        local v893 = input.UserInputType == Enum.UserInputType.MouseButton1

        if not v893 then
            v893 = input.UserInputType == Enum.UserInputType.Touch
        end

        if v893 then
            u371 = false
            u374 = input.UserInputType == Enum.UserInputType.Touch and input
            vector2 = Vector2.new(input.Position.X, input.Position.Y)
            Position = v350.Position
            v350.BackgroundColor3 = Color3.fromRGB(45, 35, 60)

            return Enum.ContextActionResult.Sink
        end
    end)
    v377.InputChanged:Connect(function(input)
        if not vector2 then
            return
        end

        if input.UserInputType == Enum.UserInputType.Touch and (not u374 or input ~= u374) then
            return
        end

        local v895 = Vector2.new(input.Position.X, input.Position.Y) - vector2

        if not u371 and v895.Magnitude > 5 then
            u371 = true
        end

        if u371 then
            v350.Position = UDim2.new(Position.X.Scale, Position.X.Offset + v895.X, Position.Y.Scale, Position.Y.Offset + v895.Y)
        end
    end)
    v377.InputEnded:Connect(function(_)
        v350.BackgroundColor3 = Color3.fromRGB(30, 20, 40)

        if u371 then
            local Position2 = v350.Position

            if not t3.Performance then
                t3.Performance = {}
            end

            t3.Performance.Position = Position2
        end
    end)
    local timestamp = tick()
    local n5 = 0
    local connection = v5.RenderStepped:Connect(function()
        n5 += 1

        if tick() - timestamp >= 1 then
            local ok, result = pcall(function()
                return (math.floor((v10.Network.ServerStatsItem["Data Ping"]:GetValue())))
            end)

            if ok then
                local v900 = if not (result < 50) then if not (result < 100) then not (result < 200) and "rgb(255, 100, 100)" or "rgb(255, 150, 100)" else "rgb(255, 255, 100)" else "rgb(100, 255, 100)"

                v362.Text = string.format("<font color='rgb(150, 100, 255)'>●</font> Ping: <font color='%s'>%d</font>", v900, result)
            else
                v362.Text = "<font color='rgb(150, 100, 255)'>●</font> Ping: ..."
            end

            local v901 = if not (n5 >= 60) then not (n5 >= 30) and "rgb(255, 100, 100)" or "rgb(255, 255, 100)" else "rgb(100, 255, 100)"

            v370.Text = string.format("<font color='rgb(150, 100, 255)'>●</font> FPS: <font color='%s'>%d</font>", v901, n5)
            tick()
        end
    end)
    local Performance = t3.Performance
    local t22 = {
		update = connection
	}
    Performance.Overlay = {
		gui = ScreenGui,
		frame = v350,
		connections = t22,
		destroy = function()
        if connection then
            connection:Disconnect()
        end

        if ScreenGui then
            ScreenGui:Destroy()
        end

        t3.Performance.Overlay = nil
    end
	}
end
t1[27] = function(p57, p58)
    local u385 = p58 or {}
    local createWithStaticStroke = t9.createWithStaticStroke
    local v387 = u385.name or "StyledButton"
    local backgroundColor = u385.backgroundColor

    if not backgroundColor then
        backgroundColor = Color3.fromRGB(35, 25, 45)
    end

    local size = u385.size

    if not size then
        size = UDim2.new(1, -20, 0, 50)
    end

    local position = u385.position

    if not position then
        position = UDim2.new(0, 10, 0, 0)
    end

    local v391 = createWithStaticStroke("Frame", p57, {
		Name = v387,
		BackgroundColor3 = backgroundColor,
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		Size = size,
		Position = position,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v391, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance = t9.createInstance
    local color3 = Color3.fromRGB(60, 45, 80)
    local uDim2 = UDim2.new(0, 36, 0, 36)
    local uDim2_29 = UDim2.new(0, 12, 0.5, -18)
    local v396 = createInstance("Frame", v391, {
		Name = "IconContainer",
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = uDim2,
		Position = uDim2_29,
		ZIndex = 6
	})

    t9.createInstance("UICorner", v396, {
		CornerRadius = UDim.new(1, 0)
	})

    local createInstance13 = t9.createInstance
    local uDim2_30 = UDim2.new(0, 24, 0, 24)
    local uDim2_31 = UDim2.new(0.5, -12, 0.5, -12)
    local v400 = u385.icon or "rbxthumb://type=Asset&id=77289067728929&w=150&h=150"
    local Fit = Enum.ScaleType.Fit
    local v402 = createInstance13("ImageLabel", v396, {
		Name = "Icon",
		BackgroundTransparency = 1,
		Size = uDim2_30,
		Position = uDim2_31,
		Image = v400,
		ScaleType = Fit,
		ZIndex = 7
	})
    local createInstance14 = t9.createInstance
    local v404 = u385.title or "Button"
    local color3_11 = Color3.fromRGB(245, 235, 255)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
    local uDim2_32 = UDim2.new(1, -60, 1, 0)
    local uDim2_33 = UDim2.new(0, 55, 0, 0)
    local Left = Enum.TextXAlignment.Left
    local v410 = createInstance14("TextLabel", v391, {
		Name = "Title",
		Text = v404,
		TextColor3 = color3_11,
		TextSize = 15,
		FontFace = font,
		BackgroundTransparency = 1,
		Size = uDim2_32,
		Position = uDim2_33,
		TextXAlignment = Left,
		ZIndex = 7
	})
    local createInstance15 = t9.createInstance
    local uDim2_34 = UDim2.new(1, 0, 1, 0)
    local v413 = createInstance15("TextButton", v391, {
		Name = "Button",
		BackgroundTransparency = 1,
		Size = uDim2_34,
		Text = "",
		AutoButtonColor = false,
		ZIndex = 8
	})

    v413.MouseEnter:Connect(function()
        TweenService:Create(v391, TweenInfo.new(0.15), {
			BackgroundColor3 = Color3.fromRGB(50, 40, 70),
			BackgroundTransparency = 0.1
		}):Play()
        TweenService:Create(v410, TweenInfo.new(0.15), {
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}):Play()
        TweenService:Create(v396, TweenInfo.new(0.15), {
			BackgroundColor3 = Color3.fromRGB(80, 65, 100)
		}):Play()
    end)
    v413.MouseLeave:Connect(function()
        local v902 = TweenService
        local v903 = v391
        local tweenInfo = TweenInfo.new(0.15)
        local backgroundColor2 = u385.backgroundColor

        if not backgroundColor2 then
            backgroundColor2 = Color3.fromRGB(35, 25, 45)
        end

        v902:Create(v903, tweenInfo, {
			BackgroundColor3 = backgroundColor2,
			BackgroundTransparency = 0.2
		}):Play()
        TweenService:Create(v410, TweenInfo.new(0.15), {
			TextColor3 = Color3.fromRGB(245, 235, 255)
		}):Play()
        TweenService:Create(v396, TweenInfo.new(0.15), {
			BackgroundColor3 = Color3.fromRGB(60, 45, 80)
		}):Play()
    end)
    v413.MouseButton1Click:Connect(function()
        t9.playClickSound()
        TweenService:Create(v391, TweenInfo.new(0.05), {
			Size = UDim2.new(1, -20, 0, 48)
		}):Play()
        task.wait(0.05)

        local v906 = TweenService
        local v907 = v391
        local tweenInfo = TweenInfo.new(0.05)
        local size2 = u385.size

        if not size2 then
            size2 = UDim2.new(1, -20, 0, 50)
        end

        v906:Create(v907, tweenInfo, {
			Size = size2
		}):Play()

        local BackgroundColor3 = v391.BackgroundColor3
        local v911 = v391
        local accentColor = u385.accentColor

        if not accentColor then
            accentColor = t2.MAIN_COLOR
        end

        v911.BackgroundColor3 = accentColor
        task.wait(0.1)
        v391.BackgroundColor3 = BackgroundColor3

        if u385.onClick then
            u385.onClick()
        end
    end)

    return {
		container = v391,
		button = v413,
		title = v410,
		icon = v402
	}
end
local v29 = t1[27]
local v30 = t1[28]
local t23 = {}
t1[28] = function(p59)
    local createWithStaticStroke = t9.createWithStaticStroke
    local color3 = Color3.fromRGB(40, 30, 55)
    local uDim2 = UDim2.new(0, 360, 0, 100)
    local uDim2_35 = UDim2.new(0, 8, 0, 8)
    local v419 = createWithStaticStroke("Frame", p59, {
		Name = "PlayerInfoContainer",
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = uDim2,
		Position = uDim2_35,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v419, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance = t9.createInstance
    local uDim2_36 = UDim2.new(1, -16, 1, -8)
    local uDim2_37 = UDim2.new(0, 8, 0, 8)
    local v423 = createInstance("Frame", v419, {
		Name = "AvatarInfoFrame",
		BackgroundTransparency = 1,
		Size = uDim2_36,
		Position = uDim2_37,
		ZIndex = 6
	})
    local createInstance16 = t9.createInstance
    local color3_12 = Color3.fromRGB(60, 45, 75)
    local uDim2_38 = UDim2.new(0, 64, 0, 64)
    local uDim2_39 = UDim2.new(0, 0, 0, 0)
    local v428 = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", v11.UserId)
    local v429 = createInstance16("ImageLabel", v423, {
		Name = "PlayerAvatar",
		BackgroundColor3 = color3_12,
		BorderSizePixel = 0,
		Size = uDim2_38,
		Position = uDim2_39,
		Image = v428,
		ZIndex = 7
	})

    t9.createInstance("UICorner", v429, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance17 = t9.createInstance
    local uDim2_40 = UDim2.new(1, -72, 1, 0)
    local uDim2_41 = UDim2.new(0, 72, 0, 0)
    local v433 = createInstance17("Frame", v423, {
		Name = "InfoFrame",
		BackgroundTransparency = 1,
		Size = uDim2_40,
		Position = uDim2_41,
		ZIndex = 6
	})
    local createInstance18 = t9.createInstance
    local DisplayName = v11.DisplayName
    local color3_13 = Color3.fromRGB(250, 240, 255)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_42 = UDim2.new(1, 0, 0, 24)
    local uDim2_43 = UDim2.new(0, 0, 0, 0)

    createInstance18("TextLabel", v433, {
		Name = "DisplayName",
		Text = DisplayName,
		TextColor3 = color3_13,
		TextSize = 18,
		FontFace = font,
		BackgroundTransparency = 1,
		Size = uDim2_42,
		Position = uDim2_43,
		ZIndex = 7
	})

    local createInstance19 = t9.createInstance
    local v441 = "@" .. v11.Name
    local color3_14 = Color3.fromRGB(220, 210, 230)
    local font3 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    local uDim2_44 = UDim2.new(1, 0, 0, 18)
    local uDim2_45 = UDim2.new(0, 0, 0, 24)

    createInstance19("TextLabel", v433, {
		Name = "Username",
		Text = v441,
		TextColor3 = color3_14,
		TextSize = 12,
		FontFace = font3,
		BackgroundTransparency = 1,
		Size = uDim2_44,
		Position = uDim2_45,
		ZIndex = 7
	})

    local createInstance20 = t9.createInstance
    local color3_15 = Color3.fromRGB(200, 180, 230)
    local font4 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_46 = UDim2.new(1, 0, 0, 20)
    local uDim2_47 = UDim2.new(0, 0, 0, 48)

    createInstance20("TextLabel", v433, {
		Name = "GameName",
		Text = "Murder Mystery 2",
		TextColor3 = color3_15,
		TextSize = 14,
		FontFace = font4,
		BackgroundTransparency = 1,
		Size = uDim2_46,
		Position = uDim2_47,
		ZIndex = 7
	})

    local createInstance21 = t9.createInstance
    local v452 = "Player ID: " .. tostring(v11.UserId)
    local color3_16 = Color3.fromRGB(220, 210, 230)
    local font5 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    local uDim2_48 = UDim2.new(0.48, -4, 0, 18)
    local uDim2_49 = UDim2.new(0, 0, 0, 72)

    createInstance21("TextLabel", v433, {
		Name = "PlayerId",
		Text = v452,
		TextColor3 = color3_16,
		TextSize = 12,
		FontFace = font5,
		BackgroundTransparency = 1,
		Size = uDim2_48,
		Position = uDim2_49,
		ZIndex = 7
	})

    local createInstance22 = t9.createInstance
    local v458 = "Server ID: " .. tostring(game.PlaceId)
    local color3_17 = Color3.fromRGB(220, 210, 230)
    local font6 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    local uDim2_50 = UDim2.new(0.48, -4, 0, 18)
    local uDim2_51 = UDim2.new(0.52, 0, 0, 72)

    createInstance22("TextLabel", v433, {
		Name = "ServerId",
		Text = v458,
		TextColor3 = color3_17,
		TextSize = 12,
		FontFace = font6,
		BackgroundTransparency = 1,
		Size = uDim2_50,
		Position = uDim2_51,
		ZIndex = 7
	})

    return v419
end
t23.createPlayerInfoContainer = t1[28]
t1[28] = function(p60)
    local createWithStaticStroke = t9.createWithStaticStroke
    local color3 = Color3.fromRGB(30, 20, 40)
    local uDim2 = UDim2.new(0, 360, 0, 180)
    local uDim2_52 = UDim2.new(0, 8, 0, 116)
    local v468 = createWithStaticStroke("Frame", p60, {
		BorderSizePixel = 0,
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.5,
		Size = uDim2,
		Position = uDim2_52,
		Name = "SpeedJumpContainer",
		ZIndex = 5
	})

    t9.createInstance("UICorner", v468, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance = t9.createInstance
    local color3_18 = Color3.fromRGB(240, 230, 250)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_53 = UDim2.new(1, 0, 0, 20)
    local uDim2_54 = UDim2.new(0, 0, 0, 8)
    local Center = Enum.TextXAlignment.Center

    createInstance("TextLabel", v468, {
		Name = "SpeedJumpTitle",
		Text = "Speed And Jump",
		TextColor3 = color3_18,
		TextSize = 14,
		FontFace = font,
		BackgroundTransparency = 1,
		Size = uDim2_53,
		Position = uDim2_54,
		TextXAlignment = Center,
		ZIndex = 6
	})
    v30(v468, "Speed Walk", 32, t3.Movement.SpeedWalk, "Enabled", function(p61)
        t3.Movement.SpeedWalk.Enabled = p61
        t20.updateWalkSpeed()
    end)

    local createInstance23 = t9.createInstance
    local color3_19 = Color3.fromRGB(35, 25, 45)
    local uDim2_55 = UDim2.new(1, -20, 0, 24)
    local uDim2_56 = UDim2.new(0, 10, 0, 76)
    local v479 = createInstance23("Frame", v468, {
		Name = "SpeedWalkSliderContainer",
		BackgroundColor3 = color3_19,
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		Size = uDim2_55,
		Position = uDim2_56,
		ZIndex = 6
	})

    t9.createInstance("UICorner", v479, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance24 = t9.createInstance
    local color3_20 = Color3.fromRGB(80, 60, 100)
    local uDim2_57 = UDim2.new(0, 0, 1, 0)
    local uDim2_58 = UDim2.new(0, 0, 0, 0)
    local v484 = createInstance24("Frame", v479, {
		Name = "SpeedWalkSlider",
		BackgroundColor3 = color3_20,
		BorderSizePixel = 0,
		Size = uDim2_57,
		Position = uDim2_58,
		ZIndex = 7
	})

    t9.createInstance("UICorner", v484, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance25 = t9.createInstance
    local color3_21 = Color3.fromRGB(245, 235, 255)
    local font7 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    local uDim2_59 = UDim2.new(1, 0, 1, 0)
    local uDim2_60 = UDim2.new(0, 0, 0, 0)
    local Center5 = Enum.TextXAlignment.Center
    local v491 = createInstance25("TextLabel", v479, {
		Name = "SpeedWalkValue",
		Text = "16",
		TextColor3 = color3_21,
		TextSize = 12,
		FontFace = font7,
		BackgroundTransparency = 1,
		Size = uDim2_59,
		Position = uDim2_60,
		TextXAlignment = Center5,
		ZIndex = 8
	})

    v30(v468, "Jump Power", 104, t3.Movement.JumpPower, "Enabled", function(p62)
        t3.Movement.JumpPower.Enabled = p62
        t20.updateJumpPower()
    end)

    local createInstance26 = t9.createInstance
    local color3_22 = Color3.fromRGB(35, 25, 45)
    local uDim2_61 = UDim2.new(1, -20, 0, 24)
    local uDim2_62 = UDim2.new(0, 10, 0, 148)
    local v496 = createInstance26("Frame", v468, {
		Name = "JumpPowerSliderContainer",
		BackgroundColor3 = color3_22,
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		Size = uDim2_61,
		Position = uDim2_62,
		ZIndex = 6
	})

    t9.createInstance("UICorner", v496, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance27 = t9.createInstance
    local color3_23 = Color3.fromRGB(80, 60, 100)
    local uDim2_63 = UDim2.new(0, 0, 1, 0)
    local uDim2_64 = UDim2.new(0, 0, 0, 0)
    local v501 = createInstance27("Frame", v496, {
		Name = "JumpPowerSlider",
		BackgroundColor3 = color3_23,
		BorderSizePixel = 0,
		Size = uDim2_63,
		Position = uDim2_64,
		ZIndex = 7
	})

    t9.createInstance("UICorner", v501, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance28 = t9.createInstance
    local color3_24 = Color3.fromRGB(245, 235, 255)
    local font8 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    local uDim2_65 = UDim2.new(1, 0, 1, 0)
    local uDim2_66 = UDim2.new(0, 0, 0, 0)
    local Center6 = Enum.TextXAlignment.Center
    local v508 = createInstance28("TextLabel", v496, {
		Name = "JumpPowerValue",
		Text = "50",
		TextColor3 = color3_24,
		TextSize = 12,
		FontFace = font8,
		BackgroundTransparency = 1,
		Size = uDim2_65,
		Position = uDim2_66,
		TextXAlignment = Center6,
		ZIndex = 8
	})

    t23.createSlider(v484, v491, 16, 116, 16, function(p63)
        t3.Movement.SpeedWalk.Value = p63

        if t3.Movement.SpeedWalk.Enabled then
            t20.updateWalkSpeed()
        end
    end)
    t23.createSlider(v501, v508, 50, 150, 50, function(p64)
        t3.Movement.JumpPower.Value = p64

        if t3.Movement.JumpPower.Enabled then
            t20.updateJumpPower()
        end
    end)

    return v468
end
t23.createSpeedJumpContainer = t1[28]
t1[28] = function(p65, p66, p67, p68, p69, p70)
    local v515 = p69
    local u516 = false
    if not p69 then
        v515 = p67
    end
    local u517 = v515
    local v518 = t9
    local v519 = (p69 - p67) / (p68 - p67)
    local createInstance = v518.createInstance
    local p65Parent = p65.Parent
    local uDim2 = UDim2.new(0, 20, 0, 20)
    local vector2 = Vector2.new(0.5, 0.5)
    local uDim2_67 = UDim2.new(v519, 0, 0.5, 0)
    local color3 = Color3.fromRGB(255, 255, 255)
    local v526 = createInstance("Frame", p65Parent, {
		Name = "SliderThumb",
		Size = uDim2,
		AnchorPoint = vector2,
		Position = uDim2_67,
		BackgroundColor3 = color3,
		BorderSizePixel = 0,
		ZIndex = 15
	})
    t9.createInstance("UICorner", v526, {
		CornerRadius = UDim.new(1, 0)
	})
    local createInstance29 = t9.createInstance
    local color3_25 = Color3.fromRGB(150, 100, 255)
    createInstance29("UIStroke", v526, {
		Thickness = 2,
		Color = color3_25
	})
    p65.Size = UDim2.new(v519, 0, 1, 0)
    local function v529(p71)
        local AbsoluteSizeX = p65.Parent.AbsoluteSize.X
        local v919 = math.clamp(p71, 0, AbsoluteSizeX)
        local _math = math
        local v921 = v919 / AbsoluteSizeX
        local v922 = _math.floor(p67 + (p68 - p67) * v921)

        TweenService:Create(p65, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(v921, 0, 1, 0)
		}):Play()
        TweenService:Create(v526, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(v921, 0, 0.5, 0)
		}):Play()
        p66.Text = tostring(v922)
        u517 = v922

        local v923 = v526
        local v924 = u516

        if v924 then
            v924 = Color3.fromRGB(200, 150, 255)
        end

        if not v924 then
            v924 = Color3.fromRGB(255, 255, 255)
        end

        v923.BackgroundColor3 = v924

        local v925 = p65
        local v926 = u516

        if v926 then
            v926 = Color3.fromRGB(120, 80, 150)
        end

        if not v926 then
            v926 = Color3.fromRGB(80, 60, 100)
        end

        v925.BackgroundColor3 = v926

        if p70 then
            p70(v922)
        end
    end
    local createInstance30 = t9.createInstance
    local p65Parent2 = p65.Parent
    local uDim2_68 = UDim2.new(1, 0, 1, 0)
    local uDim2_69 = UDim2.new(0, 0, 0, 0)
    local v534 = createInstance30("TextButton", p65Parent2, {
		Name = "SliderButton",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = uDim2_68,
		Position = uDim2_69,
		Text = "",
		AutoButtonColor = false,
		ZIndex = 10
	})
    local createInstance31 = t9.createInstance
    local uDim2_70 = UDim2.new(1, 0, 1, 0)
    local uDim2_71 = UDim2.new(0, 0, 0, 0)
    local v538 = createInstance31("TextButton", v526, {
		Name = "ThumbButton",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = uDim2_70,
		Position = uDim2_71,
		Text = "",
		AutoButtonColor = false,
		ZIndex = 20
	})
    local u540
    local u539
    local function v541(p72)
        local v934 = p72.UserInputType == Enum.UserInputType.MouseButton1

        if not v934 then
            v934 = p72.UserInputType == Enum.UserInputType.Touch
        end

        if v934 then
            u516 = false
            u540 = nil
            u539 = nil
            TweenService:Create(v526, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()
            TweenService:Create(p65, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundColor3 = Color3.fromRGB(80, 60, 100)
			}):Play()
        end
    end
    v534.InputBegan:Connect(function(input)
        local v928 = input.UserInputType == Enum.UserInputType.MouseButton1

        if not v928 then
            v928 = input.UserInputType == Enum.UserInputType.Touch
        end

        if v928 then
            u516 = true

            local AbsolutePosition = p65.Parent.AbsolutePosition
            local v930 = input.Position.X - AbsolutePosition.X

            v529(v930)
        end
    end)
    v534.InputEnded:Connect(v541)
    v534.InputChanged:Connect(function(input)
        local v942 = u516

        if v942 then
            v942 = not u540

            if v942 then
                v942 = input.UserInputType == Enum.UserInputType.MouseMovement

                if not v942 then
                    v942 = input.UserInputType == Enum.UserInputType.Touch
                end
            end
        end

        if v942 then
            local AbsolutePosition = p65.Parent.AbsolutePosition
            local v944 = input.Position.X - AbsolutePosition.X

            v529(v944)
        end
    end)
    v538.InputBegan:Connect(function(input)
        local v932 = input.UserInputType == Enum.UserInputType.MouseButton1

        if not v932 then
            v932 = input.UserInputType == Enum.UserInputType.Touch
        end

        if v932 then
            u516 = true
            u540 = v526.Position
            u539 = input.Position
            v526.BackgroundColor3 = Color3.fromRGB(200, 150, 255)
        end
    end)
    v538.InputEnded:Connect(v541)
    v538.InputChanged:Connect(function(input)
        local v936 = u516

        if v936 then
            v936 = u540

            if v936 then
                v936 = u539

                if v936 then
                    v936 = input.UserInputType == Enum.UserInputType.MouseMovement

                    if not v936 then
                        v936 = input.UserInputType == Enum.UserInputType.Touch
                    end
                end
            end
        end

        if v936 then
            local _ = p65.Parent.AbsolutePosition
            local AbsoluteSizeX = p65.Parent.AbsoluteSize.X
            local v939 = input.Position.X - u539.X
            local v940 = math.clamp(u540.X.Scale * AbsoluteSizeX + v939, 0, AbsoluteSizeX)

            v529(v940)
        end
    end)
    local function v542(p73)
        local v946 = math.clamp(p73, p67, p68)
        local v947 = (v946 - p67) / (p68 - p67)

        TweenService:Create(p65, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(v947, 0, 1, 0)
		}):Play()
        TweenService:Create(v526, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(v947, 0, 0.5, 0)
		}):Play()
        p66.Text = tostring(v946)
        u517 = v946

        if p70 then
            p70(v946)
        end
    end
    v538.MouseEnter:Connect(function()
        if not u516 then
            local v948 = TweenService
            local v949 = v526
            local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local uDim2_72 = UDim2.new(0, 24, 0, 24)
            local Create = v948.Create
            local color3_26 = Color3.fromRGB(230, 230, 255)

            Create(v948, v949, tweenInfo, {
				Size = uDim2_72,
				BackgroundColor3 = color3_26
			}):Play()
        end
    end)
    v538.MouseLeave:Connect(function()
        if not u516 then
            local v954 = TweenService
            local v955 = v526
            local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local uDim2_73 = UDim2.new(0, 20, 0, 20)
            local color3_27 = Color3.fromRGB(255, 255, 255)

            v954:Create(v955, tweenInfo, {
				Size = uDim2_73,
				BackgroundColor3 = color3_27
			}):Play()
        end
    end)
    v534.MouseEnter:Connect(function()
        TweenService:Create(p65, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(90, 70, 110)
		}):Play()
    end)
    v534.MouseLeave:Connect(function()
        if not u516 then
            TweenService:Create(p65, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundColor3 = Color3.fromRGB(80, 60, 100)
			}):Play()
        end
    end)
    v542(p69)

    return {
		setValue = v542,
		getValue = function()
        return u517
    end,
		thumb = v526
	}
end
t23.createSlider = t1[28]
t1[28] = function(p74, p75, p76, p77, p78)
    local createWithStaticStroke = t9.createWithStaticStroke
    local color3 = Color3.fromRGB(50, 40, 65)
    local uDim2 = UDim2.new(0, 116, 0, 48)
    local uDim2_74 = UDim2.new(0, 4, 0, p76)
    local v552 = "Tab_" .. p77
    local v553 = createWithStaticStroke("Frame", p74, {
		BorderSizePixel = 0,
		BackgroundColor3 = color3,
		Size = uDim2,
		Position = uDim2_74,
		Name = v552,
		BackgroundTransparency = 0.7,
		ZIndex = 12
	})

    t9.createInstance("UICorner", v553, {
		CornerRadius = UDim.new(0, 5)
	})

    local createInstance = t9.createInstance
    local uDim2_75 = UDim2.new(1, 0, 1, 0)
    local v556 = "TabButton_" .. p77
    local v557 = createInstance("TextButton", v553, {
		Size = uDim2_75,
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
		Name = v556,
		ZIndex = 15
	})
    local createInstance32 = t9.createInstance
    local uDim2_76 = UDim2.new(1, 0, 1, 0)
    local color3_28 = Color3.fromRGB(240, 230, 250)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    local v562 = createInstance32("TextLabel", v553, {
		Size = uDim2_76,
		BackgroundTransparency = 1,
		Text = p75,
		TextColor3 = color3_28,
		FontFace = font,
		TextSize = 13,
		TextWrapped = true,
		ZIndex = 13
	})
    local createInstance33 = t9.createInstance
    local uDim2_77 = UDim2.new(1, 0, 1, 0)
    local v565 = "content_" .. p77
    local ScrollingDirectionY = Enum.ScrollingDirection.Y
    local color3_29 = Color3.fromRGB(120, 100, 150)
    local uDim2_78 = UDim2.new(0, 0, 0, 0)
    local v569 = createInstance33("ScrollingFrame", p78, {
		Size = uDim2_77,
		BackgroundTransparency = 1,
		Visible = false,
		Name = v565,
		ScrollingDirection = ScrollingDirectionY,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = color3_29,
		CanvasSize = uDim2_78,
		BorderSizePixel = 0,
		ZIndex = 5
	})
    local createInstance34 = t9.createInstance
    local uDim2_79 = UDim2.new(1, 0, 0, 0)
    local v572 = "contentContainer_" .. p77

    return v557, v553, createInstance34("Frame", v569, {
		Size = uDim2_79,
		BackgroundTransparency = 1,
		Name = v572,
		ZIndex = 5
	}), v562, v569
end
t23.createTabButton = t1[28]
t1[28] = function()
    local createInstance = t9.createInstance
    local v574 = v7
    local Global = Enum.ZIndexBehavior.Global
    local v576 = createInstance("ScreenGui", v574, {
		Name = "ShootMurdererGui",
		ResetOnSpawn = false,
		ZIndexBehavior = Global,
		DisplayOrder = 50
	})
    local createWithStaticStroke = t9.createWithStaticStroke
    local color3 = Color3.fromRGB(40, 30, 55)
    local uDim2 = UDim2.new(0, 184, 0, 82)
    local ShootMurdererPosition = t3.ShootMurderer.Position
    if not ShootMurdererPosition then
        ShootMurdererPosition = UDim2.new(0.5, 0, 0.5, 0)
    end
    local vector2 = Vector2.new(0.5, 0.5)
    local v582 = createWithStaticStroke("Frame", v576, {
		BorderSizePixel = 0,
		BackgroundColor3 = color3,
		Size = uDim2,
		Position = ShootMurdererPosition,
		AnchorPoint = vector2,
		Name = "shootButton",
		BackgroundTransparency = 0.3,
		ZIndex = 1
	})
    t9.createInstance("UICorner", v582, {
		CornerRadius = UDim.new(0, 5)
	})
    t9.createInstance("UIGradient", v582, {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 40, 70)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 25, 50))
		}),
		Rotation = 90
	})
    local createInstance35 = t9.createInstance
    local color3_30 = Color3.fromRGB(255, 255, 255)
    local font = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_80 = UDim2.new(1, 0, 1, 0)
    local uDim2_81 = UDim2.new(0.5, 0, 0.5, 0)
    local vector2_2 = Vector2.new(0.5, 0.5)
    local color3_31 = Color3.fromRGB(240, 230, 250)
    local v590 = createInstance35("TextLabel", v582, {
		BorderSizePixel = 0,
		TextSize = 19,
		BackgroundColor3 = color3_30,
		FontFace = font,
		BackgroundTransparency = 1,
		Size = uDim2_80,
		Position = uDim2_81,
		AnchorPoint = vector2_2,
		Text = "Shoot Murderer",
		TextColor3 = color3_31,
		TextScaled = false,
		TextWrapped = true,
		ZIndex = 2
	})
    local u591 = false
    local vector2_3
    local Position
    local u594
    local u595 = false
    local function v596()
        local v959, v960, v961 = ipairs(v3:GetPlayers())
        local v962

        repeat
            v961, v962 = v959(v960, v961)

            if not v961 then
                for _, player in ipairs(v3:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Knife") then
                        return player
                    end
                end

                return nil
            end
        until v962.Backpack:FindFirstChild("Knife")

        return v962
    end
    local function v597()
        local v965, v966, v967 = ipairs(v3:GetPlayers())
        local v968

        repeat
            v967, v968 = v965(v966, v967)

            if not v967 then
                for _, player in ipairs(v3:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Gun") then
                        return player
                    end
                end

                return nil
            end
        until v968.Backpack:FindFirstChild("Gun")

        return v968
    end
    local function v598(p79, p80)
        local v973 = p79

        if p79 then
            v973 = p79.Character

            if v973 then
                v973 = p79.Character:FindFirstChild("HumanoidRootPart")
            end
        end

        if v973 then
            local HumanoidRootPart = p79.Character:FindFirstChild("HumanoidRootPart")
            local Humanoid = p79.Character:FindFirstChild("Humanoid")

            if not HumanoidRootPart or not Humanoid then
                local v976 = HumanoidRootPart and HumanoidRootPart.Position

                if not v976 then
                    v976 = Vector3.new(0, 0, 0)
                end

                return v976
            end

            local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
            local MoveDirection = Humanoid.MoveDirection

            return HumanoidRootPart.Position + AssemblyLinearVelocity * Vector3.new(0.75, 0.5, 0.75) * (p80 / 15) + MoveDirection * p80
        end

        return Vector3.new(0, 0, 0)
    end
    local function v599()
        if v597() ~= v11 then
            return
        end

        local v979 = v596()

        if not v979 then
            return
        end

        if not v11.Character then
            return
        end

        if not v11.Character:FindFirstChild("Gun") then
            local Humanoid = v11.Character:FindFirstChild("Humanoid")
            local v981 = Humanoid

            if Humanoid then
                v981 = v11.Backpack:FindFirstChild("Gun")
            end

            if not v981 then
                return
            end

            Humanoid:EquipTool(v11.Backpack:FindFirstChild("Gun"))
        end

        if not v979.Character:FindFirstChild("HumanoidRootPart") then
            return
        end

        local v982 = v598(v979, 2.8)

        if not v11.Character:FindFirstChild("RightHand") then
            return
        end

        local t24 = {
			CFrame.new(v11.Character.RightHand.Position),
			CFrame.new(v982)
		}
        local Shoot = v11.Character:WaitForChild("Gun"):WaitForChild("Shoot")
        local t25 = { unpack(t24) }

        Shoot:FireServer(v2(t25))

        local BackgroundColor3 = v582.BackgroundColor3

        TweenService:Create(v582, TweenInfo.new(0.1), {
			BackgroundColor3 = Color3.fromRGB(255, 100, 100)
		}):Play()
        task.wait(0.1)
        TweenService:Create(v582, TweenInfo.new(0.1), {
			BackgroundColor3 = BackgroundColor3
		}):Play()
    end
    local createInstance36 = t9.createInstance
    local uDim2_82 = UDim2.new(1, 0, 1, 0)
    local v602 = createInstance36("TextButton", v582, {
		Name = "DragButton",
		Size = uDim2_82,
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
		ZIndex = 10
	})
    v602.InputBegan:Connect(function(input)
        local v988 = input.UserInputType == Enum.UserInputType.MouseButton1

        if not v988 then
            v988 = input.UserInputType == Enum.UserInputType.Touch
        end

        if v988 then
            u591 = false
            u595 = true
            u594 = input.UserInputType == Enum.UserInputType.Touch and input
            vector2_3 = Vector2.new(input.Position.X, input.Position.Y)
            Position = v582.Position
            v582.BackgroundColor3 = Color3.fromRGB(50, 40, 75)
            v582.BackgroundTransparency = 0.2

            return Enum.ContextActionResult.Sink
        end
    end)
    v602.InputChanged:Connect(function(input)
        if not vector2_3 then
            return
        end

        if input.UserInputType == Enum.UserInputType.Touch and (not u594 or input ~= u594) then
            return
        end

        local v990 = Vector2.new(input.Position.X, input.Position.Y) - vector2_3

        if not u591 and v990.Magnitude > 5 then
            u591 = true
            u595 = false
        end

        if u591 then
            v582.Position = UDim2.new(Position.X.Scale, Position.X.Offset + v990.X, Position.Y.Scale, Position.Y.Offset + v990.Y)
        end
    end)
    v602.InputEnded:Connect(function(_)
        if u595 and not u591 then
            t9.playClickSound()
            v599()
        end

        v582.BackgroundColor3 = Color3.fromRGB(40, 30, 55)
        v582.BackgroundTransparency = 0.3
        v590.TextColor3 = Color3.fromRGB(240, 230, 250)

        if u591 then
            local Position3 = v582.Position

            t3.ShootMurderer.Position = Position3
        end

        u591 = false
    end)
    v602.MouseEnter:Connect(function()
        if not u591 then
            v582.BackgroundTransparency = 0.2
            v582.BackgroundColor3 = Color3.fromRGB(45, 35, 60)
            v590.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end)
    v602.MouseLeave:Connect(function()
        if not u591 then
            v582.BackgroundTransparency = 0.3
            v582.BackgroundColor3 = Color3.fromRGB(40, 30, 55)
            v590.TextColor3 = Color3.fromRGB(240, 230, 250)
        end
    end)

    return {
		gui = v576,
		destroy = function()
        if v576 then
            v576:Destroy()
        end
    end
	}
end
t23.createShootMurdererButton = t1[28]
t1[28] = function(p82)
    local createWithStaticStroke = t9.createWithStaticStroke
    local color3 = Color3.fromRGB(40, 30, 55)
    local uDim2 = UDim2.new(1, -20, 0, 300)
    local uDim2_83 = UDim2.new(0, 10, 0, 20)
    local v608 = createWithStaticStroke("Frame", p82, {
		Name = "EspContainer",
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = uDim2,
		Position = uDim2_83,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v608, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance = t9.createInstance
    local color3_32 = Color3.fromRGB(240, 230, 250)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_84 = UDim2.new(1, 0, 0, 30)
    local uDim2_85 = UDim2.new(0, 0, 0, 0)
    local Center = Enum.TextXAlignment.Center

    createInstance("TextLabel", v608, {
		Name = "EspTitle",
		Text = "ESP",
		TextColor3 = color3_32,
		TextSize = 16,
		FontFace = font,
		BackgroundTransparency = 1,
		Size = uDim2_84,
		Position = uDim2_85,
		TextXAlignment = Center,
		ZIndex = 6
	})
    v30(v608, "ESP Name", 40, t10.ESP_STATES, "ESPName", function(p83)
        if not p83 then
            t10.clearAllESP()

            return
        end

        t10.updateESP()
    end)

    local n6 = 92

    v30(v608, "Murderer Name", n6, t10.ESP_STATES, "MurdererName", function(_)
        if t10.ESP_STATES.ESPName then
            t10.updateESP()
        end
    end)

    local v616 = n6 + 52

    v30(v608, "Sheriff Name", v616, t10.ESP_STATES, "SheriffName", function(_)
        if t10.ESP_STATES.ESPName then
            t10.updateESP()
        end
    end)

    local v617 = v616 + 52

    v30(v608, "Hero Name", v617, t10.ESP_STATES, "HeroName", function(_)
        if t10.ESP_STATES.ESPName then
            t10.updateESP()
        end
    end)

    local v618 = v617 + 52

    v30(v608, "Innocent Name", v618, t10.ESP_STATES, "InnocentName", function(_)
        if t10.ESP_STATES.ESPName then
            t10.updateESP()
        end
    end)

    return v608
end
t23.createEspContainer = t1[28]
t1[28] = function(p88)
    local createWithStaticStroke = t9.createWithStaticStroke
    local color3 = Color3.fromRGB(40, 30, 55)
    local uDim2 = UDim2.new(1, -20, 0, 300)
    local uDim2_86 = UDim2.new(0, 10, 0, 330)
    local v624 = createWithStaticStroke("Frame", p88, {
		Name = "EspHighlightContainer",
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = uDim2,
		Position = uDim2_86,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v624, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance = t9.createInstance
    local color3_33 = Color3.fromRGB(240, 230, 250)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_87 = UDim2.new(1, 0, 0, 30)
    local uDim2_88 = UDim2.new(0, 0, 0, 0)
    local Center = Enum.TextXAlignment.Center

    createInstance("TextLabel", v624, {
		Name = "EspHighlightTitle",
		Text = "ESP Highlight",
		TextColor3 = color3_33,
		TextSize = 16,
		FontFace = font,
		BackgroundTransparency = 1,
		Size = uDim2_87,
		Position = uDim2_88,
		TextXAlignment = Center,
		ZIndex = 6
	})
    v30(v624, "ESP Highlight", 40, t10.ESP_HIGHLIGHT_STATES, "ESPHighlight", function(p89)
        if not p89 then
            t10.clearAllHighlights()

            return
        end

        t10.updateHighlights()
    end)

    local n7 = 92

    v30(v624, "ESP Highlight Murderer", n7, t10.ESP_HIGHLIGHT_STATES, "ESPHighlightMurderer", function(_)
        if t10.ESP_HIGHLIGHT_STATES.ESPHighlight then
            t10.updateHighlights()
        end
    end)

    local v632 = n7 + 52

    v30(v624, "ESP Highlight Sheriff", v632, t10.ESP_HIGHLIGHT_STATES, "ESPHighlightSheriff", function(_)
        if t10.ESP_HIGHLIGHT_STATES.ESPHighlight then
            t10.updateHighlights()
        end
    end)

    local v633 = v632 + 52

    v30(v624, "ESP Highlight Hero", v633, t10.ESP_HIGHLIGHT_STATES, "ESPHighlightHero", function(_)
        if t10.ESP_HIGHLIGHT_STATES.ESPHighlight then
            t10.updateHighlights()
        end
    end)

    local v634 = v633 + 52

    v30(v624, "ESP Highlight Innocent", v634, t10.ESP_HIGHLIGHT_STATES, "ESPHighlightInnocent", function(_)
        if t10.ESP_HIGHLIGHT_STATES.ESPHighlight then
            t10.updateHighlights()
        end
    end)

    return v624
end
t23.createEspHighlightContainer = t1[28]
t1[28] = function(p94)
    local createWithStaticStroke = t9.createWithStaticStroke
    local color3 = Color3.fromRGB(40, 30, 55)
    local uDim2 = UDim2.new(1, -20, 0, 300)
    local uDim2_89 = UDim2.new(0, 10, 0, 640)
    local v640 = createWithStaticStroke("Frame", p94, {
		Name = "EspLineContainer",
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = uDim2,
		Position = uDim2_89,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v640, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance = t9.createInstance
    local color3_34 = Color3.fromRGB(240, 230, 250)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_90 = UDim2.new(1, 0, 0, 30)
    local uDim2_91 = UDim2.new(0, 0, 0, 0)
    local Center = Enum.TextXAlignment.Center

    createInstance("TextLabel", v640, {
		Name = "EspLineTitle",
		Text = "Tracers",
		TextColor3 = color3_34,
		TextSize = 16,
		FontFace = font,
		BackgroundTransparency = 1,
		Size = uDim2_90,
		Position = uDim2_91,
		TextXAlignment = Center,
		ZIndex = 6
	})
    v30(v640, "ESP Tracer", 40, t10.ESP_LINE_STATES, "ESPLine", function(p95)
        if p95 then
            t10.StartAllLines()

            return
        end

        t10.StopAllLines()
    end)

    local n8 = 92

    v30(v640, "Murderer Tracer", n8, t10.ESP_LINE_STATES, "MurdererLine", function(_)
        if t10.ESP_LINE_STATES.ESPLine then
            t10.StartAllLines()
        end
    end)

    local v648 = n8 + 52

    v30(v640, "Sheriff Tracer", v648, t10.ESP_LINE_STATES, "SheriffLine", function(_)
        if t10.ESP_LINE_STATES.ESPLine then
            t10.StartAllLines()
        end
    end)

    local v649 = v648 + 52

    v30(v640, "Hero Tracer", v649, t10.ESP_LINE_STATES, "HeroLine", function(_)
        if t10.ESP_LINE_STATES.ESPLine then
            t10.StartAllLines()
        end
    end)

    local v650 = v649 + 52

    v30(v640, "Innocent Tracer", v650, t10.ESP_LINE_STATES, "InnocentLine", function(_)
        if t10.ESP_LINE_STATES.ESPLine then
            t10.StartAllLines()
        end
    end)

    return v640
end
t23.createEspLineContainer = t1[28]
t1[28] = function(p100)
    t23.createPlayerInfoContainer(p100)
    t23.createSpeedJumpContainer(p100)
    v30(p100, "Performance (Ping & Fps)", 316, t3.Performance, "Enabled", function(p101)
        if p101 then
            v28()

            return
        end

        if t3.Performance.Overlay then
            t3.Performance.Overlay.destroy()
        end
    end)
end
t23.createMainTabContent = t1[28]
t1[28] = function(p102)
    return t23.createEspContainer(p102), t23.createEspHighlightContainer(p102), (t23.createEspLineContainer(p102))
end
t23.createVisualTabContent = t1[28]
t1[28] = function(p103)
    v30(p103, "Shoot The Murderer", 32, t3, "ShootMurdererTemp", function(p104)
        if p104 then
            if not t3.ShootMurderer.ButtonData then
                t3.ShootMurderer.ButtonData = t23.createShootMurdererButton()

                return
            end
        elseif t3.ShootMurderer.ButtonData then
            t3.ShootMurderer.ButtonData.destroy()
            t3.ShootMurderer.ButtonData = nil
        end
    end)
end
t23.createCombatTabContent = t1[28]
t3.ShootMurdererTemp = false
t1[28] = function(p105)
    local createWithStaticStroke = t9.createWithStaticStroke
    local color3 = Color3.fromRGB(40, 30, 55)
    local uDim2 = UDim2.new(1, -20, 0, 100)
    local uDim2_92 = UDim2.new(0, 10, 0, 20)
    local v659 = createWithStaticStroke("Frame", p105, {
		Name = "FakeBombJumpContainer",
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = uDim2,
		Position = uDim2_92,
		ZIndex = 5
	})
    t9.createInstance("UICorner", v659, {
		CornerRadius = UDim.new(0, 8)
	})
    local createInstance = t9.createInstance
    local color3_35 = Color3.fromRGB(240, 230, 250)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_93 = UDim2.new(1, 0, 0, 30)
    local uDim2_94 = UDim2.new(0, 0, 0, 5)
    local Center = Enum.TextXAlignment.Center
    createInstance("TextLabel", v659, {
		Name = "BombContainerTitle",
		Text = "Fake Bomb Jump",
		TextColor3 = color3_35,
		TextSize = 16,
		FontFace = font,
		BackgroundTransparency = 1,
		Size = uDim2_93,
		Position = uDim2_94,
		TextXAlignment = Center,
		ZIndex = 6
	})
    local u666
    local function v667()
        if u666 then
            return
        end
        local createInstance37 = t9.createInstance
        local v1011 = v7
        local Sibling = Enum.ZIndexBehavior.Sibling
        local v1013 = createInstance37("ScreenGui", v1011, {
			Name = "FakeBombJumpGui",
			ZIndexBehavior = Sibling,
			ResetOnSpawn = false,
			DisplayOrder = 50
		})
        local createWithStaticStroke2 = t9.createWithStaticStroke
        local color3_36 = Color3.fromRGB(40, 30, 55)
        local uDim2_95 = UDim2.new(0, 78, 0, 78)
        local FakeBombJumpPosition = t3.FakeBombJump.Position
        if not FakeBombJumpPosition then
            FakeBombJumpPosition = UDim2.new(0.5, 0, 0.5, 0)
        end
        local vector2 = Vector2.new(0.5, 0.5)
        local v1019 = createWithStaticStroke2("Frame", v1013, {
			Name = "BombJumpFrame",
			BackgroundColor3 = color3_36,
			BackgroundTransparency = 0.3,
			BorderSizePixel = 0,
			Size = uDim2_95,
			Position = FakeBombJumpPosition,
			AnchorPoint = vector2,
			ZIndex = 1
		})
        t9.createInstance("UICorner", v1019, {
			CornerRadius = UDim.new(0, 5)
		})
        t9.createInstance("UIGradient", v1019, {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 40, 70)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 25, 50))
			}),
			Rotation = 90
		})
        local createInstance38 = t9.createInstance
        local uDim2_96 = UDim2.new(1, 0, 1, 0)
        local color3_37 = Color3.fromRGB(240, 230, 250)
        local font9 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        local v1024 = createInstance38("TextLabel", v1019, {
			Name = "BombText",
			Size = uDim2_96,
			BackgroundTransparency = 1,
			Text = "💣",
			TextColor3 = color3_37,
			TextSize = 30,
			FontFace = font9,
			TextWrapped = true,
			ZIndex = 2
		})
        local createInstance39 = t9.createInstance
        local uDim2_97 = UDim2.new(1, 0, 1, 0)
        local v1027 = createInstance39("TextButton", v1019, {
			Name = "BombButton",
			Size = uDim2_97,
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 3
		})
        local u1028 = false
        local u1029 = false
        local vector2_4
        local Position
        local u1032
        local u1033 = false
        local color3_38 = Color3.fromRGB(240, 230, 250)
        local color3_39 = Color3.fromRGB(255, 255, 255)
        local color3_40 = Color3.fromRGB(255, 150, 150)
        local t26 = {
			READY = color3_38,
			READY_HOVER = color3_39,
			COOLDOWN = color3_40
		}
        local function v1038()
            if not u1028 then
                u1028 = true

                local LocalPlayer = v3.LocalPlayer
                local Character = LocalPlayer.Character

                if not Character then
                    u1028 = false
                    v1024.Text = "💣"
                    u1028 = false
                    v1024.TextColor3 = t26.READY

                    return
                end

                local Backpack = LocalPlayer.Backpack
                local v1111 = Backpack:FindFirstChild("FakeBomb") or Character:FindFirstChild("FakeBomb")

                if not v1111 then
                    local Remotes = v6:FindFirstChild("Remotes")

                    if Remotes then
                        local Extras = Remotes:FindFirstChild("Extras")

                        if Extras then
                            local ReplicateToy = Extras:FindFirstChild("ReplicateToy")

                            if ReplicateToy then
                                pcall(function()
                                    ReplicateToy:InvokeServer("FakeBomb")
                                end)
                            end
                        end
                    end

                    v1111 = Backpack:WaitForChild("FakeBomb", 5)

                    if not v1111 then
                        u1028 = false
                        v1024.Text = "💣"
                        u1028 = false
                        v1024.TextColor3 = t26.READY

                        return
                    end
                end

                v1111.Parent = Character

                if v1111:IsDescendantOf(Character) and Character:FindFirstChild("Humanoid") then
                    local Humanoid = Character.Humanoid
                    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

                    if HumanoidRootPart then
                        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        Humanoid.JumpPower = 53

                        if v1111:FindFirstChild("Remote") then
                            v1111.Remote:FireServer(HumanoidRootPart.CFrame * CFrame.new(0, -3, 0), 50)
                        end

                        task.wait(0.3)

                        if v1111 and Character == v1111.Parent then
                            v1111.Parent = Backpack
                        end

                        if Humanoid then
                            Humanoid.JumpPower = 51
                        end
                    end
                end

                local v1117 = time()

                while time() - v1117 < 22 do
                    if Character ~= v3.LocalPlayer.Character then
                        u1028 = false
                        v1024.Text = "💣"
                        u1028 = false
                        v1024.TextColor3 = t26.READY

                        return
                    end

                    v1024.Text = tostring((math.ceil(22 - (time() - v1117)))) .. "s"
                    u1028 = true
                    v1024.TextColor3 = t26.COOLDOWN
                    task.wait(1)
                end

                u1028 = false
                v1024.Text = "💣"
                u1028 = false
                v1024.TextColor3 = t26.READY
            end
        end
        v1027.InputBegan:Connect(function(input)
            local v1119 = input.UserInputType == Enum.UserInputType.MouseButton1

            if not v1119 then
                v1119 = input.UserInputType == Enum.UserInputType.Touch
            end

            if v1119 then
                u1029 = false
                u1033 = true
                u1032 = input.UserInputType == Enum.UserInputType.Touch and input
                vector2_4 = Vector2.new(input.Position.X, input.Position.Y)
                Position = v1019.Position
                v1019.BackgroundColor3 = Color3.fromRGB(50, 40, 75)
                v1019.BackgroundTransparency = 0.2

                return Enum.ContextActionResult.Sink
            end
        end)
        v1027.InputChanged:Connect(function(input)
            if not vector2_4 then
                return
            end

            if input.UserInputType == Enum.UserInputType.Touch and (not u1032 or input ~= u1032) then
                return
            end

            local v1121 = Vector2.new(input.Position.X, input.Position.Y) - vector2_4
            local v1122 = not u1029

            if v1122 then
                v1122 = v1121.Magnitude > 5
            end

            if v1122 then
                u1029 = true
                u1033 = false
            end

            if u1029 then
                v1019.Position = UDim2.new(Position.X.Scale, Position.X.Offset + v1121.X, Position.Y.Scale, Position.Y.Offset + v1121.Y)
            end
        end)
        v1027.InputEnded:Connect(function(_)
            if u1033 and not u1029 then
                t9.playClickSound()

                if not u1028 then
                    v1038()
                end
            end

            v1019.BackgroundColor3 = Color3.fromRGB(40, 30, 55)
            v1019.BackgroundTransparency = 0.3

            local v1124 = u1028

            if v1124 then
                v1124 = t26.COOLDOWN
            end

            if not v1124 then
                v1124 = t26.READY
            end

            v1024.TextColor3 = v1124

            if u1029 then
                local Position4 = v1019.Position

                t3.FakeBombJump.Position = Position4
            end

            u1029 = false
        end)
        v1027.MouseEnter:Connect(function()
            if not u1029 then
                v1019.BackgroundTransparency = 0.2
                v1019.BackgroundColor3 = Color3.fromRGB(45, 35, 60)

                if not u1028 then
                    v1024.TextColor3 = t26.READY_HOVER
                end
            end
        end)
        v1027.MouseLeave:Connect(function()
            if not u1029 then
                v1019.BackgroundTransparency = 0.3
                v1019.BackgroundColor3 = Color3.fromRGB(40, 30, 55)

                local v1126 = u1028

                if v1126 then
                    v1126 = t26.COOLDOWN
                end

                if not v1126 then
                    v1126 = t26.READY
                end

                v1024.TextColor3 = v1126
            end
        end)
        v1024.Text = "💣"
        u1028 = false
        v1024.TextColor3 = t26.READY
        u666 = {
			gui = v1013,
			frame = v1019,
			destroy = function()
            if v1013 then
                v1013:Destroy()
            end

            u666 = nil
        end
		}
    end
    t3.FakeBombJumpTemp = false
    v30(v659, "Fake Bomb Jump Button", 40, t3, "FakeBombJumpTemp", function(p107)
        if p107 then
            v667()

            return
        end

        if u666 then
            u666.destroy()
        end
    end)
    local v668 = 20 + 100 + 20
    local createWithStaticStroke3 = t9.createWithStaticStroke
    local color3_41 = Color3.fromRGB(40, 30, 55)
    local uDim2_98 = UDim2.new(1, -20, 0, 205)
    local uDim2_99 = UDim2.new(0, 10, 0, v668)
    local v673 = createWithStaticStroke3("Frame", p105, {
		Name = "GrabberContainer",
		BackgroundColor3 = color3_41,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = uDim2_98,
		Position = uDim2_99,
		ZIndex = 5
	})
    t9.createInstance("UICorner", v673, {
		CornerRadius = UDim.new(0, 8)
	})
    local createInstance40 = t9.createInstance
    local color3_42 = Color3.fromRGB(240, 230, 250)
    local font10 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_100 = UDim2.new(1, 0, 0, 30)
    local uDim2_101 = UDim2.new(0, 0, 0, 5)
    local Center7 = Enum.TextXAlignment.Center
    createInstance40("TextLabel", v673, {
		Name = "GrabberTitle",
		Text = "Grabber",
		TextColor3 = color3_42,
		TextSize = 16,
		FontFace = font10,
		BackgroundTransparency = 1,
		Size = uDim2_100,
		Position = uDim2_101,
		TextXAlignment = Center7,
		ZIndex = 6
	})
    local function v680()
        local v1040 = t9.getHRP()

        if not v1040 then
            return false
        end

        for _, child in pairs(workspace:GetChildren()) do
            local v1043 = child:IsA("Model")

            if v1043 then
                v1043 = child:FindFirstChild("GunDrop")
            end

            if v1043 then
                local GunDrop = child.GunDrop

                firetouchinterest(v1040, GunDrop, 0)
                task.wait(0.1)
                firetouchinterest(v1040, GunDrop, 1)

                return true
            end
        end

        return false
    end
    local v681 = v29
    local MAIN_COLOR = t2.MAIN_COLOR
    local uDim2_102 = UDim2.new(0, 10, 0, 40)
    v681(v673, {
		name = "GrabGunStyledButton",
		title = "Grab Gun",
		icon = "rbxthumb://type=Asset&id=77289067728929&w=150&h=150",
		accentColor = MAIN_COLOR,
		position = uDim2_102,
		onClick = function()
        v680()
    end
	})
    local u684
    local function v685()
        if u684 then
            return
        end
        local createInstance41 = t9.createInstance
        local v1046 = v7
        local Sibling = Enum.ZIndexBehavior.Sibling
        local v1048 = createInstance41("ScreenGui", v1046, {
			Name = "GunDropButtonGui",
			ZIndexBehavior = Sibling,
			ResetOnSpawn = false,
			DisplayOrder = 50
		})
        local createWithStaticStroke4 = t9.createWithStaticStroke
        local color3_43 = Color3.fromRGB(40, 30, 55)
        local uDim2_103 = UDim2.new(0, 48, 0, 48)
        local GrabGunPosition = t3.GrabGun.Position
        if not GrabGunPosition then
            GrabGunPosition = UDim2.new(0, 130, 0, 46)
        end
        local vector2 = Vector2.new(0, 0)
        local v1054 = createWithStaticStroke4("Frame", v1048, {
			Name = "GunDropFrame",
			BackgroundColor3 = color3_43,
			BackgroundTransparency = 0.3,
			BorderSizePixel = 0,
			Size = uDim2_103,
			Position = GrabGunPosition,
			AnchorPoint = vector2,
			ZIndex = 1
		})
        t9.createInstance("UICorner", v1054, {
			CornerRadius = UDim.new(1, 0)
		})
        t9.createInstance("UIGradient", v1054, {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 40, 70)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 25, 50))
			}),
			Rotation = 90
		})
        local createInstance42 = t9.createInstance
        local uDim2_104 = UDim2.new(1, 0, 1, 0)
        local uDim2_105 = UDim2.new(0.5, 0, 0.5, 0)
        local vector2_5 = Vector2.new(0.5, 0.5)
        local color3_44 = Color3.fromRGB(240, 230, 250)
        local font11 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        local v1061 = createInstance42("TextLabel", v1054, {
			Name = "GunText",
			Size = uDim2_104,
			Position = uDim2_105,
			AnchorPoint = vector2_5,
			BackgroundTransparency = 1,
			Text = "Get Gun",
			TextColor3 = color3_44,
			TextSize = 10,
			FontFace = font11,
			TextScaled = false,
			TextWrapped = true,
			ZIndex = 2
		})
        local createInstance43 = t9.createInstance
        local uDim2_106 = UDim2.new(1, 0, 1, 0)
        local v1064 = createInstance43("TextButton", v1054, {
			Name = "GunButton",
			Size = uDim2_106,
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 3
		})
        local u1065 = false
        local vector2_6
        local Position
        local u1068
        local u1069 = false
        v1064.InputBegan:Connect(function(input)
            local v1128 = input.UserInputType == Enum.UserInputType.MouseButton1

            if not v1128 then
                v1128 = input.UserInputType == Enum.UserInputType.Touch
            end

            if v1128 then
                u1065 = false
                u1069 = true
                u1068 = input.UserInputType == Enum.UserInputType.Touch and input
                vector2_6 = Vector2.new(input.Position.X, input.Position.Y)
                Position = v1054.Position
                v1054.BackgroundColor3 = Color3.fromRGB(50, 40, 75)

                return Enum.ContextActionResult.Sink
            end
        end)
        v1064.InputChanged:Connect(function(input)
            if not vector2_6 then
                return
            end

            if input.UserInputType == Enum.UserInputType.Touch and (not u1068 or input ~= u1068) then
                return
            end

            local v1130 = Vector2.new(input.Position.X, input.Position.Y) - vector2_6
            local v1131 = not u1065

            if v1131 then
                v1131 = v1130.Magnitude > 5
            end

            if v1131 then
                u1065 = true
                u1069 = false
            end

            if u1065 then
                v1054.Position = UDim2.new(Position.X.Scale, Position.X.Offset + v1130.X, Position.Y.Scale, Position.Y.Offset + v1130.Y)
            end
        end)
        v1064.InputEnded:Connect(function(_)
            if u1069 and not u1065 then
                t9.playClickSound()
                v680()
            end

            v1054.BackgroundTransparency = 0.3
            v1054.BackgroundColor3 = Color3.fromRGB(40, 30, 55)
            v1061.TextColor3 = Color3.fromRGB(240, 230, 250)

            if u1065 then
                local Position5 = v1054.Position

                t3.GrabGun.Position = Position5
            end

            u1065 = false
        end)
        v1064.MouseEnter:Connect(function()
            if not u1065 then
                v1054.BackgroundTransparency = 0.2
                v1054.BackgroundColor3 = Color3.fromRGB(45, 35, 60)
                v1061.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
        end)
        v1064.MouseLeave:Connect(function()
            if not u1065 then
                v1054.BackgroundTransparency = 0.3
                v1054.BackgroundColor3 = Color3.fromRGB(40, 30, 55)
                v1061.TextColor3 = Color3.fromRGB(240, 230, 250)
            end
        end)
        u684 = {
			gui = v1048,
			frame = v1054,
			destroy = function()
            if v1048 then
                v1048:Destroy()
            end

            u684 = nil
        end
		}
    end
    t3.GrabGunTemp = false
    v30(v673, "GrabGun Button", 100, t3, "GrabGunTemp", function(p109)
        if p109 then
            v685()

            return
        end

        if u684 then
            u684.destroy()
        end
    end)
    local u686 = false
    local connection
    t3.AutoGrabGunTemp = false
    v30(v673, "AutoGrabGun", 152, t3, "AutoGrabGunTemp", function(p110)
        u686 = p110

        if p110 then
            if connection then
                connection:Disconnect()
            end

            connection = v5.Heartbeat:Connect(function()
                if u686 then
                    v680()
                    task.wait(0.2)
                end
            end)

            return
        end

        if connection then
            connection:Disconnect()
        end
    end)

    return v659, v673
end
t23.createTeleportTabContent = t1[28]
t1[28] = function(p111)
    local createWithStaticStroke = t9.createWithStaticStroke
    local color3 = Color3.fromRGB(40, 30, 55)
    local uDim2 = UDim2.new(1, -20, 0, 110)
    local uDim2_107 = UDim2.new(0, 10, 0, 20)
    local v693 = createWithStaticStroke("Frame", p111, {
		Name = "FarmContainer",
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = uDim2,
		Position = uDim2_107,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v693, {
		CornerRadius = UDim.new(0, 8)
	})
    v30(v693, "Auto Farm", 10, t3.AutoFarm, "Enabled", function(p112)
        t3.AutoFarm.Enabled = p112

        if p112 then
            t3.AutoFarm.Farming = true

            return
        end

        t3.AutoFarm.Farming = false
    end)
    v30(v693, "Auto Reset (Full Bag)", 62, t3.AutoFarm, "Enabled", function(p113)
        t3.AutoFarm.Enabled = p113

        if p113 then
            t3.AutoFarm.Farming = true

            return
        end

        t3.AutoFarm.Farming = false
    end)

    local n9 = 150
    local createWithStaticStroke5 = t9.createWithStaticStroke
    local uDim2_108 = UDim2.new(1, -20, 0, 100)
    local uDim2_109 = UDim2.new(0, 10, 0, n9)
    local color3_45 = Color3.fromRGB(35, 25, 45)
    local v699 = createWithStaticStroke5("Frame", p111, {
		Name = "StatsContainer",
		Size = uDim2_108,
		Position = uDim2_109,
		BackgroundColor3 = color3_45,
		BackgroundTransparency = 0.2,
		BorderSizePixel = 0,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v699, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance = t9.createInstance
    local color3_46 = Color3.fromRGB(240, 230, 250)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local uDim2_110 = UDim2.new(1, -20, 0, 20)
    local uDim2_111 = UDim2.new(0, 10, 0, 5)
    local Left = Enum.TextXAlignment.Left

    createInstance("TextLabel", v699, {
		Name = "StatsTitle",
		Text = "Farming Statistics",
		TextColor3 = color3_46,
		TextSize = 14,
		FontFace = font,
		BackgroundTransparency = 1,
		Size = uDim2_110,
		Position = uDim2_111,
		TextXAlignment = Left,
		ZIndex = 6
	})

    local createInstance44 = t9.createInstance
    local uDim2_112 = UDim2.new(1, -20, 0, 20)
    local uDim2_113 = UDim2.new(0, 10, 0, 25)
    local color3_47 = Color3.fromRGB(255, 255, 255)
    local Left3 = Enum.TextXAlignment.Left
    local font12 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    local v712 = createInstance44("TextLabel", v699, {
		Name = "CoinLabel",
		Text = "Coin: 0",
		Size = uDim2_112,
		Position = uDim2_113,
		BackgroundTransparency = 1,
		TextColor3 = color3_47,
		TextXAlignment = Left3,
		FontFace = font12,
		TextSize = 13,
		ZIndex = 6
	})
    local createInstance45 = t9.createInstance
    local uDim2_114 = UDim2.new(1, -20, 0, 20)
    local uDim2_115 = UDim2.new(0, 10, 0, 45)
    local color3_48 = Color3.fromRGB(200, 255, 200)
    local Left4 = Enum.TextXAlignment.Left
    local font13 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    local v719 = createInstance45("TextLabel", v699, {
		Name = "HourLabel",
		Text = "Coins/hour: 0",
		Size = uDim2_114,
		Position = uDim2_115,
		BackgroundTransparency = 1,
		TextColor3 = color3_48,
		TextXAlignment = Left4,
		FontFace = font13,
		TextSize = 13,
		ZIndex = 6
	})
    local createInstance46 = t9.createInstance
    local uDim2_116 = UDim2.new(1, -20, 0, 20)
    local uDim2_117 = UDim2.new(0, 10, 0, 65)
    local color3_49 = Color3.fromRGB(200, 200, 200)
    local Left5 = Enum.TextXAlignment.Left
    local font14 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    local v726 = createInstance46("TextLabel", v699, {
		Name = "TimeLabel",
		Text = "0h 0m 0s",
		Size = uDim2_116,
		Position = uDim2_117,
		BackgroundTransparency = 1,
		TextColor3 = color3_49,
		TextXAlignment = Left5,
		FontFace = font14,
		TextSize = 13,
		ZIndex = 6
	})

    v5.Heartbeat:Connect(function()
        if t3.AutoFarm.Enabled then
            if not t4.IsRunning then
                t4.StartTime = tick()
                t4.IsRunning = true
                t4.CoinsCollected = 0
            end

            local v1074 = tick() - t4.StartTime
            local v1075 = math.floor(v1074 / 3600)
            local v1076 = math.floor(v1074 % 3600 / 60)
            local v1077 = math.floor(v1074 % 60)

            v726.Text = string.format("%dh %dm %ds", v1075, v1076, v1077)
            v712.Text = "Coin: " .. t4.CoinsCollected

            if v1074 > 0 then
                v719.Text = "Coins/hour: " .. math.floor(t4.CoinsCollected / v1074 * 3600)

                return
            end
        else
            t4.IsRunning = false
        end
    end)

    local v727 = n9 + 100 + 20
    local createWithStaticStroke6 = t9.createWithStaticStroke
    local color3_50 = Color3.fromRGB(40, 30, 55)
    local uDim2_118 = UDim2.new(1, -20, 0, 110)
    local uDim2_119 = UDim2.new(0, 10, 0, v727)
    local v732 = createWithStaticStroke6("Frame", p111, {
		Name = "KillContainer",
		BackgroundColor3 = color3_50,
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		Size = uDim2_118,
		Position = uDim2_119,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v732, {
		CornerRadius = UDim.new(0, 8)
	})
    v30(v732, "Auto Kill All (Murderer)", 10, t3.KillAll, "Enabled", function(p114)
        t3.KillAll.Enabled = p114

        if not p114 then
            t3.AutoFarm.BagFull = false
        end
    end)
    v30(v732, "Anti-Fling", 62, t3.AntiFling, "Enabled", function(p115)
        if p115 then
            t15.enable()

            return
        end

        t15.disable()
    end)

    return v693, v699, v732
end
t23.createAutoFarmTabContent = t1[28]
t1[28] = function(p116)
    local v734 = v29
    local MAIN_COLOR = t2.MAIN_COLOR
    local uDim2 = UDim2.new(0, 10, 0, 20)
    local v737 = v734(p116, {
		name = "JoinAnotherServer",
		title = "Join Another Server",
		icon = "rbxthumb://type=Asset&id=77289067728929&w=150&h=150",
		accentColor = MAIN_COLOR,
		position = uDim2,
		onClick = function()
        t9.joinAnotherServer()
    end
	})
    local n10 = 80
    local v739 = v29
    local MAIN_COLOR3 = t2.MAIN_COLOR
    local uDim2_120 = UDim2.new(0, 10, 0, n10)
    local v742 = v739(p116, {
		name = "RejoinServer",
		title = "Rejoin",
		icon = "rbxthumb://type=Asset&id=77289067728929&w=150&h=150",
		accentColor = MAIN_COLOR3,
		position = uDim2_120,
		onClick = function()
        t9.rejoinServer()
    end
	})
    local v743 = n10 + 60
    local u744 = false
    local u745
    local function u746()
        local _cloneref = cloneref

        if _cloneref then
            _cloneref = cloneref(game:GetService("VirtualUser"))
        end

        if not _cloneref then
            _cloneref = game:GetService("VirtualUser")
        end

        return _cloneref
    end
    local function u747()
        local v1081 = u746()
        local CurrentCamera = workspace.CurrentCamera

        if v1081 and CurrentCamera then
            pcall(function()
                v1081:Button2Down(Vector2.new(0, 0), CurrentCamera.CFrame)
                task.wait(0.1)
                v1081:Button2Up(Vector2.new(0, 0), CurrentCamera.CFrame)
            end)
        end
    end
    local function v748(p117)
        u744 = p117

        if p117 then
            if u745 then
                task.cancel(u745)
                u745 = nil
            end

            u745 = task.spawn(function()
                while u744 do
                    task.wait(300)
                    u747()
                end
            end)

            return
        end

        if u745 then
            task.cancel(u745)
        end
    end
    t3.AntiAFKTemp = false
    local v749 = v30(p116, "Anti-AFK (every " .. 5 .. " min)", v743, t3, "AntiAFKTemp", function(p118)
        v748(p118)
    end)

    return v737.container, v742.container, v749
end
t23.createActMgrTabContent = t1[28]
t1[28] = function()
    local v750 = t7
    local createInstance = t9.createInstance
    local v752 = v7
    local Global = Enum.ZIndexBehavior.Global

    v750.ScreenGui = createInstance("ScreenGui", v752, {
		Name = "MM2GUI",
		ZIndexBehavior = Global,
		ResetOnSpawn = false,
		DisplayOrder = 100
	})

    local v754 = t7
    local createInstance47 = t9.createInstance
    local v756 = v7
    local Global2 = Enum.ZIndexBehavior.Global

    v754.OpenCloseGui = createInstance47("ScreenGui", v756, {
		Name = "MM2OpenCloseGUI",
		ZIndexBehavior = Global2,
		ResetOnSpawn = false,
		DisplayOrder = 99
	})

    local createWithStaticStroke = t9.createWithStaticStroke
    local OpenCloseGui = t7.OpenCloseGui
    local color3 = Color3.fromRGB(30, 20, 40)
    local uDim2 = UDim2.new(0, 50, 0, 50)
    local uDim2_121 = UDim2.new(0, 20, 0, 20)
    local v763 = createWithStaticStroke("Frame", OpenCloseGui, {
		BorderSizePixel = 0,
		BackgroundColor3 = color3,
		Size = uDim2,
		Position = uDim2_121,
		Name = "open close",
		BackgroundTransparency = 0.5,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v763, {
		CornerRadius = UDim.new(0, 8)
	})

    local createInstance48 = t9.createInstance
    local uDim2_122 = UDim2.new(1, 0, 1, 0)
    local uDim2_123 = UDim2.new(0, 0, 0, 0)

    local function v767()
        t3.GUIVisible = not t3.GUIVisible
        t7.MainFrame.Visible = t3.GUIVisible

        local v1085 = v763
        local GUIVisible = t3.GUIVisible

        if GUIVisible then
            GUIVisible = Color3.fromRGB(30, 20, 40)
        end

        if not GUIVisible then
            GUIVisible = Color3.fromRGB(50, 35, 65)
        end

        v1085.BackgroundColor3 = GUIVisible
    end

    local v768 = createInstance48("TextButton", v763, {
		Name = "OpenCloseButton",
		Text = "",
		BackgroundTransparency = 1,
		Size = uDim2_122,
		Position = uDim2_123,
		ZIndex = 6
	})

    v768.MouseButton1Click:Connect(function()
        t9.playClickSound()
        v767()
    end)
    v768.MouseEnter:Connect(function()
        local v1087 = v763
        local GUIVisible = t3.GUIVisible

        if GUIVisible then
            GUIVisible = Color3.fromRGB(40, 25, 55)
        end

        if not GUIVisible then
            GUIVisible = Color3.fromRGB(60, 45, 75)
        end

        v1087.BackgroundColor3 = GUIVisible
    end)
    v768.MouseLeave:Connect(function()
        local v1089 = v763
        local GUIVisible = t3.GUIVisible

        if GUIVisible then
            GUIVisible = Color3.fromRGB(30, 20, 40)
        end

        if not GUIVisible then
            GUIVisible = Color3.fromRGB(50, 35, 65)
        end

        v1089.BackgroundColor3 = GUIVisible
    end)

    local v769 = t7
    local createWithStaticStroke7 = t9.createWithStaticStroke
    local ScreenGui = t7.ScreenGui
    local color3_51 = Color3.fromRGB(30, 20, 40)
    local uDim2_124 = UDim2.new(0, 522, 0, 306)
    local uDim2_125 = UDim2.new(0, 130, 0, -14)

    v769.MainFrame = createWithStaticStroke7("Frame", ScreenGui, {
		BorderSizePixel = 0,
		BackgroundColor3 = color3_51,
		Size = uDim2_124,
		Position = uDim2_125,
		Name = "mainFrame",
		BackgroundTransparency = 0.5,
		Visible = true,
		ZIndex = 5
	})
    t9.createInstance("UICorner", t7.MainFrame, {
		CornerRadius = UDim.new(0, 5)
	})

    local v775 = t7
    local createWithStaticStroke8 = t9.createWithStaticStroke
    local MainFrame = t7.MainFrame
    local ScrollingDirectionY = Enum.ScrollingDirection.Y
    local color3_52 = Color3.fromRGB(40, 30, 50)
    local uDim2_126 = UDim2.new(0, 124, 0, 258)
    local uDim2_127 = UDim2.new(0, 390, 0, 40)
    local color3_53 = Color3.fromRGB(120, 100, 150)
    local Stop = Enum.SelectionBehavior.Stop
    local Stop2 = Enum.SelectionBehavior.Stop
    local uDim2_128 = UDim2.new(0, 0, 0, 0)

    v775.TabButtonsContainer = createWithStaticStroke8("ScrollingFrame", MainFrame, {
		ScrollingDirection = ScrollingDirectionY,
		BorderSizePixel = 0,
		BackgroundColor3 = color3_52,
		Name = "tabButtonsContainer",
		Size = uDim2_126,
		Position = uDim2_127,
		ScrollBarThickness = 6,
		ScrollBarImageColor3 = color3_53,
		BackgroundTransparency = 0.3,
		SelectionBehaviorRight = Stop,
		SelectionBehaviorLeft = Stop2,
		CanvasSize = uDim2_128,
		ClipsDescendants = true,
		ZIndex = 10
	})
    t9.createInstance("UICorner", t7.TabButtonsContainer, {
		CornerRadius = UDim.new(0, 5)
	})

    local v786 = t7
    local createWithStaticStroke9 = t9.createWithStaticStroke
    local MainFrame2 = t7.MainFrame
    local color3_54 = Color3.fromRGB(255, 255, 255)
    local uDim2_129 = UDim2.new(0, 376, 0, 258)
    local uDim2_130 = UDim2.new(0, 6, 0, 40)

    v786.ContentFrame = createWithStaticStroke9("Frame", MainFrame2, {
		BorderSizePixel = 0,
		BackgroundColor3 = color3_54,
		Size = uDim2_129,
		Position = uDim2_130,
		Name = "contentFrame",
		BackgroundTransparency = 1,
		ZIndex = 5
	})
    t9.createInstance("UICorner", t7.ContentFrame, {
		CornerRadius = UDim.new(0, 5)
	})

    local createWithStaticStroke10 = t9.createWithStaticStroke
    local MainFrame3 = t7.MainFrame
    local color3_55 = Color3.fromRGB(255, 255, 255)
    local uDim2_131 = UDim2.new(0, 510, 0, 26)
    local uDim2_132 = UDim2.new(0, 6, 0, 6)
    local v797 = createWithStaticStroke10("Frame", MainFrame3, {
		BorderSizePixel = 0,
		BackgroundColor3 = color3_55,
		Size = uDim2_131,
		Position = uDim2_132,
		Name = "header",
		BackgroundTransparency = 1,
		ZIndex = 5
	})

    t9.createInstance("UICorner", v797, {
		CornerRadius = UDim.new(0, 5)
	})

    local createInstance49 = t9.createInstance
    local color3_56 = Color3.fromRGB(255, 255, 255)
    local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local color3_57 = Color3.fromRGB(240, 230, 250)
    local uDim2_133 = UDim2.new(0, 144, 0, 30)
    local color3_58 = Color3.fromRGB(255, 255, 255)
    local uDim2_134 = UDim2.new(0, 44, 0, -2)

    createInstance49("TextLabel", v797, {
		BorderSizePixel = 0,
		TextSize = 16,
		BackgroundColor3 = color3_56,
		FontFace = font,
		TextColor3 = color3_57,
		BackgroundTransparency = 1,
		Size = uDim2_133,
		BorderColor3 = color3_58,
		Text = "Murder Mystery 2 | OnyxHub",
		Position = uDim2_134,
		ZIndex = 6
	})

    local t27 = {}

    t7.Tabs = {
		Contents = {},
		Scrolls = {}
	}

    local s1 = "Main"

    for i, v in ipairs({
		"Main",
		"Visual",
		"Combat",
		"Optimization",
		"Teleport",
		"Auto Farm",
		"Emote",
		"ActMgr"
	}) do
        local v809 = v
        local v810 = i - 1
        local BUTTON_HEIGHT = t2.BUTTON_HEIGHT
        local SPACING = t2.SPACING
        local v813 = t23
        local v814 = 4 + v810 * (BUTTON_HEIGHT + SPACING)
        local v815, v816, v817, _, v819 = v813.createTabButton(t7.TabButtonsContainer, v809, v814, v809, t7.ContentFrame)
        local v820 = v816
        local v821 = v819;

        ({})[v809] = v815
        t27[v809] = v820
        t7.Tabs.Contents[v809] = v817
        t7.Tabs.Scrolls[v809] = v821
        v815.MouseButton1Click:Connect(function()
            t9.playClickSound()
            for _, v4 in pairs(t27) do
                if v4 then
                    v4.BackgroundColor3 = Color3.fromRGB(50, 40, 65)
                    v4.BackgroundTransparency = 0.7
                end
            end
            for v1095, v1096 in pairs(t7.Tabs.Scrolls) do

                if v1096 then
                    v1096.Visible = false
                end
            end
            if v820 then
                v820.BackgroundColor3 = Color3.fromRGB(80, 60, 100)
                v820.BackgroundTransparency = 0.3
            end
            if v821 then
                v821.Visible = true
            end
            s1 = v809
        end)
        v815.MouseEnter:Connect(function()
            if s1 ~= v809 then
                TweenService:Create(v820, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundColor3 = Color3.fromRGB(65, 55, 80),
					BackgroundTransparency = 0.5
				}):Play()
            end
        end)
        v815.MouseLeave:Connect(function()
            if s1 ~= v809 then
                TweenService:Create(v820, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundColor3 = Color3.fromRGB(50, 40, 65),
					BackgroundTransparency = 0.7
				}):Play()
            end
        end)
    end

    t9.updateTabButtonsContainerSize(t7.TabButtonsContainer)

    if t27[s1] then
        t27[s1].BackgroundColor3 = Color3.fromRGB(80, 60, 100)
        t27[s1].BackgroundTransparency = 0.3
    end

    if t7.Tabs.Scrolls[s1] then
        t7.Tabs.Scrolls[s1].Visible = true
    end

    if t7.Tabs.Contents.Main then
        t23.createMainTabContent(t7.Tabs.Contents.Main)
        t9.updateCanvasSize(t7.Tabs.Scrolls.Main, t7.Tabs.Contents.Main)
    end

    if t7.Tabs.Contents.Visual then
        t23.createVisualTabContent(t7.Tabs.Contents.Visual)
        t9.updateCanvasSize(t7.Tabs.Scrolls.Visual, t7.Tabs.Contents.Visual)
    end

    if t7.Tabs.Contents.Combat then
        t23.createCombatTabContent(t7.Tabs.Contents.Combat)
        t9.updateCanvasSize(t7.Tabs.Scrolls.Combat, t7.Tabs.Contents.Combat)
    end

    if t7.Tabs.Contents.Teleport then
        t23.createTeleportTabContent(t7.Tabs.Contents.Teleport)
        t9.updateCanvasSize(t7.Tabs.Scrolls.Teleport, t7.Tabs.Contents.Teleport)
    end

    if t7.Tabs.Contents["Auto Farm"] then
        t23.createAutoFarmTabContent(t7.Tabs.Contents["Auto Farm"])
        t9.updateCanvasSize(t7.Tabs.Scrolls["Auto Farm"], t7.Tabs.Contents["Auto Farm"])
    end

    if t7.Tabs.Contents.ActMgr then
        t23.createActMgrTabContent(t7.Tabs.Contents.ActMgr)
        t9.updateCanvasSize(t7.Tabs.Scrolls.ActMgr, t7.Tabs.Contents.ActMgr)
    end

    for _, v in ipairs({
		"Optimization",
		"Emote"
	}) do
        if t7.Tabs.Contents[v] then
            t9.addSpacer(t7.Tabs.Contents[v], 20, 400)
            t9.updateCanvasSize(t7.Tabs.Scrolls[v], t7.Tabs.Contents[v])
        end
    end

    return t7.ScreenGui, t7.OpenCloseGui
end
t23.init = t1[28]
t1[28] = function()
    local v824, v825 = t23.init()

    t21.findRemoteEvents()
    t21.connectRemoteEvents()
    t16.startFarmingLoop()
    t17.startKillAllLoop()
    v11.CharacterAdded:Connect(function(character)
        character:WaitForChild("Humanoid")
        task.wait(0.1)
        t20.updateWalkSpeed()
        t20.updateJumpPower()
    end)

    local Character = v11.Character

    if Character then
        Character = v11.Character:FindFirstChild("Humanoid")
    end

    if Character then
        t20.updateWalkSpeed()
        t20.updateJumpPower()
    end

    v5.Heartbeat:Connect(function()
        if t10.ESP_STATES.ESPName then
            t10.updateESP()

            return
        end

        t10.clearAllESP()
    end)
    v5.Heartbeat:Connect(function()
        if t10.ESP_HIGHLIGHT_STATES.ESPHighlight then
            t10.updateHighlights()

            return
        end

        t10.clearAllHighlights()
    end)

    for _, player in ipairs(v3:GetPlayers()) do
        if player ~= v11 then
            t10.initializePlayer(player)
        end
    end

    v3.PlayerAdded:Connect(function(player)
        if player ~= v11 then
            t10.initializePlayer(player)
        end
    end)
    v3.PlayerRemoving:Connect(function(player)
        if player ~= v11 then
            t10.removePlayerBillboard(player)
            t10.removePlayerHighlight(player)
            t10.RemoveLineForPlayer(player.Name)
        end
    end)
    workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        t10.Camera = workspace.CurrentCamera
    end)
    v3.PlayerAdded:Connect(function(player)
        local v1101 = player ~= v11

        if v1101 then
            v1101 = t10.ESP_LINE_STATES.ESPLine
        end

        if v1101 then
            local v1102 = t10.InitializePlayerLines(player)

            table.insert(t12, v1102)
        end
    end)
    t9.showNotification("OnyxHub", "Script successfully loaded!", 3.5)

    return v824, v825
end
return t1[28]()
