local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title = "TSUM Baobab", 
    Footer = "Key System",
    Icon = 107813943015659,
    NotifySide = "Right",
    CornerRadius = 12,
    ShowCustomCursor = true,
    Size = UDim2.new(0, 680, 0, 440),
})

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        Library:Toggle()
    end
end)

local Tabs = {
	Key = Window:AddKeyTab("Key System", "key"),
	Main = Window:AddTab("Main", "user"), 
    Movement = Window:AddTab("Movement", "zap"),
    Visual = Window:AddTab("Visual", "eye"),
    Misc = Window:AddTab("Misc", "list"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local CORRECT_KEY = "67"
local DISCORD_LINK = "https://discord.gg/5SywvQgMy"

Tabs.Main:SetVisible(false)
Tabs.Movement:SetVisible(false)
Tabs.Visual:SetVisible(false)
Tabs.Misc:SetVisible(false)
Tabs["UI Settings"]:SetVisible(false)

Tabs.Key:AddLabel({ Text = "TSUM Baobab", DoesWrap = true, Size = 20 })
Tabs.Key:AddLabel({ Text = "Взять ключ в нашем Discord сервере:", DoesWrap = true, Size = 14 })

Tabs.Key:AddButton({
    Text = "Скопировать Discord (" .. DISCORD_LINK .. ")",
    Func = function()
        if setclipboard then setclipboard(DISCORD_LINK)
        elseif syn and syn.write_clipboard then syn.write_clipboard(DISCORD_LINK)
        elseif Clipboard and Clipboard.set then Clipboard.set(DISCORD_LINK)
        end
        Library:Notify({ Title = "Discord", Description = "Ссылка скопирована в буфер обмена!", Time = 3 })
    end
})

Tabs.Key:AddLabel({ Text = "скрипт абсолютно бесплатный просто скопируйте его в дискорд канале", DoesWrap = true, Size = 12 })
Tabs.Key:AddDivider()

Tabs.Key:AddKeyBox(function(ReceivedKey)
	if ReceivedKey == CORRECT_KEY then
		Library:Notify({ Title = "Успешно", Description = "Ключ правильный!", Time = 5 })
		Tabs.Main:SetVisible(true)
		Tabs.Movement:SetVisible(true)
		Tabs.Visual:SetVisible(true)
		Tabs.Misc:SetVisible(true)
		Tabs["UI Settings"]:SetVisible(true)
		Tabs.Key:SetVisible(false)
		Tabs.Main:Select()
		task.wait(0.1)
		pcall(function() Window.Holder.Size = UDim2.new(0, 680, 0, 520) end)
	else
		Library:Notify({ Title = "Ошибка", Description = "Неверный ключ", Time = 4 })
	end
end)

---------------------------------------------------------
-- ПЕРЕМЕННЫЕ
---------------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local RS = game:GetService("ReplicatedStorage")
local VIM = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local MIN_PRICE = 20000
local ESP_ENABLED = false
local ESP_RANGE = 150
local USE_MIN_PRICE = true
local INF_JUMP_ENABLED = false
local TRANSPARENT_GLASS_ENABLED = false
local TIME_CHANGER_ENABLED = false
local SPEED_ENABLED = false
local CURRENT_TIME = 14
local CURRENT_SPEED = 16

local MONEY_SPOOF_ENABLED = false
local SPOOFED_MONEY_AMOUNT = 1000

local NICK_ENABLED = false
local customNickname = ""
local originalNameText = nil
local originalNamePos = nil
local pinIconsContainer = nil

-- DROP ESP SETTINGS
local DROP_ESP_ENABLED = false
local DROP_ESP_RANGE = 400
local AUTO_LOOT_ENABLED = false
local LOOT_RADIUS = 30

local PIN_TYPES = {
    Developer = "rbxassetid://10885640682",
    YouTube = "rbxassetid://1275974017",
    TikTok = "rbxassetid://137014429261024",
    Moderator = "rbxassetid://9209424449",
    Verify = "rbxassetid://138018675655074",
    Star = "rbxassetid://11419703997",
    VIP = "rbxassetid://6031097225",
    Admin = "rbxassetid://7072707198",
    Owner = "rbxassetid://6031094678"
}

local SELECTED_PINS = {}

local AUTO_SELL_ENABLED = false
local AUTO_SELL_INTERVAL = 5
local lastSellTime = 0

local ESP_SHOW_PRICE = true
local ESP_SHOW_DISTANCE = true
local ESP_SHOW_RARITY = true
local ESP_SHOW_NAME = true

local SEARCH_BY_NAME = false
local SEARCH_NAME_QUERY = ""

local RARITY_FILTERS = {
    Common = true, Uncommon = true, Rare = true,
    Epic = true, Legendary = true, Mythic = true, Exclusive = true
}

local ECONOMY_FILTERS = {
    jackpot = true, normal = true, trap = true, risky = true
}

local MeshMap = {}
local NameMap = {}
local CachedItems = {}
local DBReady = false
local ESPReady = false
local RemovedGlassObjects = {}
local OriginalSky = nil
local CurrentSkybox = nil

local SkyboxAssets = {
    ["Classic"] = nil,
    ["Black Storm"] = {
        Bk = "rbxassetid://15502511288", Dn = "rbxassetid://15502508460",
        Ft = "rbxassetid://15502510289", Lf = "rbxassetid://15502507918",
        Rt = "rbxassetid://15502509398", Up = "rbxassetid://15502511911"
    },
    ["HD"] = {
        Bk = "http://www.roblox.com/asset/?id=16553658937", Dn = "http://www.roblox.com/asset/?id=16553660713",
        Ft = "http://www.roblox.com/asset/?id=16553662144", Lf = "http://www.roblox.com/asset/?id=16553664042",
        Rt = "http://www.roblox.com/asset/?id=16553665766", Up = "http://www.roblox.com/asset/?id=16553667750"
    },
    ["Snow"] = {
        Bk = "http://www.roblox.com/asset/?id=155657655", Dn = "http://www.roblox.com/asset/?id=155674246",
        Ft = "http://www.roblox.com/asset/?id=155657609", Lf = "http://www.roblox.com/asset/?id=155657671",
        Rt = "http://www.roblox.com/asset/?id=155657619", Up = "http://www.roblox.com/asset/?id=155674931"
    },
    ["Blue Space"] = {
        Bk = "rbxassetid://15536110634", Dn = "rbxassetid://15536112543",
        Ft = "rbxassetid://15536116141", Lf = "rbxassetid://15536114370",
        Rt = "rbxassetid://15536118762", Up = "rbxassetid://15536117282"
    },
    ["Realistic"] = {
        Bk = "rbxassetid://653719502", Dn = "rbxassetid://653718790",
        Ft = "rbxassetid://653719067", Lf = "rbxassetid://653719190",
        Rt = "rbxassetid://653718931", Up = "rbxassetid://653719321"
    },
}

local espScreenGui = Instance.new("ScreenGui")
espScreenGui.Name = "TsumESP_Labels"
espScreenGui.ResetOnSpawn = false
espScreenGui.IgnoreGuiInset = true
espScreenGui.Parent = player:WaitForChild("PlayerGui")

local hlFolder = Instance.new("Folder")
hlFolder.Name = "TsumHL"
hlFolder.Parent = workspace
local HighlightPool = {}
for i = 1, 31 do
    local hl = Instance.new("Highlight")
    hl.Enabled = false
    hl.Parent = hlFolder
    table.insert(HighlightPool, hl)
end

local C = {
    textDim = Color3.fromRGB(130, 130, 140),
    text = Color3.fromRGB(240, 240, 245),
    accent = Color3.fromRGB(80, 200, 100),
    blue = Color3.fromRGB(80, 160, 255),
    purple = Color3.fromRGB(160, 80, 255),
    yellow = Color3.fromRGB(255, 205, 55),
}

---------------------------------------------------------
-- НИКНЕЙМ И ПИНЫ
---------------------------------------------------------
local function getNameTag()
    local pg = player:FindFirstChild("PlayerGui")
    if not pg then return nil, nil end
    local bb = pg:FindFirstChild("LocalResellerNameTag")
    if not bb then return nil, nil end
    local nameLbl = bb:FindFirstChild("NameText", true)
    return bb, nameLbl
end

local function applyNickname()
    local bb, nameLbl = getNameTag()
    if not bb or not nameLbl then return end
    if originalNameText == nil then originalNameText = nameLbl.Text end
    if originalNamePos == nil then originalNamePos = nameLbl.Position end
    
    local displayName = (customNickname ~= "" and NICK_ENABLED) and customNickname or originalNameText
    nameLbl.Text = displayName
    nameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    local container = nameLbl.Parent
    
    local hasAnyPin = false
    for _, enabled in pairs(SELECTED_PINS) do
        if enabled then hasAnyPin = true break end
    end
    
    if hasAnyPin then
        if not pinIconsContainer or not pinIconsContainer.Parent then
            local iconFrame = Instance.new("Frame")
            iconFrame.Name = "TsumPinsContainer"
            iconFrame.BackgroundTransparency = 1
            iconFrame.ZIndex = (nameLbl.ZIndex or 1) + 1
            iconFrame.Parent = container
            pinIconsContainer = iconFrame
            
            local layout = Instance.new("UIListLayout")
            layout.FillDirection = Enum.FillDirection.Horizontal
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            layout.VerticalAlignment = Enum.VerticalAlignment.Center
            layout.Padding = UDim.new(0, 3)
            layout.Parent = iconFrame
        end
        
        for _, child in ipairs(pinIconsContainer:GetChildren()) do
            if child:IsA("ImageLabel") then child:Destroy() end
        end
        
        local selectedCount = 0
        for _, enabled in pairs(SELECTED_PINS) do if enabled then selectedCount = selectedCount + 1 end end
        
        local iconOrder = {"Developer","YouTube","TikTok","Moderator","Verify","Star","VIP","Admin","Owner"}
        for _, pinName in ipairs(iconOrder) do
            if SELECTED_PINS[pinName] then
                local img = Instance.new("ImageLabel")
                img.Name = "Pin_" .. pinName
                img.BackgroundTransparency = 1
                img.ScaleType = Enum.ScaleType.Fit
                img.Image = PIN_TYPES[pinName]
                img.Size = UDim2.new(0, 18, 0, 18)
                img.ZIndex = (nameLbl.ZIndex or 1) + 1
                img.Parent = pinIconsContainer
            end
        end
        
        local frameWidth = (selectedCount * 18) + ((selectedCount - 1) * 3)
        pinIconsContainer.Size = UDim2.fromOffset(frameWidth, 18)
        pinIconsContainer.Position = UDim2.new(originalNamePos.X.Scale, originalNamePos.X.Offset, originalNamePos.Y.Scale, originalNamePos.Y.Offset - 22)
        pinIconsContainer.Visible = true
        
        nameLbl.Position = originalNamePos
    else
        if pinIconsContainer then 
            pinIconsContainer.Visible = false 
        end
        nameLbl.Position = originalNamePos
    end
end

local function revertNickname()
    local bb, nameLbl = getNameTag()
    if nameLbl and originalNameText ~= nil then
        nameLbl.Text = originalNameText
        nameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
    if nameLbl and originalNamePos ~= nil then nameLbl.Position = originalNamePos end
    if pinIconsContainer then pinIconsContainer.Visible = false end
end

---------------------------------------------------------
-- MONEY SPOOF
---------------------------------------------------------
local function applyMoneySpoof()
    pcall(function()
        if MONEY_SPOOF_ENABLED then
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats then
                local money = leaderstats:FindFirstChild("Money")
                if money then money.Value = SPOOFED_MONEY_AMOUNT end
            end
        end
    end)
end

---------------------------------------------------------
-- TELEPORT
---------------------------------------------------------
local function teleportToRandomServer()
    pcall(function()
        local placeId = game.PlaceId
        local servers = {}
        Library:Notify({ Title = "Телепорт", Description = "Поиск серверов...", Time = 3 })
        local success, result = pcall(function()
            return game:GetService("HttpService"):JSONDecode(
                game:HttpGet(string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", placeId))
            )
        end)
        if success and result and result.data then
            for _, server in ipairs(result.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    table.insert(servers, server.id)
                end
            end
            if #servers > 0 then
                local randomServer = servers[math.random(1, #servers)]
                Library:Notify({ Title = "Телепорт", Description = "Телепортация на случайный сервер...", Time = 2 })
                TeleportService:TeleportToPlaceInstance(placeId, randomServer, player)
            else
                Library:Notify({ Title = "Ошибка", Description = "Не найдено доступных серверов!", Time = 4 })
            end
        else
            Library:Notify({ Title = "Ошибка", Description = "Не удалось получить список серверов!", Time = 4 })
        end
    end)
end

---------------------------------------------------------
-- ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ
---------------------------------------------------------
local function safeHttpGet(url)
    local success, result = pcall(function() return game:HttpGet(url) end)
    if success and result then return result end
    return nil
end

local function getTypeColor(economyProfile)
    if economyProfile == "jackpot" then return "#FFD700"
    elseif economyProfile == "normal" then return "#00FF88"
    elseif economyProfile == "trap" then return "#FF6B35"
    elseif economyProfile == "risky" then return "#FF4444"
    else return "#AAAAAA" end
end

local function fmtPrice(price, spawnChance, economyProfile)
    local priceStr = tostring(math.floor(price)):reverse():gsub("(%d%d%d)", "%1 "):reverse():gsub("^ ", "")
    local typeStr = ""
    if economyProfile then
        if economyProfile == "jackpot" then
            typeStr = '\n<font size="11" color="#FFD700">🌟JACKPOT🎰</font>'
        else
            local color = getTypeColor(economyProfile)
            typeStr = '\n<font size="11" color="' .. color .. '">[' .. string.upper(economyProfile) .. ']</font>'
        end
    end
    if spawnChance then
        return '<font size="13"><b>$' .. priceStr .. '</b></font>\n<font size="10" color="#FFD700">Шанс: ' .. spawnChance .. '%</font>' .. typeStr
    end
    return '<font size="13"><b>$' .. priceStr .. '</b></font>' .. typeStr
end

local function pColor(rarity)
    local cols = {
        Common = Color3.fromRGB(211, 211, 211),
        Uncommon = Color3.fromRGB(0, 255, 0),
        Rare = Color3.fromRGB(0, 100, 255),
        Epic = Color3.fromRGB(150, 0, 255),
        Legendary = Color3.fromRGB(255, 150, 0),
        Mythic = Color3.fromRGB(255, 0, 0),
        Exclusive = Color3.fromRGB(255, 215, 0),
    }
    return cols[rarity] or C.text
end

local function getObjPosition(obj, posType)
    if posType == 1 then return obj.Position
    elseif posType == 2 then
        local pp = obj.PrimaryPart
        return pp and pp.Position or nil
    elseif posType == 3 then
        local success, result = pcall(function() return obj:GetPivot().Position end)
        return success and result or nil
    end
    return nil
end

local function applySkybox(skyboxName)
    local skybox = SkyboxAssets[skyboxName]
    if skyboxName == "Classic" then
        if CurrentSkybox then CurrentSkybox:Destroy(); CurrentSkybox = nil end
        if OriginalSky and OriginalSky.Parent == nil then OriginalSky.Parent = Lighting end
        return
    end
    if not skybox then return end
    if OriginalSky == nil then
        OriginalSky = Lighting:FindFirstChildOfClass("Sky")
        if OriginalSky then OriginalSky.Parent = nil end
    else
        OriginalSky.Parent = nil
    end
    if CurrentSkybox then CurrentSkybox:Destroy() end
    CurrentSkybox = Instance.new("Sky")
    CurrentSkybox.Name = "TsumSkybox"
    CurrentSkybox.SkyboxBk = skybox.Bk
    CurrentSkybox.SkyboxDn = skybox.Dn
    CurrentSkybox.SkyboxFt = skybox.Ft
    CurrentSkybox.SkyboxLf = skybox.Lf
    CurrentSkybox.SkyboxRt = skybox.Rt
    CurrentSkybox.SkyboxUp = skybox.Up
    CurrentSkybox.Parent = Lighting
end

local function sellAll()
    pcall(function()
        local BR = RS:WaitForChild("BarigaRemotes", 5)
        if not BR then
            Library:Notify({ Title = "Auto Sell", Description = "Не найден BarigaRemotes!", Time = 3 })
            return
        end
        local inv = BR.GetBarigaInventory:InvokeServer()
        if not inv or #inv == 0 then
            Library:Notify({ Title = "Auto Sell", Description = "У тебя нет предметов для продажи!", Time = 3 })
            return
        end
        local sellableItems = {}
        for _, item in ipairs(inv) do
            if item.uid and item.purchaseSource ~= "BERO" then
                table.insert(sellableItems, item.uid)
            end
        end
        if #sellableItems == 0 then
            Library:Notify({ Title = "Auto Sell", Description = "У тебя нет предметов для продажи!", Time = 3 })
            return
        end
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local npc = nil
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Model") and (v.Name:lower():find("bariga") or v.Name:lower():find("trader")) then
                npc = v
                break
            end
        end
        if npc then
            local npcPart = npc.PrimaryPart or npc:FindFirstChildWhichIsA("BasePart")
            if not npcPart then return end
            local npcPos = npcPart.Position
            camera.CameraType = Enum.CameraType.Scriptable
            camera.CFrame = CFrame.lookAt(camera.CFrame.Position, npcPos + Vector3.new(0, 1.5, 0))
            task.wait(0.05)
            camera.CameraType = Enum.CameraType.Custom
            hrp.CFrame = CFrame.lookAt(npcPos + (npcPart.CFrame.LookVector * 2.8), npcPos)
            local p = npc:FindFirstChildWhichIsA("ProximityPrompt", true)
            if p then
                p.HoldDuration = 0
                for i = 1, 3 do
                    p:InputHoldBegin()
                    task.wait(0.05)
                    p:InputHoldEnd()
                    task.wait(0.05)
                end
            end
        end
        task.wait(0.4)
        local off = BR.GetBarigaOffer:InvokeServer(sellableItems)
        if off and off.success then
            BR.ConfirmBarigaSale:FireServer(true)
            Library:Notify({ Title = "Auto Sell", Description = "Предметы успешно проданы!", Time = 3 })
        end
        task.wait(0.2)
        local x, y = camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2
        for i = 1, 3 do
            VIM:SendMouseButtonEvent(x, y, 0, true, game, 1)
            task.wait(0.05)
            VIM:SendMouseButtonEvent(x, y, 0, false, game, 1)
            task.wait(0.1)
        end
    end)
end

local function FetchDatabases()
    local MAIN_DB_URL = "https://raw.githubusercontent.com/awaky1337/base/refs/heads/main/database.lua"
    local mainRaw = safeHttpGet(MAIN_DB_URL)
    local db = {Items = {Shirt = {}, Pants = {}}}
    if mainRaw then
        local success, func = pcall(loadstring, mainRaw)
        if success and type(func) == "function" then
            local success2, result = pcall(func)
            if success2 and type(result) == "table" and type(result.Items) == "table" then
                db = result
            end
        end
    end
    local ACCS_URL = "https://raw.githubusercontent.com/awaky1337/base/refs/heads/main/accs_db"
    local accsRaw = safeHttpGet(ACCS_URL)
    local accessories = {}
    if accsRaw then
        accsRaw = string.gsub(accsRaw, '\\"', '"')
        local codeStr = "return {" .. accsRaw .. "}"
        local success, func = pcall(loadstring, codeStr)
        if success and type(func) == "function" then
            local success2, result = pcall(func)
            if success2 and type(result) == "table" and type(result.Accessory) == "table" then
                accessories = result.Accessory
            end
        end
    end
    for _, item in ipairs(accessories) do
        if item.meshId and item.meshId ~= "" then
            local mId = item.meshId:lower():gsub("\\", "")
            if not MeshMap[mId] then MeshMap[mId] = {} end
            table.insert(MeshMap[mId], item)
        else
            NameMap[item.name:lower()] = item
        end
        if not item.spawnChance then item.spawnChance = 18 end
        if not item.economyProfile then item.economyProfile = "normal" end
        if not item.rarity then item.rarity = "Common" end
    end
    for _, category in ipairs({"Shirt", "Pants"}) do
        if db.Items[category] then
            for _, item in ipairs(db.Items[category]) do
                item.accessoryType = category
                local added = false
                for _, key in ipairs({"meshId", "templateId", "textureId"}) do
                    if item[key] and item[key] ~= "" then
                        local kId = item[key]:lower():gsub("\\", "")
                        if not MeshMap[kId] then MeshMap[kId] = {} end
                        table.insert(MeshMap[kId], item)
                        added = true
                    end
                end
                if not added then NameMap[item.name:lower()] = item end
                if not item.spawnChance then item.spawnChance = 18 end
                if not item.economyProfile then item.economyProfile = "normal" end
                if not item.rarity then item.rarity = "Common" end
            end
        end
    end
end

---------------------------------------------------------
-- CACHE
---------------------------------------------------------
local function AddItemToCache(obj)
    pcall(function()
        if not obj then return end

        local droppedFolder = workspace:FindFirstChild("DroppedItems")
        local isInDropped = false
        local inShopZone = false

        local ancestor = obj
        while ancestor and ancestor ~= workspace and ancestor ~= game do
            if ancestor:IsA("Model") and Players:GetPlayerFromCharacter(ancestor) then return end
            if droppedFolder and ancestor == droppedFolder then isInDropped = true end
            if string.find(ancestor.Name, "Shop_ShopZone_") == 1 then inShopZone = true end
            ancestor = ancestor.Parent
        end

        if not isInDropped and not inShopZone then return end

        local possibleIds = {}
        local function addId(inst)
            if inst:IsA("MeshPart") or inst:IsA("SpecialMesh") then
                if inst.MeshId ~= "" then table.insert(possibleIds, inst.MeshId:lower()) end
            elseif inst:IsA("Shirt") then
                if inst.ShirtTemplate ~= "" then table.insert(possibleIds, inst.ShirtTemplate:lower()) end
            elseif inst:IsA("Pants") then
                if inst.PantsTemplate ~= "" then table.insert(possibleIds, inst.PantsTemplate:lower()) end
            elseif inst:IsA("Decal") then
                if inst.Texture ~= "" then table.insert(possibleIds, inst.Texture:lower()) end
            end
        end

        if obj:IsA("Model") then
            for _, child in ipairs(obj:GetDescendants()) do addId(child) end
        else addId(obj) end

        local detectedItem = nil
        for _, rawId in ipairs(possibleIds) do
            local mId = rawId:gsub("\\", "")
            local numberMatch = string.match(mId, "%d+")
            for key, items in pairs(MeshMap) do
                if key == mId or string.match(key, "%d+") == numberMatch then
                    if #items == 1 then
                        detectedItem = items[1]
                    else
                        local objName = obj.Name:lower()
                        local parentName = obj.Parent and obj.Parent.Name:lower() or ""
                        for _, item in ipairs(items) do
                            local iName = item.name:lower()
                            if objName == iName or parentName == iName or string.find(parentName, iName, 1, true) then
                                detectedItem = item
                                break
                            end
                        end
                        if not detectedItem then detectedItem = items[1] end
                    end
                    break
                end
            end
            if detectedItem then break end
        end

        if not detectedItem then
            local n = obj.Name:lower()
            if NameMap[n] then detectedItem = NameMap[n] end
        end

        if not detectedItem then return end

        local posType = 0
        local position = nil
        if obj:IsA("BasePart") then
            posType = 1
            position = obj.Position
        elseif obj:IsA("Model") then
            if obj.PrimaryPart then
                posType = 2
                position = obj.PrimaryPart.Position
            else
                posType = 3
                local success, result = pcall(function() return obj:GetPivot().Position end)
                if success then position = result end
            end
        end
        if not position then return end

        for _, cData in pairs(CachedItems) do
            if cData.Data and cData.Data.name == detectedItem.name and cData.Position then
                if (cData.Position - position).Magnitude < 5 then return end
            end
        end

        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.TextColor3 = Color3.new(1, 1, 1)
        label.RichText = true
        label.AnchorPoint = Vector2.new(0.5, 1)
        label.AutomaticSize = Enum.AutomaticSize.XY
        label.Visible = false
        label.Parent = espScreenGui

        local labelStroke = Instance.new("UIStroke")
        labelStroke.Thickness = 1
        labelStroke.Parent = label

        local gradient = Instance.new("UIGradient")
        gradient.Rotation = 0
        gradient.Parent = label

        local targetMesh = obj
        local mannequin = nil
        if obj.Name == "Mannequin" then mannequin = obj
        elseif obj:FindFirstChild("Mannequin") then mannequin = obj:FindFirstChild("Mannequin")
        elseif obj.Parent and obj.Parent:FindFirstChild("Mannequin") then mannequin = obj.Parent:FindFirstChild("Mannequin")
        end
        if mannequin then
            targetMesh = mannequin
        elseif obj:IsA("Model") then
            for _, child in ipairs(obj:GetDescendants()) do
                if child:IsA("MeshPart") or (child:IsA("Part") and child:FindFirstChildOfClass("SpecialMesh")) then
                    targetMesh = child
                    break
                end
            end
            if targetMesh == obj and obj.PrimaryPart then targetMesh = obj.PrimaryPart end
        end

        CachedItems[obj] = {
            Data = detectedItem,
            Label = label,
            Gradient = gradient,
            TargetMesh = targetMesh,
            PosType = posType,
            Position = position,
            IsDropped = isInDropped,
        }
    end)
end

local function RemoveItemFromCache(obj)
    pcall(function()
        if CachedItems[obj] then
            CachedItems[obj].Label:Destroy()
            CachedItems[obj] = nil
        end
    end)
end

local function getHRP()
    local char = player.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function enableTransparentGlass()
    RemovedGlassObjects = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        pcall(function()
            if obj:IsA("BasePart") and obj.Name == "Part" then
                if obj.Material == Enum.Material.Plastic then
                    local color = obj.Color
                    if math.floor(color.R * 255) == 241 and
                       math.floor(color.G * 255) == 241 and
                       math.floor(color.B * 255) == 241 then
                        table.insert(RemovedGlassObjects, { Object = obj, Parent = obj.Parent, Transparency = obj.Transparency })
                        obj.Parent = nil
                    end
                end
            elseif obj:IsA("Decal") then
                if obj.Texture == "rbxassetid://110024542255576" then
                    table.insert(RemovedGlassObjects, { Object = obj, Parent = obj.Parent })
                    obj.Parent = nil
                end
            end
        end)
    end
end

local function disableTransparentGlass()
    for _, data in ipairs(RemovedGlassObjects) do
        pcall(function()
            if data.Object and data.Parent then
                data.Object.Parent = data.Parent
                if data.Transparency then data.Object.Transparency = data.Transparency end
            end
        end)
    end
    RemovedGlassObjects = {}
end

---------------------------------------------------------
-- AUTO LOOT
---------------------------------------------------------
task.spawn(function()
    while task.wait(0.3) do
        pcall(function()
            if AUTO_LOOT_ENABLED then
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, p in ipairs(workspace:GetDescendants()) do
                        if p:IsA("ProximityPrompt") and p.Enabled and p.Parent:IsA("BasePart") then
                            if (hrp.Position - p.Parent.Position).Magnitude <= LOOT_RADIUS then
                                p:InputHoldBegin()
                                task.wait(p.HoldDuration + 0.05)
                                p:InputHoldEnd()
                            end
                        end
                    end
                end
            end
        end)
    end
end)

---------------------------------------------------------
-- ИНИЦИАЛИЗАЦИЯ
---------------------------------------------------------
task.spawn(function()
    FetchDatabases()
    DBReady = true

    workspace.DescendantAdded:Connect(function(obj)
        task.spawn(function() AddItemToCache(obj) end)
    end)

    workspace.DescendantRemoving:Connect(function(obj)
        task.spawn(function() RemoveItemFromCache(obj) end)
    end)

    local toScan = {}
    for _, child in ipairs(workspace:GetChildren()) do
        if child.Name == "DroppedItems" or string.find(child.Name, "Shop_ShopZone_") == 1 then
            table.insert(toScan, child)
            for _, desc in ipairs(child:GetDescendants()) do
                table.insert(toScan, desc)
            end
        end
    end
    for i, obj in ipairs(toScan) do
        AddItemToCache(obj)
        if i % 50 == 0 then task.wait() end
    end

    ESPReady = true
end)

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if AUTO_SELL_ENABLED then
                local currentTime = tick()
                if currentTime - lastSellTime >= AUTO_SELL_INTERVAL then
                    lastSellTime = currentTime
                    sellAll()
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if MONEY_SPOOF_ENABLED then applyMoneySpoof() end
        end)
    end
end)

player.CharacterAdded:Connect(function(char)
    originalNameText = nil
    originalNamePos = nil
    if pinIconsContainer then pinIconsContainer:Destroy(); pinIconsContainer = nil end
    if NICK_ENABLED then
        task.wait(2)
        applyNickname()
    end
end)

task.spawn(function()
    while true do
        task.wait(0.05)
        pcall(function()
            if NICK_ENABLED then
                local bb, nameLbl = getNameTag()
                if nameLbl and originalNamePos then
                    local want = (customNickname ~= "") and customNickname or originalNameText
                    if want and nameLbl.Text ~= want then nameLbl.Text = want end
                    if nameLbl.Position ~= originalNamePos then nameLbl.Position = originalNamePos end
                end
            end
            
            local hasAnyPin = false
            for _, enabled in pairs(SELECTED_PINS) do
                if enabled then hasAnyPin = true break end
            end
            
            if hasAnyPin then
                if not pinIconsContainer or not pinIconsContainer.Parent then applyNickname() end
                if pinIconsContainer and not pinIconsContainer.Visible then pinIconsContainer.Visible = true end
            end
        end)
    end
end)

---------------------------------------------------------
-- ESP LOOP
---------------------------------------------------------
RunService.RenderStepped:Connect(function()
    pcall(function()
        if TIME_CHANGER_ENABLED then Lighting.ClockTime = CURRENT_TIME end
        if SPEED_ENABLED then
            local char = player.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then hum.WalkSpeed = CURRENT_SPEED end
            end
        end

        if not ESP_ENABLED or not ESPReady then
            for _, hl in ipairs(HighlightPool) do hl.Enabled = false end
            for _, data in pairs(CachedItems) do
                if data.Label then data.Label.Visible = false end
            end
            return
        end

        local camPos = camera.CFrame.Position
        local hrp = getHRP()
        local activeHL = 0

        for _, hl in ipairs(HighlightPool) do hl.Enabled = false end

        for obj, cData in pairs(CachedItems) do
            if cData.Label then cData.Label.Visible = false end

            if not obj.Parent then
                RemoveItemFromCache(obj)
                continue
            end

            local itemData = cData.Data
            local isDropItem = cData.IsDropped

            -- DROP ESP логика
            if isDropItem then
                if not DROP_ESP_ENABLED then continue end
                
                local position = getObjPosition(obj, cData.PosType)
                if not position then continue end
                cData.Position = position

                if (position - camPos).Magnitude > DROP_ESP_RANGE then continue end

                local col = pColor(itemData.rarity)
                local pos2d, onScreen = camera:WorldToViewportPoint(position)

                if onScreen then
                    local yOffset = 0
                    if cData.TargetMesh:IsA("Model") then
                        local success, size = pcall(function() return cData.TargetMesh:GetExtentsSize() end)
                        if success then yOffset = size.Y / 2 end
                    elseif cData.TargetMesh:IsA("BasePart") then
                        yOffset = cData.TargetMesh.Size.Y / 2
                    end

                    local topPos = camera:WorldToViewportPoint(position + Vector3.new(0, yOffset + 0.5, 0))
                    local parts = {}

                    table.insert(parts, '<font size="12" color="#FF69B4">DROP ITEM</font>')
                    table.insert(parts, string.format('<font size="11">%s</font>', itemData.name or "?"))
                    
                    if hrp then
                        local dist = math.floor((hrp.Position - position).Magnitude)
                        table.insert(parts, string.format('<font size="10" color="#AAAAAA">[%d st]</font>', dist))
                    end

                    cData.Label.Text = table.concat(parts, "\n")
                    cData.Label.Position = UDim2.new(0, topPos.X, 0, topPos.Y)
                    cData.Label.ZIndex = math.floor(10000 - pos2d.Z)

                    local t = tick() % 2 / 2
                    cData.Gradient.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, col),
                        ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
                        ColorSequenceKeypoint.new(1, col),
                    })
                    cData.Gradient.Offset = Vector2.new(-1 + t * 2, 0)
                    cData.Label.Visible = true

                    if activeHL < 31 then
                        activeHL = activeHL + 1
                        local hl = HighlightPool[activeHL]
                        hl.Adornee = cData.TargetMesh
                        hl.FillColor = col
                        hl.OutlineColor = Color3.new(1, 1, 1)
                        hl.FillTransparency = 0.6
                        hl.OutlineTransparency = 0.2
                        hl.Enabled = true
                    end
                end
            else
                -- Обычный ESP (Shop)
                if SEARCH_BY_NAME and SEARCH_NAME_QUERY ~= "" then
                    local itemName = (itemData.name or ""):lower()
                    local searchQuery = SEARCH_NAME_QUERY:lower()
                    if not string.find(itemName, searchQuery, 1, true) then continue end
                end

                if USE_MIN_PRICE and itemData.fairPrice and itemData.fairPrice < MIN_PRICE then continue end

                local itemRarity = itemData.rarity or "Common"
                if not RARITY_FILTERS[itemRarity] then continue end

                local economyProfile = itemData.economyProfile or "normal"
                if not ECONOMY_FILTERS[economyProfile] then continue end

                local position = getObjPosition(obj, cData.PosType)
                if not position then continue end
                cData.Position = position

                if (position - camPos).Magnitude > ESP_RANGE then continue end

                -- Для JACKPOT используем черный цвет
                local col
                if economyProfile == "jackpot" then
                    col = Color3.fromRGB(0, 0, 0)
                else
                    col = pColor(itemData.rarity)
                end

                local pos2d, onScreen = camera:WorldToViewportPoint(position)

                if onScreen then
                    local yOffset = 0
                    if cData.TargetMesh:IsA("Model") then
                        local success, size = pcall(function() return cData.TargetMesh:GetExtentsSize() end)
                        if success then yOffset = size.Y / 2 end
                    elseif cData.TargetMesh:IsA("BasePart") then
                        yOffset = cData.TargetMesh.Size.Y / 2
                    end

                    local topPos = camera:WorldToViewportPoint(position + Vector3.new(0, yOffset + 0.5, 0))
                    local parts = {}

                    if ESP_SHOW_PRICE then
                        local priceStr = itemData.fairPrice and fmtPrice(itemData.fairPrice, itemData.spawnChance, itemData.economyProfile) or ""
                        if priceStr ~= "" then table.insert(parts, priceStr) end
                    end

                    if ESP_SHOW_NAME then
                        table.insert(parts, string.format('<font size="10">%s</font>', itemData.name or "?"))
                    end

                    if ESP_SHOW_DISTANCE and hrp then
                        local dist = math.floor((hrp.Position - position).Magnitude)
                        table.insert(parts, string.format('<font size="9" color="#AAAAAA">[%d st]</font>', dist))
                    end

                    if ESP_SHOW_RARITY and itemData.rarity then
                        table.insert(parts, string.format('<font size="9" color="#CCCCCC">%s</font>', itemData.rarity))
                    end

                    cData.Label.Text = table.concat(parts, "\n")
                    cData.Label.Position = UDim2.new(0, topPos.X, 0, topPos.Y)
                    cData.Label.ZIndex = math.floor(10000 - pos2d.Z)

                    local t = tick() % 2 / 2
                    cData.Gradient.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, col),
                        ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
                        ColorSequenceKeypoint.new(1, col),
                    })
                    cData.Gradient.Offset = Vector2.new(-1 + t * 2, 0)
                    cData.Label.Visible = true

                    if activeHL < 31 then
                        activeHL = activeHL + 1
                        local hl = HighlightPool[activeHL]
                        hl.Adornee = cData.TargetMesh
                        hl.FillColor = col
                        hl.OutlineColor = Color3.new(1, 1, 1)
                        hl.FillTransparency = 0.6
                        hl.OutlineTransparency = 0.2
                        hl.Enabled = true
                    end
                end
            end
        end
    end)
