local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

game:GetService("HttpService")

local CurrentCamera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local _Raw = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/D9CpDTMz8Hh4v1wA/raw"))()

_Raw:SetTheme("Dark")

function gradient(p1, p2, p3)
	local s1 = ""
	local v194 = #p1

	for i = 1, v194 do
		local v196 = (i - 1) / math.max(v194 - 1, 1)

		s1 = s1 .. "<font color=\"rgb(" .. math.floor((p2.R + (p3.R - p2.R) * v196) * 255) .. ", " .. math.floor((p2.G + (p3.G - p2.G) * v196) * 255) .. ", " .. math.floor((p2.B + (p3.B - p2.B) * v196) * 255) .. ")\">" .. p1:sub(i, i) .. "</font>"
	end

	return s1
end

local u8 = _Raw:CreateWindow({
	Title = "Murder Mystery 2 ",
	Icon = "door-open",
	Author = "rayz",
	Folder = "wwww",
	Size = UDim2.fromOffset(460, 340),
	Transparent = true,
	Theme = "Dark",
	Resizable = true,
	SideBarWidth = 200,
	BackgroundImageTransparency = 0.42,
	HideSearchBar = false,
	ScrollBarEnabled = true,
	User = {
		Enabled = true,
		Anonymous = false,
		Callback = function()
		end
	},
	OpenButton = {
		Title = "Open ",
		CornerRadius = UDim.new(1, 0),
		StrokeThickness = 3,
		Enabled = true,
		Draggable = true,
		OnlyMobile = false,
		Color = ColorSequence.new(Color3.fromHex("#00eaff"), Color3.fromHex("#00c6ff"))
	}
})
local t1 = {
	HomeTab = u8:Tab({
		Title = "Info",
		Icon = "solar:info-square-bold",
		IconColor = Purple,
		ShowTabTitle = true,
		Border = true
	})
}

do
	local v10 = u8:Section({
		Title = "Main functions",
		Icon = "house",
		Opened = true,
		u8:Divider()
	})
	local v11 = u8:Section({
		Title = "More Functions",
		Icon = "bird",
		Opened = false
	})
	local v12 = u8:Section({
		Title = "Misc",
		Icon = "trash",
		Opened = false
	})

	t1.MainTab = v10:Tab({
		Title = "Main",
		Icon = "box",
		ShowTabTitle = true
	})
	t1.AutoFarmTab = v10:Tab({
		Title = "Farming",
		Icon = "bitcoin",
		ShowTabTitle = true
	})
	t1.MurdTab = v10:Tab({
		Title = "Murder",
		Icon = "sword",
		ShowTabTitle = true
	})
	t1.SheriffTab = v10:Tab({
		Title = "Sheriff",
		Icon = "swords",
		ShowTabTitle = true
	})
	t1.ESPTab = v10:Tab({
		Title = "Esp",
		Icon = "crosshair",
		ShowTabTitle = true,
		u8:Divider()
	})
	t1.TeleportTab = v11:Tab({
		Title = "Teleport",
		Icon = "map-pin",
		ShowTabTitle = true
	})
	t1.PlayerTab = v11:Tab({
		Title = "Player",
		Icon = "person-standing",
		ShowTabTitle = true
	})
	t1.TrollingTab = v11:Tab({
		Title = "Trolling",
		Icon = "laugh",
		ShowTabTitle = true
	})
	t1.MiscTab = v12:Tab({
		Title = "Extra",
		Icon = "settings",
		ShowTabTitle = true
	})
	t1.Visual = v11:Tab({
		Title = "spawners",
		Icon = "eye",
		ShowTabTitle = true
	})
end

local s2 = "Unknown"

pcall(function()
	if identifyexecutor then
		s2 = identifyexecutor()
	end
end)

local t3, t4, u23, u24, u25, u26, u27, s3, u29, u30, u31, u32, u33, u34, u35, Players2, Workspace2, LocalPlayer2, u39, u40, s5, n1, u43, t6

do
	local v16

	do
		local v14 = string.lower(s2)
		local t2 = {
			solara = true,
			xeno = true,
			volcano = true,
			velocity = true
		}

		v16 = false

		for k in pairs(t2) do
			if v14:find(k) then
				v16 = true

				break
			end
		end
	end

	local v18 = v16 and s2 .. " (Not 100% Supported)" or s2 .. " Supported"
	local v19 = v16 and "Some features may not work correctly with your executor." or s2 .. " should run everything fine and everything should work ight"
	local v20 = v16 and "Red" or "Green"

	t1.HomeTab:Paragraph({
		Title = v18,
		Desc = v19,
		Color = v20,
		Image = "cpu",
		ImageSize = 30
	})
	t1.HomeTab:Divider()
	t1.HomeTab:Divider()
	t3 = {
		GetCurrentPlayerData = ReplicatedStorage:FindFirstChild("GetCurrentPlayerData", true)
	}
	t4 = {
		Roles = {},
		Murderer = "Unknown",
		Sheriff = "Unknown",
		Perk = "None"
	}
	u23 = t1.MainTab:Paragraph({
		Title = "Game Info",
		Desc = "Murder: <font color=\"#ff0000\">Unknown</font>\nSheriff: <font color=\"#0000ff\">Unknown</font>\nMurderer Perk: <font color=\"#7F00FF\">None</font>\nGun Dropped: No",
		Image = "component",
		ImageSize = 20
	})

	function u24()
		if t3.GetCurrentPlayerData and t3.GetCurrentPlayerData:IsA("RemoteFunction") then
			local ok, result = pcall(function()
				return t3.GetCurrentPlayerData:InvokeServer()
			end)

			if ok and typeof(result) == "table" then
				t4.Roles = result

				local v199 = t4
				local v200 = t4

				t4.Perk = "None"
				v200.Sheriff = "Unknown"
				v199.Murderer = "Unknown"

				for k, v in pairs(t4.Roles) do
					local k2 = Players:FindFirstChild(k)

					if k2 and k2.Character and k2.Character:FindFirstChild("Humanoid") and k2.Character.Humanoid.Health > 0 then
						if v.Role == "Murderer" then
							t4.Murderer = k
							t4.Perk = v.Perk or "None"
						elseif v.Role == "Sheriff" then
							t4.Sheriff = k
						end
					end
				end
			end
		end
	end
	function u25()
		for _, descendant in ipairs(Workspace:GetDescendants()) do
			if descendant.Name == "GunDrop" then
				return true
			end
		end

		return false
	end
	function u26()
		u24()

		local v206 = u25() and "Yes" or "No"
		local v207 = string.format("Murder: <font color=\"#ff0000\">%s</font>\nSheriff: <font color=\"#0000ff\">%s</font>\nMurderer Perk: <font color=\"#7F00FF\">%s</font>\nGun Dropped: %s", t4.Murderer, t4.Sheriff, t4.Perk, v206)

		u23:SetDesc(v207)
	end

	task.spawn(function()
		while true do
			u26()
			task.wait(0.2)
		end
	end)
	u27 = true
	s3 = "G"
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == Enum.KeyCode[s3] then
			u27 = not u27

			if not u27 then
				_Raw:Notify({
					Title = " closed",
					Content = "Press " .. s3 .. " to reopen ",
					Duration = 50,
					Icon = "keyboard"
				})
			end
		end
	end)
	t1.MiscTab:Divider()
	t1.MiscTab:Keybind({
		Title = "Toggle UI Keybind",
		Desc = "Keybind to open or close the UI",
		Value = s3,
		Callback = function(p4)
			local ok, result = pcall(function()
				return Enum.KeyCode[p4]
			end)

			if ok and result then
				s3 = p4
				u8:SetToggleKey(result)
			end
		end
	})
	t1.MiscTab:Button({
		Title = "Infinite yeild",
		Compact = true,
		Callback = function()
			loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()
		end
	})
	u29 = false
	u30 = nil
	u31 = nil

	function u32()
		local t5 = {}
		local GetCurrentPlayerData = ReplicatedStorage:FindFirstChild("GetCurrentPlayerData", true)

		if GetCurrentPlayerData and GetCurrentPlayerData:IsA("RemoteFunction") then
			t5 = GetCurrentPlayerData:InvokeServer() or {}
		end

		local v216 = nil
		local v217 = nil

		for k, v in pairs(t5) do
			if v.Role == "Murderer" then
				v216 = k
			elseif v.Role == "Sheriff" then
				v217 = k
			end
		end

		return v216, v217
	end
	function u33(p5, p6, p7)
		local s4 = "rbxassetid://129260712070622"

		if p7 then
			local p7_2 = Players:FindFirstChild(p7)

			if p7_2 then
				local ok, result = pcall(function()
					return Players:GetUserThumbnailAsync(p7_2.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
				end)

				if ok then
					s4 = result
				end
			end
		end

		_Raw:Notify({
			Title = p5,
			Content = p6,
			Duration = 30,
			Icon = s4,
			IconThemed = true
		})
	end
	function u34(p8, p9)
		local v229 = p8 == "Murderer" and "<font color=\"#ff0000\">Murderer</font>" or "<font color=\"#007bff\">Sheriff</font>"
		local v230 = p9 or "No " .. p8

		u33(v229, v230, p9)
	end

	task.spawn(function()
		while true do
			if u29 then
				local v231, v232 = u32()

				if v231 ~= u30 then
					u34("Murderer", v231)
				end

				if v232 ~= u31 then
					u34("Sheriff", v232)
				end

				u31 = v232
				u30 = v231
			end

			task.wait(0.5)
		end
	end)
	t1.MainTab:Divider()
	t1.MainTab:Toggle({
		Title = "Auto Role Notification",
		Description = "Notify when roles are detected or changed",
		Callback = function(p10)
			u29 = p10

			if p10 then
				u30 = nil
				u31 = nil
			end
		end,
		Default = false
	})
	t1.MainTab:Button({
		Title = "Notify Murderer",
		Callback = function()
			local v234 = u32()

			u34("Murderer", v234)
		end
	})
	t1.MainTab:Button({
		Title = "Notify Sheriff",
		Callback = function()
			local _, v236 = u32()

			u34("Sheriff", v236)
		end
	})
	t1.MainTab:Divider()
	u35 = false
	t1.MainTab:Toggle({
		Title = "Auto Get Gun",
		Value = false,
		Callback = function(p11)
			u35 = p11
			_Raw:Notify({
				Title = "Auto Gun",
				Content = p11 and "Enabled" or "Disabled",
				Duration = 3,
				Icon = "hand"
			})
		end
	})
	t1.MainTab:Button({
		Title = "Get Gun Now",
		Icon = "hand",
		Callback = function()
			local v238 = nil

			for _, descendant in ipairs(Workspace:GetDescendants()) do
				if descendant.Name == "GunDrop" and descendant:IsA("Part") then
					v238 = descendant

					break
				end
			end

			if not v238 then
				_Raw:Notify({
					Title = "Gun Pickup",
					Content = "gun has not been dropped",
					Duration = 5,
					Icon = "x"
				})
			else
				local _HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				if _HumanoidRootPart then
					for _, v in ipairs(v238:GetConnections()) do
						if v.Name == "TouchInterest" then
							v:Fire(_HumanoidRootPart)
						end
					end
				end

				_Raw:Notify({
					Title = "Gun Pickup",
					Content = "Gun successfully touched!",
					Duration = 5,
					Icon = "hand"
				})
			end
		end
	})
	Players2 = game:GetService("Players")
	Workspace2 = game:GetService("Workspace")
	LocalPlayer2 = Players2.LocalPlayer
	u39 = false
	u40 = false
	task.spawn(function()
		while task.wait(0.25) do
			local v244

			if not u39 or u40 then
				v244 = true
			else
				local Character = LocalPlayer2.Character
				local _HumanoidRootPart2 = Character and Character:FindFirstChild("HumanoidRootPart")

				if _HumanoidRootPart2 then
					if Character:FindFirstChild("Gun") or LocalPlayer2.Backpack:FindFirstChild("Gun") then
						v244 = true
					else
						local GunDrop = Workspace2:FindFirstChild("GunDrop", true)

						if GunDrop and GunDrop:IsA("BasePart") then
							u40 = true
							firetouchinterest(_HumanoidRootPart2, GunDrop, 0)
							task.wait()
							firetouchinterest(_HumanoidRootPart2, GunDrop, 1)
							task.delay(0.5, function()
								u40 = false
							end)
						end

						v244 = true
					end
				else
					v244 = true
				end
			end

			if not v244 then
				return
			end
		end
	end)
	s5 = "rbxassetid://1076907875"
	n1 = 1
	u43 = false
	t6 = {
		Discord = "rbxassetid://1076907875",
		["Fire alarm"] = "rbxassetid://497153454",
		Oof = "rbxassetid://79348298352567",
		["Gun sfx"] = "rbxassetid://1585183374",
		["Samsung Notification"] = "rbxassetid://6205717931",
		Notify = "rbxassetid://225320558",
		["Windows Notify System Generic"] = "rbxassetid://489103549",
		Custom = ""
	}

	local t7 = {}

	for k in pairs(t6) do
		table.insert(t7, k)
	end

	t1.MainTab:Input({
		Title = "Custom Gun Drop Sound URL",
		Placeholder = "rbxassetid://",
		Compact = true,
		Callback = function(p12)
			if p12 ~= "" then
				s5 = p12
			end
		end
	})
	t1.MainTab:Dropdown({
		Title = "Gun Drop Sound",
		Values = t7,
		Value = "Discord",
		Compact = true,
		Callback = function(p13)
			if p13 ~= "Custom" then
				s5 = t6[p13]
			end
		end
	})
end

t1.MainTab:Button({
	Title = "Preview Gun Drop Sound",
	Callback = function()
		local Sound = Instance.new("Sound")

		Sound.SoundId = s5
		Sound.Volume = n1
		Sound.Parent = Workspace2
		Sound:Play()
		Sound.Ended:Connect(function()
			Sound:Destroy()
		end)
	end
})
t1.MainTab:Slider({
	Title = "Gun Drop Volume",
	Step = 0.05,
	Value = {
		Min = 0,
		Max = 1,
		Default = 1
	},
	Callback = function(p14)
		n1 = p14
	end
})
t1.MainTab:Toggle({
	Title = "Enable",
	Value = false,
	Callback = function(p15)
		u43 = p15
	end
})
task.spawn(function()
	local t8 = {}

	while true do
		task.wait(0.5)

		if u43 then
			for _, descendant in ipairs(Workspace2:GetDescendants()) do
				if descendant.Name == "GunDrop" and not t8[descendant] then
					local Sound = Instance.new("Sound")

					Sound.SoundId = s5
					Sound.Volume = n1
					Sound.Parent = descendant
					Sound:Play()
					Sound.Ended:Connect(function()
						Sound:Destroy()
					end)
					_Raw:Notify({
						Title = "Gun!",
						Content = "Gun Dropped",
						Duration = 10,
						Icon = "snow",
						IconThemed = true
					})
					t8[descendant] = true
				end
			end
		end
	end
end)
t1.MainTab:Divider()
t1.MainTab:Toggle({
	Title = "Round Timer",
	Compact = true,
	Callback = function(p16)
		if not p16 then
			local _TimerDisplayGui = LocalPlayer2:FindFirstChild("PlayerGui") and LocalPlayer2.PlayerGui:FindFirstChild("TimerDisplayGui")

			if _TimerDisplayGui then
				_TimerDisplayGui:Destroy()
			end
		else
			local PlayerGui = LocalPlayer2:FindFirstChild("PlayerGui")
			local RoundTimerPart = Workspace2:FindFirstChild("RoundTimerPart")
			local _Surfacegui = RoundTimerPart and (RoundTimerPart:FindFirstChild("SurfaceGui") and RoundTimerPart.SurfaceGui:FindFirstChild("Timer"))

			if not PlayerGui or not _Surfacegui then
				return
			end

			local ScreenGui = Instance.new("ScreenGui")

			ScreenGui.Name = "TimerDisplayGui"
			ScreenGui.Parent = PlayerGui
			ScreenGui.ResetOnSpawn = false

			local TextLabel = Instance.new("TextLabel")

			TextLabel.Size = UDim2.new(0, 150, 0, 30)
			TextLabel.Position = UDim2.new(0.5, 0, 0.05, 0)
			TextLabel.AnchorPoint = Vector2.new(0.5, 0)
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.RichText = true
			TextLabel.Text = "Waiting..."
			TextLabel.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Bold)
			TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.TextStrokeTransparency = 0
			TextLabel.Parent = ScreenGui

			local u264 = false
			local u265 = nil
			local inputPosition = nil
			local TextLabelPosition = nil

			TextLabel.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					u264 = true
					inputPosition = input.Position
					TextLabelPosition = TextLabel.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							u264 = false
						end
					end)
				end
			end)
			TextLabel.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					u265 = input
				end
			end)
			UserInputService.InputChanged:Connect(function(input)
				if input == u265 and u264 then
					local v870 = input.Position - inputPosition

					TextLabel.Position = UDim2.new(TextLabelPosition.X.Scale, TextLabelPosition.X.Offset + v870.X, TextLabelPosition.Y.Scale, TextLabelPosition.Y.Offset + v870.Y)
				end
			end)
			task.spawn(function()
				while ScreenGui.Parent do
					if _Surfacegui and _Surfacegui:IsA("TextLabel") then
						TextLabel.Text = _Surfacegui.Text
					end

					task.wait(0.1)
				end
			end)
		end
	end
})
t1.MainTab:Button({
	Title = "God mode",
	Desc = "",
	Value = false,
	Callback = function(_)
		_Raw:Notify({
			Title = "god mode",
			Content = "god mode is on",
			Icon = "smile",
			IconThemed = false,
			Duration = 5
		})

		local function u269(p18)
			p18:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
		end

		local LocalPlayer3 = game:GetService("Players").LocalPlayer

		u269(LocalPlayer3.Character.Humanoid)
		LocalPlayer3.CharacterAdded:Connect(function(character)
			u269(character:WaitForChild("Humanoid"))
		end)
	end
})

