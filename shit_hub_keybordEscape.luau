do
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser")
    local LocalPlayer = Players.LocalPlayer
    if game.CoreGui:FindFirstChild("KitagawaHub") then
        game.CoreGui.KitagawaHub:Destroy()
    end
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name:find("Kitagawa_WayPoint_") then
            obj:Destroy()
        end
    end
    local afkConnection = LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    local lang = "EN"
    local Locales = {
        RU = {
            ChooseLang = "Выберите язык",
            ThemeTitle = "Цветовая палитра интерфейса",
            WorldLabel = "Мир: [ %s ]",
            AutoFarmTab = "Авто Фарм",
            ThemeTab = "Темы",
            AdminTab = "AdminPanel",
            MovementTab = "Moovement",
            AutoFarmToggle = "Авто Фарм",
            SpeedLabel = "Скорость: %d",
            DistLabel = "WinsFarmer:",
            SavePosBtn = "+ Сохранить позицию",
            CopyPosBtn = "Скопировать позиции",
            Copied = "Скопировано в буфер!",
            EmptyList = "Список пуст!",
            NoPoints = "Нет точек!",
            SelectDist = "Выбрать WinsFarmer",
            PointPrefix = "ТОЧКА",
            AdminTitle = "--- ДЛЯ TERFISCRIPT ---",
            EnterKey = "Введите ключ доступа...",
            UnlockBtn = "Разблокировать",
            WrongKey = "Неверный ключ!",
            SuccessKey = "Доступ разрешен!",
            CheckPosToggle = "Включить Chekpozition",
            CheckModelToggle = "Check Model (Клик по детали)",
            InfJumpToggle = "Infinity Jump",
            FlyToggle = "Fly (Джойстик/WASD)",
            FlySpeedLabel = "Скорость полета: %d",
            Themes = {
                "Синий Космос",
                "Фиолетовый Кибер",
                "Кислотный Лайм",
                "Пылкая Роза",
                "Янтарный Неон",
                "Белый Фантом",
            },
        },
        EN = {
            ChooseLang = "Choose language",
            ThemeTitle = "Interface Color Palette",
            WorldLabel = "World: [ %s ]",
            AutoFarmTab = "Auto Farm",
            ThemeTab = "Themes",
            AdminTab = "AdminPanel",
            MovementTab = "Moovement",
            AutoFarmToggle = "Auto Farm",
            SpeedLabel = "Speed: %d",
            DistLabel = "WinsFarmer:",
            SavePosBtn = "+ Save Position",
            CopyPosBtn = "Copy Positions",
            Copied = "Copied to clipboard!",
            EmptyList = "List is empty!",
            NoPoints = "No points!",
            SelectDist = "Select WinsFarmer",
            PointPrefix = "POINT",
            AdminTitle = "--- FOR TERFISCRIPT ---",
            EnterKey = "Enter access key...",
            UnlockBtn = "Unlock",
            WrongKey = "Invalid key!",
            SuccessKey = "Access granted!",
            CheckPosToggle = "Enable Chekpozition",
            CheckModelToggle = "Check Model (Click part)",
            InfJumpToggle = "Infinity Jump",
            FlyToggle = "Fly (Joystick/WASD)",
            FlySpeedLabel = "Fly Speed: %d",
            Themes = {
                "Blue Space",
                "Purple Cyber",
                "Acid Lime",
                "Fiery Rose",
                "Amber Neon",
                "White Phantom",
            },
        },
    }
    local function L(key)
        return Locales[lang][key]
    end
    local savedPositions = {}
    local visualParts = {}
    local currentWorld = "1 World"
    local currentDistance = nil
    local currentSpeed = 110
    local autoFarmActive = false
    local function UpdateSpeedFarmState()
        if getgenv then
            getgenv().SpeedKeyboardFarmState =
                { enabled = autoFarmActive, active = autoFarmActive and (currentDistance ~= nil) }
        end
    end
    if getgenv then
        getgenv().SpeedKeyboardHeartbeatStop = nil
        getgenv().SpeedKeyboardRunning = true
        getgenv().SpeedKeyboardFarmState = { enabled = false, active = false }
    end
    local noClipConnection = nil
    local godModeConnection = nil
    local isMinimized = false
    local isMenuOpen = false
    local accentColor = Color3.fromRGB(0, 150, 255)
    local infJumpEnabled = false
    local flyEnabled = false
    local flySpeed = 50
    local flyBV, flyBG, flyLoop
    local checkModelEnabled = false
    local checkModelConnection = nil
    local mouse = LocalPlayer:GetMouse()
    local Waypoints = {
        ["1 World"] = {
            ["+1 wins"] = { Vector3.new(2.8, 8.5, 74.3), Vector3.new(-22.3, 10.4, 286) },
            ["+3 wins"] = {
                Vector3.new(-2.1, 8.5, 74.2),
                Vector3.new(2.7, 8.5, 295.7),
                Vector3.new(58, 8.5, 362),
                Vector3.new(53, 8.5, 444.3),
                Vector3.new(-22.2, 9.8, 518.4),
            },
            ["+10 wins"] = {
                Vector3.new(3.1, 8.5, 74.8),
                Vector3.new(2.3, 8.5, 296.5),
                Vector3.new(55.6, 8.5, 336.6),
                Vector3.new(47.5, 8.5, 454.1),
                Vector3.new(-1.6, 8.5, 487.5),
                Vector3.new(-4.8, 8.5, 527.7),
                Vector3.new(-21.6, 8.5, 528),
                Vector3.new(-22.6, 30.8, 624.1),
                Vector3.new(-21.5, 76.8, 752.7),
                Vector3.new(-18.3, 78.7, 774.5),
            },
        },
        ["2 World"] = {
            ["+250k wins"] = {
                Vector3.new(-396.8, 504.7, -60.1),
                Vector3.new(-411.7, 499.8, 171.9),
                Vector3.new(-414, 498.1, 189.9),
            },
            ["+400k wins"] = {
                Vector3.new(-399.4, 504.7, -57.6),
                Vector3.new(-398.1, 499.8, 209.2),
                Vector3.new(-417.6, 501.4, 445.3),
            },
            ["+1,5m wins"] = {
                Vector3.new(-399.4, 504.7, -57.6),
                Vector3.new(-398.1, 499.8, 209.2),
                Vector3.new(-396.3, 499.8, 450),
                Vector3.new(-398.5, 499.7, 465.5),
                Vector3.new(-343.3, 499.7, 464.7),
                Vector3.new(-349.3, 526.8, 576.9),
                Vector3.new(-454.1, 526.8, 574.8),
                Vector3.new(-455.3, 551.8, 485.5),
                Vector3.new(-454.8, 553.8, 467.6),
                Vector3.new(-350, 553.8, 464.7),
                Vector3.new(-349.6, 553.8, 477.8),
                Vector3.new(-347.2, 580.8, 574.4),
                Vector3.new(-452.8, 580.8, 577),
                Vector3.new(-453.2, 580.8, 565.6),
                Vector3.new(-454.1, 605.9, 485.4),
                Vector3.new(-454.7, 607.8, 467.2),
                Vector3.new(-400.6, 607.8, 467.7),
                Vector3.new(-399.4, 607.6, 621.4),
                Vector3.new(-399.3, 607.6, 672.4),
                Vector3.new(-401.2, 607.2, 825.2),
                Vector3.new(-401, 607.2, 859.3),
                Vector3.new(-317, 607.2, 1013.9),
                Vector3.new(-312.5, 607.2, 1149.9),
                Vector3.new(-400.4, 607.2, 1248.3),
                Vector3.new(-411.5, 607.4, 1264.2),
                Vector3.new(-413.7, 609, 1260.5),
            },
            ["+2,5m wins"] = {
                Vector3.new(-398.3, 504.7, -55.6),
                Vector3.new(-395.6, 499.8, 207.1),
                Vector3.new(-393.8, 499.8, 451.7),
                Vector3.new(-348.7, 499.7, 467.9),
                Vector3.new(-348.3, 526.8, 575.4),
                Vector3.new(-454.6, 526.8, 574.6),
                Vector3.new(-451.9, 553.8, 467.1),
                Vector3.new(-347.8, 553.8, 467.5),
                Vector3.new(-349.7, 580.8, 577.1),
                Vector3.new(-452.2, 580.8, 574.6),
                Vector3.new(-452.4, 607.8, 467.3),
                Vector3.new(-397.4, 607.8, 466.1),
                Vector3.new(-398.8, 607.6, 621.8),
                Vector3.new(-400.2, 607.2, 858),
                Vector3.new(-300.5, 607.2, 911.8),
                Vector3.new(-311.3, 607.2, 1134.4),
                Vector3.new(-398.4, 607.2, 1246.4),
                Vector3.new(-398.1, 618.4, 1331.4),
                Vector3.new(-399, 607.2, 1429.9),
                Vector3.new(-390.3, 607.2, 1475.1),
                Vector3.new(-363, 628, 1543.5),
                Vector3.new(-363.2, 628, 1602.1),
                Vector3.new(-361.4, 605.1, 1697.2),
                Vector3.new(-361.8, 605.1, 1752.7),
                Vector3.new(-362.1, 616.7, 1792.1),
                Vector3.new(-398.3, 607.2, 1860.9),
                Vector3.new(-397, 607.7, 1924.8),
                Vector3.new(-398, 619.3, 1960),
                Vector3.new(-398.2, 607.2, 2040.1),
                Vector3.new(-398.3, 607.2, 2097.8),
                Vector3.new(-398.4, 619, 2140.1),
                Vector3.new(-398.6, 607.2, 2216.9),
                Vector3.new(-398.5, 607.2, 2270.2),
                Vector3.new(-398.4, 618.6, 2316.5),
                Vector3.new(-399.6, 623.1, 2365.9),
                Vector3.new(-417.3, 621, 2415.6),
            },
            ["+4m wins"] = {
                Vector3.new(-398.3, 504.7, -55.6),
                Vector3.new(-395.6, 499.8, 207.1),
                Vector3.new(-393.8, 499.8, 451.7),
                Vector3.new(-348.7, 499.7, 467.9),
                Vector3.new(-348.3, 526.8, 575.4),
                Vector3.new(-454.6, 526.8, 574.6),
                Vector3.new(-451.9, 553.8, 467.1),
                Vector3.new(-347.8, 553.8, 467.5),
                Vector3.new(-349.7, 580.8, 577.1),
                Vector3.new(-452.2, 580.8, 574.6),
                Vector3.new(-452.4, 607.8, 467.3),
                Vector3.new(-397.4, 607.8, 466.1),
                Vector3.new(-398.8, 607.6, 621.8),
                Vector3.new(-400.2, 607.2, 858),
                Vector3.new(-300.5, 607.2, 911.8),
                Vector3.new(-311.3, 607.2, 1134.4),
                Vector3.new(-398.4, 607.2, 1246.4),
                Vector3.new(-398.1, 618.4, 1331.4),
                Vector3.new(-399, 607.2, 1429.9),
                Vector3.new(-390.3, 607.2, 1475.1),
                Vector3.new(-363, 628, 1543.5),
                Vector3.new(-363.2, 628, 1602.1),
                Vector3.new(-361.4, 605.1, 1697.2),
                Vector3.new(-361.8, 605.1, 1752.7),
                Vector3.new(-362.1, 616.7, 1792.1),
                Vector3.new(-398.3, 607.2, 1860.9),
                Vector3.new(-397, 607.7, 1924.8),
                Vector3.new(-398, 619.3, 1960),
                Vector3.new(-398.2, 607.2, 2040.1),
                Vector3.new(-398.3, 607.2, 2097.8),
                Vector3.new(-398.4, 619, 2140.1),
                Vector3.new(-398.6, 607.2, 2216.9),
                Vector3.new(-398.5, 607.2, 2270.2),
                Vector3.new(-398.4, 618.6, 2316.5),
                Vector3.new(-399.6, 623.1, 2365.9),
                Vector3.new(-399.7, 623.1, 2433.8),
                Vector3.new(-399.7, 623.1, 2636.1),
                Vector3.new(-417.3, 620.8, 2650.8),
            },
            ["+6m wins"] = {
                Vector3.new(-398.3, 504.7, -55.6),
                Vector3.new(-395.6, 499.8, 207.1),
                Vector3.new(-393.8, 499.8, 451.7),
                Vector3.new(-348.7, 499.7, 467.9),
                Vector3.new(-348.3, 526.8, 575.4),
                Vector3.new(-454.6, 526.8, 574.6),
                Vector3.new(-451.9, 553.8, 467.1),
                Vector3.new(-347.8, 553.8, 467.5),
                Vector3.new(-349.7, 580.8, 577.1),
                Vector3.new(-452.2, 580.8, 574.6),
                Vector3.new(-452.4, 607.8, 467.3),
                Vector3.new(-397.4, 607.8, 466.1),
                Vector3.new(-398.8, 607.6, 621.8),
                Vector3.new(-400.2, 607.2, 858),
                Vector3.new(-300.5, 607.2, 911.8),
                Vector3.new(-311.3, 607.2, 1134.4),
                Vector3.new(-398.4, 607.2, 1246.4),
                Vector3.new(-398.1, 618.4, 1331.4),
                Vector3.new(-399, 607.2, 1429.9),
                Vector3.new(-390.3, 607.2, 1475.1),
                Vector3.new(-363, 628, 1543.5),
                Vector3.new(-363.2, 628, 1602.1),
                Vector3.new(-361.4, 605.1, 1697.2),
                Vector3.new(-361.8, 605.1, 1752.7),
                Vector3.new(-362.1, 616.7, 1792.1),
                Vector3.new(-398.3, 607.2, 1860.9),
                Vector3.new(-397, 607.7, 1924.8),
                Vector3.new(-398, 619.3, 1960),
                Vector3.new(-398.2, 607.2, 2040.1),
                Vector3.new(-398.3, 607.2, 2097.8),
                Vector3.new(-398.4, 619, 2140.1),
                Vector3.new(-398.6, 607.2, 2216.9),
                Vector3.new(-398.5, 607.2, 2270.2),
                Vector3.new(-398.4, 618.6, 2316.5),
                Vector3.new(-399.6, 623.1, 2365.9),
                Vector3.new(-399.7, 623.1, 2433.8),
                Vector3.new(-399.7, 623.1, 2636.1),
                Vector3.new(-398.7, 623.1, 2666.7),
                Vector3.new(-403, 623.1, 3093.9),
                Vector3.new(-417.3, 621.2, 3158.6),
            },
            ["+10m wins"] = {
                Vector3.new(-398.3, 504.7, -55.6),
                Vector3.new(-395.6, 499.8, 207.1),
                Vector3.new(-393.8, 499.8, 451.7),
                Vector3.new(-348.7, 499.7, 467.9),
                Vector3.new(-348.3, 526.8, 575.4),
                Vector3.new(-454.6, 526.8, 574.6),
                Vector3.new(-451.9, 553.8, 467.1),
                Vector3.new(-347.8, 553.8, 467.5),
                Vector3.new(-349.7, 580.8, 577.1),
                Vector3.new(-452.2, 580.8, 574.6),
                Vector3.new(-452.4, 607.8, 467.3),
                Vector3.new(-397.4, 607.8, 466.1),
                Vector3.new(-398.8, 607.6, 621.8),
                Vector3.new(-400.2, 607.2, 858),
                Vector3.new(-300.5, 607.2, 911.8),
                Vector3.new(-311.3, 607.2, 1134.4),
                Vector3.new(-398.4, 607.2, 1246.4),
                Vector3.new(-398.1, 618.4, 1331.4),
                Vector3.new(-399, 607.2, 1429.9),
                Vector3.new(-390.3, 607.2, 1475.1),
                Vector3.new(-363, 628, 1543.5),
                Vector3.new(-363.2, 628, 1602.1),
                Vector3.new(-361.4, 605.1, 1697.2),
                Vector3.new(-361.8, 605.1, 1752.7),
                Vector3.new(-362.1, 616.7, 1792.1),
                Vector3.new(-398.3, 607.2, 1860.9),
                Vector3.new(-397, 607.7, 1924.8),
                Vector3.new(-398, 619.3, 1960),
                Vector3.new(-398.2, 607.2, 2040.1),
                Vector3.new(-398.3, 607.2, 2097.8),
                Vector3.new(-398.4, 619, 2140.1),
                Vector3.new(-398.6, 607.2, 2216.9),
                Vector3.new(-398.5, 607.2, 2270.2),
                Vector3.new(-398.4, 618.6, 2316.5),
                Vector3.new(-399.6, 623.1, 2365.9),
                Vector3.new(-399.7, 623.1, 2433.8),
                Vector3.new(-399.7, 623.1, 2636.1),
                Vector3.new(-398.7, 623.1, 2666.7),
                Vector3.new(-403, 623.1, 3093.9),
                Vector3.new(-401.7, 623.1, 3172.2),
                Vector3.new(-399, 623.1, 3325.1),
                Vector3.new(-346, 623.1, 3324.2),
                Vector3.new(-196.7, 623.1, 3330.7),
                Vector3.new(-191.2, 623.1, 3256.3),
                Vector3.new(-114.2, 623.1, 3261.9),
                Vector3.new(-116.3, 623.1, 3412.3),
                Vector3.new(-257.5, 623.1, 3409.8),
                Vector3.new(-261, 623.1, 3608.9),
                Vector3.new(-529.8, 623.1, 3607.1),
                Vector3.new(-535.7, 623.1, 3790.1),
                Vector3.new(-118.6, 623.1, 3798.5),
                Vector3.new(-119.2, 623.1, 3867.5),
                Vector3.new(-59.9, 621.2, 3883.2),
            },
            ["+15m wins"] = {
                Vector3.new(-396.7, 504.7, -54.7),
                Vector3.new(-396.5, 499.8, 450.4),
                Vector3.new(-396.1, 499.7, 466.2),
                Vector3.new(-346.2, 499.7, 465),
                Vector3.new(-347.7, 526.8, 575.3),
                Vector3.new(-454.8, 526.8, 574.9),
                Vector3.new(-454, 553.8, 469.2),
                Vector3.new(-349.9, 553.8, 467.2),
                Vector3.new(-348.2, 580.8, 576.5),
                Vector3.new(-450.7, 580.8, 577.1),
                Vector3.new(-450, 607.8, 466.3),
                Vector3.new(-403.6, 607.8, 466.9),
                Vector3.new(-400.4, 607.6, 622.8),
                Vector3.new(-400.5, 607.2, 859.9),
                Vector3.new(-309.8, 607.2, 918.2),
                Vector3.new(-307, 607.2, 1192.4),
                Vector3.new(-400.3, 607.2, 1247.9),
                Vector3.new(-400.5, 618.9, 1332.9),
                Vector3.new(-400.7, 607.2, 1431.3),
                Vector3.new(-360.7, 628, 1544.8),
                Vector3.new(-362.1, 628, 1604.5),
                Vector3.new(-360, 605.1, 1695.9),
                Vector3.new(-362.9, 617, 1793.1),
                Vector3.new(-400.5, 607.2, 1860.4),
                Vector3.new(-400, 607.2, 1921.3),
                Vector3.new(-400.1, 619.3, 1960.1),
                Vector3.new(-400.3, 607.2, 2040),
                Vector3.new(-400.5, 607.2, 2099.5),
                Vector3.new(-400.6, 619.3, 2141.1),
                Vector3.new(-400.8, 607.2, 2218),
                Vector3.new(-400.9, 607.2, 2276.1),
                Vector3.new(-400.3, 618.6, 2316.2),
                Vector3.new(-398.8, 623.1, 2433.6),
                Vector3.new(-395.9, 623.1, 2668.2),
                Vector3.new(-401, 623.1, 3174.8),
                Vector3.new(-400.7, 623.1, 3332.6),
                Vector3.new(-181.5, 623.1, 3331.3),
                Vector3.new(-181.7, 623.1, 3261.6),
                Vector3.new(-106.9, 623.1, 3261.4),
                Vector3.new(-114.6, 623.1, 3437.5),
                Vector3.new(-268, 623.1, 3441.3),
                Vector3.new(-265.2, 623.1, 3611.6),
                Vector3.new(-531.9, 623.1, 3620),
                Vector3.new(-535.2, 623.1, 3801.1),
                Vector3.new(-130.8, 623.1, 3799.8),
                Vector3.new(-130.7, 623.1, 3864.4),
                Vector3.new(-46.1, 623.2, 3864.2),
                Vector3.new(1189.7, 623.4, 3865.5),
                Vector3.new(1228.4, 621.6, 3908.9),
            },
            ["+25m wins"] = {
                Vector3.new(-396.7, 504.7, -54.7),
                Vector3.new(-396.5, 499.8, 450.4),
                Vector3.new(-396.1, 499.7, 466.2),
                Vector3.new(-346.2, 499.7, 465),
                Vector3.new(-347.7, 526.8, 575.3),
                Vector3.new(-454.8, 526.8, 574.9),
                Vector3.new(-454, 553.8, 469.2),
                Vector3.new(-349.9, 553.8, 467.2),
                Vector3.new(-348.2, 580.8, 576.5),
                Vector3.new(-450.7, 580.8, 577.1),
                Vector3.new(-450, 607.8, 466.3),
                Vector3.new(-403.6, 607.8, 466.9),
                Vector3.new(-400.4, 607.6, 622.8),
                Vector3.new(-400.5, 607.2, 859.9),
                Vector3.new(-309.8, 607.2, 918.2),
                Vector3.new(-307, 607.2, 1192.4),
                Vector3.new(-400.3, 607.2, 1247.9),
                Vector3.new(-400.5, 618.9, 1332.9),
                Vector3.new(-400.7, 607.2, 1431.3),
                Vector3.new(-360.7, 628, 1544.8),
                Vector3.new(-362.1, 628, 1604.5),
                Vector3.new(-360, 605.1, 1695.9),
                Vector3.new(-362.9, 617, 1793.1),
                Vector3.new(-400.5, 607.2, 1860.4),
                Vector3.new(-400, 607.2, 1921.3),
                Vector3.new(-400.1, 619.3, 1960.1),
                Vector3.new(-400.3, 607.2, 2040),
                Vector3.new(-400.5, 607.2, 2099.5),
                Vector3.new(-400.6, 619.3, 2141.1),
                Vector3.new(-400.8, 607.2, 2218),
                Vector3.new(-400.9, 607.2, 2276.1),
                Vector3.new(-400.3, 618.6, 2316.2),
                Vector3.new(-398.8, 623.1, 2433.6),
                Vector3.new(-395.9, 623.1, 2668.2),
                Vector3.new(-401, 623.1, 3174.8),
                Vector3.new(-400.7, 623.1, 3332.6),
                Vector3.new(-181.5, 623.1, 3331.3),
                Vector3.new(-181.7, 623.1, 3261.6),
                Vector3.new(-106.9, 623.1, 3261.4),
                Vector3.new(-114.6, 623.1, 3437.5),
                Vector3.new(-268, 623.1, 3441.3),
                Vector3.new(-265.2, 623.1, 3611.6),
                Vector3.new(-531.9, 623.1, 3620),
                Vector3.new(-535.2, 623.1, 3801.1),
                Vector3.new(-130.8, 623.1, 3799.8),
                Vector3.new(-130.7, 623.1, 3864.4),
                Vector3.new(-46.1, 623.2, 3864.2),
                Vector3.new(1189.7, 623.4, 3865.5),
                Vector3.new(1263.6, 623.4, 3864.6),
                Vector3.new(1327.3, 600, 3862.8),
                Vector3.new(1565, 622.1, 3789.3),
                Vector3.new(1770.8, 638.8, 3940.2),
                Vector3.new(1971.2, 615.5, 3805.8),
                Vector3.new(2115.6, 614.4, 3954.5),
                Vector3.new(2313.9, 603, 3869.1),
                Vector3.new(2400.2, 625.5, 3887.9),
            },
            ["+40m wins"] = {
                Vector3.new(-396.7, 504.7, -54.7),
                Vector3.new(-396.5, 499.8, 450.4),
                Vector3.new(-396.1, 499.7, 466.2),
                Vector3.new(-346.2, 499.7, 465),
                Vector3.new(-347.7, 526.8, 575.3),
                Vector3.new(-454.8, 526.8, 574.9),
                Vector3.new(-454, 553.8, 469.2),
                Vector3.new(-349.9, 553.8, 467.2),
                Vector3.new(-348.2, 580.8, 576.5),
                Vector3.new(-450.7, 580.8, 577.1),
                Vector3.new(-450, 607.8, 466.3),
                Vector3.new(-403.6, 607.8, 466.9),
                Vector3.new(-400.4, 607.6, 622.8),
                Vector3.new(-400.5, 607.2, 859.9),
                Vector3.new(-309.8, 607.2, 918.2),
                Vector3.new(-307, 607.2, 1192.4),
                Vector3.new(-400.3, 607.2, 1247.9),
                Vector3.new(-400.5, 618.9, 1332.9),
                Vector3.new(-400.7, 607.2, 1431.3),
                Vector3.new(-360.7, 628, 1544.8),
                Vector3.new(-362.1, 628, 1604.5),
                Vector3.new(-360, 605.1, 1695.9),
                Vector3.new(-362.9, 617, 1793.1),
                Vector3.new(-400.5, 607.2, 1860.4),
                Vector3.new(-400, 607.2, 1921.3),
                Vector3.new(-400.1, 619.3, 1960.1),
                Vector3.new(-400.3, 607.2, 2040),
                Vector3.new(-400.5, 607.2, 2099.5),
                Vector3.new(-400.6, 619.3, 2141.1),
                Vector3.new(-400.8, 607.2, 2218),
                Vector3.new(-400.9, 607.2, 2276.1),
                Vector3.new(-400.3, 618.6, 2316.2),
                Vector3.new(-398.8, 623.1, 2433.6),
                Vector3.new(-395.9, 623.1, 2668.2),
                Vector3.new(-401, 623.1, 3174.8),
                Vector3.new(-400.7, 623.1, 3332.6),
                Vector3.new(-181.5, 623.1, 3331.3),
                Vector3.new(-181.7, 623.1, 3261.6),
                Vector3.new(-106.9, 623.1, 3261.4),
                Vector3.new(-114.6, 623.1, 3437.5),
                Vector3.new(-268, 623.1, 3441.3),
                Vector3.new(-265.2, 623.1, 3611.6),
                Vector3.new(-531.9, 623.1, 3620),
                Vector3.new(-535.2, 623.1, 3801.1),
                Vector3.new(-130.8, 623.1, 3799.8),
                Vector3.new(-130.7, 623.1, 3864.4),
                Vector3.new(-46.1, 623.2, 3864.2),
                Vector3.new(1189.7, 623.4, 3865.5),
                Vector3.new(1263.6, 623.4, 3864.6),
                Vector3.new(1327.3, 600, 3862.8),
                Vector3.new(1565, 622.1, 3789.3),
                Vector3.new(1770.8, 638.8, 3940.2),
                Vector3.new(1971.2, 615.5, 3805.8),
                Vector3.new(2115.6, 614.4, 3954.5),
                Vector3.new(2313.9, 603, 3869.1),
                Vector3.new(2384, 627.4, 3868.7),
                Vector3.new(2418.4, 627.4, 3868.8),
                Vector3.new(2450.3, 627.3, 3868.2),
                Vector3.new(2499.6, 639.3, 3869.5),
                Vector3.new(2548.9, 639.3, 3870),
                Vector3.new(2722.7, 634.3, 3870),
                Vector3.new(2749, 575.3, 3867.8),
                Vector3.new(2826.7, 575.3, 3868.8),
                Vector3.new(2859.8, 580.9, 3868.9),
                Vector3.new(2920.1, 605.2, 3869.2),
                Vector3.new(2960.3, 576.3, 3870.3),
                Vector3.new(3005.1, 576.3, 3869.4),
                Vector3.new(3048.9, 591.6, 3869.5),
                Vector3.new(3171.6, 577.4, 3868.7),
                Vector3.new(3215.8, 592.3, 3874.4),
                Vector3.new(3269.2, 590.6, 3887.9),
            },
            ["+60m wins"] = {
                Vector3.new(-396.7, 504.7, -54.7),
                Vector3.new(-396.5, 499.8, 450.4),
                Vector3.new(-396.1, 499.7, 466.2),
                Vector3.new(-346.2, 499.7, 465),
                Vector3.new(-347.7, 526.8, 575.3),
                Vector3.new(-454.8, 526.8, 574.9),
                Vector3.new(-454, 553.8, 469.2),
                Vector3.new(-349.9, 553.8, 467.2),
                Vector3.new(-348.2, 580.8, 576.5),
                Vector3.new(-450.7, 580.8, 577.1),
                Vector3.new(-450, 607.8, 466.3),
                Vector3.new(-403.6, 607.8, 466.9),
                Vector3.new(-400.4, 607.6, 622.8),
                Vector3.new(-400.5, 607.2, 859.9),
                Vector3.new(-309.8, 607.2, 918.2),
                Vector3.new(-307, 607.2, 1192.4),
                Vector3.new(-400.3, 607.2, 1247.9),
                Vector3.new(-400.5, 618.9, 1332.9),
                Vector3.new(-400.7, 607.2, 1431.3),
                Vector3.new(-360.7, 628, 1544.8),
                Vector3.new(-362.1, 628, 1604.5),
                Vector3.new(-360, 605.1, 1695.9),
                Vector3.new(-362.9, 617, 1793.1),
                Vector3.new(-400.5, 607.2, 1860.4),
                Vector3.new(-400, 607.2, 1921.3),
                Vector3.new(-400.1, 619.3, 1960.1),
                Vector3.new(-400.3, 607.2, 2040),
                Vector3.new(-400.5, 607.2, 2099.5),
                Vector3.new(-400.6, 619.3, 2141.1),
                Vector3.new(-400.8, 607.2, 2218),
                Vector3.new(-400.9, 607.2, 2276.1),
                Vector3.new(-400.3, 618.6, 2316.2),
                Vector3.new(-398.8, 623.1, 2433.6),
                Vector3.new(-395.9, 623.1, 2668.2),
                Vector3.new(-401, 623.1, 3174.8),
                Vector3.new(-400.7, 623.1, 3332.6),
                Vector3.new(-181.5, 623.1, 3331.3),
                Vector3.new(-181.7, 623.1, 3261.6),
                Vector3.new(-106.9, 623.1, 3261.4),
                Vector3.new(-114.6, 623.1, 3437.5),
                Vector3.new(-268, 623.1, 3441.3),
                Vector3.new(-265.2, 623.1, 3611.6),
                Vector3.new(-531.9, 623.1, 3620),
                Vector3.new(-535.2, 623.1, 3801.1),
                Vector3.new(-130.8, 623.1, 3799.8),
                Vector3.new(-130.7, 623.1, 3864.4),
                Vector3.new(-46.1, 623.2, 3864.2),
                Vector3.new(1189.7, 623.4, 3865.5),
                Vector3.new(1263.6, 623.4, 3864.6),
                Vector3.new(1327.3, 600, 3862.8),
                Vector3.new(1565, 622.1, 3789.3),
                Vector3.new(1770.8, 638.8, 3940.2),
                Vector3.new(1971.2, 615.5, 3805.8),
                Vector3.new(2115.6, 614.4, 3954.5),
                Vector3.new(2313.9, 603, 3869.1),
                Vector3.new(2384, 627.4, 3868.7),
                Vector3.new(2418.4, 627.4, 3868.8),
                Vector3.new(2450.3, 627.3, 3868.2),
                Vector3.new(2499.6, 639.3, 3869.5),
                Vector3.new(2548.9, 639.3, 3870),
                Vector3.new(2722.7, 634.3, 3870),
                Vector3.new(2749, 575.3, 3867.8),
                Vector3.new(2826.7, 575.3, 3868.8),
                Vector3.new(2859.8, 580.9, 3868.9),
                Vector3.new(2920.1, 605.2, 3869.2),
                Vector3.new(2960.3, 576.3, 3870.3),
                Vector3.new(3005.1, 576.3, 3869.4),
                Vector3.new(3048.9, 591.6, 3869.5),
                Vector3.new(3171.6, 577.4, 3868.7),
                Vector3.new(3215.8, 592.3, 3874.4),
                Vector3.new(3289.1, 592.3, 3875.2),
                Vector3.new(3289.1, 628.2, 3875.2),
                Vector3.new(3289.1, 676.1, 3875.2),
                Vector3.new(3338.7, 672.4, 3872.4),
                Vector3.new(3337.6, 672.4, 5142.9),
                Vector3.new(4600.9, 672.4, 5143.1),
                Vector3.new(4624.1, 672.4, 5143),
                Vector3.new(4634.4, 567.4, 5141.7),
                Vector3.new(4634.1, 565.7, 5159.4),
            },
        },
        ["3 World"] = {
            ["+300m wins"] = {
                Vector3.new(-1433.5, -159.7, -878.9),
                Vector3.new(-1431, -157.1, -831.9),
                Vector3.new(-1429.5, -126, -733),
                Vector3.new(-1430.1, -69.9, -538.4),
                Vector3.new(-1481.8, -71.7, -515.8),
            },
            ["+500m wins"] = {
                Vector3.new(-1433.2, -159.7, -877.5),
                Vector3.new(-1431, -157.6, -833.5),
                Vector3.new(-1430.4, -125.1, -730.1),
                Vector3.new(-1430.9, -69.9, -537.4),
                Vector3.new(-1453.9, -69.9, -492.7),
                Vector3.new(-1453.9, -58.4, -392.5),
                Vector3.new(-1453.9, -57.4, -264.7),
                Vector3.new(-1453.9, -57.4, -186.8),
                Vector3.new(-1480.8, -59.4, -15.8),
            },
            ["+800m wins"] = {
                Vector3.new(-1434.9, -159.7, -875.9),
                Vector3.new(-1430.2, -158.8, -837.1),
                Vector3.new(-1427.6, -125.2, -730.4),
                Vector3.new(-1427, -69.9, -538.6),
                Vector3.new(-1455.2, -69.9, -493.3),
                Vector3.new(-1455.9, -70.4, -444.3),
                Vector3.new(-1456.7, -58.5, -393),
                Vector3.new(-1458.4, -57.4, -266.1),
                Vector3.new(-1456.8, -57.4, -186.8),
                Vector3.new(-1452.9, -57.6, 7.6),
                Vector3.new(-1451.4, -48.6, 84.7),
                Vector3.new(-1451.4, 83, 84.7),
                Vector3.new(-1475.2, 92.3, 95.5),
                Vector3.new(-1475.2, 212.8, 95.6),
                Vector3.new(-1472.1, 214.6, 143.2),
                Vector3.new(-1469.4, 222.8, 178.5),
                Vector3.new(-1464.9, 223, 229.5),
                Vector3.new(-1463.9, 215, 260),
                Vector3.new(-1480.8, 212.6, 332.1),
            },
            ["+1.25b wins"] = {
                Vector3.new(-1434.1, -159.6, -879),
                Vector3.new(-1431.8, -157.7, -834.2),
                Vector3.new(-1430.5, -125.6, -732.2),
                Vector3.new(-1427.6, -69.8, -540.1),
                Vector3.new(-1454.8, -69.8, -495.1),
                Vector3.new(-1454.8, -70.3, -444.5),
                Vector3.new(-1455.3, -58.9, -395),
                Vector3.new(-1454.4, -57.5, 4.5),
                Vector3.new(-1454.5, -55.8, 84.8),
                Vector3.new(-1454.5, 84.8, 84.8),
                Vector3.new(-1475, 102.7, 96),
                Vector3.new(-1475, 212, 96),
                Vector3.new(-1473.6, 214.7, 141.2),
                Vector3.new(-1457.4, 222.5, 176.7),
                Vector3.new(-1455.8, 223.3, 228.9),
                Vector3.new(-1455.8, 214.7, 270.6),
                Vector3.new(-1455.8, 214.5, 627.8),
                Vector3.new(-1455.8, 365.5, 627.8),
                Vector3.new(-1434.2, 359.7, 490.7),
                Vector3.new(-1336, 360.8, 494.3),
                Vector3.new(-1246.3, 328.8, 517.1),
                Vector3.new(-1236, 323.2, 600.3),
                Vector3.new(-1220.6, 342.9, 810.9),
                Vector3.new(-1361.8, 363, 834.8),
                Vector3.new(-1403.6, 373.5, 724.7),
                Vector3.new(-1403.6, 545.5, 724.7),
                Vector3.new(-1431.3, 530.6, 759.6),
            },
        },
        ["Bbnos World"] = {
            ["+25k cash"] = {
                Vector3.new(-129.9, 59.1, -236.7),
                Vector3.new(184.7, 59.2, -234),
                Vector3.new(317.6, 59.2, -318.6),
                Vector3.new(415, 59.2, -233.6),
                Vector3.new(488.4, 62.7, -234.2),
                Vector3.new(1086.1, 167.3, -703.8),
                Vector3.new(1074.7, 167.3, 772.4),
                Vector3.new(307.9, 167.3, 775),
                Vector3.new(-461.4, 167.3, 774.6),
                Vector3.new(-488.5, 171.3, 775.4),
                Vector3.new(-172.2, 307.4, -897.1),
                Vector3.new(546.5, 307.4, -896.3),
                Vector3.new(549, 307.4, -968),
                Vector3.new(673.3, 307.4, -964.5),
                Vector3.new(672, 307.4, -899.3),
                Vector3.new(743, 307.4, -897.9),
                Vector3.new(1561.5, 307.4, -895.7),
                Vector3.new(1562.6, 306.3, -105.2),
                Vector3.new(1831, 306.3, -102.5),
                Vector3.new(1829.7, 309.1, 168.9),
                Vector3.new(1827.3, 812.2, 169.5),
                Vector3.new(1821.8, 810.4, 947.2),
                Vector3.new(1662.9, 810.4, 942.6),
                Vector3.new(1577.5, 810.4, 917.7),
                Vector3.new(1557.9, 817.9, 908.8),
                Vector3.new(1440, 810.4, 861.5),
                Vector3.new(1403.8, 810.4, 858.5),
                Vector3.new(1376.6, 817.6, 857.1),
                Vector3.new(1184.3, 810.3, 854.8),
                Vector3.new(1088.1, 810.3, 853.3),
                Vector3.new(944.4, 807.3, 851.2),
                Vector3.new(930.9, 810.3, 852.2),
                Vector3.new(912.7, 810.3, 921.8),
                Vector3.new(862.8, 810.4, 952.3),
                Vector3.new(807.2, 812, 903.5),
            },
            ["+50k cash"] = {
                Vector3.new(759.5, 810.4, 948.4),
                Vector3.new(716.1, 810.4, 946.7),
                Vector3.new(719.7, 810.4, 572.4),
                Vector3.new(584.8, 810.4, 566.2),
                Vector3.new(587.7, 810.4, 464.5),
                Vector3.new(390.5, 810.4, 465),
                Vector3.new(394.7, 810.4, 729.3),
                Vector3.new(510.2, 810.4, 732.8),
                Vector3.new(506.6, 810.4, 848),
                Vector3.new(309.8, 810.4, 845.7),
                Vector3.new(308.6, 810.4, 939.3),
                Vector3.new(120.7, 810.4, 947.6),
                Vector3.new(103.5, 812.5, 946.4),
            },
        },
    }
    local distSortOrder = {
        ["+1 wins"] = 1,
        ["+3 wins"] = 2,
        ["+10 wins"] = 3,
        ["+250k wins"] = 4,
        ["+400k wins"] = 5,
        ["+1,5m wins"] = 6,
        ["+2,5m wins"] = 7,
        ["+4m wins"] = 8,
        ["+6m wins"] = 9,
        ["+10m wins"] = 10,
        ["+15m wins"] = 11,
        ["+25m wins"] = 12,
        ["+40m wins"] = 13,
        ["+60m wins"] = 14,
        ["+300m wins"] = 15,
        ["+500m wins"] = 16,
        ["+800m wins"] = 17,
        ["+1.25b wins"] = 18,
        ["+25k cash"] = 19,
        ["+50k cash"] = 20,
    }
    local function isObstacleName(name)
        if (name == "LavaPart") or (name == "Lava_Stage3") or (name == "MovingWall") then
            return true
        end
        if
            (name == "DoorWall1")
            or (name == "GreenDoorKillPart")
            or (name == "RedDoorKillPart")
            or (name == "YellowDoorKillPart")
            or (name == "DoorWall2")
            or (name == "DoorWall3")
        then
            return true
        end
        if
            (name == "Stage2LocalNPC_Local")
            or (name == "Tumbleweed")
            or (name == "vanilla")
            or (name == "EyesLaser")
            or (name == "Stage11LocalNPC_Local")
            or (name == "Stage14LocalNPC_Local")
        then
            return true
        end
        local num = name:match("^MovingWall(%d+)$")
        if num then
            local n = tonumber(num)
            if n and (n >= 1) and (n <= 15) then
                return true
            end
        end
        return false
    end
    local function initGlobalObstacleRemover()
        task.spawn(function()
            local count = 0
            local descendants = workspace:GetDescendants()
            for i = 1, #descendants do
                local obj = descendants[i]
                if obj and obj.Parent then
                    if isObstacleName(obj.Name) then
                        obj:Destroy()
                    end
                end
                count = count + 1
                if (count % 300) == 0 then
                    task.wait()
                end
            end
        end)
        if not godModeConnection then
            godModeConnection = workspace.DescendantAdded:Connect(function(descendant)
                if isObstacleName(descendant.Name) then
                    task.defer(function()
                        if descendant and descendant.Parent then
                            descendant:Destroy()
                        end
                    end)
                end
            end)
        end
    end
    initGlobalObstacleRemover()
    local function setNoClip(state)
        if state then
            if not noClipConnection then
                noClipConnection = RunService.Stepped:Connect(function()
                    local char = LocalPlayer.Character
                    if char then
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") and part.CanCollide then
                                part.CanCollide = false
                            end
                        end
                    end
                end)
            end
        else
            if noClipConnection then
                noClipConnection:Disconnect()
                noClipConnection = nil
            end
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CanCollide = true
            end
        end
    end
    local function flyTo(targetPos)
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then
            return false
        end
        local hrp = char.HumanoidRootPart
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(8999999488, 8999999488, 8999999488)
        bv.Parent = hrp
        local reached = false
        while autoFarmActive and not reached do
            if not char or not char:FindFirstChild("HumanoidRootPart") then
                break
            end
            local distance = (hrp.Position - targetPos).Magnitude
            if distance <= 6 then
                reached = true
            else
                local direction = (targetPos - hrp.Position).Unit
                bv.Velocity = direction * currentSpeed
            end
            task.wait(0.02)
        end
        if bv then
            bv:Destroy()
        end
        return reached
    end
    local function startAutoFarmLoop()
        task.spawn(function()
            while autoFarmActive do
                local worldData = Waypoints[currentWorld]
                local currentWaypoints = worldData and worldData[currentDistance]
                if currentWaypoints and (#currentWaypoints > 0) then
                    setNoClip(true)
                    if (currentWorld == "Bbnos World") and (currentDistance == "+50k cash") then
                        local args = { [1] = 12, [2] = "wins" }
                        local success, err = pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.RequestCheckpointTp
                                :FireServer(unpack(args))
                        end)
                        if success then
                            print(
                                "Ремоут на чекпоинт успешно отправлен!"
                            )
                        else
                            warn("Ошибка при отправке ремоута: ", err)
                        end
                        task.wait(0.5)
                    end
                    for i, waypoint in ipairs(currentWaypoints) do
                        if not autoFarmActive then
                            break
                        end
                        flyTo(waypoint)
                        if
                            (currentWorld == "Bbnos World")
                            and (currentDistance == "+50k cash")
                            and (i == #currentWaypoints)
                        then
                            task.wait(1)
                        end
                    end
                else
                    task.wait(1)
                end
                task.wait(0.1)
            end
            setNoClip(false)
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = 16
            end
        end)
    end
    UserInputService.JumpRequest:Connect(function()
        if infJumpEnabled then
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end
    end)
    local function toggleManualFly(state)
        flyEnabled = state
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then
            return
        end
        local hrp = char.HumanoidRootPart
        local hum = char:FindFirstChildOfClass("Humanoid")
        if flyEnabled then
            flyBV = Instance.new("BodyVelocity")
            flyBV.MaxForce = Vector3.new(8999999488, 8999999488, 8999999488)
            flyBV.Parent = hrp
            flyBG = Instance.new("BodyGyro")
            flyBG.MaxTorque = Vector3.new(8999999488, 8999999488, 8999999488)
            flyBG.P = 90000
            flyBG.Parent = hrp
            if hum then
                hum.PlatformStand = true
            end
            flyLoop = RunService.RenderStepped:Connect(function()
                local cam = workspace.CurrentCamera
                if not hum or not hrp then
                    return
                end
                local moveDir = hum.MoveDirection
                if moveDir.Magnitude == 0 then
                    local kbDir = Vector3.new(0, 0, 0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        kbDir = kbDir + cam.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        kbDir = kbDir - cam.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        kbDir = kbDir - cam.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        kbDir = kbDir + cam.CFrame.RightVector
                    end
                    if kbDir.Magnitude > 0 then
                        moveDir = kbDir.Unit
                    end
                end
                if moveDir.Magnitude > 0 then
                    flyBV.Velocity = moveDir * flySpeed
                else
                    flyBV.Velocity = Vector3.new(0, 0, 0)
                end
                flyBG.CFrame = cam.CFrame
            end)
        else
            if flyBV then
                flyBV:Destroy()
            end
            if flyBG then
                flyBG:Destroy()
            end
            if flyLoop then
                flyLoop:Disconnect()
            end
            if hum then
                hum.PlatformStand = false
            end
        end
    end
    local UI_SCALE = 0.8
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KitagawaHub"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local ShadowFrame = Instance.new("Frame")
    ShadowFrame.Name = "ShadowFrame"
    ShadowFrame.Parent = ScreenGui
    ShadowFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ShadowFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    ShadowFrame.Position = UDim2.new(0.5, 4, 0.5, 6)
    ShadowFrame.Size = UDim2.new(0, 646, 0, 426)
    ShadowFrame.BackgroundTransparency = 0.45
    ShadowFrame.Visible = false
    Instance.new("UICorner", ShadowFrame).CornerRadius = UDim.new(0, 16)
    local ShadowScale = Instance.new("UIScale", ShadowFrame)
    ShadowScale.Scale = 0.3
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(11, 11, 16)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 640, 0, 420)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = false
    MainFrame.Visible = false
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)
    local BgImage = Instance.new("ImageLabel")
    BgImage.Name = "BackgroundImage"
    BgImage.Parent = MainFrame
    BgImage.BackgroundTransparency = 1
    BgImage.Size = UDim2.new(1, 0, 1, 0)
    BgImage.Image = "rbxassetid://121149051147413"
    BgImage.ScaleType = Enum.ScaleType.Crop
    BgImage.ImageTransparency = 0.35
    BgImage.ZIndex = 0
    Instance.new("UICorner", BgImage).CornerRadius = UDim.new(0, 14)
    local MainScale = Instance.new("UIScale", MainFrame)
    MainScale.Scale = 0.3
    local MainGradient = Instance.new("UIGradient")
    MainGradient.Rotation = 90
    MainGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.1),
        NumberSequenceKeypoint.new(1, 0.5),
    })
    MainGradient.Parent = MainFrame
    local MainStroke = Instance.new("UIStroke")
    MainStroke.Parent = MainFrame
    MainStroke.Color = Color3.fromRGB(35, 35, 50)
    MainStroke.Thickness = 1.5
    local function toggleMenu(forceState)
        if forceState ~= nil then
            isMenuOpen = forceState
        else
            isMenuOpen = not isMenuOpen
        end
        if isMenuOpen then
            MainFrame.Visible = true
            if not isMinimized then
                ShadowFrame.Visible = true
            end
            TweenService:Create(
                MainScale,
                TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                { Scale = UI_SCALE }
            ):Play()
            TweenService:Create(
                ShadowScale,
                TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                { Scale = UI_SCALE }
            ):Play()
        else
            local closeTween = TweenService:Create(
                MainScale,
                TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                { Scale = 0.2 }
            )
            TweenService:Create(
                ShadowScale,
                TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                { Scale = 0.2 }
            ):Play()
            closeTween:Play()
            closeTween.Completed:Connect(function()
                if not isMenuOpen then
                    MainFrame.Visible = false
                    ShadowFrame.Visible = false
                end
            end)
        end
    end
    local ToggleWidget = Instance.new("Frame")
    ToggleWidget.Name = "ToggleWidget"
    ToggleWidget.Parent = ScreenGui
    ToggleWidget.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    ToggleWidget.BackgroundTransparency = 0.15
    ToggleWidget.Position = UDim2.new(0.5, -80, 0.08, 0)
    ToggleWidget.Size = UDim2.new(0, 160, 0, 44)
    ToggleWidget.Visible = false
    Instance.new("UICorner", ToggleWidget).CornerRadius = UDim.new(0, 10)
    local ToggleScale = Instance.new("UIScale", ToggleWidget)
    ToggleScale.Scale = 0.85
    local ToggleStroke = Instance.new("UIStroke")
    ToggleStroke.Parent = ToggleWidget
    ToggleStroke.Color = Color3.fromRGB(45, 45, 65)
    ToggleStroke.Thickness = 1.5
    local ToggleLabelText = Instance.new("TextLabel")
    ToggleLabelText.Parent = ToggleWidget
    ToggleLabelText.BackgroundTransparency = 1
    ToggleLabelText.Size = UDim2.new(1, 0, 1, 0)
    ToggleLabelText.Font = Enum.Font.GothamBold
    ToggleLabelText.Text = "KitagawaHub"
    ToggleLabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleLabelText.TextSize = 17
    local ToggleGradient = Instance.new("UIGradient")
    ToggleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, accentColor),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
    })
    ToggleGradient.Parent = ToggleLabelText
    ToggleWidget.InputBegan:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            TweenService:Create(ToggleScale, TweenInfo.new(0.15), { Scale = 0.78 }):Play()
        end
    end)
    ToggleWidget.InputEnded:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            TweenService:Create(ToggleScale, TweenInfo.new(0.15), { Scale = 0.85 }):Play()
        end
    end)
    local dragToggle, dragInputT, dragStartT, startPosT
    local dragStartTime = 0
    ToggleWidget.InputBegan:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            dragToggle = true
            dragStartT = input.Position
            startPosT = ToggleWidget.Position
            dragStartTime = tick()
        end
    end)
    ToggleWidget.InputChanged:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseMovement)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            dragInputT = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if (input == dragInputT) and dragToggle then
            local delta = input.Position - dragStartT
            ToggleWidget.Position = UDim2.new(
                startPosT.X.Scale,
                startPosT.X.Offset + delta.X,
                startPosT.Y.Scale,
                startPosT.Y.Offset + delta.Y
            )
        end
    end)
    ToggleWidget.InputEnded:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            dragToggle = false
            if (tick() - dragStartTime) < 0.25 then
                toggleMenu()
            end
        end
    end)
    local LangFrame = Instance.new("Frame")
    LangFrame.Name = "LangFrame"
    LangFrame.Parent = ScreenGui
    LangFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
    LangFrame.BackgroundTransparency = 0.15
    LangFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    LangFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    LangFrame.Size = UDim2.new(0, 380, 0, 230)
    LangFrame.Visible = true
    Instance.new("UICorner", LangFrame).CornerRadius = UDim.new(0, 14)
    Instance.new("UIStroke", LangFrame).Color = Color3.fromRGB(45, 45, 60)
    local LangScale = Instance.new("UIScale", LangFrame)
    LangScale.Scale = 0.8
    local LangTitle = Instance.new("TextLabel")
    LangTitle.Parent = LangFrame
    LangTitle.BackgroundTransparency = 1
    LangTitle.Position = UDim2.new(0, 0, 0, 25)
    LangTitle.Size = UDim2.new(1, 0, 0, 30)
    LangTitle.Font = Enum.Font.GothamBold
    LangTitle.Text = "Choose language / Выберите язык"
    LangTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    LangTitle.TextSize = 17
    local function buildLangButton(emoji, text, posX, langCode)
        local Btn = Instance.new("TextButton")
        Btn.Parent = LangFrame
        Btn.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
        Btn.BackgroundTransparency = 0.15
        Btn.Position = UDim2.new(0, posX, 0, 75)
        Btn.Size = UDim2.new(0, 110, 0, 110)
        Btn.Text = ""
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(1, 0)
        Instance.new("UIStroke", Btn).Color = Color3.fromRGB(45, 45, 65)
        local EmojiLabel = Instance.new("TextLabel")
        EmojiLabel.Parent = Btn
        EmojiLabel.BackgroundTransparency = 1
        EmojiLabel.Size = UDim2.new(1, 0, 1, 0)
        EmojiLabel.Font = Enum.Font.Gotham
        EmojiLabel.Text = emoji
        EmojiLabel.TextSize = 55
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Parent = Btn
        TextLabel.BackgroundTransparency = 1
        TextLabel.Position = UDim2.new(0, 0, 1, 10)
        TextLabel.Size = UDim2.new(1, 0, 0, 20)
        TextLabel.Font = Enum.Font.GothamSemibold
        TextLabel.Text = text
        TextLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
        TextLabel.TextSize = 15
        Btn.MouseButton1Click:Connect(function()
            lang = langCode
            _G.ApplyLanguage()
            TweenService:Create(
                LangScale,
                TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                { Scale = 0 }
            ):Play()
            task.wait(0.2)
            LangFrame.Visible = false
            ToggleWidget.Visible = true
            toggleMenu(true)
        end)
    end
    buildLangButton("RU", "Русский", 65, "RU")
    buildLangButton("EN", "English", 205, "EN")
    local dragging, dragInput, dragStart, startPos
    MainFrame.InputBegan:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    MainFrame.InputChanged:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseMovement)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if (input == dragInput) and dragging then
            local delta = input.Position - dragStart
            local targetPos = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
            MainFrame.Position = targetPos
            ShadowFrame.Position = UDim2.new(
                targetPos.X.Scale,
                targetPos.X.Offset + 4,
                targetPos.Y.Scale,
                targetPos.Y.Offset + 6
            )
        end
    end)
    MainFrame.InputEnded:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            dragging = false
        end
    end)
    local TopControls = Instance.new("Frame")
    TopControls.Parent = MainFrame
    TopControls.BackgroundTransparency = 1
    TopControls.Position = UDim2.new(1, -75, 0, 14)
    TopControls.Size = UDim2.new(0, 65, 0, 26)
    TopControls.ZIndex = 20
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TopControls
    CloseBtn.BackgroundColor3 = Color3.fromRGB(25, 18, 22)
    CloseBtn.Position = UDim2.new(1, -26, 0, 0)
    CloseBtn.Size = UDim2.new(0, 26, 0, 26)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(250, 80, 80)
    CloseBtn.TextSize = 18
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
    CloseBtn.MouseButton1Click:Connect(function()
        autoFarmActive = false
        UpdateSpeedFarmState()
        if getgenv then
            getgenv().SpeedKeyboardHeartbeatStop = true
            getgenv().SpeedKeyboardRunning = nil
        end
        setNoClip(false)
        if godModeConnection then
            godModeConnection:Disconnect()
        end
        if flyBV then
            toggleManualFly(false)
        end
        if afkConnection then
            afkConnection:Disconnect()
        end
        if checkModelConnection then
            checkModelConnection:Disconnect()
        end
        toggleMenu(false)
        task.wait(0.3)
        ScreenGui:Destroy()
    end)
    local MinBtn = Instance.new("TextButton")
    MinBtn.Parent = TopControls
    MinBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    MinBtn.Position = UDim2.new(1, -58, 0, 0)
    MinBtn.Size = UDim2.new(0, 26, 0, 26)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Color3.fromRGB(160, 160, 180)
    MinBtn.TextSize = 18
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)
    MinBtn.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            TweenService:Create(
                MainFrame,
                TweenInfo.new(0.35, Enum.EasingStyle.Quart),
                { Size = UDim2.new(0, 640, 0, 52) }
            ):Play()
            TweenService:Create(
                ShadowFrame,
                TweenInfo.new(0.35, Enum.EasingStyle.Quart),
                { Size = UDim2.new(0, 646, 0, 58) }
            ):Play()
            MinBtn.Text = "+"
        else
            TweenService:Create(
                MainFrame,
                TweenInfo.new(0.35, Enum.EasingStyle.Quart),
                { Size = UDim2.new(0, 640, 0, 420) }
            ):Play()
            TweenService:Create(
                ShadowFrame,
                TweenInfo.new(0.35, Enum.EasingStyle.Quart),
                { Size = UDim2.new(0, 646, 0, 426) }
            ):Play()
            MinBtn.Text = "-"
        end
    end)
    local Sidebar = Instance.new("Frame")
    Sidebar.Parent = MainFrame
    Sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    Sidebar.BackgroundTransparency = 0.1
    Sidebar.Size = UDim2.new(0, 170, 1, 0)
    Sidebar.BorderSizePixel = 0
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 14)
    local SidebarGradient = Instance.new("UIGradient")
    SidebarGradient.Rotation = 90
    SidebarGradient.Transparency =
        NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.4) })
    SidebarGradient.Parent = Sidebar
    local SidebarFix = Instance.new("Frame")
    SidebarFix.Parent = Sidebar
    SidebarFix.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    SidebarFix.BackgroundTransparency = 0.1
    SidebarFix.Position = UDim2.new(1, -12, 0, 0)
    SidebarFix.Size = UDim2.new(0, 12, 1, 0)
    SidebarFix.BorderSizePixel = 0
    local SidebarFixGradient = Instance.new("UIGradient")
    SidebarFixGradient.Rotation = 90
    SidebarFixGradient.Transparency =
        NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.4) })
    SidebarFixGradient.Parent = SidebarFix
    local Title = Instance.new("TextLabel")
    Title.Parent = Sidebar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0, 16)
    Title.Size = UDim2.new(1, 0, 0, 26)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "KitagawaHub"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    local TitleGradient = Instance.new("UIGradient")
    TitleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, accentColor),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
    })
    TitleGradient.Parent = Title
    local SepLine = Instance.new("Frame")
    SepLine.Parent = Sidebar
    SepLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SepLine.Position = UDim2.new(0.1, 0, 0, 52)
    SepLine.Size = UDim2.new(0.8, 0, 0, 1)
    local SepGradient = Instance.new("UIGradient")
    SepGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
        ColorSequenceKeypoint.new(0.5, accentColor),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35)),
    })
    SepGradient.Parent = SepLine
    local TabContainer = Instance.new("Frame")
    TabContainer.Parent = Sidebar
    TabContainer.BackgroundTransparency = 1
    TabContainer.Position = UDim2.new(0, 12, 0, 72)
    TabContainer.Size = UDim2.new(1, -24, 1, -85)
    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Parent = TabContainer
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 10)
    local ContentArea = Instance.new("Frame")
    ContentArea.Parent = MainFrame
    ContentArea.BackgroundTransparency = 1
    ContentArea.ClipsDescendants = false
    ContentArea.Position = UDim2.new(0, 185, 0, 15)
    ContentArea.Size = UDim2.new(1, -200, 1, -30)
    local AutoFarmPage = Instance.new("Frame")
    AutoFarmPage.Parent = ContentArea
    AutoFarmPage.BackgroundTransparency = 1
    AutoFarmPage.ClipsDescendants = false
    AutoFarmPage.Size = UDim2.new(1, 0, 1, 0)
    AutoFarmPage.Visible = true
    local MovementPage = Instance.new("Frame")
    MovementPage.Parent = ContentArea
    MovementPage.BackgroundTransparency = 1
    MovementPage.Size = UDim2.new(1, 0, 1, 0)
    MovementPage.Visible = false
    local ThemePage = Instance.new("Frame")
    ThemePage.Parent = ContentArea
    ThemePage.BackgroundTransparency = 1
    ThemePage.Size = UDim2.new(1, 0, 1, 0)
    ThemePage.Visible = false
    local AdminPage = Instance.new("Frame")
    AdminPage.Parent = ContentArea
    AdminPage.BackgroundTransparency = 1
    AdminPage.Size = UDim2.new(1, 0, 1, 0)
    AdminPage.Visible = false
    local tabButtons = {}
    local function createTabButton(text, page)
        local btn = Instance.new("TextButton")
        btn.Parent = TabContainer
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
        btn.BackgroundTransparency = 0.15
        btn.Size = UDim2.new(1, 0, 0, 40)
        btn.Font = Enum.Font.GothamSemibold
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(150, 150, 170)
        btn.TextSize = 14
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
        btn.MouseButton1Click:Connect(function()
            for _, b in ipairs(tabButtons) do
                TweenService
                    :Create(
                        b,
                        TweenInfo.new(0.2),
                        {
                            BackgroundColor3 = Color3.fromRGB(20, 20, 28),
                            TextColor3 = Color3.fromRGB(150, 150, 170),
                        }
                    )
                    :Play()
            end
            TweenService
                :Create(
                    btn,
                    TweenInfo.new(0.2),
                    { BackgroundColor3 = accentColor, TextColor3 = Color3.fromRGB(255, 255, 255) }
                )
                :Play()
            AutoFarmPage.Visible = page == AutoFarmPage
            MovementPage.Visible = page == MovementPage
            ThemePage.Visible = page == ThemePage
            AdminPage.Visible = page == AdminPage
        end)
        table.insert(tabButtons, btn)
        return btn
    end
    local autoFarmTabBtn = createTabButton("AutoFarm", AutoFarmPage)
    local movementTabBtn = createTabButton("Moovement", MovementPage)
    local themeTabBtn = createTabButton("Theme", ThemePage)
    local adminTabBtn = createTabButton("AdminPanel", AdminPage)
    autoFarmTabBtn.BackgroundColor3 = accentColor
    autoFarmTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    local ThemeScroll = Instance.new("ScrollingFrame")
    ThemeScroll.Parent = ThemePage
    ThemeScroll.BackgroundTransparency = 1
    ThemeScroll.Size = UDim2.new(1, 0, 1, 0)
    ThemeScroll.ScrollBarThickness = 0
    local ThemeList = Instance.new("UIListLayout")
    ThemeList.Parent = ThemeScroll
    ThemeList.SortOrder = Enum.SortOrder.LayoutOrder
    ThemeList.Padding = UDim.new(0, 10)
    local ThemeTitle = Instance.new("TextLabel")
    ThemeTitle.Parent = ThemeScroll
    ThemeTitle.BackgroundTransparency = 1
    ThemeTitle.Size = UDim2.new(1, 0, 0, 32)
    ThemeTitle.Font = Enum.Font.GothamBold
    ThemeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    ThemeTitle.TextSize = 16
    ThemeTitle.TextXAlignment = Enum.TextXAlignment.Left
    local ThemeRows = {}
    local function createThemeRow(color1, color2)
        local RowBtn = Instance.new("TextButton")
        RowBtn.Parent = ThemeScroll
        RowBtn.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
        RowBtn.BackgroundTransparency = 0.15
        RowBtn.Size = UDim2.new(1, -10, 0, 52)
        RowBtn.Text = ""
        Instance.new("UICorner", RowBtn).CornerRadius = UDim.new(0, 10)
        local CirclePreview = Instance.new("Frame")
        CirclePreview.Parent = RowBtn
        CirclePreview.Size = UDim2.new(0, 26, 0, 26)
        CirclePreview.Position = UDim2.new(0, 16, 0.5, -13)
        Instance.new("UICorner", CirclePreview).CornerRadius = UDim.new(1, 0)
        local Gradient = Instance.new("UIGradient")
        Gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, color1),
            ColorSequenceKeypoint.new(1, color2),
        })
        Gradient.Parent = CirclePreview
        local ThemeText = Instance.new("TextLabel")
        ThemeText.Parent = RowBtn
        ThemeText.BackgroundTransparency = 1
        ThemeText.Position = UDim2.new(0, 56, 0, 0)
        ThemeText.Size = UDim2.new(1, -70, 1, 0)
        ThemeText.Font = Enum.Font.GothamSemibold
        ThemeText.TextColor3 = Color3.fromRGB(190, 190, 210)
        ThemeText.TextSize = 15
        ThemeText.TextXAlignment = Enum.TextXAlignment.Left
        RowBtn.MouseButton1Click:Connect(function()
            accentColor = color1
            TitleGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, color1),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
            })
            ToggleGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, color1),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
            })
            SepGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
                ColorSequenceKeypoint.new(0.5, color1),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35)),
            })
            for _, b in ipairs(tabButtons) do
                if b.BackgroundColor3 ~= Color3.fromRGB(20, 20, 28) then
                    TweenService:Create(b, TweenInfo.new(0.3), { BackgroundColor3 = color1 }):Play()
                end
            end
            _G.UpdateColors(color1)
        end)
        table.insert(ThemeRows, ThemeText)
    end
    createThemeRow(Color3.fromRGB(0, 150, 255), Color3.fromRGB(0, 70, 200))
    createThemeRow(Color3.fromRGB(168, 85, 247), Color3.fromRGB(100, 30, 180))
    createThemeRow(Color3.fromRGB(34, 197, 94), Color3.fromRGB(20, 100, 50))
    createThemeRow(Color3.fromRGB(236, 72, 153), Color3.fromRGB(150, 20, 80))
    createThemeRow(Color3.fromRGB(245, 158, 11), Color3.fromRGB(160, 80, 0))
    createThemeRow(Color3.fromRGB(220, 220, 230), Color3.fromRGB(100, 100, 110))
    ThemeScroll.CanvasSize = UDim2.new(0, 0, 0, ThemeList.AbsoluteContentSize.Y + 40)
    local MoveLeftPanel = Instance.new("ScrollingFrame")
    MoveLeftPanel.Parent = MovementPage
    MoveLeftPanel.BackgroundTransparency = 1
    MoveLeftPanel.Size = UDim2.new(1, 0, 1, 0)
    MoveLeftPanel.ScrollBarThickness = 0
    MoveLeftPanel.CanvasSize = UDim2.new(0, 0, 0, 230)
    local InfJumpFrame = Instance.new("Frame")
    InfJumpFrame.Parent = MoveLeftPanel
    InfJumpFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    InfJumpFrame.BackgroundTransparency = 0.15
    InfJumpFrame.Position = UDim2.new(0, 0, 0, 10)
    InfJumpFrame.Size = UDim2.new(0.96, 0, 0, 56)
    Instance.new("UICorner", InfJumpFrame).CornerRadius = UDim.new(0, 10)
    local InfJumpLabel = Instance.new("TextLabel")
    InfJumpLabel.Parent = InfJumpFrame
    InfJumpLabel.BackgroundTransparency = 1
    InfJumpLabel.Position = UDim2.new(0, 16, 0, 0)
    InfJumpLabel.Size = UDim2.new(0.7, 0, 1, 0)
    InfJumpLabel.Font = Enum.Font.GothamBold
    InfJumpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    InfJumpLabel.TextSize = 15
    InfJumpLabel.TextXAlignment = Enum.TextXAlignment.Left
    local InfJumpSwitchBG = Instance.new("TextButton")
    InfJumpSwitchBG.Parent = InfJumpFrame
    InfJumpSwitchBG.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    InfJumpSwitchBG.Position = UDim2.new(1, -65, 0.5, -14)
    InfJumpSwitchBG.Size = UDim2.new(0, 50, 0, 28)
    InfJumpSwitchBG.Text = ""
    Instance.new("UICorner", InfJumpSwitchBG).CornerRadius = UDim.new(0, 14)
    local InfJumpSwitchDot = Instance.new("Frame")
    InfJumpSwitchDot.Parent = InfJumpSwitchBG
    InfJumpSwitchDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    InfJumpSwitchDot.Position = UDim2.new(0, 3, 0.5, -11)
    InfJumpSwitchDot.Size = UDim2.new(0, 22, 0, 22)
    Instance.new("UICorner", InfJumpSwitchDot).CornerRadius = UDim.new(0, 11)
    InfJumpSwitchBG.MouseButton1Click:Connect(function()
        infJumpEnabled = not infJumpEnabled
        if infJumpEnabled then
            TweenService:Create(
                InfJumpSwitchBG,
                TweenInfo.new(0.2),
                { BackgroundColor3 = Color3.fromRGB(34, 197, 94) }
            ):Play()
            TweenService
                :Create(
                    InfJumpSwitchDot,
                    TweenInfo.new(0.2),
                    { Position = UDim2.new(0, 25, 0.5, -11) }
                )
                :Play()
        else
            TweenService:Create(
                InfJumpSwitchBG,
                TweenInfo.new(0.2),
                { BackgroundColor3 = Color3.fromRGB(40, 40, 55) }
            ):Play()
            TweenService
                :Create(
                    InfJumpSwitchDot,
                    TweenInfo.new(0.2),
                    { Position = UDim2.new(0, 3, 0.5, -11) }
                )
                :Play()
        end
    end)
    local FlyFrame = Instance.new("Frame")
    FlyFrame.Parent = MoveLeftPanel
    FlyFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    FlyFrame.BackgroundTransparency = 0.15
    FlyFrame.Position = UDim2.new(0, 0, 0, 78)
    FlyFrame.Size = UDim2.new(0.96, 0, 0, 56)
    Instance.new("UICorner", FlyFrame).CornerRadius = UDim.new(0, 10)
    local FlyLabel = Instance.new("TextLabel")
    FlyLabel.Parent = FlyFrame
    FlyLabel.BackgroundTransparency = 1
    FlyLabel.Position = UDim2.new(0, 16, 0, 0)
    FlyLabel.Size = UDim2.new(0.7, 0, 1, 0)
    FlyLabel.Font = Enum.Font.GothamBold
    FlyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    FlyLabel.TextSize = 15
    FlyLabel.TextXAlignment = Enum.TextXAlignment.Left
    local FlySwitchBG = Instance.new("TextButton")
    FlySwitchBG.Parent = FlyFrame
    FlySwitchBG.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    FlySwitchBG.Position = UDim2.new(1, -65, 0.5, -14)
    FlySwitchBG.Size = UDim2.new(0, 50, 0, 28)
    FlySwitchBG.Text = ""
    Instance.new("UICorner", FlySwitchBG).CornerRadius = UDim.new(0, 14)
    local FlySwitchDot = Instance.new("Frame")
    FlySwitchDot.Parent = FlySwitchBG
    FlySwitchDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    FlySwitchDot.Position = UDim2.new(0, 3, 0.5, -11)
    FlySwitchDot.Size = UDim2.new(0, 22, 0, 22)
    Instance.new("UICorner", FlySwitchDot).CornerRadius = UDim.new(0, 11)
    FlySwitchBG.MouseButton1Click:Connect(function()
        flyEnabled = not flyEnabled
        if flyEnabled then
            TweenService:Create(
                FlySwitchBG,
                TweenInfo.new(0.2),
                { BackgroundColor3 = Color3.fromRGB(34, 197, 94) }
            ):Play()
            TweenService
                :Create(FlySwitchDot, TweenInfo.new(0.2), { Position = UDim2.new(0, 25, 0.5, -11) })
                :Play()
            toggleManualFly(true)
        else
            TweenService:Create(
                FlySwitchBG,
                TweenInfo.new(0.2),
                { BackgroundColor3 = Color3.fromRGB(40, 40, 55) }
            ):Play()
            TweenService
                :Create(FlySwitchDot, TweenInfo.new(0.2), { Position = UDim2.new(0, 3, 0.5, -11) })
                :Play()
            toggleManualFly(false)
        end
    end)
    local FlySpeedSliderFrame = Instance.new("Frame")
    FlySpeedSliderFrame.Parent = MoveLeftPanel
    FlySpeedSliderFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    FlySpeedSliderFrame.BackgroundTransparency = 0.15
    FlySpeedSliderFrame.Position = UDim2.new(0, 0, 0, 148)
    FlySpeedSliderFrame.Size = UDim2.new(0.96, 0, 0, 68)
    Instance.new("UICorner", FlySpeedSliderFrame).CornerRadius = UDim.new(0, 10)
    local FlySpeedLabelUI = Instance.new("TextLabel")
    FlySpeedLabelUI.Parent = FlySpeedSliderFrame
    FlySpeedLabelUI.BackgroundTransparency = 1
    FlySpeedLabelUI.Position = UDim2.new(0, 16, 0, 8)
    FlySpeedLabelUI.Size = UDim2.new(1, -32, 0, 20)
    FlySpeedLabelUI.Font = Enum.Font.GothamSemibold
    FlySpeedLabelUI.TextColor3 = Color3.fromRGB(200, 200, 220)
    FlySpeedLabelUI.TextSize = 13
    FlySpeedLabelUI.TextXAlignment = Enum.TextXAlignment.Left
    local FlySpeedTrack = Instance.new("TextButton")
    FlySpeedTrack.Parent = FlySpeedSliderFrame
    FlySpeedTrack.BackgroundColor3 = Color3.fromRGB(32, 32, 45)
    FlySpeedTrack.Position = UDim2.new(0, 16, 0, 36)
    FlySpeedTrack.Size = UDim2.new(1, -32, 0, 16)
    FlySpeedTrack.Text = ""
    Instance.new("UICorner", FlySpeedTrack).CornerRadius = UDim.new(0, 8)
    local FlySpeedFill = Instance.new("Frame")
    FlySpeedFill.Parent = FlySpeedTrack
    FlySpeedFill.BackgroundColor3 = accentColor
    FlySpeedFill.Size = UDim2.new(flySpeed / 300, 0, 1, 0)
    Instance.new("UICorner", FlySpeedFill).CornerRadius = UDim.new(0, 8)
    local draggingFlySlider = false
    local function updateFlySpeed(input)
        local fraction = math.clamp(
            (input.Position.X - FlySpeedTrack.AbsolutePosition.X) / FlySpeedTrack.AbsoluteSize.X,
            0,
            1
        )
        flySpeed = math.floor(fraction * 300)
        FlySpeedLabelUI.Text = string.format(L("FlySpeedLabel"), flySpeed)
        TweenService
            :Create(FlySpeedFill, TweenInfo.new(0.05), { Size = UDim2.new(fraction, 0, 1, 0) })
            :Play()
    end
    FlySpeedTrack.InputBegan:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            draggingFlySlider = true
            updateFlySpeed(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if
            draggingFlySlider
            and (
                (input.UserInputType == Enum.UserInputType.MouseMovement)
                or (input.UserInputType == Enum.UserInputType.Touch)
            )
        then
            updateFlySpeed(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            draggingFlySlider = false
        end
    end)
    local LeftPanel = Instance.new("Frame")
    LeftPanel.Parent = AutoFarmPage
    LeftPanel.BackgroundTransparency = 1
    LeftPanel.Size = UDim2.new(0.96, 0, 1, 0)
    local WorldLabel = Instance.new("TextLabel")
    WorldLabel.Parent = LeftPanel
    WorldLabel.BackgroundTransparency = 1
    WorldLabel.Size = UDim2.new(1, 0, 0, 20)
    WorldLabel.Font = Enum.Font.GothamSemibold
    WorldLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    WorldLabel.TextSize = 14
    WorldLabel.TextXAlignment = Enum.TextXAlignment.Left
    local WorldsFrame = Instance.new("Frame")
    WorldsFrame.Parent = LeftPanel
    WorldsFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    WorldsFrame.BackgroundTransparency = 0.15
    WorldsFrame.Position = UDim2.new(0, 0, 0, 26)
    WorldsFrame.Size = UDim2.new(1, 0, 0, 44)
    Instance.new("UICorner", WorldsFrame).CornerRadius = UDim.new(0, 10)
    local BbnosInfoLabel = Instance.new("TextLabel")
    BbnosInfoLabel.Parent = LeftPanel
    BbnosInfoLabel.BackgroundTransparency = 1
    BbnosInfoLabel.Position = UDim2.new(0, 0, 0, 310)
    BbnosInfoLabel.Size = UDim2.new(1, 0, 0, 50)
    BbnosInfoLabel.Font = Enum.Font.GothamSemibold
    BbnosInfoLabel.Text =
        "Что бы использовать +50k cash фарм вам нужно сначала на фармить 50k денег а после включать функцию потому что она не будет работать без этого"
    BbnosInfoLabel.TextColor3 = Color3.fromRGB(240, 80, 80)
    BbnosInfoLabel.TextSize = 11
    BbnosInfoLabel.TextWrapped = true
    BbnosInfoLabel.Visible = false
    local worldButtons = {}
    local DropdownList = Instance.new("ScrollingFrame")
    local DropdownBtn = Instance.new("TextButton")
    local SliderLabel = Instance.new("TextLabel")
    local SliderFillAuto = Instance.new("Frame")
    local function buildDistanceOptions()
        for _, c in ipairs(DropdownList:GetChildren()) do
            if c:IsA("TextButton") then
                c:Destroy()
            end
        end
        local options = {}
        if Waypoints[currentWorld] then
            for d, _ in pairs(Waypoints[currentWorld]) do
                table.insert(options, d)
            end
            table.sort(options, function(a, b)
                return (distSortOrder[a] or 99) < (distSortOrder[b] or 99)
            end)
        end
        if #options == 0 then
            DropdownBtn.Text = "   " .. L("NoPoints") .. " v"
            currentDistance = nil
            UpdateSpeedFarmState()
            return
        end
        for _, opt in ipairs(options) do
            local btn = Instance.new("TextButton")
            btn.Parent = DropdownList
            btn.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
            btn.BackgroundTransparency = 0.15
            btn.Size = UDim2.new(1, 0, 0, 36)
            btn.Font = Enum.Font.GothamSemibold
            btn.Text = "            " .. opt
            btn.TextColor3 = Color3.fromRGB(200, 200, 220)
            btn.TextSize = 14
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.ZIndex = 51
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
            local TrophyIcon = Instance.new("ImageLabel")
            TrophyIcon.Parent = btn
            TrophyIcon.BackgroundTransparency = 1
            TrophyIcon.Position = UDim2.new(0, 10, 0.5, -12)
            TrophyIcon.Size = UDim2.new(0, 24, 0, 24)
            TrophyIcon.Image = "rbxassetid://85025550755267"
            TrophyIcon.ScaleType = Enum.ScaleType.Fit
            TrophyIcon.ZIndex = 52
            btn.MouseButton1Click:Connect(function()
                currentDistance = opt
                DropdownBtn.Text = "   " .. opt .. " v"
                DropdownList.Visible = false
                UpdateSpeedFarmState()
            end)
        end
        currentDistance = options[1]
        DropdownBtn.Text = "   " .. currentDistance .. " v"
        UpdateSpeedFarmState()
    end
    local function createWorldBtn(text, posXScale, widthScale, index)
        local btn = Instance.new("TextButton")
        btn.Parent = WorldsFrame
        btn.BackgroundTransparency = 1
        btn.Position = UDim2.new(posXScale, 3, 0, 3)
        btn.Size = UDim2.new(widthScale, -6, 1, -6)
        btn.Font = Enum.Font.GothamBold
        btn.Text = text
        btn.TextColor3 = ((index == 1) and Color3.fromRGB(255, 255, 255))
            or Color3.fromRGB(140, 140, 160)
        btn.TextSize = 14
        if index == 1 then
            btn.BackgroundTransparency = 0.15
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        end
        btn.MouseButton1Click:Connect(function()
            currentWorld = text
            WorldLabel.Text = string.format(L("WorldLabel"), text)
            if text == "Bbnos World" then
                BbnosInfoLabel.Visible = true
            else
                BbnosInfoLabel.Visible = false
            end
            for _, b in ipairs(worldButtons) do
                b.BackgroundTransparency = 1
                b.TextColor3 = Color3.fromRGB(140, 140, 160)
            end
            btn.BackgroundTransparency = 0.15
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            buildDistanceOptions()
            local maxSpd = 110
            if currentWorld == "2 World" then
                maxSpd = 190
            elseif currentWorld == "Bbnos World" then
                maxSpd = 300
            end
            if currentSpeed > maxSpd then
                currentSpeed = maxSpd
            end
            SliderLabel.Text = string.format(L("SpeedLabel"), currentSpeed)
            TweenService:Create(
                SliderFillAuto,
                TweenInfo.new(0.2),
                { Size = UDim2.new(currentSpeed / maxSpd, 0, 1, 0) }
            ):Play()
        end)
        table.insert(worldButtons, btn)
    end
    createWorldBtn("1 World", 0, 0.25, 1)
    createWorldBtn("2 World", 0.25, 0.25, 2)
    createWorldBtn("3 World", 0.5, 0.25, 3)
    createWorldBtn("Bbnos World", 0.75, 0.25, 4)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Parent = LeftPanel
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    ToggleFrame.BackgroundTransparency = 0.15
    ToggleFrame.Position = UDim2.new(0, 0, 0, 82)
    ToggleFrame.Size = UDim2.new(1, 0, 0, 56)
    Instance.new("UICorner", ToggleFrame).CornerRadius = UDim.new(0, 10)
    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Parent = ToggleFrame
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Position = UDim2.new(0, 16, 0, 0)
    ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    ToggleLabel.Font = Enum.Font.GothamBold
    ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleLabel.TextSize = 15
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    local SwitchBG = Instance.new("TextButton")
    SwitchBG.Parent = ToggleFrame
    SwitchBG.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    SwitchBG.Position = UDim2.new(1, -65, 0.5, -14)
    SwitchBG.Size = UDim2.new(0, 50, 0, 28)
    SwitchBG.Text = ""
    Instance.new("UICorner", SwitchBG).CornerRadius = UDim.new(0, 14)
    local SwitchDot = Instance.new("Frame")
    SwitchDot.Parent = SwitchBG
    SwitchDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SwitchDot.Position = UDim2.new(0, 3, 0.5, -11)
    SwitchDot.Size = UDim2.new(0, 22, 0, 22)
    Instance.new("UICorner", SwitchDot).CornerRadius = UDim.new(0, 11)
    SwitchBG.MouseButton1Click:Connect(function()
        if not currentDistance then
            return
        end
        autoFarmActive = not autoFarmActive
        UpdateSpeedFarmState()
        if autoFarmActive then
            TweenService:Create(
                SwitchBG,
                TweenInfo.new(0.2),
                { BackgroundColor3 = Color3.fromRGB(34, 197, 94) }
            ):Play()
            TweenService
                :Create(SwitchDot, TweenInfo.new(0.2), { Position = UDim2.new(0, 25, 0.5, -11) })
                :Play()
            startAutoFarmLoop()
        else
            TweenService
                :Create(
                    SwitchBG,
                    TweenInfo.new(0.2),
                    { BackgroundColor3 = Color3.fromRGB(40, 40, 55) }
                )
                :Play()
            TweenService
                :Create(SwitchDot, TweenInfo.new(0.2), { Position = UDim2.new(0, 3, 0.5, -11) })
                :Play()
            setNoClip(false)
        end
    end)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Parent = LeftPanel
    SliderFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    SliderFrame.BackgroundTransparency = 0.15
    SliderFrame.Position = UDim2.new(0, 0, 0, 150)
    SliderFrame.Size = UDim2.new(1, 0, 0, 68)
    Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0, 10)
    SliderLabel.Parent = SliderFrame
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Position = UDim2.new(0, 16, 0, 8)
    SliderLabel.Size = UDim2.new(1, -32, 0, 20)
    SliderLabel.Font = Enum.Font.GothamSemibold
    SliderLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    SliderLabel.TextSize = 13
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    local SliderTrack = Instance.new("TextButton")
    SliderTrack.Parent = SliderFrame
    SliderTrack.BackgroundColor3 = Color3.fromRGB(32, 32, 45)
    SliderTrack.Position = UDim2.new(0, 16, 0, 36)
    SliderTrack.Size = UDim2.new(1, -32, 0, 16)
    SliderTrack.Text = ""
    Instance.new("UICorner", SliderTrack).CornerRadius = UDim.new(0, 8)
    SliderFillAuto.Parent = SliderTrack
    SliderFillAuto.BackgroundColor3 = accentColor
    SliderFillAuto.Size = UDim2.new(1, 0, 1, 0)
    Instance.new("UICorner", SliderFillAuto).CornerRadius = UDim.new(0, 8)
    local draggingSliderAuto = false
    local function updateSpeedAuto(input)
        local fraction = math.clamp(
            (input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X,
            0,
            1
        )
        local maxSpd = 110
        if currentWorld == "2 World" then
            maxSpd = 190
        elseif currentWorld == "Bbnos World" then
            maxSpd = 300
        end
        currentSpeed = math.floor(fraction * maxSpd)
        SliderLabel.Text = string.format(L("SpeedLabel"), currentSpeed)
        TweenService
            :Create(SliderFillAuto, TweenInfo.new(0.05), { Size = UDim2.new(fraction, 0, 1, 0) })
            :Play()
    end
    SliderTrack.InputBegan:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            draggingSliderAuto = true
            updateSpeedAuto(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if
            draggingSliderAuto
            and (
                (input.UserInputType == Enum.UserInputType.MouseMovement)
                or (input.UserInputType == Enum.UserInputType.Touch)
            )
        then
            updateSpeedAuto(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if
            (input.UserInputType == Enum.UserInputType.MouseButton1)
            or (input.UserInputType == Enum.UserInputType.Touch)
        then
            draggingSliderAuto = false
        end
    end)
    local DistLabel = Instance.new("TextLabel")
    DistLabel.Parent = LeftPanel
    DistLabel.BackgroundTransparency = 1
    DistLabel.Position = UDim2.new(0, 0, 0, 230)
    DistLabel.Size = UDim2.new(1, 0, 0, 20)
    DistLabel.Font = Enum.Font.GothamSemibold
    DistLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    DistLabel.TextSize = 14
    DistLabel.TextXAlignment = Enum.TextXAlignment.Left
    DropdownBtn.Parent = LeftPanel
    DropdownBtn.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    DropdownBtn.BackgroundTransparency = 0.15
    DropdownBtn.Position = UDim2.new(0, 0, 0, 256)
    DropdownBtn.Size = UDim2.new(1, 0, 0, 46)
    DropdownBtn.Font = Enum.Font.GothamBold
    DropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownBtn.TextSize = 14
    DropdownBtn.TextXAlignment = Enum.TextXAlignment.Left
    DropdownBtn.ZIndex = 10
    Instance.new("UICorner", DropdownBtn).CornerRadius = UDim.new(0, 10)
    DropdownList.Parent = LeftPanel
    DropdownList.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
    DropdownList.BackgroundTransparency = 0.1
    DropdownList.Position = UDim2.new(0, 0, 0, 308)
    DropdownList.Size = UDim2.new(1, 0, 0, 120)
    DropdownList.Visible = false
    DropdownList.ZIndex = 50
    DropdownList.CanvasSize = UDim2.new(0, 0, 0, 0)
    DropdownList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    DropdownList.ScrollBarThickness = 4
    DropdownList.BorderSizePixel = 0
    Instance.new("UICorner", DropdownList).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", DropdownList).Color = Color3.fromRGB(45, 45, 60)
    local DropListLayout = Instance.new("UIListLayout")
    DropListLayout.Parent = DropdownList
    DropListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    DropListLayout.Padding = UDim.new(0, 5)
    local DropPadding = Instance.new("UIPadding")
    DropPadding.Parent = DropdownList
    DropPadding.PaddingTop = UDim.new(0, 6)
    DropPadding.PaddingLeft = UDim.new(0, 6)
    DropPadding.PaddingRight = UDim.new(0, 6)
    DropPadding.PaddingBottom = UDim.new(0, 6)
    DropdownBtn.MouseButton1Click:Connect(function()
        DropdownList.Visible = not DropdownList.Visible
    end)
    local LockFrame = Instance.new("Frame")
    LockFrame.Parent = AdminPage
    LockFrame.BackgroundTransparency = 1
    LockFrame.Position = UDim2.new(0, 20, 0, 20)
    LockFrame.Size = UDim2.new(1, -40, 0, 240)
    local LockTitle = Instance.new("TextLabel")
    LockTitle.Parent = LockFrame
    LockTitle.BackgroundTransparency = 1
    LockTitle.Size = UDim2.new(1, 0, 0, 34)
    LockTitle.Font = Enum.Font.GothamBold
    LockTitle.Text = "[!] RESTRICTED ACCESS"
    LockTitle.TextColor3 = Color3.fromRGB(255, 80, 80)
    LockTitle.TextSize = 18
    local KeyInput = Instance.new("TextBox")
    KeyInput.Parent = LockFrame
    KeyInput.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    KeyInput.BackgroundTransparency = 0.15
    KeyInput.Position = UDim2.new(0, 0, 0, 55)
    KeyInput.Size = UDim2.new(1, 0, 0, 50)
    KeyInput.Font = Enum.Font.GothamSemibold
    KeyInput.Text = ""
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.TextSize = 16
    KeyInput.ClearTextOnFocus = false
    Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 10)
    local UnlockBtn = Instance.new("TextButton")
    UnlockBtn.Parent = LockFrame
    UnlockBtn.BackgroundColor3 = accentColor
    UnlockBtn.Position = UDim2.new(0, 0, 0, 120)
    UnlockBtn.Size = UDim2.new(1, 0, 0, 48)
    UnlockBtn.Font = Enum.Font.GothamBold
    UnlockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    UnlockBtn.TextSize = 16
    Instance.new("UICorner", UnlockBtn).CornerRadius = UDim.new(0, 10)
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Parent = LockFrame
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0, 0, 0, 180)
    StatusLabel.Size = UDim2.new(1, 0, 0, 24)
    StatusLabel.Font = Enum.Font.GothamSemibold
    StatusLabel.Text = ""
    StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    StatusLabel.TextSize = 15
    local UnlockedAdmin = Instance.new("Frame")
    UnlockedAdmin.Parent = AdminPage
    UnlockedAdmin.BackgroundTransparency = 1
    UnlockedAdmin.Size = UDim2.new(1, 0, 1, 0)
    UnlockedAdmin.Visible = false
    local AdminTitleLabel = Instance.new("TextLabel")
    AdminTitleLabel.Parent = UnlockedAdmin
    AdminTitleLabel.BackgroundTransparency = 1
    AdminTitleLabel.Size = UDim2.new(1, 0, 0, 28)
    AdminTitleLabel.Font = Enum.Font.GothamBold
    AdminTitleLabel.TextColor3 = Color3.fromRGB(245, 158, 11)
    AdminTitleLabel.TextSize = 17
    local CheckPosToggleFrame = Instance.new("Frame")
    CheckPosToggleFrame.Parent = UnlockedAdmin
    CheckPosToggleFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    CheckPosToggleFrame.BackgroundTransparency = 0.15
    CheckPosToggleFrame.Position = UDim2.new(0, 0, 0, 38)
    CheckPosToggleFrame.Size = UDim2.new(0.96, 0, 0, 54)
    Instance.new("UICorner", CheckPosToggleFrame).CornerRadius = UDim.new(0, 10)
    local CheckPosToggleLabel = Instance.new("TextLabel")
    CheckPosToggleLabel.Parent = CheckPosToggleFrame
    CheckPosToggleLabel.BackgroundTransparency = 1
    CheckPosToggleLabel.Position = UDim2.new(0, 16, 0, 0)
    CheckPosToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    CheckPosToggleLabel.Font = Enum.Font.GothamBold
    CheckPosToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckPosToggleLabel.TextSize = 15
    CheckPosToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    local AdminSwitchBG = Instance.new("TextButton")
    AdminSwitchBG.Parent = CheckPosToggleFrame
    AdminSwitchBG.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    AdminSwitchBG.Position = UDim2.new(1, -65, 0.5, -14)
    AdminSwitchBG.Size = UDim2.new(0, 50, 0, 28)
    AdminSwitchBG.Text = ""
    Instance.new("UICorner", AdminSwitchBG).CornerRadius = UDim.new(0, 14)
    local AdminSwitchDot = Instance.new("Frame")
    AdminSwitchDot.Parent = AdminSwitchBG
    AdminSwitchDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    AdminSwitchDot.Position = UDim2.new(0, 3, 0.5, -11)
    AdminSwitchDot.Size = UDim2.new(0, 22, 0, 22)
    Instance.new("UICorner", AdminSwitchDot).CornerRadius = UDim.new(0, 11)
    local CheckModelToggleFrame = Instance.new("Frame")
    CheckModelToggleFrame.Parent = UnlockedAdmin
    CheckModelToggleFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    CheckModelToggleFrame.BackgroundTransparency = 0.15
    CheckModelToggleFrame.Position = UDim2.new(0, 0, 0, 98)
    CheckModelToggleFrame.Size = UDim2.new(0.96, 0, 0, 54)
    Instance.new("UICorner", CheckModelToggleFrame).CornerRadius = UDim.new(0, 10)
    local CheckModelToggleLabel = Instance.new("TextLabel")
    CheckModelToggleLabel.Parent = CheckModelToggleFrame
    CheckModelToggleLabel.BackgroundTransparency = 1
    CheckModelToggleLabel.Position = UDim2.new(0, 16, 0, 0)
    CheckModelToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    CheckModelToggleLabel.Font = Enum.Font.GothamBold
    CheckModelToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckModelToggleLabel.TextSize = 15
    CheckModelToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    local CheckModelSwitchBG = Instance.new("TextButton")
    CheckModelSwitchBG.Parent = CheckModelToggleFrame
    CheckModelSwitchBG.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    CheckModelSwitchBG.Position = UDim2.new(1, -65, 0.5, -14)
    CheckModelSwitchBG.Size = UDim2.new(0, 50, 0, 28)
    CheckModelSwitchBG.Text = ""
    Instance.new("UICorner", CheckModelSwitchBG).CornerRadius = UDim.new(0, 14)
    local CheckModelSwitchDot = Instance.new("Frame")
    CheckModelSwitchDot.Parent = CheckModelSwitchBG
    CheckModelSwitchDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CheckModelSwitchDot.Position = UDim2.new(0, 3, 0.5, -11)
    CheckModelSwitchDot.Size = UDim2.new(0, 22, 0, 22)
    Instance.new("UICorner", CheckModelSwitchDot).CornerRadius = UDim.new(0, 11)
    local PosContainer = Instance.new("Frame")
    PosContainer.Parent = UnlockedAdmin
    PosContainer.BackgroundTransparency = 1
    PosContainer.Position = UDim2.new(0, 0, 0, 158)
    PosContainer.Size = UDim2.new(0.96, 0, 1, -166)
    PosContainer.Visible = false
    local CheckPosBtn = Instance.new("TextButton")
    CheckPosBtn.Parent = PosContainer
    CheckPosBtn.BackgroundColor3 = accentColor
    CheckPosBtn.Size = UDim2.new(1, 0, 0, 44)
    CheckPosBtn.Font = Enum.Font.GothamBold
    CheckPosBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckPosBtn.TextSize = 15
    Instance.new("UICorner", CheckPosBtn).CornerRadius = UDim.new(0, 10)
    local PosListFrame = Instance.new("ScrollingFrame")
    PosListFrame.Parent = PosContainer
    PosListFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
    PosListFrame.BackgroundTransparency = 0.15
    PosListFrame.Position = UDim2.new(0, 0, 0, 52)
    PosListFrame.Size = UDim2.new(1, 0, 1, -104)
    PosListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    PosListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    PosListFrame.ScrollBarThickness = 4
    PosListFrame.BorderSizePixel = 0
    Instance.new("UICorner", PosListFrame).CornerRadius = UDim.new(0, 10)
    local PosListLayout = Instance.new("UIListLayout")
    PosListLayout.Parent = PosListFrame
    PosListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PosListLayout.Padding = UDim.new(0, 6)
    local PosListPadding = Instance.new("UIPadding")
    PosListPadding.Parent = PosListFrame
    PosListPadding.PaddingTop = UDim.new(0, 6)
    PosListPadding.PaddingLeft = UDim.new(0, 6)
    local CopyBtn = Instance.new("TextButton")
    CopyBtn.Parent = PosContainer
    CopyBtn.BackgroundColor3 = Color3.fromRGB(16, 16, 23)
    CopyBtn.Position = UDim2.new(0, 0, 1, -44)
    CopyBtn.Size = UDim2.new(1, 0, 0, 44)
    CopyBtn.Font = Enum.Font.GothamBold
    CopyBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
    CopyBtn.TextSize = 14
    Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 10)
    UnlockBtn.MouseButton1Click:Connect(function()
        if KeyInput.Text == "Panelka" then
            StatusLabel.Text = L("SuccessKey")
            StatusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
            task.wait(0.5)
            LockFrame.Visible = false
            UnlockedAdmin.Visible = true
        else
            StatusLabel.Text = L("WrongKey")
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            KeyInput.Text = ""
        end
    end)
    AdminSwitchBG.MouseButton1Click:Connect(function()
        checkPositionEnabled = not checkPositionEnabled
        if checkPositionEnabled then
            TweenService:Create(
                AdminSwitchBG,
                TweenInfo.new(0.2),
                { BackgroundColor3 = Color3.fromRGB(34, 197, 94) }
            ):Play()
            TweenService
                :Create(
                    AdminSwitchDot,
                    TweenInfo.new(0.2),
                    { Position = UDim2.new(0, 25, 0.5, -11) }
                )
                :Play()
            PosContainer.Visible = true
        else
            TweenService:Create(
                AdminSwitchBG,
                TweenInfo.new(0.2),
                { BackgroundColor3 = Color3.fromRGB(40, 40, 55) }
            ):Play()
            TweenService
                :Create(
                    AdminSwitchDot,
                    TweenInfo.new(0.2),
                    { Position = UDim2.new(0, 3, 0.5, -11) }
                )
                :Play()
            PosContainer.Visible = false
        end
    end)
    CheckModelSwitchBG.MouseButton1Click:Connect(function()
        checkModelEnabled = not checkModelEnabled
        if checkModelEnabled then
            TweenService:Create(
                CheckModelSwitchBG,
                TweenInfo.new(0.2),
                { BackgroundColor3 = Color3.fromRGB(34, 197, 94) }
            ):Play()
            TweenService:Create(
                CheckModelSwitchDot,
                TweenInfo.new(0.2),
                { Position = UDim2.new(0, 25, 0.5, -11) }
            ):Play()
            if not checkModelConnection then
                checkModelConnection = mouse.Button1Down:Connect(function()
                    if checkModelEnabled and mouse.Target then
                        local target = mouse.Target
                        local model = target:FindFirstAncestorOfClass("Model")
                        local nameToShow = ""
                        if model then
                            nameToShow = "Модель: "
                                .. model.Name
                                .. " | Деталь: "
                                .. target.Name
                        else
                            nameToShow = "Деталь: " .. target.Name
                        end
                        game:GetService("StarterGui"):SetCore(
                            "SendNotification",
                            { Title = "Check Model", Text = nameToShow, Duration = 3 }
                        )
                    end
                end)
            end
        else
            TweenService:Create(
                CheckModelSwitchBG,
                TweenInfo.new(0.2),
                { BackgroundColor3 = Color3.fromRGB(40, 40, 55) }
            ):Play()
            TweenService:Create(
                CheckModelSwitchDot,
                TweenInfo.new(0.2),
                { Position = UDim2.new(0, 3, 0.5, -11) }
            ):Play()
            if checkModelConnection then
                checkModelConnection:Disconnect()
                checkModelConnection = nil
            end
        end
    end)
    local function render3DWaypoints(pos, index)
        if visualParts[index] then
            visualParts[index]:Destroy()
        end
        local part = Instance.new("Part")
        part.Name = "Kitagawa_WayPoint_" .. index
        part.Position = pos
        part.Size = Vector3.new(2, 2, 2)
        part.Shape = Enum.PartType.Ball
        part.Material = Enum.Material.Neon
        part.Color = accentColor
        part.Anchored = true
        part.CanCollide = false
        part.Parent = workspace
        local highlight = Instance.new("Highlight")
        highlight.Parent = part
        highlight.FillColor = accentColor
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.4
        local bbg = Instance.new("BillboardGui")
        bbg.Parent = part
        bbg.Size = UDim2.new(0, 150, 0, 40)
        bbg.AlwaysOnTop = true
        bbg.StudsOffset = Vector3.new(0, 3, 0)
        local label = Instance.new("TextLabel")
        label.Parent = bbg
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.Text = L("PointPrefix")
            .. " #"
            .. index
            .. "\n"
            .. string.format("%.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z)
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextStrokeTransparency = 0
        label.TextSize = 11
        visualParts[index] = part
    end
    local function refreshPositionUI()
        for _, child in pairs(PosListFrame:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        for _, part in pairs(visualParts) do
            if part then
                part:Destroy()
            end
        end
        visualParts = {}
        for i, posStr in ipairs(savedPositions) do
            local coords = string.split(posStr, ", ")
            local x, y, z = tonumber(coords[1]), tonumber(coords[2]), tonumber(coords[3])
            if x and y and z then
                render3DWaypoints(Vector3.new(x, y, z), i)
            end
            local Item = Instance.new("Frame")
            Item.Parent = PosListFrame
            Item.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
            Item.BackgroundTransparency = 0.15
            Item.Size = UDim2.new(1, -6, 0, 36)
            Instance.new("UICorner", Item).CornerRadius = UDim.new(0, 8)
            local ItemText = Instance.new("TextLabel")
            ItemText.Parent = Item
            ItemText.BackgroundTransparency = 1
            ItemText.Position = UDim2.new(0, 12, 0, 0)
            ItemText.Size = UDim2.new(1, -45, 1, 0)
            ItemText.Font = Enum.Font.GothamBold
            ItemText.Text = "#" .. i .. "  ->  " .. posStr
            ItemText.TextColor3 = Color3.fromRGB(200, 200, 220)
            ItemText.TextSize = 12
            ItemText.TextXAlignment = Enum.TextXAlignment.Left
            local DelBtn = Instance.new("TextButton")
            DelBtn.Parent = Item
            DelBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
            DelBtn.Position = UDim2.new(1, -30, 0.5, -12)
            DelBtn.Size = UDim2.new(0, 24, 0, 24)
            DelBtn.Font = Enum.Font.GothamBold
            DelBtn.Text = "X"
            DelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            DelBtn.TextSize = 15
            Instance.new("UICorner", DelBtn).CornerRadius = UDim.new(0, 6)
            DelBtn.MouseButton1Click:Connect(function()
                table.remove(savedPositions, i)
                refreshPositionUI()
            end)
        end
        task.spawn(function()
            task.wait(0.05)
            PosListFrame.CanvasSize = UDim2.new(0, 0, 0, PosListLayout.AbsoluteContentSize.Y + 12)
        end)
    end
    CheckPosBtn.MouseButton1Click:Connect(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local pos = char.HumanoidRootPart.Position
            table.insert(savedPositions, string.format("%.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z))
            refreshPositionUI()
        end
    end)
    CopyBtn.MouseButton1Click:Connect(function()
        if #savedPositions > 0 then
            local copyStr = table.concat(savedPositions, "\n")
            if setclipboard then
                setclipboard(copyStr)
            end
            CopyBtn.Text = L("Copied")
            task.delay(1.5, function()
                CopyBtn.Text = L("CopyPosBtn")
            end)
        else
            CopyBtn.Text = L("EmptyList")
            task.delay(1.5, function()
                CopyBtn.Text = L("CopyPosBtn")
            end)
        end
    end)
    _G.UpdateColors = function(col)
        accentColor = col
        SliderFillAuto.BackgroundColor3 = col
        FlySpeedFill.BackgroundColor3 = col
        CheckPosBtn.BackgroundColor3 = col
        UnlockBtn.BackgroundColor3 = col
        refreshPositionUI()
    end
    _G.ApplyLanguage = function()
        ThemeTitle.Text = L("ThemeTitle")
        WorldLabel.Text = string.format(L("WorldLabel"), currentWorld)
        autoFarmTabBtn.Text = L("AutoFarmTab")
        themeTabBtn.Text = L("ThemeTab")
        movementTabBtn.Text = L("MovementTab")
        adminTabBtn.Text = L("AdminTab")
        ToggleLabel.Text = L("AutoFarmToggle")
        SliderLabel.Text = string.format(L("SpeedLabel"), currentSpeed)
        FlySpeedLabelUI.Text = string.format(L("FlySpeedLabel"), flySpeed)
        DistLabel.Text = L("DistLabel")
        CheckPosBtn.Text = L("SavePosBtn")
        CopyBtn.Text = L("CopyPosBtn")
        AdminTitleLabel.Text = L("AdminTitle")
        KeyInput.PlaceholderText = L("EnterKey")
        UnlockBtn.Text = L("UnlockBtn")
        CheckPosToggleLabel.Text = L("CheckPosToggle")
        CheckModelToggleLabel.Text = L("CheckModelToggle")
        InfJumpLabel.Text = L("InfJumpToggle")
        FlyLabel.Text = L("FlyToggle")
        for i, rowText in ipairs(ThemeRows) do
            if L("Themes")[i] then
                rowText.Text = L("Themes")[i]
            end
        end
        buildDistanceOptions()
    end
    buildDistanceOptions()
    task.spawn(function()
        local HEARTBEAT_URL = "http://62.233.43.59:8787/api/heartbeat"
        local HEARTBEAT_KEY = "db5cbd688fcc72b4221dd2e8f892cf1dccefd52c47bcdc4e"
        local INTERVAL = 45
        local function doRequest(body)
            local headers = { ["Content-Type"] = "application/json", ["X-Api-Key"] = HEARTBEAT_KEY }
            if syn and (type(syn.request) == "function") then
                return syn.request({ Url = HEARTBEAT_URL, Method = "POST", Headers = headers, Body = body })
            end
            if type(request) == "function" then
                return request({ Url = HEARTBEAT_URL, Method = "POST", Headers = headers, Body = body })
            end
            if http and (type(http.request) == "function") then
                return http.request({ Url = HEARTBEAT_URL, Method = "POST", Headers = headers, Body = body })
            end
            if type(http_request) == "function" then
                return http_request(HEARTBEAT_URL, "POST", headers, body)
            end
            local HttpService = game:GetService("HttpService")
            local ok, res = pcall(function()
                return HttpService:RequestAsync({
                    Url = HEARTBEAT_URL,
                    Method = "POST",
                    Headers = headers,
                    Body = body,
                })
            end)
            if ok then
                return res
            end
            return nil
        end
        local function sendHeartbeat()
            if not LocalPlayer then
                return false
            end
            local farm = (getgenv() and getgenv().SpeedKeyboardFarmState) or {}
            local body = string.format(
                '{"userId":"%s","script":"speedkeyboard","autoFarm":%s,"autoFarmActive":%s}',
                tostring(LocalPlayer.UserId),
                (farm.enabled and "true") or "false",
                (farm.active and "true") or "false"
            )
            local res = doRequest(body)
            if not res then
                return false
            end
            local code = res.StatusCode or res.status or (res.Success and 200)
            return code == 200
        end
        task.wait(8)
        while not (getgenv() and getgenv().SpeedKeyboardHeartbeatStop) do
            if not (getgenv() and getgenv().SpeedKeyboardRunning) then
                break
            end
            local ok = sendHeartbeat()
            if not ok then
                warn("[+1 Speed Keyboard] Heartbeat failed (no executor HTTP?)")
            end
            for _ = 1, INTERVAL do
                if getgenv() and getgenv().SpeedKeyboardHeartbeatStop then
                    break
                end
                task.wait(1)
            end
        end
    end)
    print("[+1 Speed Keyboard] Loaded | Online tracker active")
end