end)

UserInputService.JumpRequest:Connect(function()
    if not INF_JUMP_ENABLED then return end
    pcall(function()
        local char = player.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end)
end)

---------------------------------------------------------
-- ВКЛАДКИ
---------------------------------------------------------

-- Main Tab
local MainGroup = Tabs.Main:AddLeftGroupbox("ESP Settings", "eye")

MainGroup:AddToggle("Tog_ESP", { Text = "ESP Enabled", Default = false, Callback = function(value) ESP_ENABLED = value end })
MainGroup:AddSlider("ESP_Range", { Text = "ESP Range", Default = 150, Min = 0, Max = 400, Rounding = 0, Callback = function(v) ESP_RANGE = v end })
MainGroup:AddToggle("Tog_UseMinPrice", { Text = "Use Min Price Filter", Default = true, Callback = function(value) USE_MIN_PRICE = value end })
MainGroup:AddInput("Input_MinPrice", {
    Text = "Min Price", Default = "20000", Numeric = true, Finished = true,
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then MIN_PRICE = num end
    end
})

MainGroup:AddDivider()
MainGroup:AddLabel("Search by Name:")
MainGroup:AddToggle("Tog_SearchByName", { Text = "Enable Name Search", Default = false, Callback = function(value) SEARCH_BY_NAME = value end })
MainGroup:AddInput("Input_SearchName", { Text = "Item Name", Default = "", Finished = true, Callback = function(value) SEARCH_NAME_QUERY = value end })