local u47 = false

t1.MiscTab:Toggle({
	Title = "Anti Stealer",
	Desc = "",
	Value = false,
	Callback = function(p19)
		u47 = p19
	end
})

local DeclineTrade, u51, u52, Players3, RunService2, LocalPlayer4, n2, n3, n4, E, u61, u62, u63, u64, u65, u66, u67, u68, u69, E2, u71, u72, Players4, VirtualUser, RunService3, LocalPlayer5, t9, u78, u79, u80, t11, u82, CurrentCamera2, LocalPlayer6, u85, u86, n5, n6, n7, n8, LocalPlayer7, u92, t14, t15, CurrentCamera3, LocalPlayer8, u97, u98, u99, u100, t16, t17, t18, t19, t20, u107, u108, LocalPlayer9, u112, u113, RunService4, Workspace3, LocalPlayer10, u119, u120, u121, u122, n11, u124, vector3

do
	local Trade = ReplicatedStorage:WaitForChild("Trade")
	local StartTrade = Trade:WaitForChild("StartTrade")

	DeclineTrade = Trade:WaitForChild("DeclineTrade")
	u51 = false

	function u52()
		if u51 then
			return
		end

		u51 = true
		task.spawn(function()
			while u47 do
				pcall(function()
					DeclineTrade:FireServer()
				end)
				task.wait(0.1)
			end

			u51 = false
		end)
	end

	StartTrade.OnClientEvent:Connect(function()
		if not u47 then
			return
		end

		pcall(function()
			DeclineTrade:FireServer()
		end)
		u52()
	end)
	t1.MainTab:Slider({
		Title = "FOV",
		Value = {
			Min = 50,
			Max = 120,
			Default = CurrentCamera.FieldOfView
		},
		Compact = true,
		Callback = function(p20)
			CurrentCamera.FieldOfView = p20
		end
	})
	t1.MainTab:Toggle({
		Title = "Anti Fling",
		Default = false,
		Callback = function(p21)
			if not p21 then
				if getgenv().AntiFlingConnection then
					getgenv().AntiFlingConnection:Disconnect()
					getgenv().AntiFlingConnection = nil
				end
			else
				getgenv().AntiFlingConnection = RunService.Heartbeat:Connect(function()
					for _, player in ipairs(Players2:GetPlayers()) do
						if player ~= LocalPlayer2 and player.Character then
							for _, descendant in ipairs(player.Character:GetDescendants()) do
								if descendant:IsA("BasePart") and not descendant.Anchored and descendant.Velocity.Magnitude > 100 then
									local zero = Vector3.zero

									descendant.RotVelocity = Vector3.zero
									descendant.Velocity = zero
									descendant.Anchored = true
									task.delay(0.5, function()
										if descendant and descendant.Parent then
											descendant.Anchored = false
										end
									end)
								end
							end
						end
					end
				end)
			end
		end
	})
	t1.SheriffTab:Section({
		Title = "Aimlock"
	})
	t1.SheriffTab:Divider()
	Players3 = game:GetService("Players")
	RunService2 = game:GetService("RunService")

	local UserInputService2 = game:GetService("UserInputService")

	LocalPlayer4 = Players3.LocalPlayer
	n2 = 0.18
	n3 = 5000
	n4 = 0.08
	E = Enum.KeyCode.E
	u61 = false
	u62 = nil
	u63 = false
	u64 = nil

	function u65()
		local Character = LocalPlayer4.Character

		if Character then
			for _, child in ipairs(Character:GetChildren()) do
				if child:IsA("Tool") and child:FindFirstChild("Shoot") then
					return child, child:FindFirstChild("Shoot")
				end
			end
		end

		local Backpack = LocalPlayer4:FindFirstChild("Backpack")

		if Backpack then
			for _, child in ipairs(Backpack:GetChildren()) do
				if child:IsA("Tool") and child:FindFirstChild("Shoot") then
					return child, child:FindFirstChild("Shoot")
				end
			end
		end

		return nil, nil
	end
	function u66(p22)
		if not p22 then
			return false
		end

		local Backpack = p22:FindFirstChild("Backpack")

		if not Backpack or not Backpack:FindFirstChild("Knife") then
			local Character = p22.Character

			if Character and Character:FindFirstChild("Knife") then
				return true
			end

			return false
		end

		return true
	end
	function u67()
		local Character = LocalPlayer4.Character

		if not Character or not Character:FindFirstChild("HumanoidRootPart") then
			return nil
		end

		local HumanoidRootPart = Character.HumanoidRootPart
		local v285 = nil
		local huge = math.huge

		for _, player in ipairs(Players3:GetPlayers()) do
			local v289

			if player ~= LocalPlayer4 then
				if not player.Character then
					v289 = true
				else
					local Humanoid = player.Character:FindFirstChild("Humanoid")

					if not Humanoid or Humanoid.Health <= 0 then
						v289 = true
					else
						local HumanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

						if not HumanoidRootPart2 then
							v289 = true
						elseif not u66(player) then
							v289 = true
						else
							local Magnitude = (HumanoidRootPart.Position - HumanoidRootPart2.Position).Magnitude

							if Magnitude < n3 and Magnitude < huge then
								huge = Magnitude
								v285 = player
							end

							v289 = true
						end
					end
				end
			else
				v289 = true
			end

			if not v289 then
				return v285
			end
		end

		return v285
	end
	function u68(p23)
		if p23 then
			return p23 + Vector3.new((math.random() - 0.5) * n4, (math.random() - 0.5) * n4, (math.random() - 0.5) * n4)
		end

		return CFrame.new()
	end
	function u69()
		local v294, v295 = u65()

		if v294 and v295 then
			local Character = LocalPlayer4.Character

			if not Character or not Character:FindFirstChild("HumanoidRootPart") then
				return
			end

			local v297 = u67()

			if v297 then
				local HumanoidRootPart = Character.HumanoidRootPart
				local HumanoidRootPart3 = v297.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart3 then
					local v300 = u68(HumanoidRootPart3.CFrame)

					v295:FireServer(HumanoidRootPart.CFrame, v300)

					return
				end

				return
			end

			return
		end
	end

	t1.SheriffTab:Button({
		Title = "Shoot murd ",
		Desc = "doesnt require holding gun",
		Icon = "solar:target-bold",
		Callback = u69
	})
	t1.SheriffTab:Toggle({
		Title = "Auto Shoot murd",
		Desc = "still u dont gotta hold gun for it to work",
		Icon = "solar:target-bold",
		Value = false,
		Callback = function(p24)
			u63 = p24

			if u64 then
				u64:Disconnect()
				u64 = nil
			end

			if p24 then
				u64 = RunService2.Heartbeat:Connect(function()
					if not u63 then
						return
					end

					u69()
					task.wait(n2)
				end)

				return
			end
		end
	})
	t1.SheriffTab:Keybind({
		Title = "Shoot / Auto-Shoot (hold)",
		Value = "E",
		Callback = function(p25)
			if Enum.KeyCode[p25] then
				E = Enum.KeyCode[p25]
			end
		end
	})
	UserInputService2.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end

		if input.KeyCode ~= E then
			return
		end

		u61 = true
		u69()

		if u62 then
			u62:Disconnect()
		end

		u62 = RunService2.Heartbeat:Connect(function()
			if not u61 then
				return
			end

			u69()
			task.wait(n2)
		end)
	end)
	UserInputService2.InputEnded:Connect(function(input, gameProcessed)
		if not gameProcessed then
			if input.KeyCode ~= E then
				return
			end

			u61 = false

			if u62 then
				u62:Disconnect()
				u62 = nil
			end

			return
		end
	end)
	LocalPlayer4.CharacterRemoving:Connect(function()
		u61 = false

		if u62 then
			u62:Disconnect()
			u62 = nil
		end
	end)
	E2 = Enum.KeyCode.E
	u71 = false
	u72 = nil
	UserInputService2.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed then
			if input.KeyCode == E2 then
				u71 = true
				u69()

				if u72 then
					u72:Disconnect()
				end

				u72 = RunService2.Heartbeat:Connect(function()
					if u71 then
						u69()
						task.wait(n2)

						return
					end
				end)

				return
			end

			return
		end
	end)
	UserInputService2.InputEnded:Connect(function(input, gameProcessed)
		if not gameProcessed then
			if input.KeyCode == E2 then
				u71 = false

				if u72 then
					u72:Disconnect()
					u72 = nil
				end

				return
			end

			return
		end
	end)
	t1.SheriffTab:Section({
		Title = "camlock"
	})
	Players4 = game:GetService("Players")
	VirtualUser = game:GetService("VirtualUser")
	RunService3 = game:GetService("RunService")
	LocalPlayer5 = Players4.LocalPlayer
	t9 = {
		KillAura = {
			Enabled = false,
			Distance = 50
		}
	}

	function u78()
		local Character = LocalPlayer5.Character

		if not Character or not Character:FindFirstChild("Humanoid") then
			return nil
		end

		local _Knife = LocalPlayer5.Backpack:FindFirstChild("Knife") or Character:FindFirstChild("Knife")

		if _Knife and _Knife.Parent == LocalPlayer5.Backpack then
			Character.Humanoid:EquipTool(_Knife)
			task.wait(0.1)
		end

		return Character:FindFirstChild("Knife")
	end
	function u79(p26)
		local v314 = u78()

		if not v314 then
			return
		end

		local Character = p26.Character

		if Character then
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")

			if Humanoid and Humanoid.Health > 0 then
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					VirtualUser:ClickButton1(Vector2.new())
					firetouchinterest(HumanoidRootPart, v314.Handle, 1)
					firetouchinterest(HumanoidRootPart, v314.Handle, 0)
				end

				return
			end

			return
		end
	end
	function u80()
		local t10 = {}

		for _, player in ipairs(Players4:GetPlayers()) do
			if player ~= LocalPlayer5 then
				table.insert(t10, player.Name)
			end
		end

		table.sort(t10)

		return t10
	end

	t11 = {}
	u82 = t1.MurdTab:Dropdown({
		Title = "Select Players to Kill",
		Values = u80(),
		Multi = true,
		Compact = true,
		AllowNone = true,
		Callback = function(p27)
			t11 = p27 or {}
		end
	})
	Players4.PlayerAdded:Connect(function()
		u82:Refresh(u80())
	end)
	Players4.PlayerRemoving:Connect(function()
		u82:Refresh(u80())

		local t12 = {}

		for _, v in ipairs(t11) do
			if Players4:FindFirstChild(v) then
				table.insert(t12, v)
			end
		end

		t11 = t12
		u82:Select(t12)
	end)
	u82:Refresh(u80())
	t1.MurdTab:Button({
		Title = "Kill Selected Players",
		Description = "Kills only the players selected in the dropdown.",
		Callback = function()
			if #t11 == 0 then
				_Raw:Notify({
					Title = "Warning",
					Content = "No players selected!",
					Duration = 3
				})

				return
			end

			for _, v in ipairs(t11) do
				local v2 = Players4:FindFirstChild(v)

				if v2 then
					u79(v2)
					task.wait(0.1)
				end
			end
		end
	})
	t1.MurdTab:Button({
		Title = "Kill All Players",
		Description = "Instantly kills every other player in the server.",
		Callback = function()
			local v328 = u78()

			if not v328 then
				_Raw:Notify({
					Title = "Error",
					Content = "You don't have the knife! (Not murderer?)",
					Duration = 5
				})

				return
			end

			for _, player in ipairs(Players4:GetPlayers()) do
				if player ~= LocalPlayer5 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					VirtualUser:ClickButton1(Vector2.new())
					firetouchinterest(player.Character.HumanoidRootPart, v328.Handle, 1)
					firetouchinterest(player.Character.HumanoidRootPart, v328.Handle, 0)
					task.wait(0.05)
				end
			end
		end
	})
	t1.MurdTab:Button({
		Title = "Kill Random Player",
		Compact = true,
		Callback = function()
			local t13 = {}

			for _, player in ipairs(Players4:GetPlayers()) do
				if player ~= LocalPlayer5 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					table.insert(t13, player)
				end
			end

			if not (#t13 > 0) then
				_Raw:Notify({
					Title = "Info",
					Content = "No valid targets found!",
					Duration = 3
				})
			else
				local v334 = t13[math.random(1, #t13)]

				u79(v334)
			end
		end
	})
	t1.MurdTab:Toggle({
		Title = "Kill Aura",
		Description = "kills nearby ALIVE players",
		Default = false,
		Callback = function(p28)
			t9.KillAura.Enabled = p28
		end
	})
	t1.MurdTab:Slider({
		Title = "Kill Aura Distance",
		Description = "Maximum distance (studs) for Kill Aura to trigger.",
		Value = {
			Min = 10,
			Max = 1000,
			Default = 1000
		},
		Callback = function(p29)
			t9.KillAura.Distance = p29
		end
	})
	task.spawn(function()
		while task.wait(0.2) do
			local v340

			if t9.KillAura.Enabled then
				local v337 = u78()

				if v337 then
					local Character = LocalPlayer5.Character

					if Character then
						local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

						if not HumanoidRootPart then
							v340 = true
						else
							for _, player in ipairs(Players4:GetPlayers()) do
								if player ~= LocalPlayer5 then
									local Character2 = player.Character

									if Character2 then
										local Humanoid = Character2:FindFirstChildOfClass("Humanoid")

										if Humanoid and Humanoid.Health > 0 then
											local HumanoidRootPart4 = Character2:FindFirstChild("HumanoidRootPart")

											if HumanoidRootPart4 and (HumanoidRootPart.Position - HumanoidRootPart4.Position).Magnitude <= t9.KillAura.Distance then
												VirtualUser:ClickButton1(Vector2.new())
												firetouchinterest(HumanoidRootPart4, v337.Handle, 1)
												firetouchinterest(HumanoidRootPart4, v337.Handle, 0)
												task.wait(0.08)
											end
										end
									end
								end
							end

							v340 = true
						end
					else
						v340 = true
					end
				else
					v340 = true
				end
			else
				v340 = true
			end

			if not v340 then
				return
			end
		end
	end)
	CurrentCamera2 = Workspace2.CurrentCamera
	LocalPlayer6 = Players4.LocalPlayer
	getgenv().Aimlock = {
		Enabled = false,
		TargetPart = "HumanoidRootPart",
		Initialized = false
	}

	function u85()
		for _, player in ipairs(Players4:GetPlayers()) do
			if player ~= LocalPlayer6 and player.Character and (player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife")) and player.Character:FindFirstChild("HumanoidRootPart") then
				return player
			end
		end

		return nil
	end

	t1.SheriffTab:Divider()
	t1.SheriffTab:Dropdown({
		Title = "camlock Target Part",
		Description = "Choose which body part to lock onto on the murderer.",
		Values = {
			"Head",
			"HumanoidRootPart",
			"UpperTorso",
			"LowerTorso"
		},
		Value = "HumanoidRootPart",
		Callback = function(p30)
			getgenv().Aimlock.TargetPart = p30
		end
	})
	t1.SheriffTab:Toggle({
		Title = "enable camlock",
		Default = false,
		Callback = function(p31)
			getgenv().Aimlock.Enabled = p31

			if p31 and not getgenv().Aimlock.Initialized then
				getgenv().Aimlock.Initialized = true
				RunService3.RenderStepped:Connect(function()
					if getgenv().Aimlock.Enabled then
						local v878 = u85()

						if v878 and v878.Character then
							local AimlockTargetPart = v878.Character:FindFirstChild(getgenv().Aimlock.TargetPart)

							if AimlockTargetPart then
								CurrentCamera2.CFrame = CFrame.new(CurrentCamera2.CFrame.Position, AimlockTargetPart.Position)
							end
						end

						return
					end
				end)
			end
		end
	})
	t1.SheriffTab:Divider()
	t1.SheriffTab:Space()
	u86 = false
	n5 = 0
	n6 = 20
	n7 = 0
	n8 = 1
	LocalPlayer7 = Players4.LocalPlayer
	t1.SheriffTab:Slider({
		Title = "Distance Behind Murderer",
		Step = 1,
		Value = {
			Min = 0,
			Max = 120,
			Default = 20
		},
		Callback = function(p32)
			n6 = p32
		end
	})
	t1.SheriffTab:Slider({
		Title = "Height Above Murderer",
		Step = 1,
		Value = {
			Min = -20,
			Max = 50,
			Default = 0
		},
		Callback = function(p33)
			n7 = p33
		end
	})
	t1.SheriffTab:Slider({
		Title = "Orbit Speed",
		Desc = "dont do like above 10 or it like goes too faast",
		Step = 0.1,
		Value = {
			Min = 0,
			Max = 200,
			Default = 1
		},
		Callback = function(p34)
			n8 = p34
		end
	})
	t1.SheriffTab:Toggle({
		Title = "Enable ",
		Default = false,
		Callback = function(p35)
			u86 = p35
		end
	})

	function u92()
		for _, player in ipairs(Players4:GetPlayers()) do
			if player ~= LocalPlayer7 then
				local v356 = false

				if player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("Knife") then
					v356 = true
				elseif player.Character and player.Character:FindFirstChild("Knife") then
					v356 = true
				end

				if v356 then
					return player
				end
			end
		end

		return nil
	end

	RunService3.RenderStepped:Connect(function(dt)
		if u86 then
			local v358 = u92()

			if v358 and v358.Character then
				local HumanoidRootPart = v358.Character:FindFirstChild("HumanoidRootPart")
				local HumanoidRootPart5 = (LocalPlayer7.Character or LocalPlayer7.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

				if HumanoidRootPart then
					if not (n8 > 0) then
						local v361 = HumanoidRootPart.Position - HumanoidRootPart.CFrame.LookVector * n6 + Vector3.new(0, n7, 0)

						HumanoidRootPart5.CFrame = CFrame.lookAt(v361, HumanoidRootPart.Position)
					else
						n5 = n5 + n8 * dt * 60

						local v362 = math.rad(n5)
						local v363 = math.sin(v362) * n6
						local v364 = math.cos(v362) * n6
						local v365 = HumanoidRootPart.Position + Vector3.new(v363, n7, v364)

						HumanoidRootPart5.CFrame = CFrame.lookAt(v365, HumanoidRootPart.Position)
					end

					return
				end

				return
			end

			return
		end
	end)
	RunService3.RenderStepped:Connect(function(dt)
		if u86 then
			local v367 = u92()

			if v367 and v367.Character then
				local HumanoidRootPart = v367.Character:FindFirstChild("HumanoidRootPart")
				local HumanoidRootPart6 = (LocalPlayer7.Character or LocalPlayer7.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return
				end

				if n8 > 0 then
					n5 = n5 + n8 * dt * 60

					local v370 = math.rad(n5)
					local v371 = math.sin(v370) * n6
					local v372 = math.cos(v370) * n6
					local v373 = HumanoidRootPart.Position + Vector3.new(v371, n7, v372)

					HumanoidRootPart6.CFrame = CFrame.lookAt(v373, HumanoidRootPart.Position)
				else
					local v374 = HumanoidRootPart.Position - HumanoidRootPart.CFrame.LookVector * n6 + Vector3.new(0, n7, 0)

					HumanoidRootPart6.CFrame = CFrame.lookAt(v374, HumanoidRootPart.Position)
				end

				return
			end

			return
		end
	end)
	t14 = {
		ReplicatedStorage = game:GetService("ReplicatedStorage"),
		Players = game:GetService("Players"),
		RunService = game:GetService("RunService")
	}
	t15 = {
		GetCurrentPlayerData = t14.ReplicatedStorage:FindFirstChild("GetCurrentPlayerData", true)
	}
	CurrentCamera3 = workspace.CurrentCamera
	LocalPlayer8 = t14.Players.LocalPlayer
	u97 = nil

	function u98()
		local ok, result = pcall(function()
			if t15.GetCurrentPlayerData then
				return t15.GetCurrentPlayerData:InvokeServer() or {}
			end
		end)

		return ok and result or {}
	end
	function u99(p36)
		local v378 = u97[p36.Name]

		return v378 and (not v378.Killed and not v378.Dead)
	end
	function u100(p37)
		local Backpack = p37:FindFirstChild("Backpack")

		if Backpack and Backpack:FindFirstChild("Gun") then
			return true
		end

		local v381 = p37.Character or workspace:FindFirstChild(p37.Name)

		if not v381 or not v381:FindFirstChild("Gun") then
			return false
		end

		return true
	end

	t16 = {
		Highlights = {
			Innocent = Color3.fromRGB(0, 255, 0),
			Murderer = Color3.fromRGB(255, 0, 0),
			Sheriff = Color3.fromRGB(0, 0, 255),
			Hero = Color3.fromRGB(0, 0, 255),
			DeadInnocent = Color3.fromRGB(128, 128, 128)
		},
		Skeleton = {
			Innocent = Color3.fromRGB(0, 255, 0),
			Murderer = Color3.fromRGB(255, 0, 0),
			Sheriff = Color3.fromRGB(0, 0, 255),
			Hero = Color3.fromRGB(0, 0, 255),
			DeadInnocent = Color3.fromRGB(128, 128, 128)
		},
		Tracers = {
			Innocent = Color3.fromRGB(0, 255, 0),
			Murderer = Color3.fromRGB(255, 0, 0),
			Sheriff = Color3.fromRGB(0, 0, 255),
			Hero = Color3.fromRGB(0, 0, 255),
			DeadInnocent = Color3.fromRGB(128, 128, 128)
		}
	}
	t17 = {
		Highlights = {
			Innocent = false,
			Murderer = false,
			Sheriff = false,
			DeadInnocent = false
		},
		Skeleton = {
			Innocent = false,
			Murderer = false,
			Sheriff = false,
			DeadInnocent = false
		},
		Tracers = {
			Innocent = false,
			Murderer = false,
			Sheriff = false,
			DeadInnocent = false
		}
	}

	local _ = {
		Enabled = false,
		ShowDistance = true,
		MaxDistance = 300,
		Color = Color3.fromRGB(255, 215, 0),
		TextSize = 14
	}

	t18 = {
		{
			"Head",
			"UpperTorso"
		},
		{
			"UpperTorso",
			"LowerTorso"
		},
		{
			"UpperTorso",
			"LeftUpperArm"
		},
		{
			"LeftUpperArm",
			"LeftLowerArm"
		},
		{
			"LeftLowerArm",
			"LeftHand"
		},
		{
			"UpperTorso",
			"RightUpperArm"
		},
		{
			"RightUpperArm",
			"RightLowerArm"
		},
		{
			"RightLowerArm",
			"RightHand"
		},
		{
			"LowerTorso",
			"LeftUpperLeg"
		},
		{
			"LeftUpperLeg",
			"LeftLowerLeg"
		},
		{
			"LeftLowerLeg",
			"LeftFoot"
		},
		{
			"LowerTorso",
			"RightUpperLeg"
		},
		{
			"RightUpperLeg",
			"RightLowerLeg"
		},
		{
			"RightLowerLeg",
			"RightFoot"
		}
	}
	t19 = {}
	t20 = {}
	u107 = false

	function u108(p38)
		if t19[p38] then
			pcall(function()
				t19[p38]:Destroy()
			end)
			t19[p38] = nil
		end

		if t20[p38] then
			local v384 = t20[p38]

			if v384.tracer then
				v384.tracer:Remove()
			end

			if v384.nameText then
				v384.nameText:Remove()
			end

			if v384.skeletonLines then
				for _, v in ipairs(v384.skeletonLines) do
					v:Remove()
				end
			end

			t20[p38] = nil
		end
	end

	for _, player in ipairs(t14.Players:GetPlayers()) do
		if player ~= LocalPlayer8 then
			player.CharacterRemoving:Connect(function()
				u108(player)
			end)
		end
	end

	t14.Players.PlayerAdded:Connect(function(player)
		if player ~= LocalPlayer8 then
			player.CharacterRemoving:Connect(function()
				u108(player)
			end)
		end
	end)
	t14.Players.PlayerRemoving:Connect(u108)
	t14.RunService.RenderStepped:Connect(function()
		u97 = u98()

		local v389 = next(u97) ~= nil
		local g395 = nil
		local g399 = nil
		local v394 = nil

		if u107 and not v389 then
			for _, player in ipairs(t14.Players:GetPlayers()) do
				u108(player)
			end
		end

		u107 = v389

		if v389 then
			for _, player in ipairs(t14.Players:GetPlayers()) do
				if player == LocalPlayer8 then
					v394 = true
					g395 = true
				end

				if not g395 then
					local v396 = player.Character or workspace:FindFirstChild(player.Name)

					if not v396 or not v396.Parent then
						u108(player)
						v394 = true
						g395 = true
					end

					if not g395 then
						local v397 = u97[player.Name]

						if not v397 then
							v394 = true
							g395 = true
						end

						if not g395 then
							local Role = v397.Role

							if not v397.Dead and not v397.Killed then
								if Role == "Innocent" and u100(player) and (not u97.Sheriff or not u99(t14.Players[u97.Sheriff])) then
									Role = "Hero"
								end

								g399 = true
							end

							if g399 or Role == "Innocent" then
								if not g399 then
									Role = "DeadInnocent"
								end

								g399 = false

								local v400 = t17.Highlights[Role] or Role == "Hero" and (t17.Highlights.Sheriff or false)
								local v401 = t17.Tracers[Role] or Role == "Hero" and (t17.Tracers.Sheriff or false)
								local v402 = t17.Skeleton[Role] or Role == "Hero" and (t17.Skeleton.Sheriff or false)
								local v403 = t16.Highlights[Role == "Hero" and "Sheriff" or Role]
								local v404 = t16.Tracers[Role == "Hero" and "Sheriff" or Role]
								local v405 = t16.Skeleton[Role == "Hero" and "Sheriff" or Role]
								local u406 = t19[player]

								if not v400 then
									if u406 then
										u406.Enabled = false
									end
								else
									if not u406 or v396 ~= u406.Parent then
										if u406 then
											pcall(function()
												u406:Destroy()
											end)
										end

										u406 = Instance.new("Highlight")
										u406.Parent = v396
										u406.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
										u406.FillTransparency = 1
										u406.OutlineTransparency = 0
										t19[player] = u406
									end

									u406.OutlineColor = v403
									u406.Enabled = true
								end

								if not t20[player] then
									t20[player] = {}
								end

								local v407 = t20[player]

								if not v401 then
									if v407.tracer then
										v407.tracer.Visible = false
									end

									if v407.nameText then
										v407.nameText.Visible = false
									end
								else
									if not v407.tracer then
										v407.tracer = Drawing.new("Line")
										v407.tracer.Thickness = 2
									end

									if not v407.nameText then
										v407.nameText = Drawing.new("Text")
										v407.nameText.Size = 15
										v407.nameText.Center = true
										v407.nameText.Outline = true
										v407.nameText.Font = 2
									end

									v407.tracer.Color = v404
									v407.nameText.Color = v404

									local HumanoidRootPart = v396:FindFirstChild("HumanoidRootPart")

									if HumanoidRootPart then
										local HumanoidRootPartPosition = HumanoidRootPart.Position
										local v410, v411 = CurrentCamera3:WorldToViewportPoint(HumanoidRootPartPosition)
										local Humanoid = v396:FindFirstChildOfClass("Humanoid")

										if not Humanoid or not (Humanoid.Health <= 0) then
											if v411 then
												local vector2 = Vector2.new(CurrentCamera3.ViewportSize.X / 2, CurrentCamera3.ViewportSize.Y)

												v407.tracer.From = vector2
												v407.tracer.To = Vector2.new(v410.X, v410.Y)
												v407.tracer.Visible = true

												local _HumanoidRootPart3 = LocalPlayer8.Character and LocalPlayer8.Character:FindFirstChild("HumanoidRootPart")
												local v415 = _HumanoidRootPart3 and math.floor((_HumanoidRootPart3.Position - HumanoidRootPartPosition).Magnitude) or 999

												v407.nameText.Text = player.Name .. " [" .. v415 .. "]"
												v407.nameText.Position = Vector2.new(v410.X, v410.Y - 35)
												v407.nameText.Visible = true
											else
												v407.tracer.Visible = false
												v407.nameText.Visible = false
											end
										else
											v407.tracer.Visible = false
											v407.nameText.Visible = false
										end
									else
										v407.tracer.Visible = false
										v407.nameText.Visible = false
									end
								end

								if v402 then
									if not v407.skeletonLines then
										v407.skeletonLines = {}

										for _ = 1, #t18 do
											local drawing = Drawing.new("Line")

											drawing.Thickness = 1
											table.insert(v407.skeletonLines, drawing)
										end
									end

									for _, v in ipairs(v407.skeletonLines) do
										v.Color = v405
									end

									for i, v in ipairs(t18) do
										local v422 = v396:FindFirstChild(v[1])
										local v423 = v396:FindFirstChild(v[2])

										if not v422 or not v423 then
											v407.skeletonLines[i].Visible = false
										else
											local v424, v425 = CurrentCamera3:WorldToViewportPoint(v422.Position)
											local v426, v427 = CurrentCamera3:WorldToViewportPoint(v423.Position)

											if not v425 or not v427 then
												v407.skeletonLines[i].Visible = false
											else
												v407.skeletonLines[i].From = Vector2.new(v424.X, v424.Y)
												v407.skeletonLines[i].To = Vector2.new(v426.X, v426.Y)
												v407.skeletonLines[i].Visible = true
											end
										end
									end
								elseif v407.skeletonLines then
									for _, v in ipairs(v407.skeletonLines) do
										v.Visible = false
									end
								end

								v394 = true
							else
								v394 = true
							end
						end
					end
				end

				g395 = false

				if not v394 then
					return
				end
			end

			return
		end
	end)
	t1.ESPTab:Divider()
	t1.ESPTab:Space()
	t1.ESPTab:Toggle({
		Title = "Innocent Highlights",
		Value = false,
		Callback = function(p39)
			t17.Highlights.Innocent = p39
		end
	})
	t1.ESPTab:Toggle({
		Title = "Murderer Highlights",
		Value = false,
		Callback = function(p40)
			t17.Highlights.Murderer = p40
		end
	})
	t1.ESPTab:Toggle({
		Title = "Sheriff/Hero Highlights",
		Value = false,
		Callback = function(p41)
			t17.Highlights.Sheriff = p41
		end
	})
	t1.ESPTab:Toggle({
		Title = "Dead Highlights",
		Value = false,
		Callback = function(p42)
			t17.Highlights.DeadInnocent = p42
		end
	})
	t1.ESPTab:Divider()
	t1.ESPTab:Space()
	t1.ESPTab:Toggle({
		Title = "Innocent Skeleton",
		Value = false,
		Callback = function(p43)
			t17.Skeleton.Innocent = p43
		end
	})
	t1.ESPTab:Toggle({
		Title = "Murderer Skeleton",
		Value = false,
		Callback = function(p44)
			t17.Skeleton.Murderer = p44
		end
	})
	t1.ESPTab:Toggle({
		Title = "Sheriff/Hero Skeleton",
		Value = false,
		Callback = function(p45)
			t17.Skeleton.Sheriff = p45
		end
	})
	t1.ESPTab:Toggle({
		Title = "Dead Skeleton",
		Value = false,
		Callback = function(p46)
			t17.Skeleton.DeadInnocent = p46
		end
	})
	t1.ESPTab:Divider()
	t1.ESPTab:Space()
	t1.ESPTab:Toggle({
		Title = "Innocent Tracers",
		Value = false,
		Callback = function(p47)
			t17.Tracers.Innocent = p47
		end
	})
	t1.ESPTab:Toggle({
		Title = "Murderer Tracers",
		Value = false,
		Callback = function(p48)
			t17.Tracers.Murderer = p48
		end
	})
	t1.ESPTab:Toggle({
		Title = "Sheriff/Hero Tracers",
		Value = false,
		Callback = function(p49)
			t17.Tracers.Sheriff = p49
		end
	})
	t1.ESPTab:Toggle({
		Title = "Dead Tracers",
		Value = false,
		Callback = function(p50)
			t17.Tracers.DeadInnocent = p50
		end
	})
	t1.ESPTab:Divider()
	t1.ESPTab:Divider()
	t1.ESPTab:Space()
	t1.ESPTab:Colorpicker({
		Title = "Innocent Highlights Color",
		Default = t16.Highlights.Innocent,
		Callback = function(p51)
			t16.Highlights.Innocent = p51
		end
	})
	t1.ESPTab:Colorpicker({
		Title = "Murderer Highlights Color",
		Default = t16.Highlights.Murderer,
		Callback = function(p52)
			t16.Highlights.Murderer = p52
		end
	})
	t1.ESPTab:Colorpicker({
		Title = "Sheriff/Hero Highlights Color",
		Default = t16.Highlights.Sheriff,
		Callback = function(p53)
			t16.Highlights.Sheriff = p53
			t16.Highlights.Hero = p53
		end
	})
	t1.ESPTab:Colorpicker({
		Title = "Dead Highlights Color",
		Default = t16.Highlights.DeadInnocent,
		Callback = function(p54)
			t16.Highlights.DeadInnocent = p54
		end
	})
	t1.ESPTab:Divider()
	t1.ESPTab:Space()
	t1.ESPTab:Colorpicker({
		Title = "Innocent Skeleton Color",
		Default = t16.Skeleton.Innocent,
		Callback = function(p55)
			t16.Skeleton.Innocent = p55
		end
	})
	t1.ESPTab:Colorpicker({
		Title = "Murderer Skeleton Color",
		Default = t16.Skeleton.Murderer,
		Callback = function(p56)
			t16.Skeleton.Murderer = p56
		end
	})
	t1.ESPTab:Colorpicker({
		Title = "Sheriff/Hero Skeleton Color",
		Default = t16.Skeleton.Sheriff,
		Callback = function(p57)
			t16.Skeleton.Sheriff = p57
			t16.Skeleton.Hero = p57
		end
	})
	t1.ESPTab:Colorpicker({
		Title = "Dead Skeleton Color",
		Default = t16.Skeleton.DeadInnocent,
		Callback = function(p58)
			t16.Skeleton.DeadInnocent = p58
		end
	})
	t1.ESPTab:Divider()
	t1.ESPTab:Space()
	t1.ESPTab:Colorpicker({
		Title = "Innocent Tracers Color",
		Default = t16.Tracers.Innocent,
		Callback = function(p59)
			t16.Tracers.Innocent = p59
		end
	})
	t1.ESPTab:Colorpicker({
		Title = "Murderer Tracers Color",
		Default = t16.Tracers.Murderer,
		Callback = function(p60)
			t16.Tracers.Murderer = p60
		end
	})
	t1.ESPTab:Colorpicker({
		Title = "Sheriff/Hero Tracers Color",
		Default = t16.Tracers.Sheriff,
		Callback = function(p61)
			t16.Tracers.Sheriff = p61
			t16.Tracers.Hero = p61
		end
	})
	t1.ESPTab:Colorpicker({
		Title = "Dead Tracers Color",
		Default = t16.Tracers.DeadInnocent,
		Callback = function(p62)
			t16.Tracers.DeadInnocent = p62
		end
	})
	t1.PlayerTab:Divider()
	LocalPlayer9 = Players4.LocalPlayer

	function u112()
		return LocalPlayer9.Character or LocalPlayer9.CharacterAdded:Wait()
	end
	function u113()
		for _, child in ipairs(Workspace2:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChild("Spawns") and not child.Name:lower():find("lobby") then
				for _, descendant in ipairs(child:GetDescendants()) do
					if descendant:IsA("BasePart") then
						return child
					end
				end
			end
		end

		return nil
	end

	t1.TeleportTab:Button({
		Title = "Teleport to Spawn",
		Compact = true,
		Callback = function()
			local v458 = u112()

			v458:WaitForChild("HumanoidRootPart")
			v458:PivotTo((CFrame.new(349.614563, 521.773132, -3.974884)))
		end
	})
	t1.TeleportTab:Button({
		Title = "Teleport to Game Map",
		Compact = true,
		Callback = function()
			local v459 = u112()

			v459:WaitForChild("HumanoidRootPart")

			local v460 = u113()

			if not v460 then
				_Raw:Notify({
					Title = "Error",
					Content = "Game map not found",
					Icon = "message-square-warning",
					IconThemed = true,
					Duration = 3
				})

				return
			end

			local Spawns = v460:FindFirstChild("Spawns")
			local descendantPosition = nil

			if Spawns then
				for _, descendant in ipairs(Spawns:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendantPosition = descendant.Position

						break
					end
				end
			end

			if not descendantPosition then
				local zero = Vector3.zero
				local n9 = 0

				for _, descendant in ipairs(v460:GetDescendants()) do
					if descendant:IsA("BasePart") then
						zero = zero + descendant.Position
						n9 = n9 + 1
					end
				end

				if n9 > 0 then
					descendantPosition = zero / n9
				end
			end

			if descendantPosition then
				v459:PivotTo(CFrame.new(descendantPosition + Vector3.new(0, 5, 0)))
			end
		end
	})
	t1.TeleportTab:Button({
		Title = "Teleport Above Map",
		Compact = true,
		Callback = function()
			local v469 = u112()

			v469:WaitForChild("HumanoidRootPart")

			local v470 = u113()

			if v470 then
				local v471 = -math.huge
				local zero = Vector3.zero
				local n10 = 0

				for _, descendant in ipairs(v470:GetDescendants()) do
					if descendant:IsA("BasePart") then
						v471 = math.max(v471, descendant.Position.Y)
						zero = zero + descendant.Position
						n10 = n10 + 1
					end
				end

				if n10 == 0 then
					_Raw:Notify({
						Title = "Error",
						Content = "No map parts found",
						Duration = 3
					})

					return
				end

				local v476 = zero / n10
				local vector3_2 = Vector3.new(v476.X, v471 + 30, v476.Z)

				v469:PivotTo(CFrame.new(vector3_2))
				_Raw:Notify({
					Title = "Teleported",
					Content = "Teleported above map",
					Duration = 2
				})

				return
			end

			_Raw:Notify({
				Title = "Error",
				Content = "Game map not found",
				Icon = "message-square-warning",
				IconThemed = true,
				Duration = 3
			})
		end
	})
	t1.TeleportTab:Button({
		Title = "TP to Murderer",
		Compact = true,
		Callback = function()
			local Character = game.Players.LocalPlayer.Character

			if Character then
				local v479 = nil

				for _, player in ipairs(game.Players:GetPlayers()) do
					if player ~= game.Players.LocalPlayer and (player.Backpack and player.Backpack:FindFirstChild("Knife") or player.Character and player.Character:FindFirstChild("Knife")) then
						v479 = player

						break
					end
				end

				if v479 and v479.Character and v479.Character:FindFirstChild("HumanoidRootPart") then
					Character:PivotTo(CFrame.new(v479.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)))
				end

				return
			end
		end
	})
	t1.TeleportTab:Divider()
	t1.TeleportTab:Button({
		Title = "TP to Sheriff",
		Compact = true,
		Callback = function()
			local Character = game.Players.LocalPlayer.Character

			if not Character then
				return
			end

			local v483 = nil

			for _, player in ipairs(game.Players:GetPlayers()) do
				if player ~= game.Players.LocalPlayer and (player.Backpack and player.Backpack:FindFirstChild("Gun") or player.Character and player.Character:FindFirstChild("Gun")) then
					v483 = player

					break
				end
			end

			if v483 and v483.Character and v483.Character:FindFirstChild("HumanoidRootPart") then
				Character:PivotTo(CFrame.new(v483.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)))
			end
		end
	})

	local Players5 = game:GetService("Players")
	local UserInputService3 = game:GetService("UserInputService")

	RunService4 = game:GetService("RunService")
	Workspace3 = game:GetService("Workspace")
	LocalPlayer10 = Players5.LocalPlayer
	u119 = false
	u120 = false
	u121 = false
	u122 = false
	n11 = -50
	u124 = nil
	vector3 = Vector3.new(1000, 10, 1000)
	t1.PlayerTab:Section({
		Title = "player",
		Icon = "person-standing"
	})
	t1.PlayerTab:Toggle({
		Title = "Noclip",
		Value = false,
		Callback = function(p63)
			u119 = p63
		end
	})
	RunService4.Stepped:Connect(function()
		if u119 and LocalPlayer10.Character then
			for _, descendant in ipairs(LocalPlayer10.Character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.CanCollide = false
				end
			end
		end
	end)
	t1.PlayerTab:Slider({
		Title = "Walk Speed",
		Desc = "Changes player walk speed",
		Value = {
			Min = 16,
			Max = 200,
			Default = 16
		},
		Callback = function(p64)
			local _Humanoid = LocalPlayer10.Character and LocalPlayer10.Character:FindFirstChildOfClass("Humanoid")

			if _Humanoid then
				_Humanoid.WalkSpeed = p64
			end
		end
	})
	t1.PlayerTab:Slider({
		Title = "Jump Power",
		Value = {
			Min = 50,
			Max = 500,
			Default = 50
		},
		Callback = function(p65)
			local _Humanoid2 = LocalPlayer10.Character and LocalPlayer10.Character:FindFirstChildOfClass("Humanoid")

			if _Humanoid2 then
				_Humanoid2.JumpPower = p65
			end
		end
	})
	t1.PlayerTab:Toggle({
		Title = "Zero Gravity",
		Callback = function(p66)
			Workspace3.Gravity = p66 and 0 or 196.2
		end
	})
	t1.PlayerTab:Divider()
	t1.PlayerTab:Toggle({
		Title = "X ray ",
		Callback = function(p67)
			u121 = p67

			for _, descendant in pairs(Workspace3:GetDescendants()) do
				if descendant:IsA("BasePart") and (not LocalPlayer10.Character or not descendant:IsDescendantOf(LocalPlayer10.Character)) then
					descendant.LocalTransparencyModifier = p67 and 0.7 or 0
				end
			end
		end
	})
	t1.PlayerTab:Toggle({
		Title = "Infinite Jump",
		Callback = function(p68)
			u120 = p68
		end
	})
	UserInputService3.JumpRequest:Connect(function()
		if u120 and LocalPlayer10.Character then
			local Humanoid = LocalPlayer10.Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end)
end

t1.PlayerTab:Button({
	Title = "Teleport Tool",
	Callback = function()
		local Tool = Instance.new("Tool")

		Tool.RequiresHandle = false
		Tool.Name = "Teleport Tool"
		Tool.Activated:Connect(function()
			local v880 = LocalPlayer10:GetMouse().Hit.Position + Vector3.new(0, 5, 0)
			local _HumanoidRootPart4 = LocalPlayer10.Character and LocalPlayer10.Character:FindFirstChild("HumanoidRootPart")

			if _HumanoidRootPart4 then
				_HumanoidRootPart4.CFrame = CFrame.new(v880)
			end
		end)
		Tool.Parent = LocalPlayer10:WaitForChild("Backpack")
	end
})
t1.PlayerTab:Divider()

local function u126()
	if u124 and u124.Parent then
		u124:Destroy()
	end

	u124 = Instance.new("Part")
	u124.Name = "AntiVoidPlatform"
	u124.Size = vector3
	u124.Position = Vector3.new(0, n11 + vector3.Y / 2, 0)
	u124.Anchored = true
	u124.CanCollide = true
	u124.Transparency = 0.7
	u124.Color = Color3.fromRGB(0, 170, 255)
	u124.Material = Enum.Material.Neon

	local Texture = Instance.new("Texture")

	Texture.Texture = "rbxassetid://280375461"
	Texture.Face = Enum.NormalId.Top
	Texture.StudsPerTileU = 50
	Texture.StudsPerTileV = 50
	Texture.Parent = u124

	local Texture2 = Instance.new("Texture")

	Texture2.Texture = "rbxassetid://280375461"
	Texture2.Face = Enum.NormalId.Bottom
	Texture2.StudsPerTileU = 50
	Texture2.StudsPerTileV = 50
	Texture2.Parent = u124
	u124.Friction = 0.3
	u124.Elasticity = 0.1
	u124.Parent = Workspace3

	return u124
end
local function u127()
	if u124 and u124.Parent then
		u124:Destroy()
		u124 = nil
	end
end
local function u128()
	if not u122 then
		u127()
	else
		if not u124 or not u124.Parent then
			u126()
		end

		local Character = LocalPlayer10.Character

		if Character and Character:FindFirstChild("HumanoidRootPart") then
			local HumanoidRootPart = Character.HumanoidRootPart

			u124.Position = Vector3.new(math.floor(HumanoidRootPart.Position.X / 100) * 100, n11 + vector3.Y / 2, math.floor(HumanoidRootPart.Position.Z / 100) * 100)
		end
	end
end

t1.PlayerTab:Toggle({
	Title = "Anti Void",
	Value = false,
	Callback = function(p69)
		u122 = p69
		u128()

		if not p69 then
			u127()
		end
	end
})

local connection = nil
local vector3_3 = Vector3.new(0, 0, 0)

local function u131()
	if connection then
		connection:Disconnect()
	end

	connection = RunService4.Heartbeat:Connect(function()
		if u122 and u124 then
			local Character = LocalPlayer10.Character

			if Character and Character:FindFirstChild("HumanoidRootPart") then
				local HumanoidRootPart = Character.HumanoidRootPart

				if (HumanoidRootPart.Position - vector3_3).Magnitude > 100 then
					vector3_3 = HumanoidRootPart.Position
					u124.Position = Vector3.new(math.floor(HumanoidRootPart.Position.X / 100) * 100, n11 + vector3.Y / 2, math.floor(HumanoidRootPart.Position.Z / 100) * 100)
				end
			end

			return
		end
	end)
end

game:GetService("Players").PlayerRemoving:Connect(function(player)
	if player == LocalPlayer10 then
		u127()

		if connection then
			connection:Disconnect()
		end
	end
end)
LocalPlayer10.CharacterAdded:Connect(function(character)
	local Humanoid = character:WaitForChild("Humanoid")

	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50

	if u122 then
		wait(1)
		u128()
		u131()
	end
end)

if u122 then
	u128()
	u131()
end

t1.PlayerTab:Button({
	Title = "mobile Fly",
	Value = false,
	Callback = function(_)
		loadstring("loadstring(game:HttpGet(('https://gist.githubusercontent.com/meozoneYT/bf037dff9f0a70017304ddd67fdcd370/raw/e14e74f425b060df523343cf30b787074eb3c5d2/arceus%2520x%2520fly%25202%2520obflucator'),true))()\n\n")()
	end
})

local Players6 = game:GetService("Players")
local LocalPlayer11 = Players6.LocalPlayer
local t21 = {}
local u135 = false

getgenv().OldPos = nil
getgenv().FPDH = workspace.FallenPartsDestroyHeight

local u136 = t1.TrollingTab:Paragraph({
	Title = "fling stat",
	Desc = "Select ppl to fling",
	Locked = true
})

local function u137()
	local n12 = 0

	for _ in pairs(t21) do
		n12 = n12 + 1
	end

	if u135 then
		u136:SetDesc("Flinging " .. n12 .. " target(s)")
	else
		u136:SetDesc(n12 .. " people selected")
	end
end
local function u138(p71)
	local t22 = {}

	for _, player in ipairs(Players6:GetPlayers()) do
		if player ~= LocalPlayer11 then
			table.insert(t22, player.Name)
		end
	end

	p71:Refresh(t22)
end

local u139 = t1.TrollingTab:Dropdown({
	Title = "Select Players",
	Desc = "Multi-select players to fling",
	Values = {},
	Value = {},
	Multi = true,
	AllowNone = true,
	Callback = function(p72)
		t21 = {}

		for _, v in pairs(p72) do
			local v3 = Players6:FindFirstChild(v)

			if v3 then
				t21[v] = v3
			end
		end

		u137()
	end
})

local function u140(p73)
	local Character = LocalPlayer11.Character
	local _Humanoid3 = Character and Character:FindFirstChildOfClass("Humanoid")
	local _RootPart = _Humanoid3 and _Humanoid3.RootPart
	local Character3 = p73.Character

	if not Character3 then
		return
	end

	local Humanoid = nil
	local RootPart = nil
	local Head = nil
	local Accessory = nil
	local Handle = nil

	if Character3:FindFirstChildOfClass("Humanoid") then
		Humanoid = Character3:FindFirstChildOfClass("Humanoid")
	end

	if Humanoid and Humanoid.RootPart then
		RootPart = Humanoid.RootPart
	end

	if Character3:FindFirstChild("Head") then
		Head = Character3.Head
	end

	if Character3:FindFirstChildOfClass("Accessory") then
		Accessory = Character3:FindFirstChildOfClass("Accessory")
	end

	if Accessory and Accessory:FindFirstChild("Handle") then
		Handle = Accessory.Handle
	end

	if Character and _Humanoid3 and _RootPart then
		if _RootPart.Velocity.Magnitude < 50 then
			getgenv().OldPos = _RootPart.CFrame
		end

		if Humanoid and Humanoid.Sit then
			return
		end

		if Head then
			workspace.CurrentCamera.CameraSubject = Head
		elseif not Handle then
			if Humanoid and RootPart then
				workspace.CurrentCamera.CameraSubject = Humanoid
			end
		else
			workspace.CurrentCamera.CameraSubject = Handle
		end

		if not Character3:FindFirstChildWhichIsA("BasePart") then
			return
		end

		local function u529(p74, p75, p76)
			_RootPart.CFrame = CFrame.new(p74.Position) * p75 * p76
			Character:SetPrimaryPartCFrame(CFrame.new(p74.Position) * p75 * p76)
			_RootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
			_RootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
		end
		local function v530(p77)
			local timestamp = tick()
			local n13 = 0

			repeat
				if _RootPart and Humanoid then
					if p77.Velocity.Magnitude < 50 then
						n13 = n13 + 100
						u529(p77, CFrame.new(0, 1.5, 0) + Humanoid.MoveDirection * p77.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n13), 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, -1.5, 0) + Humanoid.MoveDirection * p77.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n13), 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, 1.5, 0) + Humanoid.MoveDirection * p77.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n13), 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, -1.5, 0) + Humanoid.MoveDirection * p77.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n13), 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, 1.5, 0) + Humanoid.MoveDirection, CFrame.Angles(math.rad(n13), 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, -1.5, 0) + Humanoid.MoveDirection, CFrame.Angles(math.rad(n13), 0, 0))
						task.wait()
					else
						u529(p77, CFrame.new(0, 1.5, Humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, -1.5, -Humanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, 1.5, Humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						u529(p77, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()
					end
				end
			until timestamp + 2 < tick() or not u135
		end

		workspace.FallenPartsDestroyHeight = 0 / 0

		local BodyVelocity = Instance.new("BodyVelocity")

		BodyVelocity.Parent = _RootPart
		BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		BodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
		_Humanoid3:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

		if not RootPart then
			if Head then
				v530(Head)
			elseif Handle then
				v530(Handle)
			end
		else
			v530(RootPart)
		end

		BodyVelocity:Destroy()
		_Humanoid3:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		workspace.CurrentCamera.CameraSubject = _Humanoid3

		if getgenv().OldPos then
			repeat
				_RootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
				_Humanoid3:ChangeState("GettingUp")

				for _, child in pairs(Character:GetChildren()) do
					if child:IsA("BasePart") then
						local vector3_4 = Vector3.new()

						child.RotVelocity = Vector3.new()
						child.Velocity = vector3_4
					end
				end

				task.wait()
			until (_RootPart.Position - getgenv().OldPos.p).Magnitude < 25

			workspace.FallenPartsDestroyHeight = getgenv().FPDH
		end
	end
end

t1.TrollingTab:Button({
	Title = "fling ppl",
	Callback = function()
		if u135 then
			return
		end

		u135 = true
		task.spawn(function()
			while u135 do
				for _, v in pairs(t21) do
					if u135 and v and v.Parent then
						u140(v)
						task.wait(0.1)
					end
				end

				task.wait(0.5)
			end
		end)
	end
})
t1.TrollingTab:Button({
	Title = "stop fling",
	Callback = function()
		u135 = false
	end
})

local function u141(p78)
	local Backpack = p78:FindFirstChild("Backpack")

	if Backpack then
		for _, child in ipairs(Backpack:GetChildren()) do
			if child:IsA("Tool") then
				if child.Name:lower():find("knife") or child.Name:lower():find("murderer") then
					return "Murderer"
				end

				if child.Name:lower():find("gun") or child.Name:lower():find("sheriff") then
					return "Sheriff"
				end
			end
		end
	end

	local Character = p78.Character

	if Character then
		for _, child in ipairs(Character:GetChildren()) do
			if child:IsA("Tool") then
				if child.Name:lower():find("knife") or child.Name:lower():find("murderer") then
					return "Murderer"
				end

				if child.Name:lower():find("gun") or child.Name:lower():find("sheriff") then
					return "Sheriff"
				end
			end
		end
	end

	return "Innocent"
end

t1.TrollingTab:Button({
	Title = "fling murderer",
	Callback = function()
		if u135 then
			return
		end

		t21 = {}

		for _, player in ipairs(Players6:GetPlayers()) do
			if player ~= LocalPlayer11 and u141(player) == "Murderer" then
				t21[player.Name] = player
			end
		end

		u137()

		if next(t21) then
			u135 = true
			task.spawn(function()
				for _, v in pairs(t21) do
					if v and v.Parent then
						u140(v)
						task.wait(0.5)
					end
				end

				u135 = false
				u137()
			end)
		end
	end
})
t1.TrollingTab:Button({
	Title = "fling sheriff",
	Callback = function()
		if not u135 then
			t21 = {}

			for _, player in ipairs(Players6:GetPlayers()) do
				if player ~= LocalPlayer11 and u141(player) == "Sheriff" then
					t21[player.Name] = player
				end
			end

			u137()

			if next(t21) then
				u135 = true
				task.spawn(function()
					for _, v in pairs(t21) do
						if v and v.Parent then
							u140(v)
							task.wait(0.5)
						end
					end

					u135 = false
					u137()
				end)
			end

			return
		end
	end
})
t1.TrollingTab:Divider()
t15.PlayEmote = ReplicatedStorage.Remotes.Misc.PlayEmote
getgenv().AutoShootEnabled = false
getgenv().AutoBreakGun = false
getgenv().SeizureLoop = nil

local t23 = {
	"sit",
	"ninja",
	"dab",
	"zen",
	"floss",
	"headless",
	"zombie",
	"wave",
	"cheer",
	"laugh"
}

t1.TrollingTab:Dropdown({
	Title = "Select Emote",
	Desc = "Do an emote",
	Values = t23,
	Value = t23[0],
	Callback = function(p79)
		t15.PlayEmote:Fire(p79)
	end
})
t1.TrollingTab:Toggle({
	Title = "Seizure Mode",
	Callback = function(p80)
		if not p80 then
			if getgenv().SeizureLoop then
				task.cancel(getgenv().SeizureLoop)
				getgenv().SeizureLoop = nil
			end
		else
			getgenv().SeizureLoop = task.spawn(function()
				while task.wait(0.1) do
					for _, v in ipairs(t23) do
						t15.PlayEmote:Fire(v)
						task.wait(0.05)
					end
				end
			end)
		end
	end
})
Players6.PlayerAdded:Connect(function()
	u138(u139)
end)
Players6.PlayerRemoving:Connect(function(player)
	t21[player.Name] = nil
	u138(u139)
end)
u138(u139)
t1.TrollingTab:Divider()
t1.TrollingTab:Button({
	Title = "lag server",
	Callback = function()
		function CrashServer()
			local GetSyncData = game:GetService("ReplicatedStorage").GetSyncData
			local InvokeServer = GetSyncData.InvokeServer
			local spawn2 = task.spawn
			local n14 = 0

			while true do
				for _ = 1, 1 do
					spawn2(InvokeServer, GetSyncData)
				end

				n14 = n14 + 1

				if n14 == 3 then
					wait(0)
					n14 = 0
				end
			end
		end
	end
})

local RunService5, Workspace4, VirtualUser2, LocalPlayer12, CoinCollected, t24, t25, u162, u163, Part, u166, u167, u168, u169, TextLabel

do
	local v143 = u8:Tab({
		Title = "Configs",
		Icon = "solar:folder-with-files-bold",
		IconColor = Purple,
		Border = true
	})
	local ConfigManager = u8.ConfigManager
	local s6 = "default"
	local u146 = v143:Input({
		Title = "Config Name",
		Icon = "file-cog",
		Callback = function(p81)
			s6 = p81
		end
	})
	local u147 = v143:Toggle({
		Title = "Enable Auto Load to Selected Config",
		Value = false,
		Callback = function(p82)
			u8.CurrentConfig:SetAutoLoad(p82)
		end
	})
	local v148 = ConfigManager:AllConfigs()
	local v149 = table.find(v148, s6) and s6 or nil
	local u150 = v143:Dropdown({
		Title = "All Configs",
		Desc = "Select existing configs",
		Values = v148,
		Value = v149,
		Callback = function(p83)
			s6 = p83
			u146:Set(p83)
			u147:Set(ConfigManager:GetConfig(s6).AutoLoad or false)
		end
	})

	v143:Space()
	v143:Button({
		Title = "Save Config",
		Justify = "Center",
		Callback = function()
			u8.CurrentConfig = ConfigManager:Config(s6)

			if u8.CurrentConfig:Save() then
				_Raw:Notify({
					Title = "Config Saved",
					Content = "Config '" .. s6 .. "' saved successfully!",
					Icon = "check"
				})
			end

			u150:Refresh(ConfigManager:AllConfigs())
		end
	})
	v143:Button({
		Title = "Load Config",
		Justify = "Center",
		Callback = function()
			u8.CurrentConfig = ConfigManager:CreateConfig(s6)

			if u8.CurrentConfig:Load() then
				_Raw:Notify({
					Title = "Config Loaded",
					Content = "Config '" .. s6 .. "' loaded!",
					Icon = "refresh-cw"
				})
			end
		end
	})
	v143:Button({
		Title = "Print AutoLoad Configs",
		Justify = "Center",
		Callback = function()
			print(ConfigManager:GetAutoLoadConfigs())
		end
	})

	local LocalPlayer13 = game:GetService("Players").LocalPlayer

	LocalPlayer13:WaitForChild("PlayerGui", 600)
	game:GetService("HttpService")
	game:GetService("Players")
	game:GetService("Workspace")

	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local Players7 = game:GetService("Players")

	RunService5 = game:GetService("RunService")
	Workspace4 = game:GetService("Workspace")
	VirtualUser2 = game:GetService("VirtualUser")
	LocalPlayer12 = Players7.LocalPlayer
	CoinCollected = ReplicatedStorage2.Remotes.Gameplay.CoinCollected

	local RoundStart = ReplicatedStorage2.Remotes.Gameplay.RoundStart

	t24 = {
		"MouseButton1Click",
		"MouseButton1Down",
		"Activated"
	}

	function TapUI(p84, p85, p86)
		if p85 == "Active Check" then
			if not p84.Active then
				return
			end

			p84 = p84[p86]
		end

		if p85 == "Text Check" then
			if p84 ~= "^" then
				return
			end
		else
			p86 = p84
		end

		local v555, v556, v557 = pairs(t24)

		while true do
			local v558

			v557, v558 = v555(v556, v557)

			if v557 == nil then
				break
			end

			local v559, v560, v561 = pairs(getconnections(p86[v558]))

			while true do
				local v562

				v561, v562 = v559(v560, v561)

				if v561 == nil then
					break
				end

				v562:Fire()
			end
		end
	end

	repeat
		task.wait(1)
		pcall(function()
			TapUI(LocalPlayer12.PlayerGui.DeviceSelect.Container.Tablet.Button)
		end)
		pcall(function()
			TapUI(game:GetService("Players").LocalPlayer.PlayerGui.Join.Friends.Play)
		end)
	until LocalPlayer12.PlayerGui:FindFirstChild("MainGUI")

	repeat
		fr = pcall(function()
			require(game:GetService("ReplicatedStorage").Modules.TradeModule)
		end)
		task.wait()
	until fr

	DefaultConfig = {
		AutoRevealRoles = false,
		AutoAdvertizeDiscord = false,
		CoinFarm = {
			StatsOverlay = false,
			State = false,
			Settings = {
				Speed = 22.5,
				DestroyMap = false,
				DestroyPlayers = false,
				Fly = false,
				DieAtFullBag = false
			}
		},
		CoinFarm2 = {
			State = false,
			Settings = {
				Speed = 22.5,
				DestroyMap = false,
				DestroyPlayers = false,
				DieAtFullBag = false,
				Disable3DRendering = false
			}
		},
		CoinFarm3 = {
			State = false
		},
		ESP = {
			Players = false,
			Traps = false,
			DroppedGun = false
		},
		Noclip = false,
		Gameplay = {
			AutoPickUpGun = false,
			AutoShooting = false
		},
		AutoFarm = {
			TeleportSpawn = false,
			KillEveryoneAsAMurderer = false,
			AutoFlingMurderer = false,
			AutoFlingSheriff = false,
			AutoPrestige = false,
			KillEveryoneAsAMurdererAtFullBag = false,
			TeleportUnderMap = false,
			AutoTeleportToRandomServerIfServerIsEmpty = false,
			AutoFlingMurdererAtFullBag = false,
			PlayersToAutoServerHop = 2
		},
		AnnoyingStuff = {
			Fling = {
				PickedPlayer = nil,
				LoopFlingAllPlayers = false
			}
		},
		Sliders = {
			Speed = LocalPlayer12.Character.Humanoid.WalkSpeed,
			Jump = LocalPlayer12.Character.Humanoid.JumpPower
		},
		AutoOpenCrates = {
			State = false,
			Crate = "MysteryBox1",
			CrateType = "MysteryBox"
		},
		VisualGun = false,
		ShuffleWeapons = false,
		Emotes = {
			SelectedEmote = "zen",
			AutoPlayEmotes = false,
			AutoPlaySelectedEmote = false,
			EmoteSpamSpeed = 1
		}
	}

	function deep_copy_table(p87)
		local v564 = table.clone(p87)
		local v565, v566, v567 = pairs(v564)

		while true do
			local v568

			v567, v568 = v565(v566, v567)

			if v567 == nil then
				break
			end

			if type(v568) == "table" then
				v564[v567] = table.clone(v568)
			end
		end

		return v564
	end

	Config = deep_copy_table(DefaultConfig)
	print("Loaded [MM2]")
	DevelopingLog = "\r\nThis script was created by Fashn\r\nfor Immortal Hub Project\r\n"
	LocalPlayer13.Idled:connect(function()
		VirtualUser2:ClickButton2(Vector2.new())
	end)

	function TeleportUnderMap()
		if workspace:FindFirstChild("safespot") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106, 87.5, 2)
		else
			safespot = Instance.new("Part")
			safespot.Name = "safespot"
			safespot.Size = Vector3.new(25, 3, 25)
			safespot.Position = Vector3.new(-106, 83, 2)
			safespot.Parent = workspace
			safespot.Anchored = true
			safespot.CanCollide = true
			safespot.Transparency = 0
			task.wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106, 87.5, 2)
			task.wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106, 87.5, 2)
			task.wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106, 87.5, 2)
		end
	end

	game:GetService("GuiService").ErrorMessageChanged:Connect(function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
	end)
	t25 = {
		"sit",
		"ninja",
		"dab",
		"zen",
		"floss",
		"headless",
		"zombie",
		"wave",
		"cheer",
		"laugh"
	}

	function PlayEmote(p88)
		game:GetService("ReplicatedStorage").Remotes.Misc.PlayEmote:Fire(p88)
	end

	task.spawn(function()
		while task.wait(1 / Config.Emotes.EmoteSpamSpeed) do
			if Config.Emotes.AutoPlayEmotes then
				PlayEmote(t25[math.random(1, #t25)])
			end
		end
	end)

	function fly()
		speeds = 1

		local LocalPlayer14 = game:GetService("Players").LocalPlayer
		local Character = LocalPlayer12.Character

		if Character then
			Character:FindFirstChildWhichIsA("Humanoid")
		end

		nowe = false
		Duration = 5

		if nowe ~= true then
			nowe = true
			LocalPlayer12.Character.Animate.Disabled = true

			local Character4 = LocalPlayer12.Character
			local _Humanoid4 = Character4:FindFirstChildOfClass("Humanoid") or Character4:FindFirstChildOfClass("AnimationController")
			local v574, v575, v576 = pairs(_Humanoid4:GetPlayingAnimationTracks())

			while true do
				local v577

				v576, v577 = v574(v575, v576)

				if v576 == nil then
					break
				end

				v577:AdjustSpeed(0)
			end

			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
			LocalPlayer14.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
		else
			nowe = false
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
			LocalPlayer14.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
			LocalPlayer14.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
		end

		local v578 = LocalPlayer12
		local UpperTorso = v578.Character.UpperTorso
		local t26 = {
			f = 0,
			b = 0,
			l = 0,
			r = 0
		}
		local t27 = {
			f = 0,
			b = 0,
			l = 0,
			r = 0
		}
		local n15 = 50
		local n16 = 0
		local BodyGyro = Instance.new("BodyGyro", UpperTorso)

		BodyGyro.P = 90000
		BodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
		BodyGyro.cframe = UpperTorso.CFrame

		local BodyVelocity = Instance.new("BodyVelocity", UpperTorso)

		BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
		BodyVelocity.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)

		if nowe == true then
			v578.Character.Humanoid.PlatformStand = true
		end

		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if t26.l + t26.r ~= 0 or t26.f + t26.b ~= 0 then
				n16 = n16 + 0.5 + n16 / n15

				if n15 < n16 then
					n16 = n15
				end
			elseif t26.l + t26.r == 0 and t26.f + t26.b == 0 and n16 ~= 0 then
				local v586 = n16 - 1

				n16 = v586 < 0 and 0 or v586
			end

			if t26.l + t26.r ~= 0 or t26.f + t26.b ~= 0 then
				BodyVelocity.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (t26.f + t26.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(t26.l + t26.r, (t26.f + t26.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * n16
				t27 = {
					f = t26.f,
					b = t26.b,
					l = t26.l,
					r = t26.r
				}
			elseif t26.l + t26.r ~= 0 or t26.f + t26.b ~= 0 or n16 == 0 then
				BodyVelocity.velocity = Vector3.new(0, 0, 0)
			else
				BodyVelocity.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (t27.f + t27.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(t27.l + t27.r, (t27.f + t27.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * n16
			end

			BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((t26.f + t26.b) * 50 * n16 / n15), 0, 0)
		end

		BodyGyro:Destroy()
		BodyVelocity:Destroy()
		v578.Character.Humanoid.PlatformStand = false
		LocalPlayer12.Character.Animate.Disabled = false
		tpwalking = false
	end
	function destroyplayers()
		local v587, v588, v589 = pairs(game.Players:GetPlayers())

		while true do
			local v590

			v589, v590 = v587(v588, v589)

			if v589 == nil then
				break
			end

			if v590 ~= LocalPlayer12 and game.Workspace:WaitForChild(v590.Name, 0.01) then
				game.Workspace[v590.Name]:Destroy()
			end
		end
	end
	function DestroyMapFunc()
		local v591, v592, v593 = pairs(game.Workspace:GetChildren())

		while true do
			local v594

			v593, v594 = v591(v592, v593)

			local u595 = v594

			if v593 == nil then
				break
			end

			if u595:IsA("Model") and u595:FindFirstChild("CoinContainer") then
				if pcall(function()
					basesex = u595.Base
				end) then
					basesex:Destroy()
				end

				if pcall(function()
					decoration = u595.Decoration_Christmas
				end) then
					decoration:Destroy()
				end

				if pcall(function()
					outfits = u595.Outfits
				end) then
					outfits:Destroy()
				end

				if pcall(function()
					raggy = u595.Raggy
				end) then
					raggy:Destroy()
				end

				if pcall(function()
					interactive = u595.Interactive
				end) then
					interactive:Destroy()
				end

				if pcall(function()
					spawns = u595.Spawns
				end) then
					spawns:Destroy()
				end
			end
		end
	end
	function clipclop()
		local v596, v597, v598 = pairs(LocalPlayer12.Character:GetDescendants())

		while true do
			local v599

			v598, v599 = v596(v597, v598)

			if v598 == nil then
				break
			end

			if v599:IsA("BasePart") and v599.CanCollide == true and v599.Name ~= floatName then
				v599.CanCollide = false
			end
		end
	end

	Noclipping = RunService5.Stepped:Connect(function()
		if Config.Noclip and (LocalPlayer12.Character and LocalPlayer12.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer12.Character.Humanoid.Health > 0 and LocalPlayer12.Character:FindFirstChild("HumanoidRootPart")) then
			clipclop()
		end
	end)

	function RandomItemFromInventory()
		local Weapons = require(game:GetService("ReplicatedStorage").Modules.InventoryModule).MyInventory.Data.Weapons
		local v601, v602, v603 = pairs(Weapons)
		local t28 = {}

		while true do
			local v605

			v603, v605 = v601(v602, v603)

			if v603 == nil then
				break
			end

			local v606 = nil

			while true do
				local v607

				v606, v607 = v605(nil, v606)

				if v606 == nil then
					break
				end

				table.insert(t28, v606)
			end
		end

		return t28[math.random(1, #t28)]
	end

	RunService5.Stepped:Connect(function()
		if Config.Emotes.AutoPlaySelectedEmote then
			PlayEmote(Config.Emotes.SelectedEmote)
		end

		if Config.ShuffleWeapons then
			local t29 = {
				RandomItemFromInventory(),
				"Weapons"
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inventory"):WaitForChild("Equip"):FireServer(unpack(t29))
		end

		if game:GetService("CoreGui"):FindFirstChild("CenteredLabelGui") and game:GetService("CoreGui"):FindFirstChild("CenteredLabelGui"):FindFirstChild("CenteredTextLabel") then
			game:GetService("CoreGui").CenteredLabelGui.CenteredTextLabel.Visible = Config.CoinFarm.StatsOverlay
		end

		if LocalPlayer12.Character and LocalPlayer12.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer12.Character.Humanoid.Health > 0 and LocalPlayer12.Character:FindFirstChild("HumanoidRootPart") then
			if Config.Sliders.Speed ~= LocalPlayer12.Character.Humanoid.WalkSpeed then
				LocalPlayer12.Character.Humanoid.WalkSpeed = Config.Sliders.Speed
			end

			if Config.Sliders.Jump ~= LocalPlayer12.Character.Humanoid.JumpPower then
				LocalPlayer12.Character.Humanoid.JumpPower = Config.Sliders.Jump
			end
		end
	end)
	u162 = LocalPlayer12
	task.spawn(function()
		while task.wait(1) do
			if Config.CoinFarm.Settings.Fly and LocalPlayer12.Character and LocalPlayer12.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer12.Character.Humanoid.Health > 0 and LocalPlayer12.Character:FindFirstChild("HumanoidRootPart") then
				task.spawn(function()
					fly()
				end)
			end
		end
	end)
	DestroyPlayers = RunService5.Stepped:Connect(function()
		if Config.CoinFarm.Settings.DestroyPlayers then
			destroyplayers()
		end
	end)

	function u163()
		local t30 = {}

		if u162.Character and u162.Character:FindFirstChild("HumanoidRootPart") then
			local HumanoidRootPartPosition = u162.Character.HumanoidRootPart.Position
			local v611, v612, v613 = pairs(Workspace4:GetChildren())

			while true do
				local v614

				v613, v614 = v611(v612, v613)

				if v613 == nil then
					break
				end

				if v614:IsA("Model") and v614:FindFirstChild("CoinContainer") then
					local v615, v616, v617 = pairs(v614.CoinContainer:GetChildren())

					while true do
						local v618

						v617, v618 = v615(v616, v617)

						if v617 == nil then
							break
						end

						if v618.Name == "Coin_Server" and not v618:FindFirstChild("CollectedCoin") and v618:FindFirstChild("TouchInterest") then
							local Magnitude = (HumanoidRootPartPosition - v618.Position).Magnitude

							if Magnitude < 100 then
								table.insert(t30, {
									Coin = v618,
									Distance = Magnitude
								})
							end
						end
					end
				end
			end

			table.sort(t30, function(p89, p90)
				return p89.Distance < p90.Distance
			end)
		end

		return t30[1] and t30[1].Coin
	end

	TweenService = game.TweenService

	function coinfarm1()
		local connection3 = RunService5.Heartbeat:Connect(function()
			if Config.CoinFarm.State then
				local Game = u162.PlayerGui:WaitForChild("MainGUI").Game

				if Game.CoinBags.Visible and not Game.CoinBags.Container.Candy.Full.Visible and u162.Character and u162.Character:FindFirstChild("HumanoidRootPart") then
					local HumanoidRootPart = u162.Character.HumanoidRootPart

					if not HumanoidRootPart:FindFirstChild("FLY_NIGGER") then
						local BodyVelocity = Instance.new("BodyVelocity", HumanoidRootPart)

						BodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
						BodyVelocity.Name = "FLY_NIGGER"
					end

					AutoFarming = true
					clipclop()

					local u908 = u163()

					if not u908 then
						HumanoidRootPart.Anchored = true
					else
						HumanoidRootPart.Anchored = false
						spawn(function()
							if u162.Character then
								local HumanoidRootPart7 = u162.Character:WaitForChild("HumanoidRootPart")
								local _Speed = (HumanoidRootPart7.Position - u908.Position).Magnitude / Config.CoinFarm.Settings.Speed
								local cFrame = CFrame.new(u908.Position + Vector3.new(0, -1, 0))

								TweenService:Create(HumanoidRootPart7, TweenInfo.new(_Speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
									CFrame = cFrame
								}):Play()

								if u908 and u908.Parent then
									local connection2 = nil

									connection2 = u908.Touched:Connect(function(_)
										task.wait(0.1)

										if u908 then
											u908:Destroy()
											connection2:Disconnect()
										end
									end)
								end
							end
						end)
					end

					task.wait(0.02)
					AutoFarming = false
				end
			end
		end)
		local connection4 = CoinCollected.OnClientEvent:Connect(function(_, p93, p94)
			if p93 == p94 then
				connection3:Disconnect()
				roundEndConenction:Disconnect()
			end
		end)
		local connection5 = u162.Character.Humanoid.Died:Connect(function()
			task.wait(1)

			repeat
				task.wait()
			until u162.Character ~= nil

			repeat
				task.wait()
			until u162.PlayerGui ~= nil

			task.wait(1)

			repeat
				task.wait()
			until game:GetService("Players").LocalPlayer.PlayerGui.MainGUI ~= nil

			task.wait(1)
			Teleport_to_map()
		end)

		roundEndConenction = game:GetService("ReplicatedStorage").Remotes.Gameplay.RoundEndFade.OnClientEvent:Connect(function()
			connection3:Disconnect()
			connection4:Disconnect()
			connection5:Disconnect()
			roundEndConenction:Disconnect()
		end)
	end

	CoinColldown = 2

	local vector3_5 = Vector3.new(1, -100, 1)

	Part = Instance.new("Part", workspace)
	u166 = LocalPlayer12
	Part.Anchored = true
	Part.Position = vector3_5
	Part.Size = Vector3.new(100, 1.2, 100)
	u167 = false

	function PlayerToBrick()
		u166.Character.HumanoidRootPart.CFrame = CFrame.new(Part.Position + Vector3.new(math.random(-10, 5), 5, math.random(-10, 5)))
	end
	function PlayerToCoin(p95)
		if p95 then
			u166.Character.HumanoidRootPart.CFrame = CFrame.new(p95.Position + Vector3.new(0, -6, 0))
		end
	end
	function GetMap()
		local v624, v625, v626 = ipairs(workspace:GetChildren())
		local v627

		repeat
			v626, v627 = v624(v625, v626)

			if v626 == nil then
				return
			end
		until v627:FindFirstChild("CoinContainer")

		return v627
	end
	function CoinFarm3()
		u167 = false

		if Config.CoinFarm3.State then
			PlayerToBrick()
		end

		while not u167 do
			local v628 = GetMap()

			if v628 then
				if not Config.CoinFarm3.State then
					return
				end

				task.spawn(function()
					pcall(function()
						DestroyMapFunc()
					end)
				end)

				local huge = math.huge
				local v630, v631, v632 = ipairs(v628.CoinContainer:GetChildren())
				local v633 = nil

				while true do
					local v634

					v632, v634 = v630(v631, v632)

					if v632 == nil then
						break
					end

					if v634:FindFirstChild("TouchInterest") then
						local PositionY = v634.Position.Y

						if PositionY < huge then
							v633 = v634
							huge = PositionY
						end
					end
				end

				coin = v633

				local u636 = false

				PlayerToCoin(coin)

				local connection6 = CoinCollected.OnClientEvent:Connect(function(_, p97, p98, _)
					u636 = true

					if p97 == p98 then
						u167 = true
					end
				end)

				if u167 then
					return
				end

				repeat
					task.wait()
					task.spawn(function()
						firetouchinterest(u166.Character.HumanoidRootPart, coin, 0)
						firetouchinterest(u166.Character.HumanoidRootPart, coin, 1)
					end)
					task.wait()
					clipclop()
					PlayerToCoin(coin)
				until u636 or not coin:FindFirstChild("TouchInterest")

				connection6:Disconnect()
				PlayerToBrick()
				wait(CoinColldown)
			else
				task.wait(1)

				if not Config.CoinFarm3.State then
					return
				end
			end
		end
	end

	game:GetService("ReplicatedStorage").Remotes.Gameplay.RoundStart.OnClientEvent:Connect(function()
		task.spawn(function()
			CoinFarm3()
		end)
		RunningCoinFarm3 = true
	end)
	game.Players.LocalPlayer.CharacterAdded:Connect(function()
		if Config.CoinFarm3.State then
			PlayerToBrick()
		end
	end)

	function init()
		if workspace:FindFirstChild("AutoCoinPart") then
			workspace.AutoCoinPart:Destroy()
		end

		local u638 = nil
		local u639 = false
		local Part2 = Instance.new("Part")
		local HumanoidRootPartPosition = LocalPlayer12.Character.HumanoidRootPart.Position

		Part2.Name = "AutoCoinPart"
		Part2.Color = Color3.new(0, 0, 0)
		Part2.Material = Enum.Material.Plastic
		Part2.Transparency = 1
		Part2.Position = HumanoidRootPartPosition
		Part2.Size = Vector3.new(1, 0.5, 1)
		Part2.CastShadow = true
		Part2.Anchored = true
		Part2.CanCollide = false
		Part2.Parent = workspace
		CoinFarm2Connection = RunService5.Heartbeat:Connect(function()
			if Config.CoinFarm2.State == true and (u639 == false and LocalPlayer12.Character and LocalPlayer12.Character:FindFirstChild("HumanoidRootPart")) then
				u639 = true
				workspace.AutoCoinPart.CFrame = LocalPlayer12.Character.HumanoidRootPart.CFrame

				local v916, v917, v918 = pairs(workspace:GetDescendants())

				while true do
					local v919

					v918, v919 = v916(v917, v918)

					if v918 == nil then
						break
					end

					if v919.Name == "Coin_Server" and v919:FindFirstChild("TouchInterest") then
						if u638 then
							if (LocalPlayer12.Character.HumanoidRootPart.Position - u638.Position).Magnitude > (LocalPlayer12.Character.HumanoidRootPart.Position - v919.Position).Magnitude then
								u638 = v919
							end
						else
							u638 = v919
						end
					end
				end

				if u638 then
					CoinFound = true

					if not (math.floor((LocalPlayer12.Character.HumanoidRootPart.Position - u638.Position).Magnitude) < 80) then
						Teleport_to_map()
						Part2.Position = LocalPlayer12.Character.HumanoidRootPart.Position
						task.wait(0.1)
						TweenSpeed = math.floor((LocalPlayer12.Character.HumanoidRootPart.Position - u638.Position).Magnitude) / Config.CoinFarm2.Settings.Speed
					else
						TweenSpeed = math.floor((LocalPlayer12.Character.HumanoidRootPart.Position - u638.Position).Magnitude) / Config.CoinFarm2.Settings.Speed
					end

					if not TweenSpeed then
						return
					end

					local TweenService2 = game:GetService("TweenService")

					tweenInfo = TweenInfo.new(TweenSpeed, Enum.EasingStyle.Linear)
					tweenService = TweenService2
					tween = tweenService:Create(workspace.AutoCoinPart, tweenInfo, {
						CFrame = u638.CFrame + Vector3.new(0, -5, 0)
					})
					tween:Play()
					wait(TweenSpeed)

					if u638 then
						pcall(function()
							firetouchinterest(LocalPlayer12.Character.HumanoidRootPart, u638, 0)
							firetouchinterest(LocalPlayer12.Character.HumanoidRootPart, u638, 1)
						end)
						u638.Parent = nil
					end

					TweenSpeed = 0.08
					u638 = nil
					CoinFound = false
					u639 = false
				end
			end

			if Config.CoinFarm2.State == true and game:GetService("Workspace"):FindFirstChild("AutoCoinPart") and CoinFound == true and LocalPlayer12.Character and LocalPlayer12.Character:FindFirstChild("HumanoidRootPart") then
				local AutoCoinPartCFrame = game:GetService("Workspace").AutoCoinPart.CFrame
				local cFrame = CFrame.Angles(math.rad(90), math.rad(0), math.rad(90))

				LocalPlayer12.Character.HumanoidRootPart.CFrame = CFrame.new(AutoCoinPartCFrame.Position) * cFrame
			end
		end)
		FullBagConnection = CoinCollected.OnClientEvent:Connect(function(_, p101, p102, _)
			if p101 == p102 then
				CoinFarm2Connection:Disconnect()
				FullBagConnection:Disconnect()
				DeathConnection:Disconnect()

				if workspace:FindFirstChild("AutoCoinPart") then
					workspace:FindFirstChild("AutoCoinPart"):Destroy()
				end
			end
		end)
		DeathConnection = LocalPlayer12.Character.Humanoid.Died:Connect(function()
			CoinFarm2Connection:Disconnect()
			FullBagConnection:Disconnect()
			DeathConnection:Disconnect()

			if workspace:FindFirstChild("AutoCoinPart") then
				workspace:FindFirstChild("AutoCoinPart"):Destroy()
			end
		end)
	end

	spawn(coinfarm1)
	spawn(init)

	function u168()
		local v642, v643, v644 = ipairs(game.Players:GetPlayers())
		local v645

		repeat
			v644, v645 = v642(v643, v644)

			if v644 == nil then
				local v646, v647, v648 = ipairs(game.Players:GetPlayers())
				local v649

				repeat
					v648, v649 = v646(v647, v648)

					if v648 == nil then
						if playerData then
							local v650, v651, v652 = pairs(playerData)

							repeat
								local v653

								v652, v653 = v650(v651, v652)

								if v652 == nil then
									return nil
								end
							until v653.Role == "Murderer" and game.Players:FindFirstChild(v652)

							return game.Players:FindFirstChild(v652)
						end

						return nil
					end
				until v649.Character and v649.Character:FindFirstChild("Knife")

				return v649
			end
		until v645:FindFirstChild("Backpack") and v645.Backpack:FindFirstChild("Knife")

		return v645
	end
	function u169()
		local v654, v655, v656 = ipairs(game.Players:GetPlayers())
		local v657

		repeat
			v656, v657 = v654(v655, v656)

			if v656 == nil then
				local v658, v659, v660 = ipairs(game.Players:GetPlayers())
				local v661

				repeat
					v660, v661 = v658(v659, v660)

					if v660 == nil then
						if playerData then
							local v662, v663, v664 = pairs(playerData)

							repeat
								local v665

								v664, v665 = v662(v663, v664)

								if v664 == nil then
									return nil
								end
							until v665.Role == "Sheriff" and game.Players:FindFirstChild(v664)

							return game.Players:FindFirstChild(v664)
						end

						return nil
					end
				until v661.Character and v661.Character:FindFirstChild("Gun")

				return v661
			end
		until v657:FindFirstChild("Backpack") and v657.Backpack:FindFirstChild("Gun")

		return v657
	end
	function reloadESP()
		local v666, v667, v668 = ipairs(workspace:GetChildren())

		while true do
			local v669

			v668, v669 = v666(v667, v668)

			if v668 == nil then
				break
			end

			if v669.Name == "PlayerESP" then
				v669:Destroy()
			end
		end

		local children = game.Players:GetChildren()
		local v671, v672, v673 = ipairs(children)

		while true do
			local v674

			v673, v674 = v671(v672, v673)

			local u675 = v674

			if v673 == nil then
				break
			end

			if u675.Character ~= nil then
				local Character = u675.Character

				if not Character:FindFirstChild("PlayerESP") then
					local Highlight = Instance.new("Highlight", workspace)

					Highlight.Name = "PlayerESP"
					Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					Highlight.Adornee = Character
					Highlight.FillColor = Color3.fromRGB(255, 255, 255)
					Highlight.FillTransparency = 0.5
					task.spawn(function()
						if u675 ~= u168() then
							if u675 ~= u169() then
								Highlight.FillColor = Color3.fromRGB(0, 255, 0)
								Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
							else
								Highlight.FillColor = Color3.fromRGB(0, 150, 255)
								Highlight.OutlineColor = Color3.fromRGB(0, 150, 255)
							end
						else
							Highlight.FillColor = Color3.fromRGB(255, 0, 0)
							Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
						end

						if Highlight then
							if not u675 then
								return
							end

							Highlight.Adornee = u675.Character or u675.CharactedAdded:Wait()
						end
					end)
				end
			end
		end
	end
	function KillEveryoneAsAMurderer()
		if not LocalPlayer12.Character:FindFirstChild("Knife") then
			LocalPlayer12.Character:FindFirstChild("Humanoid")

			if not LocalPlayer12.Backpack:FindFirstChild("Knife") then
				return
			end

			LocalPlayer12.Character:FindFirstChild("Humanoid"):EquipTool(LocalPlayer12.Backpack:FindFirstChild("Knife"))
		end

		local v678, v679, v680 = ipairs(game.Players:GetPlayers())

		while true do
			local v681

			v680, v681 = v678(v679, v680)

			if v680 == nil then
				break
			end

			if v681.Character and v681.Character:FindFirstChild("HumanoidRootPart") and v681 ~= LocalPlayer12 then
				v681.Character:FindFirstChild("HumanoidRootPart").Anchored = true
				v681.Character:FindFirstChild("HumanoidRootPart").CFrame = LocalPlayer12.Character:FindFirstChild("HumanoidRootPart").CFrame + LocalPlayer12.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1
			end
		end

		LocalPlayer12.Character.Knife.Stab:FireServer(unpack({ "Slash" }))
	end

	RunService5.RenderStepped:Connect(function()
		if u169() == LocalPlayer12 and Config.Gameplay.AutoShooting then
			local v682 = u168()

			if not v682 then
				return
			end

			local Character = v682.Character

			if not Character then
				return
			end

			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart then
				return
			end

			local HumanoidRootPartPosition = HumanoidRootPart.Position

			if not LocalPlayer12.Character then
				return
			end

			local HumanoidRootPart8 = LocalPlayer12.Character:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart8 then
				return
			end

			local _Position = HumanoidRootPartPosition - HumanoidRootPart8.Position
			local raycastParams = RaycastParams.new()

			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.FilterDescendantsInstances = { LocalPlayer12.Character }

			local raycastResult = workspace:Raycast(HumanoidRootPart8.Position, _Position, raycastParams)

			if (not raycastResult or raycastResult.Instance.Parent == v682.Character) and (LocalPlayer12.Character:FindFirstChild("Gun") or LocalPlayer12.Backpack:FindFirstChild("Gun")) then
				LocalPlayer12.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gun"))

				local v690 = u168()
				local UpperTorso = v690.Character:FindFirstChild("UpperTorso")
				local Humanoid = v690.Character:FindFirstChild("Humanoid")

				if not UpperTorso then
					return
				end

				if not Humanoid then
					return
				end

				local AssemblyLinearVelocity = UpperTorso.AssemblyLinearVelocity
				local MoveDirection = Humanoid.MoveDirection
				local v695 = LocalPlayer12
				local v696 = (UpperTorso.Position + AssemblyLinearVelocity * Vector3.new(0, 0.5, 0) * 0.14 + MoveDirection * 2.8) * (v695:GetNetworkPing() * 1000 * 0 + 1)

				LocalPlayer12.Character.Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(1, v696, "AH2")
			end
		end
	end)

	function AdvertizeDiscord()
		local children = game:GetService("TextChatService"):WaitForChild("TextChannels"):GetChildren()
		local v698, v699, v700 = ipairs(children)

		while true do
			local v701

			v700, v701 = v698(v699, v700)

			if v700 == nil then
				break
			end

			v701:SendAsync("Immortal hub\r\n gg PwTPex2g6T")
		end
	end

	RoundStart.OnClientEvent:Connect(function(_)
		if Config.AutoRevealRoles then
			RevealRoles()
		end

		if Config.AutoAdvertizeDiscord then
			AdvertizeDiscord()
		end

		if Config.AutoFarm.KillEveryoneAsAMurderer then
			task.wait(1)

			repeat
				KillEveryoneAsAMurderer()
				task.wait(1)
			until u168() ~= u162
		end

		if Config.AutoFarm.AutoFlingMurderer then
			murd = u168()

			if murd and murd ~= game.Players.LocalPlayer then
				miniFling(murd)
			end
		end

		if Config.AutoFarm.AutoFlingSheriff then
			sher = u169()

			if sher and sher ~= game.Players.LocalPlayer then
				miniFling(sher)
			end
		end

		if Config.AutoFarm.TeleportSpawn then
			Teleport_to_lobby()
		end

		spawn(init)
		spawn(coinfarm1)
	end)
	RunService5.Heartbeat:Connect(function()
		if Config.CoinFarm.Settings.DestroyMap then
			DestroyMapFunc()
		end
	end)
	game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gameplay"):WaitForChild("PlayerDataChanged", 5).OnClientEvent:Connect(function(p105)
		playerData = p105

		if Config.ESP.Players then
			reloadESP()
		end
	end)

	function getMap()
		local v704, v705, v706 = ipairs(workspace:GetChildren())
		local v707

		repeat
			v706, v707 = v704(v705, v706)

			if v706 == nil then
				return nil
			end
		until v707:FindFirstChild("CoinContainer") and v707:FindFirstChild("Spawns")

		return v707
	end
	function GetAllEmotes()
		game.ReplicatedStorage.Remotes.Extras.GetPlayerData:InvokeServer("GetData")

		local EmoteModule = game:GetService("ReplicatedStorage").Modules.EmoteModule
		local Emotes = LocalPlayer12.PlayerGui.MainGUI.Game:FindFirstChild("Emotes")

		require(EmoteModule).GeneratePage({
			"headless",
			"zombie",
			"zen",
			"ninja",
			"floss",
			"dab",
			"sit"
		}, Emotes, "Free Emotes")
		getgenv().FreeEmotesOperator = true

		while getgenv().FreeEmotesOperator == true do
			if LocalPlayer12.PlayerGui.MainGUI.Game:FindFirstChild("Emotes") and not LocalPlayer12.PlayerGui.MainGUI.Game.Emotes.EmotePages:FindFirstChild("Free Emotes") then
				getgenv().FreeEmotesOperator = false
				GetAllEmotes()
			end

			RunService5.RenderStepped:wait()
		end
	end
	function pickupgun()
		if getMap() then
			if getMap():FindFirstChild("GunDrop") then
				if u168() ~= LocalPlayer12 then
					if not LocalPlayer12.Character then
						return
					end

					local Pivot = LocalPlayer12.Character:GetPivot()

					LocalPlayer12.Character:MoveTo(getMap():FindFirstChild("GunDrop").Position)
					LocalPlayer12.Backpack.ChildAdded:Wait()
					LocalPlayer12.Character:PivotTo(Pivot)

					return
				end

				return
			end

			return
		end
	end

	workspace.DescendantAdded:Connect(function(descendant)
		if Config.ESP.Traps and (descendant.Name == "Trap" and descendant.Parent:IsDescendantOf(workspace)) then
			descendant.Transparency = 0

			local clone = trapESP:Clone()

			clone.Parent = workspace
			clone.Adornee = descendant
		end

		if Config.ESP.DroppedGun and descendant.Name == "GunDrop" then
			if not workspace:FindFirstChild("GunESP") then
				local Highlight = Instance.new("Highlight", workspace)

				Highlight.OutlineTransparency = 1
				Highlight.FillColor = Color3.fromRGB(255, 255, 0)
				Highlight.Name = "GunESP"
				Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				Highlight.Adornee = descendant
				Highlight.Enabled = true
			end

			workspace:FindFirstChild("GunESP").Adornee = descendant
			workspace:FindFirstChild("GunESP").Enabled = true

			if Config.Gameplay.AutoPickUpGun then
				task.wait(0.5)

				for _ = 1, 5 do
					pickupgun()
				end
			end
		end
	end)
	workspace.DescendantRemoving:Connect(function(descendant)
		if Config.ESP.DroppedGun and descendant.Name == "GunDrop" then
			if workspace:FindFirstChild("GunESP") then
				workspace:FindFirstChild("GunESP"):Destroy()
			end

			task.wait(0.6)

			if Config.ESP.Players then
				local v716, v717, v718 = ipairs(workspace:GetChildren())

				while true do
					local v719

					v718, v719 = v716(v717, v718)

					if v718 == nil then
						break
					end

					if v719:IsA("Highlight") then
						v719:Destroy()
					end
				end
			end

			local children = game.Players:GetChildren()
			local v721, v722, v723 = ipairs(children)

			while true do
				local v724

				v723, v724 = v721(v722, v723)

				local u725 = v724

				if v723 == nil then
					break
				end

				if u725.Character ~= nil then
					local Character = u725.Character

					if not Character:FindFirstChild("PlayerESP") then
						local Highlight = Instance.new("Highlight", workspace)

						Highlight.Name = "PlayerESP"
						Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						Highlight.Adornee = Character
						Highlight.FillColor = Color3.fromRGB(255, 255, 255)
						Highlight.FillTransparency = 0.5
						task.spawn(function()
							if u725 ~= u168() then
								if u725 ~= u169() then
									Highlight.FillColor = Color3.fromRGB(0, 255, 0)
									Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
								else
									Highlight.FillColor = Color3.fromRGB(255, 255, 0)
									Highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
								end
							else
								Highlight.FillColor = Color3.fromRGB(255, 0, 0)
								Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
							end

							if Highlight then
								if not u725 then
									return
								end

								Highlight.Adornee = u725.Character or u725.CharactedAdded:Wait()
							end
						end)
					end
				end
			end
		end
	end)

	function killme()
		LocalPlayer12.Character:BreakJoints()
	end
	function Teleport_to_lobby(_)
		LocalPlayer12.Character:MoveTo(Vector3.new(-107, 152, 41))
	end
	function Teleport_to_map(_)
		if getMap() then
			local Spawns = getMap():FindFirstChild("Spawns")

			if Spawns then
				local children = Spawns:GetChildren()
				local v732 = children[math.random(1, #children)]

				LocalPlayer12.Character:MoveTo(v732.Position)
			end
		end
	end
	function miniFling(p108)
		LocalPlayer12:GetMouse()

		local Players8 = game:GetService("Players")
		local LocalPlayer15 = Players8.LocalPlayer;

		(function(p109)
			local Character = LocalPlayer15.Character
			local _Humanoid5 = Character and Character:FindFirstChildOfClass("Humanoid")
			local _RootPart2 = _Humanoid5 and _Humanoid5.RootPart

			if not p109 then
				return
			end

			local Character5 = p109.Character
			local Humanoid = nil
			local RootPart = nil
			local Head = nil
			local Accessory = nil
			local Handle = nil

			if not Character5 then
				return
			end

			if Character5:FindFirstChildOfClass("Humanoid") then
				Humanoid = Character5:FindFirstChildOfClass("Humanoid")
			end

			if Humanoid and Humanoid.RootPart then
				RootPart = Humanoid.RootPart
			end

			if Character5:FindFirstChild("Head") then
				Head = Character5.Head
			end

			if Character5:FindFirstChildOfClass("Accessory") then
				Accessory = Character5:FindFirstChildOfClass("Accessory")
			end

			if Accessory and Accessory:FindFirstChild("Handle") then
				Handle = Accessory.Handle
			end

			if Character and _Humanoid5 and _RootPart2 then
				if _RootPart2.Velocity.Magnitude < 50 then
					getgenv().OldPos = _RootPart2.CFrame
				end

				if not Head then
					if not Head and Handle and Handle.Velocity.Magnitude > 500 then
						return
					end
				elseif Head.Velocity.Magnitude > 500 then
					return
				end

				if Head then
					workspace.CurrentCamera.CameraSubject = Head
				elseif not Head and Handle then
					workspace.CurrentCamera.CameraSubject = Handle
				elseif Humanoid and RootPart then
					workspace.CurrentCamera.CameraSubject = Humanoid
				end

				if not Character5:FindFirstChildWhichIsA("BasePart") then
					return
				end

				local function u938(p110, p111, p112)
					_RootPart2.CFrame = CFrame.new(p110.Position) * p111 * p112

					if game.Players.LocalPlayer:FindFirstChild("Character") then
						Character:SetPrimaryPartCFrame(CFrame.new(p110.Position) * p111 * p112)
						_RootPart2.Velocity = Vector3.new(90000000, 900000000, 90000000)
						_RootPart2.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
					end
				end
				local function v939(p113)
					local timestamp = tick()
					local n17 = 0

					while _RootPart2 and Humanoid do
						if p113.Velocity.Magnitude >= 50 then
							u938(p113, CFrame.new(0, 1.5, Humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, -1.5, -Humanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, 1.5, Humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, 1.5, RootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, -1.5, -RootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, 1.5, RootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
						else
							n17 = n17 + 100
							u938(p113, CFrame.new(0, 1.5, 0) + Humanoid.MoveDirection * p113.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n17), 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, -1.5, 0) + Humanoid.MoveDirection * p113.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n17), 0, 0))
							task.wait()
							u938(p113, CFrame.new(2.25, 1.5, -2.25) + Humanoid.MoveDirection * p113.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n17), 0, 0))
							task.wait()
							u938(p113, CFrame.new(-2.25, -1.5, 2.25) + Humanoid.MoveDirection * p113.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n17), 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, 1.5, 0) + Humanoid.MoveDirection, CFrame.Angles(math.rad(n17), 0, 0))
							task.wait()
							u938(p113, CFrame.new(0, -1.5, 0) + Humanoid.MoveDirection, CFrame.Angles(math.rad(n17), 0, 0))
							task.wait()
						end

						if p113.Velocity.Magnitude > 500 or p113.Parent ~= p109.Character or p109.Parent ~= Players8 or p109.Character ~= Character5 or Humanoid.Sit or _Humanoid5.Health <= 0 or tick() > timestamp + 2 then
							return
						end
					end
				end

				workspace.FallenPartsDestroyHeight = 0 / 0

				local BodyVelocity = Instance.new("BodyVelocity")

				BodyVelocity.Name = "EpixVel"
				BodyVelocity.Parent = _RootPart2
				BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
				BodyVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
				_Humanoid5:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

				if RootPart and Head then
					if not ((RootPart.CFrame.p - Head.CFrame.p).Magnitude <= 5) then
						v939(Head)
					else
						v939(RootPart)
					end
				elseif not RootPart or Head then
					if not RootPart and Head then
						v939(Head)
					elseif not RootPart and not Head and Accessory and Handle then
						v939(Handle)
					end
				else
					v939(RootPart)
				end

				BodyVelocity:Destroy()
				_Humanoid5:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
				workspace.CurrentCamera.CameraSubject = _Humanoid5

				while true do
					_RootPart2.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)

					if not game.Players.LocalPlayer:FindFirstChild("Character") then
						break
					end

					Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
					_Humanoid5:ChangeState("GettingUp")
					table.foreach(Character:GetChildren(), function(_, p115)
						if p115:IsA("BasePart") then
							local vector3_6 = Vector3.new()

							p115.RotVelocity = Vector3.new()
							p115.Velocity = vector3_6
						end
					end)
					task.wait()

					if (_RootPart2.Position - getgenv().OldPos.p).Magnitude < 25 then
						workspace.FallenPartsDestroyHeight = getgenv().FPDH
					end
				end

				return
			end
		end)(({ p108 })[1])
		workspace.FallenPartsDestroyHeight = -50000
	end

	task.spawn(function()
		while task.wait() do
			if Config.AnnoyingStuff.Fling.LoopFlingAllPlayers then
				local v736, v737, v738 = ipairs(game.Players:GetPlayers())

				while true do
					local v739

					v738, v739 = v736(v737, v738)

					local u740 = v739

					if v738 == nil then
						break
					end

					if u740 ~= LocalPlayer12 then
						pcall(function()
							miniFling(u740)
						end)
					end
				end
			end
		end
	end)

	function ServerHop()
		local t31 = {}
		local v742 = request({
			Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)
		})
		local data = game:GetService("HttpService"):JSONDecode(v742.Body)

		if data and data.data then
			local _next = next
			local data2 = data.data
			local v746 = nil

			while true do
				local v747

				v746, v747 = _next(data2, v746)

				if v746 == nil then
					break
				end

				if type(v747) == "table" and tonumber(v747.playing) and tonumber(v747.maxPlayers) and v747.playing < v747.maxPlayers and v747.id ~= game.JobId then
					table.insert(t31, 1, v747.id)
				end
			end
		end

		if #t31 > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, t31[math.random(1, #t31)], game:GetService("Players").LocalPlayer)
		end
	end

	game:GetService("Players").PlayerRemoving:Connect(function(_)
		if Config.AutoFarm.AutoTeleportToRandomServerIfServerIsEmpty and #game.Players:GetPlayers() < Config.AutoFarm.PlayersToAutoServerHop then
			ServerHop()
		end
	end)
	task.spawn(function()
		while task.wait(30) do
			if Config.AutoFarm.AutoPrestige then
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inventory"):WaitForChild("Prestige"):FireServer()
			end
		end
	end)

	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "CenteredLabelGui"
	ScreenGui.Parent = game:GetService("CoreGui")
	TextLabel = Instance.new("TextLabel")
	TextLabel.Name = "CenteredTextLabel"
	TextLabel.Visible = false
	TextLabel.Text = ""
	TextLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.TextSize = 48
	TextLabel.Parent = ScreenGui
end

startTime = tick()
totalCoinsCollected = 0
CoinCollected.OnClientEvent:Connect(function(_, p118, p119, _)
	totalCoinsCollected = totalCoinsCollected + 1
	RNcoins = p118
	MAXcoins = p119

	if p118 == p119 then
		if Config.AutoFarm.KillEveryoneAsAMurdererAtFullBag and u168() == LocalPlayer12 then
			KillEveryoneAsAMurderer()
			task.wait(1)
		end

		if Config.AutoFarm.AutoFlingMurdererAtFullBag and u168() ~= LocalPlayer12 then
			murd = u168()

			if murd and murd ~= game.Players.LocalPlayer then
				miniFling(murd)
				task.wait(1)
			end
		end

		if not Config.AutoFarm.TeleportUnderMap then
			if Config.CoinFarm.Settings.DieAtFullBag then
				LocalPlayer12.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
			end
		else
			wait(0.1)
			TeleportUnderMap()
		end
	end
end)
task.wait(0.01)
coinsPerHour = 0
MAXcoins = 40
RNcoins = 0
RunService5.RenderStepped:Connect(function()
	game:GetService("RunService"):Set3dRenderingEnabled(not Config.CoinFarm2.Disable3DRendering)
	elapsedTime = tick() - startTime

	if totalCoinsCollected <= 0 then
		coinsPerHour = 0
	else
		coinsPerHour = math.floor(totalCoinsCollected * 3600 / elapsedTime)
	end

	TextLabel.Text = "Coins Collected: " .. RNcoins .. "/" .. MAXcoins .. "\nTotal Coins: " .. totalCoinsCollected .. "\nCoins Per Hour: " .. coinsPerHour
end)
task.spawn(function()
	while task.wait(15) do
		if Config.AutoOpenCrates.State then
			local t32 = {
				Config.AutoOpenCrates.Crate,
				Config.AutoOpenCrates.CrateType,
				"Coins"
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Shop"):WaitForChild("OpenCrate"):InvokeServer(unpack(t32))
		end
	end
end)
guns = {
	Gingerscope = {
		MeshId = "rbxassetid://15374602183",
		Offset = Vector3.zero,
		Scale = Vector3.new(0.084, 0.084, 0.084),
		TextureId = "rbxassetid://15409041564",
		VertexColor = Vector3.new(1, 1, 1),
		CFrame = CFrame.new(0.129999995, 0, 0.075000003, 1, 0, 0, 0, 0.707388222, 0.706825197, 0, -0.706825197, 0.707388222),
		Grip = CFrame.new(0, -0.400000006, 0.899999976, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Image = "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=15666596216",
		GuiColor = Color3.new(0.39215686274509803, 0.0392156862745098, 1)
	}
}
chosengun = "Gingerscope"

function equipgun(p121)
	if __EQUIPPED == false then
		return
	end

	disconect()
	ch = LocalPlayer12.Character

	repeat
		task.wait()
	until ch:FindFirstChild("HumanoidRootPart")

	local v756, v757, v758 = pairs(workspace.WeaponDisplays:GetChildren())
	local v759 = nil
	local v760 = nil

	while true do
		local v761

		v758, v761 = v756(v757, v758)

		if v758 == nil then
			break
		end

		local RigidConstraintAttachment0 = v761.RigidConstraint.Attachment0
		local RigidConstraintAttachment0_2 = v761.RigidConstraint.Attachment0

		if RigidConstraintAttachment0 == ch:FindFirstChild("GunBelt", true) then
			v759 = v761
		end

		if RigidConstraintAttachment0_2 == ch:FindFirstChild("KnifeBack", true) then
			v760 = v761
		end
	end

	task.wait(0.1)

	if not v759 or not v760 then
		return
	end

	repeat
		task.wait()
	until v759:FindFirstChild("Attachment")

	v759.Attachment.CFrame = guns[p121].CFrame

	local v764, v765, v766 = pairs(guns[p121])

	while true do
		local v767

		v766, v767 = v764(v765, v766)

		if v766 == nil then
			break
		end

		if v766 ~= "CFrame" and v766 ~= "Grip" and v766 ~= "Image" and v766 ~= "GuiColor" then
			v759.Mesh[v766] = v767
		end
	end

	backpackImageConnection = LocalPlayer12.Backpack.DescendantAdded:Connect(function(_)
		if guns[p121] then
			local v942, v943, v944 = pairs(game:GetService("CoreGui").RobloxGui.Backpack.Hotbar:GetChildren())

			while true do
				local v945

				v944, v945 = v942(v943, v944)

				if v944 == nil then
					break
				end

				if v945.Icon.Image ~= "" and u169() == LocalPlayer12 then
					v945.Icon.Image = guns[p121].Image
				end
			end
		end
	end)
	GunVisual = LocalPlayer12.Backpack.DescendantAdded:Connect(function(descendant)
		if tostring(descendant) == "Gun" then
			task.wait()
			USABLEGUN = LocalPlayer12.Backpack.Gun.Handle

			local v947, v948, v949 = pairs(guns[p121])

			while true do
				local v950

				v949, v950 = v947(v948, v949)

				if v949 == nil then
					break
				end

				if v949 ~= "CFrame" and v949 ~= "Grip" and v949 ~= "Image" and v949 ~= "GuiColor" then
					USABLEGUN.Mesh[v949] = v950
				end
			end

			USABLEGUN.Parent.Grip = guns[p121].Grip
		end
	end)
end
function disconect()
	if backpackImageConnection then
		backpackImageConnection:Disconnect()
		backpackImageConnection = nil
	end

	if GunVisual then
		GunVisual:Disconnect()
		GunVisual = nil
	end

	if autoEquipGun then
		autoEquipGun:Disconnect()
		autoEquipGun = nil
	end
end
function RevealRoles()
	local children = game:GetService("TextChatService"):WaitForChild("TextChannels"):GetChildren()
	local v769, v770, v771 = ipairs(children)

	while true do
		local v772

		v771, v772 = v769(v770, v771)

		if v771 == nil then
			break
		end

		if v772.Name ~= "RBXSystem" then
			local v773 = u168()
			local v774 = u169()
			local _Name = not v773 and "-" or v773.Name
			local _Name2 = not v774 and "-" or v774.Name

			v772:SendAsync((string.format("Murderer: %s |\r\nSheriff: %s |\r\nImmortal Hub", _Name, _Name2)))
		end
	end
end
function spawnitem()
	local v777, v778, v779 = pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Inventory.Main.Weapons.Items.Container:GetChildren())

	while true do
		local v780

		v779, v780 = v777(v778, v779)

		if v779 == nil then
			break
		end

		local v781, v782, v783 = pairs(v780:GetChildren())

		while true do
			local v784

			v783, v784 = v781(v782, v783)

			if v783 == nil then
				break
			end

			v780.ChildAdded:Connect(function(child)
				if child.Name == "NewItem" then
					child.Container.ActionButton.MouseButton1Click:Connect(function()
						disconect()
						__EQUIPPED = false
					end)
				end
			end)

			local v785, v786, v787 = pairs(v784:GetChildren())

			while true do
				local v788

				v787, v788 = v785(v786, v787)

				if v787 == nil then
					break
				end

				if v788.Name == "NewItem" then
					v788.Container.ActionButton.MouseButton1Click:Connect(function()
						disconect()
						__EQUIPPED = false
					end)
				end
			end
		end
	end

	local v789, v790, v791 = pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Inventory.Main.Weapons.Items.Container:GetChildren())

	while true do
		local v792

		v791, v792 = v789(v790, v791)

		if v791 == nil then
			break
		end

		if v792.Name == "Holiday" then
			christmas = v792.Container.Christmas
			halloween = v792.Container.Halloween
		end
	end

	local v793, v794, v795 = pairs(christmas.Container:GetChildren())

	while true do
		local v796

		v795, v796 = v793(v794, v795)

		if v795 == nil then
			break
		end

		if v796.Name == "NewItem" then
			v796.Container.ActionButton.MouseButton1Click:Connect(function()
				disconect()
				__EQUIPPED = false
			end)
		end
	end

	christmas.Container.ChildAdded:Connect(function(child)
		if child.Name == "NewItem" then
			child.Container.ActionButton.MouseButton1Click:Connect(function()
				disconect()
				__EQUIPPED = false
			end)
		end
	end)

	local v797, v798, v799 = pairs(halloween.Container:GetChildren())

	while true do
		local v800

		v799, v800 = v797(v798, v799)

		if v799 == nil then
			break
		end

		if v800.Name == "NewItem" then
			v800.Container.ActionButton.MouseButton1Click:Connect(function()
				disconect()
				__EQUIPPED = false
			end)
		end
	end

	halloween.Container.ChildAdded:Connect(function(child)
		if child.Name == "NewItem" then
			child.Container.ActionButton.MouseButton1Click:Connect(function()
				disconect()
				__EQUIPPED = false
			end)
		end
	end)
	weapons = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Inventory.Main.Weapons
	newitem = game:GetService("ReplicatedStorage").Modules.InventoryModule.NewItem:Clone()
	newitem.Name = "FakeItem"
	newitem.Parent = weapons.Items.Container.Holiday.Container.Christmas.Container
	newitem.ItemName.Label.Text = chosengun
	newitem.Tags.Evo.Visible = false
	newitem.Container.Icon.Image = guns[chosengun].Image
	newitem.Container.Amount.Text = ""
	newitem.ItemName.BackgroundColor3 = guns[chosengun].GuiColor

	function click()
		__EQUIPPED = true
		equipped = weapons.Equipped.Container.Gun.Container
		equipped.ItemName.BackgroundColor3 = guns[chosengun].GuiColor
		equipped.ItemName.Label.Text = chosengun
		equipped.Container.Icon.Image = guns[chosengun].Image
		equipgun(chosengun)
		autoEquipGun = LocalPlayer12.CharacterAdded:Connect(function()
			equipgun(chosengun)
		end)
	end

	clickconnection = newitem.Container.ActionButton.MouseButton1Click:Connect(function()
		click()
	end)

	if __EQUIPPED == true then
		task.wait()
		click()
	end
end

LocalPlayer12.CharacterAdded:Connect(function()
	if Config.VisualGun then
		spawnitem()
	end
end)
boxmodule = require(game:GetService("ReplicatedStorage").Modules.BoxModule)
itemdatabase = require(game:GetService("ReplicatedStorage").Database.Sync.Item)
task.spawn(function()
	repeat
		task.wait(0.5)
	until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MainGUI") and game:GetService("Players").LocalPlayer.PlayerGui.MainGUI:FindFirstChild("Inventory") and game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Inventory:FindFirstChild("NewItem")

	local ok, result = pcall(function()
		return getsenv(game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Inventory.NewItem)._G
	end)

	if not ok then
		warn("Failed to get poop _G:", result)
	else
		poop = result
	end
end)

function getrandombox()
	local MysteryBox = require(game:GetService("ReplicatedStorage").Database.Sync.MysteryBox)

	if MysteryBox and next(MysteryBox) ~= nil then
		local v804, v805, v806 = pairs(MysteryBox)
		local t33 = {}

		while true do
			local v808

			v806, v808 = v804(v805, v806)

			if v806 == nil then
				break
			end

			table.insert(t33, v806)
		end

		return t33[math.random(1, #t33)]
	end

	return nil
end

getgenv().spawnamount = 1

function opencrate(p123, p124)
	if p124 then
		poop.NewItem(p123, nil, nil, "Weapons", getgenv().spawnamount)
	else
		boxmodule.OpenBox(getrandombox(), p123)
		poop.NewItem(p123, nil, nil, "Weapons", 1)
	end
end
function getrawnamebyrealname(p125)
	local v812, v813, v814 = pairs(itemdatabase)

	repeat
		local v815

		v814, v815 = v812(v813, v814)

		if v814 == nil then
			return
		end
	until p125 == v814

	return v814
end
function gettable(p126)
	nikita_gay = {}

	local v817, v818, v819 = pairs(itemdatabase)

	while true do
		local v820

		v819, v820 = v817(v818, v819)

		if v819 == nil then
			break
		end

		if string.find(v819:lower(), p126:lower()) then
			table.insert(nikita_gay, v819)
		end
	end

	return nikita_gay
end

t1.AutoFarmTab:Toggle({
	Title = "Enable Auto Farm",
	Default = Config.CoinFarm2.State,
	Callback = function(p127)
		Config.CoinFarm2.State = p127
		isActive = p127

		if p127 then
			startAutoFarm()
		else
			stopAutoFarm()
		end
	end
})
t1.AutoFarmTab:Slider({
	Title = "Speed",
	Step = 1,
	Value = {
		Min = 15,
		Max = 25,
		Default = Config.CoinFarm2.Settings.Speed
	},
	Callback = function(p128)
		Config.CoinFarm2.Settings.Speed = p128
		speed = p128
		print("Speed updated to: " .. p128)

		if isActive then
			stopAutoFarm()
			startAutoFarm()
		end
	end
})
t1.AutoFarmTab:Dropdown({
	Title = "Full Bag Actions",
	Desc = "Select what should happen when your bag is full",
	Values = {
		"Reset",
		"Teleport Under Map",
		"Kill Everyone (Murderer)",
		"Fling Murderer"
	},
	Value = {},
	Multi = true,
	AllowNone = true,
	Callback = function(p129)
		Config.CoinFarm.Settings.DieAtFullBag = false
		Config.AutoFarm.TeleportUnderMap = false
		Config.AutoFarm.KillEveryoneAsAMurdererAtFullBag = false
		Config.AutoFarm.AutoFlingMurdererAtFullBag = false

		for _, v in ipairs(p129) do
			if v == "Reset" then
				Config.CoinFarm.Settings.DieAtFullBag = true
			elseif v == "Teleport Under Map" then
				Config.AutoFarm.TeleportUnderMap = true
			elseif v == "Kill Everyone (Murderer)" then
				Config.AutoFarm.KillEveryoneAsAMurdererAtFullBag = true
			elseif v == "Fling Murderer" then
				Config.AutoFarm.AutoFlingMurdererAtFullBag = true
			end
		end

		print("Full Bag Actions selected: " .. game:GetService("HttpService"):JSONEncode(p129))
	end
})
t1.Visual:Section({
	Title = "item Unboxer",
	Icon = ""
})
t1.Visual:Divider()
t1.Visual:Button({
	Title = "Spawn equippable Gingerscope",
	Callback = function(p130)
		Config.VisualGun = p130

		if p130 then
			spawnitem()
		end
	end
})
t1.Visual:Divider()

local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
local LocalPlayer16 = game:GetService("Players").LocalPlayer
local s7 = ""

local function u175()
	local ok, result = pcall(function()
		return require(ReplicatedStorage3.Database.Sync.MysteryBox)
	end)

	if not ok or not result or next(result) == nil then
		return "StandardBox"
	end

	local t34 = {}

	for k, _ in pairs(result) do
		table.insert(t34, k)
	end

	return t34[math.random(1, #t34)]
end
local function u176(p131)
	local _BoxModule = ReplicatedStorage3:FindFirstChild("Modules") and ReplicatedStorage3.Modules:FindFirstChild("BoxModule")
	local _Database = ReplicatedStorage3:FindFirstChild("Database") and (ReplicatedStorage3.Database:FindFirstChild("Sync") and ReplicatedStorage3.Database.Sync:FindFirstChild("Item"))

	if not _BoxModule or not _Database then
		return
	end

	local lib = require(_BoxModule)
	local lib2 = require(_Database)

	if p131 and lib2[p131] then
		local ok, result = pcall(function()
			lib.OpenBox(u175(), p131)
			pcall(function()
				local v969 = getsenv(LocalPlayer16.PlayerGui.MainGUI.Inventory.NewItem)

				if v969 and (v969._G and v969._G.NewItem) then
					v969._G.NewItem(p131, nil, nil, "Weapons", 1)
				end
			end)
		end)

		if not ok then
			warn("SpawnWeapon error:", result)
		end
	else
		_Raw:Notify({
			Title = "Error",
			Content = "Check your spelling. Make sure it matches the dropdown description: " .. (p131 or "Unknown"),
			Icon = "x-circle",
			Duration = 3
		})
	end
end

t1.Visual:Input({
	Title = "item unboxer",
	Desc = "example 'Harvester' not 'harvester' alwways upper case letter pls",
	Placeholder = "Harvester",
	Callback = function(p132)
		s7 = p132
	end
})
t1.Visual:Button({
	Title = "unbox item",
	Icon = "sparkles",
	Callback = function()
		if not s7 or s7 == "" then
			_Raw:Notify({
				Title = "Error",
				Content = "Please enter a weapon name",
				Icon = "x-circle",
				Duration = 3
			})
		else
			u176(s7)
		end
	end
})
t1.Visual:Divider()
t1.Visual:Button({
	Title = "Unbox Gingerscope",
	Callback = function()
		u176("Gingerscope")
	end
})
t1.Visual:Button({
	Title = "Unbox Harvester",
	Callback = function()
		u176("Harvester")
	end
})
t1.Visual:Button({
	Title = "Unbox Sweet",
	Callback = function()
		u176("Sweet")
	end
})
t1.Visual:Button({
	Title = "Unbox Treat",
	Callback = function()
		u176("Treat")
	end
})
t1.Visual:Divider()
t1.Visual:Section({
	Title = "item Spawner",
	Desc = ""
})

local function u177(p133, p134)
	local Item = require(ReplicatedStorage3.Database.Sync.Item)
	local Weapons = require(ReplicatedStorage3.Modules.ProfileData).Weapons
	local v845 = string.lower(p133)
	local v846 = nil

	for k in pairs(Item) do
		if v845 == string.lower(k) then
			v846 = k

			break
		end
	end

	if v846 then
		if not Weapons.Owned then
			Weapons.Owned = {}
		end

		Weapons.Owned[v846] = (Weapons.Owned[v846] or 0) + p134
		t14.RunService:BindToRenderStep("InventoryUpdate", Enum.RenderPriority.Last.Value + 1, function()
		end)
		LocalPlayer16.Character:BreakJoints()

		return
	end

	_Raw:Notify({
		Title = p133 .. " misspeled?",
		Content = "hi '" .. p133 .. "'isnt  a real item",
		Duration = 2
	})
end

local u178 = nil
local n18 = 1

t1.Visual:Input({
	Title = "Weapon Name",
	Placeholder = "Harvester",
	Compact = true,
	Callback = function(p135)
		if p135 and p135 ~= "" then
			u178 = p135
		end
	end
})
t1.Visual:Input({
	Title = "Amount",
	Placeholder = " 5",
	Compact = true,
	Callback = function(p136)
		local num = tonumber(p136)

		if not num or not (num > 0) then
			n18 = 1
		else
			n18 = math.floor(num)
		end
	end
})
t1.Visual:Button({
	Title = "Spawn Weapon",
	Callback = function()
		if not u178 or u178 == "" then
			_Raw:Notify({
				Title = "empty",
				Content = "empty",
				Duration = 2
			})
		else
			u177(u178, n18)
		end
	end
})
t1.MainTab:Divider()

local Players9 = game:GetService("Players")
local LocalPlayer17 = Players9.LocalPlayer
local u182 = nil
local u183 = false

local function u184(p137)
	if p137 and p137.Character then
		local HumanoidRootPart = p137.Character:FindFirstChild("HumanoidRootPart")
		local Character = LocalPlayer17.Character
		local _HumanoidRootPart5 = Character and Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart and _HumanoidRootPart5 then
			_HumanoidRootPart5.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
		end

		return
	end
end

local u185 = t1.TeleportTab:Dropdown({
	Title = "Select Player to TP",
	Values = {},
	Value = nil,
	Multi = false,
	AllowNone = true,
	Callback = function(p138)
		u182 = Players9:FindFirstChild(p138) or nil
	end
})

local function v186()
	local t35 = {}

	for _, player in ipairs(Players9:GetPlayers()) do
		if player ~= LocalPlayer17 then
			table.insert(t35, player.Name)
		end
	end

	u185:Refresh(t35)
end

v186()
Players9.PlayerAdded:Connect(v186)
Players9.PlayerRemoving:Connect(v186)
t1.TeleportTab:Button({
	Title = "Teleport to person",
	Callback = function()
		if u182 then
			u184(u182)
		end
	end
})
t1.TeleportTab:Button({
	Title = "TP to Random Player",
	Callback = function()
		local t36 = {}

		for _, player in ipairs(Players9:GetPlayers()) do
			if player ~= LocalPlayer17 then
				table.insert(t36, player)
			end
		end

		if #t36 > 0 then
			local v862 = t36[math.random(1, #t36)]

			u184(v862)
		end
	end
})
t1.TeleportTab:Toggle({
	Title = "Loop TP to Selected",
	Default = false,
	Callback = function(p139)
		u183 = p139

		if p139 then
			task.spawn(function()
				while u183 do
					if u182 then
						u184(u182)
					end

					task.wait(0.2)
				end
			end)
		end
	end
})
t1.MainTab:Button({
	Title = "End round",
	Callback = function()
		if u135 then
			return
		end

		t21 = {}

		for _, player in ipairs(Players9:GetPlayers()) do
			if player ~= LocalPlayer11 and u141(player) == "Murderer" then
				t21[player.Name] = player
			end
		end

		u137()

		if next(t21) then
			u135 = true
			task.spawn(function()
				for _, v in pairs(t21) do
					if v and v.Parent then
						u140(v)
						task.wait(0.5)
					end
				end

				u135 = false
				u137()
			end)
		end
	end
})