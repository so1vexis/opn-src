local t1 = {}
local t2 = {}
local v3 = unpack or table.unpack
game:IsLoaded()
repeat
    task.wait()
    t1[1] = game:IsLoaded()
until t1[1]
t2[1] = game:GetService("Players")
t2[2] = game:GetService("RunService")
t2[3] = game:GetService("UserInputService")
t2[4] = game:GetService("TweenService")
t2[5] = game:GetService("VirtualInputManager")
t2[6] = game:GetService("InsertService")
t2[7] = game:GetService("Debris")
t2[8] = game:GetService("CoreGui")
t2[9] = game:GetService("GuiService")
t2[10] = game:GetService("Lighting")
t2[11] = game:GetService("HttpService")
t2[12] = game:GetService("ReplicatedStorage")
t2[13] = t2[1].LocalPlayer
if not t2[13] then
    t2[13] = t2[1].PlayerAdded:Wait()
end
t1[1] = t2[13]:WaitForChild("PlayerGui")
t2[14] = t1[1]
if getgenv then
    t1[1] = getgenv()

    if t1[1].KitagawaHubRunning then
        warn("[KitagawaHub] Script is already running — second load blocked.")

        return
    end

    t1[2] = getgenv()
    t1[1] = "KitagawaHubRunning"
    t1[2][t1[1]] = true
end
t1[2] = function(p1)
    p1.ResetOnSpawn = false
    local s1 = "gethui"
    local u92
    pcall(function()
        u92 = _G[s1]
    end)
    local v93
    if type(u92) == "function" then
        v93 = u92
    else
        v93 = nil
    end
    local v94 = v93
    if v94 then
        pcall(function()
            p1.Parent = v94()
        end)

        if p1.Parent then
            return p1
        end
    end
    pcall(function()
        if syn and type(syn.protect_gui) == "function" then
            syn.protect_gui(p1)
            p1.Parent = t2[8]
        end
    end)
    if p1.Parent then
        return p1
    end
    pcall(function()

        local s2 = "protectgui"
        local u835
        pcall(function()
            u835 = _G[s2]
        end)
        local v836
        if type(u835) == "function" then
            v836 = u835
        else
            v836 = nil
        end
        if v836 then
            v836(p1)
            p1.Parent = t2[8]
        end
    end)
    if not p1.Parent then
        p1.Parent = t2[14]
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
t2[15] = true
t2[16] = false
t2[17] = nil
t2[18] = {}
t2[19] = nil
t2[20] = nil
t2[21] = nil
local t3 = {
	Enabled = false,
	Bind = nil
}
local t4 = {
	Enabled = false,
	Bind = nil
}
local t5 = {
	Enabled = false,
	Bind = nil
}
local t6 = {
	Enabled = false,
	Bind = nil
}
local t7 = {
	Enabled = false,
	Bind = nil
}
local t8 = {
	Enabled = false,
	Bind = nil
}
local t9 = {
	Enabled = false,
	Bind = nil,
	Delay = 80
}
local t10 = {
	Enabled = false,
	Speed = 10,
	Bind = nil
}
local t11 = {
	Enabled = false,
	Power = 1,
	Bind = nil
}
local t12 = {
	Enabled = false,
	Bind = nil
}
local t13 = {
	Enabled = false,
	Bind = nil
}
local t14 = {
	Enabled = false,
	Bind = nil
}
local t15 = {
	Enabled = false
}
local t16 = {
	FlySpeed = 50,
	JumpHeight = 50
}
local t17 = {
	Enabled = false,
	Bind = nil
}
local t18 = {
	Enabled = false
}
local t19 = {
	Enabled = false
}
local t20 = {
	Enabled = false
}
local t21 = {
	Enabled = false
}
local t22 = {
	Enabled = false
}
local t23 = {
	Enabled = false
}
local t24 = {
	Enabled = false
}
local t25 = {
	Enabled = false
}
local t26 = {
	Enabled = false
}
local t27 = {
	Enabled = false
}
local t28 = {
	Enabled = false
}
local t29 = {
	Enabled = false
}
local t30 = {
	Enabled = false
}
local t31 = {
	Enabled = false,
	R = 255,
	G = 200,
	B = 50,
	Size = 15
}
local t32 = {
	Enabled = false,
	Mode = "Tropical"
}
local t33 = {
	Enabled = false
}
local t34 = {
	Enabled = false,
	Density = 0.35,
	Haze = 0.9,
	Glare = 0.12,
	Offset = 0.25
}
local t35 = {
	Enabled = false,
	Bind = nil
}
local t36 = {
	Enabled = false,
	Bind = nil
}
local t37 = {
	Enabled = false,
	Bind = nil
}
local t38 = {
	Enabled = false,
	Bind = nil
}
local t39 = {
	Enabled = false,
	Bind = nil
}
local t40 = {
	Enabled = false,
	Bind = nil
}
local t41 = {
	Enabled = false
}
local t42 = {
	Enabled = false
}
t1[1] = {
	Enabled = false
}
local t43 = {
	Enabled = false
}
local t44 = {
	Enabled = false
}
local t45 = {
	Enabled = false
}
local t46 = {
	Enabled = false
}
local t47 = {
	Enabled = false
}
local t48 = {
	Enabled = false,
	Bind = nil
}
local t49 = {
	Enabled = false,
	Bind = nil
}
local t50 = {
	Enabled = false,
	Bind = nil
}
local t51 = {
	Enabled = false,
	Bind = nil
}
local t52 = {
	R = 90,
	G = 190,
	B = 255,
	Adaptive = false
}
local t53 = {
	Gui = 100,
	Hud = 100
}
t1[1] = {
	DeviceMode = "PC",
	AutoLoot = t3,
	TouchFling = t4,
	AutoShootMurder = t5,
	WallShotMurder = t6,
	MurderKillAll = t7,
	KillOnlySheriff = t8,
	TriggerBot = t9,
	SpinBot = t10,
	BHop = t11,
	InfJump = t12,
	Fly = t13,
	FlyAura = t14,
	Noclip = t15,
	Movement = t16,
	AntiFling = t17,
	MurdererESP = t18,
	SheriffESP = t19,
	InnocentESP = t20,
	EspBoxes = t21,
	NameESP = t22,
	GunESP = t23,
	PlayerMenu = t24,
	DeathNote = t25,
	DeathNoteStyle = "Rotating",
	NikilisPet = t26,
	RyukPet = t27,
	KeyBindList = t28,
	FpsBanner = t29,
	PingBanner = t30,
	BulletTracker = t31,
	CustomSky = t32,
	CustomCrosshair = t33,
	CrosshairStyle = "Love Cursor",
	CustomAtmosphere = t34,
	ElEtoYa = t35,
	LightYagami = t36,
	RonaldoSkin = t37,
	RonaldoEmote = t38,
	JerkOff = t39,
	AutoFarmCoin = t40,
	WingsAura = t41,
	StarrBallAura = t42,
	RedAura = t1[1],
	JumpCircleNeon = t43,
	JumpCircleShock = t44,
	JumpCirclePulse = t45,
	PlayerChams = t46,
	WeaponChams = t47,
	FortniteGriddy = t48,
	FortniteTrollDance = t49,
	KotoNaiDance = t50,
	TornadoEmote = t51,
	ChamsColor = t52,
	UIScale = t53,
	UIScaleAuto = true,
	Language = "EN"
}
t2[22] = t1[1]
t2[23] = {
	id = "unknown",
	name = "Unknown",
	platform = "PC",
	version = "",
	guiScale = 100,
	hudScale = 100
}
t2[24] = {
	{
		keys = { "delta" },
		id = "delta",
		name = "Delta",
		platform = "Mobile",
		gui = 70,
		hud = 74,
		probe = function()
    return _G.Delta or _G.DeltaExecutor
end
	},
	{
		keys = {
			"arceusx",
			"arceus",
			"arceusxneo"
		},
		id = "arceusx",
		name = "Arceus X",
		platform = "Mobile",
		gui = 72,
		hud = 76,
		probe = function()
    return _G.ArceusX or _G.Arceus
end
	},
	{
		keys = { "codex" },
		id = "codex",
		name = "Codex",
		platform = "Mobile",
		gui = 72,
		hud = 76,
		probe = function()
    return _G.Codex or _G.CodexExploit
end
	},
	{
		keys = {
			"krnlmobile",
			"krnlios"
		},
		id = "krnlmobile",
		name = "Krnl Mobile",
		platform = "Mobile",
		gui = 74,
		hud = 78,
		probe = function()
    return _G.KRNL_MOBILE
end
	},
	{
		keys = {
			"fluxusmobile",
			"fluxusios"
		},
		id = "fluxusmobile",
		name = "Fluxus Mobile",
		platform = "Mobile",
		gui = 74,
		hud = 78
	},
	{
		keys = {
			"evonmobile",
			"evon"
		},
		id = "evonmobile",
		name = "Evon",
		platform = "Mobile",
		gui = 73,
		hud = 77,
		probe = function()
    return _G.Evon
end
	},
	{
		keys = { "hydrogen" },
		id = "hydrogen",
		name = "Hydrogen",
		platform = "Mobile",
		gui = 73,
		hud = 77,
		probe = function()
    return _G.Hydrogen
end
	},
	{
		keys = { "appleware" },
		id = "appleware",
		name = "Appleware",
		platform = "Mobile",
		gui = 72,
		hud = 76
	},
	{
		keys = { "xenomobile" },
		id = "xenomobile",
		name = "Xeno Mobile",
		platform = "Mobile",
		gui = 74,
		hud = 78
	},
	{
		keys = { "ronix" },
		id = "ronix",
		name = "Ronix",
		platform = "Mobile",
		gui = 73,
		hud = 77
	},
	{
		keys = { "crypticmobile" },
		id = "crypticmobile",
		name = "Cryptic Mobile",
		platform = "Mobile",
		gui = 73,
		hud = 77
	},
	{
		keys = {
			"iosfreemium",
			"iflux"
		},
		id = "iosfreemium",
		name = "iOS Freemium",
		platform = "Mobile",
		gui = 72,
		hud = 76
	},
	{
		keys = {
			"synapse",
			"synapsex"
		},
		id = "synapse",
		name = "Synapse X",
		platform = "PC",
		gui = 100,
		hud = 100,
		probe = function()
    return syn
end
	},
	{
		keys = {
			"scriptware",
			"sw"
		},
		id = "scriptware",
		name = "Script-Ware",
		platform = "PC",
		gui = 100,
		hud = 100,
		probe = function()
    return _G.SW_LOADED or _G.scriptware
end
	},
	{
		keys = { "krnl" },
		id = "krnl",
		name = "Krnl",
		platform = "PC",
		gui = 100,
		hud = 100,
		probe = function()
    return KRNL_LOADED or _G.krnl
end
	},
	{
		keys = { "fluxus" },
		id = "fluxus",
		name = "Fluxus",
		platform = "PC",
		gui = 98,
		hud = 100,
		probe = function()
    return fluxus or _G.Fluxus
end
	},
	{
		keys = { "solara" },
		id = "solara",
		name = "Solara",
		platform = "PC",
		gui = 98,
		hud = 100,
		probe = function()
    return _G.Solara
end
	},
	{
		keys = { "wave" },
		id = "wave",
		name = "Wave",
		platform = "PC",
		gui = 100,
		hud = 100,
		probe = function()
    return _G.WaveLoaded or _G.wave
end
	},
	{
		keys = { "electron" },
		id = "electron",
		name = "Electron",
		platform = "PC",
		gui = 100,
		hud = 100,
		probe = function()
    return _G.Electron
end
	},
	{
		keys = { "oxygen" },
		id = "oxygen",
		name = "Oxygen U",
		platform = "PC",
		gui = 100,
		hud = 100,
		probe = function()
    return _G.Oxygen
end
	},
	{
		keys = { "vega" },
		id = "vega",
		name = "Vega X",
		platform = "PC",
		gui = 98,
		hud = 100
	},
	{
		keys = { "jjsploit" },
		id = "jjsploit",
		name = "JJSploit",
		platform = "PC",
		gui = 96,
		hud = 98
	},
	{
		keys = { "comet" },
		id = "comet",
		name = "Comet",
		platform = "PC",
		gui = 98,
		hud = 100,
		probe = function()
    return _G.Comet
end
	},
	{
		keys = { "xeno" },
		id = "xeno",
		name = "Xeno",
		platform = "PC",
		gui = 98,
		hud = 100,
		probe = function()
    return _G.Xeno
end
	},
	{
		keys = { "potassium" },
		id = "potassium",
		name = "Potassium",
		platform = "PC",
		gui = 100,
		hud = 100,
		probe = function()
    return _G.Potassium
end
	},
	{
		keys = { "seliware" },
		id = "seliware",
		name = "Seliware",
		platform = "PC",
		gui = 100,
		hud = 100
	},
	{
		keys = { "cryptic" },
		id = "cryptic",
		name = "Cryptic",
		platform = "PC",
		gui = 98,
		hud = 100
	},
	{
		keys = { "nihon" },
		id = "nihon",
		name = "Nihon",
		platform = "PC",
		gui = 98,
		hud = 100
	},
	{
		keys = { "trigon" },
		id = "trigon",
		name = "Trigon",
		platform = "PC",
		gui = 98,
		hud = 100,
		probe = function()
    return _G.Trigon
end
	},
	{
		keys = { "evon" },
		id = "evon",
		name = "Evon",
		platform = "PC",
		gui = 98,
		hud = 100
	},
	{
		keys = { "celery" },
		id = "celery",
		name = "Celery",
		platform = "PC",
		gui = 98,
		hud = 100
	},
	{
		keys = { "macsploit" },
		id = "macsploit",
		name = "MacSploit",
		platform = "PC",
		gui = 100,
		hud = 100,
		probe = function()
    return _G.MacSploit
end
	},
	{
		keys = { "sirhurt" },
		id = "sirhurt",
		name = "SirHurt",
		platform = "PC",
		gui = 100,
		hud = 100
	},
	{
		keys = { "bunni" },
		id = "bunni",
		name = "Bunni",
		platform = "PC",
		gui = 98,
		hud = 100
	},
	{
		keys = { "horizon" },
		id = "horizon",
		name = "Horizon",
		platform = "PC",
		gui = 98,
		hud = 100
	},
	{
		keys = { "opiumware" },
		id = "opiumware",
		name = "Opiumware",
		platform = "PC",
		gui = 98,
		hud = 100
	},
	{
		keys = { "valyse" },
		id = "valyse",
		name = "Valyse",
		platform = "PC",
		gui = 100,
		hud = 100
	},
	{
		keys = { "calamari" },
		id = "calamari",
		name = "Calamari",
		platform = "Mobile",
		gui = 72,
		hud = 76
	}
}
t2[25] = {
	gui = 74,
	hud = 78
}
t2[26] = {
	gui = 100,
	hud = 100
}
local function v55(p2)
    local lower = string.lower
    local _tostring = tostring

    if not p2 then
        p2 = ""
    end

    local t54 = { (_tostring(p2)) }

    return (lower(v3(t54)):gsub("[%s_%-%.%(%)]+", ""))
end
t2[27] = function(p3)
    for _, v in ipairs(t2[24]) do
        for _, v2 in ipairs(v.keys) do
            if p3 == v2 or string.find(p3, v2, 1, true) then
                return v
            end
        end
    end

    return nil
end
local function v56()
    for _, v in ipairs(t2[24]) do
        if not v.probe then
            continue
        end

        local ok, result = pcall(v.probe)

        if ok and result then
            return v
        end
    end

    return nil
end
t2[23] = (function()
    local s3 = "Unknown"
    local s4 = ""
    pcall(function()
        if identifyexecutor then
            local v837, v838 = identifyexecutor()

            if v837 then
                s3 = tostring(v837)
            end

            if v838 then
                s4 = tostring(v838)
            end
        end
    end)
    if s3 == "Unknown" then
        pcall(function()
            if getexecutorname then
                s3 = tostring(getexecutorname())
            end
        end)
    end
    local v110 = t2[27]((v55(s3))) or v56()
    local v111 = t2[3].TouchEnabled and not t2[3].KeyboardEnabled
    if not v110 then
        local v112 = not v111 and "PC" or "Mobile"
        local v113 = v112 == "Mobile" and t2[25] or t2[26]
        local v114 = v55(s3)
        local v115 = s3
        local v116 = s4
        local gui = v113.gui
        local hud = v113.hud

        return {
			id = v114,
			name = v115,
			platform = v112,
			version = v116,
			guiScale = gui,
			hudScale = hud
		}
    end
    local platform = v110.platform
    if v111 then
        v111 = platform == "PC" and v110.id ~= "xeno"
    end
    if v111 then
        platform = "Mobile"
    end
    local gui = v110.gui
    local hud = v110.hud
    if platform == "Mobile" and v110.platform == "PC" then
        gui = t2[25].gui
        hud = t2[25].hud
    end
    local id = v110.id
    local v123 = s3 ~= "Unknown" and s3 or v110.name
    local v124 = s4

    return {
		id = id,
		name = v123,
		platform = platform,
		version = v124,
		guiScale = gui,
		hudScale = hud
	}
end)()
t2[28] = function()
    if t2[22].UIScaleAuto == false then
        return
    end

    t2[22].UIScale.Gui = t2[23].guiScale or t2[26].gui
    t2[22].UIScale.Hud = t2[23].hudScale or t2[26].hud

    if t2[23].platform == "Mobile" then
        t2[22].DeviceMode = "Mobile"
    end
end
pcall(function()
    if getgenv() then
        getgenv().KitagawaExecutorInfo = t2[23]
    end
end)
t2[28]()
t2[29] = "EN"
t2[30] = {}
t2[31] = {
	Main = "Главное",
	Combat = "Бой",
	AutoFarm = "Автофарм",
	Fun = "Развлечения",
	Misc = "Разное",
	Visuals = "Визуал",
	Flings = "Флинги",
	Emote = "Эмоуты",
	Miscellaneous = "Разное",
	MainVisuals = "Основной визуал",
	World = "Мир",
	Chams = "Чамсы",
	["Interface Settings"] = "Настройки интерфейса",
	["Config Directory"] = "Директория конфигов",
	["GUI Size"] = "Размер GUI",
	["Auto GUI for executor"] = "Авто-размер под инжектор",
	Executor = "Инжектор",
	Platform = "Платформа",
	["Recommended GUI"] = "Реком. GUI",
	["Apply executor size"] = "Применить размер инжектора",
	["KeyBind List + banner + FPS/Ping"] = "KeyBind List + плашка + FPS/Ping",
	["Reset Sizes"] = "Сбросить размеры",
	Language = "Язык",
	["Config name..."] = "Название конфига...",
	Save = "Сохранить",
	Load = "Загрузить",
	Delete = "Удалить",
	Refresh = "Обновить",
	["No saved configs yet"] = "Сохранённых конфигов пока нет",
	["Player Chams"] = "Чамсы игроков",
	["Knife + Weapon"] = "Нож + Оружие",
	["Safe Murder"] = "Безопасный фарм",
	["Turbo Under Map"] = "Турбо под картой",
	["AutoShoot Murder"] = "Автовыстрел по убийце",
	["WallShot Murder"] = "Выстрел сквозь стены",
	["Anti-Fling"] = "Анти-флинг",
	["Touch Fling"] = "Флинг касанием",
	SpinBot = "Вращение",
	BunnyHop = "Банни-хоп",
	["Spin Speed"] = "Скорость вращения",
	["Bhop Power"] = "Сила банни-хопа",
	["Fly Speed"] = "Скорость полёта",
	["Jump Height"] = "Высота прыжка",
	["Custom Sky"] = "Своё небо",
	["Custom Atmosphere"] = "Своя атмосфера",
	["KeyBind List"] = "Список бинды",
	["FPS Banner"] = "Плашка FPS",
	["Ping Banner"] = "Плашка пинга",
	["Murderer ESP"] = "ESP убийцы",
	["Sheriff ESP"] = "ESP шерифа",
	["Innocent ESP"] = "ESP невинных",
	["3D Box ESP"] = "3D Box ESP",
	["Custom Cursors"] = "Свои курсоры",
	["Custom Crosshair"] = "Свой прицел"
}
local function v57()
    for i = #t2[30], 1, -1 do
        local v132 = i
        local u131 = t2[30][v132]
        if not pcall(function()
            local inst = u131.inst
            local prop = u131.prop
            local prefix = u131.prefix
            local en = u131.en

            inst[prop] = prefix .. if t2[29] ~= "RU" then en else t2[31][en] or en
        end) then
            table.remove(t2[30], v132)
        end
    end
end
t2[32] = {}
t2[33] = {}
t2[34] = {}
t2[35] = {}
t2[36] = {}
t2[37] = Color3.fromRGB(0, 150, 255)
t2[38] = t1[2](Instance.new("ScreenGui"))
t2[38].Name = "KitagawaHub_Gui"
t2[39] = t1[2](Instance.new("ScreenGui"))
t2[39].Name = "KitagawaMobileButtons"
pcall(function()
    t2[39].DisplayOrder = 1000
end)
t2[40] = Instance.new("Folder")
t2[40].Name = "KitagawaPlayerMenus"
t2[40].Parent = t2[38]
t2[41] = Instance.new("Frame")
local v58 = t2[41]
t2[42] = nil
v58.Name = "EarlyTopToggle"
t2[41].Size = UDim2.new(0, 160, 0, 36)
t2[41].Position = UDim2.new(0.5, -80, 0, 15)
t2[41].BackgroundColor3 = Color3.fromRGB(28, 30, 36)
t2[41].BackgroundTransparency = 0.36
t2[41].BorderSizePixel = 0
t2[41].ZIndex = 200
t2[41].Parent = t2[38]
Instance.new("UICorner", t2[41]).CornerRadius = UDim.new(1, 0)
local UIStroke = Instance.new("UIStroke", t2[41])
UIStroke.Color = Color3.fromRGB(72, 78, 92)
UIStroke.Thickness = 1
t2[43] = Instance.new("TextButton", t2[41])
t2[43].Size = UDim2.new(1, 0, 1, 0)
t2[43].BackgroundTransparency = 1
t2[43].RichText = true
local v60 = t2[43]
t1[1] = function(p4, p5)
    local function v145(p6)
        if not p6 then
            return nil
        end

        for _, child in ipairs(p6:GetChildren()) do
            local v846 = child:IsA("Tool")

            if v846 then
                v846 = child.Name == "Gun" or (string.find(child.Name:lower(), "weapon") or string.find(child.Name:lower(), "gun"))
            end

            if v846 then
                return child
            end
        end

        return nil
    end

    return v145(p4) or v145(p5)
end
v60.Text = "<font color=\"#DDDDDD\">Kitagawa</font><font color=\"#00A2FF\">Hub</font>"
t2[43].Font = Enum.Font.GothamBold
t2[43].TextSize = 14
t2[43].ZIndex = 201
t2[44] = Instance.new("TextLabel", t2[41])
t2[44].Size = UDim2.new(1, 0, 0, 10)
t2[44].Position = UDim2.new(0, 0, 1, 2)
t2[44].BackgroundTransparency = 1
t2[44].Text = "Loading..."
t2[44].TextColor3 = Color3.fromRGB(140, 200, 255)
t2[44].Font = Enum.Font.Gotham
t2[44].TextSize = 9
t2[44].ZIndex = 201
local t55 = {
	input = nil,
	owner = nil,
	priority = -1e999
}
t2[45] = nil
t2[45] = t55
t2[46] = function(p7, p8, p9)
    if p7 ~= t2[45].input then
        t2[45].input = p7
        t2[45].owner = p8
        t2[45].priority = p9

        return
    end

    if p9 > t2[45].priority then
        t2[45].owner = p8
        t2[45].priority = p9
    end
end
local function v62(p10)
    local v150 = p10.ZIndex or 1
    local p10Parent = p10.Parent

    while p10Parent and p10Parent:IsA("GuiObject") do
        v150 = math.max(v150, p10Parent.ZIndex or 1)
        p10Parent = p10Parent.Parent
    end

    return v150
end
local function v63(p11, p12, p13)
    if not p13 then
        p13 = p11
    end
    p13.Active = true
    local u155 = false
    local u156
    local inputPosition
    local p11Position
    local p12Position
    p13.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            u155 = true
            inputPosition = input.Position
            p11Position = p11.Position
            t2[46](input, p11, (v62(p11)))

            if p12 then
                p12Position = p12.Position
            end

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    u155 = false
                end
            end)
        end
    end)
    p13.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            u156 = input
        end
    end)
    t2[3].InputChanged:Connect(function(input)
        if t2[45].owner ~= nil and t2[45].owner ~= p11 then
            return
        end

        if input == u156 and u155 then
            local v850 = input.Position - inputPosition

            p11.Position = UDim2.new(p11Position.X.Scale, p11Position.X.Offset + v850.X, p11Position.Y.Scale, p11Position.Y.Offset + v850.Y)

            if p12 then
                p12.Position = UDim2.new(p12Position.X.Scale, p12Position.X.Offset + v850.X, p12Position.Y.Scale, p12Position.Y.Offset + v850.Y)
            end
        end
    end)
    local function v160(p14)
        if p14.UserInputType == Enum.UserInputType.MouseButton1 or p14.UserInputType == Enum.UserInputType.Touch then
            if p14 == t2[45].input and t2[45].owner == p11 then
                t2[45].input = nil
                t2[45].owner = nil
                t2[45].priority = -1e999
            end

            if not (u155 and p14 == u156 or p14.UserInputState == Enum.UserInputState.End) then
            end
        end
    end
    p13.InputEnded:Connect(v160)
    t2[3].InputEnded:Connect(v160)
end
t2[47] = Color3.fromRGB(28, 30, 36)
t2[48] = 0.22
t2[49] = Color3.fromRGB(42, 45, 54)
t2[50] = 0.32
t2[51] = Color3.fromRGB(72, 78, 92)
t2[52] = Color3.fromRGB(95, 165, 255)
t2[53] = Color3.fromRGB(248, 252, 255)
t2[54] = Color3.fromRGB(220, 228, 242)
local function v64(p15, p16, p17, p18)
    local Frame = Instance.new("Frame")

    Frame.Size = UDim2.new(0, p16, 0, p17)
    Frame.BackgroundColor3 = t2[47]
    Frame.BackgroundTransparency = t2[48]
    Frame.BorderSizePixel = 0
    Frame.ZIndex = p18 or 5
    Frame.Parent = p15
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(1, 0)

    local UIStroke2 = Instance.new("UIStroke", Frame)

    UIStroke2.Color = t2[51]
    UIStroke2.Thickness = 1
    UIStroke2.Transparency = 0.25

    local Frame2 = Instance.new("Frame", Frame)

    Frame2.Name = "BlurLayer"
    Frame2.Size = UDim2.new(1, -6, 1, -6)
    Frame2.Position = UDim2.new(0, 3, 0, 3)
    Frame2.BackgroundColor3 = t2[49]
    Frame2.BackgroundTransparency = t2[50]
    Frame2.BorderSizePixel = 0
    Frame2.ZIndex = Frame.ZIndex
    Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)

    return Frame, Frame2, UIStroke2
end
t2[55] = function()
    local n1 = 50
    pcall(function()
        n1 = math.clamp(math.round(t2[13]:GetNetworkPing() * 1000), 1, 999)
    end)

    return n1
end
t2[56] = function(p19)
    if not p19 then
        return nil
    end

    return p19:FindFirstChild("UpperTorso") or (p19:FindFirstChild("Torso") or p19:FindFirstChild("HumanoidRootPart"))
end
t2[57] = nil
t2[57] = function(p20)
    if not p20 then
        return nil
    end

    local v181 = t2[56](p20)

    if not v181 or not v181.Parent then
        return nil
    end

    local AssemblyLinearVelocity = v181.AssemblyLinearVelocity
    local v183 = math.clamp(t2[55]() / 1000, 0.04, 0.18)

    return v181.Position + AssemblyLinearVelocity * (v183 * 0.65 + 0.02)
end
t2[58] = function(p21)
    return t2[57](p21)
end
t2[59] = {
	Pink = 12635340429,
	PinkIshak = 106301897120310,
	Night = 10610570551,
	Sunset = 18763720423,
	Tropical = 93465206119408,
	RedNight = 105587979946220
}
t2[60] = {
	Pink = "Pink Sky",
	PinkIshak = "Pink Sky Ishak",
	Night = "Night Sky",
	Sunset = "Sun Set",
	Tropical = "Tropical Summer",
	RedNight = "Red Night"
}
local t56 = {
	Color = Color3.fromRGB(255, 185, 215),
	Density = 0.38,
	Offset = 0.2,
	Glare = 0.15,
	Haze = 1
}
local t57 = {
	Color = Color3.fromRGB(255, 155, 195),
	Density = 0.42,
	Offset = 0.24,
	Glare = 0.12,
	Haze = 1.15
}
local t58 = {
	Color = Color3.fromRGB(55, 65, 115),
	Density = 0.48,
	Offset = 0.1,
	Glare = 0.05,
	Haze = 0.55
}
local t59 = {
	Color = Color3.fromRGB(255, 145, 85),
	Density = 0.34,
	Offset = 0.28,
	Glare = 0.22,
	Haze = 1.05
}
local t60 = {
	Color = Color3.fromRGB(120, 220, 255),
	Density = 0.28,
	Offset = 0.35,
	Glare = 0.25,
	Haze = 0.85
}
local color3 = Color3.fromRGB(120, 25, 35)
t2[61] = {
	Pink = t56,
	PinkIshak = t57,
	Night = t58,
	Sunset = t59,
	Tropical = t60,
	RedNight = {
		Color = color3,
		Density = 0.52,
		Offset = 0.08,
		Glare = 0.04,
		Haze = 0.75
	}
}
t2[62] = nil
t2[63] = {}
t2[64] = nil
t2[62] = nil
t2[65] = function()
    if not t2[22].CustomAtmosphere or not t2[22].CustomAtmosphere.Enabled then
        if t2[62] then
            t2[62]:Destroy()
            t2[62] = nil
        end

        return
    end

    local v191 = t2[22].CustomSky.Mode or "Tropical"
    local v192 = t2[61][v191] or t2[61].Tropical
    local CustomAtmosphere = t2[22].CustomAtmosphere

    if not t2[62] or not t2[62].Parent then
        t2[62] = Instance.new("Atmosphere")
        t2[62].Name = "KitagawaAtmosphere"
        t2[62].Parent = t2[10]
    end

    t2[62].Color = v192.Color
    t2[62].Density = CustomAtmosphere.Density or v192.Density
    t2[62].Offset = CustomAtmosphere.Offset or v192.Offset
    t2[62].Glare = CustomAtmosphere.Glare or v192.Glare
    t2[62].Haze = CustomAtmosphere.Haze or v192.Haze
    t2[62].Decay = Color3.fromRGB(math.clamp(v192.Color.R * 255 * 0.85, 0, 255), math.clamp(v192.Color.G * 255 * 0.85, 0, 255), (math.clamp(v192.Color.B * 255 * 0.85, 0, 255)))
end
t2[66] = function(p22)
    if not p22 then
        return nil
    end

    if p22:IsA("Sky") then
        return p22
    end

    return p22:FindFirstChildWhichIsA("Sky", true)
end
t2[67] = function(p23)
    local num = tonumber(p23)
    if not num then
        return nil
    end
    if t2[63][num] then
        return t2[63][num]
    end
    local u198
    pcall(function()
        local ok, result = pcall(function()
            return game:GetObjects("rbxassetid://" .. tostring(num))
        end)

        if ok and result then
            for _, v in ipairs(result) do
                u198 = t2[66](v)

                if u198 then
                    break
                end
            end
        end

        if not u198 then
            local v857 = t2[6]:LoadAsset(num)
            local GetChildren = v857.GetChildren

            for _, v in ipairs(GetChildren(v857)) do
                u198 = t2[66](v)

                if u198 then
                    break
                end
            end

            v857:Destroy()
        end
    end)
    if u198 then
        t2[63][num] = u198
    end

    return u198
end
t2[68] = function(p24)
    if t2[64] then
        t2[64]:Destroy()
        t2[64] = nil
    end

    t2[64] = p24:Clone()
    t2[64].Name = "KitagawaCustomSky"
    t2[64].Parent = t2[10]
    pcall(function()
        local Parent = t2[64].Parent

        t2[64].Parent = nil
        t2[64].Parent = Parent
    end)
end
t2[69] = function(p25, p26)
    if not p26 then
        if t2[64] then
            t2[64]:Destroy()
        end

        t2[65]()

        return
    end

    local v201 = t2[59][p25] or t2[59].Tropical
    local v202 = t2[67](v201)

    if v202 then
        t2[68](v202)
    end

    if t2[22].CustomAtmosphere and t2[22].CustomAtmosphere.Enabled then
        t2[65]()
    end
end
t2[70] = nil
t2[70] = function(p27)
    local Humanoid = p27:WaitForChild("Humanoid", 3)
    if not Humanoid then
        return
    end
    local GetChildren = p27.GetChildren
    for _, v in pairs(GetChildren(p27)) do
        local v220 = string.find(v.Name, "VisualCustomAcc_")

        if not v220 then
            v220 = v:FindFirstChild("IsVisualFake")

            if not v220 then
                v220 = string.find(v.Name, "VisualFake_")

                if not v220 then
                    v220 = v.Name == "VisualCustomShirt" or (v.Name == "VisualCustomPants" or v.Name == "VisualCustomGraphic")
                end
            end
        end

        if v220 then
            v:Destroy()
        end

        if v:IsA("Accessory") and v:FindFirstChild("Handle") then
            v.Handle.Transparency = 0
        end

        if string.find(v.Name, "HiddenOriginal_") then
            v.Name = string.gsub(v.Name, "HiddenOriginal_", "")
        end
    end
    local Head = p27:FindFirstChild("Head")
    if Head then
        local GetChildren2 = Head.GetChildren

        for _, v in pairs(GetChildren2(Head)) do
            if v.Name == "VisualCustomFace" then
                v:Destroy()
            elseif v:IsA("Decal") and v.Name == "face" then
                v.Transparency = 0
            end
        end
    end
    local HiddenOriginalClothes = p27:FindFirstChild("HiddenOriginalClothes")
    if HiddenOriginalClothes then
        local GetChildren3 = HiddenOriginalClothes.GetChildren

        for _, v in pairs(GetChildren3(HiddenOriginalClothes)) do
            v.Parent = p27
        end

        HiddenOriginalClothes:Destroy()
    end
    local AvatarBackupFolder = t2[13]:FindFirstChild("AvatarBackupFolder")
    if AvatarBackupFolder then
        for _, child in pairs(AvatarBackupFolder:GetChildren()) do
            if child:IsA("Decal") and Head then
                child.Parent = Head
            else
                child.Parent = p27
            end
        end

        AvatarBackupFolder:ClearAllChildren()
    end
    local GetChildren4 = p27.GetChildren
    for v235, v236 in pairs(GetChildren4(p27)) do

        if (v236:IsA("MeshPart") or v236:IsA("Part")) and v236.Name ~= "HumanoidRootPart" then
            v236.Transparency = 0
        end
    end
    if Humanoid then
        for _, v in ipairs({
			"BodyHeightScale",
			"BodyWidthScale",
			"BodyDepthScale",
			"HeadScale",
			"BodyTypeScale",
			"BodyProportionScale"
		}) do
            local v4 = Humanoid:FindFirstChild(v)

            if v4 then
                v4:Destroy()
            end
        end
    end
end
t2[71] = function(p28, p29)
    local Humanoid = p28:WaitForChild("Humanoid", 3)

    if not Humanoid then
        return
    end

    t2[70](p28)

    local AvatarBackupFolder = t2[13]:FindFirstChild("AvatarBackupFolder")

    if not AvatarBackupFolder then
        AvatarBackupFolder = Instance.new("Folder")
        AvatarBackupFolder.Name = "AvatarBackupFolder"
        AvatarBackupFolder.Parent = t2[13]
    end

    AvatarBackupFolder:ClearAllChildren()

    local v207 = p28:FindFirstChild("HiddenOriginalClothes") or Instance.new("Folder")

    v207.Name = "HiddenOriginalClothes"
    v207.Parent = p28

    for _, child in pairs(p28:GetChildren()) do
        local v210 = child:IsA("Accessory")

        if not v210 then
            v210 = child:IsA("Shirt") or (child:IsA("Pants") or child:IsA("ShirtGraphic"))
        end

        if v210 then
            child.Parent = AvatarBackupFolder
        end
    end

    local Head = p28:FindFirstChild("Head")

    if Head then
        local GetChildren = Head.GetChildren

        for _, v in pairs(GetChildren(Head)) do
            if v:IsA("Decal") and v.Name == "face" then
                v.Parent = AvatarBackupFolder
            end
        end
    end

    task.spawn(function()

        for v863, v864 in ipairs(p29) do

            local v865 = v864
            local ok, result = pcall(function()
                return game:GetObjects("rbxassetid://" .. v865)
            end)

            if not ok or (not result or not result[1]) then
                ok, result = pcall(function()
                    return t2[6]:LoadAsset((tonumber(v865))):GetChildren()
                end)
            end

            if ok and (result and result[1]) then
                local v868 = result[1]

                if v868:IsA("Accessory") then
                    v868.Name = "VisualCustomAcc_" .. v865

                    local Handle = v868:FindFirstChild("Handle")

                    if Handle then
                        Handle.CanCollide = false
                        Handle.Massless = true

                        local GetDescendants = v868.GetDescendants

                        for _, v in pairs(GetDescendants(v868)) do
                            if v:IsA("Script") or v:IsA("LocalScript") then
                                v:Destroy()
                            end
                        end

                        v868.Parent = p28

                        if not Handle:FindFirstChildWhichIsA("WrapLayer") then
                            local Attachment = Handle:FindFirstChildWhichIsA("Attachment")
                            local v874 = Attachment

                            if Attachment then
                                v874 = p28:FindFirstChild(Attachment.Name, true)
                            end

                            local v875 = v874 or nil
                            local Weld = Instance.new("Weld")

                            Weld.Name = "CustomAccWeld"

                            if v875 and Attachment then
                                Weld.Part0 = v875.Parent
                                Weld.Part1 = Handle
                                Weld.C0 = v875.CFrame
                                Weld.C1 = Attachment.CFrame
                            else
                                local v877 = p28:FindFirstChild("Head") or p28:FindFirstChild("HiddenOriginal_Head")

                                if v877 then
                                    Weld.Part0 = v877
                                    Weld.Part1 = Handle
                                    Weld.C0 = CFrame.new(0, v877.Size.Y / 2, 0)
                                end
                            end

                            if Weld.Part0 then
                                Weld.Parent = Handle
                            end
                        end
                    end
                elseif v868:IsA("Shirt") then
                    v868.Name = "VisualCustomShirt"
                    v868.Parent = p28
                elseif v868:IsA("Pants") then
                    v868.Name = "VisualCustomPants"
                    v868.Parent = p28
                elseif v868:IsA("ShirtGraphic") then
                    v868.Name = "VisualCustomGraphic"
                    v868.Parent = p28
                elseif v868:IsA("Folder") or v868:IsA("Model") then
                    for _, descendant in pairs(v868:GetDescendants()) do
                        if descendant:IsA("MeshPart") or descendant:IsA("Part") then
                            local descendantName = p28:FindFirstChild(descendant.Name)

                            if descendantName and descendantName:IsA("BasePart") then
                                descendantName.Transparency = 1

                                local descendantNameName = descendantName.Name
                                local v882 = false
                                local clone = descendant:Clone()

                                if descendantNameName == "Head" or (string.find(descendantNameName, "Torso") or descendantNameName == "HumanoidRootPart") then
                                    v882 = true
                                end

                                if v882 then
                                    clone.Name = "VisualFake_" .. descendantNameName
                                else
                                    descendantName.Name = "HiddenOriginal_" .. descendantNameName
                                    clone.Name = descendantNameName
                                    Instance.new("BoolValue", clone).Name = "IsVisualFake"
                                end

                                local GetDescendants = clone.GetDescendants

                                for _, v in pairs(GetDescendants(clone)) do
                                    if v:IsA("JointInstance") or (v:IsA("Script") or v:IsA("LocalScript")) then
                                        v:Destroy()
                                    end
                                end

                                clone.CanCollide = false
                                clone.Massless = true
                                clone.Parent = p28

                                local Weld = Instance.new("Weld")

                                Weld.Name = "LimbWeld"
                                Weld.Part0 = descendantName
                                Weld.Part1 = clone
                                Weld.C0 = CFrame.new()
                                Weld.C1 = CFrame.new()
                                Weld.Parent = clone
                            end
                        elseif descendant:IsA("Decal") and descendant.Name == "face" then
                            local v888 = p28:FindFirstChild("Head") or p28:FindFirstChild("HiddenOriginal_Head")

                            if v888 then
                                for _, child in pairs(v888:GetChildren()) do
                                    local v891 = child:IsA("Decal")

                                    if v891 then
                                        v891 = child.Name == "face"
                                    end

                                    if v891 then
                                        child.Transparency = 1
                                    end
                                end

                                local clone = descendant:Clone()

                                clone.Name = "VisualCustomFace"
                                clone.Parent = v888
                            end
                        end
                    end
                end
            end

            task.wait(0.05)
        end
        if Humanoid then
            Humanoid.AutomaticScalingEnabled = true

            local t61 = {
				BodyHeightScale = 1.2,
				BodyWidthScale = 0.95,
				BodyDepthScale = 1,
				HeadScale = 0.7,
				BodyTypeScale = 0.55,
				BodyProportionScale = 0.7
			}

            for k, v in pairs(t61) do
                local v896 = v
                local v897 = k
                local u898 = Humanoid:FindFirstChild(v897)

                if not u898 then
                    u898 = Instance.new("NumberValue")
                    u898.Name = v897
                    u898.Parent = Humanoid
                end

                local MinValue = u898:FindFirstChild("MinValue")

                if MinValue then
                    MinValue:Destroy()
                end

                local MaxValue = u898:FindFirstChild("MaxValue")

                if MaxValue then
                    MaxValue:Destroy()
                end

                local function v901()
                    if u898.Value ~= v896 then
                        u898.Value = v896
                    end
                end

                v901()
                u898.Changed:Connect(v901)
            end
        end
    end)
end
t2[13].CharacterAdded:Connect(function(character)
    if t2[17] then
        task.spawn(function()
            character:WaitForChild("Humanoid", 10)
            task.wait(1.5)
            t2[71](character, t2[17])
        end)
    end
end)
t2[72] = function(p30)
    local AntiFlingEnabled = t2[22].AntiFling.Enabled
    local TouchFlingEnabled = t2[22].TouchFling.Enabled

    if AntiFlingEnabled and t2[32].AntiFling then
        t2[32].AntiFling(false)
    end

    if TouchFlingEnabled and t2[32].TouchFling then
        t2[32].TouchFling(false)
    end

    t2[16] = true

    local Character = t2[13].Character
    local v245 = Character and Character:FindFirstChildOfClass("Humanoid")
    local v246 = v245 and v245.RootPart
    local Character2 = p30.Character
    local v248 = Character2 and Character2:FindFirstChildOfClass("Humanoid")
    local v249 = v248 and v248.RootPart
    local v250 = Character2 and Character2:FindFirstChild("Head")
    local v251 = Character2 and Character2:FindFirstChildOfClass("Accessory")
    local v252 = v251 and v251:FindFirstChild("Handle")

    if Character and (v245 and v246) then
        if v246.Velocity.Magnitude < 50 then
            getgenv().OldPos = v246.CFrame
        end

        if v248 and v248.Sit then
            t2[16] = false

            if AntiFlingEnabled and t2[32].AntiFling then
                t2[32].AntiFling(true)
            end

            if TouchFlingEnabled and t2[32].TouchFling then
                t2[32].TouchFling(true)
            end

            return
        end

        if v250 then
            workspace.CurrentCamera.CameraSubject = v250
        elseif v252 then
            workspace.CurrentCamera.CameraSubject = v252
        else
            workspace.CurrentCamera.CameraSubject = v248
        end

        if not Character2:FindFirstChildWhichIsA("BasePart") then
            t2[16] = false

            if AntiFlingEnabled then
                AntiFlingEnabled = t2[32].AntiFling
            end

            if AntiFlingEnabled then
                t2[32].AntiFling(true)
            end

            if TouchFlingEnabled and t2[32].TouchFling then
                t2[32].TouchFling(true)
            end

            return
        end

        local function v253(p31, p32, p33)
            v246.CFrame = CFrame.new(p31.Position) * p32 * p33
            Character:SetPrimaryPartCFrame(CFrame.new(p31.Position) * p32 * p33)
            v246.Velocity = Vector3.new(90000000, 900000000, 90000000)
            v246.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
        end
        local function v254(p34)
            local timestamp = tick()
            local n2 = 0

            if not (p34.Velocity.Magnitude > 500) and (p34.Parent == p30.Character and p30.Parent == t2[1]) then
                local Character3 = p30.Character

                if Character2 ~= not Character3 and not v248.Sit and not (v245.Health <= 0) then
                    if not (tick() > timestamp + 2) then
                    end
                end
            end

            repeat
                if not (v246 and v248) then
                    return
                end

                if p34.Velocity.Magnitude < 50 then
                    n2 += 100
                    v253(p34, CFrame.new(0, 1.5, 0) + v248.MoveDirection * p34.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                    task.wait()
                    v253(p34, CFrame.new(0, -1.5, 0) + v248.MoveDirection * p34.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                    task.wait()
                    v253(p34, CFrame.new(2.25, 1.5, -2.25) + v248.MoveDirection * p34.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                    task.wait()
                    v253(p34, CFrame.new(-2.25, -1.5, 2.25) + v248.MoveDirection * p34.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n2), 0, 0))
                    task.wait()
                else
                    v253(p34, CFrame.new(0, 1.5, v248.WalkSpeed), CFrame.Angles(1.5707963267948966, 0, 0))
                    task.wait()
                    v253(p34, CFrame.new(0, -1.5, -v248.WalkSpeed), CFrame.Angles(0, 0, 0))
                    task.wait()
                end

                local v909 = p34.Velocity.Magnitude > 500

                if not v909 then
                    v909 = p34.Parent ~= p30.Character

                    if not v909 then
                        v909 = p30.Parent ~= t2[1]

                        if not v909 then
                            v909 = true

                            local Character4 = p30.Character

                            if Character2 ~= not Character4 then
                                v909 = v248.Sit or (v245.Health <= 0 or tick() > timestamp + 2)
                            end
                        end
                    end
                end
            until v909
        end

        getgenv().FPDH = workspace.FallenPartsDestroyHeight
        workspace.FallenPartsDestroyHeight = (0/0)

        local BodyVelocity = Instance.new("BodyVelocity")

        BodyVelocity.Name = "EpixVel"
        BodyVelocity.Parent = v246
        BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
        BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
        v245:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

        if v249 and v250 then
            if (v249.CFrame.p - v250.CFrame.p).Magnitude > 5 then
                v254(v250)
            else
                v254(v249)
            end
        elseif v249 and not v250 then
            v254(v249)
        elseif not v249 and v250 then
            v254(v250)
        elseif not v249 and (not v250 and (v251 and v252)) then
            v254(v252)
        end

        BodyVelocity:Destroy()
        v245:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = v245

        if not ((v246.Position - getgenv().OldPos.p).Magnitude < 25) then
        end

        repeat
            v246.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
            v245:ChangeState("GettingUp")

            for _, child in pairs(Character:GetChildren()) do
                if child:IsA("BasePart") then
                    local vector3 = Vector3.new()
                    local vector3_2 = Vector3.new()

                    child.Velocity = vector3
                    child.RotVelocity = vector3_2
                end
            end

            task.wait()
        until (v246.Position - getgenv().OldPos.p).Magnitude < 25

        workspace.FallenPartsDestroyHeight = getgenv().FPDH
        t2[16] = false
    else
        t2[16] = false
    end

    if AntiFlingEnabled and t2[32].AntiFling then
        t2[32].AntiFling(true)
    end

    if TouchFlingEnabled and t2[32].TouchFling then
        t2[32].TouchFling(true)
    end
end
t2[73] = function(p35)
    if not p35 then
        return "Default"
    end
    local Character = p35.Character
    local Backpack = p35:FindFirstChild("Backpack")
    local u263 = false
    local u264 = false
    local function v265(p36)
        if not p36 then
            return
        end

        for _, child in ipairs(p36:GetChildren()) do
            if child:IsA("Tool") then
                local v914 = child.Name:lower()

                if string.find(v914, "knife") then
                    u263 = true
                elseif string.find(v914, "weapon") or string.find(v914, "gun") then
                    u264 = true
                end

                if u263 and u264 then
                    return
                end
            end
        end
    end
    v265(Character)
    v265(Backpack)
    if u263 then
        return "Knife"
    end
    if u264 then
        return "Weapon"
    end

    return "Default"
end
local function v71(p37)
    local v267 = p37.Name:lower()

    if (v267 == "gun" or (v267 == "dropgun" or (v267 == "gundrop" or v267 == "weapon"))) and (p37:IsA("BasePart") or p37:IsA("Model")) then
        local p37Parent = p37.Parent

        while p37Parent and p37Parent ~= workspace do
            if p37Parent:FindFirstChild("Humanoid") or p37Parent:IsA("Backpack") then
                return false
            end

            p37Parent = p37Parent.Parent
        end

        return true
    end

    return false
end
local function v72()
    for _, v in pairs(t2[34]) do
        if v.Highlight and v.Highlight.Parent then
            v.Highlight:Destroy()
        end

        if v.Billboard and v.Billboard.Parent then
            v.Billboard:Destroy()
        end
    end

    table.clear(t2[34])
end
t2[74] = Color3.fromRGB(255, 60, 60)
t2[75] = Color3.fromRGB(60, 160, 255)
t2[76] = Color3.fromRGB(50, 205, 50)
t2[77] = Color3.fromRGB(60, 160, 255)
t2[78] = Color3.fromRGB(150, 150, 150)
t2[79] = 0.35
local new = Color3.new
t1[2] = function(p38, p39)
    local Character = p38.Character
    local v289 = Character and Character:FindFirstChild("HumanoidRootPart")

    if not v289 then
        return
    end

    local v290 = v289:FindFirstChild("FogyHub_BoxESP") or Instance.new("BoxHandleAdornment")

    v290.Name = "FogyHub_BoxESP"
    v290.Size = Vector3.new(4, 5.5, 2.5)
    v290.Color3 = p39
    v290.AlwaysOnTop = true
    v290.ZIndex = 5
    v290.Transparency = 0.78
    v290.Adornee = v289
    v290.Parent = v289
end
t2[80] = new(1, 1, 1)
t2[81] = 0.35
t2[82] = function(p40, p41)
    local Character = p40.Character

    if not Character then
        return
    end

    local v297 = Character:FindFirstChild("FogyHub_ESP") or Character:FindFirstChild("Highlight")

    if not v297 then
        local Highlight = Instance.new("Highlight")

        Highlight.Name = "FogyHub_ESP"
        Highlight.FillColor = p41
        Highlight.OutlineColor = t2[80]
        Highlight.FillTransparency = t2[79]
        Highlight.OutlineTransparency = t2[81]
        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Highlight.Parent = Character

        return
    end

    v297.Name = "FogyHub_ESP"

    if p41 ~= v297.FillColor then
        v297.FillColor = p41
    end

    if v297.OutlineColor ~= t2[80] then
        v297.OutlineColor = t2[80]
    end

    if v297.FillTransparency ~= t2[79] then
        v297.FillTransparency = t2[79]
    end

    if v297.OutlineTransparency ~= t2[81] then
        v297.OutlineTransparency = t2[81]
    end

    if v297.DepthMode ~= Enum.HighlightDepthMode.AlwaysOnTop then
        v297.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end
t2[83] = function(p42)
    local v292 = p42 and p42.Character

    if v292 then
        local v293 = v292:FindFirstChild("FogyHub_ESP") or v292:FindFirstChild("Highlight")

        if v293 then
            v293:Destroy()
        end
    end
end
t2[84] = t1[2]
t2[85] = function(p43)
    local v303 = p43 and p43.Character
    local v304 = v303 and v303:FindFirstChild("HumanoidRootPart")
    local v305 = v304 and v304:FindFirstChild("FogyHub_BoxESP")

    if v305 then
        v305:Destroy()
    end
end
t2[86] = function()
    local ok, result = pcall(function()
        local GetPlayerData = t2[12]:FindFirstChild("GetPlayerData", true)

        return GetPlayerData and GetPlayerData:InvokeServer()
    end)
    local v308
    local v309
    local v310
    if ok and result then
        t2[18] = result

        for k, v in pairs(t2[18]) do
            local v313 = k

            if v.Role == "Murderer" then
                v308 = v313
            elseif v.Role == "Sheriff" then
                v310 = v313
            elseif v.Role == "Hero" then
                v309 = v313
            end
        end
    end
    t2[19] = v308
    t2[20] = v310
    t2[21] = v309
    local v314 = t2[22].MurdererESP.Enabled or (t2[22].SheriffESP.Enabled or t2[22].InnocentESP.Enabled)
    for _, player in ipairs(t2[1]:GetPlayers()) do
        if player ~= t2[13] then
            local Character = player.Character

            if Character then
                local v318 = false
                local v319 = false
                local v320 = false
                local v321 = t2[18] and t2[18][player.Name]
                local v322

                if v321 then
                    v322 = not v321.Killed and not v321.Dead
                else
                    local v323 = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

                    v322 = v323 and v323.Health > 0
                end

                local Backpack = player:FindFirstChild("Backpack")
                local v325 = Character:FindFirstChild("Knife") or Backpack and Backpack:FindFirstChild("Knife")
                local v326 = Character:FindFirstChild("Gun") or Character:FindFirstChild("Revolver")

                if not v326 then
                    v326 = Backpack and Backpack:FindFirstChild("Gun") or Backpack:FindFirstChild("Revolver")
                end

                local v327 = true

                if player.Name ~= t2[19] then
                    v327 = v325
                end

                if v327 then
                    v319 = true
                elseif player.Name == t2[20] or v326 and not v319 then
                    v318 = true
                elseif player.Name == t2[21] then
                    v320 = true
                end

                local v328 = false
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

                if HumanoidRootPart and (HumanoidRootPart.Position - Vector3.new(6, 505.2, -35)).Magnitude < 150 then
                    v328 = true
                end

                local v330 = t2[76]
                local v331 = false

                if v328 then
                    if v314 then
                        v330 = t2[76]
                        v331 = true
                    end
                elseif not v322 then
                    if v314 then
                        v330 = t2[78]
                        v331 = true
                    end
                elseif v319 then
                    v331 = t2[22].MurdererESP.Enabled
                    v330 = t2[74]
                elseif v318 then
                    v331 = t2[22].SheriffESP.Enabled
                    v330 = t2[75]
                elseif v320 then
                    v331 = t2[22].SheriffESP.Enabled
                    v330 = t2[77]
                else
                    v331 = t2[22].InnocentESP.Enabled
                    v330 = t2[76]
                end

                if v331 then
                    t2[82](player, v330)
                else
                    t2[83](player)
                end

                if t2[22].EspBoxes.Enabled and v331 then
                    t2[84](player, v330)
                else
                    t2[85](player)
                end
            else
                t2[83](player)
                t2[85](player)
            end
        end
    end
end
t2[87] = function(p44, p45, p46)
    local Character = t2[13].Character

    if not Character or not Character:FindFirstChild("HumanoidRootPart") then
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
    HumanoidRootPart.CFrame = p44

    if p46 then
        p46()
    end

    task.wait(p45)
    HumanoidRootPart.CFrame = HumanoidRootPartCFrame
    HumanoidRootPart.AssemblyLinearVelocity = AssemblyLinearVelocity
    CurrentCamera.CameraType = CameraType
    CurrentCamera.CFrame = CurrentCameraCFrame
end
t2[42] = nil
t2[88] = nil
t2[89] = nil
t2[90] = nil
pcall(function()
    t2[42] = mousemoveabs
end)
pcall(function()
    t2[88] = mouse1press
end)
pcall(function()
    t2[89] = mouse1release
end)
pcall(function()
    t2[90] = mouse1click
end)
pcall(function()
    if not t2[42] and (syn and syn.mousemoveabs) then
        t2[42] = syn.mousemoveabs
    end
end)
local function v74(p47, p48, p49)
    local v337 = p49 or 0.03

    if t2[88] and t2[89] then
        pcall(function()
            t2[88]()
        end)
        task.wait(v337)
        pcall(function()
            t2[89]()
        end)
    elseif t2[90] then
        pcall(function()
            t2[90]()
        end)
    end

    pcall(function()
        t2[5]:SendMouseButtonEvent(p47, p48, 0, true, game, 0)
        task.wait(v337)
        t2[5]:SendMouseButtonEvent(p47, p48, 0, false, game, 0)
    end)
end
t2[91] = t1[1]
t2[92] = function()
    local v271, v272, v273 = ipairs(t2[1]:GetPlayers())
    local v274, Character

    repeat
        repeat
            v273, v274 = v271(v272, v273)

            if not v273 then
                local v275, v276, v277 = ipairs(t2[1]:GetPlayers())
                local v278

                repeat
                    repeat
                        v277, v278 = v275(v276, v277)

                        if not v277 then
                            for _, player in ipairs(t2[1]:GetPlayers()) do
                                if not (player ~= t2[13] and t2[73](player) == "Knife") then
                                    continue
                                end

                                local Character5 = player.Character
                                local v282 = Character5 and Character5:FindFirstChildOfClass("Humanoid")

                                if v282 and v282.Health > 0 then
                                    return player, Character5
                                end
                            end

                            return nil, nil
                        end
                    until v278 ~= t2[13] and (v278.Character and v278.Character:FindFirstChild("Knife"))

                    local Humanoid = v278.Character:FindFirstChildOfClass("Humanoid")
                until Humanoid and Humanoid.Health > 0

                return v278, v278.Character
            end
        until v274 ~= t2[13] and (v274.Backpack and v274.Backpack:FindFirstChild("Knife"))

        Character = v274.Character

        local v285 = Character and Character:FindFirstChildOfClass("Humanoid")
    until v285 and v285.Health > 0

    return v274, Character
end
t2[93] = Instance.new("Folder")
local v75 = t2[93]
v75.Name = "KitagawaBulletTrails"
local v76 = t2[93]
v76.Parent = workspace
t2[94] = 0
t2[95] = 0
t2[96] = nil
t2[97] = 1.05
t2[98] = function(p50, p51, p52)
    if not t2[22].BulletTracker or not t2[22].BulletTracker.Enabled then
        return
    end

    if not p50 then
        return
    end

    if p52 then
        if p52 == t2[96] then
            return
        end
    elseif tick() - t2[94] < 0.3 then
        return
    end

    local Character = t2[13].Character
    local v353 = Character and Character:FindFirstChild("HumanoidRootPart")
    local v354 = p51 or v353 and v353.Position + Vector3.new(0, 1.15, 0)

    if not v354 then
        return
    end

    local color3_2 = Color3.fromRGB(t2[22].BulletTracker.R, t2[22].BulletTracker.G, t2[22].BulletTracker.B)
    local v356 = (t2[22].BulletTracker.Size or 15) / 55
    local color3_3 = Color3.new(math.min(color3_2.R + 0.25, 1), math.min(color3_2.G + 0.25, 1), (math.min(color3_2.B + 0.25, 1)))

    if (p50 - v354).Magnitude < 0.5 then
        return
    end

    local Part = Instance.new("Part")

    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Transparency = 1
    Part.Size = Vector3.new(0.05, 0.05, 0.05)
    Part.CFrame = CFrame.new(v354)
    Part.Parent = t2[93]

    local Part2 = Instance.new("Part")

    Part2.Anchored = true
    Part2.CanCollide = false
    Part2.CanQuery = false
    Part2.CanTouch = false
    Part2.Transparency = 1
    Part2.Size = Vector3.new(0.05, 0.05, 0.05)
    Part2.CFrame = CFrame.new(p50)
    Part2.Parent = t2[93]

    local Attachment = Instance.new("Attachment", Part)
    local Attachment2 = Instance.new("Attachment", Part2)
    local Beam = Instance.new("Beam")

    Beam.Attachment0 = Attachment
    Beam.Attachment1 = Attachment2
    Beam.Color = ColorSequence.new(color3_3)
    Beam.LightEmission = 1
    Beam.LightInfluence = 0
    Beam.FaceCamera = true
    Beam.Width0 = v356
    Beam.Width1 = v356 * 0.35
    Beam.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.05),
		NumberSequenceKeypoint.new(0.85, 0.35),
		NumberSequenceKeypoint.new(1, 1)
	})
    Beam.Parent = Part

    local Part3 = Instance.new("Part")

    Part3.Anchored = true
    Part3.CanCollide = false
    Part3.CanQuery = false
    Part3.CanTouch = false
    Part3.Shape = Enum.PartType.Ball
    Part3.Material = Enum.Material.Neon
    Part3.Color = color3_3
    Part3.Size = Vector3.new(v356 * 2.2, v356 * 2.2, v356 * 2.2)
    Part3.CFrame = CFrame.new(p50)
    Part3.Transparency = 0.2
    Part3.Parent = t2[93]
    task.spawn(function()
        local n3 = 0

        while n3 < 8 and Beam.Parent do
            n3 += task.wait()

            local v917 = n3 / 8
            local v918 = math.min(0.05 + v917 * 0.95, 1)

            Beam.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, v918),
				NumberSequenceKeypoint.new(0.85, (math.min(0.35 + v917 * 0.65, 1))),
				NumberSequenceKeypoint.new(1, 1)
			})

            if Part3.Parent then
                Part3.Transparency = math.min(0.2 + v917 * 0.8, 1)
            end
        end
    end)
    t2[7]:AddItem(Part, 8.5)
    t2[7]:AddItem(Part2, 8.5)
    t2[7]:AddItem(Part3, 8.5)
end
t1[1] = function()
end
t2[99] = nil
t2[100] = nil
t2[101] = nil
t2[101] = {
	notification = function(...)
end,
	dialog = function(...)
end,
	waitfordialog = function()
    return "Load"
end,
	closedialog = t1[1]
}
t2[102] = false
t2[103] = 2.8
t2[104] = 1
t2[105] = false
t2[106] = false
t2[107] = false
t2[100] = t2[13]
t2[99] = {}
t1[1] = function()
    local Character = t2[100].Character

    if not Character then
        return false
    end

    if Character:FindFirstChild("Gun") then
        return true
    end

    local Backpack = t2[100]:FindFirstChild("Backpack")
    local v393 = Backpack and Backpack:FindFirstChild("Gun") or t2[91](nil, Backpack)

    if not v393 then
        return false
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if Humanoid then
        pcall(function()
            Humanoid:EquipTool(v393)
        end)
    end

    return Character:WaitForChild("Gun", 2) ~= nil
end
t2[108] = function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Backpack:FindFirstChild("Knife") then
            return player
        end
    end

    local v375, v376, v377 = ipairs(game.Players:GetPlayers())
    local v378

    repeat
        v377, v378 = v375(v376, v377)

        if not v377 then
            if t2[99] then
                local v379
                local v380 = t2[99]
                repeat
                    local v381

                    v379, v381 = v380(nil, v379)

                    if not v379 then
                        return nil
                    end
                until v381.Role == "Murderer" and game.Players:FindFirstChild(v379)

                return game.Players:FindFirstChild(v379)
            end

            return nil
        end
    until v378.Character and v378.Character:FindFirstChild("Knife")

    return v378
end
t2[109] = function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Backpack:FindFirstChild("Gun") then
            return player
        end
    end

    local v384, v385, v386 = ipairs(game.Players:GetPlayers())
    local v387

    repeat
        v386, v387 = v384(v385, v386)

        if not v386 then
            if t2[99] then
                local v388
                local v389 = t2[99]
                repeat
                    local v390

                    v388, v390 = v389(nil, v388)

                    if not v388 then
                        return nil
                    end
                until v390.Role == "Sheriff" and game.Players:FindFirstChild(v388)

                return game.Players:FindFirstChild(v388)
            end

            return nil
        end
    until v387.Character and v387.Character:FindFirstChild("Gun")

    return v387
end
t2[110] = function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= t2[100] and player.Backpack:FindFirstChild("Gun") then
            return player
        end
    end

    local v366, v367, v368 = ipairs(game.Players:GetPlayers())
    local v369

    repeat
        v368, v369 = v366(v367, v368)

        if not v368 then
            if t2[99] then
                local v370
                local v371 = t2[99]
                repeat
                    local v372

                    v370, v372 = v371(nil, v370)

                    if not v370 then
                        return nil
                    end
                until v372.Role == "Sheriff" and game.Players:FindFirstChild(v370) and game.Players:FindFirstChild(v370) ~= t2[100]

                return game.Players:FindFirstChild(v370)
            end

            return nil
        end
    until v369 ~= t2[100] and v369.Character and v369.Character:FindFirstChild("Gun")

    return v369
end
pcall(function()
    if not game.ReplicatedStorage:WaitForChild("Remotes", 5) then
        t2[101].dialog("Not MM2", "Looks like this game isn't MM2. Do you want to load the module anyway?", {
			"Load",
			"No"
		})

        if t2[101].waitfordialog() == "No" then
            t2[101].closedialog()
            t2[101].notification("MM2 will not be loaded until you rejoin.", Color3.fromRGB(255, 0, 0), "x")

            return
        end

        t2[101].closedialog()

        return
    end

    game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gameplay"):WaitForChild("PlayerDataChanged", 5).OnClientEvent:Connect(function(p53)
        t2[99] = p53

        if t2[22].AutoFarmCoin.Enabled then
            SyncCoinFarmCountFromGame(true)
            UpdateFarmTracker()
        end
    end)
    pcall(function()
        local Gameplay = game.ReplicatedStorage.Remotes.Gameplay
        local CoinCollected = Gameplay:FindFirstChild("CoinCollected")

        if CoinCollected then
            CoinCollected.OnClientEvent:Connect(function(p54, p55, p56)
                local v1680 = tonumber(p55) or (tonumber(p54) or tonumber(p56))

                if v1680 then
                    ApplyCoinFarmCount(v1680, coinFarmRoundMax)
                    UpdateFarmTracker()
                end
            end)
        end

        local RoundStart = Gameplay:FindFirstChild("RoundStart")

        if RoundStart then
            RoundStart.OnClientEvent:Connect(function()
                coinFarmLootedCount = 0
                coinFarmRoundMax = 50
                UpdateFarmTracker()
            end)
        end
    end)
end)
t2[111] = function(p57, p58)
    local v398 = not t2[105]

    if t2[106] then
        t2[101].notification("Cancelling AI prediction, using basic prediction.")
        v398 = true
    end

    local v399 = p57

    pcall(function()
        p57 = p57.Character

        if not p57.Character then
            t2[101].notification("No murderer to predict position.")

            return
        end
    end)

    local UpperTorso = p57:FindFirstChild("UpperTorso")
    local Humanoid = p57:FindFirstChild("Humanoid")

    if not UpperTorso or not Humanoid then
        return Vector3.new(0, 0, 0), "Could not find the player's HumanoidRootPart."
    end

    local UpperTorsoPosition = UpperTorso.Position
    local v403 = t2[105]

    if v403 then
        v403 = not v398 and (not t2[107] and getgenv().YARHMNetwork_predictPos)
    end

    if v403 then
        if (UpperTorsoPosition - t2[100].Character:FindFirstChild("UpperTorso").Position).Magnitude > 20 then
            t2[101].notification("Calculating trajectory...")

            local v404 = getgenv().YARHMNetwork_predictPos(v399)

            task.spawn(function()
                task.wait(5)
            end)

            return v404
        end

        t2[101].notification("Murderer is too close for trajectory prediction. Reverting to basic prediction.")
    elseif t2[105] and not getgenv().YARHMNetwork.predictPos then
        t2[101].notification("YARHM AI Engine is not available. Reverting to basic prediction.")
    end

    Vector3.new()

    local AssemblyLinearVelocity = UpperTorso.AssemblyLinearVelocity
    local MoveDirection = Humanoid.MoveDirection
    local _ = UpperTorso.CFrame.LookVector

    if AssemblyLinearVelocity.Y > 0 then
    end

    return (UpperTorso.Position + AssemblyLinearVelocity * Vector3.new(0.75, 0.5, 0.75) * (p58 / 15) + MoveDirection * p58) * (t2[100]:GetNetworkPing() * 1000 * ((t2[104] - 1) * 0.01) + 1)
end
t2[112] = false
t2[113] = t1[1]
t2[114] = function(p59)
    if not p59 or not p59.Character then
        return false
    end

    if not t2[113]() then
        t2[101].notification("You don't have the gun..?")

        return false
    end

    local HumanoidRootPart = p59.Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        t2[101].notification("Could not find the murderer's HumanoidRootPart.")

        return
    end

    local v417 = t2[111](p59, t2[103])
    local v418 = t2[100].Character:FindFirstChild("RightHand") or t2[100].Character:FindFirstChild("Right Arm")
    local v419 = v418 and v418.Position or t2[100].Character.HumanoidRootPart.Position
    local v420 = if not t2[112] then {
		CFrame.new(v419),
		CFrame.new(v417)
	} else {
		CFrame.new(HumanoidRootPart.Position + Vector3.new(0, 1, 0)),
		CFrame.new(HumanoidRootPart.Position)
	}
    local timestamp = tick()

    if timestamp - t2[95] < t2[97] then
        return false
    end

    local v422 = tostring(timestamp) .. "_" .. tostring(p59.UserId)

    t2[100].Character:WaitForChild("Gun"):WaitForChild("Shoot"):FireServer(unpack(v420))
    t2[98](v417, v419, v422)

    return true
end
t2[115] = 0.08
task.spawn(function()
    while task.wait(0.2) do
        if t2[102] or wallShooting and t2[109]() == t2[100] then
            t2[113]()
        end
    end
end)
t2[116] = function()
    if t2[109]() == t2[100] and t2[102] then
        t2[101].notification("Auto-shooting started.")

        local _ = t2[102]

        repeat
            task.wait(t2[115])

            local v424 = t2[108]() or t2[110]()

            if not v424 then
                warn("[YARHM] > MM2 Autoshoot - No murderer.")
            else
                local HumanoidRootPartPosition = v424.Character.HumanoidRootPart.Position
                local HumanoidRootPart = t2[100].Character.HumanoidRootPart
                local v427 = (HumanoidRootPartPosition - HumanoidRootPart.Position).Unit * 50
                local raycastParams = RaycastParams.new()

                raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                raycastParams.FilterDescendantsInstances = { t2[100].Character }

                local raycastResult = workspace:Raycast(HumanoidRootPart.Position, v427, raycastParams)

                if not raycastResult or raycastResult.Instance.Parent == v424.Character then
                    t2[114](v424)
                end
            end
        until not t2[102]
    end
end
t1[1] = function(p60)
    local Character = t2[100].Character
    local v432 = Character and Character:FindFirstChild("HumanoidRootPart")
    local v433 = p60 and p60.Character
    local v434 = v433 and v433:FindFirstChild("HumanoidRootPart")
    if not v432 or not v434 then
        return false
    end
    local CurrentCamera = workspace.CurrentCamera
    local CFrame2 = v432.CFrame
    local AssemblyLinearVelocity = v432.AssemblyLinearVelocity
    local CurrentCameraCFrame
    local CameraType
    if CurrentCamera then
        CurrentCameraCFrame = CurrentCamera.CFrame
        CameraType = CurrentCamera.CameraType
        pcall(function()
            CurrentCamera.CameraType = Enum.CameraType.Scriptable
        end)
        CurrentCamera.CFrame = CurrentCameraCFrame
    end
    local ok = pcall(function()
        v432.CFrame = v434.CFrame * CFrame.new(0, 0, 6)
        v432.AssemblyLinearVelocity = Vector3.zero
        t2[2].Heartbeat:Wait()

        if CurrentCamera then
            CurrentCamera.CFrame = CurrentCameraCFrame
        end

        t2[114](p60)
        v432.CFrame = CFrame2
        v432.AssemblyLinearVelocity = AssemblyLinearVelocity
    end)
    pcall(function()
        v432.CFrame = CFrame2
        v432.AssemblyLinearVelocity = AssemblyLinearVelocity
    end)
    if CurrentCamera then
        CurrentCamera.CFrame = CurrentCameraCFrame
        pcall(function()
            CurrentCamera.CameraType = CameraType
        end)
    end

    return ok
end
t2[117] = false
t2[118] = 0
t2[119] = 3.5
t2[120] = function()
    local Backpack = t2[100]:FindFirstChild("Backpack")
    local Character = t2[100].Character

    if Character and Character:FindFirstChild("Gun") then
        return true
    end

    return t2[91](nil, Backpack) ~= nil
end
t2[121] = function()
    local v413 = t2[108]()

    if v413 and v413 ~= t2[100] then
        local v414 = v413.Character and v413.Character:FindFirstChildOfClass("Humanoid")

        if v414 and v414.Health > 0 then
            return v413
        end
    end

    return t2[92]()
end
t2[122] = t1[1]
t2[123] = 0
t2[124] = nil
t2[124] = function()
    t2[123] = t2[123] + 1
end
t2[125] = function()
    t2[124]()
    t2[102] = true
    task.spawn(function()
        while t2[102] and (t2[22].AutoShootMurder.Enabled and t2[15]) do
            if t2[109]() == t2[100] then
                t2[116]()

                return
            end

            task.wait(0.5)
        end
    end)
end
t1[1] = {
	key = "FortniteGriddy",
	label = "Fortnite Griddy",
	id = 124285036925320
}
local t62 = {
	key = "FortniteTrollDance",
	label = "Fortnite Troll Dance",
	id = 87560149954505
}
local t63 = {
	key = "KotoNaiDance",
	label = "Koto Nai Dance",
	id = 91927498467600
}
local t64 = {
	key = "TornadoEmote",
	label = "Tornado",
	id = 95466351204687
}
t2[126] = {
	t1[1],
	t62,
	t63,
	t64
}
t2[127] = {
	key = nil,
	track = nil,
	respawn = nil,
	keeper = 0
}
t1[1] = function()
    if t2[127].track then
        pcall(function()
            t2[127].track:Stop(0.12)
        end)
        pcall(function()
            t2[127].track:Destroy()
        end)
        t2[127].track = nil
    end
end
t2[128] = function()
    local Character = t2[13].Character

    if not Character then
        return nil
    end

    return Character:FindFirstChildOfClass("Humanoid")
end
t2[129] = function(p61)
    if not p61 then
        return nil
    end

    local Animator = p61:FindFirstChildOfClass("Animator")

    if not Animator then
        pcall(function()
            Animator = p61:WaitForChild("Animator", 4)
        end)
    end

    if not Animator then
        Animator = Instance.new("Animator")
        Animator.Parent = p61
    end

    return Animator
end
t2[130] = function(p62)
    local v448 = "rbxassetid://" .. tostring(p62)
    local Animation = Instance.new("Animation")

    Animation.AnimationId = v448
    pcall(function()
        local GetObjects = game.GetObjects

        if type(GetObjects) ~= "function" then
            GetObjects = getgenv and getgenv().getobjects or (getgenv().GetObjects or (rawget(_G, "getobjects") or rawget(_G, "GetObjects")))
        end

        if type(GetObjects) == "function" then
            local v925 = GetObjects(v448)

            if type(v925) == "table" then
                for _, v in ipairs(v925) do
                    if v:IsA("Animation") then
                        Animation = v:Clone()
                        Animation.AnimationId = v448

                        return Animation
                    end

                    local Animation2 = v:FindFirstChildWhichIsA("Animation", true)

                    if Animation2 then
                        Animation = Animation2:Clone()
                        Animation.AnimationId = v448

                        return Animation
                    end
                end
            end
        end
    end)

    return Animation
end
t2[131] = nil
t2[131] = t1[1]
t2[132] = function(p63)
    local v451 = t2[128]()
    if not v451 or v451.Health <= 0 then
        return false
    end
    t2[131]()
    local v452 = t2[129](v451)
    if not v452 then
        return false
    end
    local v453 = t2[130](p63)
    local u454
    local ok, result = pcall(function()
        return v452:LoadAnimation(v453)
    end)
    if ok and result then
        u454 = result
    end
    if not u454 then
        local ok2, result2 = pcall(function()
            return v451:LoadAnimation(v453)
        end)

        if ok2 and result2 then
            u454 = result2
        end
    end
    if not u454 then
        return false
    end
    u454.Looped = true
    pcall(function()
        u454.Priority = Enum.AnimationPriority.Action4
    end)
    u454:Play(0.12, 1, 1)
    t2[127].track = u454

    return u454.IsPlaying == true
end
local function v80(p64, p65)
    t2[127].keeper = t2[127].keeper + 1
    t2[127].key = nil
    t2[131]()

    if t2[127].respawn then
        t2[127].respawn:Disconnect()
        t2[127].respawn = nil
    end

    t2[127].key = p64
    t2[127].keeper = t2[127].keeper + 1

    local keeper = t2[127].keeper

    task.spawn(function()
        if not t2[128]() then
            (t2[13].Character or t2[13].CharacterAdded:Wait()):WaitForChild("Humanoid", 8)
        end

        t2[132](p65)
    end)
    t2[127].respawn = t2[13].CharacterAdded:Connect(function()
        task.wait(0.8)

        if t2[127].key == p64 and t2[127].keeper == keeper then
            t2[132](p65)
        end
    end)
    task.spawn(function()
        while t2[127].key == p64 and t2[127].keeper == keeper do
            local track = t2[127].track

            if (not track or not track.IsPlaying) and not t2[132](p65) then
                task.wait(0.5)
            end

            task.wait(0.35)
        end
    end)
end
local function v81(p66, p67, p68)
    if p68 then
        for _, v in ipairs(t2[126]) do
            if p66 ~= v.key and (t2[22][v.key] and t2[22][v.key].Enabled) then
                t2[22][v.key].Enabled = false

                if t2[32][v.key] then
                    t2[32][v.key](false)
                end
            end
        end

        v80(p66, p67)

        return
    end

    if p66 == t2[127].key or not t2[127].key then
        t2[127].keeper = t2[127].keeper + 1
        t2[127].key = nil
        t2[131]()

        if t2[127].respawn then
            t2[127].respawn:Disconnect()
            t2[127].respawn = nil
        end
    end
end
t2[133] = {
	["Love Cursor"] = "11726322336",
	["Anime Cursor"] = "2207556771",
	["Tyanka Cursor"] = "6828124952",
	["Anime Love Cursor"] = "5446957620",
	["Tyanka Cursor 2"] = "97196679470262",
	["Pixel Cursor"] = "973819997",
	["Default Dot"] = "417446600"
}
t2[134] = {
	"Love Cursor",
	"Anime Cursor",
	"Tyanka Cursor",
	"Anime Love Cursor",
	"Tyanka Cursor 2",
	"Pixel Cursor",
	"Default Dot"
}
t2[135] = ""
t2[136] = nil
t2[137] = function()
    if not t2[22].CustomCrosshair.Enabled then
        return ""
    end

    local v467 = t2[22].CrosshairStyle or "Love Cursor"

    return "rbxassetid://" .. tostring(t2[133][v467] or t2[133]["Default Dot"])
end
t2[138] = nil
t1[1] = function()
    pcall(function()
        local Mouse = t2[13]:GetMouse()

        if not Mouse then
            return
        end

        if t2[22].CustomCrosshair.Enabled then
            t2[135] = t2[137]()
            Mouse.Icon = t2[135]
            t2[3].MouseIconEnabled = true
            t2[138]()

            return
        end

        t2[135] = ""

        if t2[136] then
            pcall(function()
                t2[136]:Disconnect()
            end)
            t2[136] = nil
        end

        Mouse.Icon = ""
    end)
end
t2[138] = function()
    if t2[136] then
        pcall(function()
            t2[136]:Disconnect()
        end)
        t2[136] = nil
    end

    pcall(function()
        local Mouse = t2[13]:GetMouse()

        if Mouse and t2[22].CustomCrosshair.Enabled then
            t2[136] = Mouse:GetPropertyChangedSignal("Icon"):Connect(function()
                if not t2[22].CustomCrosshair.Enabled or t2[135] == "" then
                    return
                end

                if Mouse.Icon ~= t2[135] then
                    Mouse.Icon = t2[135]
                end
            end)
        end
    end)
end
t2[139] = t1[1]
task.spawn(function()
    while not game:IsLoaded() do
        task.wait()
    end

    while not game:GetService("CoreGui") or (not t2[13] or not t2[13]:FindFirstChild("PlayerGui")) do
        task.wait()
    end

    t2[139]()
end)
t1[1] = t2[2].RenderStepped
t1[1]:Connect(function()
    if not t2[22].CustomCrosshair.Enabled then
        return
    end

    pcall(function()
        local Mouse = t2[13]:GetMouse()

        if not Mouse then
            return
        end

        if t2[135] == "" then
            t2[135] = t2[137]()
        end

        if Mouse.Icon ~= t2[135] then
            Mouse.Icon = t2[135]
        end

        if not t2[3].MouseIconEnabled then
            t2[3].MouseIconEnabled = true
        end
    end)
end)
t1[1] = t2[3].InputEnded
t1[1]:Connect(function(p69)
    if not t2[22].CustomCrosshair.Enabled then
        return
    end

    if p69.UserInputType == Enum.UserInputType.MouseButton1 or p69.UserInputType == Enum.UserInputType.MouseButton2 then
        task.defer(t2[139])
    end
end)
t1[1] = t2[13].CharacterAdded
t1[1]:Connect(function()
    task.defer(t2[139])
end)
local t65 = {
	assetId = 90816193741219,
	scale = 0.34
}
t1[1] = {
	assetId = 108484995254710,
	scale = 0.34
}
t1[1] = {
	WingsAura = t65,
	StarrBallAura = t1[1],
	RedAura = {
		assetId = 81562119173687,
		scale = 0.34
	}
}
t2[140] = t1[1]
t2[141] = Instance.new("Folder")
t2[141].Name = "KitagawaJumpCircles"
local v83 = t2[141]
t1[1] = function(p70, p71)
    if not p71 then
        return
    end

    local v471 = p71.Position - Vector3.new(0, p71.Size.Y * 0.5 + 0.05, 0)

    if p70 == "Neon" then
        local Part = Instance.new("Part")

        Part.Name = "JumpCircleNeon"
        Part.Shape = Enum.PartType.Cylinder
        Part.Size = Vector3.new(0.08, 1.6, 1.6)
        Part.CFrame = CFrame.new(v471) * CFrame.Angles(0, 0, 1.5707963267948966)
        Part.Material = Enum.Material.Neon
        Part.Color = Color3.fromRGB(0, 195, 255)
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.Transparency = 0.15
        Part.Parent = t2[141]

        local v473 = t2[4]
        local tweenInfo = TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local new2 = Vector3.new
        local Create = v473.Create
        local v477 = new2(0.08, 9, 9)
        local color3_4 = Color3.fromRGB(120, 230, 255)

        Create(v473, Part, tweenInfo, {
			Size = v477,
			Transparency = 1,
			Color = color3_4
		}):Play()
        t2[7]:AddItem(Part, 0.65)

        return
    end

    if p70 == "Shock" then
        for i = 1, 2 do
            local Part = Instance.new("Part")

            Part.Name = "JumpCircleShock"
            Part.Shape = Enum.PartType.Cylinder
            Part.Size = Vector3.new(0.06, i * 0.4 + 1.2, i * 0.4 + 1.2)
            Part.CFrame = CFrame.new(v471) * CFrame.Angles(0, 0, 1.5707963267948966)
            Part.Material = Enum.Material.Neon
            Part.Color = i == 1 and Color3.fromRGB(255, 90, 40) or Color3.fromRGB(255, 200, 60)
            Part.Anchored = true
            Part.CanCollide = false
            Part.CanQuery = false
            Part.CanTouch = false
            Part.Transparency = 0.2
            Part.Parent = t2[141]
            task.delay((i - 1) * 0.06, function()
                if Part.Parent then
                    local v933 = t2[4]
                    local v934 = Part
                    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                    local new3 = Vector3.new
                    local v937 = i
                    local v938 = i

                    v933:Create(v934, tweenInfo, {
						Size = new3(0.06, 10 + v937, 10 + v938),
						Transparency = 1
					}):Play()
                end
            end)
            t2[7]:AddItem(Part, 0.7)
        end

        return
    end

    if p70 == "Pulse" then
        local Part = Instance.new("Part")

        Part.Name = "JumpCirclePulse"
        Part.Shape = Enum.PartType.Cylinder
        Part.Size = Vector3.new(0.1, 2, 2)
        Part.CFrame = CFrame.new(v471) * CFrame.Angles(0, 0, 1.5707963267948966)
        Part.Material = Enum.Material.ForceField
        Part.Color = Color3.fromRGB(170, 80, 255)
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanQuery = false
        Part.CanTouch = false
        Part.Transparency = 0.05
        Part.Parent = t2[141]

        local SpecialMesh = Instance.new("SpecialMesh", Part)

        SpecialMesh.MeshType = Enum.MeshType.Sphere
        SpecialMesh.Scale = Vector3.new(1, 0.04, 1)

        local v483 = t2[4]
        local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        local vector3 = Vector3.new(0.1, 11, 11)
        local color3_5 = Color3.fromRGB(220, 140, 255)

        v483:Create(Part, tweenInfo, {
			Size = vector3,
			Transparency = 1,
			Color = color3_5
		}):Play()
        task.spawn(function()
            local timestamp = tick()

            while Part.Parent and tick() - timestamp < 0.6 do
                Part.CFrame = CFrame.new(v471) * CFrame.Angles(0, math.rad((tick() - timestamp) * 420), 1.5707963267948966)
                task.wait()
            end
        end)
        t2[7]:AddItem(Part, 0.7)
    end
end
v83.Parent = workspace
t2[142] = {
	"JumpCircleNeon",
	"JumpCircleShock",
	"JumpCirclePulse"
}
local function v84(p72, p73)
    local t66 = {}

    for _, v in ipairs(p72.Size.Keypoints) do
        t66[#t66 + 1] = NumberSequenceKeypoint.new(v.Time, v.Value * p73, v.Envelope * p73)
    end

    p72.Size = NumberSequence.new(t66)
    p72.Speed = NumberRange.new(p72.Speed.Min * p73, p72.Speed.Max * p73)

    if typeof(p72.Acceleration) == "Vector3" then
        p72.Acceleration = p72.Acceleration * p73
    end
end
t2[143] = function(p74)
    local u491
    pcall(function()
        local Objects = game:GetObjects("rbxassetid://" .. tostring(p74))

        for _, v in ipairs(Objects) do
            if v:IsA("Model") or (v:IsA("Folder") or v:IsA("Tool")) then
                u491 = v

                break
            end
        end

        if not u491 and Objects[1] then
            u491 = Objects[1]
        end
    end)
    if not u491 then
        pcall(function()
            u491 = t2[6]:LoadAsset(p74)
        end)
    end

    return u491
end
t2[144] = function(p75, p76)
    if not p75:IsA("BasePart") then
        return false
    end

    local Model = p75:FindFirstAncestorOfClass("Model")

    if not Model or Model == p76 then
        return false
    end

    return Model:FindFirstChildOfClass("Humanoid") ~= nil
end
t2[145] = function(p77)
    local Character = t2[13].Character

    if not Character then
        return
    end

    local v494 = "KitagawaAuraAtt_" .. p77
    local v495 = "KitagawaAura_" .. p77

    for _, descendant in ipairs(Character:GetDescendants()) do
        if v495 == descendant.Name or v494 == string.sub(descendant.Name, 1, #v494) then
            descendant:Destroy()
        end
    end
end
t2[146] = nil
t2[146] = function(p78)
    local v509 = t2[140][p78]
    local v510 = not v509
    local v511 = t2[22][p78]

    if not v510 then
        v510 = not v511 or not v511.Enabled
    end

    if v510 then
        return
    end

    local Character = t2[13].Character

    if not Character then
        return
    end

    t2[145](p78)

    local v513 = Character:FindFirstChild("UpperTorso") or (Character:FindFirstChild("Torso") or Character:FindFirstChild("HumanoidRootPart"))

    if not v513 then
        return
    end

    local v514 = t2[143](v509.assetId)

    if not v514 then
        return
    end

    local Folder = Instance.new("Folder")

    Folder.Name = "KitagawaAura_" .. p78
    Folder.Parent = v513

    local n4 = 0
    local descendants = v514:GetDescendants()

    table.insert(descendants, v514)

    for _, v in ipairs(descendants) do
        if v:IsA("ParticleEmitter") then
            n4 += 1

            local Attachment = Instance.new("Attachment")

            Attachment.Name = "KitagawaAuraAtt_" .. p78 .. "_" .. n4

            local vParent = v.Parent

            if vParent:IsA("Attachment") then
                Attachment.Position = vParent.Position
                Attachment.Orientation = vParent.Orientation
            elseif vParent:IsA("BasePart") then
                Attachment.CFrame = v513.CFrame:ToObjectSpace(vParent.CFrame)
            end

            Attachment.Parent = v513

            local clone = v:Clone()

            v84(clone, v509.scale)
            clone.Rate = math.max(3, clone.Rate * 0.55)
            clone.Enabled = true
            clone.Parent = Attachment
        elseif v:IsA("BasePart") and not t2[144](v, Character) and v:FindFirstChildWhichIsA("ParticleEmitter", true) then
            local clone = v:Clone()
            for v526, v527 in ipairs(clone:GetDescendants()) do

                if v527:IsA("BasePart") then
                    v527.Anchored = false
                    v527.CanCollide = false
                    v527.CanQuery = false
                    v527.CanTouch = false
                    v527.Massless = true

                    if v527.Transparency < 1 then
                        v527.Transparency = math.max(v527.Transparency, 0.95)
                    end
                elseif v527:IsA("ParticleEmitter") then
                    v84(v527, v509.scale)
                    v527.Enabled = true
                elseif v527:IsA("Humanoid") or (v527:IsA("Script") or v527:IsA("LocalScript")) then
                    v527:Destroy()
                end
            end
            if clone:IsA("BasePart") then
                clone.Anchored = false
                clone.CanCollide = false
                clone.Massless = true
                clone.Transparency = 1
            end
            clone.Parent = Folder
            local v528 = clone:IsA("BasePart") and clone or clone:FindFirstChildWhichIsA("BasePart")
            if v528 then
                v528.CFrame = v513.CFrame

                local WeldConstraint = Instance.new("WeldConstraint")

                WeldConstraint.Part0 = v513
                WeldConstraint.Part1 = v528
                WeldConstraint.Parent = v528
            else
                clone:Destroy()
            end
        end
    end

    pcall(function()
        v514:Destroy()
    end)

    if n4 == 0 and #Folder:GetChildren() == 0 then
        Folder:Destroy()
    end
end
t2[147] = function(p79, p80)
    if p80 then
        t2[146](p79)

        return
    end

    t2[145](p79)
end
t2[148] = function()
    for k in pairs(t2[140]) do
        local v533 = k

        if t2[22][v533] and t2[22][v533].Enabled then
            t2[146](v533)
        end
    end
end
t2[149] = 0
t2[150] = t1[1]
t1[1] = function(p81)
    local Humanoid = p81:WaitForChild("Humanoid", 8)

    if not Humanoid then
        return
    end

    Humanoid.StateChanged:Connect(function(_, newState)
        if newState ~= Enum.HumanoidStateType.Jumping then
            return
        end

        local v945 = if not t2[22].JumpCircleNeon.Enabled then if not t2[22].JumpCircleShock.Enabled then if not t2[22].JumpCirclePulse.Enabled then nil else "Pulse" else "Shock" else "Neon"

        if not v945 then
            return
        end

        if tick() - t2[149] < 0.12 then
            return
        end

        local HumanoidRootPart = p81:FindFirstChild("HumanoidRootPart")

        if HumanoidRootPart then
            t2[150](v945, HumanoidRootPart)
        end
    end)
end
t2[151] = function(p83, p84)
    if not p84 then
        return
    end

    for _, v in ipairs(t2[142]) do
        if v ~= p83 and (t2[22][v].Enabled and t2[32][v]) then
            t2[32][v](false)
        end
    end
end
t2[152] = t1[1]
t1[1] = t2[13].CharacterAdded
t1[1]:Connect(function(p85)
    p85:WaitForChild("HumanoidRootPart", 10)
    task.wait(0.5)
    t2[148]()
    t2[152](p85)
end)
t1[1] = t2[13]
if t1[1].Character then
    task.spawn(function()
        t2[148]()
        t2[152](t2[13].Character)
    end)
end
t2[153] = nil
t2[154] = nil
t1[1] = {}
t2[155] = {
	VisibleHighlight = nil,
	HiddenHighlight = nil,
	ChamsFolder = nil,
	PartBackups = {},
	WeaponBackups = t1[1],
	WeaponHighlights = {},
	DescendantConn = nil,
	ToolAddedConn = nil,
	ToolRemovedConn = nil,
	RefreshToken = 0
}
t1[1] = function(p86, p87, p88, p89, p90)
    local v559 = not p86

    if not v559 then
        v559 = not p86:IsA("BasePart")
    end

    if v559 then
        return
    end

    if p90 and p86.Name == "HumanoidRootPart" then
        return
    end

    if p86.Name == "LeftFoot" or p86.Name == "RightFoot" then
        return
    end

    if p86.Transparency >= 1 then
        return
    end

    if p89[p86] then
        return
    end

    local p86Material = p86.Material
    local p86Color = p86.Color
    local p86Transparency = p86.Transparency

    p89[p86] = {
		Material = p86Material,
		Color = p86Color,
		Transparency = p86Transparency
	}
    p86.Material = Enum.Material.ForceField
    p86.Color = p87:Lerp(p88, 0.35)

    if p86.Transparency > 0.85 then
        p86.Transparency = p86.Transparency

        return
    end

    p86.Transparency = math.min(p86.Transparency, 0.08)
end
t2[156] = function()
    if not t2[22].ChamsColor.Adaptive then
        local color3_6 = Color3.fromRGB(t2[22].ChamsColor.R, t2[22].ChamsColor.G, t2[22].ChamsColor.B)

        return color3_6:Lerp(Color3.new(1, 1, 1), 0.45), color3_6, 0.32
    end

    local v546 = t2[22].CustomSky.Mode or "Tropical"
    local v547 = t2[61][v546] or t2[61].Tropical
    local Color = v547.Color
    local color3_7 = Color3.new(math.clamp(Color.R * 0.45 + 0.25, 0, 1), math.clamp(Color.G * 0.45 + 0.25, 0, 1), (math.clamp(Color.B * 0.45 + 0.25, 0, 1)))

    if not t2[22].CustomSky.Enabled and not t2[22].CustomAtmosphere.Enabled then
        Color = t2[37]
        color3_7 = Color3.fromRGB(90, 190, 255)
    end

    if t2[22].RedAura.Enabled then
        Color = Color3.fromRGB(255, 45, 75)
        color3_7 = Color3.fromRGB(255, 130, 145)
    elseif t2[22].WingsAura.Enabled then
        Color = Color3.fromRGB(130, 200, 255)
        color3_7 = Color3.fromRGB(200, 235, 255)
    elseif t2[22].StarrBallAura.Enabled then
        Color = Color3.fromRGB(255, 210, 70)
        color3_7 = Color3.fromRGB(255, 240, 160)
    end

    if t2[22].JumpCircleNeon.Enabled then
        Color = Color:Lerp(Color3.fromRGB(255, 110, 45), 0.35)
        color3_7 = color3_7:Lerp(Color3.fromRGB(255, 190, 70), 0.25)
    elseif t2[22].JumpCircleShock.Enabled then
        Color = Color:Lerp(Color3.fromRGB(255, 175, 55), 0.3)
        color3_7 = color3_7:Lerp(Color3.fromRGB(255, 220, 120), 0.25)
    elseif t2[22].JumpCirclePulse.Enabled then
        Color = Color:Lerp(Color3.fromRGB(175, 85, 255), 0.35)
        color3_7 = color3_7:Lerp(Color3.fromRGB(220, 150, 255), 0.25)
    end

    if t2[22].BulletTracker.Enabled then
        local color3_8 = Color3.fromRGB(t2[22].BulletTracker.R, t2[22].BulletTracker.G, t2[22].BulletTracker.B)

        Color = Color:Lerp(color3_8, 0.22)
        color3_7 = color3_7:Lerp(color3_8, 0.18)
    end

    if t2[22].CustomAtmosphere.Enabled then
        local v551 = t2[22].CustomAtmosphere.Density or 0.35
        local v552 = t2[22].CustomAtmosphere.Haze or 0.9

        Color = Color:Lerp(Color3.fromRGB(255, 255, 255), math.clamp(v551 * 0.12, 0, 0.18))
        color3_7 = color3_7:Lerp(v547.Color, math.clamp(v552 * 0.08, 0, 0.2))
    end

    local n5 = 0.32

    if t2[22].CustomAtmosphere.Enabled then
        n5 = math.clamp(0.22 + (t2[22].CustomAtmosphere.Density or 0.35) * 0.28, 0.22, 0.55)
    end

    return color3_7, Color, n5
end
t2[157] = function()

    local s5 = "gethui"
    local u541
    pcall(function()
        u541 = _G[s5]
    end)
    local v542
    if type(u541) == "function" then
        v542 = u541
    else
        v542 = nil
    end
    if v542 then
        local ok, result = pcall(v542)

        if ok and result then
            return result
        end
    end

    return t2[8]
end
t2[158] = function()
    for k, v in pairs(t2[155].PartBackups) do
        local v565 = k
        local v566 = v

        if v565 and (v565.Parent and v566) then
            pcall(function()
                v565.Material = v566.Material
                v565.Color = v566.Color
                v565.Transparency = v566.Transparency
            end)
        end
    end

    t2[155].PartBackups = {}
end
t2[159] = nil
t2[160] = function()
    for k, v in pairs(t2[155].WeaponBackups) do
        local v539 = v

        if k and (k.Parent and v539) then
            pcall(function()
                k.Material = v539.Material
                k.Color = v539.Color
                k.Transparency = v539.Transparency
            end)
        end
    end

    t2[155].WeaponBackups = {}
end
t2[161] = nil
t1[2] = function()
    for _, v in pairs(t2[155].WeaponHighlights) do
        t2[161](v)
    end

    t2[155].WeaponHighlights = {}
end
t2[161] = function(p91)
    if not p91 then
        return
    end

    if typeof(p91) == "Instance" then
        pcall(function()
            p91:Destroy()
        end)

        return
    end

    if type(p91) == "table" then
        for _, v in pairs(p91) do
            local v570 = v

            if v570 and v570.Parent then
                pcall(function()
                    v570:Destroy()
                end)
            end
        end
    end
end
t2[162] = t1[2]
t2[154] = function()
    t2[162]()
    t2[160]()
end
t2[163] = function()
    if t2[155].DescendantConn then
        pcall(function()
            t2[155].DescendantConn:Disconnect()
        end)
        t2[155].DescendantConn = nil
    end

    if t2[155].ToolAddedConn then
        pcall(function()
            t2[155].ToolAddedConn:Disconnect()
        end)
        t2[155].ToolAddedConn = nil
    end

    if t2[155].ToolRemovedConn then
        pcall(function()
            t2[155].ToolRemovedConn:Disconnect()
        end)
        t2[155].ToolRemovedConn = nil
    end

    t2[155].RefreshToken = t2[155].RefreshToken + 1

    if t2[155].VisibleHighlight then
        pcall(function()
            t2[155].VisibleHighlight:Destroy()
        end)
        t2[155].VisibleHighlight = nil
    end

    if t2[155].HiddenHighlight then
        pcall(function()
            t2[155].HiddenHighlight:Destroy()
        end)
        t2[155].HiddenHighlight = nil
    end

    if t2[155].ChamsFolder then
        pcall(function()
            t2[155].ChamsFolder:Destroy()
        end)
        t2[155].ChamsFolder = nil
    end

    t2[158]()

    if not t2[22].WeaponChams.Enabled then
        t2[154]()
    end

    local Character = t2[13].Character

    if Character then
        for _, v in ipairs({
			"KitagawaChamsVisible",
			"KitagawaChamsHidden",
			"KitagawaChamsLOS",
			"KitagawaChamsOCC",
			"KitagawaChamsOcclusion"
		}) do
            local v5 = Character:FindFirstChild(v)

            if v5 then
                pcall(function()
                    v5:Destroy()
                end)
            end
        end
    end
end
t2[159] = t1[1]
t2[164] = function(p92, p93, p94)
    t2[158]()

    local GetDescendants = p92.GetDescendants

    for _, v in ipairs(GetDescendants(p92)) do
        if v:IsA("BasePart") and not v:FindFirstAncestorOfClass("Tool") then
            t2[159](v, p93, p94, t2[155].PartBackups, true)
        end
    end
end
t2[165] = nil
t1[1] = function(p95)
    if not p95 then
        return
    end

    if not t2[22].WeaponChams.Enabled then
        t2[154]()

        return
    end

    t2[162]()

    local GetChildren = p95.GetChildren

    for _, v in ipairs(GetChildren(p95)) do
        if v:IsA("Tool") then
            t2[165](v)
        end
    end
end
t2[165] = function(p96)
    if not t2[22].WeaponChams.Enabled or (not p96 or not p96:IsA("Tool")) then
        return
    end

    local v576, v577, v578 = t2[156]()

    t2[161](t2[155].WeaponHighlights[p96])

    local WeaponHighlights = t2[155].WeaponHighlights
    local GetDescendants = p96.GetDescendants

    WeaponHighlights[p96] = nil

    for _, v in ipairs(GetDescendants(p96)) do
        if v:IsA("BasePart") and t2[155].WeaponBackups[v] then
            local v583 = t2[155].WeaponBackups[v]

            v.Material = v583.Material
            v.Color = v583.Color
            v.Transparency = v583.Transparency
            t2[155].WeaponBackups[v] = nil
        end
    end

    local v584 = CreateChamsHighlight("KitagawaWeaponHidden_" .. p96.Name, p96, Enum.HighlightDepthMode.AlwaysOnTop)

    v584.FillColor = v577
    v584.OutlineColor = v577:Lerp(Color3.new(1, 1, 1), 0.2)
    v584.FillTransparency = v578
    v584.OutlineTransparency = 0

    local v585 = CreateChamsHighlight("KitagawaWeaponVisible_" .. p96.Name, p96, Enum.HighlightDepthMode.Occluded)

    v585.FillColor = v576
    v585.OutlineColor = v576:Lerp(Color3.new(1, 1, 1), 0.3)
    v585.FillTransparency = 0.55
    v585.OutlineTransparency = 0.1
    t2[155].WeaponHighlights[p96] = {
		hidden = v584,
		visible = v585
	}

    local GetDescendants2 = p96.GetDescendants

    for _, v in ipairs(GetDescendants2(p96)) do
        if v:IsA("BasePart") then
            t2[159](v, v577, v576, t2[155].WeaponBackups, false)
        end
    end

    if not p96:GetAttribute("KitagawaWeaponChamsHook") then
        p96:SetAttribute("KitagawaWeaponChamsHook", true)
        p96.DescendantAdded:Connect(function(descendant)
            if not t2[22].WeaponChams.Enabled or not descendant:IsA("BasePart") then
                return
            end

            local v948, v949 = t2[156]()

            t2[159](descendant, v949, v948, t2[155].WeaponBackups, false)
            t2[153]()
        end)
    end
end
t2[166] = t1[1]
t2[167] = function(p97)
    if p97 then
        t2[166](t2[13].Character)

        return
    end

    t2[154]()
end
t2[168] = function(p98)
    if t2[155].ToolAddedConn then
        pcall(function()
            t2[155].ToolAddedConn:Disconnect()
        end)
        t2[155].ToolAddedConn = nil
    end

    if t2[155].ToolRemovedConn then
        pcall(function()
            t2[155].ToolRemovedConn:Disconnect()
        end)
        t2[155].ToolRemovedConn = nil
    end

    if not p98 or not t2[22].WeaponChams.Enabled then
        return
    end

    t2[155].ToolAddedConn = p98.ChildAdded:Connect(function(child)
        if child:IsA("Tool") and t2[22].WeaponChams.Enabled then
            task.defer(function()
                if child.Parent == p98 and t2[22].WeaponChams.Enabled then
                    local v1681 = child

                    t2[165](v1681)
                end
            end)
        end
    end)
    t2[155].ToolRemovedConn = p98.ChildRemoved:Connect(function(child)
        if child:IsA("Tool") then
            if t2[155].WeaponHighlights[child] then
                t2[161](t2[155].WeaponHighlights[child])
                t2[155].WeaponHighlights[child] = nil
            end

            for _, descendant in ipairs(child:GetDescendants()) do
                local v954 = descendant

                if v954:IsA("BasePart") and t2[155].WeaponBackups[v954] then
                    local v955 = t2[155].WeaponBackups[v954]
                    local u956 = v955
                    pcall(function()
                        v954.Material = u956.Material
                        v954.Color = u956.Color
                        v954.Transparency = u956.Transparency
                    end)
                    t2[155].WeaponBackups[v954] = nil
                end
            end
        end
    end)
end
t2[169] = nil
t1[1] = function(p99)
    t2[163]()

    if not t2[22].PlayerChams.Enabled then
        return
    end

    if not p99 then
        return
    end

    if not p99:FindFirstChildOfClass("Humanoid") and not p99:WaitForChild("Humanoid", 8) then
        return
    end

    p99:WaitForChild("HumanoidRootPart", 8)

    local v609, v610, v611 = t2[156]()
    local v612 = t2[169]("KitagawaChamsHidden", p99, Enum.HighlightDepthMode.AlwaysOnTop)

    v612.FillColor = v610
    v612.OutlineColor = v610:Lerp(Color3.new(1, 1, 1), 0.2)
    v612.FillTransparency = v611
    v612.OutlineTransparency = 0

    local v613 = t2[169]("KitagawaChamsVisible", p99, Enum.HighlightDepthMode.Occluded)

    v613.FillColor = v609
    v613.OutlineColor = v609:Lerp(Color3.new(1, 1, 1), 0.3)
    v613.FillTransparency = 0.55
    v613.OutlineTransparency = 0.1
    t2[155].HiddenHighlight = v612
    t2[155].VisibleHighlight = v613
    t2[164](p99, v610, v609)
    t2[168](p99)
    t2[166](p99)

    local RefreshToken = t2[155].RefreshToken

    t2[155].DescendantConn = p99.DescendantAdded:Connect(function(descendant)
        if not t2[22].PlayerChams.Enabled or RefreshToken ~= t2[155].RefreshToken then
            return
        end

        if descendant:IsA("BasePart") and not descendant:FindFirstAncestorOfClass("Tool") and not t2[155].PartBackups[descendant] then
            local v958, v959 = t2[156]()

            t2[159](descendant, v959, v958, t2[155].PartBackups, descendant.Name == "HumanoidRootPart")
            t2[153]()
        end
    end)
end
t2[169] = function(p100, p101, p102)
    local Highlight = Instance.new("Highlight")

    Highlight.Name = p100
    Highlight.Adornee = p101
    Highlight.DepthMode = p102
    Highlight.Enabled = true

    local ChamsFolder = t2[155].ChamsFolder

    if not ChamsFolder or not ChamsFolder.Parent then
        ChamsFolder = Instance.new("Folder")
        ChamsFolder.Name = "KitagawaPlayerChams"
        ChamsFolder.Parent = t2[157]()
        t2[155].ChamsFolder = ChamsFolder
    end

    Highlight.Parent = ChamsFolder

    return Highlight
end
t2[153] = function()
    if not t2[22].PlayerChams.Enabled and not t2[22].WeaponChams.Enabled then
        return
    end

    local v615, v616, v617 = t2[156]()

    if t2[155].HiddenHighlight and t2[155].HiddenHighlight.Parent then
        t2[155].HiddenHighlight.FillColor = v616
        t2[155].HiddenHighlight.OutlineColor = v616:Lerp(Color3.new(1, 1, 1), 0.2)
        t2[155].HiddenHighlight.FillTransparency = v617
        t2[155].HiddenHighlight.OutlineTransparency = 0
    end

    if t2[155].VisibleHighlight and t2[155].VisibleHighlight.Parent then
        t2[155].VisibleHighlight.FillColor = v615
        t2[155].VisibleHighlight.OutlineColor = v615:Lerp(Color3.new(1, 1, 1), 0.3)
        t2[155].VisibleHighlight.FillTransparency = 0.55
        t2[155].VisibleHighlight.OutlineTransparency = 0.1
    end

    if t2[13].Character then
        for k in pairs(t2[155].PartBackups) do
            local v619 = k

            if v619 and v619.Parent then
                v619.Color = v616:Lerp(v615, 0.35)
            end
        end

        if t2[22].WeaponChams.Enabled then

            for v622 in pairs(t2[155].WeaponBackups) do

                if v622 and v622.Parent then
                    v622.Color = v616:Lerp(v615, 0.35)
                end
            end
            for _, v in pairs(t2[155].WeaponHighlights) do
                if type(v) == "table" then
                    if v.hidden and v.hidden.Parent then
                        v.hidden.FillColor = v616
                        v.hidden.OutlineColor = v616:Lerp(Color3.new(1, 1, 1), 0.2)
                        v.hidden.FillTransparency = v617
                    end

                    if v.visible and v.visible.Parent then
                        v.visible.FillColor = v615
                        v.visible.OutlineColor = v615:Lerp(Color3.new(1, 1, 1), 0.3)
                        v.visible.FillTransparency = 0.55
                    end
                elseif v and v.Parent then
                    v.FillColor = v616
                    v.OutlineColor = v616:Lerp(Color3.new(1, 1, 1), 0.2)
                    v.FillTransparency = v617
                end
            end
        end
    end
end
t2[170] = t1[1]
t2[171] = function(p103)
    if not p103 then
        return
    end

    if t2[22].PlayerChams.Enabled then
        t2[170](p103)

        return
    end

    if t2[22].WeaponChams.Enabled then
        t2[168](p103)
        t2[166](p103)
    end
end
local function v85(p104)
    if p104 then
        task.spawn(function()
            local v960 = t2[13].Character or t2[13].CharacterAdded:Wait()

            v960:WaitForChild("HumanoidRootPart", 10)
            task.wait(0.15)

            if t2[22].PlayerChams.Enabled then
                t2[170](v960)
            end
        end)

        return
    end

    t2[163]()

    if t2[22].WeaponChams.Enabled then
        t2[168](t2[13].Character)
        t2[166](t2[13].Character)
    end
end
t1[1] = t2[13].CharacterAdded
t1[1]:Connect(function(p105)
    if not t2[22].PlayerChams.Enabled and not t2[22].WeaponChams.Enabled then
        return
    end

    task.spawn(function()
        p105:WaitForChild("HumanoidRootPart", 10)
        task.wait(0.5)
        t2[171](p105)
    end)
end)
t2[172] = nil
t2[173] = nil
t2[174] = {
	HumanoidRootPart = true,
	Head = true,
	Torso = true,
	UpperTorso = true,
	LowerTorso = true,
	["Left Arm"] = true,
	["Right Arm"] = true,
	["Left Leg"] = true,
	["Right Leg"] = true
}
t2[175] = function(p106)
    if not t2[22].WeaponChams.Enabled or (not p106 or not p106.Parent) then
        return
    end
    if t2[155].WeaponHighlights[p106] then
        return
    end
    local v629 = false
    local GetDescendants = p106.GetDescendants
    local v631, v632, v633 = ipairs(GetDescendants(p106))
    local g635
    repeat
        local v634

        v633, v634 = v631(v632, v633)

        if not v633 then
            g635 = true
        end

        if g635 then
            break
        end
    until v634:IsA("BasePart")
    if not g635 then
        v629 = true
    end
    g635 = false
    if not v629 then
        return
    end
    local v636, v637, v638 = t2[156]()
    local v639 = t2[169]("KitagawaHeldHidden_" .. p106.Name, p106, Enum.HighlightDepthMode.AlwaysOnTop)
    v639.FillColor = v637
    v639.OutlineColor = v637:Lerp(Color3.new(1, 1, 1), 0.2)
    v639.FillTransparency = v638
    v639.OutlineTransparency = 0
    local v640 = t2[169]("KitagawaHeldVisible_" .. p106.Name, p106, Enum.HighlightDepthMode.Occluded)
    v640.FillColor = v636
    v640.OutlineColor = v636:Lerp(Color3.new(1, 1, 1), 0.3)
    v640.FillTransparency = 0.55
    v640.OutlineTransparency = 0.1
    t2[155].WeaponHighlights[p106] = {
		hidden = v639,
		visible = v640
	}
    for _, descendant in ipairs(p106:GetDescendants()) do
        if descendant:IsA("BasePart") then
            t2[159](descendant, v637, v636, t2[155].WeaponBackups, false)
        end
    end
end
t2[176] = function(p107)
    if p107:IsA("Tool") then
        return true
    end

    if p107:IsA("Accessory") or p107:IsA("Accoutrement") then
        return false
    end

    if not p107:IsA("Model") then
        return false
    end

    if t2[174][p107.Name] then
        return false
    end

    return true
end
t1[1] = task.spawn
t1[1](function()
    while true do
        task.wait(0.35)

        if t2[22].WeaponChams.Enabled then
            local Character = t2[13].Character

            if Character then
                if not t2[155].ToolAddedConn then
                    pcall(t2[168], Character)
                end
                for v647, v648 in ipairs(Character:GetChildren()) do

                    if t2[155].WeaponHighlights[v648] == nil and t2[176](v648) then
                        if v648:IsA("Tool") then
                            pcall(t2[165], v648)
                        else
                            pcall(t2[175], v648)
                        end
                    end
                end
                for k, v in pairs(t2[155].WeaponHighlights) do
                    local v651 = k

                    if typeof(v651) == "Instance" and Character ~= v651.Parent then
                        t2[161](v)
                        t2[155].WeaponHighlights[v651] = nil
                    end
                end
            end
        end
    end
end)
t2[173] = 0
t2[172] = 50
t2[177] = nil
t2[178] = false
t2[179] = 0
t2[180] = function(p108)
    if type(p108) ~= "string" then
        return nil, nil
    end

    local v655, v656 = string.match(p108, "(%d+)%s*/%s*(%d+)")
    local v657 = v655 and tonumber(v655)

    if v656 then
        v656 = tonumber(v656)
    end

    local v658 = v657

    if v657 then
        v658 = v656 and (v656 >= 40 and v656 <= 60)
    end

    if v658 then
        return math.max(0, (math.floor(v657))), v656
    end

    return nil, nil
end
local function v86()
    local u660
    local u661
    local n6 = -1
    local function v662(p109, p110, p111)
        if not p109 or not p110 then
            return
        end

        if p111 > n6 or (p111 == n6 and not u660 or p109 > u660) then
            u660 = p109
            u661 = p110
            n6 = p111
        end
    end
    for v665, v666 in ipairs({
		"MainGUI",
		"CrossPlatform",
		"Main"
	}) do

        local v667 = t2[14]:FindFirstChild(v666)

        if v667 then
            local v668 = v667:FindFirstChild("CoinBags", true) or v667:FindFirstChild("CoinBag", true)

            if v668 then
                for _, descendant in ipairs(v668:GetDescendants()) do
                    if descendant.Visible and descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
                        local v671, v672 = t2[180](descendant.Text)

                        v662(v671, v672, 2)
                    end
                end
            end
        end
    end
    if u660 then
        return u660, u661
    end
    for v675, v676 in ipairs(t2[14]:GetDescendants()) do

        if v676.Visible and v676:IsA("TextLabel") or v676:IsA("TextButton") then
            local v677, v678 = t2[180](v676.Text)

            if v677 and (v678 and v678 == 50) then
                v662(v677, v678, 1)
            end
        end
    end
    if u660 then
        return u660, u661
    end
    if t2[99] and t2[99][t2[13].Name] then
        local v679 = t2[99][t2[13].Name]
        local v680 = v679.Coins or (v679.CoinsCollected or (v679.CollectedCoins or v679.RoundCoins))

        if type(v680) == "number" then
            return math.max(0, (math.floor(v680))), t2[172]
        end
    end

    return nil, t2[172]
end
t2[181] = nil
t2[181] = function(p112, p113)
    if type(p112) ~= "number" then
        return false
    end

    t2[173] = math.max(0, (math.floor(p112)))

    if type(p113) == "number" then
        t2[172] = p113
    end

    return true
end
t2[182] = function(p114)
    if not p114 and tick() - t2[179] < 0.35 then
        return false
    end

    t2[179] = tick()

    local v682, v683 = v86()

    if v682 ~= nil then
        t2[181](v682, v683)

        return true
    end

    return false
end
t2[183] = {}
t2[184] = {};
(function()
    local t67 = {}
    local t68 = {
		[1] = Instance.new("Frame")
	}
    t68[1].Name = "MainFrame"
    t68[1].Size = UDim2.new(0, 600, 0, 500)
    t68[1].Position = UDim2.new(0.5, -300, 0.5, -250)
    t68[1].BackgroundColor3 = t2[47]
    t68[1].BackgroundTransparency = t2[48]
    t68[1].BorderSizePixel = 0
    t68[1].ClipsDescendants = true
    t68[1].Parent = t2[38]
    Instance.new("UICorner", t68[1]).CornerRadius = UDim.new(0, 8)
    local UIStroke3 = Instance.new("UIStroke", t68[1])
    UIStroke3.Color = t2[51]
    UIStroke3.Thickness = 1
    UIStroke3.Transparency = 0.25
    v63(t68[1])
    t2[43].MouseButton1Click:Connect(function()
        t68[1].Visible = not t68[1].Visible
    end)
    pcall(function()
        v63(t2[41], nil, t2[43])
    end)
    local Frame = Instance.new("Frame", t68[1])
    Frame.Size = UDim2.new(0, 180, 1, 0)
    Frame.BackgroundColor3 = t2[47]
    Frame.BackgroundTransparency = t2[48]
    Frame.BorderSizePixel = 0
    Frame.ZIndex = 1
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)
    local Frame3 = Instance.new("Frame", Frame)
    Frame3.Size = UDim2.new(0, 1, 1, 0)
    Frame3.Position = UDim2.new(1, 0, 0, 0)
    Frame3.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    Frame3.BorderSizePixel = 0
    Frame3.ZIndex = 1
    local ImageLabel = Instance.new("ImageLabel", Frame)
    ImageLabel.Size = UDim2.new(0, 56, 0, 56)
    ImageLabel.Position = UDim2.new(0, 10, 0, 12)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Image = "rbxassetid://76859573847035"
    ImageLabel.ScaleType = Enum.ScaleType.Fit
    ImageLabel.ZIndex = 2
    Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(0, 8)
    local TextLabel = Instance.new("TextLabel", Frame)
    TextLabel.Size = UDim2.new(1, -54, 0, 70)
    TextLabel.Position = UDim2.new(0, 72, 0, 3)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "KitagawaHub"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextTransparency = 0.4
    TextLabel.TextSize = 19
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.ZIndex = 2
    local TextLabel2 = Instance.new("TextLabel", Frame)
    TextLabel2.Size = UDim2.new(1, -54, 0, 70)
    TextLabel2.Position = UDim2.new(0, 70, 0, 0)
    TextLabel2.BackgroundTransparency = 1
    TextLabel2.RichText = true
    TextLabel2.Text = "<font color=\"#DDDDDD\">Kitagawa</font><font color=\"#00A2FF\">Hub</font>"
    TextLabel2.TextSize = 19
    TextLabel2.Font = Enum.Font.FredokaOne
    TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel2.ZIndex = 2
    local n7 = 74
    t68[2] = Instance.new("ScrollingFrame", Frame)
    t68[2].Size = UDim2.new(1, 0, 1, -n7 - 88 - 4)
    t68[2].Position = UDim2.new(0, 0, 0, n7)
    t68[2].BackgroundTransparency = 1
    t68[2].ScrollBarThickness = 2
    t68[2].ScrollBarImageColor3 = Color3.fromRGB(80, 80, 95)
    t68[2].AutomaticCanvasSize = Enum.AutomaticSize.Y
    t68[2].CanvasSize = UDim2.new(0, 0, 0, 0)
    t68[2].ZIndex = 2
    local UIListLayout = Instance.new("UIListLayout", t68[2])
    UIListLayout.Padding = UDim.new(0, 5)
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    local UIPadding = Instance.new("UIPadding", t68[2])
    UIPadding.PaddingTop = UDim.new(0, 5)
    UIPadding.PaddingBottom = UDim.new(0, 10)
    t68[3] = false
    if t67[1] == nil or type(t67[1]) ~= "number" then
        t67[1] = 60
    end
    local Frame4 = Instance.new("Frame", Frame)
    Frame4.Name = "ProfileCard"
    Frame4.Size = UDim2.new(1, -16, 0, t67[1])
    Frame4.Position = UDim2.new(0, 8, 1, -t67[1] - 4)
    Frame4.BackgroundColor3 = t2[49]
    Frame4.BackgroundTransparency = t2[50]
    Frame4.BorderSizePixel = 0
    Frame4.ZIndex = 1
    Instance.new("UICorner", Frame4).CornerRadius = UDim.new(0, 8)
    t67[1] = Instance.new("UIStroke", Frame4)
    t67[1].Color = t2[51]
    t67[1].Thickness = 1
    t67[1].Transparency = 0.35
    t67[1] = Instance.new("Frame", Frame4)
    t67[1].Size = UDim2.new(0, 44, 0, 44)
    t67[1].Position = UDim2.new(0, 8, 0, 8)
    t67[1].BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    t67[1].BackgroundTransparency = 0
    t67[1].ZIndex = 2
    Instance.new("UICorner", t67[1]).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", t67[1]).Color = t2[51]
    t68[4] = Instance.new("ImageLabel", t67[1])
    t68[4].Size = UDim2.new(1, -4, 1, -4)
    t68[4].Position = UDim2.new(0, 2, 0, 2)
    t68[4].BackgroundTransparency = 1
    t68[4].ScaleType = Enum.ScaleType.Crop
    t68[4].ZIndex = 3
    Instance.new("UICorner", t68[4]).CornerRadius = UDim.new(1, 0)
    t68[5] = Instance.new("TextLabel", Frame4)
    t68[5].Size = UDim2.new(1, -60, 0, 16)
    t68[5].Position = UDim2.new(0, 58, 0, 10)
    t68[5].BackgroundTransparency = 1
    t68[5].Font = Enum.Font.GothamBold
    t68[5].TextSize = 12
    t68[5].TextColor3 = t2[53]
    t68[5].TextXAlignment = Enum.TextXAlignment.Left
    t68[5].TextTruncate = Enum.TextTruncate.AtEnd
    t68[5].ZIndex = 2
    t68[6] = Instance.new("TextLabel", Frame4)
    t68[6].Size = UDim2.new(1, -60, 0, 14)
    t68[6].Position = UDim2.new(0, 58, 0, 28)
    t68[6].BackgroundTransparency = 1
    t68[6].Font = Enum.Font.Gotham
    t68[6].TextSize = 10
    t68[6].TextColor3 = t2[54]
    t68[6].TextXAlignment = Enum.TextXAlignment.Left
    t68[6].TextTruncate = Enum.TextTruncate.AtEnd
    t68[6].ZIndex = 2
    t68[7] = Instance.new("TextButton", Frame4)
    t68[7].Size = UDim2.new(1, -16, 0, 22)
    t68[7].Position = UDim2.new(0, 8, 1, -28)
    t68[7].BackgroundColor3 = t2[47]
    t68[7].BackgroundTransparency = 0.15
    t68[7].Text = "Anonymous"
    t68[7].Font = Enum.Font.GothamMedium
    t68[7].TextSize = 10
    t68[7].TextColor3 = t2[53]
    t68[7].ZIndex = 2
    local UICorner = Instance.new("UICorner", t68[7])
    t67[1] = UDim.new(1, 0)
    UICorner.CornerRadius = t67[1]
    t68[8] = nil
    local function v697()
        if t68[3] then
            t68[4].Image = ""
            t68[4].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            t68[4].BackgroundTransparency = 0
            t68[5].Text = "?"
            t68[6].Text = "@?"
            t68[7].Text = "Show profile"

            return
        end

        t68[4].BackgroundTransparency = 1
        t68[4].Image = t68[8] or ""
        t68[5].Text = t2[13].DisplayName
        t68[6].Text = "@" .. t2[13].Name
        t68[7].Text = "Anonymous"
    end
    task.spawn(function()
        local ok, result = pcall(function()
            return t2[1]:GetUserThumbnailAsync(t2[13].UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        end)

        if ok and result and not t68[3] then
            t68[4].Image = result
        end
    end)
    local MouseButton1Click = t68[7].MouseButton1Click
    t67[1] = function()
        t68[3] = not t68[3]
        v697()
    end
    MouseButton1Click:Connect(t67[1])
    v697()
    t68[9] = Instance.new("Frame", t68[1])
    t68[9].Size = UDim2.new(1, -180, 1, 0)
    t68[9].Position = UDim2.new(0, 180, 0, 0)
    t68[9].BackgroundTransparency = 1
    t68[9].ZIndex = 1
    t68[10] = 1.7
    t68[11] = function(p115, p116, p117, p118, p119, p120, p121)
        local Frame5 = Instance.new("Frame", p115)

        Frame5.Name = "Ink"
        Frame5.Size = UDim2.new(0, p116, 0, p117)
        Frame5.Position = UDim2.new(0, p118, 0, p119)
        Frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame5.BorderSizePixel = 0
        Frame5.Rotation = p120 or 0
        Frame5.ZIndex = 6

        if p121 and p121 > 0 then
            Instance.new("UICorner", Frame5).CornerRadius = UDim.new(0, p121)
        end

        return Frame5
    end
    local function v699(p122, p123, p124, p125, p126, p127, p128, p129)
        local Frame6 = Instance.new("Frame", p122)

        Frame6.Name = "InkRing"
        Frame6.Size = UDim2.new(0, p123, 0, p124)
        Frame6.Position = UDim2.new(0, p125, 0, p126)
        Frame6.BackgroundTransparency = 1
        Frame6.Rotation = p128 or 0
        Frame6.ZIndex = 6
        Instance.new("UICorner", Frame6).CornerRadius = p127 == "round" and UDim.new(1, 0) or UDim.new(0, p127 or 2)

        local UIStroke4 = Instance.new("UIStroke", Frame6)

        UIStroke4.Name = "InkStroke"
        UIStroke4.Thickness = p129 or t68[10]
        UIStroke4.Color = Color3.fromRGB(255, 255, 255)

        return Frame6
    end
    local function v700(p130, p131)
        if not p130 then
            return
        end

        for _, descendant in ipairs(p130:GetDescendants()) do
            if descendant:IsA("Frame") and descendant.Name == "Ink" then
                descendant.BackgroundColor3 = p131
            elseif descendant:IsA("UIStroke") and descendant.Name == "InkStroke" then
                descendant.Color = p131
            end
        end
    end
    t67[1] = function(p132)
        v699(p132, 9, 15, 4, 1.5, 2.5)
        t68[11](p132, 3.4, t68[10] - 0.4, 6.8, 13.5, 0, 1)
    end
    t68[12] = {
		sun = function(p133)
        for i = 0, 7 do
            local v999 = math.rad(i * 45)

            t68[11](p133, 1.8, 4, math.sin(v999) * 8 + 10 - 0.9, 10 - math.cos(v999) * 8 - 2, i * 45, 1)
        end

        v699(p133, 10, 10, 5, 5, "round")
    end,
		globe = function(p134)
        v699(p134, 16, 16, 2, 2, "round")
        v699(p134, 8, 16, 6, 2, "round")
        t68[11](p134, 16, 1.8, 2, 9.1, 0, 1)
    end,
		bust = function(p135)
        v699(p135, 8.5, 8.5, 5.75, 1.5, "round")
        v699(p135, 17, 17, 1.5, 11.5, "round")
    end,
		grid = function(p136)
        v699(p136, 8, 8, 1, 1, 2)
        v699(p136, 8, 8, 11, 1, 2)
        v699(p136, 8, 8, 1, 11, 2)
        v699(p136, 8, 8, 11, 11, 2)
    end,
		crosshair = function(p137)
        v699(p137, 15, 15, 2.5, 2.5, "round")
        t68[11](p137, 1.8, 5.5, 9.1, 0, 0, 1)
        t68[11](p137, 1.8, 5.5, 9.1, 14.5, 0, 1)
        t68[11](p137, 5.5, 1.8, 0, 9.1, 0, 1)
        t68[11](p137, 5.5, 1.8, 14.5, 9.1, 0, 1)

        local v1004 = t68[11](p137, 3.4, 3.4, 8.3, 8.3, 0, 0)

        Instance.new("UICorner", v1004).CornerRadius = UDim.new(1, 0)
    end,
		coins = function(p138)
        v699(p138, 12, 12, 6, 1, "round")
        v699(p138, 12, 12, 2, 5, "round")
        v699(p138, 7, 7, 8.5, 3, "round")
        v699(p138, 4.5, 4.5, 10, 4.2, "round")
        t68[11](p138, 5.5, 1.2, 8.25, 9.6, 0, 1)
    end,
		spark = function(p139)
        v699(p139, 11, 11, 4.5, 4.5, 3, 45)

        local v1007 = t68[11](p139, 3.6, 3.6, 0.5, 2.5, 0, 0)

        Instance.new("UICorner", v1007).CornerRadius = UDim.new(1, 0)

        local v1008 = t68[11](p139, 3, 3, 16.5, 3.5, 0, 0)

        Instance.new("UICorner", v1008).CornerRadius = UDim.new(1, 0)

        local v1009 = t68[11](p139, 2.6, 2.6, 16.8, 15.5, 0, 0)

        Instance.new("UICorner", v1009).CornerRadius = UDim.new(1, 0)
    end,
		sliders = function(p140)
        t68[11](p140, 16, t68[10], 2, 3.6, 0, 1)
        t68[11](p140, 16, t68[10], 2, 9.2, 0, 1)
        t68[11](p140, 16, t68[10], 2, 14.8, 0, 1)

        local v1011 = t68[11](p140, 5, 5, 11.5, 2, 0, 0)

        Instance.new("UICorner", v1011).CornerRadius = UDim.new(1, 0)

        local v1012 = t68[11](p140, 5, 5, 3.5, 7.6, 0, 0)

        Instance.new("UICorner", v1012).CornerRadius = UDim.new(1, 0)

        local v1013 = t68[11](p140, 5, 5, 12.5, 13.2, 0, 0)

        Instance.new("UICorner", v1013).CornerRadius = UDim.new(1, 0)
    end,
		monitor = function(p141)
        v699(p141, 18, 13, 1, 2, 2.5)
        t68[11](p141, t68[10] + 0.3, 3, 9.2, 15, 0, 0)
        t68[11](p141, 9, t68[10], 5.5, 17.5, 0, 1)
    end,
		screen = function(p142)
        v699(p142, 16, 12, 2, 3, 2)
        v699(p142, 10, 7.5, 5, 5.25, 1.5)
        t68[11](p142, 6, t68[10], 7, 15.5, 0, 1)
    end,
		wind = function(p143)
        t68[11](p143, 16, t68[10], 1.5, 3.5, 0, 1)
        t68[11](p143, 11, t68[10], 4.5, 9.2, 0, 1)
        t68[11](p143, 6.5, t68[10], 7, 14.9, 0, 1)

        local v1017 = t68[11](p143, 3.2, 3.2, 16.5, 8.4, 0, 0)

        Instance.new("UICorner", v1017).CornerRadius = UDim.new(1, 0)
    end,
		gear = function(p144)
        for i = 0, 7 do
            local v1021 = math.rad(i * 45)

            t68[11](p144, 2.6, 4.4, math.sin(v1021) * 7.6 + 10 - 1.3, 10 - math.cos(v1021) * 7.6 - 2.2, i * 45, 1)
        end

        v699(p144, 13, 13, 3.5, 3.5, "round")
        v699(p144, 5.6, 5.6, 7.2, 7.2, "round")
    end,
		note = function(p145)
        v699(p145, 14, 17, 3, 2, 2)
        t68[11](p145, 8, t68[10], 6, 7, 0, 1)
        t68[11](p145, 8, t68[10], 6, 10.5, 0, 1)
        t68[11](p145, 5, t68[10], 6, 14, 0, 1)
        t68[11](p145, t68[10] + 0.3, 4, 5.5, 0, 0, 1)
        t68[11](p145, t68[10] + 0.3, 4, 13, 0, 0, 1)
    end,
		folder = function(p146)
        t68[11](p146, 9, 2.4, 1.5, 2.6, 0, 1)
        v699(p146, 17, 12.5, 1.5, 4.6, 2.5)
    end,
		music = function(p147)
        t68[11](p147, 1.9, 12, 6.5, 3, 0, 1)
        t68[11](p147, 1.9, 12, 15.5, 2, 0, 1)
        t68[11](p147, 10.9, 2.4, 6.5, 1.6, 0, 1)
        v699(p147, 6, 4.6, 2.4, 12.8, "round")
        v699(p147, 6, 4.6, 11.4, 11.8, "round")
    end,
		ghost = function(p148)
        v699(p148, 12, 13, 4, 2.5, "round")

        local v1025 = t68[11](p148, 2.2, 2.2, 7, 8.5, 0, 0)

        Instance.new("UICorner", v1025).CornerRadius = UDim.new(1, 0)

        local v1026 = t68[11](p148, 2.2, 2.2, 10.5, 8.5, 0, 0)

        Instance.new("UICorner", v1026).CornerRadius = UDim.new(1, 0)
        t68[11](p148, 2.2, t68[10], 5.5, 14.5, 0, 1)
        t68[11](p148, 2.2, t68[10], 8.3, 14.5, 0, 1)
        t68[11](p148, 2.2, t68[10], 11.1, 14.5, 0, 1)
    end,
		desktop = function(p149)
        v699(p149, 15, 10, 1, 2, 2)
        t68[11](p149, 7, t68[10], 5, 14.5, 0, 1)
    end,
		phone = t67[1]
	}
    t68[13] = function(p150, p151, p152)
        local _Instance = Instance
        local v1033 = p152 or 20
        local v1034 = _Instance.new("Frame")

        v1034.Name = "IconHolder"
        v1034.Size = UDim2.new(0, v1033, 0, v1033)
        v1034.BackgroundTransparency = 1
        v1034.ZIndex = 5

        local Frame7 = Instance.new("Frame", v1034)

        Frame7.Name = "IconCanvas"
        Frame7.Size = UDim2.new(0, 20, 0, 20)
        Frame7.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame7.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame7.BackgroundTransparency = 1
        Frame7.ClipsDescendants = true
        Frame7.ZIndex = 5
        Instance.new("UIScale", Frame7).Scale = v1033 / 20;
        (t68[12][p150] or t68[12].grid)(Frame7)

        local v1036 = v700

        if not p151 then
            p151 = Color3.fromRGB(200, 205, 218)
        end

        v1036(v1034, p151)

        return v1034
    end
    local function v701()
        for _, v in pairs(t2[35]) do
            if t2[22].DeviceMode == "Mobile" then
                v.Button.Text = "Кнопка"
                v.Button.TextSize = 9
            else
                v.Button.Text = t2[22][v.ConfigName].Bind and t2[22][v.ConfigName].Bind.Name or "Bind"
                v.Button.TextSize = 11
            end
        end
    end
    local function v702(p153, p154)
        local v1041 = t2[22].DeviceMode == "PC"
        local v1042 = v1041 and UDim2.new(0, 3, 0, 3) or UDim2.new(0.5, 0, 0, 3)

        if p154 then
            t2[4]:Create(p153.Pill, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				Position = v1042
			}):Play()
        else
            p153.Pill.Position = v1042
        end

        local color3_9 = Color3.fromRGB(240, 244, 252)
        local color3_10 = Color3.fromRGB(118, 123, 136)

        p153.PCLabel.TextColor3 = v1041 and color3_9 or color3_10
        p153.MobileLabel.TextColor3 = v1041 and color3_10 or color3_9
        v700(p153.PCIcon, v1041 and color3_9 or color3_10)
        v700(p153.MobileIcon, v1041 and color3_10 or color3_9)
    end
    local Frame8 = Instance.new("Frame", t68[1])
    Frame8.Name = "ModeSwitcherHost"
    Frame8.Size = UDim2.new(0, 128, 0, 26)
    Frame8.AnchorPoint = Vector2.new(1, 1)
    Frame8.Position = UDim2.new(1, -12, 1, -12)
    Frame8.BackgroundTransparency = 1
    Frame8.ZIndex = 25;
    (function(p155)
        local Frame9 = Instance.new("Frame", p155)

        Frame9.Size = UDim2.new(1, 0, 1, 0)
        Frame9.BackgroundColor3 = Color3.fromRGB(14, 15, 20)
        Frame9.BackgroundTransparency = 0.1
        Frame9.ZIndex = 2
        Instance.new("UICorner", Frame9).CornerRadius = UDim.new(1, 0)

        local UIStroke5 = Instance.new("UIStroke", Frame9)

        UIStroke5.Color = Color3.fromRGB(44, 47, 58)
        UIStroke5.Transparency = 0.15

        local Frame10 = Instance.new("Frame", Frame9)

        Frame10.Name = "Pill"
        Frame10.Size = UDim2.new(0.5, -3, 1, -6)
        Frame10.Position = UDim2.new(0, 3, 0, 3)
        Frame10.BackgroundColor3 = Color3.fromRGB(52, 56, 68)
        Frame10.ZIndex = 2
        Instance.new("UICorner", Frame10).CornerRadius = UDim.new(1, 0)

        local UIStroke6 = Instance.new("UIStroke", Frame10)

        UIStroke6.Color = Color3.fromRGB(96, 104, 126)
        UIStroke6.Transparency = 0.25

        local UIGradient = Instance.new("UIGradient", Frame10)

        UIGradient.Rotation = 90
        UIGradient.Color = ColorSequence.new(Color3.fromRGB(66, 71, 86), Color3.fromRGB(40, 43, 53))

        local function v1051(p156, p157, p158)
            local TextButton = Instance.new("TextButton", Frame9)

            TextButton.Size = UDim2.new(0.5, -3, 1, -6)
            TextButton.Position = UDim2.new(p158, p158 ~= 0 and 0 or 3, 0, 3)
            TextButton.BackgroundTransparency = 1
            TextButton.Text = ""
            TextButton.AutoButtonColor = false
            TextButton.ZIndex = 4

            local v1686 = t68[13](p156, Color3.fromRGB(118, 123, 136), 13)

            v1686.Position = UDim2.new(0, 11, 0.5, -6.5)
            v1686.ZIndex = 5
            v1686.Parent = TextButton

            local TextLabel3 = Instance.new("TextLabel", TextButton)

            TextLabel3.Size = UDim2.new(1, -28, 1, 0)
            TextLabel3.Position = UDim2.new(0, 27, 0, 0)
            TextLabel3.BackgroundTransparency = 1
            TextLabel3.Text = p157
            TextLabel3.Font = Enum.Font.GothamBold
            TextLabel3.TextSize = 10
            TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel3.TextColor3 = Color3.fromRGB(118, 123, 136)
            TextLabel3.ZIndex = 5

            return TextButton, v1686, TextLabel3
        end

        local v1052, v1053, v1054 = v1051("desktop", "ПК", 0)
        local v1055, v1056, v1057 = v1051("phone", "Тел", 0.5)
        local t69 = {
			PC = v1052,
			Mobile = v1055,
			PCIcon = v1053,
			MobileIcon = v1056,
			PCLabel = v1054,
			MobileLabel = v1057,
			Pill = Frame10
		}

        table.insert(t2[36], t69)

        local function v1059()
            for _, v in pairs(t2[36]) do
                v702(v, true)
            end

            v701()
        end

        v702(t69, false)
        v1052.MouseButton1Click:Connect(function()
            t2[22].DeviceMode = "PC"
            v1059()
        end)
        v1055.MouseButton1Click:Connect(function()
            t2[22].DeviceMode = "Mobile"
            v1059()
        end)
    end)(Frame8)
    local function v704(p159, p160, p161)
        p159.expanded = p160

        local v1063 = not p160 and 40 or (p159.expandedW or 132)

        t2[4]:Create(p159.btn, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, v1063, 0, 34)
		}):Play()
        t2[4]:Create(p159.title, TweenInfo.new(0.18), {
			TextTransparency = p160 and 0 or 1
		}):Play()

        local v1064 = p161 and Color3.fromRGB(235, 238, 245) or Color3.fromRGB(130, 134, 145)

        if p161 then
            p159.btn.BackgroundColor3 = Color3.fromRGB(52, 54, 62)
            p159.title.TextColor3 = Color3.fromRGB(230, 232, 238)
            p159.shadow.Visible = true
            p159.stroke.Color = Color3.fromRGB(90, 96, 112)
            p159.stroke.Transparency = 0.08
        else
            p159.btn.BackgroundColor3 = Color3.fromRGB(24, 25, 30)
            p159.title.TextColor3 = Color3.fromRGB(130, 134, 145)
            p159.shadow.Visible = false
            p159.stroke.Color = Color3.fromRGB(38, 40, 48)
            p159.stroke.Transparency = 0.35
        end

        v700(p159.iconHolder, v1064)
    end
    local function v705(p162, p163, p164, p165)
        local t70 = {}
        local Frame11 = Instance.new("Frame", p162)

        Frame11.Size = UDim2.new(1, 0, 1, 0)
        Frame11.BackgroundTransparency = 1
        Frame11.ClipsDescendants = true
        Frame11.ZIndex = 2

        local Frame12 = Instance.new("Frame", Frame11)

        Frame12.Size = UDim2.new(1, 0, 1, 0)
        Frame12.BackgroundTransparency = 1
        Frame12.ClipsDescendants = true

        local UIListLayout2 = Instance.new("UIListLayout", Frame12)

        UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout2.Padding = UDim.new(0, 8)
        UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout2.VerticalAlignment = Enum.VerticalAlignment.Center

        local function v1073(p166)

            for v1693, v1694 in pairs(p163) do

                v1694.Visible = v1693 == p166
            end
            for _, v in ipairs(t70) do
                local v1697 = p166 == v.key

                v704(v, v1697, v1697)
            end
        end

        for _, v in ipairs(p164) do
            local v1076 = v
            local TextButton = Instance.new("TextButton", Frame12)

            TextButton.Size = UDim2.new(0, 40, 0, 34)
            TextButton.BackgroundColor3 = Color3.fromRGB(24, 25, 30)
            TextButton.AutoButtonColor = false
            TextButton.Text = ""
            TextButton.ClipsDescendants = true
            TextButton.ZIndex = 2

            local Frame13 = Instance.new("Frame", TextButton)

            Frame13.Size = UDim2.new(1, 0, 1, 0)
            Frame13.Position = UDim2.new(0, 0, 0, 2)
            Frame13.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Frame13.BackgroundTransparency = 0.55
            Frame13.Visible = false
            Frame13.ZIndex = 1
            Instance.new("UICorner", Frame13).CornerRadius = UDim.new(0, 8)

            local UIStroke7 = Instance.new("UIStroke", TextButton)

            UIStroke7.Color = Color3.fromRGB(38, 40, 48)
            UIStroke7.Thickness = 1
            UIStroke7.Transparency = 0.35
            Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 8)

            local v1080 = t68[13](v1076.kind, Color3.fromRGB(130, 134, 145), 22)

            v1080.Position = UDim2.new(0, 9, 0.5, -11)
            v1080.ZIndex = 4
            v1080.Parent = TextButton

            local TextLabel4 = Instance.new("TextLabel", TextButton)

            TextLabel4.Size = UDim2.new(1, -38, 1, 0)
            TextLabel4.Position = UDim2.new(0, 36, 0, 0)
            TextLabel4.BackgroundTransparency = 1

            local title = v1076.title
            local s6 = ""

            TextLabel4.Text = s6 .. if t2[29] ~= "RU" then title else t2[31][title] or title
            table.insert(t2[30], {
				inst = TextLabel4,
				prop = "Text",
				en = title,
				prefix = s6
			})
            TextLabel4.Font = Enum.Font.GothamMedium
            TextLabel4.TextSize = 11
            TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel4.TextColor3 = Color3.fromRGB(130, 134, 145)
            TextLabel4.TextTransparency = 1
            TextLabel4.ClipsDescendants = true
            TextLabel4.ZIndex = 3

            local key = v1076.key
            local expandedW = v1076.expandedW

            table.insert(t70, {
				btn = TextButton,
				iconHolder = v1080,
				title = TextLabel4,
				shadow = Frame13,
				stroke = UIStroke7,
				key = key,
				expanded = false,
				expandedW = expandedW
			})
            TextButton.MouseButton1Click:Connect(function()
                v1073(v1076.key)
            end)
        end

        v1073(p165)
    end
    local function v706(p167)
        local Frame14 = Instance.new("Frame", p167)

        Frame14.Size = UDim2.new(0, 390, 0, 0)
        Frame14.AutomaticSize = Enum.AutomaticSize.Y
        Frame14.BackgroundTransparency = 1
        Frame14.ZIndex = 1

        local UIListLayout3 = Instance.new("UIListLayout", Frame14)

        UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout3.Padding = UDim.new(0, 10)
        UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder

        local Frame15 = Instance.new("Frame", Frame14)

        Frame15.Size = UDim2.new(0, 190, 0, 0)
        Frame15.AutomaticSize = Enum.AutomaticSize.Y
        Frame15.BackgroundTransparency = 1
        Frame15.ZIndex = 1
        Instance.new("UIListLayout", Frame15).Padding = UDim.new(0, 10)

        local Frame16 = Instance.new("Frame", Frame14)

        Frame16.Size = UDim2.new(0, 190, 0, 0)
        Frame16.AutomaticSize = Enum.AutomaticSize.Y
        Frame16.BackgroundTransparency = 1
        Frame16.ZIndex = 1
        Instance.new("UIListLayout", Frame16).Padding = UDim.new(0, 10)

        return Frame14, Frame15, Frame16
    end
    t67[1] = function(p168, p169)
        if not p169 then
            p169 = {}
        end

        local ScrollingFrame = Instance.new("ScrollingFrame", t68[9])

        ScrollingFrame.Name = p168 .. "Page"
        ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
        ScrollingFrame.BackgroundTransparency = 1
        ScrollingFrame.ScrollBarThickness = 2
        ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 95)
        ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        ScrollingFrame.Visible = false
        ScrollingFrame.ZIndex = 1

        local UIListLayout4 = Instance.new("UIListLayout", ScrollingFrame)

        UIListLayout4.Padding = UDim.new(0, 12)
        UIListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
        Instance.new("UIPadding", ScrollingFrame).PaddingTop = UDim.new(0, 20)
        Instance.new("UIPadding", ScrollingFrame).PaddingBottom = UDim.new(0, 20)

        local Frame17 = Instance.new("Frame", ScrollingFrame)

        Frame17.Name = "TopBarSlot"
        Frame17.Size = UDim2.new(0, 390, 0, 40)
        Frame17.BackgroundTransparency = 1
        Frame17.LayoutOrder = -2
        Frame17.ZIndex = 1
        Frame17.Visible = p169.subTabs == true

        return ScrollingFrame
    end
    local v707 = t67[1]("Main")
    local v708 = t67[1]("Combat")
    local v709 = t67[1]("AutoFarm")
    local v710 = t67[1]("Fun", {
		subTabs = true
	})
    local v711 = t67[1]("Misc")
    local v712 = t67[1]("Visuals", {
		subTabs = true
	})
    local v713 = t67[1]("Troll")
    v707.Visible = true
    t68[14] = nil
    t68[15] = {}
    t67[1] = function(p170, p171, p172)
        local TextButton = Instance.new("TextButton", t68[2])

        TextButton.Size = UDim2.new(0, 160, 0, 42)
        TextButton.BackgroundColor3 = p170 == "Main" and Color3.fromRGB(35, 35, 45) or Color3.fromRGB(20, 20, 26)
        TextButton.BackgroundTransparency = p170 ~= "Main" and 0.8 or 0.4
        TextButton.Text = p170
        TextButton.TextColor3 = p170 == "Main" and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(140, 140, 155)
        TextButton.Font = Enum.Font.GothamMedium
        TextButton.TextSize = 13
        TextButton.TextXAlignment = Enum.TextXAlignment.Left
        TextButton.ZIndex = 1
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 6)
        Instance.new("UIPadding", TextButton).PaddingLeft = UDim.new(0, 42)

        local Frame18 = Instance.new("Frame", TextButton)

        Frame18.Size = UDim2.new(0, 3, 0, 20)
        Frame18.Position = UDim2.new(0, -38, 0.5, -10)
        Frame18.BackgroundColor3 = t2[37]
        Frame18.BackgroundTransparency = p170 ~= "Main" and 1 or 0
        Frame18.ZIndex = 1
        Instance.new("UICorner", Frame18).CornerRadius = UDim.new(1, 0)

        local v1101 = p170 == "Main"
        local v1102 = v1101
        local v1103 = t68[13]

        if v1101 then
            v1102 = Color3.fromRGB(255, 255, 255)
        end

        local v1104 = v1103(p172, v1102 or Color3.fromRGB(140, 140, 155), 20)

        v1104.Position = UDim2.new(0, -28, 0.5, -10)
        v1104.ZIndex = 2
        v1104.Parent = TextButton
        t68[15][TextButton] = v1104

        if v1101 then
            t68[14] = TextButton
        end

        TextButton.MouseEnter:Connect(function()
            if t68[14] ~= TextButton then
                t2[4]:Create(TextButton, TweenInfo.new(0.2), {
					BackgroundTransparency = 0.5
				}):Play()
                v700(v1104, Color3.fromRGB(200, 200, 215))
                t2[4]:Create(TextButton, TweenInfo.new(0.2), {
					TextColor3 = Color3.fromRGB(200, 200, 215)
				}):Play()
            end
        end)
        TextButton.MouseLeave:Connect(function()
            if t68[14] ~= TextButton then
                t2[4]:Create(TextButton, TweenInfo.new(0.2), {
					BackgroundTransparency = 0.8
				}):Play()
                v700(v1104, Color3.fromRGB(140, 140, 155))
                t2[4]:Create(TextButton, TweenInfo.new(0.2), {
					TextColor3 = Color3.fromRGB(140, 140, 155)
				}):Play()
            end
        end)
        TextButton.MouseButton1Click:Connect(function()
            if t68[14] == TextButton then
                return
            end
            for v1700, v1701 in pairs(t68[9]:GetChildren()) do

                if v1701.Name:match("Page") then
                    v1701.Visible = false
                end
            end
            p171.Visible = true
            if t68[14] then
                local v1702 = t2[4]
                local v1703 = t68[14]
                local tweenInfo = TweenInfo.new(0.2)
                local fromRGB = Color3.fromRGB
                local Create = v1702.Create
                local v1707 = fromRGB(140, 140, 155)

                Create(v1702, v1703, tweenInfo, {
					BackgroundTransparency = 0.8,
					TextColor3 = v1707
				}):Play()
                v700(t68[15][t68[14]], Color3.fromRGB(140, 140, 155))

                local Frame19 = t68[14]:FindFirstChild("Frame")

                if Frame19 then
                    t2[4]:Create(Frame19, TweenInfo.new(0.2), {
						BackgroundTransparency = 1
					}):Play()
                end
            end
            local v1709 = t2[4]
            local v1710 = TextButton
            local tweenInfo = TweenInfo.new(0.2)
            local _Color3 = Color3
            local Create = v1709.Create
            local v1714 = _Color3.fromRGB(255, 255, 255)
            Create(v1709, v1710, tweenInfo, {
				BackgroundTransparency = 0.4,
				TextColor3 = v1714
			}):Play()
            v700(v1104, Color3.fromRGB(255, 255, 255))
            t2[4]:Create(Frame18, TweenInfo.new(0.2), {
				BackgroundTransparency = 0
			}):Play()
        end)
    end
    t67[1]("Main", v707, "grid")
    t67[1]("Combat", v708, "crosshair")
    t67[1]("AutoFarm", v709, "coins")
    t67[1]("Fun", v710, "spark")
    t67[1]("Misc", v711, "sliders")
    t67[1]("Visuals", v712, "monitor")
    t67[1]("Flings", v713, "wind")
    t68[16] = {}
    local function v714(p173, p174)
        if t68[16][p173] then
            return
        end
        t68[16][p173] = true
        local Frame20 = Instance.new("Frame", t2[39])
        Frame20.Size = UDim2.new(0, 118, 0, 32)
        Frame20.Position = UDim2.new(0.8, 0, 0.4, 0)
        Frame20.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
        Frame20.BackgroundTransparency = 0.08
        Instance.new("UICorner", Frame20).CornerRadius = UDim.new(0, 6)
        local TextButton = Instance.new("TextButton", Frame20)
        TextButton.Size = UDim2.new(1, -28, 1, 0)
        TextButton.Position = UDim2.new(0, 28, 0, 0)
        TextButton.BackgroundTransparency = 1
        TextButton.Text = p174
        TextButton.TextColor3 = t2[22][p173].Enabled and Color3.fromRGB(120, 220, 140) or Color3.fromRGB(190, 190, 195)
        TextButton.Font = Enum.Font.GothamMedium
        TextButton.TextSize = 10
        TextButton.TextWrapped = true
        local TextButton2 = Instance.new("TextButton", Frame20)
        TextButton2.Size = UDim2.new(0, 28, 1, 0)
        TextButton2.Position = UDim2.new(0, 0, 0, 0)
        TextButton2.BackgroundTransparency = 1
        TextButton2.Text = "x"
        TextButton2.TextColor3 = Color3.fromRGB(200, 80, 80)
        TextButton2.Font = Enum.Font.GothamBold
        TextButton2.TextSize = 12
        local Frame21 = Instance.new("Frame", Frame20)
        Frame21.Size = UDim2.new(0, 1, 0.55, 0)
        Frame21.Position = UDim2.new(0, 28, 0.22, 0)
        Frame21.BackgroundColor3 = Color3.fromRGB(40, 40, 46)
        Frame21.BorderSizePixel = 0
        v63(Frame20, nil, TextButton)
        TextButton.MouseButton1Click:Connect(function()
            if t2[32][p173] then
                t2[32][p173](not t2[22][p173].Enabled)
            end
        end)
        local v1111 = t2[32][p173]
        local u1112 = v1111
        t2[32][p173] = function(p175)
            u1112(p175)

            if TextButton and TextButton.Parent then
                TextButton.TextColor3 = p175 and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(220, 220, 220)
            end
        end
        TextButton2.MouseButton1Click:Connect(function()
            t68[16][p173] = false
            Frame20:Destroy()
        end)
    end
    local Frame22 = Instance.new("Frame", v713)
    Frame22.Name = "TrollWrap"
    Frame22.Size = UDim2.new(0, 390, 0, 430)
    Frame22.BackgroundTransparency = 1
    Frame22.LayoutOrder = 1
    Frame22.ZIndex = 1
    t68[17] = Instance.new("ScrollingFrame", Frame22)
    t68[17].Size = UDim2.new(1, 0, 1, -50)
    t68[17].Position = UDim2.new(0, 0, 0, 50)
    t68[17].BackgroundTransparency = 1
    t68[17].ScrollBarThickness = 2
    t68[17].AutomaticCanvasSize = Enum.AutomaticSize.Y
    t68[17].CanvasSize = UDim2.new(0, 0, 0, 0)
    t68[17].ZIndex = 1
    local UIListLayout5 = Instance.new("UIListLayout", t68[17])
    UIListLayout5.Padding = UDim.new(0, 8)
    UIListLayout5.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
    Instance.new("UIPadding", t68[17]).PaddingBottom = UDim.new(0, 10)
    t68[18] = Instance.new("TextBox", v713)
    t68[18].Size = UDim2.new(0, 390, 0, 40)
    t68[18].Position = UDim2.new(0.5, -195, 0, 10)
    t68[18].BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    t68[18].BackgroundTransparency = 0.5
    t68[18].PlaceholderText = "Search player by name..."
    t68[18].Text = ""
    t68[18].TextColor3 = Color3.fromRGB(255, 255, 255)
    t68[18].Font = Enum.Font.GothamMedium
    t68[18].TextSize = 13
    t68[18].ZIndex = 1
    Instance.new("UICorner", t68[18]).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", t68[18]).Color = Color3.fromRGB(50, 50, 65)
    t68[19] = {}
    t68[20] = false
    t68[21] = nil
    t68[22] = false
    t68[21] = function()
        if not t2[15] then
            return
        end

        if t68[20] then
            t68[22] = true

            return
        end

        pcall(function()
            local v1716 = t68[18].Text:lower()
            local t71 = {}
            for v1720, v1721 in ipairs(t2[1]:GetPlayers()) do

                if v1721 ~= t2[13] and (v1716 == "" or (v1721.Name:lower():find(v1716, 1, true) or v1721.DisplayName:lower():find(v1716, 1, true))) then
                    t71[v1721.UserId] = v1721
                end
            end
            for v1724, v1725 in pairs(t68[19]) do

                if not t71[v1724] then
                    v1725:Destroy()
                    t68[19][v1724] = nil
                end
            end
            for v1728, v1729 in ipairs(t68[17]:GetChildren()) do

                if v1729:IsA("Frame") and v1729.Name ~= "" then
                    local num = tonumber(v1729.Name)

                    if num and not t71[num] then
                        v1729:Destroy()
                    elseif num and not t68[19][num] then
                        t68[19][num] = v1729
                    end
                end
            end
            for k, v in pairs(t71) do
                local v1733 = k
                local v1734 = v
                local v1735 = t2[73](v1734)
                local s7 = "Innocent"
                local color3_11 = Color3.fromRGB(150, 150, 150)
                local n8 = 3

                if v1735 == "Knife" then
                    s7 = "Murderer"
                    color3_11 = Color3.fromRGB(255, 60, 60)
                    n8 = 1
                elseif v1735 == "Weapon" then
                    s7 = "Sheriff"
                    color3_11 = Color3.fromRGB(60, 160, 255)
                    n8 = 2
                end

                local u1739 = t68[19][v1733]

                if not u1739 then
                    u1739 = Instance.new("Frame", t68[17])
                    u1739.Name = tostring(v1733)
                    u1739.Size = UDim2.new(0, 390, 0, 56)
                    u1739.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
                    u1739.BackgroundTransparency = 0.7
                    u1739.ZIndex = 1
                    Instance.new("UICorner", u1739).CornerRadius = UDim.new(0, 6)
                    Instance.new("UIStroke", u1739).Color = Color3.fromRGB(45, 45, 55)

                    local ImageLabel2 = Instance.new("ImageLabel", u1739)

                    ImageLabel2.Size = UDim2.new(0, 44, 0, 44)
                    ImageLabel2.Position = UDim2.new(0, 8, 0, 6)
                    ImageLabel2.BackgroundTransparency = 1
                    ImageLabel2.ZIndex = 1
                    pcall(function()
                        ImageLabel2.Image = t2[1]:GetUserThumbnailAsync(v1734.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                    end)
                    Instance.new("UICorner", ImageLabel2).CornerRadius = UDim.new(1, 0)

                    local TextLabel5 = Instance.new("TextLabel", u1739)

                    TextLabel5.Name = "PlayerNameLabel"
                    TextLabel5.Size = UDim2.new(1, -70, 0, 18)
                    TextLabel5.Position = UDim2.new(0, 60, 0, 10)
                    TextLabel5.BackgroundTransparency = 1
                    TextLabel5.Text = v1734.DisplayName .. " (@" .. v1734.Name .. ")"
                    TextLabel5.TextColor3 = Color3.fromRGB(240, 240, 245)
                    TextLabel5.TextSize = 13
                    TextLabel5.Font = Enum.Font.GothamMedium
                    TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel5.ZIndex = 1

                    local TextLabel6 = Instance.new("TextLabel", u1739)

                    TextLabel6.Name = "PlayerRoleLabel"
                    TextLabel6.Size = UDim2.new(1, -70, 0, 16)
                    TextLabel6.Position = UDim2.new(0, 60, 0, 30)
                    TextLabel6.BackgroundTransparency = 1
                    TextLabel6.TextSize = 11
                    TextLabel6.Font = Enum.Font.GothamBold
                    TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel6.ZIndex = 1

                    local TextButton = Instance.new("TextButton", u1739)

                    TextButton.Size = UDim2.new(1, 0, 1, 0)
                    TextButton.BackgroundTransparency = 1
                    TextButton.Text = ""
                    TextButton.ZIndex = 1
                    TextButton.MouseEnter:Connect(function()
                        t2[4]:Create(u1739, TweenInfo.new(0.2), {
							BackgroundTransparency = 0.4
						}):Play()
                    end)
                    TextButton.MouseLeave:Connect(function()
                        t2[4]:Create(u1739, TweenInfo.new(0.2), {
							BackgroundTransparency = 0.7
						}):Play()
                    end)
                    TextButton.MouseButton1Click:Connect(function()
                        t2[72](v1734)
                    end)
                    t68[19][v1733] = u1739
                end

                local PlayerRoleLabel = u1739:FindFirstChild("PlayerRoleLabel")

                if PlayerRoleLabel then
                    PlayerRoleLabel.Text = s7
                    PlayerRoleLabel.TextColor3 = color3_11
                end

                u1739.LayoutOrder = n8 * 1000 + (v1734.Name:lower():byte(1) or 0)
            end
        end)

        if t68[22] then
            task.defer(t68[21])
        end
    end
    t68[18]:GetPropertyChangedSignal("Text"):Connect(t68[21])
    t2[1].PlayerAdded:Connect(function()
        task.defer(t68[21])
    end)
    t2[1].PlayerRemoving:Connect(t68[21])
    t2[13].CharacterAdded:Connect(function()
        task.defer(t68[21])
    end)
    task.defer(t68[21])
    task.spawn(function()
        while true do
            task.wait(0.25)

            if t2[15] then
                t68[21]()
            end
        end
    end)
    task.spawn(function()
        repeat
            task.wait(0.5)
        until t2[15]

        for _, player in ipairs(t2[1]:GetPlayers()) do
            local Backpack = player:FindFirstChild("Backpack")

            if Backpack then
                Backpack.ChildAdded:Connect(function()
                    task.defer(t68[21])
                end)
                Backpack.ChildRemoved:Connect(function()
                    task.defer(t68[21])
                end)
            end

            if player.Character then
                player.Character.ChildAdded:Connect(function()
                    task.defer(t68[21])
                end)
                player.Character.ChildRemoved:Connect(function()
                    task.defer(t68[21])
                end)
            end
        end

        t2[1].PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(character)
                character.ChildAdded:Connect(function()
                    task.defer(t68[21])
                end)
                character.ChildRemoved:Connect(function()
                    task.defer(t68[21])
                end)
            end)
            task.spawn(function()
                local Backpack = player:WaitForChild("Backpack", 8)

                if Backpack then
                    Backpack.ChildAdded:Connect(function()
                        task.defer(t68[21])
                    end)
                    Backpack.ChildRemoved:Connect(function()
                        task.defer(t68[21])
                    end)
                end
            end)
        end)
    end)
    t68[23] = {
		AutoLoot = "Auto Loot",
		TouchFling = "Touch Fling",
		AutoShootMurder = "AutoShoot Murder",
		WallShotMurder = "WallShot Murder",
		MurderKillAll = "Murder KillAll",
		KillOnlySheriff = "Kill Only Sheriff",
		TriggerBot = "TriggerBot",
		SpinBot = "SpinBot",
		BHop = "BHop",
		InfJump = "Inf Jump",
		Fly = "Fly",
		FlyAura = "Fly Aura",
		AntiFling = "Anti-Fling",
		ElEtoYa = "El Eto Ya",
		LightYagami = "Light Yagami",
		RonaldoSkin = "Ronaldo Skin",
		RonaldoEmote = "Ronaldo Emote",
		JerkOff = "Jerk Off",
		AutoFarmCoin = "Auto Farm Coin",
		FortniteGriddy = "Fortnite Griddy",
		FortniteTrollDance = "Fortnite Troll Dance",
		KotoNaiDance = "Koto Nai Dance",
		TornadoEmote = "Tornado"
	}
    t68[24] = function(p176, p177)
        local Frame23 = Instance.new("Frame")

        Frame23.Name = "KeyCap"
        Frame23.Size = UDim2.new(0, 28, 0, 22)
        Frame23.BackgroundColor3 = Color3.fromRGB(35, 40, 52)
        Frame23.BackgroundTransparency = 0.12
        Frame23.Parent = p176
        Instance.new("UICorner", Frame23).CornerRadius = UDim.new(0, 6)

        local UIStroke8 = Instance.new("UIStroke", Frame23)

        UIStroke8.Color = t2[51]
        UIStroke8.Thickness = 1
        UIStroke8.Transparency = 0.15

        local TextLabel7 = Instance.new("TextLabel", Frame23)

        TextLabel7.Size = UDim2.new(1, 0, 1, 0)
        TextLabel7.BackgroundTransparency = 1

        local s8

        if not p177 then
            s8 = "?"
        else
            local p177Name = p177.Name
            local v1127 = string.gsub(p177Name, "Left", "L")

            s8 = string.gsub(v1127, "Right", "R")

            if #s8 > 4 then
                s8 = string.sub(s8, 1, 4)
            end
        end

        TextLabel7.Text = s8
        TextLabel7.TextColor3 = Color3.fromRGB(240, 248, 255)
        TextLabel7.Font = Enum.Font.GothamBold
        TextLabel7.TextSize = 9

        return Frame23
    end
    t67[1] = function(p178, p179)
        if not p178 then
            return
        end

        for _, descendant in pairs(p178:GetDescendants()) do
            if descendant:IsA("Frame") then
                descendant.BackgroundColor3 = p179
            end
        end
    end
    t68[25] = 210
    t68[26] = Color3.fromRGB(95, 220, 140)
    t68[27] = Color3.fromRGB(255, 110, 110)
    t68[28] = Instance.new("Frame")
    t68[28].Size = UDim2.new(0, t68[25] + 16, 0, 0)
    t68[28].Position = UDim2.new(0.82, -(t68[25] + 8), 0.34, 0)
    t68[28].BackgroundTransparency = 1
    t68[28].ZIndex = 140
    pcall(function()
        t68[28].AutomaticSize = Enum.AutomaticSize.Y
    end)
    t68[28].Visible = false
    t68[28].Parent = t2[38]
    pcall(function()
        v63(t68[28])
    end)
    local UIListLayout6 = Instance.new("UIListLayout", t68[28])
    UIListLayout6.Padding = UDim.new(0, 6)
    UIListLayout6.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
    local v718, _, _ = v64(t68[28], t68[25], 34, 8)
    v718.LayoutOrder = 0
    local TextLabel8 = Instance.new("TextLabel", v718)
    TextLabel8.Size = UDim2.new(1, -56, 1, 0)
    TextLabel8.Position = UDim2.new(0, 12, 0, 0)
    TextLabel8.BackgroundTransparency = 1
    TextLabel8.Text = "Keybinds"
    TextLabel8.TextColor3 = Color3.fromRGB(252, 254, 255)
    TextLabel8.Font = Enum.Font.GothamBold
    TextLabel8.TextSize = 12
    TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
    t68[29] = Instance.new("TextLabel", v718)
    t68[29].Size = UDim2.new(0, 24, 1, 0)
    t68[29].Position = UDim2.new(1, -30, 0, 0)
    t68[29].BackgroundTransparency = 1
    t68[29].Text = "0"
    t68[29].TextColor3 = t2[52]
    t68[29].Font = Enum.Font.GothamBold
    t68[29].TextSize = 11
    t68[30] = Instance.new("Frame", t68[28])
    t68[30].Size = UDim2.new(0, t68[25] + 16, 0, 0)
    t68[30].BackgroundTransparency = 1
    t68[30].AutomaticSize = Enum.AutomaticSize.Y
    t68[30].LayoutOrder = 1
    local UIListLayout7 = Instance.new("UIListLayout", t68[30])
    UIListLayout7.Padding = UDim.new(0, 5)
    UIListLayout7.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder
    local function v723()
        for _, child in pairs(t68[30]:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end

        local t72 = {}

        for k, v in pairs(t2[22]) do
            local v1152 = k

            if type(v) == "table" and v.Bind then
                local insert = table.insert
                local v1154 = t68[23][v1152] or v1152

                insert(t72, {
					Key = v1152,
					Data = v,
					Name = v1154
				})
            end
        end

        table.sort(t72, function(p180, p181)
            return p180.Name < p181.Name
        end)
        t68[29].Text = tostring(#t72)

        if #t72 == 0 then
            local v1155, _ = v64(t68[30], t68[25], 30, 6)

            v1155.LayoutOrder = 1

            local TextLabel9 = Instance.new("TextLabel", v1155)

            TextLabel9.Size = UDim2.new(1, 0, 1, 0)
            TextLabel9.BackgroundTransparency = 1
            TextLabel9.Text = "No binds"
            TextLabel9.TextColor3 = t2[54]
            TextLabel9.Font = Enum.Font.Gotham
            TextLabel9.TextSize = 10

            return
        end

        for i, v in ipairs(t72) do
            local Data = v.Data
            local v1161 = not not Data.Enabled
            local v1162, _, v1164 = v64(t68[30], t68[25], 32, 6)

            v1162.LayoutOrder = i

            if v1164 then
                v1164.Color = v1161 and Color3.fromRGB(70, 170, 120) or t2[51]
            end

            local Frame24 = Instance.new("Frame", v1162)

            Frame24.Size = UDim2.new(0, 34, 1, 0)
            Frame24.Position = UDim2.new(0, 8, 0, 0)
            Frame24.BackgroundTransparency = 1
            t68[24](Frame24, Data.Bind).Position = UDim2.new(0, 0, 0.5, -12)

            local TextLabel10 = Instance.new("TextLabel", v1162)

            TextLabel10.Size = UDim2.new(1, -92, 1, 0)
            TextLabel10.Position = UDim2.new(0, 44, 0, 0)
            TextLabel10.BackgroundTransparency = 1
            TextLabel10.Text = v.Name
            TextLabel10.TextColor3 = v1161 and Color3.fromRGB(252, 254, 255) or Color3.fromRGB(232, 240, 252)
            TextLabel10.Font = Enum.Font.GothamMedium
            TextLabel10.TextSize = 10
            TextLabel10.TextXAlignment = Enum.TextXAlignment.Left

            local TextLabel11 = Instance.new("TextLabel", v1162)

            TextLabel11.Size = UDim2.new(0, 34, 1, 0)
            TextLabel11.Position = UDim2.new(1, -40, 0, 0)
            TextLabel11.BackgroundTransparency = 1
            TextLabel11.Text = not v1161 and "OFF" or "ON"
            TextLabel11.TextColor3 = v1161 and t68[26] or t68[27]
            TextLabel11.Font = Enum.Font.GothamBold
            TextLabel11.TextSize = 10
        end
    end
    t2[3].InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            gameProcessed = not t2[15]
        end

        if gameProcessed then
            return
        end

        for k, v in pairs(t2[22]) do
            local v1172 = k

            if type(v) == "table" and (v.Bind and input.KeyCode == v.Bind) and t2[32][v1172] then
                t2[32][v1172](not v.Enabled)
            end
        end
    end)
    local function v724(p182, p183, p184)
        local v1176 = p184 or 390
        local Frame25 = Instance.new("Frame", p182)

        Frame25.Size = UDim2.new(0, v1176, 0, 32)
        Frame25.AutomaticSize = Enum.AutomaticSize.Y
        Frame25.BackgroundColor3 = t2[47]
        Frame25.BackgroundTransparency = t2[48]
        Frame25.ClipsDescendants = true
        Frame25.ZIndex = 1
        Instance.new("UICorner", Frame25).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", Frame25).Color = Color3.fromRGB(45, 45, 55)

        local TextButton = Instance.new("TextButton", Frame25)

        TextButton.Size = UDim2.new(1, 0, 0, 32)
        TextButton.BackgroundTransparency = 1

        local s9 = "   "

        TextButton.Text = s9 .. if t2[29] ~= "RU" then p183 else t2[31][p183] or p183
        table.insert(t2[30], {
			inst = TextButton,
			prop = "Text",
			en = p183,
			prefix = s9
		})
        TextButton.TextColor3 = t2[37]
        TextButton.Font = Enum.Font.GothamBold
        TextButton.TextSize = 13
        TextButton.TextXAlignment = Enum.TextXAlignment.Left
        TextButton.ZIndex = 1

        local TextLabel12 = Instance.new("TextLabel", TextButton)

        TextLabel12.Size = UDim2.new(0, 30, 1, 0)
        TextLabel12.Position = UDim2.new(1, -30, 0, 0)
        TextLabel12.BackgroundTransparency = 1
        TextLabel12.Text = "▼"
        TextLabel12.TextColor3 = Color3.fromRGB(150, 150, 150)
        TextLabel12.Font = Enum.Font.GothamBold
        TextLabel12.TextSize = 12
        TextLabel12.ZIndex = 1

        local Frame26 = Instance.new("Frame", Frame25)

        Frame26.Size = UDim2.new(1, 0, 0, 0)
        Frame26.Position = UDim2.new(0, 0, 0, 32)
        Frame26.AutomaticSize = Enum.AutomaticSize.Y
        Frame26.BackgroundTransparency = 1
        Frame26.Visible = true
        Frame26.ZIndex = 1

        local UIListLayout8 = Instance.new("UIListLayout", Frame26)

        UIListLayout8.Padding = UDim.new(0, 6)
        UIListLayout8.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout8.SortOrder = Enum.SortOrder.LayoutOrder

        local UIPadding2 = Instance.new("UIPadding", Frame26)

        UIPadding2.PaddingTop = UDim.new(0, 6)
        UIPadding2.PaddingBottom = UDim.new(0, 8)

        local u1184 = true

        TextButton.MouseButton1Click:Connect(function()
            u1184 = not u1184
            Frame26.Visible = u1184
            TextLabel12.Text = not u1184 and "►" or "▼"
        end)

        return Frame26
    end
    local function v725(p185, p186, p187, p188, p189, p190)
        local v1191 = p190 or 390
        local Frame27 = Instance.new("Frame", p185)

        Frame27.Size = UDim2.new(0, v1191, 0, 52)
        Frame27.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        Frame27.BackgroundTransparency = 0.8
        Frame27.ZIndex = 1
        Instance.new("UICorner", Frame27).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", Frame27).Color = Color3.fromRGB(50, 50, 60)

        local TextLabel13 = Instance.new("TextLabel", Frame27)

        TextLabel13.Size = UDim2.new(1, not p188 and -50 or -85, 1, 0)
        TextLabel13.Position = UDim2.new(0, 12, 0, 0)
        TextLabel13.BackgroundTransparency = 1

        local s10 = ""

        TextLabel13.Text = s10 .. if t2[29] ~= "RU" then p187 else t2[31][p187] or p187
        table.insert(t2[30], {
			inst = TextLabel13,
			prop = "Text",
			en = p187,
			prefix = s10
		})
        TextLabel13.TextColor3 = Color3.fromRGB(240, 240, 245)
        TextLabel13.TextSize = 13
        TextLabel13.Font = Enum.Font.GothamMedium
        TextLabel13.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel13.TextWrapped = true
        TextLabel13.ZIndex = 1

        local TextButton = Instance.new("TextButton", Frame27)

        TextButton.Size = UDim2.new(0, 36, 0, 20)
        TextButton.Position = UDim2.new(1, -45, 0.5, -10)
        TextButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        TextButton.Text = ""
        TextButton.ZIndex = 1
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(1, 0)

        local Frame28 = Instance.new("Frame", TextButton)

        Frame28.Size = UDim2.new(0, 16, 0, 16)
        Frame28.Position = UDim2.new(0, 2, 0.5, -8)
        Frame28.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame28.ZIndex = 1
        Instance.new("UICorner", Frame28).CornerRadius = UDim.new(1, 0)

        local function v1197(p191)
            t2[22][p186].Enabled = p191

            local v1749 = p191 and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            local v1750 = p191 and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(45, 45, 55)

            t2[4]:Create(Frame28, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				Position = v1749
			}):Play()
            t2[4]:Create(TextButton, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				BackgroundColor3 = v1750
			}):Play()
            v723()

            if p189 then
                p189(p191)
            end
        end

        t2[32][p186] = v1197
        t2[33][p186] = function()
            v1197(false)
        end
        TextButton.MouseButton1Click:Connect(function()
            v1197(not t2[22][p186].Enabled)
        end)

        if p188 then
            local TextButton3 = Instance.new("TextButton", Frame27)

            TextButton3.Size = UDim2.new(0, 35, 0, 24)
            TextButton3.Position = UDim2.new(1, -85, 0.5, -12)
            TextButton3.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            TextButton3.BackgroundTransparency = 0.3
            TextButton3.Text = "Bind"
            TextButton3.TextColor3 = Color3.fromRGB(190, 190, 200)
            TextButton3.Font = Enum.Font.GothamMedium
            TextButton3.TextSize = 11
            TextButton3.ZIndex = 1
            Instance.new("UICorner", TextButton3).CornerRadius = UDim.new(0, 6)
            table.insert(t2[35], {
				Button = TextButton3,
				ConfigName = p186
			})

            local u1199 = false

            TextButton3.MouseButton1Click:Connect(function()
                if t2[22].DeviceMode == "Mobile" then
                    v714(p186, p187)

                    return
                end

                u1199 = true
                TextButton3.Text = "..."
                TextButton3.TextColor3 = Color3.fromRGB(255, 210, 50)
                t2[4]:Create(TextButton3, TweenInfo.new(0.2), {
					BackgroundColor3 = Color3.fromRGB(50, 50, 65)
				}):Play()
            end)
            t2[3].InputBegan:Connect(function(input)
                if u1199 and input.UserInputType == Enum.UserInputType.Keyboard then
                    if input.KeyCode == Enum.KeyCode.Backspace or input.KeyCode == Enum.KeyCode.Delete then
                        t2[22][p186].Bind = nil
                        TextButton3.Text = "Bind"
                        TextButton3.TextColor3 = Color3.fromRGB(190, 190, 200)
                    else
                        t2[22][p186].Bind = input.KeyCode
                        TextButton3.Text = input.KeyCode.Name
                        TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end

                    t2[4]:Create(TextButton3, TweenInfo.new(0.2), {
						BackgroundColor3 = Color3.fromRGB(40, 40, 50)
					}):Play()
                    v723()
                end
            end)
        end

        return Frame27
    end
    local function v726(p192, p193, p194, p195, p196, p197, p198)
        local v1229 = p198 or 390
        local Frame29 = Instance.new("Frame", p192)

        Frame29.Size = UDim2.new(0, v1229, 0, 60)
        Frame29.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        Frame29.BackgroundTransparency = 0.8
        Frame29.ZIndex = 1
        Instance.new("UICorner", Frame29).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", Frame29).Color = Color3.fromRGB(50, 50, 60)

        local TextLabel14 = Instance.new("TextLabel", Frame29)

        TextLabel14.Size = UDim2.new(1, -50, 0, 26)
        TextLabel14.Position = UDim2.new(0, 12, 0, 8)
        TextLabel14.BackgroundTransparency = 1

        local s11 = ""

        TextLabel14.Text = s11 .. if t2[29] ~= "RU" then p193 else t2[31][p193] or p193
        table.insert(t2[30], {
			inst = TextLabel14,
			prop = "Text",
			en = p193,
			prefix = s11
		})
        TextLabel14.TextColor3 = Color3.fromRGB(220, 220, 230)
        TextLabel14.TextSize = 13
        TextLabel14.Font = Enum.Font.GothamMedium
        TextLabel14.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel14.TextWrapped = true
        TextLabel14.ZIndex = 1

        local TextLabel15 = Instance.new("TextLabel", Frame29)

        TextLabel15.Size = UDim2.new(0, 30, 0, 26)
        TextLabel15.Position = UDim2.new(1, -40, 0, 8)
        TextLabel15.BackgroundTransparency = 1
        TextLabel15.Text = tostring(p196)
        TextLabel15.TextColor3 = Color3.fromRGB(46, 204, 113)
        TextLabel15.TextSize = 13
        TextLabel15.Font = Enum.Font.GothamBold
        TextLabel15.TextXAlignment = Enum.TextXAlignment.Right
        TextLabel15.ZIndex = 1

        local TextButton = Instance.new("TextButton", Frame29)

        TextButton.Size = UDim2.new(1, -24, 0, 6)
        TextButton.Position = UDim2.new(0, 12, 0, 42)
        TextButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        TextButton.Text = ""
        TextButton.ZIndex = 1
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(1, 0)

        local Frame30 = Instance.new("Frame", TextButton)

        Frame30.Size = UDim2.new((p196 - p194) / (p195 - p194), 0, 1, 0)
        Frame30.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        Frame30.ZIndex = 1
        Instance.new("UICorner", Frame30).CornerRadius = UDim.new(1, 0)

        local u1236 = false

        local function v1237()
            local v1755 = math.clamp((t2[3]:GetMouseLocation().X - TextButton.AbsolutePosition.X) / TextButton.AbsoluteSize.X, 0, 1)

            t2[4]:Create(Frame30, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(v1755, 0, 1, 0)
			}):Play()

            local v1756 = math.round(p194 + (p195 - p194) * v1755)

            TextLabel15.Text = tostring(v1756)
            p197(v1756)
        end

        TextButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                u1236 = true
                v1237()
            end
        end)
        t2[3].InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                u1236 = false
            end
        end)
        t2[3].InputChanged:Connect(function(input)
            if u1236 and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                v1237()
            end
        end)
    end
    t68[31] = {}
    t68[32] = nil
    local function v727()
        local v1267

        if t2[22].ChamsColor.Adaptive then
            local v1266

            v1266, v1267 = t2[156]()
        else
            v1267 = Color3.fromRGB(t2[22].ChamsColor.R, t2[22].ChamsColor.G, t2[22].ChamsColor.B)
        end

        for _, v in ipairs(t68[31]) do
            v.Fill.BackgroundColor3 = v1267
            v.Stroke.Color = v1267:Lerp(Color3.new(1, 1, 1), 0.4)
            v.Adaptive.Visible = t2[22].ChamsColor.Adaptive
        end
    end
    local function v728()
        local Frame31 = Instance.new("Frame")

        Frame31.Name = "ChamsPalette"
        Frame31.Size = UDim2.new(0, 202, 0, 222)
        Frame31.BackgroundColor3 = Color3.fromRGB(19, 20, 26)
        Frame31.BackgroundTransparency = 0.02
        Frame31.BorderSizePixel = 0
        Frame31.Visible = false
        Frame31.ZIndex = 400
        Frame31.Parent = t2[38]
        Instance.new("UICorner", Frame31).CornerRadius = UDim.new(0, 10)

        local UIStroke9 = Instance.new("UIStroke", Frame31)

        UIStroke9.Color = Color3.fromRGB(58, 63, 78)
        UIStroke9.Thickness = 1
        UIStroke9.Transparency = 0.1

        local TextLabel16 = Instance.new("TextLabel", Frame31)

        TextLabel16.Size = UDim2.new(1, -40, 0, 24)
        TextLabel16.Position = UDim2.new(0, 12, 0, 6)
        TextLabel16.BackgroundTransparency = 1
        TextLabel16.Text = "Chams Color"
        TextLabel16.TextColor3 = Color3.fromRGB(238, 242, 250)
        TextLabel16.Font = Enum.Font.GothamBold
        TextLabel16.TextSize = 12
        TextLabel16.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel16.ZIndex = 401

        local TextButton = Instance.new("TextButton", Frame31)

        TextButton.Size = UDim2.new(0, 20, 0, 20)
        TextButton.Position = UDim2.new(1, -28, 0, 8)
        TextButton.BackgroundTransparency = 1
        TextButton.Text = "×"
        TextButton.TextColor3 = Color3.fromRGB(150, 155, 168)
        TextButton.Font = Enum.Font.GothamBold
        TextButton.TextSize = 16
        TextButton.ZIndex = 402

        local TextButton4 = Instance.new("TextButton", Frame31)

        TextButton4.Size = UDim2.new(0, 148, 0, 104)
        TextButton4.Position = UDim2.new(0, 12, 0, 32)
        TextButton4.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        TextButton4.Text = ""
        TextButton4.AutoButtonColor = false
        TextButton4.ZIndex = 401
        Instance.new("UICorner", TextButton4).CornerRadius = UDim.new(0, 7)
        Instance.new("UIStroke", TextButton4).Color = Color3.fromRGB(52, 56, 70)

        local Frame32 = Instance.new("Frame", TextButton4)

        Frame32.Size = UDim2.new(1, 0, 1, 0)
        Frame32.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame32.BorderSizePixel = 0
        Frame32.ZIndex = 402
        Instance.new("UICorner", Frame32).CornerRadius = UDim.new(0, 7)
        Instance.new("UIGradient", Frame32).Transparency = NumberSequence.new(0, 1)

        local Frame33 = Instance.new("Frame", TextButton4)

        Frame33.Size = UDim2.new(1, 0, 1, 0)
        Frame33.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Frame33.BorderSizePixel = 0
        Frame33.ZIndex = 403
        Instance.new("UICorner", Frame33).CornerRadius = UDim.new(0, 7)

        local UIGradient = Instance.new("UIGradient", Frame33)

        UIGradient.Rotation = 90
        UIGradient.Transparency = NumberSequence.new(1, 0)

        local Frame34 = Instance.new("Frame", TextButton4)

        Frame34.Size = UDim2.new(0, 11, 0, 11)
        Frame34.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame34.BackgroundTransparency = 1
        Frame34.ZIndex = 405
        Instance.new("UICorner", Frame34).CornerRadius = UDim.new(1, 0)

        local UIStroke10 = Instance.new("UIStroke", Frame34)

        UIStroke10.Color = Color3.fromRGB(255, 255, 255)
        UIStroke10.Thickness = 2

        local TextButton5 = Instance.new("TextButton", Frame31)

        TextButton5.Size = UDim2.new(0, 16, 0, 104)
        TextButton5.Position = UDim2.new(0, 170, 0, 32)
        TextButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton5.Text = ""
        TextButton5.AutoButtonColor = false
        TextButton5.ZIndex = 401
        Instance.new("UICorner", TextButton5).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", TextButton5).Color = Color3.fromRGB(52, 56, 70)

        local UIGradient2 = Instance.new("UIGradient", TextButton5)

        UIGradient2.Rotation = 90

        local new4 = ColorSequence.new
        local colorSequenceKeypoint = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0))
        local colorSequenceKeypoint2 = ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0))
        local new5 = ColorSequenceKeypoint.new
        local t73 = { Color3.fromRGB(0, 255, 0) }

        UIGradient2.Color = new4({
			colorSequenceKeypoint,
			colorSequenceKeypoint2,
			new5(0.33, v3(t73)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
			ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
			ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
		})

        local Frame35 = Instance.new("Frame", TextButton5)

        Frame35.Size = UDim2.new(1, 6, 0, 4)
        Frame35.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame35.Position = UDim2.new(0.5, 0, 0, 0)
        Frame35.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame35.BorderSizePixel = 0
        Frame35.ZIndex = 404
        Instance.new("UICorner", Frame35).CornerRadius = UDim.new(1, 0)

        local Frame36 = Instance.new("Frame", Frame31)

        Frame36.Size = UDim2.new(1, -24, 0, 20)
        Frame36.Position = UDim2.new(0, 12, 0, 144)
        Frame36.BackgroundTransparency = 1
        Frame36.ZIndex = 401

        local UIListLayout9 = Instance.new("UIListLayout", Frame36)

        UIListLayout9.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout9.Padding = UDim.new(0, 6)
        UIListLayout9.VerticalAlignment = Enum.VerticalAlignment.Center

        local TextButton6 = Instance.new("TextButton", Frame31)

        TextButton6.Size = UDim2.new(1, -24, 0, 30)
        TextButton6.Position = UDim2.new(0, 12, 0, 174)
        TextButton6.BackgroundColor3 = Color3.fromRGB(28, 30, 38)
        TextButton6.BackgroundTransparency = 0.15
        TextButton6.Text = ""
        TextButton6.AutoButtonColor = false
        TextButton6.ZIndex = 401
        Instance.new("UICorner", TextButton6).CornerRadius = UDim.new(0, 7)

        local UIStroke11 = Instance.new("UIStroke", TextButton6)

        UIStroke11.Color = Color3.fromRGB(50, 54, 68)
        UIStroke11.Transparency = 0.25

        local Frame37 = Instance.new("Frame", TextButton6)

        Frame37.Size = UDim2.new(0, 16, 0, 16)
        Frame37.Position = UDim2.new(0, 8, 0.5, -8)
        Frame37.BackgroundColor3 = Color3.fromRGB(18, 19, 25)
        Frame37.ZIndex = 402
        Instance.new("UICorner", Frame37).CornerRadius = UDim.new(0, 4)

        local UIStroke12 = Instance.new("UIStroke", Frame37)

        UIStroke12.Color = Color3.fromRGB(70, 76, 94)

        local TextLabel17 = Instance.new("TextLabel", Frame37)

        TextLabel17.Size = UDim2.new(1, 0, 1, 0)
        TextLabel17.BackgroundTransparency = 1
        TextLabel17.Text = "✓"
        TextLabel17.TextColor3 = Color3.fromRGB(120, 220, 150)
        TextLabel17.Font = Enum.Font.GothamBold
        TextLabel17.TextSize = 12
        TextLabel17.Visible = false
        TextLabel17.ZIndex = 403

        local TextLabel18 = Instance.new("TextLabel", TextButton6)

        TextLabel18.Size = UDim2.new(1, -34, 1, 0)
        TextLabel18.Position = UDim2.new(0, 30, 0, 0)
        TextLabel18.BackgroundTransparency = 1
        TextLabel18.Text = "Adaptive For Custom Sky"
        TextLabel18.TextColor3 = Color3.fromRGB(205, 212, 226)
        TextLabel18.Font = Enum.Font.GothamMedium
        TextLabel18.TextSize = 11
        TextLabel18.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel18.ZIndex = 402

        local TextLabel19 = Instance.new("TextLabel", Frame31)

        TextLabel19.Size = UDim2.new(1, -24, 0, 14)
        TextLabel19.Position = UDim2.new(0, 12, 0, 205)
        TextLabel19.BackgroundTransparency = 1
        TextLabel19.Text = "цвет берётся из Custom Sky + Atmosphere"
        TextLabel19.TextColor3 = Color3.fromRGB(112, 118, 132)
        TextLabel19.Font = Enum.Font.Gotham
        TextLabel19.TextSize = 9
        TextLabel19.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel19.ZIndex = 401

        local v1297, v1298, v1299 = Color3.fromRGB(t2[22].ChamsColor.R, t2[22].ChamsColor.G, t2[22].ChamsColor.B):ToHSV()
        local v1300 = v1297
        local v1301 = v1298
        local v1302 = v1299

        local function v1303()
            TextButton4.BackgroundColor3 = Color3.fromHSV(v1300, 1, 1)
            Frame34.Position = UDim2.new(v1301, 0, 1 - v1302, 0)
            Frame35.Position = UDim2.new(0.5, 0, v1300, 0)

            local color3_12 = Color3.fromHSV(v1300, v1301, v1302)

            UIStroke10.Color = v1302 > 0.6 and (v1301 < 0.6 and Color3.fromRGB(30, 30, 30)) or Color3.fromRGB(255, 255, 255)

            return color3_12
        end
        local function v1304()
            local v1778 = v1303()

            t2[22].ChamsColor.R = math.round(v1778.R * 255)
            t2[22].ChamsColor.G = math.round(v1778.G * 255)
            t2[22].ChamsColor.B = math.round(v1778.B * 255)
            v727()

            if t2[22].PlayerChams.Enabled or t2[22].WeaponChams.Enabled then
                pcall(t2[153])
            end
        end
        local function v1305(p199)
            t2[22].ChamsColor.Adaptive = p199
            TextLabel17.Visible = p199
            UIStroke12.Color = p199 and Color3.fromRGB(120, 220, 150) or Color3.fromRGB(70, 76, 94)
            TextButton4.Active = not p199
            TextButton5.Active = not p199

            local v1780 = not p199 and 0 or 0.55

            TextButton4.BackgroundTransparency = v1780
            Frame32.BackgroundTransparency = v1780
            Frame33.BackgroundTransparency = v1780
            TextButton5.BackgroundTransparency = v1780
            TextLabel19.Text = not p199 and "выбранный цвет применяется к игроку и оружию" or "цвет берётся из Custom Sky + Atmosphere"
            v727()

            if t2[22].PlayerChams.Enabled or t2[22].WeaponChams.Enabled then
                pcall(t2[153])
            end
        end

        for _, v in ipairs({
			Color3.fromRGB(90, 190, 255),
			Color3.fromRGB(255, 70, 90),
			Color3.fromRGB(120, 255, 160),
			Color3.fromRGB(255, 205, 70),
			Color3.fromRGB(190, 110, 255),
			Color3.fromRGB(255, 130, 60),
			Color3.fromRGB(255, 255, 255)
		}) do
            local v1308 = v
            local TextButton7 = Instance.new("TextButton", Frame36)

            TextButton7.Size = UDim2.new(0, 20, 0, 20)
            TextButton7.BackgroundColor3 = v1308
            TextButton7.Text = ""
            TextButton7.AutoButtonColor = false
            TextButton7.ZIndex = 402
            Instance.new("UICorner", TextButton7).CornerRadius = UDim.new(0, 6)

            local UIStroke13 = Instance.new("UIStroke", TextButton7)

            UIStroke13.Color = Color3.fromRGB(48, 52, 66)
            UIStroke13.Transparency = 0.2
            TextButton7.MouseButton1Click:Connect(function()
                if t2[22].ChamsColor.Adaptive then
                    v1305(false)
                end

                local _, _, _ = v1308:ToHSV()

                v1304()
            end)
        end

        local u1311 = false
        local u1312 = false

        local function v1313()
            local MouseLocation = t2[3]:GetMouseLocation()

            math.clamp((MouseLocation.X - TextButton4.AbsolutePosition.X) / math.max(TextButton4.AbsoluteSize.X, 1), 0, 1)

            local _ = 1 - math.clamp((MouseLocation.Y - TextButton4.AbsolutePosition.Y) / math.max(TextButton4.AbsoluteSize.Y, 1), 0, 1)

            v1304()
        end

        TextButton4.InputBegan:Connect(function(input)
            if t2[22].ChamsColor.Adaptive then
                return
            end

            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                u1311 = true
                v1313()
            end
        end)
        TextButton5.InputBegan:Connect(function(input)
            if t2[22].ChamsColor.Adaptive then
                return
            end

            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                u1312 = true
                math.clamp((t2[3]:GetMouseLocation().Y - TextButton5.AbsolutePosition.Y) / math.max(TextButton5.AbsoluteSize.Y, 1), 0, 1)
                v1304()
            end
        end)
        t2[3].InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                u1311 = false
                u1312 = false
            end
        end)
        t2[3].InputChanged:Connect(function(input)
            if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            if u1311 then
                v1313()

                return
            end

            if u1312 then
                math.clamp((t2[3]:GetMouseLocation().Y - TextButton5.AbsolutePosition.Y) / math.max(TextButton5.AbsoluteSize.Y, 1), 0, 1)
                v1304()
            end
        end)
        TextButton6.MouseButton1Click:Connect(function()
            v1305(not t2[22].ChamsColor.Adaptive)
        end)
        TextButton.MouseButton1Click:Connect(function()
            Frame31.Visible = false
        end)
        v1303()
        v1305(t2[22].ChamsColor.Adaptive)

        return Frame31
    end
    local function v729(p200)
        if not t68[32] then
            t68[32] = v728()
        end

        local v1315 = t68[32]

        if v1315.Visible then
            v1315.Visible = false

            return
        end

        local v1316 = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720)
        local v1317 = p200.AbsolutePosition.X + p200.AbsoluteSize.X + 10
        local v1318 = p200.AbsolutePosition.Y - 40
        local v1319 = math.clamp(v1317, 8, (math.max(8, v1316.X - v1315.Size.X.Offset - 8)))
        local v1320 = math.clamp(v1318, 8, (math.max(8, v1316.Y - v1315.Size.Y.Offset - 8)))

        v1315.Position = UDim2.new(0, v1319, 0, v1320)
        v1315.Visible = true
    end
    local function v730(p201)
        if not p201 then
            return
        end

        local TextLabel20 = p201:FindFirstChildOfClass("TextLabel")

        if TextLabel20 then
            TextLabel20.Size = UDim2.new(1, -86, 1, 0)
            TextLabel20.TextSize = 12
        end

        local TextButton = Instance.new("TextButton", p201)

        TextButton.Name = "ChamsOrb"
        TextButton.Size = UDim2.new(0, 22, 0, 22)
        TextButton.Position = UDim2.new(1, -74, 0.5, -11)
        TextButton.BackgroundColor3 = Color3.fromRGB(16, 17, 22)
        TextButton.Text = ""
        TextButton.AutoButtonColor = false
        TextButton.ZIndex = 3
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(1, 0)

        local UIStroke14 = Instance.new("UIStroke", TextButton)

        UIStroke14.Thickness = 1.6
        UIStroke14.Color = Color3.fromRGB(90, 190, 255)

        local Frame38 = Instance.new("Frame", TextButton)

        Frame38.Size = UDim2.new(1, -6, 1, -6)
        Frame38.Position = UDim2.new(0, 3, 0, 3)
        Frame38.BackgroundColor3 = Color3.fromRGB(90, 190, 255)
        Frame38.BorderSizePixel = 0
        Frame38.ZIndex = 4
        Instance.new("UICorner", Frame38).CornerRadius = UDim.new(1, 0)

        local UIGradient = Instance.new("UIGradient", Frame38)

        UIGradient.Rotation = 90
        UIGradient.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.05),
			NumberSequenceKeypoint.new(1, 0.35)
		})

        local Frame39 = Instance.new("Frame", TextButton)

        Frame39.Size = UDim2.new(0, 6, 0, 6)
        Frame39.Position = UDim2.new(1, -6, 0, 0)
        Frame39.BackgroundColor3 = Color3.fromRGB(120, 220, 150)
        Frame39.BorderSizePixel = 0
        Frame39.Visible = false
        Frame39.ZIndex = 5
        Instance.new("UICorner", Frame39).CornerRadius = UDim.new(1, 0)
        table.insert(t68[31], {
			Fill = Frame38,
			Stroke = UIStroke14,
			Adaptive = Frame39
		})
        TextButton.MouseButton1Click:Connect(function()
            v729(TextButton)
        end)
        v727()
    end
    local Frame40 = Instance.new("Frame", v707)
    Frame40.Size = UDim2.new(0, 390, 0, 0)
    Frame40.AutomaticSize = Enum.AutomaticSize.Y
    Frame40.BackgroundTransparency = 1
    Frame40.LayoutOrder = 1
    Frame40.ZIndex = 1
    local UIListLayout10 = Instance.new("UIListLayout", Frame40)
    UIListLayout10.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout10.Padding = UDim.new(0, 10)
    UIListLayout10.SortOrder = Enum.SortOrder.LayoutOrder
    local Frame41 = Instance.new("Frame", Frame40)
    Frame41.Size = UDim2.new(0, 190, 0, 0)
    Frame41.AutomaticSize = Enum.AutomaticSize.Y
    Frame41.BackgroundTransparency = 1
    Frame41.ZIndex = 1
    Instance.new("UIListLayout", Frame41).Padding = UDim.new(0, 10)
    local Frame42 = Instance.new("Frame", Frame40)
    Frame42.Size = UDim2.new(0, 190, 0, 0)
    Frame42.AutomaticSize = Enum.AutomaticSize.Y
    Frame42.BackgroundTransparency = 1
    Frame42.ZIndex = 1
    Instance.new("UIListLayout", Frame42).Padding = UDim.new(0, 10)
    local v735 = v724(Frame41, "ESP", 190)
    v725(v735, "MurdererESP", "Murderer ESP", false, nil, 180)
    v725(v735, "SheriffESP", "Sheriff ESP", false, nil, 180)
    v725(v735, "InnocentESP", "Innocent ESP", false, nil, 180)
    v725(v735, "EspBoxes", "3D Box ESP", false, nil, 180)
    v725(v735, "NameESP", "Name ESP", false, nil, 180)
    v725(v735, "GunESP", "Drop Gun ESP", false, nil, 180)
    v725(v735, "PlayerMenu", "Player Menu (👆)", false, nil, 180)
    local v736 = v724(Frame42, "Movement", 190)
    v725(v736, "InfJump", "Inf Jump", true, nil, 180)
    v725(v736, "Fly", "Fly", true, nil, 180)
    v725(v736, "FlyAura", "Fly Aura", true, nil, 180)
    v725(v736, "Noclip", "Noclip", false, nil, 180)
    v726(v736, "Fly Speed", 10, 150, t2[22].Movement.FlySpeed, function(p202)
        t2[22].Movement.FlySpeed = p202
    end, 180)
    v726(v736, "Jump Height", 10, 150, t2[22].Movement.JumpHeight, function(p203)
        t2[22].Movement.JumpHeight = p203

        local v1330 = t2[13].Character and t2[13].Character:FindFirstChildOfClass("Humanoid")

        if v1330 then
            v1330.JumpHeight = p203 / 50 * 7.2
        end
    end, 180)
    local Frame43 = Instance.new("Frame", v708)
    Frame43.Size = UDim2.new(0, 390, 0, 0)
    Frame43.AutomaticSize = Enum.AutomaticSize.Y
    Frame43.BackgroundTransparency = 1
    Frame43.LayoutOrder = 1
    Frame43.ZIndex = 1
    local UIListLayout11 = Instance.new("UIListLayout", Frame43)
    UIListLayout11.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout11.Padding = UDim.new(0, 10)
    UIListLayout11.SortOrder = Enum.SortOrder.LayoutOrder
    local Frame44 = Instance.new("Frame", Frame43)
    Frame44.Size = UDim2.new(0, 190, 0, 0)
    Frame44.AutomaticSize = Enum.AutomaticSize.Y
    Frame44.BackgroundTransparency = 1
    Frame44.ZIndex = 1
    Instance.new("UIListLayout", Frame44).Padding = UDim.new(0, 10)
    local Frame45 = Instance.new("Frame", Frame43)
    Frame45.Size = UDim2.new(0, 190, 0, 0)
    Frame45.AutomaticSize = Enum.AutomaticSize.Y
    Frame45.BackgroundTransparency = 1
    Frame45.ZIndex = 1
    Instance.new("UIListLayout", Frame45).Padding = UDim.new(0, 10)
    local v741 = v724(Frame44, "Sheriff", 190)
    v725(v741, "AutoLoot", "AutoLootGun", true, nil, 180)
    v725(v741, "TriggerBot", "TriggerBot", true, nil, 180)
    v726(v741, "Trigger Delay (ms)", 0, 800, 80, function(p204)
        t2[22].TriggerBot.Delay = p204
    end, 180)
    v725(v741, "AutoShootMurder", "AutoShoot Murder", true, function(p205)
        if p205 then
            t2[125]()

            return
        end

        t2[124]()
    end, 180)
    v725(v741, "WallShotMurder", "WallShot Murder", true, function(p206)
        if p206 then
            t2[117] = false
            t2[118] = t2[118] + 1
            t2[117] = true
            t2[118] = t2[118] + 1

            local v1334 = t2[118]

            task.spawn(function()
                while t2[117] and (v1334 == t2[118] and (t2[22].WallShotMurder.Enabled and t2[15])) do
                    if t2[120]() then
                        t2[113]()

                        local v1790 = t2[121]()

                        if v1790 then
                            t2[122](v1790)
                            task.wait(t2[119])
                        else
                            task.wait(0.5)
                        end
                    else
                        task.wait(0.5)
                    end
                end
            end)

            return
        end

        t2[117] = false
        t2[118] = t2[118] + 1
    end, 180)
    local v742 = v724(Frame45, "Murderer", 190)
    v725(v742, "MurderKillAll", "Kill All", true, nil, 180)
    v725(v742, "KillOnlySheriff", "Kill Sheriff Only", true, nil, 180)
    v725(v724(v709, "AutoFarmCoin", 390), "AutoFarmCoin", "Start Farm", false, function(p207)
        if p207 then
            t2[177] = tick()
            t2[182](true)
        else
            t2[177] = nil
        end

        t2[182](false)
        pcall(function()
            if getgenv() then
                local v1791 = getgenv()
                local AutoFarmCoinEnabled = t2[22].AutoFarmCoin.Enabled
                local v1793 = coinFarmTarget ~= nil
                local v1794 = t2[173]

                v1791.KitagawaFarmState = {
					enabled = AutoFarmCoinEnabled,
					active = v1793,
					sessionCoins = v1794
				}
            end
        end)
    end, 380)
    local Frame46 = Instance.new("Frame", v710)
    Frame46.Name = "FunPanelMain"
    Frame46.Size = UDim2.new(0, 390, 0, 0)
    Frame46.AutomaticSize = Enum.AutomaticSize.Y
    Frame46.BackgroundTransparency = 1
    Frame46.LayoutOrder = 1
    Frame46.ZIndex = 1
    Instance.new("UIListLayout", Frame46).Padding = UDim.new(0, 10)
    local Frame47 = Instance.new("Frame", v710)
    Frame47.Name = "FunPanelEmote"
    Frame47.Size = UDim2.new(0, 390, 0, 0)
    Frame47.AutomaticSize = Enum.AutomaticSize.Y
    Frame47.BackgroundTransparency = 1
    Frame47.LayoutOrder = 1
    Frame47.Visible = false
    Frame47.ZIndex = 1
    Instance.new("UIListLayout", Frame47).Padding = UDim.new(0, 10)
    local TopBarSlot = v710:FindFirstChild("TopBarSlot")
    if TopBarSlot then
        v705(TopBarSlot, {
			Fun = Frame46,
			Emote = Frame47
		}, {
			{
				key = "Fun",
				kind = "spark",
				title = "Fun",
				expandedW = 84
			},
			{
				key = "Emote",
				kind = "music",
				title = "Emote",
				expandedW = 96
			}
		}, "Fun")
    end
    local v746 = v724(Frame47, "Emote", 390)
    for _, v in ipairs(t2[126]) do
        local v749 = v

        v725(v746, v749.key, v749.label, true, function(p208)
            v81(v749.key, v749.id, p208)
        end, 380)
    end
    local TextLabel21 = Instance.new("TextLabel", v746)
    TextLabel21.Size = UDim2.new(1, -24, 0, 0)
    TextLabel21.AutomaticSize = Enum.AutomaticSize.Y
    TextLabel21.BackgroundTransparency = 1
    local s12 = ""
    TextLabel21.Text = s12 .. (t2[29] ~= "RU" and "Toggle emote to play your dance ID on loop." or (t2[31]["Toggle emote to play your dance ID on loop."] or "Toggle emote to play your dance ID on loop."))
    table.insert(t2[30], {
		inst = TextLabel21,
		prop = "Text",
		en = "Toggle emote to play your dance ID on loop.",
		prefix = s12
	})
    TextLabel21.TextColor3 = Color3.fromRGB(120, 125, 138)
    TextLabel21.Font = Enum.Font.Gotham
    TextLabel21.TextSize = 10
    TextLabel21.TextWrapped = true
    TextLabel21.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel21.ZIndex = 3
    local v752 = v724(Frame46, "Fun", 390)
    v725(v752, "SpinBot", "SpinBot", true, nil, 380)
    v726(v752, "Spin Speed", 1, 100, 10, function(p209)
        t2[22].SpinBot.Speed = p209
    end, 380)
    v725(v752, "BHop", "BunnyHop", true, nil, 380)
    v726(v752, "Bhop Power", 1, 10, 1, function(p210)
        t2[22].BHop.Power = p210
    end, 380)
    t68[33] = nil
    v725(v752, "JerkOff", "Jerk Off Tool", false, function(p211)
        if p211 then
            local function v1340()
                local LocalPlayer = t2[1].LocalPlayer
                local Character = LocalPlayer.Character
                local Backpack = LocalPlayer:FindFirstChild("Backpack")
                if not Character or not Backpack then
                    return
                end
                if Backpack:FindFirstChild("Jerk Off") or Character:FindFirstChild("Jerk Off") then
                    return
                end
                local Tool = Instance.new("Tool")
                Tool.Name = "Jerk Off"
                Tool.RequiresHandle = false
                Tool.Parent = Backpack
                local u1799 = false
                local u1800
                local function v1801()
                    u1799 = false

                    if u1800 then
                        u1800:Stop()
                        u1800 = nil
                    end
                end
                Tool.Equipped:Connect(function()
                    u1799 = true
                    task.spawn(function()
                        local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")

                        while u1799 and task.wait() and Humanoid do
                            local v1960 = Humanoid.RigType == Enum.HumanoidRigType.R15

                            if not u1800 then
                                local Animation = Instance.new("Animation")

                                Animation.AnimationId = v1960 and "rbxassetid://698251653" or "rbxassetid://72042024"
                                u1800 = Humanoid:LoadAnimation(Animation)
                            end

                            u1800:Play()
                            u1800:AdjustSpeed(not v1960 and 0.65 or 0.7)
                            u1800.TimePosition = 0.6
                            task.wait(0.1)

                            while u1800 and (u1800.TimePosition < (v1960 and 0.7 or 0.65) and u1799) do
                                task.wait(0.1)
                            end

                            if u1800 then
                                u1800:Stop()
                                u1800 = nil
                            end
                        end
                    end)
                end)
                Tool.Unequipped:Connect(v1801)
                local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                if Humanoid then
                    Humanoid.Died:Connect(v1801)
                end
            end

            v1340()
            t68[33] = t2[13].CharacterAdded:Connect(function()
                task.wait(1)

                if t2[22].JerkOff.Enabled then
                    v1340()
                end
            end)

            return
        end

        if t68[33] then
            t68[33]:Disconnect()
        end

        local Backpack = t2[13]:FindFirstChild("Backpack")

        if Backpack and Backpack:FindFirstChild("Jerk Off") then
            Backpack["Jerk Off"]:Destroy()
        end

        local Character = t2[13].Character

        if Character and Character:FindFirstChild("Jerk Off") then
            Character["Jerk Off"]:Destroy()
        end
    end, 380)
    local v753 = v724(v711, "Miscellaneous", 390)
    v725(v753, "AntiFling", "Anti-Fling", true, nil, 380)
    v725(v753, "TouchFling", "Touch Fling", true, nil, 380)
    local Frame48 = Instance.new("Frame", v712)
    Frame48.Name = "VisPanelMain"
    Frame48.Size = UDim2.new(0, 390, 0, 0)
    Frame48.AutomaticSize = Enum.AutomaticSize.Y
    Frame48.BackgroundTransparency = 1
    Frame48.LayoutOrder = 1
    Frame48.ZIndex = 1
    local Frame49 = Instance.new("Frame", v712)
    Frame49.Name = "VisPanelWorld"
    Frame49.Size = UDim2.new(0, 390, 0, 0)
    Frame49.AutomaticSize = Enum.AutomaticSize.Y
    Frame49.BackgroundTransparency = 1
    Frame49.LayoutOrder = 1
    Frame49.Visible = false
    Frame49.ZIndex = 1
    local Frame50 = Instance.new("Frame", v712)
    Frame50.Name = "VisPanelChams"
    Frame50.Size = UDim2.new(0, 390, 0, 0)
    Frame50.AutomaticSize = Enum.AutomaticSize.Y
    Frame50.BackgroundTransparency = 1
    Frame50.LayoutOrder = 1
    Frame50.Visible = false
    Frame50.ZIndex = 1
    local Frame51 = Instance.new("Frame", v712)
    Frame51.Name = "VisPanelCursors"
    Frame51.Size = UDim2.new(0, 390, 0, 0)
    Frame51.AutomaticSize = Enum.AutomaticSize.Y
    Frame51.BackgroundTransparency = 1
    Frame51.LayoutOrder = 1
    Frame51.Visible = false
    Frame51.ZIndex = 1
    local TopBarSlot2 = v712:FindFirstChild("TopBarSlot")
    if TopBarSlot2 then
        v705(TopBarSlot2, {
			MainVisual = Frame48,
			World = Frame49,
			Chams = Frame50,
			Cursors = Frame51
		}, {
			{
				key = "MainVisual",
				kind = "sun",
				title = "MainVisuals",
				expandedW = 132
			},
			{
				key = "World",
				kind = "globe",
				title = "World",
				expandedW = 96
			},
			{
				key = "Chams",
				kind = "bust",
				title = "Chams",
				expandedW = 100
			},
			{
				key = "Cursors",
				kind = "crosshair",
				title = "Custom Cursors",
				expandedW = 132
			}
		}, "MainVisual")
    end
    local _, v760, v761 = v706(Frame48)
    local _, v763, v764 = v706(Frame49)
    local _, v766, v767 = v706(Frame50)
    local _, v769 = v706(Frame51)
    local v770 = v724(v760, "MainVisual", 190)
    v725(v770, "KeyBindList", "KeyBind List UI", false, function(p212)
        t68[28].Visible = p212
    end, 180)
    v725(v770, "FpsBanner", "FPS Banner", false, nil, 180)
    v725(v770, "PingBanner", "Ping Banner", false, nil, 180)
    local v771 = v724(v760, "ShootVisual", 190)
    v725(v771, "BulletTracker", "Bullet Tracker", false, nil, 180);
    (function(p213, p214, p215, p216, p217, p218, p219)
        local v1245 = p219 or 390
        local Frame52 = Instance.new("Frame", p213)

        Frame52.Size = UDim2.new(0, v1245, 0, 78)
        Frame52.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        Frame52.BackgroundTransparency = 0.8
        Frame52.ZIndex = 1
        Instance.new("UICorner", Frame52).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", Frame52).Color = Color3.fromRGB(50, 50, 60)

        local TextLabel22 = Instance.new("TextLabel", Frame52)

        TextLabel22.Size = UDim2.new(1, -70, 0, 24)
        TextLabel22.Position = UDim2.new(0, 12, 0, 6)
        TextLabel22.BackgroundTransparency = 1
        TextLabel22.Text = p214
        TextLabel22.TextColor3 = Color3.fromRGB(220, 220, 230)
        TextLabel22.TextSize = 13
        TextLabel22.Font = Enum.Font.GothamMedium
        TextLabel22.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel22.ZIndex = 1

        local Frame53 = Instance.new("Frame", Frame52)

        Frame53.Size = UDim2.new(0, 46, 0, 22)
        Frame53.Position = UDim2.new(1, -58, 0, 7)
        Frame53.BackgroundColor3 = Color3.fromRGB(18, 19, 26)
        Frame53.BackgroundTransparency = 0.2
        Frame53.ZIndex = 1
        Instance.new("UICorner", Frame53).CornerRadius = UDim.new(1, 0)

        local UIStroke15 = Instance.new("UIStroke", Frame53)

        UIStroke15.Color = Color3.fromRGB(p215, p216, p217)
        UIStroke15.Thickness = 1.2
        UIStroke15.Transparency = 0.25

        local Frame54 = Instance.new("Frame", Frame53)

        Frame54.Size = UDim2.new(1, -8, 1, -8)
        Frame54.Position = UDim2.new(0, 4, 0, 4)
        Frame54.BackgroundColor3 = Color3.fromRGB(p215, p216, p217)
        Frame54.ZIndex = 1
        Instance.new("UICorner", Frame54).CornerRadius = UDim.new(1, 0)

        local UIGradient = Instance.new("UIGradient", Frame54)

        UIGradient.Rotation = 90
        UIGradient.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.05),
			NumberSequenceKeypoint.new(1, 0.35)
		})

        local Frame55 = Instance.new("Frame", Frame52)

        Frame55.Size = UDim2.new(1, -24, 0, 32)
        Frame55.Position = UDim2.new(0, 12, 0, 38)
        Frame55.BackgroundColor3 = Color3.fromRGB(18, 19, 26)
        Frame55.BackgroundTransparency = 0.35
        Frame55.ZIndex = 1
        Instance.new("UICorner", Frame55).CornerRadius = UDim.new(0, 8)

        local UIStroke16 = Instance.new("UIStroke", Frame55)

        UIStroke16.Color = Color3.fromRGB(45, 48, 62)
        UIStroke16.Transparency = 0.3

        local UIListLayout12 = Instance.new("UIListLayout", Frame55)

        UIListLayout12.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout12.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout12.VerticalAlignment = Enum.VerticalAlignment.Center
        UIListLayout12.Padding = UDim.new(0, 5)

        local t74 = {
			Color3.fromRGB(255, 200, 50),
			Color3.fromRGB(255, 80, 80),
			Color3.fromRGB(80, 200, 255),
			Color3.fromRGB(180, 80, 255),
			Color3.fromRGB(80, 255, 150),
			Color3.fromRGB(255, 255, 255)
		}
        local t75 = {}
        local color3_13 = Color3.fromRGB(p215, p216, p217)

        local function v1258(p220, p221)
            for i, v in ipairs(t75) do
                local v1764 = i == p220
                local v1765 = t2[4]
                local Stroke = v.Stroke
                local tweenInfo = TweenInfo.new(0.15)
                local v1768 = v1764 and Color3.fromRGB(235, 240, 255) or Color3.fromRGB(40, 44, 58)
                local Create = v1765.Create
                local v1770 = not v1764 and 1 or 2
                local v1771 = not v1764 and 0.35 or 0

                Create(v1765, Stroke, tweenInfo, {
					Color = v1768,
					Thickness = v1770,
					Transparency = v1771
				}):Play()

                local v1772 = t2[4]
                local Fill = v.Fill
                local tweenInfo2 = TweenInfo.new(0.15)
                local v1775 = v1764 and UDim2.new(1, -4, 1, -4) or UDim2.new(1, -8, 1, -8)
                local v1776 = v1764 and UDim2.new(0, 2, 0, 2) or UDim2.new(0, 4, 0, 4)

                v1772:Create(Fill, tweenInfo2, {
					Size = v1775,
					Position = v1776
				}):Play()
            end

            Frame54.BackgroundColor3 = p221
            UIStroke15.Color = p221
        end

        for i, v in ipairs(t74) do
            local v1261 = v
            local TextButton = Instance.new("TextButton", Frame55)

            TextButton.Size = UDim2.new(0, 21, 0, 21)
            TextButton.BackgroundColor3 = Color3.fromRGB(24, 26, 34)
            TextButton.Text = ""
            TextButton.AutoButtonColor = false
            TextButton.ZIndex = 1
            Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 7)

            local UIStroke17 = Instance.new("UIStroke", TextButton)

            UIStroke17.Color = Color3.fromRGB(40, 44, 58)
            UIStroke17.Thickness = 1
            UIStroke17.Transparency = 0.35

            local Frame56 = Instance.new("Frame", TextButton)

            Frame56.Size = UDim2.new(1, -8, 1, -8)
            Frame56.Position = UDim2.new(0, 4, 0, 4)
            Frame56.BackgroundColor3 = v1261
            Frame56.ZIndex = 1
            Instance.new("UICorner", Frame56).CornerRadius = UDim.new(0, 5)

            local UIGradient3 = Instance.new("UIGradient", Frame56)

            UIGradient3.Rotation = 90
            UIGradient3.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.05),
				NumberSequenceKeypoint.new(1, 0.3)
			})
            table.insert(t75, {
				Stroke = UIStroke17,
				Fill = Frame56
			})
            TextButton.MouseButton1Click:Connect(function()
                v1258(i, v1261)
                p218(math.round(v1261.R * 255), math.round(v1261.G * 255), (math.round(v1261.B * 255)))
            end)

            if math.abs(v1261.R - color3_13.R) < 0.01 and (math.abs(v1261.G - color3_13.G) < 0.01 and math.abs(v1261.B - color3_13.B) < 0.01) then
                task.spawn(function()
                    v1258(i, v1261)
                end)
            end
        end
    end)(v771, "Trail Color", 255, 200, 50, function(p222, p223, p224)
        t2[22].BulletTracker.R = p222
        t2[22].BulletTracker.G = p223
        t2[22].BulletTracker.B = p224
    end, 180)
    v726(v771, "Trail Size", 5, 40, 15, function(p225)
        t2[22].BulletTracker.Size = p225
    end, 180);
    (function(p226, p227, p228, p229, p230, p231, p232, p233)
        local v1208 = p233 or 390
        local Frame57 = Instance.new("Frame", p226)

        Frame57.Size = UDim2.new(0, v1208, 0, 75)
        Frame57.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        Frame57.BackgroundTransparency = 0.8
        Frame57.ClipsDescendants = true
        Frame57.ZIndex = 1
        Instance.new("UICorner", Frame57).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", Frame57).Color = Color3.fromRGB(50, 50, 60)

        local TextLabel23 = Instance.new("TextLabel", Frame57)

        TextLabel23.Size = UDim2.new(1, -50, 0, 35)
        TextLabel23.Position = UDim2.new(0, 12, 0, 0)
        TextLabel23.BackgroundTransparency = 1
        TextLabel23.Text = p228
        TextLabel23.TextColor3 = Color3.fromRGB(240, 240, 245)
        TextLabel23.TextSize = 13
        TextLabel23.Font = Enum.Font.GothamMedium
        TextLabel23.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel23.TextWrapped = true
        TextLabel23.ZIndex = 1

        local TextButton = Instance.new("TextButton", Frame57)

        TextButton.Size = UDim2.new(0, 36, 0, 20)
        TextButton.Position = UDim2.new(1, -45, 0, 8)
        TextButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        TextButton.Text = ""
        TextButton.ZIndex = 1
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(1, 0)

        local Frame58 = Instance.new("Frame", TextButton)

        Frame58.Size = UDim2.new(0, 16, 0, 16)
        Frame58.Position = UDim2.new(0, 2, 0.5, -8)
        Frame58.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame58.ZIndex = 1
        Instance.new("UICorner", Frame58).CornerRadius = UDim.new(1, 0)

        local function v1213(p234)
            t2[22][p227].Enabled = p234

            local v1753 = p234 and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            local v1754 = p234 and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(45, 45, 55)

            t2[4]:Create(Frame58, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				Position = v1753
			}):Play()
            t2[4]:Create(TextButton, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				BackgroundColor3 = v1754
			}):Play()
            v723()

            if p232 then
                p232(p234)
            end
        end

        t2[32][p227] = v1213
        t2[33][p227] = function()
            v1213(false)
        end
        TextButton.MouseButton1Click:Connect(function()
            v1213(not t2[22][p227].Enabled)
        end)

        local TextButton8 = Instance.new("TextButton", Frame57)

        TextButton8.Size = UDim2.new(1, -24, 0, 24)
        TextButton8.Position = UDim2.new(0, 12, 0, 40)
        TextButton8.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        TextButton8.BackgroundTransparency = 0.3
        TextButton8.Text = p230 .. " ▼"
        TextButton8.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton8.Font = Enum.Font.GothamBold
        TextButton8.TextSize = 11
        TextButton8.ZIndex = 1
        Instance.new("UICorner", TextButton8).CornerRadius = UDim.new(0, 6)

        local Frame59 = Instance.new("Frame", Frame57)

        Frame59.Size = UDim2.new(1, 0, 0, #p229 * 32)
        Frame59.Position = UDim2.new(0, 0, 0, 75)
        Frame59.BackgroundTransparency = 1
        Frame59.ZIndex = 1

        local UIListLayout13 = Instance.new("UIListLayout", Frame59)

        UIListLayout13.Padding = UDim.new(0, 4)
        UIListLayout13.HorizontalAlignment = Enum.HorizontalAlignment.Center

        local u1217 = false

        TextButton8.MouseButton1Click:Connect(function()
            u1217 = not u1217
            TextButton8.Text = t2[22][p231] .. (not u1217 and " ▼" or " ▲")
            t2[4]:Create(Frame57, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, v1208, 0, u1217 and #p229 * 32 + 75 + 8 or 75)
			}):Play()
        end)

        for _, v in ipairs(p229) do
            local v1220 = v
            local TextButton9 = Instance.new("TextButton", Frame59)

            TextButton9.Size = UDim2.new(1, -24, 0, 28)
            TextButton9.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            TextButton9.BackgroundTransparency = 0.3
            TextButton9.Text = v1220
            TextButton9.TextColor3 = Color3.fromRGB(220, 220, 230)
            TextButton9.Font = Enum.Font.GothamMedium
            TextButton9.TextSize = 12
            TextButton9.ZIndex = 1
            Instance.new("UICorner", TextButton9).CornerRadius = UDim.new(0, 6)
            TextButton9.MouseButton1Click:Connect(function()
                t2[22][p231] = v1220
                TextButton8.Text = v1220 .. " ▼"
                t2[4]:Create(Frame57, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, v1208, 0, 75)
				}):Play()

                if p232 then
                    p232(v1220)
                end
            end)
        end
    end)(v724(v769, "Custom Cursors", 190), "CustomCrosshair", "Custom Crosshair", t2[134], "Love Cursor", "CrosshairStyle", function()
        t2[139]()
    end, 180)
    local v772 = v724(v761, "Aura", 190)
    v725(v772, "WingsAura", "Wings Aura", false, function(p235)
        t2[147]("WingsAura", p235)
    end, 180)
    v725(v772, "StarrBallAura", "Starr Ball", false, function(p236)
        t2[147]("StarrBallAura", p236)
    end, 180)
    v725(v772, "RedAura", "Red Aura", false, function(p237)
        t2[147]("RedAura", p237)
    end, 180)
    local v773 = v724(v761, "JumpCircle", 190)
    v725(v773, "JumpCircleNeon", "Neon Ring", false, function(p238)
        t2[151]("JumpCircleNeon", p238)
    end, 180)
    v725(v773, "JumpCircleShock", "Shock Wave", false, function(p239)
        t2[151]("JumpCircleShock", p239)
    end, 180)
    v725(v773, "JumpCirclePulse", "Pulse Spin", false, function(p240)
        t2[151]("JumpCirclePulse", p240)
    end, 180)
    local v774 = v724(v763, "Custom Sky", 190)
    v725(v774, "CustomSky", "Custom Sky", false, function(p241)
        t2[69](t2[22].CustomSky.Mode, p241)

        if t2[22].CustomAtmosphere and t2[22].CustomAtmosphere.Enabled then
            t2[65]()
        end
    end, 180)
    t68[34] = Instance.new("Frame", v774)
    t68[34].Size = UDim2.new(0, 180, 0, 28)
    t68[34].BackgroundTransparency = 1
    t68[34].ClipsDescendants = false
    t68[34].ZIndex = 2
    t68[35] = Instance.new("TextButton", t68[34])
    t68[35].Size = UDim2.new(1, 0, 0, 28)
    t68[35].BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    t68[35].BackgroundTransparency = 0.3
    t68[35].Text = "Tropical Summer ▼"
    t68[35].TextColor3 = Color3.fromRGB(230, 235, 245)
    t68[35].Font = Enum.Font.GothamBold
    t68[35].TextSize = 11
    t68[35].ZIndex = 2
    Instance.new("UICorner", t68[35]).CornerRadius = UDim.new(0, 6)
    t68[36] = {
		"Pink",
		"PinkIshak",
		"Night",
		"Sunset",
		"Tropical",
		"RedNight"
	}
    t68[37] = t2[60]
    t68[38] = Instance.new("Frame", t68[34])
    t68[38].Size = UDim2.new(1, 0, 0, #t68[36] * 26)
    t68[38].Position = UDim2.new(0, 0, 0, 32)
    t68[38].BackgroundTransparency = 1
    t68[38].Visible = false
    t68[38].ZIndex = 5
    Instance.new("UIListLayout", t68[38]).Padding = UDim.new(0, 3)
    t68[39] = false
    t68[35].MouseButton1Click:Connect(function()
        t68[39] = not t68[39]
        t68[38].Visible = t68[39]
        t68[35].Text = (t68[37][t2[22].CustomSky.Mode] or "Tropical Summer") .. (not t68[39] and " ▼" or " ▲")
        t2[4]:Create(t68[34], TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 180, 0, t68[39] and #t68[36] * 26 + 32 + 4 or 28)
		}):Play()
    end)
    for _, v in ipairs(t68[36]) do
        local v777 = v
        local TextButton = Instance.new("TextButton", t68[38])

        TextButton.Size = UDim2.new(1, 0, 0, 24)
        TextButton.BackgroundColor3 = Color3.fromRGB(35, 38, 48)
        TextButton.BackgroundTransparency = 0.2
        TextButton.Text = t68[37][v777] or v777
        TextButton.TextColor3 = Color3.fromRGB(210, 220, 235)
        TextButton.Font = Enum.Font.GothamMedium
        TextButton.TextSize = 10
        TextButton.ZIndex = 5
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 5)
        TextButton.MouseButton1Click:Connect(function()
            t2[22].CustomSky.Mode = v777
            t68[35].Text = (t68[37][v777] or v777) .. " ▼"
            t68[38].Visible = false
            t2[4]:Create(t68[34], TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 180, 0, 28)
			}):Play()

            if t2[22].CustomSky.Enabled then
                t2[69](v777, true)
            end

            if v777 == "RedNight" then
                t2[22].CustomAtmosphere.Enabled = true

                if t2[32].CustomAtmosphere then
                    t2[32].CustomAtmosphere(true)
                end
            end

            if t2[22].CustomAtmosphere and t2[22].CustomAtmosphere.Enabled then
                t2[65]()
            end
        end)
    end
    local v779 = v724(v764, "Atmosphere", 190)
    v725(v779, "CustomAtmosphere", "Custom Atmosphere", false, function(_)
        t2[65]()
    end, 180)
    v726(v779, "Fog Density", 0, 100, 35, function(p243)
        t2[22].CustomAtmosphere.Density = p243 / 100

        if t2[22].CustomAtmosphere.Enabled then
            t2[65]()
        end
    end, 180)
    v726(v779, "Haze", 0, 200, 90, function(p244)
        t2[22].CustomAtmosphere.Haze = p244 / 100

        if t2[22].CustomAtmosphere.Enabled then
            t2[65]()
        end
    end, 180)
    v726(v779, "Glare", 0, 100, 12, function(p245)
        t2[22].CustomAtmosphere.Glare = p245 / 100

        if t2[22].CustomAtmosphere.Enabled then
            t2[65]()
        end
    end, 180)
    local v780 = v724(v766, "Chams", 190)
    v730(v725(v780, "PlayerChams", "Player Chams", false, function(p246)
        v85(p246)
    end, 180))
    v730(v725(v780, "WeaponChams", "Knife + Weapon", false, function(p247)
        t2[167](p247)
    end, 180))
    local v781 = v724(v767, "Preview", 190)
    t68[40] = Instance.new("Frame", v781)
    t68[40].Size = UDim2.new(0, 180, 0, 28)
    t68[40].BackgroundColor3 = t2[37]
    t68[40].BackgroundTransparency = 0.15
    t68[40].ZIndex = 2
    Instance.new("UICorner", t68[40]).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", t68[40]).Color = Color3.fromRGB(70, 75, 90)
    t68[41] = Instance.new("TextLabel", t68[40])
    t68[41].Size = UDim2.new(1, -8, 1, 0)
    t68[41].Position = UDim2.new(0, 4, 0, 0)
    t68[41].BackgroundTransparency = 1
    t68[41].Text = "Chams color preview"
    t68[41].TextColor3 = Color3.fromRGB(240, 245, 255)
    t68[41].Font = Enum.Font.GothamMedium
    t68[41].TextSize = 10
    t68[41].ZIndex = 3
    task.spawn(function()
        while t2[38].Parent do
            local _, v1362 = t2[156]()

            t68[40].BackgroundColor3 = v1362
            t68[41].Text = not t2[22].ChamsColor.Adaptive and "Custom color" or "Adaptive: sky + atmosphere"

            if t2[22].ChamsColor.Adaptive then
                v727()

                if t2[22].PlayerChams.Enabled or t2[22].WeaponChams.Enabled then
                    t2[153]()
                end
            end

            task.wait(0.5)
        end
    end)
    local function v782(p248, p249)
        if p248 and p249 then
            p248.Color = p249
        end
    end
    local n9 = 88
    local n10 = 10
    if t67[2] == nil or type(t67[2]) ~= "number" then
        t67[2] = 170
    end
    local v785 = n9 + n10 + 170 + n10 + n9
    local Frame60 = Instance.new("Frame")
    Frame60.Name = "TopToggleFrame"
    Frame60.Size = UDim2.new(0, v785, 0, 34)
    Frame60.Position = UDim2.new(0.5, -math.floor(v785 / 2), 0, 14)
    Frame60.BackgroundTransparency = 1
    Frame60.ZIndex = 150
    Frame60.Parent = t2[38]
    local v787, _, v789 = v64(Frame60, n9, 30, 150)
    t68[42] = v787
    t68[42].Name = "FpsBanner"
    t68[42].Position = UDim2.new(0, 0, 0, 2)
    t68[42].Visible = false
    local Frame61 = Instance.new("Frame", t68[42])
    Frame61.Size = UDim2.new(0, 20, 0, 16)
    Frame61.Position = UDim2.new(0, 10, 0.5, -8)
    Frame61.BackgroundTransparency = 1
    Frame61.ZIndex = 151
    local v791 = (function(p250)
        local Frame62 = Instance.new("Frame")

        Frame62.Size = UDim2.new(0, 18, 0, 16)
        Frame62.BackgroundTransparency = 1
        Frame62.Name = "FpsIcon"
        Frame62.Parent = p250

        for i = 1, 4 do
            local Frame63 = Instance.new("Frame", Frame62)

            Frame63.Name = "Bar" .. i
            Frame63.Size = UDim2.new(0, 3, 0, i * 2 + 4)
            Frame63.Position = UDim2.new(0, (i - 1) * 4, 1, -(i * 2 + 4))
            Frame63.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
            Instance.new("UICorner", Frame63).CornerRadius = UDim.new(0, 2)
        end

        return Frame62
    end)(Frame61)
    t68[43] = Instance.new("TextLabel", t68[42])
    t68[43].Size = UDim2.new(1, -34, 1, 0)
    t68[43].Position = UDim2.new(0, 32, 0, 0)
    t68[43].BackgroundTransparency = 1
    t68[43].Text = "FPS 60"
    t68[43].TextColor3 = t2[53]
    t68[43].Font = Enum.Font.GothamBold
    t68[43].TextSize = 11
    t68[43].TextXAlignment = Enum.TextXAlignment.Left
    t68[43].ZIndex = 151
    local v792, _, _ = v64(Frame60, t67[2], 34, 150)
    v792.Position = UDim2.new(0, n9 + n10, 0, 0)
    local TextButton = Instance.new("TextButton", v792)
    TextButton.Name = "ToggleBtn"
    TextButton.Size = UDim2.new(1, 0, 1, 0)
    TextButton.BackgroundTransparency = 1
    TextButton.RichText = true
    TextButton.Text = "<font color=\"#E8EEF7\">Kitagawa</font><font color=\"#5FAFFF\">Hub</font>"
    TextButton.Font = Enum.Font.GothamBold
    TextButton.TextSize = 13
    TextButton.ZIndex = 151
    local v796, _, v798 = v64(Frame60, n9, 30, 150)
    t68[44] = v796
    t68[44].Name = "PingBanner"
    t68[44].Position = UDim2.new(0, n9 + n10 + t67[2] + n10, 0, 2)
    t68[44].Visible = false
    local Frame64 = Instance.new("Frame", t68[44])
    Frame64.Size = UDim2.new(0, 20, 0, 16)
    Frame64.Position = UDim2.new(0, 10, 0.5, -8)
    Frame64.BackgroundTransparency = 1
    Frame64.ZIndex = 151
    local v800 = (function(p251)
        local Frame65 = Instance.new("Frame")

        Frame65.Size = UDim2.new(0, 20, 0, 16)
        Frame65.BackgroundTransparency = 1
        Frame65.Name = "WifiIcon"
        Frame65.Parent = p251

        local Frame66 = Instance.new("Frame", Frame65)

        Frame66.Name = "Dot"
        Frame66.Size = UDim2.new(0, 4, 0, 4)
        Frame66.Position = UDim2.new(0.5, -2, 1, -4)
        Frame66.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        Instance.new("UICorner", Frame66).CornerRadius = UDim.new(1, 0)

        for i = 1, 3 do
            local Frame67 = Instance.new("Frame", Frame65)

            Frame67.Name = "Arc" .. i
            Frame67.Size = UDim2.new(0, i * 4 + 6, 0, 3)
            Frame67.Position = UDim2.new(0.5, -(i * 2 + 3), 1, -6 - i * 3)
            Frame67.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
            Instance.new("UICorner", Frame67).CornerRadius = UDim.new(1, 0)
        end

        return Frame65
    end)(Frame64)
    t68[45] = Instance.new("TextLabel", t68[44])
    local v801 = t68[45]
    v801.Size = UDim2.new(1, -34, 1, 0)
    local v802 = t68[45]
    v802.Position = UDim2.new(0, 32, 0, 0)
    local v803 = t68[45]
    v803.BackgroundTransparency = 1
    local v804 = t68[45]
    v804.Text = "0ms"
    local v805 = t68[45]
    v805.TextColor3 = t2[53]
    local v806 = t68[45]
    v806.Font = Enum.Font.GothamBold
    local v807 = t68[45]
    v807.TextSize = 11
    local v808 = t68[45]
    v808.TextXAlignment = Enum.TextXAlignment.Left
    local v809 = t68[45]
    v809.ZIndex = 151
    v63(Frame60, nil, TextButton);
    (function(p252, p253)
        if not p252 then
            return
        end

        for _, descendant in pairs(p252:GetDescendants()) do
            if descendant:IsA("Frame") then
                descendant.BackgroundColor3 = p253
            end
        end
    end)(v791, t2[52])
    t67[1](v800, t2[52])
    v782(v789, t2[51])
    v782(v798, t2[51])
    local v810 = t68[43]
    v810.TextColor3 = t2[53]
    local v811 = t68[45]
    v811.TextColor3 = t2[53]
    t67[1] = function()
        t68[1].Visible = not t68[1].Visible
    end
    TextButton.MouseButton1Click:Connect(t67[1])
    t67[1] = table
    t67[2] = function(p254, p255, p256)
        local t76 = {}
        local t77 = {
			[1] = p254
		}
        t77[2] = Instance.new("UIScale", t77[1])
        t77[3] = Instance.new("UIScale", p255)
        t77[4] = Instance.new("UIScale", p256)
        t77[1].AnchorPoint = Vector2.new(0.5, 0.5)
        t77[1].Position = UDim2.new(0.5, 0, 0.5, 0)
        p255.AnchorPoint = Vector2.new(0.5, 0)
        p255.Position = UDim2.new(0.5, 0, 0, 14)
        local function v1370()
            t77[2].Scale = math.clamp((t2[22].UIScale.Gui or 100) / 100, 0.6, 1.6)

            local v1803 = math.clamp((t2[22].UIScale.Hud or 100) / 100, 0.6, 1.6)

            t77[3].Scale = v1803
            t77[4].Scale = v1803
        end
        local function v1371(p257, p258, p259)
            local TextButton10 = Instance.new("TextButton", t77[1])

            TextButton10.Name = p257 .. "Button"
            TextButton10.Size = UDim2.new(0, 28, 0, 28)
            TextButton10.Position = UDim2.new(1, p258, 0, 10)
            TextButton10.BackgroundColor3 = Color3.fromRGB(26, 28, 35)
            TextButton10.BackgroundTransparency = 0.25
            TextButton10.Text = ""
            TextButton10.AutoButtonColor = false
            TextButton10.ZIndex = 20
            Instance.new("UICorner", TextButton10).CornerRadius = UDim.new(0, 8)

            local UIStroke18 = Instance.new("UIStroke", TextButton10)

            UIStroke18.Color = Color3.fromRGB(52, 56, 70)
            UIStroke18.Transparency = 0.25

            local v1809 = t68[13](p257, Color3.fromRGB(165, 172, 188), 17)

            v1809.Position = UDim2.new(0.5, -8.5, 0.5, -8.5)
            v1809.ZIndex = 21
            v1809.Parent = TextButton10
            TextButton10.MouseEnter:Connect(function()
                v700(v1809, Color3.fromRGB(240, 245, 255))
                UIStroke18.Color = t2[52]
            end)
            TextButton10.MouseLeave:Connect(function()
                v700(v1809, Color3.fromRGB(165, 172, 188))
                UIStroke18.Color = Color3.fromRGB(52, 56, 70)
            end)

            if not p259 then
                p259 = TextButton10.Name
            end

            TextButton10.Name = p259

            return TextButton10
        end
        local v1372 = v1371("note", -70, "ConfigButton")
        local v1373 = v1371("gear", -38, "SettingsButton")
        local function v1374(p260, p261, p262)
            local Frame68 = Instance.new("Frame")

            Frame68.Size = UDim2.new(0, p261, 0, p262)
            Frame68.AnchorPoint = Vector2.new(0.5, 0.5)
            Frame68.Position = UDim2.new(0.5, 0, 0.5, 0)
            Frame68.BackgroundColor3 = Color3.fromRGB(19, 20, 26)
            Frame68.BackgroundTransparency = 0.02
            Frame68.BorderSizePixel = 0
            Frame68.Visible = false
            Frame68.ZIndex = 300
            Frame68.Parent = t2[38]
            Instance.new("UICorner", Frame68).CornerRadius = UDim.new(0, 10)

            local UIStroke19 = Instance.new("UIStroke", Frame68)

            UIStroke19.Color = Color3.fromRGB(58, 63, 78)
            UIStroke19.Transparency = 0.1

            local Frame69 = Instance.new("Frame", Frame68)

            Frame69.Size = UDim2.new(1, 0, 0, 34)
            Frame69.BackgroundColor3 = Color3.fromRGB(25, 27, 34)
            Frame69.BackgroundTransparency = 0.15
            Frame69.BorderSizePixel = 0
            Frame69.ZIndex = 301
            Instance.new("UICorner", Frame69).CornerRadius = UDim.new(0, 10)

            local TextLabel24 = Instance.new("TextLabel", Frame69)

            TextLabel24.Size = UDim2.new(1, -44, 1, 0)
            TextLabel24.Position = UDim2.new(0, 14, 0, 0)
            TextLabel24.BackgroundTransparency = 1

            local s13 = ""

            TextLabel24.Text = s13 .. if t2[29] ~= "RU" then p260 else t2[31][p260] or p260
            table.insert(t2[30], {
				inst = TextLabel24,
				prop = "Text",
				en = p260,
				prefix = s13
			})
            TextLabel24.TextColor3 = Color3.fromRGB(238, 242, 250)
            TextLabel24.Font = Enum.Font.GothamBold
            TextLabel24.TextSize = 12
            TextLabel24.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel24.ZIndex = 302

            local TextButton11 = Instance.new("TextButton", Frame69)

            TextButton11.Size = UDim2.new(0, 24, 0, 24)
            TextButton11.Position = UDim2.new(1, -30, 0.5, -12)
            TextButton11.BackgroundTransparency = 1
            TextButton11.Text = "×"
            TextButton11.TextColor3 = Color3.fromRGB(150, 155, 168)
            TextButton11.Font = Enum.Font.GothamBold
            TextButton11.TextSize = 17
            TextButton11.ZIndex = 303
            TextButton11.MouseButton1Click:Connect(function()
                Frame68.Visible = false
            end)
            pcall(function()
                v63(Frame68, nil, Frame69)
            end)

            return Frame68
        end
        local function v1375(p263, p264, p265, p266, p267, p268, p269)
            local Frame70 = Instance.new("Frame", p263)

            Frame70.Size = UDim2.new(1, -28, 0, 52)
            Frame70.Position = UDim2.new(0, 14, 0, p265)
            Frame70.BackgroundColor3 = Color3.fromRGB(27, 29, 37)
            Frame70.BackgroundTransparency = 0.2
            Frame70.ZIndex = 301
            Instance.new("UICorner", Frame70).CornerRadius = UDim.new(0, 8)

            local UIStroke20 = Instance.new("UIStroke", Frame70)

            UIStroke20.Color = Color3.fromRGB(48, 52, 66)
            UIStroke20.Transparency = 0.3

            local TextLabel25 = Instance.new("TextLabel", Frame70)

            TextLabel25.Size = UDim2.new(1, -60, 0, 22)
            TextLabel25.Position = UDim2.new(0, 12, 0, 6)
            TextLabel25.BackgroundTransparency = 1

            local s14 = ""

            TextLabel25.Text = s14 .. if t2[29] ~= "RU" then p264 else t2[31][p264] or p264
            table.insert(t2[30], {
				inst = TextLabel25,
				prop = "Text",
				en = p264,
				prefix = s14
			})
            TextLabel25.TextColor3 = Color3.fromRGB(214, 220, 232)
            TextLabel25.Font = Enum.Font.GothamMedium
            TextLabel25.TextSize = 11
            TextLabel25.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel25.ZIndex = 302

            local TextLabel26 = Instance.new("TextLabel", Frame70)

            TextLabel26.Size = UDim2.new(0, 48, 0, 22)
            TextLabel26.Position = UDim2.new(1, -58, 0, 6)
            TextLabel26.BackgroundTransparency = 1
            TextLabel26.Text = tostring(p268()) .. "%"
            TextLabel26.TextColor3 = t2[52]
            TextLabel26.Font = Enum.Font.GothamBold
            TextLabel26.TextSize = 11
            TextLabel26.TextXAlignment = Enum.TextXAlignment.Right
            TextLabel26.ZIndex = 302

            local TextButton12 = Instance.new("TextButton", Frame70)

            TextButton12.Size = UDim2.new(1, -24, 0, 6)
            TextButton12.Position = UDim2.new(0, 12, 0, 34)
            TextButton12.BackgroundColor3 = Color3.fromRGB(44, 47, 58)
            TextButton12.Text = ""
            TextButton12.AutoButtonColor = false
            TextButton12.ZIndex = 302
            Instance.new("UICorner", TextButton12).CornerRadius = UDim.new(1, 0)

            local Frame71 = Instance.new("Frame", TextButton12)

            Frame71.Size = UDim2.new((p268() - p266) / (p267 - p266), 0, 1, 0)
            Frame71.BackgroundColor3 = t2[52]
            Frame71.BorderSizePixel = 0
            Frame71.ZIndex = 303
            Instance.new("UICorner", Frame71).CornerRadius = UDim.new(1, 0)

            local Frame72 = Instance.new("Frame", TextButton12)

            Frame72.Size = UDim2.new(0, 13, 0, 13)
            Frame72.AnchorPoint = Vector2.new(0.5, 0.5)
            Frame72.Position = UDim2.new((p268() - p266) / (p267 - p266), 0, 0.5, 0)
            Frame72.BackgroundColor3 = Color3.fromRGB(245, 248, 255)
            Frame72.BorderSizePixel = 0
            Frame72.ZIndex = 304
            Instance.new("UICorner", Frame72).CornerRadius = UDim.new(1, 0)

            local u1834 = false

            local function v1835(p270)
                local v1953 = (p270 - p266) / (p267 - p266)

                Frame71.Size = UDim2.new(v1953, 0, 1, 0)
                Frame72.Position = UDim2.new(v1953, 0, 0.5, 0)
                TextLabel26.Text = tostring(p270) .. "%"
            end
            local function v1836()
                local v1954 = math.clamp((t2[3]:GetMouseLocation().X - TextButton12.AbsolutePosition.X) / math.max(TextButton12.AbsoluteSize.X, 1), 0, 1)
                local v1955 = math.round(p266 + (p267 - p266) * v1954)

                v1835(v1955)
                p269(v1955)
            end

            TextButton12.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    u1834 = true
                    v1836()
                end
            end)
            t2[3].InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    u1834 = false
                end
            end)
            t2[3].InputChanged:Connect(function(input)
                if u1834 and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    v1836()
                end
            end)

            return function()
                v1835(p268())
            end
        end
        local function v1376(p271, p272, p273, p274, p275, p276, p277)
            local TextButton13 = Instance.new("TextButton", p271)

            TextButton13.Size = UDim2.new(0, p275, 0, p276)
            TextButton13.Position = UDim2.new(0, p273, 0, p274)
            TextButton13.BackgroundColor3 = p277 and Color3.fromRGB(38, 44, 60) or Color3.fromRGB(32, 35, 44)
            TextButton13.BackgroundTransparency = 0.1
            TextButton13.TextColor3 = p277 and Color3.fromRGB(232, 240, 255) or Color3.fromRGB(210, 216, 230)
            TextButton13.Font = Enum.Font.GothamMedium
            TextButton13.TextSize = 11
            TextButton13.AutoButtonColor = false
            TextButton13.ZIndex = 302

            local s15 = ""

            TextButton13.Text = s15 .. if t2[29] ~= "RU" then p272 else t2[31][p272] or p272
            table.insert(t2[30], {
				inst = TextButton13,
				prop = "Text",
				en = p272,
				prefix = s15
			})
            Instance.new("UICorner", TextButton13).CornerRadius = UDim.new(0, 8)

            local UIStroke21 = Instance.new("UIStroke", TextButton13)
            local v1847 = p277

            if p277 then
                v1847 = t2[52]
            end

            UIStroke21.Color = v1847 or Color3.fromRGB(50, 54, 68)
            UIStroke21.Transparency = not p277 and 0 or 0.35
            TextButton13.MouseEnter:Connect(function()
                TextButton13.BackgroundTransparency = 0
            end)
            TextButton13.MouseLeave:Connect(function()
                TextButton13.BackgroundTransparency = 0.1
            end)

            return TextButton13
        end
        t77[5] = v1374("Interface Settings", 290, 392)
        t77[6] = Instance.new("Frame", t77[5])
        t77[6].Size = UDim2.new(1, -28, 0, 72)
        t77[6].Position = UDim2.new(0, 14, 0, 38)
        t77[6].BackgroundColor3 = Color3.fromRGB(27, 29, 37)
        t77[6].BackgroundTransparency = 0.2
        t77[6].ZIndex = 301
        Instance.new("UICorner", t77[6]).CornerRadius = UDim.new(0, 8)
        local UIStroke22 = Instance.new("UIStroke", t77[6])
        UIStroke22.Color = Color3.fromRGB(48, 52, 66)
        UIStroke22.Transparency = 0.3
        local function v1378(p278, p279, p280)
            local TextLabel27 = Instance.new("TextLabel", t77[6])

            TextLabel27.Size = UDim2.new(0, 92, 0, 16)
            TextLabel27.Position = UDim2.new(0, 10, 0, p278)
            TextLabel27.BackgroundTransparency = 1

            local s16 = ""

            TextLabel27.Text = s16 .. if t2[29] ~= "RU" then p279 else t2[31][p279] or p279
            table.insert(t2[30], {
				inst = TextLabel27,
				prop = "Text",
				en = p279,
				prefix = s16
			})
            TextLabel27.TextColor3 = Color3.fromRGB(130, 136, 152)
            TextLabel27.Font = Enum.Font.Gotham
            TextLabel27.TextSize = 10
            TextLabel27.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel27.ZIndex = 302

            local TextLabel28 = Instance.new("TextLabel", t77[6])

            TextLabel28.Size = UDim2.new(1, -108, 0, 16)
            TextLabel28.Position = UDim2.new(0, 98, 0, p278)
            TextLabel28.BackgroundTransparency = 1
            TextLabel28.Text = p280
            TextLabel28.TextColor3 = Color3.fromRGB(232, 238, 250)
            TextLabel28.Font = Enum.Font.GothamMedium
            TextLabel28.TextSize = 10
            TextLabel28.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel28.TextTruncate = Enum.TextTruncate.AtEnd
            TextLabel28.ZIndex = 302

            return TextLabel28
        end
        v1378(8, "Executor", t2[23].name)
        v1378(26, "Platform", t2[23].platform)
        v1378(44, "Recommended GUI", tostring(t2[23].guiScale) .. "% / HUD " .. tostring(t2[23].hudScale) .. "%")
        t77[7] = v1376(t77[5], "Auto GUI for executor", 14, 118, 130, 26, t2[22].UIScaleAuto ~= false)
        local v1379 = v1376(t77[5], "Apply executor size", 152, 118, 128, 26, true)
        t77[8] = function()
            local v1854 = t2[22].UIScaleAuto ~= false

            t77[7].BackgroundColor3 = v1854 and Color3.fromRGB(44, 50, 66) or Color3.fromRGB(34, 37, 47)
            t77[7].TextColor3 = v1854 and Color3.fromRGB(238, 244, 255) or Color3.fromRGB(160, 166, 180)
        end
        t77[7].MouseButton1Click:Connect(function()
            t2[22].UIScaleAuto = t2[22].UIScaleAuto == false
            t77[8]()

            if t2[22].UIScaleAuto then
                t2[28]()
                t77[2].Scale = math.clamp((t2[22].UIScale.Gui or 100) / 100, 0.6, 1.6)

                local v1855 = math.clamp((t2[22].UIScale.Hud or 100) / 100, 0.6, 1.6)

                t77[3].Scale = v1855
                t77[4].Scale = v1855
                refreshGui()
                refreshHud()
            end
        end)
        t77[8]()
        v1379.MouseButton1Click:Connect(function()
            t2[22].UIScaleAuto = true
            t77[8]()
            t2[28]()
            t77[2].Scale = math.clamp((t2[22].UIScale.Gui or 100) / 100, 0.6, 1.6)

            local v1856 = math.clamp((t2[22].UIScale.Hud or 100) / 100, 0.6, 1.6)

            t77[3].Scale = v1856
            t77[4].Scale = v1856
            refreshGui()
            refreshHud()
        end)
        t77[9] = v1375(t77[5], "GUI Size", 154, 60, 150, function()
            return t2[22].UIScale.Gui
        end, function(p281)
            t2[22].UIScaleAuto = false
            t2[22].UIScale.Gui = p281
            t77[2].Scale = math.clamp((t2[22].UIScale.Gui or 100) / 100, 0.6, 1.6)

            local v1858 = math.clamp((t2[22].UIScale.Hud or 100) / 100, 0.6, 1.6)

            t77[3].Scale = v1858
            t77[4].Scale = v1858
        end)
        t77[10] = v1375(t77[5], "KeyBind List + banner + FPS/Ping", 214, 60, 150, function()
            return t2[22].UIScale.Hud
        end, function(p282)
            t2[22].UIScaleAuto = false
            t2[22].UIScale.Hud = p282
            t77[2].Scale = math.clamp((t2[22].UIScale.Gui or 100) / 100, 0.6, 1.6)

            local v1860 = math.clamp((t2[22].UIScale.Hud or 100) / 100, 0.6, 1.6)

            t77[3].Scale = v1860
            t77[4].Scale = v1860
        end)
        local v1380 = v1376(t77[5], "Reset Sizes", 14, 276, 266, 28, false)
        local Frame73 = Instance.new("Frame", t77[5])
        Frame73.Size = UDim2.new(1, -28, 0, 44)
        Frame73.Position = UDim2.new(0, 14, 0, 314)
        Frame73.BackgroundColor3 = Color3.fromRGB(27, 29, 37)
        Frame73.BackgroundTransparency = 0.2
        Frame73.ZIndex = 301
        Instance.new("UICorner", Frame73).CornerRadius = UDim.new(0, 8)
        local UIStroke23 = Instance.new("UIStroke", Frame73)
        UIStroke23.Color = Color3.fromRGB(48, 52, 66)
        UIStroke23.Transparency = 0.3
        local TextLabel29 = Instance.new("TextLabel", Frame73)
        TextLabel29.Size = UDim2.new(0, 100, 1, 0)
        TextLabel29.Position = UDim2.new(0, 12, 0, 0)
        TextLabel29.BackgroundTransparency = 1
        local s17 = ""
        TextLabel29.Text = s17 .. (t2[29] ~= "RU" and "Language" or (t2[31].Language or "Language"))
        table.insert(t2[30], {
			inst = TextLabel29,
			prop = "Text",
			en = "Language",
			prefix = s17
		})
        TextLabel29.TextColor3 = Color3.fromRGB(214, 220, 232)
        TextLabel29.Font = Enum.Font.GothamMedium
        TextLabel29.TextSize = 11
        TextLabel29.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel29.ZIndex = 302
        t77[11] = {}
        t77[12] = nil
        for i, v in ipairs({
			"EN",
			"RU"
		}) do
            local v1387 = v

            t76[1] = Instance.new("TextButton", Frame73)
            t76[3] = UDim2.new(0, 48, 0, 26)
            t76[1].Size = t76[3]
            t76[3] = UDim2.new(1, -108 + (i - 1) * 52, 0.5, -13)
            t76[1].Position = t76[3]
            t76[3] = Color3.fromRGB(34, 37, 47)
            t76[1].BackgroundColor3 = t76[3]
            t76[1].Text = v1387
            t76[3] = Color3.fromRGB(160, 166, 180)
            t76[1].TextColor3 = t76[3]
            t76[2] = Enum.Font.GothamBold
            t76[1].Font = t76[2]
            t76[1].TextSize = 11
            t76[1].AutoButtonColor = false
            t76[1].ZIndex = 303
            t76[2] = Instance.new("UICorner", t76[1])
            t76[4] = UDim.new(0, 7)
            t76[2].CornerRadius = t76[4]
            t76[2] = Instance.new("UIStroke", t76[1])
            t76[4] = Color3.fromRGB(52, 56, 70)
            t76[2].Color = t76[4]
            t76[2].Transparency = 0.3

            local v1388 = t77[11]

            t76[3] = v1387
            v1388[t76[3]] = {
				btn = t76[1],
				stroke = t76[2]
			}

            local MouseButton1Click2 = t76[1].MouseButton1Click

            t76[4] = function()
                t77[12](v1387)
            end
            t76[3] = MouseButton1Click2.Connect
            t76[3](MouseButton1Click2, t76[4])
        end
        t77[12] = function(p283)
            t2[22].Language = p283

            for k, v in pairs(t77[11]) do
                local v1864 = k == p283

                v.btn.BackgroundColor3 = v1864 and Color3.fromRGB(44, 50, 66) or Color3.fromRGB(34, 37, 47)
                v.btn.TextColor3 = v1864 and Color3.fromRGB(238, 244, 255) or Color3.fromRGB(160, 166, 180)
                v.stroke.Color = v1864 and t2[52] or Color3.fromRGB(52, 56, 70)
                v.stroke.Transparency = not v1864 and 0.3 or 0.25
            end

            v57()
        end
        t77[12](t2[22].Language or "EN")
        t77[13] = "KitagawaHub/configs"
        t77[14] = v1374("Config Directory", 300, 312)
        t77[15] = function()
            if not isfolder or not makefolder then
                return false
            end

            pcall(function()
                if not isfolder("KitagawaHub") then
                    makefolder("KitagawaHub")
                end

                if not isfolder(t77[13]) then
                    makefolder(t77[13])
                end
            end)

            return true
        end
        local function v1390()
            local t78 = {}

            for k, v in pairs(t2[22]) do
                local v1868 = k

                if type(v) == "table" then
                    local t79 = {}

                    for k2, v6 in pairs(v) do
                        local v1872 = typeof(v6)
                        local v1873 = k2

                        if v1872 == "boolean" or (v1872 == "number" or v1872 == "string") then
                            t79[v1873] = v6
                        elseif v1872 == "EnumItem" then
                            t79[v1873] = {
								__key = v6.Name
							}
                        end
                    end

                    t78[v1868] = t79
                else
                    local v1874 = type(v) ~= "function"

                    if v1874 then
                        v1874 = type(v) ~= "userdata"
                    end

                    if v1874 then
                        t78[v1868] = v
                    end
                end
            end

            return t2[11]:JSONEncode(t78)
        end
        local function v1391(p284)

            for v1878, v1879 in pairs(p284) do

                local v1880 = v1878
                local v1881 = type(v1879) == "table"

                if v1881 then
                    v1881 = type(t2[22][v1880]) == "table"
                end

                if v1881 then
                    for k, v in pairs(v1879) do
                        local v1884 = v

                        if k ~= "Enabled" then
                            if type(v1884) == "table" and v1884.__key then
                                pcall(function()
                                    t2[22][v1880][k] = Enum.KeyCode[v1884.__key]
                                end)
                            else
                                t2[22][v1880][k] = v1884
                            end
                        end
                    end
                else
                    local v1885 = type(v1879) ~= "table"

                    if v1885 then
                        v1885 = t2[22][v1880] ~= nil
                    end

                    if v1885 then
                        t2[22][v1880] = v1879
                    end
                end
            end
            for v1888, v1889 in pairs(p284) do

                local v1890 = v1888
                local v1891 = v1889

                if type(v1891) == "table" and (v1891.Enabled ~= nil and type(t2[22][v1890]) == "table") then
                    if t2[32][v1890] then
                        pcall(function()
                            t2[32][v1890](v1891.Enabled)
                        end)
                    else
                        t2[22][v1890].Enabled = v1891.Enabled
                    end
                end
            end
            pcall(function()
                if t2[22].UIScaleAuto ~= false then
                    t2[28]()
                end
            end)
            pcall(v1370)
            pcall(function()
                t77[12](t2[22].Language or "EN")
            end)
            for _, v in ipairs(t2[184]) do
                pcall(v)
            end
        end
        t77[16] = Instance.new("TextBox", t77[14])
        local v1392 = t77[16]
        v1392.Size = UDim2.new(1, -28, 0, 30)
        local v1393 = t77[16]
        v1393.Position = UDim2.new(0, 14, 0, 44)
        local v1394 = t77[16]
        v1394.BackgroundColor3 = Color3.fromRGB(26, 28, 35)
        local v1395 = t77[16]
        v1395.BackgroundTransparency = 0.15
        local v1396 = t77[16]
        v1396.Text = ""
        local v1397 = t77[16]
        v1397.PlaceholderText = "Config name..."
        local v1398 = t77[16]
        v1398.TextColor3 = Color3.fromRGB(226, 232, 244)
        local v1399 = t77[16]
        v1399.PlaceholderColor3 = Color3.fromRGB(105, 110, 124)
        local v1400 = t77[16]
        v1400.Font = Enum.Font.Gotham
        local v1401 = t77[16]
        v1401.TextSize = 12
        local v1402 = t77[16]
        v1402.TextXAlignment = Enum.TextXAlignment.Left
        local v1403 = t77[16]
        v1403.ClearTextOnFocus = false
        local v1404 = t77[16]
        v1404.ZIndex = 302
        t76[1] = Instance.new("UICorner", t77[16])
        t76[1].CornerRadius = UDim.new(0, 8)
        t76[1] = Instance.new("UIStroke", t77[16])
        t76[1].Color = Color3.fromRGB(48, 52, 66)
        t76[1] = Instance.new("UIPadding", t77[16])
        t76[1].PaddingLeft = UDim.new(0, 10)
        t77[17] = Instance.new("ScrollingFrame", t77[14])
        local v1405 = t77[17]
        v1405.Size = UDim2.new(1, -28, 0, 148)
        local v1406 = t77[17]
        v1406.Position = UDim2.new(0, 14, 0, 82)
        local v1407 = t77[17]
        v1407.BackgroundColor3 = Color3.fromRGB(24, 26, 33)
        local v1408 = t77[17]
        v1408.BackgroundTransparency = 0.25
        local v1409 = t77[17]
        v1409.BorderSizePixel = 0
        local v1410 = t77[17]
        v1410.ScrollBarThickness = 3
        local v1411 = t77[17]
        v1411.CanvasSize = UDim2.new(0, 0, 0, 0)
        local v1412 = t77[17]
        v1412.AutomaticCanvasSize = Enum.AutomaticSize.Y
        local v1413 = t77[17]
        v1413.ZIndex = 302
        t76[1] = Instance.new("UICorner", t77[17])
        t76[1].CornerRadius = UDim.new(0, 8)
        t76[1] = Instance.new("UIStroke", t77[17])
        t76[1].Color = Color3.fromRGB(46, 50, 63)
        t76[1] = Instance.new("UIListLayout", t77[17])
        t76[1].Padding = UDim.new(0, 4)
        t76[4] = Instance.new("UIPadding", t77[17])
        t76[4].PaddingTop = UDim.new(0, 6)
        t76[4].PaddingLeft = UDim.new(0, 6)
        t76[4].PaddingRight = UDim.new(0, 6)
        local s18 = "PaddingBottom"
        local uDim = UDim.new(0, 6)
        t76[4][s18] = uDim
        t77[18] = s18
        t77[19] = s18
        local function v1416()
            local t80 = {}

            if not listfiles or not t77[15]() then
                return t80
            end

            local ok, result = pcall(listfiles, t77[13])
            local v1897 = not ok

            if not v1897 then
                v1897 = type(result) ~= "table"
            end

            if v1897 then
                return t80
            end

            for _, v in ipairs(result) do
                local v1900 = tostring(v):match("([^/\\]+)%.json$")

                if v1900 then
                    table.insert(t80, v1900)
                end
            end

            table.sort(t80)

            return t80
        end
        t77[19] = function()

            for v1903, v1904 in ipairs(t77[17]:GetChildren()) do

                if v1904:IsA("TextButton") or v1904:IsA("TextLabel") then
                    v1904:Destroy()
                end
            end
            local v1905 = v1416()
            if #v1905 == 0 then
                local TextLabel30 = Instance.new("TextLabel", t77[17])

                TextLabel30.Size = UDim2.new(1, 0, 0, 26)
                TextLabel30.BackgroundTransparency = 1

                local s19 = ""

                TextLabel30.Text = s19 .. (t2[29] ~= "RU" and "No saved configs yet" or (t2[31]["No saved configs yet"] or "No saved configs yet"))
                table.insert(t2[30], {
					inst = TextLabel30,
					prop = "Text",
					en = "No saved configs yet",
					prefix = s19
				})
                TextLabel30.TextColor3 = Color3.fromRGB(110, 115, 128)
                TextLabel30.Font = Enum.Font.Gotham
                TextLabel30.TextSize = 11
                TextLabel30.ZIndex = 303

                return
            end
            for _, v in ipairs(v1905) do
                local v1910 = v
                local TextButton14 = Instance.new("TextButton", t77[17])

                TextButton14.Size = UDim2.new(1, 0, 0, 26)
                TextButton14.BackgroundColor3 = v1910 == t77[18] and Color3.fromRGB(44, 50, 66) or Color3.fromRGB(31, 34, 43)
                TextButton14.BackgroundTransparency = 0.05
                TextButton14.Text = "  " .. v1910
                TextButton14.TextColor3 = v1910 == t77[18] and Color3.fromRGB(236, 242, 255) or Color3.fromRGB(186, 192, 206)
                TextButton14.Font = Enum.Font.GothamMedium
                TextButton14.TextSize = 11
                TextButton14.TextXAlignment = Enum.TextXAlignment.Left
                TextButton14.AutoButtonColor = false
                TextButton14.ZIndex = 303
                Instance.new("UICorner", TextButton14).CornerRadius = UDim.new(0, 6)

                local UIStroke24 = Instance.new("UIStroke", TextButton14)

                UIStroke24.Color = v1910 == t77[18] and t2[52] or Color3.fromRGB(44, 48, 60)
                UIStroke24.Transparency = v1910 ~= t77[18] and 0.5 or 0.3
                TextButton14.MouseButton1Click:Connect(function()
                    t77[18] = v1910
                    t77[16].Text = v1910
                    t77[19]()
                end)
            end
        end
        t77[20] = Instance.new("TextLabel", t77[14])
        t77[20].Size = UDim2.new(1, -28, 0, 16)
        t77[20].Position = UDim2.new(0, 14, 0, 234)
        t77[20].BackgroundTransparency = 1
        t77[20].Text = ""
        t77[20].TextColor3 = Color3.fromRGB(120, 200, 150)
        t77[20].Font = Enum.Font.Gotham
        t77[20].TextSize = 10
        t77[20].TextXAlignment = Enum.TextXAlignment.Left
        t77[20].ZIndex = 302
        t77[21] = 0
        local function v1417(p285, p286)
            t77[20].Text = p285

            local v1915 = t77[20]

            if p286 then
                p286 = Color3.fromRGB(220, 120, 120)
            end

            v1915.TextColor3 = p286 or Color3.fromRGB(120, 200, 150)
            t77[21] = t77[21] + 1

            local v1916 = t77[21]

            task.delay(3, function()
                if t77[21] == v1916 then
                    t77[20].Text = ""
                end
            end)
        end
        local v1418 = v1376(t77[14], "Save", 14, 256, 84, 30, true)
        local v1419 = v1376(t77[14], "Load", 106, 256, 84, 30, true)
        local v1420 = v1376(t77[14], "Delete", 198, 256, 88, 30, false)
        local function v1421(p287)
            local _tostring = tostring

            if not p287 then
                p287 = ""
            end

            return _tostring(p287):gsub("[^%w _%-]", ""):gsub("^%s+", ""):gsub("%s+$", "")
        end
        v1418.MouseButton1Click:Connect(function()
            local v1919 = v1421(t77[16].Text)

            if v1919 == "" then
                v1417("Enter a config name", true)

                return
            end

            if not writefile or not t77[15]() then
                v1417("Executor has no file access", true)

                return
            end

            if pcall(function()
                writefile(t77[13] .. "/" .. v1919 .. ".json", v1390())
            end) then
                t77[18] = v1919
                t77[19]()
                v1417("Saved: " .. v1919)

                return
            end

            v1417("Save failed", true)
        end)
        v1419.MouseButton1Click:Connect(function()
            local v1920 = t77[18] or v1421(t77[16].Text)
            if not v1920 or v1920 == "" then
                v1417("Select a config first", true)

                return
            end
            if not readfile or not isfile then
                v1417("Executor has no file access", true)

                return
            end
            local v1921 = t77[13] .. "/" .. v1920 .. ".json"
            local ok, result = pcall(readfile, v1921)
            local v1924 = result
            if not ok or not v1924 then
                v1417("Config not found", true)

                return
            end
            local u1925
            if not pcall(function()
                u1925 = t2[11]:JSONDecode(v1924)
            end) or type(u1925) ~= "table" then
                v1417("Broken config file", true)

                return
            end
            v1391(u1925)
            v1417("Loaded: " .. v1920)
        end)
        v1420.MouseButton1Click:Connect(function()
            local v1926 = t77[18]

            if not v1926 then
                v1417("Select a config first", true)

                return
            end

            if not delfile then
                v1417("Executor has no file access", true)

                return
            end

            pcall(delfile, t77[13] .. "/" .. v1926 .. ".json")
            t77[16].Text = ""
            t77[19]()
            v1417("Deleted: " .. v1926)
        end)
        t77[19]()
        v1380.MouseButton1Click:Connect(function()
            t2[22].UIScaleAuto = true
            t2[28]()
            t77[2].Scale = math.clamp((t2[22].UIScale.Gui or 100) / 100, 0.6, 1.6)

            local v1927 = math.clamp((t2[22].UIScale.Hud or 100) / 100, 0.6, 1.6)

            t77[3].Scale = v1927
            t77[4].Scale = v1927
            t77[9]()
            t77[10]()
            t77[8]()
        end)
        v1373.MouseButton1Click:Connect(function()
            t77[14].Visible = false
            t77[5].Visible = not t77[5].Visible
        end)
        v1372.MouseButton1Click:Connect(function()
            t77[5].Visible = false
            t77[14].Visible = not t77[14].Visible

            if t77[14].Visible then
                t77[19]()
            end
        end)
        t77[2].Scale = math.clamp((t2[22].UIScale.Gui or 100) / 100, 0.6, 1.6)
        local v1422 = math.clamp((t2[22].UIScale.Hud or 100) / 100, 0.6, 1.6)
        t77[3].Scale = v1422
        t77[4].Scale = v1422
    end
    t67[1].insert(t2[184], v701)
    table.insert(t2[184], v723)
    table.insert(t2[184], v727)
    t67[1] = table
    t67[1].insert(t2[184], function()
        for _, v in pairs(t2[36]) do
            v702(v, false)
        end
    end)
    t67[2](t68[1], Frame60, t68[28])
    t68[46] = 0
    t68[47] = tick()
    t2[2].RenderStepped:Connect(function()
        t68[42].Visible = t2[22].FpsBanner.Enabled
        t68[44].Visible = t2[22].PingBanner.Enabled

        if t2[22].FpsBanner.Enabled then
            t68[46] = t68[46] + 1

            if tick() - t68[47] >= 1 then
                t68[43].Text = "FPS " .. tostring(t68[46])
                tick()
            end
        end

        if t2[22].PingBanner.Enabled then
            t68[45].Text = tostring(t2[55]()) .. "ms"
        end
    end)
    local v812 = t2[183]
    v812.MainFrame = t68[1]
    local v813 = t2[183]
    v813.TopToggleFrame = Frame60
end)();
(function()
    local t81 = {
		[1] = nil,
		[2] = nil,
		[3] = {
			Idle = 185997187244500,
			Walk = 185997187244500,
			Run = 185997187244500
		},
		[4] = {},
		[5] = nil,
		[6] = nil
	}

    local function v815()
        local _pairs = pairs

        for _, v1427 in _pairs(t81[4]) do
            local v1428 = v1427

            if v1428 and v1428.IsPlaying then
                _pairs = pcall
                _pairs(function()
                    v1428:Stop(0.15)
                end)
            end
        end

        t81[5] = _pairs
    end
    local function v816(p288)
        if p288 ~= t81[6] then
            v815()
            t81[4] = {}
            t81[6] = nil
        end

        if t81[4].Idle then
            return
        end

        for k, v in pairs(t81[3]) do
            local Animation = Instance.new("Animation")

            Animation.AnimationId = "rbxassetid://" .. tostring(v)

            local track = p288:LoadAnimation(Animation)

            track.Priority = Enum.AnimationPriority.Action4
            track.Looped = true
            t81[4][k] = track
        end
    end
    local function v817(p289, p290)
        if not t2[22].FlyAura.Enabled or not p289 then
            return
        end

        v816(p289)

        local s20 = "Idle"

        if p290 > 28 then
            s20 = "Run"
        elseif p290 > 2 then
            s20 = "Walk"
        end

        if s20 == t81[5] then
            return
        end

        for k, v in pairs(t81[4]) do
            if k ~= s20 and v.IsPlaying then
                pcall(function()
                    v:Stop(0.12)
                end)
            end
        end

        local v1439 = t81[4][s20]

        if v1439 and not v1439.IsPlaying then
            v1439:Play(0.15, 1, 1)
        end
    end

    t2[13].CharacterAdded:Connect(function(character)
        v815()
        t81[4] = {}
        t81[6] = nil
        task.defer(function()
            local v1928 = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 5)

            if v1928 and t2[22].Movement then
                v1928.JumpHeight = (t2[22].Movement.JumpHeight or 50) / 50 * 7.2
            end
        end)
    end)
    t2[2].RenderStepped:Connect(function()
        if not t2[15] then
            return
        end

        local Character = t2[13].Character
        local v1442 = Character and Character:FindFirstChild("HumanoidRootPart")
        local v1443 = Character and Character:FindFirstChildOfClass("Humanoid")

        if t2[22].Fly.Enabled or t2[22].FlyAura.Enabled and v1442 then
            if not t81[1] then
                t81[1] = Instance.new("BodyVelocity")
                t81[1].MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
                t81[1].Parent = v1442
            end

            if not t81[2] then
                t81[2] = Instance.new("BodyGyro")
                t81[2].MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
                t81[2].P = 90000
                t81[2].Parent = v1442
            end

            local CurrentCamera = workspace.CurrentCamera
            local zero = Vector3.zero

            if t2[3]:IsKeyDown(Enum.KeyCode.W) then
                zero += CurrentCamera.CFrame.LookVector
            end

            if t2[3]:IsKeyDown(Enum.KeyCode.S) then
                zero -= CurrentCamera.CFrame.LookVector
            end

            if t2[3]:IsKeyDown(Enum.KeyCode.A) then
                zero -= CurrentCamera.CFrame.RightVector
            end

            if t2[3]:IsKeyDown(Enum.KeyCode.D) then
                zero += CurrentCamera.CFrame.RightVector
            end

            if t2[3]:IsKeyDown(Enum.KeyCode.Space) then
                zero += Vector3.new(0, 1, 0)
            end

            if t2[3]:IsKeyDown(Enum.KeyCode.LeftControl) then
                zero -= Vector3.new(0, 1, 0)
            end

            t81[2].CFrame = CurrentCamera.CFrame
            t81[1].Velocity = zero * (t2[22].Movement.FlySpeed or 50)

            if v1443 then
                v1443.PlatformStand = true

                if t2[22].FlyAura.Enabled then
                    local v1446 = Vector3.new(zero.X, 0, zero.Z).Magnitude * (t2[22].Movement.FlySpeed or 50)

                    v817(v1443, v1446)

                    return
                end

                v815()

                return
            end
        else
            if t81[1] then
                t81[1]:Destroy()
            end

            if t81[2] then
                t81[2]:Destroy()
            end

            v815()

            if v1442 and v1443 then
                v1443.PlatformStand = false
            end
        end
    end)
    t81[7] = function(p291)
        if not p291 then
            return
        end

        local Humanoid = p291:FindFirstChildOfClass("Humanoid")

        if Humanoid then
            pcall(function()
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                Humanoid.PlatformStand = false
                Humanoid.Sit = false
            end)
        end

        for _, descendant in ipairs(p291:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.CanCollide = false
            end
        end
    end
    t2[2].Stepped:Connect(function()
        if not t2[15] then
            return
        end

        local Character = t2[13].Character

        if not Character then
            return
        end

        if t2[22].Noclip.Enabled or t2[22].AutoFarmCoin.Enabled then
            t81[7](Character)
        end
    end)
    task.spawn(function()
        local n11 = 0.1

        while true do
            t2[2].Heartbeat:Wait()

            if t2[22].TouchFling.Enabled then
                local Character = t2[1].LocalPlayer.Character
                local v1454 = Character and Character:FindFirstChild("HumanoidRootPart")

                if v1454 then
                    local Velocity = v1454.Velocity

                    v1454.Velocity = Velocity * 10000 + Vector3.new(0, 10000, 0)
                    t2[2].RenderStepped:Wait()

                    if Character and (Character.Parent and (v1454 and v1454.Parent)) then
                        v1454.Velocity = Velocity
                    end

                    t2[2].Stepped:Wait()

                    if Character and (Character.Parent and (v1454 and v1454.Parent)) then
                        v1454.Velocity = Velocity + Vector3.new(0, n11, 0)
                        n11 *= -1
                    end
                end
            end
        end
    end)
    t81[8] = {
		"HumanoidRootPart",
		"UpperTorso",
		"Torso",
		"LowerTorso",
		"Head"
	}
    t81[9] = function(p292, p293)
        local v1462 = p292:FindFirstChild("Handle") or p292:FindFirstChildWhichIsA("BasePart")

        if v1462 and firetouchinterest then
            for _, v in ipairs(t81[8]) do
                local v7 = p293:FindFirstChild(v)

                if v7 and v7:IsA("BasePart") then
                    pcall(function()
                        firetouchinterest(v1462, v7, 0)
                        firetouchinterest(v1462, v7, 1)
                    end)
                end
            end
        end

        pcall(function()
            p292:Activate()
        end)

        if t2[90] then
            pcall(function()
                t2[90]()
            end)
        end

        local CurrentCamera = workspace.CurrentCamera
        local v1467 = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1280, 720)

        v74(v1467.X / 2, v1467.Y / 2, 0.015)
    end

    local function v818(p294)
        local Character = t2[13].Character
        local v1470 = Character and Character:FindFirstChild("HumanoidRootPart")
        local v1471 = Character and Character:FindFirstChildOfClass("Humanoid")

        if not v1470 or not v1471 then
            return
        end

        local Anchored = v1470.Anchored

        v1470.AssemblyLinearVelocity = Vector3.zero
        v1470.AssemblyAngularVelocity = Vector3.zero
        v1470.Anchored = true
        pcall(function()
            v1471.PlatformStand = true
        end)
        v1470.CFrame = p294
        pcall(function()
            Character:PivotTo(p294)
        end)
        task.wait(0.15)
        v1470.AssemblyLinearVelocity = Vector3.zero
        v1470.AssemblyAngularVelocity = Vector3.zero
        v1470.Anchored = Anchored
        pcall(function()
            v1471.PlatformStand = false
        end)
    end
    local function v819()
        local Character = t2[13].Character
        local v1474 = Character
        local Backpack = t2[13]:FindFirstChild("Backpack")

        if Character then
            v1474 = Character:FindFirstChild("Knife")
        end

        local u1476 = v1474 or Backpack and Backpack:FindFirstChild("Knife")

        if not u1476 then
            return false
        end

        local v1477 = Character and Character:FindFirstChild("HumanoidRootPart")
        local v1478 = Character and Character:FindFirstChildOfClass("Humanoid")

        if not v1477 or not v1478 then
            return false
        end

        if Backpack == u1476.Parent then
            pcall(function()
                v1478:EquipTool(u1476)
            end)
            task.wait(0.08)

            local Character6 = t2[13].Character

            v1477 = Character6 and Character6:FindFirstChild("HumanoidRootPart")

            if Character6 then
                Character6 = Character6:FindFirstChild("Knife")
            end

            local v1480 = not v1477

            u1476 = Character6 or u1476

            if not v1480 then
                v1480 = not u1476
            end

            if v1480 then
                return false
            end
        end

        local CFrame3 = v1477.CFrame
        local Anchored = v1477.Anchored
        local u1483 = u1476:FindFirstChild("Handle") or u1476:FindFirstChildWhichIsA("BasePart")

        for _, player in ipairs(t2[1]:GetPlayers()) do
            if not t2[22].MurderKillAll.Enabled then
                break
            end

            if player ~= t2[13] and (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
                local Humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                local v1487 = Humanoid

                if v1487 then
                    v1487 = false

                    if Humanoid.Health > 0 then
                        local v1488 = t2[18] and t2[18][player.Name]

                        if v1488 then
                            v1487 = not v1488.Killed and not v1488.Dead
                        else
                            local v1489 = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

                            v1487 = v1489 and v1489.Health > 0
                        end
                    end
                end

                if v1487 then
                    local Character7 = t2[13].Character

                    v1477 = Character7 and Character7:FindFirstChild("HumanoidRootPart")
                    u1476 = Character7 and Character7:FindFirstChild("Knife") or u1476
                    u1483 = u1476 and u1476:FindFirstChild("Handle") or u1476:FindFirstChildWhichIsA("BasePart")

                    if not v1477 or not u1476 then
                        break
                    end

                    v1477.Anchored = true
                    v818(player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.5))
                    task.wait(0.15)
                    pcall(function()
                        u1476:Activate()
                    end)

                    local v1491 = player.Character:FindFirstChild("HumanoidRootPart") or (player.Character:FindFirstChild("UpperTorso") or player.Character:FindFirstChild("Torso"))

                    if v1491 and (u1483 and firetouchinterest) then
                        pcall(function()
                            firetouchinterest(v1491, u1483, 0)
                            task.wait(0.05)
                            firetouchinterest(v1491, u1483, 1)
                        end)
                    end

                    t81[9](u1476, player.Character)
                    task.wait(0.1)
                end
            end
        end

        if v1477 and v1477.Parent then
            v1477.Anchored = Anchored
            v818(CFrame3)
        end

        return true
    end

    t81[10] = false
    task.spawn(function()
        while true do
            task.wait(0.05)

            if t2[15] and (t2[22].MurderKillAll.Enabled and not t81[10]) then
                t81[10] = true
                task.spawn(function()
                    while t2[22].MurderKillAll.Enabled do
                        v819()
                        task.wait(0.35)
                    end

                    t81[10] = false

                    if t2[32].MurderKillAll then
                        t2[32].MurderKillAll(false)
                    end
                end)
            end
        end
    end)
    t81[11] = false
    task.spawn(function()
        local g1501
        while task.wait(0.1) do
            if t2[15] and (t2[22].KillOnlySheriff.Enabled and not t81[11]) then
                local Character = t2[13].Character

                local function v1493(p295)
                    if not p295 then
                        return
                    end

                    for _, child in pairs(p295:GetChildren()) do
                        if child:IsA("Tool") and string.find(child.Name:lower(), "knife") then
                            return child
                        end
                    end
                end

                local v1494 = Character and Character:FindFirstChild("HumanoidRootPart")
                local v1495 = v1493(Character) or v1493(t2[13]:FindFirstChild("Backpack"))

                if v1495 and v1494 then
                    local v1496
                    local v1497, v1498, v1499 = pairs(t2[1]:GetPlayers())
                    local v1500
                    repeat
                        repeat
                            v1499, v1500 = v1497(v1498, v1499)

                            if not v1499 then
                                g1501 = true
                            end

                            if g1501 then
                                break
                            end
                        until v1500 ~= t2[13] and t2[73](v1500) == "Weapon"

                        if g1501 then
                            break
                        end

                        local v1502 = v1500.Character and v1500.Character:FindFirstChild("Humanoid")
                    until v1502 and v1502.Health > 0
                    if not g1501 then
                        v1496 = v1500
                    end
                    g1501 = false
                    if v1496 and (v1496.Character and v1496.Character:FindFirstChild("HumanoidRootPart")) then
                        t81[11] = true

                        if Character ~= v1495.Parent then
                            v1495.Parent = Character
                            task.wait(0.05)
                        end

                        local CFrame4 = v1494.CFrame

                        v1494.CFrame = v1496.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.5)
                        v1494.AssemblyLinearVelocity = Vector3.zero
                        task.wait(0.05)
                        v1495:Activate()

                        if mouse1click then
                            mouse1click()
                        end

                        pcall(function()
                            local ViewportSize = workspace.CurrentCamera.ViewportSize

                            t2[5]:SendMouseButtonEvent(ViewportSize.X / 2, ViewportSize.Y / 2, 0, true, game, 1)
                            task.wait(0.01)
                            t2[5]:SendMouseButtonEvent(ViewportSize.X / 2, ViewportSize.Y / 2, 0, false, game, 1)
                        end)
                        task.wait(0.3)
                        v1494.CFrame = CFrame4
                        v1494.AssemblyLinearVelocity = Vector3.zero

                        if t2[32].KillOnlySheriff then
                            t2[32].KillOnlySheriff(false)
                        end

                        t81[11] = false
                    end
                end
            end
        end
    end)
    t81[12] = nil
    t81[13] = nil
    t81[14] = {}
    t81[15] = 0
    t81[16] = 0
    t81[17] = 0
    t81[18] = nil
    t81[19] = nil
    t81[20] = 0
    t81[21] = 0
    t81[22] = 1
    t81[23] = 0.04
    t81[24] = false
    t81[25] = 17
    t81[26] = 2
    t81[27] = 2
    t81[28] = 58
    t81[29] = 26
    t81[30] = 36
    t81[31] = 0.82
    t81[32] = 0.32

    local new6 = RaycastParams.new

    t81[33] = nil
    t81[33] = new6()
    pcall(function()
        t81[33].FilterType = Enum.RaycastFilterType.Exclude
    end)

    local function v821(p296, p297)
        if not p296 or (not p297 or not firetouchinterest) then
            return
        end

        pcall(function()
            firetouchinterest(p296, p297, 0)
            firetouchinterest(p296, p297, 1)
        end)

        local v1511 = p297.Parent and p297.Parent.Parent

        if v1511 then
            local TouchInterest = v1511:FindFirstChild("TouchInterest", true)

            if TouchInterest then
                pcall(function()
                    firetouchinterest(p296, TouchInterest, 0)
                    firetouchinterest(p296, TouchInterest, 1)
                end)
            end
        end
    end
    local function v822(p298, p299)
        t81[33].FilterDescendantsInstances = { p299 }
        t81[33].IgnoreWater = true

        local raycastResult = workspace:Raycast(p298 + Vector3.new(0, 3, 0), Vector3.new(0, -500, 0), t81[33])

        return math.min(raycastResult and raycastResult.Position.Y or p298.Y - 12, p298.Y - 4) - t81[25]
    end
    local function v823()
        local t82 = {}

        for _, child in ipairs(workspace:GetChildren()) do
            for _, child2 in ipairs(child:GetChildren()) do
                if child2.Name == "CoinContainer" then
                    table.insert(t82, child2)
                end
            end
        end

        t81[14] = t82
        t81[15] = tick()

        local t83 = {}

        for _, v in ipairs(t82) do
            table.insert(t83, v:GetFullName())
        end

        table.sort(t83)

        local v1525 = #t83 > 0 and table.concat(t83, ", ") or "не найдено"

        if v1525 ~= t81[19] then
            local v1526 = "CoinContainer: " .. tostring(#t82) .. " | " .. v1525

            if t81[24] then
                print("[Kitagawa AutoFarm] " .. tostring(v1526))
            end
        end
    end
    local function v824(p300)
        if not p300 or not p300.Parent then
            return nil
        end

        local CoinVisual = p300:FindFirstChild("CoinVisual")

        if not CoinVisual then
            return nil
        end

        local MainCoin = CoinVisual:FindFirstChild("MainCoin")

        if not MainCoin or not MainCoin:IsA("BasePart") then
            return nil
        end

        return MainCoin
    end
    local function v825(p301, p302)
        local v1535 = not p301

        if not v1535 then
            v1535 = not p301.Parent

            if not v1535 then
                v1535 = not p302

                if not v1535 then
                    local v1536, g1539
                    if not p302 or not p302.Parent then
                        v1536 = false
                    else
                        g1539 = nil
                        v1536 = nil

                        for _, v in ipairs(t81[14]) do
                            if v == p302 then
                                v1536 = true
                                g1539 = true
                            end

                            if g1539 then
                                break
                            end
                        end

                        if not g1539 then
                            v1536 = false
                        end
                    end
                    v1535 = not v1536
                    if not v1535 then
                        v1535 = not p301:IsA("BasePart") or (p301.Name ~= "MainCoin" or (p301.Transparency ~= 0 or not p301:IsDescendantOf(p302)))
                    end
                end
            end
        end

        if v1535 then
            return false
        end

        local p301Parent = p301.Parent
        local v1541 = p301Parent and p301Parent.Parent

        return p301Parent.Name == "CoinVisual" and (v1541 ~= nil and p302 == v1541.Parent)
    end
    local function v826(p303)
        local v1543
        local v1544
        local huge = math.huge
        local n12 = 0
        local n13 = 0
        for _, v in ipairs(t81[14]) do
            if v and v.Parent then
                local GetChildren = v.GetChildren

                for _, v8 in ipairs(GetChildren(v)) do
                    n12 += 1

                    local v1553 = v824(v8)

                    if v1553 and v1553.Transparency == 0 then
                        n13 += 1

                        local Magnitude = (v1553.Position - p303.Position).Magnitude

                        if Magnitude < huge then
                            v1543 = v1553
                            v1544 = v
                            huge = Magnitude
                        end
                    end
                end
            end
        end

        return v1543, v1544, n12, n13
    end
    local function v827(p304, _, p306, p307, p308, p309)
        local p306Position = p306.Position
        local v1562 = v822(p306Position, p308)
        local v1563 = p306Position.Y - t81[27]
        local vector3 = Vector3.new(p306Position.X - p304.Position.X, 0, p306Position.Z - p304.Position.Z)
        local Magnitude = vector3.Magnitude

        if Magnitude > t81[26] then
            t81[20] = 0

            local v1566 = math.clamp(v1562 - p304.Position.Y, -t81[28] * p309, t81[28] * p309)
            local v1567 = p304.Position.Y <= v1562 + t81[25] * 0.45
            local v1568 = if not (Magnitude <= 6) then if not (Magnitude >= 24) then t81[29] + (t81[30] - t81[29]) * ((Magnitude - 6) / 18) else t81[30] else t81[29]

            if not v1567 then
                v1568 *= 0.35
            end

            local v1569 = math.min(v1568 * p309, Magnitude)
            local v1570 = Magnitude > 0.01 and vector3.Unit * v1569 or Vector3.zero
            local vector3_3 = Vector3.new(v1570.X, v1566, v1570.Z)

            if vector3_3.Magnitude < 0.0001 then
                p304.AssemblyLinearVelocity = Vector3.zero
                p304.AssemblyAngularVelocity = Vector3.zero

                return
            end

            if vector3_3.Magnitude > t81[31] then
                vector3_3 = vector3_3.Unit * t81[31]
            end

            p304.CFrame = p304.CFrame + vector3_3
            p304.AssemblyLinearVelocity = Vector3.zero
            p304.AssemblyAngularVelocity = Vector3.zero

            return
        end

        v821(p304, p306)

        if not v825(p306, p307) then
            t2[182](true)
            t81[12] = nil
            t81[13] = nil
            t81[20] = 0
            t81[16] = 0
            t2[182](false)
            pcall(function()
                if getgenv() then
                    local v1933 = getgenv()
                    local AutoFarmCoinEnabled = t2[22].AutoFarmCoin.Enabled
                    local v1935 = coinFarmTarget ~= nil
                    local v1936 = t2[173]

                    v1933.KitagawaFarmState = {
						enabled = AutoFarmCoinEnabled,
						active = v1935,
						sessionCoins = v1936
					}
                end
            end)

            return
        end

        local v1572 = math.min(v1563, p306Position.Y - 0.35)
        local v1573 = math.clamp(v1572 - p304.Position.Y, -t81[28] * 0.5 * p309, t81[28] * 0.5 * p309)
        local vector3_4 = Vector3.new(p306Position.X - p304.Position.X, 0, p306Position.Z - p304.Position.Z)
        local zero = Vector3.zero

        if vector3_4.Magnitude > 0.01 then
            zero = vector3_4.Unit * math.min(vector3_4.Magnitude, t81[31] * 0.45)
        end

        local vector3_5 = Vector3.new(zero.X, v1573, zero.Z)

        if vector3_5.Magnitude < 0.0001 then
            p304.AssemblyLinearVelocity = Vector3.zero
            p304.AssemblyAngularVelocity = Vector3.zero
        else
            if vector3_5.Magnitude > t81[31] then
                vector3_5 = vector3_5.Unit * t81[31]
            end

            p304.CFrame = p304.CFrame + vector3_5
            p304.AssemblyLinearVelocity = Vector3.zero
            p304.AssemblyAngularVelocity = Vector3.zero
        end

        if p304.Position.Y >= v1572 - 0.3 then
            t81[20] = t81[20] + p309

            if t81[20] >= t81[32] then
                t81[12] = nil
                t81[13] = nil
                t81[20] = 0
                t81[16] = 0
            end
        end
    end

    t2[2].Heartbeat:Connect(function(dt)
        if not t2[15] or not t2[22].AutoFarmCoin.Enabled then
            if t2[178] then
                t2[178] = false
                t2[177] = nil
                t2[182](false)
                pcall(function()
                    if getgenv() then
                        local v1937 = getgenv()
                        local AutoFarmCoinEnabled = t2[22].AutoFarmCoin.Enabled
                        local v1939 = coinFarmTarget ~= nil
                        local v1940 = t2[173]

                        v1937.KitagawaFarmState = {
							enabled = AutoFarmCoinEnabled,
							active = v1939,
							sessionCoins = v1940
						}
                    end
                end)
            end

            pcall(function()
                if getgenv() then
                    getgenv().KitagawaFarmState = {
						enabled = false,
						active = false
					}
                end
            end)
            t81[12] = nil
            t81[13] = nil
            t81[20] = 0
            t81[16] = 0
            t81[18] = nil

            return
        end

        if not t2[178] and not t2[177] then
            tick()
        end

        if tick() - t81[21] >= 0.35 then
            tick()
            t2[182](false)
            pcall(function()
                if getgenv() then
                    local v1941 = getgenv()
                    local AutoFarmCoinEnabled = t2[22].AutoFarmCoin.Enabled
                    local v1943 = coinFarmTarget ~= nil
                    local v1944 = t2[173]

                    v1941.KitagawaFarmState = {
						enabled = AutoFarmCoinEnabled,
						active = v1943,
						sessionCoins = v1944
					}
                end
            end)
        end

        local Character = t2[13].Character
        local v1579 = Character and Character:FindFirstChildOfClass("Humanoid")
        local v1580 = Character and Character:FindFirstChild("HumanoidRootPart")

        if not Character or (not v1579 or (v1579.Health <= 0 or not v1580)) then
            t81[12] = nil
            t81[13] = nil
            t81[20] = 0

            return
        end

        t81[7](Character)

        if tick() - t81[15] >= t81[22] then
            v823()
        end

        if tick() - t2[179] >= 0.6 then
            t2[182](true)
        end

        if not v825(t81[12], t81[13]) then
            t81[12] = nil
            t81[13] = nil
            t81[20] = 0
            t81[16] = 0
        end

        if not t81[12] or tick() - t81[16] >= t81[23] then
            local v1581, v1582, v1583, v1584 = v826(v1580)

            t81[12] = v1581
            t81[13] = v1582
            tick()

            if v1581 then
                local v1585 = v1581.Parent and v1581.Parent.Parent
                local v1586 = v1585 and v1585:GetFullName() or v1581:GetFullName()

                if v1586 ~= t81[18] then
                    local v1587 = "Цель: " .. v1586 .. " | активных: " .. tostring(v1584)

                    if t81[24] then
                        print("[Kitagawa AutoFarm] " .. tostring(v1587))
                    end
                end
            elseif tick() - t81[17] >= 1 then
                tick()

                local v1588 = "MainCoin не найдена | контейнеров: " .. tostring(#t81[14]) .. " | элементов: " .. tostring(v1583)

                if t81[24] then
                    print("[Kitagawa AutoFarm] " .. tostring(v1588))
                end
            end
        end

        local v1589 = t81[12]

        if not v1589 then
            v1580.AssemblyLinearVelocity = Vector3.zero
            v1580.AssemblyAngularVelocity = Vector3.zero

            return
        end

        v827(v1580, v1579, v1589, t81[13], Character, dt)
    end)
    t81[34] = t2[13]:GetMouse()
    t81[35] = 0
    t81[36] = 0
    t2[2].RenderStepped:Connect(function()
        if not t2[15] then
            return
        end

        if t2[22].TriggerBot.Enabled then
            if math.clamp((t2[22].TriggerBot.Delay or 80) / 1000, 0, 1.2) > tick() - t81[35] then
                return
            end

            local Target = t81[34].Target

            if Target and Target.Parent then
                local player = t2[1]:GetPlayerFromCharacter(Target.Parent)

                if not player then
                    player = t2[1]:GetPlayerFromCharacter(Target.Parent.Parent)
                end

                if player and player ~= t2[13] and t2[73](player) == "Knife" then
                    tick()

                    if mouse1click then
                        mouse1click()
                    end

                    pcall(function()
                        local ViewportSize = workspace.CurrentCamera.ViewportSize

                        t2[5]:SendMouseButtonEvent(ViewportSize.X / 2, ViewportSize.Y / 2, 0, true, game, 1)
                        t2[5]:SendMouseButtonEvent(ViewportSize.X / 2, ViewportSize.Y / 2, 0, false, game, 1)
                    end)

                    if tick() - t81[36] >= 3.5 then
                        tick()

                        local Character = player.Character
                        local v1593 = Character and t2[58](Character)
                        local v1594 = t2[13].Character and t2[13].Character:FindFirstChild("HumanoidRootPart")
                        local v1595 = v1594 and v1594.Position + Vector3.new(0, 1.15, 0)

                        t2[98](v1593, v1595)
                    end
                end
            end
        end
    end)
    t2[2].Stepped:Connect(function()
        if not t2[15] then
            return
        end

        if t2[22].AntiFling.Enabled and (not t2[16] and t2[13].Character) then
            for _, player in pairs(t2[1]:GetPlayers()) do
                if player ~= t2[13] and player.Character then
                    for _, child in pairs(player.Character:GetChildren()) do
                        if child:IsA("BasePart") then
                            child.CanCollide = false
                        end
                    end
                end
            end
        end
    end)
    t81[37] = {}
    t81[38] = function(p310)
        if v71(p310) then
            t81[37][p310] = true
        end
    end

    for _, descendant in ipairs(workspace:GetDescendants()) do
        t81[38](descendant)
    end

    workspace.DescendantAdded:Connect(function(descendant)
        task.wait(0.1)
        t81[38](descendant)
    end)
    workspace.DescendantRemoving:Connect(function(descendant)
        if t81[37][descendant] then
            t81[37][descendant] = nil
        end
    end)
    task.spawn(function()
        local g1620
        while task.wait(0.2) do
            if t2[15] then
                if not t2[22].GunESP.Enabled then
                    if next(t2[34]) then
                        v72()
                    end
                else

                    for v1605 in pairs(t81[37]) do

                        if v71(v1605) then
                            local v1606 = not v1605:IsDescendantOf(t2[13].Character)

                            if v1606 then
                                v1606 = not v1605:IsDescendantOf(t2[13]:FindFirstChild("Backpack"))
                            end

                            if v1606 and not t2[34][v1605] then
                                local Highlight = Instance.new("Highlight")

                                Highlight.Name = "KitagawaGunESP"
                                Highlight.FillColor = Color3.fromRGB(46, 204, 113)
                                Highlight.OutlineColor = Color3.new(1, 1, 1)
                                Highlight.FillTransparency = 0.62
                                Highlight.OutlineTransparency = 0.35
                                Highlight.Parent = v1605

                                local BillboardGui = Instance.new("BillboardGui")

                                BillboardGui.Name = "KitagawaGunText"
                                BillboardGui.Size = UDim2.new(0, 100, 0, 30)
                                BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
                                BillboardGui.AlwaysOnTop = true

                                local TextLabel = Instance.new("TextLabel")

                                TextLabel.Parent = BillboardGui
                                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                                TextLabel.BackgroundTransparency = 1
                                TextLabel.Text = "Gun Dropped"
                                TextLabel.TextColor3 = Color3.fromRGB(46, 204, 113)
                                TextLabel.TextStrokeTransparency = 0
                                TextLabel.Font = Enum.Font.GothamBold
                                TextLabel.TextSize = 12
                                BillboardGui.Parent = v1605
                                t2[34][v1605] = {
									Highlight = Highlight,
									Billboard = BillboardGui
								}
                            end
                        end
                    end
                    for k, v in pairs(t2[34]) do
                        local v1612 = k
                        local v1613 = not v1612

                        if not v1613 then
                            v1613 = not v1612.Parent

                            if not v1613 then
                                v1613 = not v71(v1612)

                                if not v1613 then
                                    v1613 = v1612:IsDescendantOf(t2[13].Character)

                                    if not v1613 then
                                        v1613 = v1612:IsDescendantOf(t2[13]:FindFirstChild("Backpack"))
                                    end
                                end
                            end
                        end

                        if v1613 then
                            if v.Highlight then
                                v.Highlight:Destroy()
                            end

                            if v.Billboard then
                                v.Billboard:Destroy()
                            end

                            t2[34][v1612] = nil
                        end
                    end
                    local AutoLootEnabled = t2[22].AutoLoot.Enabled
                    if AutoLootEnabled then
                        AutoLootEnabled = t2[13].Character

                        if AutoLootEnabled then
                            AutoLootEnabled = t2[13].Character:FindFirstChild("HumanoidRootPart")
                        end
                    end
                    if AutoLootEnabled and t2[73](t2[13]) == "Default" then
                        local u1615
                        local v1616, v1617, v1618 = pairs(t2[34])
                        repeat
                            local v1619

                            v1618, v1619 = v1616(v1617, v1618)

                            if not v1618 then
                                g1620 = true
                            end

                            if g1620 then
                                break
                            end
                        until v1619.Highlight and v1618 == v1619.Highlight.Parent
                        if not g1620 then
                            u1615 = v1618
                        end
                        g1620 = false
                        if u1615 then
                            local HumanoidRootPart = t2[13].Character.HumanoidRootPart
                            local HumanoidRootPartPosition = HumanoidRootPart.Position

                            if not (HumanoidRootPartPosition.X >= -99.6) or (not (HumanoidRootPartPosition.X <= 152.6) or (not (HumanoidRootPartPosition.Y >= -86.8) or (not (HumanoidRootPartPosition.Y <= 27.4) or (not (HumanoidRootPartPosition.Z >= -164.7) or not (HumanoidRootPartPosition.Z <= 82.8))))) then
                                local v1623 = u1615:IsA("Model") and u1615:GetPivot() or u1615.CFrame

                                if not u1615:IsDescendantOf(t2[13].Character) then
                                    t2[87](v1623, 0.08, function()
                                        if firetouchinterest then
                                            local v1946 = u1615:IsA("Model") and u1615.PrimaryPart or (u1615:FindFirstChildWhichIsA("BasePart") or u1615)

                                            if v1946 then
                                                firetouchinterest(HumanoidRootPart, v1946, 0)
                                                task.wait(0.02)
                                                firetouchinterest(HumanoidRootPart, v1946, 1)
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
        end
    end)
    t2[2].RenderStepped:Connect(function()
        if not t2[15] then
            return
        end

        if t2[22].SpinBot.Enabled and (t2[13].Character and t2[13].Character:FindFirstChild("HumanoidRootPart")) then
            local HumanoidRootPart = t2[13].Character.HumanoidRootPart

            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(t2[22].SpinBot.Speed), 0)
        end
    end)
    t2[3].JumpRequest:Connect(function()
        if not t2[15] then
            return
        end

        if t2[22].InfJump.Enabled and t2[13].Character then
            local Humanoid = t2[13].Character:FindFirstChildOfClass("Humanoid")

            if Humanoid then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
    t81[39] = 0
    t2[2].Heartbeat:Connect(function()
        if not t2[15] then
            return
        end

        local BHopEnabled = t2[22].BHop.Enabled

        if BHopEnabled then
            BHopEnabled = t2[13].Character and (t2[13].Character:FindFirstChild("Humanoid") and t2[13].Character:FindFirstChild("HumanoidRootPart"))
        end

        if BHopEnabled then
            local Humanoid = t2[13].Character.Humanoid
            local HumanoidRootPart = t2[13].Character.HumanoidRootPart

            if t2[3]:IsKeyDown(Enum.KeyCode.Space) and Humanoid.FloorMaterial ~= Enum.Material.Air then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                t81[39] = math.clamp(t81[39] + t2[22].BHop.Power * 0.45, 0, t2[22].BHop.Power * 5.5)
                HumanoidRootPart.AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity + Humanoid.MoveDirection * t81[39]
            end
        end
    end)
    t2[2].RenderStepped:Connect(function()
        if not t2[15] then
            return
        end

        for _, child in ipairs(t2[40]:GetChildren()) do
            local childName = t2[1]:FindFirstChild(child.Name)
            local v1632 = not childName

            if not v1632 then
                v1632 = not t2[22].PlayerMenu.Enabled or (not childName.Character or not childName.Character:FindFirstChild("HumanoidRootPart"))
            end

            if v1632 then
                child:Destroy()
            else
                local HumanoidRootPart = childName.Character:FindFirstChild("HumanoidRootPart")

                if HumanoidRootPart then
                    local v1634, v1635 = workspace.CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position)

                    if v1635 then
                        local GuiInset = t2[9]:GetGuiInset()

                        child.Position = UDim2.new(0, v1634.X - GuiInset.X + 20, 0, v1634.Y - GuiInset.Y)
                        child.Visible = true
                    else
                        child.Visible = false
                    end
                end
            end
        end
    end)
    task.spawn(function()
        while task.wait(0.1) do
            if t2[15] then
                pcall(t2[86])
            end
        end
    end)
    task.spawn(function()
        while task.wait(0.3) do
            if t2[15] then
                for _, player in ipairs(t2[1]:GetPlayers()) do
                    local v1639 = player
                    local v1640 = v1639 ~= t2[13]

                    if v1640 then
                        v1640 = v1639.Character

                        if v1640 then
                            v1640 = v1639.Character:FindFirstChild("HumanoidRootPart")

                            if v1640 then
                                v1640 = v1639.Character:FindFirstChild("Head")
                            end
                        end
                    end

                    if v1640 then
                        local Character = v1639.Character
                        local v1642 = t2[73](v1639)

                        if t2[22].NameESP.Enabled then
                            local KitagawaName = Character.Head:FindFirstChild("KitagawaName")

                            if not KitagawaName then
                                KitagawaName = Instance.new("BillboardGui", Character.Head)
                                KitagawaName.Name = "KitagawaName"
                                KitagawaName.Size = UDim2.new(0, 140, 0, 40)
                                KitagawaName.StudsOffset = Vector3.new(0, 2.6, 0)
                                KitagawaName.AlwaysOnTop = true

                                local TextLabel = Instance.new("TextLabel", KitagawaName)

                                TextLabel.Name = "PlayerName"
                                TextLabel.Size = UDim2.new(1, 0, 0, 18)
                                TextLabel.Position = UDim2.new(0, 0, 0, 0)
                                TextLabel.BackgroundTransparency = 1
                                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                TextLabel.TextStrokeTransparency = 0.25
                                TextLabel.Font = Enum.Font.GothamBold
                                TextLabel.TextSize = 12
                                TextLabel.Text = v1639.Name

                                local TextLabel31 = Instance.new("TextLabel", KitagawaName)

                                TextLabel31.Name = "PlayerRole"
                                TextLabel31.Size = UDim2.new(1, 0, 0, 14)
                                TextLabel31.Position = UDim2.new(0, 0, 0, 18)
                                TextLabel31.BackgroundTransparency = 1
                                TextLabel31.TextStrokeTransparency = 0.25
                                TextLabel31.Font = Enum.Font.GothamBold
                                TextLabel31.TextSize = 11
                            end

                            local PlayerRole = KitagawaName:FindFirstChild("PlayerRole")

                            if PlayerRole then
                                local s21, color3_14

                                if v1642 == "Knife" then
                                    s21 = "[MURDERER]"
                                    color3_14 = Color3.fromRGB(255, 35, 75)
                                elseif v1642 == "Weapon" then
                                    s21 = "[SHERIFF]"
                                    color3_14 = Color3.fromRGB(10, 100, 255)
                                else
                                    s21 = "[INNOCENT]"
                                    color3_14 = Color3.fromRGB(46, 204, 113)
                                end

                                if s21 ~= PlayerRole.Text then
                                    PlayerRole.Text = s21
                                end

                                if color3_14 ~= PlayerRole.TextColor3 then
                                    PlayerRole.TextColor3 = color3_14
                                end
                            end
                        elseif Character.Head:FindFirstChild("KitagawaName") then
                            Character.Head.KitagawaName:Destroy()
                        end

                        if t2[22].PlayerMenu.Enabled then
                            if not t2[40]:FindFirstChild(v1639.Name) then
                                local Frame = Instance.new("Frame")

                                Frame.Name = v1639.Name
                                Frame.Size = UDim2.new(0, 30, 0, 30)
                                Frame.AnchorPoint = Vector2.new(0.5, 0.5)
                                Frame.BackgroundTransparency = 1
                                Frame.ZIndex = 50
                                Frame.Parent = t2[40]

                                local TextButton = Instance.new("TextButton", Frame)

                                TextButton.Size = UDim2.new(1, 0, 1, 0)
                                TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
                                TextButton.Text = "👆"
                                TextButton.TextSize = 16
                                TextButton.ZIndex = 50
                                Instance.new("UICorner", TextButton).CornerRadius = UDim.new(1, 0)
                                Instance.new("UIStroke", TextButton).Color = t2[37]

                                local Frame74 = Instance.new("Frame", Frame)

                                Frame74.Size = UDim2.new(0, 140, 0, 100)
                                Frame74.Position = UDim2.new(1, 10, 0.5, -50)
                                Frame74.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
                                Frame74.BackgroundTransparency = 0.1
                                Frame74.Visible = false
                                Frame74.ZIndex = 55
                                Instance.new("UICorner", Frame74).CornerRadius = UDim.new(0, 6)
                                Instance.new("UIStroke", Frame74).Color = t2[37]

                                local ImageLabel = Instance.new("ImageLabel", Frame74)

                                ImageLabel.Size = UDim2.new(0, 30, 0, 30)
                                ImageLabel.Position = UDim2.new(0, 5, 0, 5)
                                ImageLabel.BackgroundTransparency = 1
                                ImageLabel.ZIndex = 56
                                pcall(function()
                                    ImageLabel.Image = t2[1]:GetUserThumbnailAsync(v1639.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                                end)
                                Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(1, 0)

                                local TextLabel = Instance.new("TextLabel", Frame74)

                                TextLabel.Size = UDim2.new(1, -45, 0, 30)
                                TextLabel.Position = UDim2.new(0, 40, 0, 5)
                                TextLabel.BackgroundTransparency = 1
                                TextLabel.Text = v1639.Name
                                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                TextLabel.TextSize = 11
                                TextLabel.Font = Enum.Font.GothamMedium
                                TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                                TextLabel.TextScaled = true
                                TextLabel.ZIndex = 56

                                local TextButton15 = Instance.new("TextButton", Frame74)

                                TextButton15.Size = UDim2.new(1, -10, 0, 25)
                                TextButton15.Position = UDim2.new(0, 5, 0, 40)
                                TextButton15.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                                TextButton15.Text = "Fling player"
                                TextButton15.TextColor3 = Color3.fromRGB(255, 100, 100)
                                TextButton15.Font = Enum.Font.GothamBold
                                TextButton15.TextSize = 11
                                TextButton15.ZIndex = 57
                                Instance.new("UICorner", TextButton15).CornerRadius = UDim.new(0, 4)

                                local TextButton16 = Instance.new("TextButton", Frame74)

                                TextButton16.Size = UDim2.new(1, -10, 0, 25)
                                TextButton16.Position = UDim2.new(0, 5, 0, 70)
                                TextButton16.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                                TextButton16.Text = "Teleport to player"
                                TextButton16.TextColor3 = Color3.fromRGB(100, 255, 100)
                                TextButton16.Font = Enum.Font.GothamBold
                                TextButton16.TextSize = 11
                                TextButton16.ZIndex = 57
                                Instance.new("UICorner", TextButton16).CornerRadius = UDim.new(0, 4)
                                TextButton.MouseButton1Click:Connect(function()
                                    Frame74.Visible = not Frame74.Visible
                                end)
                                TextButton15.MouseButton1Click:Connect(function()
                                    t2[72](v1639)
                                    Frame74.Visible = false
                                end)
                                TextButton16.MouseButton1Click:Connect(function()
                                    local Character8 = t2[13].Character

                                    if Character8 then
                                        Character8 = t2[13].Character:FindFirstChild("HumanoidRootPart") and (v1639.Character and v1639.Character:FindFirstChild("HumanoidRootPart"))
                                    end

                                    if Character8 then
                                        t2[13].Character.HumanoidRootPart.CFrame = v1639.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                                    end

                                    Frame74.Visible = false
                                end)
                            end
                        else
                            local Name = t2[40]:FindFirstChild(v1639.Name)

                            if Name then
                                Name:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end)
    pcall(function()
        if t2[183].MainFrame then
            t2[183].MainFrame.Visible = true
        end

        if t2[183].TopToggleFrame then
            t2[183].TopToggleFrame.Visible = true
        end

        t2[38].Enabled = true

        if t2[41] and (t2[41].Parent and t2[183].TopToggleFrame) then
            t2[41]:Destroy()

            return
        end

        if t2[44] and t2[44].Parent then
            t2[44].Text = "Ready"
        end
    end)

    if getgenv then
        getgenv().KitagawaHubUnload = function()
            pcall(function()
                t2[124]()
            end)
            pcall(function()
                t2[117] = false
                t2[118] = t2[118] + 1
            end)
            pcall(function()
                t2[127].keeper = t2[127].keeper + 1
                t2[127].key = nil
                t2[131]()

                if t2[127].respawn then
                    t2[127].respawn:Disconnect()
                    t2[127].respawn = nil
                end
            end)
            pcall(function()
                for k in pairs(t2[140]) do
                    t2[145](k)
                end
            end)
            pcall(function()
                if t2[141] then
                    t2[141]:ClearAllChildren()
                end
            end)
            pcall(function()
                t2[38]:Destroy()
            end)
            pcall(function()
                t2[39]:Destroy()
            end)
            pcall(function()
                local KitagawaBulletTrails = workspace:FindFirstChild("KitagawaBulletTrails")

                if KitagawaBulletTrails then
                    KitagawaBulletTrails:Destroy()
                end
            end)
            pcall(function()
                t2[69]("", false)
            end)
            pcall(function()
                t2[65]()
            end)
            pcall(function()
                t2[163]()
            end)
            pcall(function()
                t2[154]()
            end)
            pcall(function()
                v815()
                t81[4] = {}
                t81[6] = nil
            end)
            getgenv().KitagawaHubHeartbeatStop = true
            getgenv().KitagawaHubRunning = nil
            getgenv().KitagawaHubUnload = nil
        end
    end
end)()
task.spawn(function()
    local function v830(p311)
        local t84 = {
			["Content-Type"] = "application/json",
			["X-Api-Key"] = "db5cbd688fcc72b4221dd2e8f892cf1dccefd52c47bcdc4e"
		}
        if syn and type(syn.request) == "function" then
            return syn.request({
				Url = "http://62.233.43.59:8787/api/heartbeat",
				Method = "POST",
				Headers = t84,
				Body = p311
			})
        end
        if type(request) == "function" then
            return request({
				Url = "http://62.233.43.59:8787/api/heartbeat",
				Method = "POST",
				Headers = t84,
				Body = p311
			})
        end
        if http and type(http.request) == "function" then
            return http.request({
				Url = "http://62.233.43.59:8787/api/heartbeat",
				Method = "POST",
				Headers = t84,
				Body = p311
			})
        end
        if type(http_request) == "function" then
            return http_request("http://62.233.43.59:8787/api/heartbeat", "POST", t84, p311)
        end
        local HttpService = game:GetService("HttpService")
        local success, result = pcall(function()
            return HttpService:RequestAsync({
				Url = "http://62.233.43.59:8787/api/heartbeat",
				Method = "POST",
				Headers = t84,
				Body = p311
			})
        end)
        if success then
            return result
        end

        return nil
    end

    local v831 = false

    local function v832(p312)
        if not t2[13] then
            return false
        end

        local v1663 = getgenv() and getgenv().KitagawaFarmState or {}
        local v1664 = t2[23] or {}
        local n14 = 0

        if type(v1663.sessionCoins) == "number" then
            n14 = math.max(0, (math.floor(v1663.sessionCoins)))
        end

        local str = tostring(t2[13].UserId)
        local v1667 = v1663.enabled == true
        local v1668 = v1663.active == true
        local str2 = tostring(v1664.name or "Unknown")
        local str3 = tostring(v1664.id or "unknown")
        local str4 = tostring(v1664.platform or "PC")
        local str5 = tostring(v1664.version or "")
        local v1673 = p312 == true
        local t86 = {
			userId = str,
			script = "kitagawa",
			autoFarm = v1667,
			autoFarmActive = v1668,
			farmCoins = n14,
			executor = str2,
			executorId = str3,
			executorPlatform = str4,
			executorVersion = str5,
			launch = v1673
		}
        local json = t2[11]:JSONEncode(t86)
        local v1676 = v830(json)

        if not v1676 then
            return false
        end

        return v1676.StatusCode or (v1676.status or (v1676.Success and 200) == 200)
    end

    task.wait(2)

    if getgenv() and getgenv().KitagawaHubRunning and v832(true) then
        v831 = true
    end

    task.wait(6)

    while (not getgenv() or not getgenv().KitagawaHubHeartbeatStop) and (getgenv() and getgenv().KitagawaHubRunning) do
        if not v832(false) and not v831 then
            warn("[KitagawaHub] Heartbeat failed (no executor HTTP?)")
        end

        v831 = true

        for _ = 1, 45 do
            if getgenv() and getgenv().KitagawaHubHeartbeatStop then
                break
            end

            task.wait(1)
        end
    end
end)
t1[1] = t2[38].Parent
print("[KitagawaHub V11.9] Loaded | Executor: " .. tostring(t2[23].name) .. " (" .. tostring(t2[23].platform) .. (") | Parent: " .. t1[1] and t1[1]:GetFullName() or "nil"))