MainGroup:AddDivider()
MainGroup:AddLabel("Rarity Filters:")
MainGroup:AddToggle("Tog_Common",    { Text = "Common",    Default = true, Callback = function(v) RARITY_FILTERS.Common    = v end })
MainGroup:AddToggle("Tog_Uncommon", { Text = "Uncommon",  Default = true, Callback = function(v) RARITY_FILTERS.Uncommon  = v end })
MainGroup:AddToggle("Tog_Rare",     { Text = "Rare",      Default = true, Callback = function(v) RARITY_FILTERS.Rare      = v end })
MainGroup:AddToggle("Tog_Epic",     { Text = "Epic",      Default = true, Callback = function(v) RARITY_FILTERS.Epic      = v end })
MainGroup:AddToggle("Tog_Legendary",{ Text = "Legendary", Default = true, Callback = function(v) RARITY_FILTERS.Legendary = v end })
MainGroup:AddToggle("Tog_Mythic",   { Text = "Mythic",    Default = true, Callback = function(v) RARITY_FILTERS.Mythic    = v end })
MainGroup:AddToggle("Tog_Exclusive",{ Text = "Exclusive", Default = true, Callback = function(v) RARITY_FILTERS.Exclusive = v end })

-- DROP ESP GROUP
local DropGroup = Tabs.Main:AddRightGroupbox("Drop Item ESP", "package")

DropGroup:AddToggle("Tog_DropESP", { 
    Text = "Drop ESP Enabled", 
    Default = false, 
    Callback = function(value) DROP_ESP_ENABLED = value end 
})

DropGroup:AddSlider("Drop_ESP_Range", { 
    Text = "Drop ESP Range", 
    Default = 400, 
    Min = 200, 
    Max = 900, 
    Rounding = 0, 
    Callback = function(v) DROP_ESP_RANGE = v end 
})

DropGroup:AddDivider()

DropGroup:AddToggle("Tog_AutoLoot", { 
    Text = "Auto Loot", 
    Default = false, 
    Callback = function(value) AUTO_LOOT_ENABLED = value end 
})

DropGroup:AddLabel("СОВЕТ: когда будете стоять около", true)
DropGroup:AddLabel("дропнутого предмета сделайте", true)
DropGroup:AddLabel("камеру от первого лица", true)
DropGroup:AddLabel("(то есть приблизьте)", true)

-- Auto Sell Group
local AutoSellGroup = Tabs.Main:AddLeftGroupbox("Auto Sell", "dollar-sign")
AutoSellGroup:AddToggle("Tog_AutoSell", { Text = "Auto Sell Enabled", Default = false, Callback = function(value) AUTO_SELL_ENABLED = value end })
AutoSellGroup:AddSlider("AutoSell_Interval", { Text = "Sell Interval (sec)", Default = 5, Min = 5, Max = 228, Rounding = 0, Callback = function(v) AUTO_SELL_INTERVAL = v end })
AutoSellGroup:AddButton({ Text = "Sell All Now", Func = function() sellAll() end })

-- Movement Tab
local MoveGroup = Tabs.Movement:AddLeftGroupbox("Movement", "zap")
MoveGroup:AddToggle("Tog_Speed", {
    Text = "Speed Enabled", Default = false,
    Callback = function(value)
        SPEED_ENABLED = value
        if not value then
            pcall(function()
                local char = player.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then hum.WalkSpeed = 16 end
                end
            end)
        end
    end
})
MoveGroup:AddSlider("WalkSpeed", { Text = "WalkSpeed", Default = 16, Min = 16, Max = 32, Rounding = 0, Callback = function(v) CURRENT_SPEED = v end })
MoveGroup:AddToggle("Tog_InfJump", { Text = "Infinite Jump", Default = false, Callback = function(value) INF_JUMP_ENABLED = value end })

-- Visual Tab
local VisGroup = Tabs.Visual:AddLeftGroupbox("World Visuals", "eye")
VisGroup:AddToggle("Tog_TransparentGlass", {
    Text = "Transparent Glass", Default = false,
    Callback = function(value)
        TRANSPARENT_GLASS_ENABLED = value
        if value then enableTransparentGlass() else disableTransparentGlass() end
    end
})
VisGroup:AddToggle("Tog_TimeChanger", { Text = "Time Changer", Default = false, Callback = function(value) TIME_CHANGER_ENABLED = value end })
VisGroup:AddSlider("TimeSlider", { Text = "Time of Day", Default = 14, Min = 0, Max = 24, Rounding = 1, Callback = function(v) CURRENT_TIME = v end })
VisGroup:AddDivider()

local skyboxNames = {}
for name, _ in pairs(SkyboxAssets) do table.insert(skyboxNames, name) end
table.sort(skyboxNames)
VisGroup:AddDropdown("SkyboxDropdown", { Text = "Select Skybox", Values = skyboxNames, Default = 1, Multi = false, Callback = function(value) applySkybox(value) end })

-- Money Spoof Group
local MoneyGroup = Tabs.Visual:AddRightGroupbox("Выдача деняг", "dollar-sign")
MoneyGroup:AddToggle("Tog_MoneySpoof", {
    Text = "Money Spoof", Default = false,
    Callback = function(value)
        MONEY_SPOOF_ENABLED = value
        if value then
            applyMoneySpoof()
            Library:Notify({ Title = "Money Spoof", Description = "Money spoof включен!", Time = 3 })
        else
            Library:Notify({ Title = "Money Spoof", Description = "Чтобы вернуть настоящий баланс перезайдите в плейс", Time = 5 })
        end
    end
})
MoneyGroup:AddInput("Input_MoneyAmount", {
    Text = "Money Amount", Default = "1000", Numeric = true, Finished = true,
    Callback = function(value)
        local num = tonumber(value)
        if num and num >= 0 then
            SPOOFED_MONEY_AMOUNT = num
            if MONEY_SPOOF_ENABLED then applyMoneySpoof() end
        end
    end
})
MoneyGroup:AddLabel("Чтобы вернуть свой настоящий", true)
MoneyGroup:AddLabel("баланс перезайдите в плейс", true)

-- Misc Tab
local MiscGroup = Tabs.Misc:AddLeftGroupbox("ESP Display Settings", "list")
MiscGroup:AddToggle("Tog_ShowPrice",    { Text = "Show Price",    Default = true, Callback = function(v) ESP_SHOW_PRICE    = v end })
MiscGroup:AddToggle("Tog_ShowDistance", { Text = "Show Distance", Default = true, Callback = function(v) ESP_SHOW_DISTANCE = v end })
MiscGroup:AddToggle("Tog_ShowRarity",   { Text = "Show Rarity",   Default = true, Callback = function(v) ESP_SHOW_RARITY   = v end })
MiscGroup:AddToggle("Tog_ShowName",     { Text = "Show Name",     Default = true, Callback = function(v) ESP_SHOW_NAME     = v end })

MiscGroup:AddDivider()
MiscGroup:AddLabel("Economy Profile Filters:")
MiscGroup:AddToggle("Tog_HideTrap",   { Text = "Hide Trap",   Default = false, Callback = function(v) ECONOMY_FILTERS.trap   = not v end })
MiscGroup:AddToggle("Tog_HideRisky",  { Text = "Hide Risky",  Default = false, Callback = function(v) ECONOMY_FILTERS.risky  = not v end })
MiscGroup:AddToggle("Tog_HideNormal", { Text = "Hide Normal", Default = false, Callback = function(v) ECONOMY_FILTERS.normal = not v end })

-- Server Hop Group
local ServerGroup = Tabs.Misc:AddRightGroupbox("Server Hop", "refresh-cw")
ServerGroup:AddButton({ Text = "Телепорт на рандомный сервер", Func = function() teleportToRandomServer() end })
ServerGroup:AddLabel("Телепортирует вас на случайный", true)
ServerGroup:AddLabel("доступный сервер этой игры", true)

-- Nickname & Pins
local NickGroup = Tabs.Visual:AddLeftGroupbox("Nickname & Pins", "user")
NickGroup:AddToggle("Tog_NickEnabled", {
    Text = "Custom Nickname", Default = false,
    Callback = function(value)
        NICK_ENABLED = value
        if value then applyNickname() else revertNickname() end
    end
})
NickGroup:AddInput("Input_Nickname", {
    Text = "Nickname", Default = "", Finished = true,
    Callback = function(value)
        customNickname = value
        if NICK_ENABLED then applyNickname() end
    end
})

local PinSelectGroup = Tabs.Visual:AddRightGroupbox("Select Pins", "award")

for pinName, _ in pairs(PIN_TYPES) do
    PinSelectGroup:AddToggle("Tog_Pin_" .. pinName, {
        Text = pinName,
        Default = SELECTED_PINS[pinName] or false,
        Callback = function(value)
            SELECTED_PINS[pinName] = value
            if pinIconsContainer then pinIconsContainer:Destroy(); pinIconsContainer = nil end
            applyNickname()
        end
    })
end

-- UI Settings Tab
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")
MenuGroup:AddLabel("Press Right Shift to toggle menu")
MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(value) Library.KeybindFrame.Visible = value end,
})
MenuGroup:AddButton("Unload", function() Library:Unload() end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("TSUM_Baobab")
SaveManager:SetFolder("TSUM_Baobab/configs")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
