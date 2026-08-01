-- ts file was generated at discord.gg/25ms

do
    local Players = game:GetService('Players')
    local RunService = game:GetService('RunService')
    local UserInputService = game:GetService('UserInputService')
    local TweenService = game:GetService('TweenService')
    local HttpService = game:GetService('HttpService')
    local CoreGui = game:GetService('CoreGui')
    local LP = Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local rgb = Color3.fromRGB
    local WHITE = rgb(255, 255, 255)

    local function safe(fn, ...)
        local ok, r = pcall(fn, ...)

        if ok then
            return r
        end
    end

    local _writefile = ((typeof(writefile) == 'function') and writefile) or function() end
    local _readfile = ((typeof(readfile) == 'function') and readfile) or function()
        return nil
    end
    local _isfile = ((typeof(isfile) == 'function') and isfile) or function()
        return false
    end
    local _makefolder = ((typeof(makefolder) == 'function') and makefolder) or function() end
    local _isfolder = ((typeof(isfolder) == 'function') and isfolder) or function()
        return false
    end
    local _setclipboard = setclipboard or toclipboard or (syn and syn.write_clipboard) or function() end
    local _mouse1press = ((typeof(mouse1press) == 'function') and mouse1press) or function() end
    local _mouse1release = ((typeof(mouse1release) == 'function') and mouse1release) or function() end
    local FOLDER = 'VanezyUniversal'
    local CFG_PATH = FOLDER .. '/config.json'

    local function ensureFolder()
        if not _isfolder(FOLDER) then
            safe(_makefolder, FOLDER)
        end
    end

    local AimbotSettings = {
        AimbotEnabled = true,
        FOV = 150,
        Smoothness = 0.5,
        WallhackEnabled = true,
        TargetPart = 'Head',
        VisibleCheck = true,
        ShowFOV = true,
        TriggerBotEnabled = false,
        TriggerBotDelay = 0.05,
    }
    local MapSettings = {
        Enabled = false,
        Size = 160,
        WorldRadius = 200,
    }
    local mapPosX, mapPosY = 0, 0
    local mapMoveMode = false
    local FriendList = {}
    local TargetParts = {
        'Head',
        'Torso',
    }
    local TargetIndex = 1
    local raycastParams = RaycastParams.new()

    raycastParams.FilterType = Enum.RaycastFilterType.Exclude

    local cfg = {
        win_w = 480,
        win_h = 300,
    }
    local defaults = {}

    for k, v in pairs(cfg)do
        defaults[k] = v
    end

    local PRESETS = {
        red = {
            name = 'Red',
            c = rgb(235, 60, 60),
        },
        blue = {
            name = 'Blue',
            c = rgb(60, 130, 255),
        },
        green = {
            name = 'Green',
            c = rgb(60, 210, 110),
        },
        purple = {
            name = 'Purple',
            c = rgb(160, 80, 255),
        },
        yellow = {
            name = 'Yellow',
            c = rgb(255, 200, 50),
        },
        pink = {
            name = 'Pink',
            c = rgb(255, 80, 180),
        },
        cyan = {
            name = 'Cyan',
            c = rgb(50, 220, 220),
        },
        orange = {
            name = 'Orange',
            c = rgb(255, 130, 40),
        },
    }
    local theme = {
        key = 'red',
        primary = PRESETS.red.c,
        dark = rgb(14, 14, 18),
        header = rgb(9, 9, 13),
        card = rgb(20, 20, 26),
    }
    local themeUpdaters = {}

    local function onTheme(fn)
        themeUpdaters[#themeUpdaters + 1] = fn

        fn(theme.primary)
    end
    local function applyTheme()
        for _, fn in ipairs(themeUpdaters)do
            safe(fn, theme.primary)
        end
    end
    local function saveConfig()
        ensureFolder()

        local data = {
            color = theme.key,
        }

        for k, v in pairs(cfg)do
            data[k] = v
        end

        safe(function()
            _writefile(CFG_PATH, HttpService:JSONEncode(data))
        end)
    end
    local function loadConfig()
        if not _isfile(CFG_PATH) then
            return
        end

        local ok, data = pcall(function()
            return HttpService:JSONDecode(_readfile(CFG_PATH))
        end)

        if (not ok or (type(data) ~= 'table')) then
            return
        end
        if (data.color and PRESETS[data.color]) then
            theme.key = data.color
            theme.primary = PRESETS[data.color].c
        end

        for k, v in pairs(data)do
            if (cfg[k] ~= nil) then
                cfg[k] = v
            end
        end
    end

    loadConfig()

    local function tw(obj, time, props, style, dir)
        local info = TweenInfo.new(time, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out)
        local t = TweenService:Create(obj, info, props)

        t:Play()

        return t
    end
    local function twBack(obj, time, props)
        return tw(obj, time, props, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end
    local function twElastic(obj, time, props)
        return tw(obj, time, props, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
    end
    local function twBounce(obj, time, props)
        return tw(obj, time, props, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
    end
    local function corner(obj, r)
        local c = Instance.new('UICorner')

        c.CornerRadius = UDim.new(0, r or 8)
        c.Parent = obj

        return c
    end
    local function stroke(obj, color, thick, trans)
        local s = Instance.new('UIStroke')

        s.Color = color or rgb(45, 45, 55)
        s.Thickness = thick or 1
        s.Transparency = trans or 0
        s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        s.Parent = obj

        return s
    end
    local function padding(obj, l, r, t, b)
        local p = Instance.new('UIPadding')

        p.PaddingLeft = UDim.new(0, l or 0)
        p.PaddingRight = UDim.new(0, r or 0)
        p.PaddingTop = UDim.new(0, t or 0)
        p.PaddingBottom = UDim.new(0, b or 0)
        p.Parent = obj

        return p
    end

    local connections = {}

    local function conn(c)
        connections[#connections + 1] = c

        return c
    end

    local existing = CoreGui:FindFirstChild('VanezyUniversal')

    if existing then
        existing:Destroy()
    end

    local SG = Instance.new('ScreenGui')

    SG.Name = 'VanezyUniversal'
    SG.ResetOnSpawn = false
    SG.IgnoreGuiInset = true
    SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    SG.DisplayOrder = 9999

    local protect = (syn and syn.protect_gui) or protect_gui

    if protect then
        pcall(protect, SG)
    end
    if not pcall(function()
        SG.Parent = (gethui and gethui()) or CoreGui
    end) then
        SG.Parent = LP:WaitForChild('PlayerGui')
    end

    local W, H = cfg.win_w or 480, cfg.win_h or 300
    local NAV_OPEN, NAV_CLOSED = 96, 44
    local HEADER_H = 40
    local VMARK = '\u{2039}V\u{203a}'
    local applyWindowSize, enterResize
    local resizeActive = false
    local orbBusy = false
    local winPosX, winPosY = 0, 0
    local shadow = Instance.new('Frame')

    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Position = UDim2.new(0.5, 0, 0.5, 6)
    shadow.Size = UDim2.new(0, W + 32, 0, H + 32)
    shadow.BackgroundColor3 = rgb(0, 0, 0)
    shadow.BackgroundTransparency = 0.72
    shadow.BorderSizePixel = 0
    shadow.ZIndex = 1
    shadow.Parent = SG

    corner(shadow, 18)

    local win = Instance.new('Frame')

    win.Name = 'Window'
    win.AnchorPoint = Vector2.new(0.5, 0.5)
    win.Position = UDim2.new(0.5, 0, 0.5, 0)
    win.Size = UDim2.new(0, W, 0, H)
    win.BackgroundColor3 = theme.dark
    win.BackgroundTransparency = 0.04
    win.BorderSizePixel = 0
    win.ClipsDescendants = true
    win.ZIndex = 2
    win.Parent = SG

    corner(win, 14)

    local innerGrad = Instance.new('Frame')

    innerGrad.Size = UDim2.new(1, 0, 0.45, 0)
    innerGrad.BackgroundColor3 = WHITE
    innerGrad.BackgroundTransparency = 0.97
    innerGrad.BorderSizePixel = 0
    innerGrad.ZIndex = 2
    innerGrad.Parent = win

    corner(innerGrad, 14)

    local ig = Instance.new('UIGradient')

    ig.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, WHITE),
        ColorSequenceKeypoint.new(1, rgb(14, 14, 18)),
    })
    ig.Rotation = 90
    ig.Parent = innerGrad

    local winStroke = stroke(win, WHITE, 1.8, 0.1)
    local borderGrad = Instance.new('UIGradient')

    borderGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, rgb(30, 30, 40)),
        ColorSequenceKeypoint.new(0.5, rgb(70, 70, 88)),
        ColorSequenceKeypoint.new(1, rgb(30, 30, 40)),
    })
    borderGrad.Parent = winStroke

    onTheme(function(p)
        borderGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, p:Lerp(rgb(0, 0, 0), 0.7)),
            ColorSequenceKeypoint.new(0.5, p:Lerp(rgb(255, 255, 255), 0.15)),
            ColorSequenceKeypoint.new(1, p:Lerp(rgb(0, 0, 0), 0.7)),
        })
    end)

    local wave = Instance.new('Frame')

    wave.Name = 'Wave'
    wave.Size = UDim2.new(1, 0, 1, 0)
    wave.BackgroundColor3 = WHITE
    wave.BackgroundTransparency = 0.56
    wave.BorderSizePixel = 0
    wave.ZIndex = 2
    wave.Parent = win

    corner(wave, 14)

    local waveGrad = Instance.new('UIGradient')

    waveGrad.Parent = wave
    waveGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, rgb(22, 22, 30)),
        ColorSequenceKeypoint.new(0.5, rgb(38, 38, 50)),
        ColorSequenceKeypoint.new(1, rgb(22, 22, 30)),
    })

    local header = Instance.new('Frame')

    header.Size = UDim2.new(1, 0, 0, HEADER_H)
    header.BackgroundColor3 = theme.header
    header.BackgroundTransparency = 0.08
    header.BorderSizePixel = 0
    header.ZIndex = 4
    header.Parent = win

    corner(header, 14)

    local headerFix = Instance.new('Frame')

    headerFix.Size = UDim2.new(1, 0, 0, 14)
    headerFix.Position = UDim2.new(0, 0, 1, -14)
    headerFix.BackgroundColor3 = theme.header
    headerFix.BackgroundTransparency = 0.08
    headerFix.BorderSizePixel = 0
    headerFix.ZIndex = 4
    headerFix.Parent = header

    local headerLine = Instance.new('Frame')

    headerLine.AnchorPoint = Vector2.new(0, 1)
    headerLine.Position = UDim2.new(0, 0, 1, 0)
    headerLine.Size = UDim2.new(1, 0, 0, 1)
    headerLine.BackgroundColor3 = WHITE
    headerLine.BackgroundTransparency = 0.82
    headerLine.BorderSizePixel = 0
    headerLine.ZIndex = 5
    headerLine.Parent = header

    local hlg = Instance.new('UIGradient')

    hlg.Parent = headerLine

    onTheme(function(p)
        hlg.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, rgb(0, 0, 0)),
            ColorSequenceKeypoint.new(0.3, p),
            ColorSequenceKeypoint.new(0.7, p),
            ColorSequenceKeypoint.new(1, rgb(0, 0, 0)),
        })
    end)

    local title = Instance.new('TextLabel')

    title.AnchorPoint = Vector2.new(0.5, 0)
    title.Position = UDim2.new(0.5, 0, 0, 5)
    title.Size = UDim2.new(0, 180, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = 'Universal'
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 18
    title.TextColor3 = WHITE
    title.ZIndex = 5
    title.Parent = header

    local titleGrad = Instance.new('UIGradient')

    titleGrad.Parent = title

    onTheme(function(p)
        titleGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, p),
            ColorSequenceKeypoint.new(0.5, WHITE),
            ColorSequenceKeypoint.new(1, p),
        })
    end)

    local subtitle = Instance.new('TextLabel')

    subtitle.AnchorPoint = Vector2.new(0.5, 0)
    subtitle.Position = UDim2.new(0.5, 0, 0, 24)
    subtitle.Size = UDim2.new(0, 180, 0, 13)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = 'by Vanezy Scripts'
    subtitle.Font = Enum.Font.GothamMedium
    subtitle.TextSize = 10
    subtitle.TextColor3 = rgb(100, 100, 115)
    subtitle.ZIndex = 5
    subtitle.Parent = header

    local vmark = Instance.new('TextLabel')

    vmark.Position = UDim2.new(0, 14, 0, 0)
    vmark.Size = UDim2.new(0, 44, 1, 0)
    vmark.BackgroundTransparency = 1
    vmark.Text = VMARK
    vmark.Font = Enum.Font.GothamBold
    vmark.TextSize = 16
    vmark.TextColor3 = WHITE
    vmark.TextXAlignment = Enum.TextXAlignment.Left
    vmark.ZIndex = 5
    vmark.Parent = header

    local vmarkGrad = Instance.new('UIGradient')

    vmarkGrad.Parent = vmark

    onTheme(function(p)
        vmarkGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, p),
            ColorSequenceKeypoint.new(1, WHITE),
        })
    end)

    local function makeWindowDrag(handle)
        local dragging, startMouse, startX, startY = false, nil, 0, 0

        handle.InputBegan:Connect(function(i)
            if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
                if resizeActive then
                    return
                end

                dragging = true
                startMouse = UserInputService:GetMouseLocation()
                startX, startY = winPosX, winPosY

                tw(win, 0.12, {BackgroundTransparency = 0})
            end
        end)
        conn(UserInputService.InputChanged:Connect(function(i)
            if (dragging and ((i.UserInputType == Enum.UserInputType.MouseMovement) or (i.UserInputType == Enum.UserInputType.Touch))) then
                local d = UserInputService:GetMouseLocation() - startMouse

                winPosX = startX + d.X
                winPosY = startY + d.Y
                win.Position = UDim2.new(0.5, winPosX, 0.5, winPosY)
                shadow.Position = UDim2.new(0.5, winPosX, 0.5, winPosY + 6)
            end
        end))
        conn(UserInputService.InputEnded:Connect(function(i)
            if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
                dragging = false

                tw(win, 0.25, {BackgroundTransparency = 0.04})
            end
        end))
    end

    makeWindowDrag(header)

    local function headerBtn(xOff, sym, sz, tsz)
        local b = Instance.new('TextButton')

        b.Size = UDim2.new(0, sz, 0, sz)
        b.Position = UDim2.new(1, xOff, 0.5, -sz / 2)
        b.BackgroundColor3 = rgb(35, 35, 44)
        b.BackgroundTransparency = 0.3
        b.AutoButtonColor = false
        b.Text = sym
        b.TextColor3 = rgb(160, 160, 175)
        b.Font = Enum.Font.GothamBold
        b.TextSize = tsz or 16
        b.ZIndex = 6
        b.Parent = header

        corner(b, sz / 2)
        stroke(b, WHITE, 1, 0.88)
        b.MouseEnter:Connect(function()
            tw(b, 0.18, {
                BackgroundTransparency = 0,
                TextColor3 = WHITE,
            })
            twBack(b, 0.2, {
                Size = UDim2.new(0, sz + 2, 0, sz + 2),
                Position = UDim2.new(1, xOff - 1, 0.5, -(sz + 2) / 2),
            })
        end)
        b.MouseLeave:Connect(function()
            tw(b, 0.22, {
                BackgroundTransparency = 0.3,
                TextColor3 = rgb(160, 160, 175),
            })
            tw(b, 0.22, {
                Size = UDim2.new(0, sz, 0, sz),
                Position = UDim2.new(1, xOff, 0.5, -sz / 2),
            })
        end)
        b.MouseButton1Down:Connect(function()
            tw(b, 0.07, {
                Size = UDim2.new(0, sz - 5, 0, sz - 5),
                Position = UDim2.new(1, xOff + 2.5, 0.5, -(sz - 5) / 2),
            }, Enum.EasingStyle.Quad)
        end)
        b.MouseButton1Up:Connect(function()
            twBack(b, 0.22, {
                Size = UDim2.new(0, sz, 0, sz),
                Position = UDim2.new(1, xOff, 0.5, -sz / 2),
            })
        end)

        return b
    end

    local closeBtn = headerBtn(-38, '\u{d7}', 30, 26)
    local minBtn = headerBtn(-74, '\u{2013}', 28, 22)
    local gearBtn = headerBtn(-106, '\u{2699}', 26, 15)

    onTheme(function(p)
        closeBtn.MouseEnter:Connect(function()
            tw(closeBtn, 0.18, {
                BackgroundColor3 = rgb(200, 50, 50),
                TextColor3 = WHITE,
                BackgroundTransparency = 0,
            })
        end)
    end)

    local body = Instance.new('Frame')

    body.Position = UDim2.new(0, 0, 0, HEADER_H)
    body.Size = UDim2.new(1, 0, 1, -HEADER_H)
    body.BackgroundTransparency = 1
    body.ZIndex = 3
    body.Parent = win

    local grip = Instance.new('TextButton')

    grip.AnchorPoint = Vector2.new(0.5, 1)
    grip.Position = UDim2.new(0.5, 0, 1, -5)
    grip.Size = UDim2.new(0, 52, 0, 5)
    grip.BackgroundColor3 = WHITE
    grip.BackgroundTransparency = 0.78
    grip.Text = ''
    grip.AutoButtonColor = false
    grip.ZIndex = 7
    grip.Parent = win

    corner(grip, 3)

    local function makeGripDrag(handle, onPress, onRelease)
        local dragging, startMouse, startX, startY = false, nil, 0, 0

        handle.InputBegan:Connect(function(i)
            if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
                if resizeActive then
                    return
                end

                dragging = true
                startMouse = UserInputService:GetMouseLocation()
                startX, startY = winPosX, winPosY

                if onPress then
                    onPress()
                end
            end
        end)
        conn(UserInputService.InputChanged:Connect(function(i)
            if (dragging and ((i.UserInputType == Enum.UserInputType.MouseMovement) or (i.UserInputType == Enum.UserInputType.Touch))) then
                local d = UserInputService:GetMouseLocation() - startMouse

                winPosX = startX + d.X
                winPosY = startY + d.Y
                win.Position = UDim2.new(0.5, winPosX, 0.5, winPosY)
                shadow.Position = UDim2.new(0.5, winPosX, 0.5, winPosY + 6)
            end
        end))
        conn(UserInputService.InputEnded:Connect(function(i)
            if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
                if (dragging and onRelease) then
                    onRelease()
                end

                dragging = false
            end
        end))
    end

    grip.MouseEnter:Connect(function()
        tw(grip, 0.18, {
            BackgroundTransparency = 0.5,
            Size = UDim2.new(0, 62, 0, 6),
        })
    end)
    grip.MouseLeave:Connect(function()
        tw(grip, 0.22, {
            BackgroundTransparency = 0.78,
            Size = UDim2.new(0, 52, 0, 5),
        })
    end)
    makeGripDrag(grip, function()
        tw(grip, 0.1, {
            BackgroundTransparency = 0.2,
            Size = UDim2.new(0, 70, 0, 7),
        })
    end, function()
        tw(grip, 0.28, {
            BackgroundTransparency = 0.78,
            Size = UDim2.new(0, 52, 0, 5),
        })
    end)

    local nav = Instance.new('Frame')

    nav.Size = UDim2.new(0, NAV_OPEN, 1, 0)
    nav.BackgroundColor3 = theme.header
    nav.BackgroundTransparency = 0.28
    nav.BorderSizePixel = 0
    nav.ClipsDescendants = true
    nav.ZIndex = 3
    nav.Parent = body

    local navBorder = Instance.new('Frame')

    navBorder.AnchorPoint = Vector2.new(1, 0)
    navBorder.Position = UDim2.new(1, 0, 0, 0)
    navBorder.Size = UDim2.new(0, 1, 1, 0)
    navBorder.BackgroundColor3 = WHITE
    navBorder.BackgroundTransparency = 0.88
    navBorder.BorderSizePixel = 0
    navBorder.ZIndex = 4
    navBorder.Parent = nav

    local navList = Instance.new('Frame')

    navList.Size = UDim2.new(1, 0, 1, -38)
    navList.BackgroundTransparency = 1
    navList.ZIndex = 3
    navList.Parent = nav

    local navLayout = Instance.new('UIListLayout')

    navLayout.Padding = UDim.new(0, 3)
    navLayout.SortOrder = Enum.SortOrder.LayoutOrder
    navLayout.Parent = navList

    padding(navList, 5, 5, 10, 0)

    local content = Instance.new('Frame')

    content.Position = UDim2.new(0, NAV_OPEN, 0, 0)
    content.Size = UDim2.new(1, -NAV_OPEN, 1, 0)
    content.BackgroundTransparency = 1
    content.ClipsDescendants = true
    content.ZIndex = 3
    content.Parent = body

    padding(content, 14, 14, 12, 12)

    local sections = {}
    local currentSection = 'Home'
    local settingsOpen = false

    local function makeSeparator(parent, order)
        local line = Instance.new('Frame')

        line.Size = UDim2.new(1, 0, 0, 1)
        line.BackgroundColor3 = WHITE
        line.BackgroundTransparency = 0.88
        line.BorderSizePixel = 0
        line.LayoutOrder = order or 0
        line.ZIndex = 3
        line.Parent = parent

        corner(line, 1)

        local g = Instance.new('UIGradient')

        g.Parent = line

        onTheme(function(p)
            g.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, rgb(0, 0, 0)),
                ColorSequenceKeypoint.new(0.3, p),
                ColorSequenceKeypoint.new(0.7, p),
                ColorSequenceKeypoint.new(1, rgb(0, 0, 0)),
            })
        end)

        return line
    end
    local function makeHeading(parent, text, order)
        local lbl = Instance.new('TextLabel')

        lbl.Size = UDim2.new(1, 0, 0, 22)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.Font = Enum.Font.GothamBlack
        lbl.TextSize = 14
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.LayoutOrder = order or 0
        lbl.ZIndex = 3
        lbl.Parent = parent

        onTheme(function(p)
            lbl.TextColor3 = p
        end)

        return lbl
    end
    local function makeRow(parent, order, height)
        local f = Instance.new('Frame')

        f.Size = UDim2.new(1, 0, 0, height or 36)
        f.BackgroundColor3 = theme.card
        f.BackgroundTransparency = 0.28
        f.BorderSizePixel = 0
        f.LayoutOrder = order or 0
        f.ZIndex = 3
        f.Parent = parent

        corner(f, 9)
        stroke(f, WHITE, 1, 0.92)

        return f
    end
    local function makeToggle(parent, name, key, settingsTable, order, callback)
        local f = makeRow(parent, order, 38)
        local lbl = Instance.new('TextLabel')

        lbl.Size = UDim2.new(1, -70, 1, 0)
        lbl.Position = UDim2.new(0, 14, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = name
        lbl.Font = Enum.Font.GothamMedium
        lbl.TextSize = 13
        lbl.TextColor3 = rgb(215, 215, 228)
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.ZIndex = 4
        lbl.Parent = f

        local track = Instance.new('TextButton')

        track.AnchorPoint = Vector2.new(1, 0.5)
        track.Position = UDim2.new(1, -14, 0.5, 0)
        track.Size = UDim2.new(0, 44, 0, 22)
        track.AutoButtonColor = false
        track.Text = ''
        track.BackgroundColor3 = rgb(42, 42, 52)
        track.ZIndex = 4
        track.Parent = f

        corner(track, 11)
        stroke(track, WHITE, 1, 0.88)

        local knob = Instance.new('Frame')

        knob.Size = UDim2.new(0, 16, 0, 16)
        knob.Position = UDim2.new(0, 3, 0.5, -8)
        knob.BackgroundColor3 = rgb(130, 130, 148)
        knob.BorderSizePixel = 0
        knob.ZIndex = 5
        knob.Parent = track

        corner(knob, 8)

        local knobGlow = Instance.new('Frame')

        knobGlow.AnchorPoint = Vector2.new(0.5, 0.5)
        knobGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
        knobGlow.Size = UDim2.new(1.6, 0, 1.6, 0)
        knobGlow.BackgroundColor3 = WHITE
        knobGlow.BackgroundTransparency = 1
        knobGlow.BorderSizePixel = 0
        knobGlow.ZIndex = 4
        knobGlow.Parent = knob

        corner(knobGlow, 14)

        local function visual(animate)
            local dur = (animate and 0.3) or 0

            if settingsTable[key] then
                onTheme(function(p)
                    tw(track, dur, {BackgroundColor3 = p})
                    tw(knob, dur, {BackgroundColor3 = WHITE}, Enum.EasingStyle.Back)
                    tw(knobGlow, dur, {
                        BackgroundTransparency = 0.78,
                        BackgroundColor3 = p,
                    })
                end)
                twBack(knob, ((dur > 0) and dur) or 0.01, {
                    Position = UDim2.new(1, -19, 0.5, -8),
                })
            else
                tw(track, dur, {
                    BackgroundColor3 = rgb(42, 42, 52),
                })
                tw(knob, dur, {
                    BackgroundColor3 = rgb(130, 130, 148),
                }, Enum.EasingStyle.Back)
                tw(knobGlow, dur, {BackgroundTransparency = 1})
                twBack(knob, ((dur > 0) and dur) or 0.01, {
                    Position = UDim2.new(0, 3, 0.5, -8),
                })
            end
        end

        visual(false)
        track.MouseButton1Click:Connect(function()
            settingsTable[key] = not settingsTable[key]

            visual(true)

            if callback then
                callback(settingsTable[key])
            end
        end)
        f.MouseEnter:Connect(function()
            tw(f, 0.15, {BackgroundTransparency = 0.08})
            tw(lbl, 0.15, {TextColor3 = WHITE})
        end)
        f.MouseLeave:Connect(function()
            tw(f, 0.2, {BackgroundTransparency = 0.28})
            tw(lbl, 0.2, {
                TextColor3 = rgb(215, 215, 228),
            })
        end)

        return f, lbl
    end
    local function makeWideButton(parent, text, color, order, callback)
        local wrap = Instance.new('Frame')

        wrap.Size = UDim2.new(1, 0, 0, 38)
        wrap.BackgroundTransparency = 1
        wrap.LayoutOrder = order or 0
        wrap.ZIndex = 3
        wrap.Parent = parent

        local b = Instance.new('TextButton')

        b.Size = UDim2.new(1, 0, 1, 0)
        b.BackgroundColor3 = color
        b.Text = ''
        b.Font = Enum.Font.GothamBold
        b.TextSize = 13
        b.AutoButtonColor = false
        b.TextColor3 = WHITE
        b.ZIndex = 4
        b.Parent = wrap

        corner(b, 10)
        stroke(b, WHITE, 1, 0.84)

        local bg = Instance.new('Frame')

        bg.Size = UDim2.new(1, 0, 0.5, 0)
        bg.BackgroundColor3 = WHITE
        bg.BackgroundTransparency = 0.88
        bg.BorderSizePixel = 0
        bg.ZIndex = 5
        bg.Parent = b

        corner(bg, 10)

        local lbl = Instance.new('TextLabel')

        lbl.Size = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 13
        lbl.TextColor3 = WHITE
        lbl.ZIndex = 6
        lbl.Parent = b

        b.MouseEnter:Connect(function()
            tw(b, 0.15, {
                BackgroundColor3 = color:Lerp(WHITE, 0.18),
                Size = UDim2.new(1, -4, 0.92, 0),
            })
        end)
        b.MouseLeave:Connect(function()
            tw(b, 0.2, {BackgroundColor3 = color})
            twBack(b, 0.22, {
                Size = UDim2.new(1, 0, 1, 0),
            })
        end)
        b.MouseButton1Down:Connect(function()
            tw(b, 0.07, {
                Size = UDim2.new(1, -10, 0.86, 0),
                BackgroundColor3 = color:Lerp(rgb(0, 0, 0), 0.15),
            }, Enum.EasingStyle.Quad)
        end)
        b.MouseButton1Up:Connect(function()
            twBack(b, 0.22, {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundColor3 = color,
            })
        end)

        if callback then
            b.MouseButton1Click:Connect(callback)
        end

        return b
    end

    local activeTooltip = nil

    local function makeTooltip(row, textContent)
        local q = Instance.new('TextButton')

        q.AnchorPoint = Vector2.new(1, 0.5)
        q.Position = UDim2.new(0, -8, 0.5, 0)
        q.Size = UDim2.new(0, 18, 0, 18)
        q.BackgroundColor3 = rgb(30, 30, 40)
        q.Text = '?'
        q.Font = Enum.Font.GothamBold
        q.TextSize = 11
        q.TextColor3 = WHITE
        q.AutoButtonColor = false
        q.ZIndex = 40
        q.Parent = row

        corner(q, 9)
        stroke(q, WHITE, 1, 0.75)
        q.MouseEnter:Connect(function()
            tw(q, 0.15, {
                BackgroundColor3 = rgb(50, 50, 65),
            })
        end)
        q.MouseLeave:Connect(function()
            tw(q, 0.18, {
                BackgroundColor3 = rgb(30, 30, 40),
            })
        end)
        q.MouseButton1Click:Connect(function()
            if activeTooltip then
                tw(activeTooltip, 0.2, {
                    Size = UDim2.new(0, 0, 0, 0),
                    BackgroundTransparency = 1,
                })
                task.delay(0.22, function()
                    if activeTooltip then
                        activeTooltip:Destroy()

                        activeTooltip = nil
                    end
                end)

                return
            end

            local tip = Instance.new('Frame')

            tip.AnchorPoint = Vector2.new(1, 0.5)
            tip.Size = UDim2.new(0, 0, 0, 0)
            tip.BackgroundColor3 = rgb(16, 16, 24)
            tip.BackgroundTransparency = 0.04
            tip.ZIndex = 62
            tip.Parent = SG

            corner(tip, 10)

            local ts = stroke(tip, rgb(55, 55, 70), 1.4, 0)
            local tg = Instance.new('UIGradient')

            tg.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, rgb(40, 40, 55)),
                ColorSequenceKeypoint.new(1, rgb(60, 60, 78)),
            })
            tg.Parent = ts

            local txt = Instance.new('TextLabel')

            txt.Size = UDim2.new(1, -18, 1, -14)
            txt.Position = UDim2.new(0, 9, 0, 7)
            txt.BackgroundTransparency = 1
            txt.Text = textContent
            txt.TextWrapped = true
            txt.Font = Enum.Font.GothamMedium
            txt.TextSize = 12
            txt.TextColor3 = rgb(220, 220, 230)
            txt.ZIndex = 63
            txt.Parent = tip

            local ap = q.AbsolutePosition

            tip.Position = UDim2.new(0, ap.X - 4, 0, ap.Y + 10)
            activeTooltip = tip

            twBack(tip, 0.38, {
                Size = UDim2.new(0, 200, 0, 72),
            })
        end)

        return q
    end

    local notifHolder = Instance.new('Frame')

    notifHolder.AnchorPoint = Vector2.new(1, 0)
    notifHolder.Position = UDim2.new(1, -14, 0, 14)
    notifHolder.Size = UDim2.new(0, 260, 1, -28)
    notifHolder.BackgroundTransparency = 1
    notifHolder.ZIndex = 50
    notifHolder.Parent = SG

    local notifLayout = Instance.new('UIListLayout')

    notifLayout.Padding = UDim.new(0, 8)
    notifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    notifLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    notifLayout.SortOrder = Enum.SortOrder.LayoutOrder
    notifLayout.Parent = notifHolder

    local activeNotifs = {}

    local function dismissNotif(n)
        if n.dismissed then
            return
        end

        n.dismissed = true

        for i, v in ipairs(activeNotifs)do
            if (v == n) then
                table.remove(activeNotifs, i)

                break
            end
        end

        tw(n.frame, 0.3, {
            Position = UDim2.new(1, 300, 0, 0),
            BackgroundTransparency = 1,
        }, Enum.EasingStyle.Quart)
        tw(n.frame, 0.3, {
            Size = UDim2.new(0, 250, 0, 0),
        }, Enum.EasingStyle.Quart)
        task.delay(0.32, function()
            if n.frame then
                n.frame:Destroy()
            end
        end)
    end
    local function notify(titleText, descText, duration)
        duration = duration or 3

        if (#activeNotifs >= 4) then
            dismissNotif(activeNotifs[1])
        end

        local n = {}
        local f = Instance.new('TextButton')

        f.Size = UDim2.new(0, 250, 0, 0)
        f.Position = UDim2.new(1, 300, 0, 0)
        f.BackgroundColor3 = rgb(14, 14, 20)
        f.BackgroundTransparency = 0.04
        f.AutoButtonColor = false
        f.Text = ''
        f.ZIndex = 51
        f.ClipsDescendants = true
        f.Parent = notifHolder

        corner(f, 12)

        local s = stroke(f, rgb(52, 52, 64), 1.4, 0)
        local sg = Instance.new('UIGradient')

        sg.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, rgb(38, 38, 52)),
            ColorSequenceKeypoint.new(0.5, rgb(62, 62, 78)),
            ColorSequenceKeypoint.new(1, rgb(38, 38, 52)),
        })
        sg.Parent = s

        local hi = Instance.new('Frame')

        hi.Size = UDim2.new(1, 0, 0, 1)
        hi.BackgroundColor3 = WHITE
        hi.BackgroundTransparency = 0.72
        hi.BorderSizePixel = 0
        hi.ZIndex = 52
        hi.Parent = f

        local tl = Instance.new('TextLabel')

        tl.Size = UDim2.new(1, -44, 0, 22)
        tl.Position = UDim2.new(0, 14, 0, 10)
        tl.BackgroundTransparency = 1
        tl.Text = titleText
        tl.Font = Enum.Font.GothamBold
        tl.TextSize = 14
        tl.TextColor3 = WHITE
        tl.TextXAlignment = Enum.TextXAlignment.Left
        tl.ZIndex = 53
        tl.Parent = f

        local dl = Instance.new('TextLabel')

        dl.Size = UDim2.new(1, -28, 0, 28)
        dl.Position = UDim2.new(0, 14, 0, 30)
        dl.BackgroundTransparency = 1
        dl.Text = descText
        dl.TextWrapped = true
        dl.Font = Enum.Font.Gotham
        dl.TextSize = 11
        dl.TextColor3 = rgb(155, 155, 170)
        dl.TextXAlignment = Enum.TextXAlignment.Left
        dl.TextYAlignment = Enum.TextYAlignment.Top
        dl.ZIndex = 53
        dl.Parent = f

        local xb = Instance.new('TextButton')

        xb.Size = UDim2.new(0, 20, 0, 20)
        xb.Position = UDim2.new(1, -28, 0, 8)
        xb.BackgroundColor3 = rgb(35, 35, 46)
        xb.BackgroundTransparency = 0.4
        xb.Text = '\u{d7}'
        xb.Font = Enum.Font.GothamBold
        xb.TextSize = 14
        xb.TextColor3 = rgb(160, 160, 175)
        xb.ZIndex = 54
        xb.Parent = f

        corner(xb, 10)
        xb.MouseEnter:Connect(function()
            tw(xb, 0.15, {
                BackgroundTransparency = 0,
                TextColor3 = WHITE,
            })
        end)
        xb.MouseLeave:Connect(function()
            tw(xb, 0.18, {
                BackgroundTransparency = 0.4,
                TextColor3 = rgb(160, 160, 175),
            })
        end)

        local barBg = Instance.new('Frame')

        barBg.AnchorPoint = Vector2.new(0, 1)
        barBg.Position = UDim2.new(0, 0, 1, 0)
        barBg.Size = UDim2.new(1, 0, 0, 3)
        barBg.BackgroundColor3 = rgb(30, 30, 40)
        barBg.BorderSizePixel = 0
        barBg.ZIndex = 53
        barBg.Parent = f

        corner(barBg, 2)

        local bar = Instance.new('Frame')

        bar.Size = UDim2.new(1, 0, 1, 0)
        bar.BackgroundColor3 = theme.primary
        bar.BorderSizePixel = 0
        bar.ZIndex = 54
        bar.Parent = barBg

        corner(bar, 2)
        onTheme(function(p)
            bar.BackgroundColor3 = p
        end)

        n.frame = f

        table.insert(activeNotifs, n)
        task.spawn(function()
            twBack(f, 0.35, {
                Size = UDim2.new(0, 250, 0, 68),
            })
            task.wait(0.12)
            tw(f, 0.4, {
                Position = UDim2.new(1, 0, 0, 0),
            }, Enum.EasingStyle.Quart)
        end)
        tw(bar, duration, {
            Size = UDim2.new(0, 0, 1, 0),
        }, Enum.EasingStyle.Linear)
        f.MouseEnter:Connect(function()
            tw(f, 0.15, {BackgroundTransparency = 0})
        end)
        f.MouseLeave:Connect(function()
            tw(f, 0.18, {BackgroundTransparency = 0.04})
        end)
        f.MouseButton1Click:Connect(function()
            dismissNotif(n)
        end)
        xb.MouseButton1Click:Connect(function()
            dismissNotif(n)
        end)
        task.delay(duration, function()
            dismissNotif(n)
        end)

        return n
    end
    local function showConfirm(question, desc, onYes, opts)
        opts = opts or {}

        local dim = Instance.new('TextButton')

        dim.Size = UDim2.new(1, 0, 1, 0)
        dim.BackgroundColor3 = rgb(0, 0, 0)
        dim.BackgroundTransparency = 0.55
        dim.Text = ''
        dim.AutoButtonColor = false
        dim.ZIndex = 70
        dim.Parent = SG

        local box = Instance.new('Frame')

        box.AnchorPoint = Vector2.new(0.5, 0.5)
        box.Position = UDim2.new(0.5, 0, 0.5, 0)
        box.Size = UDim2.new(0, 0, 0, 0)
        box.BackgroundColor3 = rgb(14, 14, 20)
        box.ZIndex = 71
        box.Parent = dim

        corner(box, 14)
        stroke(box, WHITE, 1.6, 0.12)

        local bs = Instance.new('UIStroke')

        bs.Color = rgb(55, 55, 70)
        bs.Thickness = 1.5
        bs.Transparency = 0
        bs.Parent = box

        local q = Instance.new('TextLabel')

        q.Size = UDim2.new(1, -24, 0, 28)
        q.Position = UDim2.new(0, 12, 0, 18)
        q.BackgroundTransparency = 1
        q.Text = question
        q.Font = Enum.Font.GothamBold
        q.TextSize = 17
        q.TextColor3 = WHITE
        q.ZIndex = 72
        q.Parent = box

        local d = Instance.new('TextLabel')

        d.Size = UDim2.new(1, -24, 0, 20)
        d.Position = UDim2.new(0, 12, 0, 48)
        d.BackgroundTransparency = 1
        d.Text = desc or ''
        d.Font = Enum.Font.Gotham
        d.TextSize = 11
        d.TextColor3 = rgb(155, 155, 170)
        d.ZIndex = 72
        d.Parent = box

        local function mkBtn(t, col, xpos)
            local b = Instance.new('TextButton')

            b.Size = UDim2.new(0.5, -16, 0, 32)
            b.Position = xpos
            b.BackgroundColor3 = col
            b.Text = t
            b.Font = Enum.Font.GothamBold
            b.TextSize = 13
            b.TextColor3 = WHITE
            b.AutoButtonColor = false
            b.ZIndex = 72
            b.Parent = box

            corner(b, 9)
            b.MouseEnter:Connect(function()
                tw(b, 0.15, {
                    BackgroundColor3 = col:Lerp(WHITE, 0.18),
                })
            end)
            b.MouseLeave:Connect(function()
                tw(b, 0.18, {BackgroundColor3 = col})
            end)
            b.MouseButton1Down:Connect(function()
                tw(b, 0.07, {
                    BackgroundColor3 = col:Lerp(rgb(0, 0, 0), 0.15),
                }, Enum.EasingStyle.Quad)
            end)
            b.MouseButton1Up:Connect(function()
                tw(b, 0.15, {BackgroundColor3 = col})
            end)

            return b
        end

        local yes = mkBtn(opts.yesText or 'Confirm', rgb(50, 175, 80), UDim2.new(0, 12, 1, -44))
        local no = mkBtn(opts.noText or 'Cancel', rgb(190, 55, 55), UDim2.new(0.5, 4, 1, -44))

        twBack(box, 0.42, {
            Size = UDim2.new(0, 260, 0, 140),
        })

        local function closeDlg()
            tw(box, 0.22, {
                Size = UDim2.new(0, 0, 0, 0),
            }, Enum.EasingStyle.Quart)
            task.delay(0.24, function()
                dim:Destroy()
            end)
        end

        yes.MouseButton1Click:Connect(function()
            closeDlg()

            if onYes then
                onYes()
            end
        end)
        no.MouseButton1Click:Connect(function()
            closeDlg()

            if opts.onNo then
                opts.onNo()
            end
        end)

        if not opts.noDismiss then
            dim.MouseButton1Click:Connect(closeDlg)
        end
    end

    local navButtons = {}
    local ICONS = {
        Home = '\u{2302}',
        Main = '\u{25c6}',
    }
    local ORDER = {
        'Home',
        'Main',
    }

    local function selectSection(name)
        currentSection = name
        settingsOpen = false

        for secName, sec in pairs(sections)do
            if (secName == name) then
                sec.page.Visible = true
                sec.page.Position = UDim2.new(0.05, 0, 0, 0)

                tw(sec.page, 0.28, {
                    Position = UDim2.new(0, 0, 0, 0),
                }, Enum.EasingStyle.Quart)
            else
                sec.page.Visible = false
            end
        end
        for btnName, data in pairs(navButtons)do
            local active = btnName == name

            tw(data.btn, 0.22, {
                BackgroundTransparency = (active and 0.72) or 1,
            })

            if active then
                data.line.Visible = true
                data.line.Size = UDim2.new(0, 0, 0, 3)
                data.line.Position = UDim2.new(0, 10, 1, -5)

                tw(data.line, 0.35, {
                    Size = UDim2.new(0, 24, 0, 3),
                }, Enum.EasingStyle.Quart)
                tw(data.icon, 0.2, {
                    TextColor3 = theme.primary,
                })
            else
                tw(data.line, 0.22, {
                    Size = UDim2.new(0, 0, 0, 3),
                    Position = UDim2.new(0, 6, 1, -5),
                })
                tw(data.icon, 0.2, {TextColor3 = WHITE})
                task.delay(0.24, function()
                    if (currentSection ~= btnName) then
                        data.line.Visible = false
                    end
                end)
            end
        end
    end
    local function makeNavButton(name, order)
        local btn = Instance.new('TextButton')

        btn.Size = UDim2.new(1, 0, 0, 38)
        btn.BackgroundColor3 = WHITE
        btn.BackgroundTransparency = 1
        btn.AutoButtonColor = false
        btn.Text = ''
        btn.LayoutOrder = order
        btn.ClipsDescendants = true
        btn.ZIndex = 4
        btn.Parent = navList

        corner(btn, 9)

        local icon = Instance.new('TextLabel')

        icon.Size = UDim2.new(0, 30, 1, 0)
        icon.Position = UDim2.new(0, 4, 0, 0)
        icon.BackgroundTransparency = 1
        icon.Text = ICONS[name] or '\u{2022}'
        icon.Font = Enum.Font.GothamBold
        icon.TextSize = 16
        icon.TextColor3 = WHITE
        icon.ZIndex = 5
        icon.Parent = btn

        local label = Instance.new('TextLabel')

        label.Size = UDim2.new(1, -38, 1, 0)
        label.Position = UDim2.new(0, 36, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.Font = Enum.Font.GothamMedium
        label.TextSize = 13
        label.TextColor3 = rgb(215, 215, 228)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.ZIndex = 5
        label.Parent = btn

        local line = Instance.new('Frame')

        line.Size = UDim2.new(0, 0, 0, 3)
        line.Position = UDim2.new(0, 10, 1, -5)
        line.BackgroundColor3 = WHITE
        line.BorderSizePixel = 0
        line.Visible = false
        line.ZIndex = 6
        line.Parent = btn

        corner(line, 3)
        onTheme(function(p)
            line.BackgroundColor3 = p
        end)
        btn.MouseEnter:Connect(function()
            if ((currentSection ~= name) or settingsOpen) then
                tw(btn, 0.15, {BackgroundTransparency = 0.78})
                tw(icon, 0.15, {
                    TextColor3 = theme.primary,
                })
            end
        end)
        btn.MouseLeave:Connect(function()
            if ((currentSection ~= name) or settingsOpen) then
                tw(btn, 0.2, {BackgroundTransparency = 1})
                tw(icon, 0.2, {TextColor3 = WHITE})
            end
        end)
        btn.MouseButton1Down:Connect(function()
            tw(btn, 0.07, {
                Size = UDim2.new(1, -6, 0, 34),
            }, Enum.EasingStyle.Quad)
        end)
        btn.MouseButton1Up:Connect(function()
            twBack(btn, 0.2, {
                Size = UDim2.new(1, 0, 0, 38),
            })
        end)
        btn.MouseButton1Click:Connect(function()
            selectSection(name)
        end)

        navButtons[name] = {
            btn = btn,
            icon = icon,
            label = label,
            line = line,
        }

        return btn
    end

    for i, name in ipairs(ORDER)do
        makeNavButton(name, i)
    end

    local navCollapsed = false
    local collapseBtn = Instance.new('TextButton')

    collapseBtn.AnchorPoint = Vector2.new(0.5, 1)
    collapseBtn.Position = UDim2.new(0.5, 0, 1, -8)
    collapseBtn.Size = UDim2.new(0, 32, 0, 26)
    collapseBtn.BackgroundColor3 = rgb(28, 28, 38)
    collapseBtn.BackgroundTransparency = 0.15
    collapseBtn.Text = '\u{2039}'
    collapseBtn.Font = Enum.Font.GothamBold
    collapseBtn.TextSize = 18
    collapseBtn.TextColor3 = rgb(190, 190, 210)
    collapseBtn.AutoButtonColor = false
    collapseBtn.ZIndex = 5
    collapseBtn.Parent = nav

    corner(collapseBtn, 9)
    stroke(collapseBtn, WHITE, 1, 0.88)

    local function setNav(collapsed)
        navCollapsed = collapsed

        local w = (collapsed and NAV_CLOSED) or NAV_OPEN

        tw(nav, 0.32, {
            Size = UDim2.new(0, w, 1, 0),
        }, Enum.EasingStyle.Quart)
        tw(content, 0.32, {
            Position = UDim2.new(0, w, 0, 0),
            Size = UDim2.new(1, -w, 1, 0),
        }, Enum.EasingStyle.Quart)

        collapseBtn.Text = (collapsed and '\u{203a}') or '\u{2039}'

        for _, data in pairs(navButtons)do
            if collapsed then
                tw(data.label, 0.15, {TextTransparency = 1})
                task.delay(0.15, function()
                    if navCollapsed then
                        data.label.Visible = false
                    end
                end)
            else
                data.label.Visible = true

                tw(data.label, 0.22, {TextTransparency = 0})
            end
        end
    end

    collapseBtn.MouseEnter:Connect(function()
        tw(collapseBtn, 0.15, {BackgroundTransparency = 0})
    end)
    collapseBtn.MouseLeave:Connect(function()
        tw(collapseBtn, 0.18, {BackgroundTransparency = 0.15})
    end)
    collapseBtn.MouseButton1Click:Connect(function()
        setNav(not navCollapsed)
    end)

    local function makePage(name)
        local page = Instance.new('Frame')

        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.ZIndex = 3
        page.Parent = content

        local scroll = Instance.new('ScrollingFrame')

        scroll.Size = UDim2.new(1, 0, 1, 0)
        scroll.BackgroundTransparency = 1
        scroll.BorderSizePixel = 0
        scroll.ScrollBarThickness = 3
        scroll.ScrollBarImageTransparency = 0.5
        scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        scroll.ZIndex = 3
        scroll.Parent = page

        onTheme(function(p)
            scroll.ScrollBarImageColor3 = p
        end)

        local layout = Instance.new('UIListLayout')

        layout.Padding = UDim.new(0, 7)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Parent = scroll
        sections[name] = {
            page = page,
            scroll = scroll,
        }

        return sections[name]
    end

    for _, name in ipairs(ORDER)do
        makePage(name)
    end

    makePage('Settings')

    do
        local sc = sections.Home.scroll

        makeHeading(sc, 'Home', 1)
        makeSeparator(sc, 2)

        local linkData = {
            {
                '\u{1f4e2}  My channel: t.me/VanezyScripts',
                'https://t.me/VanezyScripts',
            },
            {
                '\u{1f464}  Author: @vanezy',
                '@vanezy',
            },
            {
                '\u{1f91d}  Friends: t.me/ScriptRobox',
                'https://t.me/ScriptRobox',
            },
        }

        for i, data in ipairs(linkData)do
            local row = makeRow(sc, 2 + i, 36)
            local dot = Instance.new('Frame')

            dot.AnchorPoint = Vector2.new(0, 0.5)
            dot.Position = UDim2.new(0, 10, 0.5, 0)
            dot.Size = UDim2.new(0, 4, 0, 4)
            dot.BorderSizePixel = 0
            dot.ZIndex = 4
            dot.Parent = row

            corner(dot, 2)
            onTheme(function(p)
                dot.BackgroundColor3 = p
            end)

            local b = Instance.new('TextButton')

            b.Size = UDim2.new(1, -24, 1, 0)
            b.Position = UDim2.new(0, 20, 0, 0)
            b.BackgroundTransparency = 1
            b.Text = data[1]
            b.Font = Enum.Font.GothamMedium
            b.TextSize = 12
            b.TextColor3 = rgb(100, 170, 255)
            b.TextXAlignment = Enum.TextXAlignment.Left
            b.TextTruncate = Enum.TextTruncate.AtEnd
            b.ZIndex = 4
            b.Parent = row

            b.MouseEnter:Connect(function()
                tw(b, 0.15, {
                    TextColor3 = rgb(160, 210, 255),
                })
            end)
            b.MouseLeave:Connect(function()
                tw(b, 0.18, {
                    TextColor3 = rgb(100, 170, 255),
                })
            end)
            b.MouseButton1Click:Connect(function()
                safe(_setclipboard, data[2])
                notify('Copied!', data[2], 3)
            end)

            if (i < #linkData) then
                makeSeparator(sc, 2 + i + 0.5)
            end
        end

        local warn = makeRow(sc, 20, 48)

        warn.BackgroundColor3 = rgb(38, 32, 14)
        warn.BackgroundTransparency = 0.15

        local wicon = Instance.new('TextLabel')

        wicon.Position = UDim2.new(0, 10, 0, 0)
        wicon.Size = UDim2.new(0, 24, 1, 0)
        wicon.BackgroundTransparency = 1
        wicon.Text = '\u{26a0}'
        wicon.TextSize = 16
        wicon.Font = Enum.Font.GothamBold
        wicon.TextColor3 = rgb(240, 190, 60)
        wicon.ZIndex = 4
        wicon.Parent = warn

        local wl = Instance.new('TextLabel')

        wl.Size = UDim2.new(1, -48, 1, 0)
        wl.Position = UDim2.new(0, 36, 0, 0)
        wl.BackgroundTransparency = 1
        wl.Text = 'Early build \u{2014} bugs may occur. Updates coming soon!'
        wl.TextWrapped = true
        wl.Font = Enum.Font.GothamMedium
        wl.TextSize = 11
        wl.TextColor3 = rgb(210, 200, 140)
        wl.ZIndex = 4
        wl.Parent = warn
    end

    local mapFrame = Instance.new('Frame')

    mapFrame.Name = 'MiniMap'
    mapFrame.AnchorPoint = Vector2.new(1, 0)
    mapFrame.Position = UDim2.new(1, -10, 0, 10)
    mapFrame.Size = UDim2.new(0, MapSettings.Size, 0, MapSettings.Size)
    mapFrame.BackgroundColor3 = rgb(10, 10, 16)
    mapFrame.BackgroundTransparency = 0.1
    mapFrame.BorderSizePixel = 0
    mapFrame.ClipsDescendants = true
    mapFrame.Visible = false
    mapFrame.ZIndex = 44
    mapFrame.Parent = SG

    corner(mapFrame, MapSettings.Size / 2)

    local mapStroke = stroke(mapFrame, WHITE, 2, 0.1)

    onTheme(function(p)
        mapStroke.Color = p
        mapStroke.Transparency = 0.35
    end)

    local mapBg = Instance.new('Frame')

    mapBg.Size = UDim2.new(1, 0, 1, 0)
    mapBg.BackgroundColor3 = rgb(18, 18, 26)
    mapBg.BackgroundTransparency = 0
    mapBg.BorderSizePixel = 0
    mapBg.ZIndex = 44
    mapBg.Parent = mapFrame

    corner(mapBg, MapSettings.Size / 2)

    local mapGrid = Instance.new('Frame')

    mapGrid.Size = UDim2.new(1, 0, 1, 0)
    mapGrid.BackgroundTransparency = 1
    mapGrid.ZIndex = 44
    mapGrid.Parent = mapFrame

    local function makeGridLine(hor, pos)
        local l = Instance.new('Frame')

        l.BackgroundColor3 = WHITE
        l.BackgroundTransparency = 0.9
        l.BorderSizePixel = 0
        l.ZIndex = 44
        l.Parent = mapGrid

        if hor then
            l.Size = UDim2.new(1, 0, 0, 1)
            l.Position = UDim2.new(0, 0, pos, 0)
        else
            l.Size = UDim2.new(0, 1, 1, 0)
            l.Position = UDim2.new(pos, 0, 0, 0)
        end
    end

    makeGridLine(true, 0.25)
    makeGridLine(true, 0.5)
    makeGridLine(true, 0.75)
    makeGridLine(false, 0.25)
    makeGridLine(false, 0.5)
    makeGridLine(false, 0.75)

    local mapNorthLbl = Instance.new('TextLabel')

    mapNorthLbl.Size = UDim2.new(1, 0, 0, 12)
    mapNorthLbl.Position = UDim2.new(0, 0, 0, 2)
    mapNorthLbl.BackgroundTransparency = 1
    mapNorthLbl.Text = 'N'
    mapNorthLbl.Font = Enum.Font.GothamBold
    mapNorthLbl.TextSize = 9
    mapNorthLbl.TextColor3 = rgb(180, 180, 200)
    mapNorthLbl.ZIndex = 47
    mapNorthLbl.Parent = mapFrame

    local mapDots = {}
    local localDot = Instance.new('Frame')

    localDot.AnchorPoint = Vector2.new(0.5, 0.5)
    localDot.Size = UDim2.new(0, 10, 0, 6)
    localDot.BackgroundColor3 = rgb(60, 130, 255)
    localDot.BorderSizePixel = 0
    localDot.ZIndex = 47
    localDot.Parent = mapFrame

    corner(localDot, 2)
    onTheme(function() end)

    local function getOrCreateDot(player)
        if mapDots[player] then
            if not mapDots[player].Parent then
                mapDots[player] = nil
            else
                return mapDots[player]
            end
        end

        local isFriendPlayer = false

        for _, fn in pairs(FriendList)do
            if (fn == player.Name) then
                isFriendPlayer = true

                break
            end
        end

        local dot = Instance.new('Frame')

        dot.AnchorPoint = Vector2.new(0.5, 0.5)
        dot.Size = UDim2.new(0, 7, 0, 7)
        dot.BackgroundColor3 = (isFriendPlayer and rgb(60, 210, 110)) or rgb(235, 60, 60)
        dot.BorderSizePixel = 0
        dot.ZIndex = 46
        dot.Parent = mapFrame

        corner(dot, 4)

        local nameLbl = Instance.new('TextLabel')

        nameLbl.AnchorPoint = Vector2.new(0.5, 1)
        nameLbl.Position = UDim2.new(0.5, 0, 0, -1)
        nameLbl.Size = UDim2.new(0, 60, 0, 10)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = player.Name
        nameLbl.Font = Enum.Font.GothamBold
        nameLbl.TextSize = 7
        nameLbl.TextColor3 = WHITE
        nameLbl.TextStrokeTransparency = 0.4
        nameLbl.ZIndex = 47
        nameLbl.Parent = dot
        mapDots[player] = dot

        return dot
    end
    local function updateMinimap()
        if not MapSettings.Enabled then
            return
        end

        local sz = MapSettings.Size
        local radius = MapSettings.WorldRadius
        local lp = LP.Character

        if not lp then
            return
        end

        local lpRoot = lp:FindFirstChild('HumanoidRootPart')

        if not lpRoot then
            return
        end

        local lpPos = lpRoot.Position
        local camLook = Camera.CFrame.LookVector
        local angle = math.atan2(camLook.X, camLook.Z)

        localDot.Size = UDim2.new(0, 10, 0, 6)
        localDot.Rotation = -math.deg(angle)
        localDot.Position = UDim2.new(0.5, 0, 0.5, 0)

        local seen = {}

        for _, player in pairs(Players:GetPlayers())do
            if ((player ~= LP) and player.Character) then
                local root = player.Character:FindFirstChild('HumanoidRootPart')

                if root then
                    local rel = root.Position - lpPos
                    local nx = rel.X / radius
                    local nz = rel.Z / radius
                    local rx = (nx * math.cos(angle)) + (nz * math.sin(angle))
                    local ry = (-nx * math.sin(angle)) + (nz * math.cos(angle))

                    rx = math.clamp(rx, -0.45, 0.45)
                    ry = math.clamp(ry, -0.45, 0.45)

                    local dot = getOrCreateDot(player)
                    local isFriendPlayer = false

                    for _, fn in pairs(FriendList)do
                        if (fn == player.Name) then
                            isFriendPlayer = true

                            break
                        end
                    end

                    dot.BackgroundColor3 = (isFriendPlayer and rgb(60, 210, 110)) or rgb(235, 60, 60)
                    dot.Position = UDim2.new(0.5 + rx, 0, 0.5 + ry, 0)
                    seen[player] = true
                end
            end
        end
        for player, dot in pairs(mapDots)do
            if not seen[player] then
                if (dot and dot.Parent) then
                    dot:Destroy()
                end

                mapDots[player] = nil
            end
        end
    end

    local mapMoveOverlay = Instance.new('Frame')

    mapMoveOverlay.Size = UDim2.new(1, 0, 1, 0)
    mapMoveOverlay.BackgroundColor3 = rgb(0, 0, 0)
    mapMoveOverlay.BackgroundTransparency = 0.52
    mapMoveOverlay.Visible = false
    mapMoveOverlay.ZIndex = 80
    mapMoveOverlay.Parent = SG

    local mapMoveLabel = Instance.new('TextLabel')

    mapMoveLabel.AnchorPoint = Vector2.new(0.5, 0.4)
    mapMoveLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
    mapMoveLabel.Size = UDim2.new(0.8, 0, 0, 50)
    mapMoveLabel.BackgroundTransparency = 1
    mapMoveLabel.Text = 'Move the 2D Map wherever you want...'
    mapMoveLabel.Font = Enum.Font.GothamBlack
    mapMoveLabel.TextSize = 22
    mapMoveLabel.TextColor3 = WHITE
    mapMoveLabel.TextWrapped = true
    mapMoveLabel.ZIndex = 81
    mapMoveLabel.Parent = mapMoveOverlay

    local mapMoveLabelGrad = Instance.new('UIGradient')

    mapMoveLabelGrad.Parent = mapMoveLabel

    onTheme(function(p)
        mapMoveLabelGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, p),
            ColorSequenceKeypoint.new(0.5, WHITE),
            ColorSequenceKeypoint.new(1, p),
        })
    end)

    local mapMoveActions = Instance.new('Frame')

    mapMoveActions.AnchorPoint = Vector2.new(0.5, 0)
    mapMoveActions.Position = UDim2.new(0.5, 0, 0.56, 0)
    mapMoveActions.Size = UDim2.new(0, 220, 0, 44)
    mapMoveActions.BackgroundTransparency = 1
    mapMoveActions.ZIndex = 81
    mapMoveActions.Parent = mapMoveOverlay

    local mapActLayout = Instance.new('UIListLayout')

    mapActLayout.FillDirection = Enum.FillDirection.Horizontal
    mapActLayout.Padding = UDim.new(0, 14)
    mapActLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    mapActLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    mapActLayout.Parent = mapMoveActions

    local function makeMapBtn(text, color)
        local b = Instance.new('TextButton')

        b.Size = UDim2.new(0, 100, 0, 40)
        b.BackgroundColor3 = color
        b.Text = text
        b.Font = Enum.Font.GothamBold
        b.TextSize = 14
        b.TextColor3 = WHITE
        b.AutoButtonColor = false
        b.ZIndex = 82
        b.Parent = mapMoveActions

        corner(b, 10)
        stroke(b, WHITE, 1, 0.82)
        b.MouseEnter:Connect(function()
            tw(b, 0.15, {
                BackgroundColor3 = color:Lerp(WHITE, 0.18),
                Size = UDim2.new(0, 104, 0, 42),
            })
        end)
        b.MouseLeave:Connect(function()
            tw(b, 0.18, {
                BackgroundColor3 = color,
                Size = UDim2.new(0, 100, 0, 40),
            })
        end)
        b.MouseButton1Down:Connect(function()
            tw(b, 0.07, {
                BackgroundColor3 = color:Lerp(rgb(0, 0, 0), 0.15),
            }, Enum.EasingStyle.Quad)
        end)
        b.MouseButton1Up:Connect(function()
            tw(b, 0.15, {BackgroundColor3 = color})
        end)

        return b
    end

    local mapSaveBtn = makeMapBtn('Save', rgb(50, 175, 80))
    local mapCloseBtn = makeMapBtn('Close', rgb(190, 55, 55))
    local mapDragging = false
    local mapDragStartMouseX, mapDragStartMouseY = 0, 0
    local mapDragStartX, mapDragStartY = 0, 0

    local function enterMapMoveMode()
        mapMoveMode = true
        mapMoveOverlay.Visible = true

        tw(mapMoveOverlay, 0.25, {BackgroundTransparency = 0.52})

        mapFrame.ZIndex = 85
        mapFrame.Active = true

        mapFrame.InputBegan:Connect(function(i)
            if not mapMoveMode then
                return
            end
            if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
                mapDragging = true

                local mpos = UserInputService:GetMouseLocation()

                mapDragStartMouseX = mpos.X
                mapDragStartMouseY = mpos.Y
                mapDragStartX = mapPosX
                mapDragStartY = mapPosY
            end
        end)
    end

    conn(UserInputService.InputChanged:Connect(function(i)
        if (mapDragging and mapMoveMode and ((i.UserInputType == Enum.UserInputType.MouseMovement) or (i.UserInputType == Enum.UserInputType.Touch))) then
            local mpos = UserInputService:GetMouseLocation()
            local dx = mpos.X - mapDragStartMouseX
            local dy = mpos.Y - mapDragStartMouseY

            mapPosX = mapDragStartX + dx
            mapPosY = mapDragStartY + dy

            local sz = MapSettings.Size
            local vp = Camera.ViewportSize

            mapPosX = math.clamp(mapPosX, sz / 2, vp.X - (sz / 2))
            mapPosY = math.clamp(mapPosY, sz / 2, vp.Y - (sz / 2))
            mapFrame.Position = UDim2.new(0, mapPosX - (sz / 2), 0, mapPosY - (sz / 2))
            mapFrame.AnchorPoint = Vector2.new(0, 0)
        end
    end))
    conn(UserInputService.InputEnded:Connect(function(i)
        if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
            mapDragging = false
        end
    end))

    local function exitMapMoveMode(save)
        mapMoveMode = false
        mapDragging = false

        tw(mapMoveOverlay, 0.22, {BackgroundTransparency = 1})
        task.delay(0.24, function()
            mapMoveOverlay.Visible = false
        end)

        mapFrame.ZIndex = 44

        if not save then
            mapFrame.AnchorPoint = Vector2.new(1, 0)
            mapFrame.Position = UDim2.new(1, -10, 0, 10)
            mapPosX = 0
            mapPosY = 0
        end
    end

    mapSaveBtn.MouseButton1Click:Connect(function()
        exitMapMoveMode(true)
        notify('Map position saved', 'Minimap position stored.', 3)
    end)
    mapCloseBtn.MouseButton1Click:Connect(function()
        exitMapMoveMode(false)
    end)
    conn(RunService.RenderStepped:Connect(function()
        if MapSettings.Enabled then
            local t = os.clock()
            local pulse = 0.85 + (0.15 * math.abs(math.sin(t * 1.4)))

            mapStroke.Transparency = 0.35 - (0.15 * math.abs(math.sin(t * 1.4)))

            updateMinimap()
        end
    end))

    do
        local page = sections.Main.page
        local sc = sections.Main.scroll

        sc.Size = UDim2.new(1, 0, 1, -46)

        makeHeading(sc, 'Main', 1)
        makeSeparator(sc, 2)

        local function isVisible(targetCharacter)
            if not AimbotSettings.VisibleCheck then
                return true
            end

            local targetPart = targetCharacter:FindFirstChild(AimbotSettings.TargetPart)

            if not targetPart then
                return false
            end

            raycastParams.FilterDescendantsInstances = {
                LP.Character,
                targetCharacter,
            }

            local camPos = Camera.CFrame.Position
            local result = workspace:Raycast(camPos, targetPart.Position - camPos, raycastParams)

            return result == nil
        end
        local function isFriend(player)
            for _, friendName in pairs(FriendList)do
                if (player.Name == friendName) then
                    return true
                end
            end

            return false
        end
        local function getClosestPlayer()
            local closestPlayer, shortestDistance = nil, AimbotSettings.FOV

            for _, player in pairs(Players:GetPlayers())do
                if ((player ~= LP) and player.Character) then
                    if isFriend(player) then
                        continue
                    end

                    local humanoid = player.Character:FindFirstChildOfClass('Humanoid')

                    if (not humanoid or (humanoid.Health <= 0)) then
                        continue
                    end

                    local targetPart = player.Character:FindFirstChild(AimbotSettings.TargetPart) or player.Character:FindFirstChild('HumanoidRootPart')

                    if not targetPart then
                        continue
                    end

                    local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)

                    if onScreen then
                        local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude

                        if ((dist < shortestDistance) and isVisible(player.Character)) then
                            shortestDistance = dist
                            closestPlayer = player
                        end
                    end
                end
            end

            return closestPlayer
        end
        local function createHighlight(player)
            if (player == LP) then
                return
            end

            local char = player.Character

            if not char then
                return
            end
            if char:FindFirstChild('ESPHighlight') then
                char.ESPHighlight:Destroy()
            end
            if not AimbotSettings.WallhackEnabled then
                return
            end

            local hl = Instance.new('Highlight')

            hl.Name = 'ESPHighlight'

            if isFriend(player) then
                hl.FillColor = Color3.fromRGB(0, 255, 0)
                hl.OutlineColor = Color3.fromRGB(20, 20, 20)
                hl.FillTransparency = 0.3
            else
                hl.FillColor = Color3.fromRGB(255, 0, 0)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.FillTransparency = 0.5
            end

            hl.OutlineTransparency = 0
            hl.Adornee = char
            hl.Parent = char
        end
        local function createNameTag(player)
            if (player == LP) then
                return
            end

            local char = player.Character

            if not char then
                return
            end

            local head = char:FindFirstChild('Head')

            if not head then
                return
            end
            if head:FindFirstChild('ESPNameTag') then
                head.ESPNameTag:Destroy()
            end
            if not AimbotSettings.WallhackEnabled then
                return
            end

            local bb = Instance.new('BillboardGui')

            bb.Name = 'ESPNameTag'
            bb.Adornee = head
            bb.Size = UDim2.new(0, 140, 0, 30)
            bb.StudsOffset = Vector3.new(0, 2.2, 0)
            bb.AlwaysOnTop = true
            bb.Parent = head

            local bg = Instance.new('Frame')

            bg.Size = UDim2.new(1, 0, 1, 0)
            bg.BackgroundColor3 = rgb(10, 10, 16)
            bg.BackgroundTransparency = 0.38
            bg.BorderSizePixel = 0
            bg.ZIndex = 1
            bg.Parent = bb

            corner(bg, 5)

            local lbl = Instance.new('TextLabel')

            lbl.Name = 'TagLabel'
            lbl.Size = UDim2.new(1, -6, 1, 0)
            lbl.Position = UDim2.new(0, 3, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.TextColor3 = Color3.new(1, 1, 1)
            lbl.Font = Enum.Font.GothamBold
            lbl.TextScaled = true
            lbl.TextStrokeTransparency = 0.4
            lbl.Text = player.Name
            lbl.ZIndex = 2
            lbl.Parent = bb
        end
        local function updateNameTag(player)
            if (player == LP) then
                return
            end
            if (not LP.Character or not LP.Character.PrimaryPart) then
                return
            end

            local char = player.Character

            if not char then
                return
            end

            local head = char:FindFirstChild('Head')

            if not head then
                return
            end

            local bb = head:FindFirstChild('ESPNameTag')

            if not bb then
                return
            end

            local lbl = bb:FindFirstChild('TagLabel')

            if not lbl then
                return
            end

            local hum = char:FindFirstChildOfClass('Humanoid')

            if not hum then
                return
            end

            local rp = char.PrimaryPart

            if not rp then
                return
            end

            local dist = math.floor((LP.Character.PrimaryPart.Position - rp.Position).Magnitude)
            local hp = math.floor(hum.Health)
            local maxHp = math.floor(hum.MaxHealth)

            lbl.Text = player.Name .. ' | ' .. dist .. 'm | \u{2764}' .. hp .. '/' .. maxHp

            if isFriend(player) then
                lbl.TextColor3 = Color3.fromRGB(80, 255, 120)
            elseif (hp <= 0) then
                lbl.TextColor3 = Color3.fromRGB(120, 120, 120)
            else
                lbl.TextColor3 = Color3.fromRGB(255, 80, 80)
            end
        end
        local function updateHighlight(player)
            if (player == LP) then
                return
            end

            local char = player.Character

            if not char then
                return
            end

            local hl = char:FindFirstChild('ESPHighlight')

            if not hl then
                return
            end

            local hum = char:FindFirstChildOfClass('Humanoid')

            if not hum then
                return
            end
            if isFriend(player) then
                hl.FillColor = Color3.fromRGB(0, 220, 0)
            elseif (hum.Health <= 0) then
                hl.FillColor = Color3.fromRGB(120, 0, 0)
            else
                hl.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
        local function setupESP(player)
            if (player == LP) then
                return
            end

            local function onChar(char)
                if not char then
                    return
                end

                char:WaitForChild('HumanoidRootPart', 5)
                char:WaitForChild('Humanoid', 5)
                task.wait(0.1)
                createHighlight(player)
                createNameTag(player)
            end

            if player.Character then
                onChar(player.Character)
            end

            player.CharacterAdded:Connect(onChar)
        end
        local function updatePlayerHighlight(player)
            createHighlight(player)
            createNameTag(player)
        end
        local function updateAllHighlights()
            for _, p in pairs(Players:GetPlayers())do
                if ((p ~= LP) and p.Character) then
                    createHighlight(p)
                    createNameTag(p)
                end
            end
        end

        for _, p in pairs(Players:GetPlayers())do
            setupESP(p)
        end

        Players.PlayerAdded:Connect(setupESP)
        task.spawn(function()
            while SG.Parent do
                for _, p in pairs(Players:GetPlayers())do
                    if ((p ~= LP) and p.Character and p.Character:FindFirstChildOfClass('Humanoid')) then
                        updateNameTag(p)
                        updateHighlight(p)
                    end
                end

                task.wait(0.3)
            end
        end)

        local TargetBtn

        local function cycleTarget()
            TargetIndex = (TargetIndex % #TargetParts) + 1
            AimbotSettings.TargetPart = TargetParts[TargetIndex]

            if TargetBtn then
                TargetBtn.Text = 'Target: ' .. AimbotSettings.TargetPart
            end
        end

        makeToggle(sc, 'Aimbot', 'AimbotEnabled', AimbotSettings, 3)
        makeSeparator(sc, 4)
        makeToggle(sc, 'Wall Check', 'VisibleCheck', AimbotSettings, 5)
        makeSeparator(sc, 6)
        makeToggle(sc, 'Wallhack (ESP)', 'WallhackEnabled', AimbotSettings, 7, function()
            updateAllHighlights()
        end)
        makeSeparator(sc, 8)

        local fovRow = makeRow(sc, 9, 36)
        local fovLbl = Instance.new('TextLabel')

        fovLbl.Size = UDim2.new(0.6, 0, 1, 0)
        fovLbl.Position = UDim2.new(0, 14, 0, 0)
        fovLbl.BackgroundTransparency = 1
        fovLbl.Text = 'FOV: ' .. AimbotSettings.FOV
        fovLbl.Font = Enum.Font.GothamMedium
        fovLbl.TextSize = 13
        fovLbl.TextColor3 = rgb(215, 215, 228)
        fovLbl.TextXAlignment = Enum.TextXAlignment.Left
        fovLbl.ZIndex = 4
        fovLbl.Parent = fovRow

        local fovBox = Instance.new('TextBox')

        fovBox.AnchorPoint = Vector2.new(1, 0.5)
        fovBox.Position = UDim2.new(1, -10, 0.5, 0)
        fovBox.Size = UDim2.new(0, 70, 0, 24)
        fovBox.BackgroundColor3 = rgb(30, 30, 40)
        fovBox.TextColor3 = WHITE
        fovBox.Text = tostring(AimbotSettings.FOV)
        fovBox.Font = Enum.Font.GothamMedium
        fovBox.TextSize = 13
        fovBox.ZIndex = 5
        fovBox.Parent = fovRow

        corner(fovBox, 6)
        stroke(fovBox, WHITE, 1, 0.88)
        fovBox.FocusLost:Connect(function()
            local v = tonumber(fovBox.Text)

            if v then
                AimbotSettings.FOV = math.clamp(v, 10, 1000)
                fovBox.Text = tostring(AimbotSettings.FOV)
                fovLbl.Text = 'FOV: ' .. AimbotSettings.FOV
            else
                fovBox.Text = tostring(AimbotSettings.FOV)
            end
        end)
        makeSeparator(sc, 10)

        local smoothRow = makeRow(sc, 11, 36)
        local smoothLbl = Instance.new('TextLabel')

        smoothLbl.Size = UDim2.new(0.6, 0, 1, 0)
        smoothLbl.Position = UDim2.new(0, 14, 0, 0)
        smoothLbl.BackgroundTransparency = 1
        smoothLbl.Text = 'Smooth: ' .. AimbotSettings.Smoothness
        smoothLbl.Font = Enum.Font.GothamMedium
        smoothLbl.TextSize = 13
        smoothLbl.TextColor3 = rgb(215, 215, 228)
        smoothLbl.TextXAlignment = Enum.TextXAlignment.Left
        smoothLbl.ZIndex = 4
        smoothLbl.Parent = smoothRow

        local smoothBox = Instance.new('TextBox')

        smoothBox.AnchorPoint = Vector2.new(1, 0.5)
        smoothBox.Position = UDim2.new(1, -10, 0.5, 0)
        smoothBox.Size = UDim2.new(0, 70, 0, 24)
        smoothBox.BackgroundColor3 = rgb(30, 30, 40)
        smoothBox.TextColor3 = WHITE
        smoothBox.Text = tostring(AimbotSettings.Smoothness)
        smoothBox.Font = Enum.Font.GothamMedium
        smoothBox.TextSize = 13
        smoothBox.ZIndex = 5
        smoothBox.Parent = smoothRow

        corner(smoothBox, 6)
        stroke(smoothBox, WHITE, 1, 0.88)
        smoothBox.FocusLost:Connect(function()
            local v = tonumber(smoothBox.Text)

            if v then
                AimbotSettings.Smoothness = math.clamp(v, 0, 1)
                smoothBox.Text = tostring(AimbotSettings.Smoothness)
                smoothLbl.Text = 'Smooth: ' .. AimbotSettings.Smoothness
            else
                smoothBox.Text = tostring(AimbotSettings.Smoothness)
            end
        end)
        makeSeparator(sc, 12)

        local tgtRow = makeRow(sc, 13, 36)

        TargetBtn = Instance.new('TextButton')
        TargetBtn.Size = UDim2.new(1, 0, 1, 0)
        TargetBtn.BackgroundTransparency = 1
        TargetBtn.Text = 'Target: ' .. AimbotSettings.TargetPart
        TargetBtn.Font = Enum.Font.GothamBold
        TargetBtn.TextSize = 13
        TargetBtn.TextColor3 = WHITE
        TargetBtn.ZIndex = 4
        TargetBtn.Parent = tgtRow

        TargetBtn.MouseButton1Click:Connect(function()
            cycleTarget()
        end)
        tgtRow.MouseEnter:Connect(function()
            tw(tgtRow, 0.15, {BackgroundTransparency = 0.08})
        end)
        tgtRow.MouseLeave:Connect(function()
            tw(tgtRow, 0.2, {BackgroundTransparency = 0.28})
        end)
        makeSeparator(sc, 14)

        local FOVCircle = Instance.new('Frame')

        FOVCircle.AnchorPoint = Vector2.new(0.5, 0.5)
        FOVCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
        FOVCircle.Size = UDim2.new(0, AimbotSettings.FOV * 2, 0, AimbotSettings.FOV * 2)
        FOVCircle.BackgroundTransparency = 1
        FOVCircle.Visible = AimbotSettings.ShowFOV
        FOVCircle.ZIndex = 48
        FOVCircle.Parent = SG

        local fovCorner = Instance.new('UICorner')

        fovCorner.CornerRadius = UDim.new(1, 0)
        fovCorner.Parent = FOVCircle

        local fovStroke = Instance.new('UIStroke')

        fovStroke.Color = Color3.fromRGB(255, 0, 0)
        fovStroke.Thickness = 1.5
        fovStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        fovStroke.Parent = FOVCircle

        onTheme(function(p)
            fovStroke.Color = p
        end)
        makeToggle(sc, 'Show FOV Circle', 'ShowFOV', AimbotSettings, 15, function(v)
            FOVCircle.Visible = v
        end)
        makeSeparator(sc, 16)
        makeToggle(sc, 'Trigger Bot', 'TriggerBotEnabled', AimbotSettings, 17, function(v)
            notify('Trigger Bot', (v and 'Enabled') or 'Disabled', 2)
        end)
        makeSeparator(sc, 18)

        local tbDelayRow = makeRow(sc, 19, 36)
        local tbDelayLbl = Instance.new('TextLabel')

        tbDelayLbl.Size = UDim2.new(0.6, 0, 1, 0)
        tbDelayLbl.Position = UDim2.new(0, 14, 0, 0)
        tbDelayLbl.BackgroundTransparency = 1
        tbDelayLbl.Text = 'TB Delay: ' .. AimbotSettings.TriggerBotDelay .. 's'
        tbDelayLbl.Font = Enum.Font.GothamMedium
        tbDelayLbl.TextSize = 13
        tbDelayLbl.TextColor3 = rgb(215, 215, 228)
        tbDelayLbl.TextXAlignment = Enum.TextXAlignment.Left
        tbDelayLbl.ZIndex = 4
        tbDelayLbl.Parent = tbDelayRow

        local tbDelayBox = Instance.new('TextBox')

        tbDelayBox.AnchorPoint = Vector2.new(1, 0.5)
        tbDelayBox.Position = UDim2.new(1, -10, 0.5, 0)
        tbDelayBox.Size = UDim2.new(0, 70, 0, 24)
        tbDelayBox.BackgroundColor3 = rgb(30, 30, 40)
        tbDelayBox.TextColor3 = WHITE
        tbDelayBox.Text = tostring(AimbotSettings.TriggerBotDelay)
        tbDelayBox.Font = Enum.Font.GothamMedium
        tbDelayBox.TextSize = 13
        tbDelayBox.ZIndex = 5
        tbDelayBox.Parent = tbDelayRow

        corner(tbDelayBox, 6)
        stroke(tbDelayBox, WHITE, 1, 0.88)
        tbDelayBox.FocusLost:Connect(function()
            local v = tonumber(tbDelayBox.Text)

            if v then
                AimbotSettings.TriggerBotDelay = math.clamp(v, 0, 2)
                tbDelayBox.Text = tostring(AimbotSettings.TriggerBotDelay)
                tbDelayLbl.Text = 'TB Delay: ' .. AimbotSettings.TriggerBotDelay .. 's'
            else
                tbDelayBox.Text = tostring(AimbotSettings.TriggerBotDelay)
            end
        end)
        makeSeparator(sc, 20)

        local FriendsFrame = Instance.new('Frame')

        FriendsFrame.Size = UDim2.new(0, 220, 0, 320)
        FriendsFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        FriendsFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        FriendsFrame.BackgroundColor3 = rgb(14, 14, 20)
        FriendsFrame.Active = true
        FriendsFrame.Visible = false
        FriendsFrame.ZIndex = 60
        FriendsFrame.Parent = SG

        corner(FriendsFrame, 14)
        stroke(FriendsFrame, WHITE, 1.5, 0.1)

        local dimFriends = Instance.new('TextButton')

        dimFriends.Size = UDim2.new(1, 0, 1, 0)
        dimFriends.BackgroundColor3 = rgb(0, 0, 0)
        dimFriends.BackgroundTransparency = 0.55
        dimFriends.Text = ''
        dimFriends.AutoButtonColor = false
        dimFriends.ZIndex = 59
        dimFriends.Visible = false
        dimFriends.Parent = SG

        local fTitle = Instance.new('TextLabel')

        fTitle.Size = UDim2.new(1, -24, 0, 30)
        fTitle.Position = UDim2.new(0, 12, 0, 12)
        fTitle.BackgroundTransparency = 1
        fTitle.Text = 'Friend List'
        fTitle.Font = Enum.Font.GothamBold
        fTitle.TextSize = 16
        fTitle.TextColor3 = WHITE
        fTitle.ZIndex = 61
        fTitle.Parent = FriendsFrame

        onTheme(function(p)
            local g = fTitle:FindFirstChildOfClass('UIGradient') or Instance.new('UIGradient', fTitle)

            g.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, p),
                ColorSequenceKeypoint.new(0.5, WHITE),
                ColorSequenceKeypoint.new(1, p),
            })
        end)

        local fInput = Instance.new('TextBox')

        fInput.Size = UDim2.new(1, -24, 0, 30)
        fInput.Position = UDim2.new(0, 12, 0, 50)
        fInput.BackgroundColor3 = rgb(30, 30, 40)
        fInput.TextColor3 = WHITE
        fInput.PlaceholderText = 'Player name...'
        fInput.Font = Enum.Font.GothamMedium
        fInput.TextSize = 13
        fInput.Text = ''
        fInput.ZIndex = 61
        fInput.Parent = FriendsFrame

        corner(fInput, 8)
        stroke(fInput, WHITE, 1, 0.88)
        padding(fInput, 10, 0, 0, 0)

        local function makeFBtn(t, col, xpos)
            local b = Instance.new('TextButton')

            b.Size = UDim2.new(0.44, 0, 0, 28)
            b.Position = xpos
            b.BackgroundColor3 = col
            b.Text = t
            b.Font = Enum.Font.GothamBold
            b.TextSize = 13
            b.TextColor3 = WHITE
            b.AutoButtonColor = false
            b.ZIndex = 61
            b.Parent = FriendsFrame

            corner(b, 8)
            b.MouseEnter:Connect(function()
                tw(b, 0.15, {
                    BackgroundColor3 = col:Lerp(WHITE, 0.18),
                })
            end)
            b.MouseLeave:Connect(function()
                tw(b, 0.18, {BackgroundColor3 = col})
            end)
            b.MouseButton1Down:Connect(function()
                tw(b, 0.07, {
                    BackgroundColor3 = col:Lerp(rgb(0, 0, 0), 0.15),
                }, Enum.EasingStyle.Quad)
            end)
            b.MouseButton1Up:Connect(function()
                tw(b, 0.15, {BackgroundColor3 = col})
            end)

            return b
        end

        local addBtn = makeFBtn('Add', rgb(50, 175, 80), UDim2.new(0.05, 0, 0, 90))
        local removeBtn = makeFBtn('Remove', rgb(190, 55, 55), UDim2.new(0.51, 0, 0, 90))
        local fDisplay = Instance.new('ScrollingFrame')

        fDisplay.Size = UDim2.new(1, -24, 0, 130)
        fDisplay.Position = UDim2.new(0, 12, 0, 130)
        fDisplay.BackgroundColor3 = rgb(20, 20, 28)
        fDisplay.BorderSizePixel = 0
        fDisplay.ScrollBarThickness = 3
        fDisplay.CanvasSize = UDim2.new(0, 0, 0, 0)
        fDisplay.ZIndex = 61
        fDisplay.Parent = FriendsFrame

        corner(fDisplay, 8)
        onTheme(function(p)
            fDisplay.ScrollBarImageColor3 = p
        end)

        local emptyLbl = Instance.new('TextLabel')

        emptyLbl.Size = UDim2.new(1, 0, 0, 30)
        emptyLbl.Position = UDim2.new(0, 0, 0, 6)
        emptyLbl.BackgroundTransparency = 1
        emptyLbl.Text = 'No friends added'
        emptyLbl.TextColor3 = rgb(100, 100, 120)
        emptyLbl.Font = Enum.Font.GothamMedium
        emptyLbl.TextSize = 12
        emptyLbl.ZIndex = 62
        emptyLbl.Parent = fDisplay

        local backBtn = Instance.new('TextButton')

        backBtn.Size = UDim2.new(1, -24, 0, 30)
        backBtn.Position = UDim2.new(0, 12, 0, 272)
        backBtn.BackgroundColor3 = rgb(50, 50, 65)
        backBtn.Text = 'Close'
        backBtn.Font = Enum.Font.GothamBold
        backBtn.TextSize = 13
        backBtn.TextColor3 = WHITE
        backBtn.AutoButtonColor = false
        backBtn.ZIndex = 61
        backBtn.Parent = FriendsFrame

        corner(backBtn, 8)
        backBtn.MouseEnter:Connect(function()
            tw(backBtn, 0.15, {
                BackgroundColor3 = rgb(70, 70, 88),
            })
        end)
        backBtn.MouseLeave:Connect(function()
            tw(backBtn, 0.18, {
                BackgroundColor3 = rgb(50, 50, 65),
            })
        end)

        local function updateFriendDisplay()
            for _, child in pairs(fDisplay:GetChildren())do
                if (child ~= emptyLbl) then
                    child:Destroy()
                end
            end

            if (#FriendList == 0) then
                emptyLbl.Visible = true
                fDisplay.CanvasSize = UDim2.new(0, 0, 0, 0)

                return
            end

            emptyLbl.Visible = false

            local yOff = 0

            for _, name in pairs(FriendList)do
                local lbl = Instance.new('TextLabel')

                lbl.Size = UDim2.new(1, -10, 0, 26)
                lbl.Position = UDim2.new(0, 8, 0, yOff)
                lbl.BackgroundTransparency = 1
                lbl.Text = '\u{2022} ' .. name
                lbl.TextColor3 = WHITE
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Font = Enum.Font.GothamMedium
                lbl.TextSize = 12
                lbl.ZIndex = 62
                lbl.Parent = fDisplay
                yOff = yOff + 26
            end

            fDisplay.CanvasSize = UDim2.new(0, 0, 0, yOff)
        end
        local function closeFriendsPanel()
            tw(FriendsFrame, 0.22, {
                Size = UDim2.new(0, 0, 0, 0),
            }, Enum.EasingStyle.Quart)
            tw(dimFriends, 0.22, {BackgroundTransparency = 1})
            task.delay(0.24, function()
                FriendsFrame.Visible = false
                dimFriends.Visible = false
                FriendsFrame.Size = UDim2.new(0, 220, 0, 320)
            end)
        end
        local function openFriendsPanel()
            dimFriends.Visible = true
            FriendsFrame.Visible = true
            FriendsFrame.Size = UDim2.new(0, 0, 0, 0)

            tw(dimFriends, 0.22, {BackgroundTransparency = 0.55})
            twBack(FriendsFrame, 0.4, {
                Size = UDim2.new(0, 220, 0, 320),
            })
            updateFriendDisplay()
        end

        addBtn.MouseButton1Click:Connect(function()
            local name = fInput.Text:gsub('^%s*(.-)%s*$', '%1')

            if (name == '') then
                return
            end

            local player = Players:FindFirstChild(name)

            if not player then
                notify('Friend System', 'Player not found!', 2)

                return
            end

            for _, v in pairs(FriendList)do
                if (v == name) then
                    return
                end
            end

            table.insert(FriendList, name)

            fInput.Text = ''

            updateFriendDisplay()
            updatePlayerHighlight(player)
            notify('Friend added', name .. ' is now a friend.', 3)
        end)
        removeBtn.MouseButton1Click:Connect(function()
            local name = fInput.Text:gsub('^%s*(.-)%s*$', '%1')

            if (name == '') then
                return
            end

            for i, v in pairs(FriendList)do
                if (v == name) then
                    table.remove(FriendList, i)

                    fInput.Text = ''

                    updateFriendDisplay()

                    local player = Players:FindFirstChild(name)

                    if player then
                        updatePlayerHighlight(player)
                    end

                    notify('Friend removed', name .. ' removed from list.', 3)

                    return
                end
            end

            notify('Friend System', 'Not in friend list!', 2)
        end)
        backBtn.MouseButton1Click:Connect(closeFriendsPanel)
        dimFriends.MouseButton1Click:Connect(closeFriendsPanel)
        makeWideButton(sc, 'Friends List', rgb(65, 115, 210), 21, openFriendsPanel)
        makeSeparator(sc, 22)

        local tbRayParams = RaycastParams.new()

        tbRayParams.FilterType = Enum.RaycastFilterType.Exclude

        local tbCooldown = false

        local function triggerBotFire()
            if not AimbotSettings.TriggerBotEnabled then
                return
            end
            if tbCooldown then
                return
            end
            if not LP.Character then
                return
            end

            tbRayParams.FilterDescendantsInstances = {
                LP.Character,
            }

            local unitRay = Camera:ScreenPointToRay(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            local result = workspace:Raycast(unitRay.Origin, unitRay.Direction * 2000, tbRayParams)

            if not result then
                return
            end

            local hitModel = result.Instance and result.Instance:FindFirstAncestorOfClass('Model')

            if not hitModel then
                return
            end

            local hitPlayer = Players:GetPlayerFromCharacter(hitModel)

            if (not hitPlayer or (hitPlayer == LP)) then
                return
            end
            if isFriend(hitPlayer) then
                return
            end

            local hum = hitModel:FindFirstChildOfClass('Humanoid')

            if (not hum or (hum.Health <= 0)) then
                return
            end

            tbCooldown = true

            task.delay(AimbotSettings.TriggerBotDelay, function()
                _mouse1press()
                task.wait(0.05)
                _mouse1release()
                task.wait(0.08)

                tbCooldown = false
            end)
        end

        conn(UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then
                return
            end
            if (input.KeyCode == Enum.KeyCode.T) then
                cycleTarget()
            end
            if (input.KeyCode == Enum.KeyCode.F) then
                AimbotSettings.ShowFOV = not AimbotSettings.ShowFOV
                FOVCircle.Visible = AimbotSettings.ShowFOV
            end
        end))
        conn(RunService.RenderStepped:Connect(function()
            FOVCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
            FOVCircle.Size = UDim2.new(0, AimbotSettings.FOV * 2, 0, AimbotSettings.FOV * 2)

            if AimbotSettings.AimbotEnabled then
                local target = getClosestPlayer()

                if (target and target.Character) then
                    local part = target.Character:FindFirstChild(AimbotSettings.TargetPart) or target.Character:FindFirstChild('HumanoidRootPart')

                    if part then
                        local targetCF = CFrame.new(Camera.CFrame.Position, part.Position)

                        Camera.CFrame = Camera.CFrame:Lerp(targetCF, 1 - AimbotSettings.Smoothness)
                    end
                end
            end

            triggerBotFire()
        end))

        local savedWrap = Instance.new('Frame')

        savedWrap.AnchorPoint = Vector2.new(0.5, 1)
        savedWrap.Position = UDim2.new(0.5, 0, 1, 0)
        savedWrap.Size = UDim2.new(1, 0, 0, 38)
        savedWrap.BackgroundTransparency = 1
        savedWrap.ZIndex = 4
        savedWrap.Parent = page

        makeWideButton(savedWrap, 'Save Settings', rgb(50, 170, 80), 0, function()
            saveConfig()
            notify('Saved', 'Settings stored.', 3)
        end)
    end

    local frozen = false

    local function showLoading()
        local ov = Instance.new('Frame')

        ov.Size = UDim2.new(1, 0, 1, 0)
        ov.BackgroundColor3 = rgb(14, 14, 18)
        ov.BackgroundTransparency = 0.3
        ov.ZIndex = 30
        ov.Parent = win

        local ring = Instance.new('Frame')

        ring.AnchorPoint = Vector2.new(0.5, 0.5)
        ring.Position = UDim2.new(0.5, 0, 0.45, 0)
        ring.Size = UDim2.new(0, 44, 0, 44)
        ring.BackgroundTransparency = 1
        ring.ZIndex = 31
        ring.Parent = ov

        corner(ring, 22)

        local rs = stroke(ring, WHITE, 3, 0)
        local rg = Instance.new('UIGradient')

        rg.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.65, 1),
            NumberSequenceKeypoint.new(1, 1),
        })
        rg.Parent = rs

        onTheme(function(p)
            rs.Color = p
        end)

        local lbl = Instance.new('TextLabel')

        lbl.AnchorPoint = Vector2.new(0.5, 0)
        lbl.Position = UDim2.new(0.5, 0, 0.68, 0)
        lbl.Size = UDim2.new(1, 0, 0, 20)
        lbl.BackgroundTransparency = 1
        lbl.Text = 'Applying...'
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 13
        lbl.TextColor3 = WHITE
        lbl.ZIndex = 31
        lbl.Parent = ov

        local running = true

        task.spawn(function()
            local dots = 0

            while running do
                dots = (dots % 3) + 1
                lbl.Text = 'Applying' .. string.rep('.', dots)

                task.wait(0.35)
            end
        end)

        local spin

        spin = RunService.RenderStepped:Connect(function()
            if ov.Parent then
                rg.Rotation = (rg.Rotation + 7) % 360
            else
                spin:Disconnect()
            end
        end)

        return function()
            running = false

            if spin then
                spin:Disconnect()
            end

            tw(ov, 0.28, {BackgroundTransparency = 1})
            task.delay(0.3, function()
                if ov then
                    ov:Destroy()
                end
            end)
        end
    end
    local function changeColor(key)
        if frozen then
            return
        end

        frozen = true

        local newColor = PRESETS[key].c
        local snapshot = win:GetDescendants()
        local closeLoading = showLoading()

        tw(win, 0.45, {BackgroundTransparency = 0.45})

        for _, d in ipairs(snapshot)do
            if (d:IsA('TextLabel') or d:IsA('TextButton')) then
                pcall(function()
                    tw(d, 0.45, {TextTransparency = 0.55})
                end)
            end
        end

        task.wait(0.45)

        local start = theme.primary
        local t0 = os.clock()

        while(os.clock() - t0) < 2.2 do
            local a = math.sin((((os.clock() - t0) / 2.2) * math.pi) / 2)

            theme.primary = start:Lerp(newColor, a)

            applyTheme()
            RunService.RenderStepped:Wait()
        end

        theme.primary = newColor
        theme.key = key

        applyTheme()
        tw(win, 0.45, {BackgroundTransparency = 0.04})

        for _, d in ipairs(snapshot)do
            if (d:IsA('TextLabel') or d:IsA('TextButton')) then
                pcall(function()
                    tw(d, 0.45, {TextTransparency = 0})
                end)
            end
        end

        task.wait(0.45)
        closeLoading()

        frozen = false

        saveConfig()
        notify('Color applied', 'Theme: ' .. PRESETS[key].name, 4)
    end

    do
        local sc = sections.Settings.scroll

        makeHeading(sc, 'Settings', 1)
        makeSeparator(sc, 2)

        local capt = Instance.new('TextLabel')

        capt.Size = UDim2.new(1, 0, 0, 18)
        capt.BackgroundTransparency = 1
        capt.Text = 'Accent color'
        capt.Font = Enum.Font.GothamBold
        capt.TextSize = 12
        capt.TextColor3 = rgb(155, 155, 170)
        capt.TextXAlignment = Enum.TextXAlignment.Left
        capt.LayoutOrder = 3
        capt.ZIndex = 3
        capt.Parent = sc

        local colorGrid = Instance.new('Frame')

        colorGrid.Size = UDim2.new(1, 0, 0, 78)
        colorGrid.BackgroundTransparency = 1
        colorGrid.LayoutOrder = 4
        colorGrid.ZIndex = 3
        colorGrid.Parent = sc

        local gridLayout = Instance.new('UIGridLayout')

        gridLayout.CellSize = UDim2.new(0.25, -4, 0, 32)
        gridLayout.CellPadding = UDim2.new(0, 5, 0, 6)
        gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
        gridLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        gridLayout.Parent = colorGrid

        local function makePill(key, c1)
            local wrap = Instance.new('Frame')

            wrap.BackgroundTransparency = 1
            wrap.ZIndex = 4
            wrap.Parent = colorGrid

            local b = Instance.new('TextButton')

            b.Size = UDim2.new(1, 0, 1, 0)
            b.BackgroundColor3 = c1
            b.Text = ''
            b.AutoButtonColor = false
            b.ZIndex = 5
            b.Parent = wrap

            corner(b, 9)

            local pname = Instance.new('TextLabel')

            pname.Size = UDim2.new(1, 0, 1, 0)
            pname.BackgroundTransparency = 1
            pname.Text = PRESETS[key].name
            pname.Font = Enum.Font.GothamBold
            pname.TextSize = 11
            pname.TextColor3 = WHITE
            pname.ZIndex = 6
            pname.Parent = b

            local shine = Instance.new('Frame')

            shine.Size = UDim2.new(1, 0, 0.45, 0)
            shine.BackgroundColor3 = WHITE
            shine.BackgroundTransparency = 0.82
            shine.BorderSizePixel = 0
            shine.ZIndex = 6
            shine.Parent = b

            corner(shine, 9)

            local selected = stroke(b, rgb(200, 200, 220), 2, 0.6)

            b.MouseEnter:Connect(function()
                tw(b, 0.15, {
                    BackgroundColor3 = c1:Lerp(WHITE, 0.22),
                })
                twBack(b, 0.18, {
                    Size = UDim2.new(1, 4, 1, 4),
                })
                tw(selected, 0.15, {Transparency = 0})
            end)
            b.MouseLeave:Connect(function()
                tw(b, 0.18, {BackgroundColor3 = c1})
                tw(b, 0.18, {
                    Size = UDim2.new(1, 0, 1, 0),
                })

                if (theme.key ~= key) then
                    tw(selected, 0.18, {Transparency = 0.7})
                end
            end)
            b.MouseButton1Down:Connect(function()
                tw(b, 0.07, {
                    BackgroundColor3 = c1:Lerp(rgb(0, 0, 0), 0.18),
                }, Enum.EasingStyle.Quad)
            end)
            b.MouseButton1Click:Connect(function()
                twBack(b, 0.18, {BackgroundColor3 = c1})
                task.spawn(function()
                    changeColor(key)
                end)
            end)
            onTheme(function(_)
                if (theme.key == key) then
                    tw(selected, 0.2, {Transparency = 0})
                else
                    tw(selected, 0.2, {Transparency = 0.7})
                end
            end)
        end

        local colorOrder = {
            'red',
            'blue',
            'green',
            'purple',
            'yellow',
            'pink',
            'cyan',
            'orange',
        }

        for _, key in ipairs(colorOrder)do
            makePill(key, PRESETS[key].c)
        end

        makeSeparator(sc, 5)

        local mapHeading = Instance.new('TextLabel')

        mapHeading.Size = UDim2.new(1, 0, 0, 20)
        mapHeading.BackgroundTransparency = 1
        mapHeading.Text = '2D Minimap'
        mapHeading.Font = Enum.Font.GothamBold
        mapHeading.TextSize = 12
        mapHeading.TextColor3 = rgb(155, 155, 170)
        mapHeading.TextXAlignment = Enum.TextXAlignment.Left
        mapHeading.LayoutOrder = 6
        mapHeading.ZIndex = 3
        mapHeading.Parent = sc

        local function updateMapCorner()
            local r = math.floor(MapSettings.Size / 2)

            corner(mapFrame, r)
            corner(mapBg, r)

            mapFrame.Size = UDim2.new(0, MapSettings.Size, 0, MapSettings.Size)
        end

        makeToggle(sc, 'Enable 2D Map', 'Enabled', MapSettings, 7, function(v)
            if v then
                mapFrame.Visible = true
                mapFrame.Size = UDim2.new(0, 0, 0, 0)

                twBack(mapFrame, 0.45, {
                    Size = UDim2.new(0, MapSettings.Size, 0, MapSettings.Size),
                })
                notify('2D Map', 'Minimap enabled.', 3)
            else
                tw(mapFrame, 0.3, {
                    Size = UDim2.new(0, 0, 0, 0),
                }, Enum.EasingStyle.Quart)
                task.delay(0.32, function()
                    mapFrame.Visible = false
                end)
                notify('2D Map', 'Minimap disabled.', 2)
            end
        end)
        makeSeparator(sc, 8)

        local mapSzRow = makeRow(sc, 9, 36)
        local mapSzLbl = Instance.new('TextLabel')

        mapSzLbl.Size = UDim2.new(0.6, 0, 1, 0)
        mapSzLbl.Position = UDim2.new(0, 14, 0, 0)
        mapSzLbl.BackgroundTransparency = 1
        mapSzLbl.Text = 'Map Size: ' .. MapSettings.Size
        mapSzLbl.Font = Enum.Font.GothamMedium
        mapSzLbl.TextSize = 13
        mapSzLbl.TextColor3 = rgb(215, 215, 228)
        mapSzLbl.TextXAlignment = Enum.TextXAlignment.Left
        mapSzLbl.ZIndex = 4
        mapSzLbl.Parent = mapSzRow

        local mapSzBox = Instance.new('TextBox')

        mapSzBox.AnchorPoint = Vector2.new(1, 0.5)
        mapSzBox.Position = UDim2.new(1, -10, 0.5, 0)
        mapSzBox.Size = UDim2.new(0, 70, 0, 24)
        mapSzBox.BackgroundColor3 = rgb(30, 30, 40)
        mapSzBox.TextColor3 = WHITE
        mapSzBox.Text = tostring(MapSettings.Size)
        mapSzBox.Font = Enum.Font.GothamMedium
        mapSzBox.TextSize = 13
        mapSzBox.ZIndex = 5
        mapSzBox.Parent = mapSzRow

        corner(mapSzBox, 6)
        stroke(mapSzBox, WHITE, 1, 0.88)
        mapSzBox.FocusLost:Connect(function()
            local v = tonumber(mapSzBox.Text)

            if v then
                MapSettings.Size = math.clamp(math.floor(v), 80, 400)
                mapSzBox.Text = tostring(MapSettings.Size)
                mapSzLbl.Text = 'Map Size: ' .. MapSettings.Size

                updateMapCorner()
            else
                mapSzBox.Text = tostring(MapSettings.Size)
            end
        end)
        makeSeparator(sc, 10)

        local mapRadRow = makeRow(sc, 11, 36)
        local mapRadLbl = Instance.new('TextLabel')

        mapRadLbl.Size = UDim2.new(0.6, 0, 1, 0)
        mapRadLbl.Position = UDim2.new(0, 14, 0, 0)
        mapRadLbl.BackgroundTransparency = 1
        mapRadLbl.Text = 'World Radius: ' .. MapSettings.WorldRadius
        mapRadLbl.Font = Enum.Font.GothamMedium
        mapRadLbl.TextSize = 13
        mapRadLbl.TextColor3 = rgb(215, 215, 228)
        mapRadLbl.TextXAlignment = Enum.TextXAlignment.Left
        mapRadLbl.ZIndex = 4
        mapRadLbl.Parent = mapRadRow

        local mapRadBox = Instance.new('TextBox')

        mapRadBox.AnchorPoint = Vector2.new(1, 0.5)
        mapRadBox.Position = UDim2.new(1, -10, 0.5, 0)
        mapRadBox.Size = UDim2.new(0, 70, 0, 24)
        mapRadBox.BackgroundColor3 = rgb(30, 30, 40)
        mapRadBox.TextColor3 = WHITE
        mapRadBox.Text = tostring(MapSettings.WorldRadius)
        mapRadBox.Font = Enum.Font.GothamMedium
        mapRadBox.TextSize = 13
        mapRadBox.ZIndex = 5
        mapRadBox.Parent = mapRadRow

        corner(mapRadBox, 6)
        stroke(mapRadBox, WHITE, 1, 0.88)
        mapRadBox.FocusLost:Connect(function()
            local v = tonumber(mapRadBox.Text)

            if v then
                MapSettings.WorldRadius = math.clamp(math.floor(v), 50, 2000)
                mapRadBox.Text = tostring(MapSettings.WorldRadius)
                mapRadLbl.Text = 'World Radius: ' .. MapSettings.WorldRadius
            else
                mapRadBox.Text = tostring(MapSettings.WorldRadius)
            end
        end)
        makeSeparator(sc, 12)
        makeWideButton(sc, 'Move Map Position', rgb(80, 80, 200), 13, function()
            if not MapSettings.Enabled then
                notify('2D Map', 'Enable the map first!', 2)

                return
            end

            enterMapMoveMode()
        end)
        makeSeparator(sc, 14)
        makeWideButton(sc, 'Resize Window', rgb(65, 115, 210), 15, function()
            if enterResize then
                enterResize()
            end
        end)
        makeSeparator(sc, 16)
        makeWideButton(sc, 'Save All', rgb(50, 170, 80), 17, function()
            saveConfig()
            notify('Saved', 'All settings saved.', 3)
        end)
        makeWideButton(sc, 'Reset to Defaults', rgb(190, 55, 55), 18, function()
            showConfirm('Reset everything?', 'Color is kept. All other settings revert.', function()
                for k, v in pairs(defaults)do
                    cfg[k] = v
                end

                if applyWindowSize then
                    applyWindowSize(defaults.win_w, defaults.win_h, true)
                end

                saveConfig()
                notify('Reset', 'Settings restored to defaults.', 3)
            end)
        end)
    end

    local function doClose()
        tw(body, 0.38, {
            Position = UDim2.new(0, 0, 0, HEADER_H + 36),
        }, Enum.EasingStyle.Quart)

        for _, d in ipairs(body:GetDescendants())do
            if (d:IsA('TextLabel') or d:IsA('TextButton')) then
                pcall(function()
                    tw(d, 0.35, {TextTransparency = 1})
                end)
            end
        end

        tw(header, 0.38, {BackgroundTransparency = 1})

        for _, d in ipairs(header:GetDescendants())do
            if (d:IsA('TextLabel') or d:IsA('TextButton')) then
                pcall(function()
                    tw(d, 0.35, {TextTransparency = 1})
                end)
            end
        end

        task.delay(0.4, function()
            body.Visible = false
            header.Visible = false

            local bye = Instance.new('TextLabel')

            bye.AnchorPoint = Vector2.new(0.5, 0.5)
            bye.Position = UDim2.new(0.5, 0, 0.5, 0)
            bye.Size = UDim2.new(1, -20, 0, 44)
            bye.BackgroundTransparency = 1
            bye.Text = 'See you soon  \u{2726}'
            bye.Font = Enum.Font.GothamBlack
            bye.TextSize = 26
            bye.TextColor3 = WHITE
            bye.TextTransparency = 1
            bye.ZIndex = 10
            bye.Parent = win

            local byeGrad = Instance.new('UIGradient')

            byeGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, theme.primary),
                ColorSequenceKeypoint.new(0.5, WHITE),
                ColorSequenceKeypoint.new(1, theme.primary),
            })
            byeGrad.Parent = bye

            tw(bye, 1.2, {TextTransparency = 0}, Enum.EasingStyle.Quart)
            task.spawn(function()
                local cols = {
                    rgb(235, 60, 60),
                    rgb(60, 130, 255),
                    rgb(60, 210, 110),
                    rgb(160, 80, 255),
                }
                local i = 1

                while bye.Parent do
                    i = (i % #cols) + 1
                    byeGrad.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, cols[i]),
                        ColorSequenceKeypoint.new(0.5, WHITE),
                        ColorSequenceKeypoint.new(1, cols[i]),
                    })

                    task.wait(1.2)
                end
            end)
            task.delay(3, function()
                tw(bye, 0.9, {TextTransparency = 1})
                tw(win, 1, {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, W, 0, 8),
                }, Enum.EasingStyle.Quart)
                tw(shadow, 1, {BackgroundTransparency = 1}, Enum.EasingStyle.Quart)

                winStroke.Transparency = 1

                tw(wave, 1, {BackgroundTransparency = 1})
            end)
            task.delay(4.2, function()
                for _, c in ipairs(connections)do
                    pcall(function()
                        c:Disconnect()
                    end)
                end

                pcall(function()
                    SG:Destroy()
                end)
            end)
        end)
    end

    closeBtn.MouseButton1Click:Connect(function()
        showConfirm('Close Universal?', 'Script will unload.', doClose)
    end)

    local ORB_SZ = 44
    local orb = Instance.new('TextButton')

    orb.AnchorPoint = Vector2.new(0.5, 0.5)
    orb.Size = UDim2.new(0, ORB_SZ, 0, ORB_SZ)
    orb.Position = UDim2.new(0, 44, 0.42, 0)
    orb.BackgroundColor3 = rgb(22, 22, 30)
    orb.BackgroundTransparency = 0.08
    orb.AutoButtonColor = false
    orb.Text = VMARK
    orb.Font = Enum.Font.GothamBold
    orb.TextSize = 17
    orb.TextColor3 = WHITE
    orb.ZIndex = 46
    orb.Active = true
    orb.Parent = SG

    corner(orb, ORB_SZ / 2)

    local orbStroke = stroke(orb, rgb(55, 55, 70), 1.8, 0)
    local orbGrad = Instance.new('UIGradient')

    orbGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, rgb(35, 35, 48)),
        ColorSequenceKeypoint.new(0.5, rgb(70, 70, 90)),
        ColorSequenceKeypoint.new(1, rgb(35, 35, 48)),
    })
    orbGrad.Parent = orbStroke

    onTheme(function(p)
        orbGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, p:Lerp(rgb(0, 0, 0), 0.72)),
            ColorSequenceKeypoint.new(0.5, p:Lerp(rgb(255, 255, 255), 0.1)),
            ColorSequenceKeypoint.new(1, p:Lerp(rgb(0, 0, 0), 0.72)),
        })
    end)

    local orbTextGrad = Instance.new('UIGradient')

    orbTextGrad.Parent = orb

    onTheme(function(p)
        orbTextGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, p),
            ColorSequenceKeypoint.new(1, WHITE),
        })
    end)

    local orbInner = Instance.new('Frame')

    orbInner.AnchorPoint = Vector2.new(0.5, 0.5)
    orbInner.Position = UDim2.new(0.5, 0, 0.5, 0)
    orbInner.Size = UDim2.new(0.7, 0, 0.7, 0)
    orbInner.BackgroundTransparency = 1
    orbInner.ZIndex = 45
    orbInner.Parent = orb

    corner(orbInner, 18)

    local orbIS = stroke(orbInner, WHITE, 1, 0.78)

    onTheme(function(p)
        orbIS.Color = p
    end)
    task.spawn(function()
        while orb.Parent do
            orbGrad.Rotation = (orbGrad.Rotation + 1.3) % 360

            if not orbBusy then
                local t = os.clock()
                local pulse = 1 + (math.sin(t * 2.2) * 0.04)
                local s = ORB_SZ * pulse

                orb.Size = UDim2.new(0, s, 0, s)
            end

            RunService.RenderStepped:Wait()
        end
    end)

    local orbCenterX, orbCenterY = 0, 0

    task.defer(function()
        local ap = orb.AbsolutePosition
        local as = orb.AbsoluteSize

        orbCenterX = ap.X + (as.X / 2)
        orbCenterY = ap.Y + (as.Y / 2)
        orb.Position = UDim2.new(0, orbCenterX, 0, orbCenterY)
    end)

    local windowShown = true

    local function setWindow(show)
        windowShown = show

        if show then
            win.Visible = true
            shadow.Visible = true
            win.Size = UDim2.new(0, W, 0, 8)
            shadow.Size = UDim2.new(0, W + 32, 0, 8)

            twBack(win, 0.48, {
                Size = UDim2.new(0, W, 0, H),
            })
            twBack(shadow, 0.48, {
                Size = UDim2.new(0, W + 32, 0, H + 32),
            })
        else
            tw(win, 0.32, {
                Size = UDim2.new(0, W, 0, 8),
            }, Enum.EasingStyle.Quart)
            tw(shadow, 0.32, {
                Size = UDim2.new(0, W + 32, 0, 8),
            }, Enum.EasingStyle.Quart)
            task.delay(0.34, function()
                if not windowShown then
                    win.Visible = false
                    shadow.Visible = false
                end
            end)
        end
    end

    do
        local dragging, moved = false, false
        local startMouseX, startMouseY = 0, 0
        local startOrbX, startOrbY = 0, 0

        orb.InputBegan:Connect(function(i)
            if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
                dragging = true
                moved = false
                orbBusy = true

                local mpos = UserInputService:GetMouseLocation()

                startMouseX = mpos.X
                startMouseY = mpos.Y
                startOrbX = orbCenterX
                startOrbY = orbCenterY

                tw(orb, 0.1, {
                    Size = UDim2.new(0, ORB_SZ - 6, 0, ORB_SZ - 6),
                }, Enum.EasingStyle.Quad)
            end
        end)
        conn(UserInputService.InputChanged:Connect(function(i)
            if (dragging and ((i.UserInputType == Enum.UserInputType.MouseMovement) or (i.UserInputType == Enum.UserInputType.Touch))) then
                local mpos = UserInputService:GetMouseLocation()
                local dx = mpos.X - startMouseX
                local dy = mpos.Y - startMouseY

                if ((math.abs(dx) > 3) or (math.abs(dy) > 3)) then
                    moved = true
                end

                orbCenterX = startOrbX + dx
                orbCenterY = startOrbY + dy
                orb.Position = UDim2.new(0, orbCenterX, 0, orbCenterY)
            end
        end))
        conn(UserInputService.InputEnded:Connect(function(i)
            if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
                if dragging then
                    twBack(orb, 0.24, {
                        Size = UDim2.new(0, ORB_SZ, 0, ORB_SZ),
                    })

                    if not moved then
                        setWindow(not windowShown)
                    end

                    task.delay(0.24, function()
                        orbBusy = false
                    end)
                end

                dragging = false
            end
        end))
    end

    minBtn.MouseButton1Click:Connect(function()
        setWindow(false)
    end)

    local MIN_W, MAX_W = 360, 800
    local MIN_H, MAX_H = 240, 520

    function applyWindowSize(w, h, animate)
        W = math.clamp(math.floor(w), MIN_W, MAX_W)
        H = math.clamp(math.floor(h), MIN_H, MAX_H)
        cfg.win_w, cfg.win_h = W, H

        if windowShown then
            if animate then
                twBack(win, 0.3, {
                    Size = UDim2.new(0, W, 0, H),
                })
                twBack(shadow, 0.3, {
                    Size = UDim2.new(0, W + 32, 0, H + 32),
                })
            else
                win.Size = UDim2.new(0, W, 0, H)
                shadow.Size = UDim2.new(0, W + 32, 0, H + 32)
            end
        end
    end

    do
        local dim = Instance.new('TextButton')

        dim.Size = UDim2.new(1, 0, 1, 0)
        dim.BackgroundColor3 = rgb(0, 0, 0)
        dim.BackgroundTransparency = 1
        dim.Text = ''
        dim.AutoButtonColor = false
        dim.Visible = false
        dim.ZIndex = 50
        dim.Parent = win

        local actions = Instance.new('Frame')

        actions.AnchorPoint = Vector2.new(0.5, 0.5)
        actions.Position = UDim2.new(0.5, 0, 0.5, 0)
        actions.Size = UDim2.new(0, 232, 0, 44)
        actions.BackgroundTransparency = 1
        actions.Visible = false
        actions.ZIndex = 52
        actions.Parent = win

        local al = Instance.new('UIListLayout')

        al.FillDirection = Enum.FillDirection.Horizontal
        al.Padding = UDim.new(0, 14)
        al.HorizontalAlignment = Enum.HorizontalAlignment.Center
        al.VerticalAlignment = Enum.VerticalAlignment.Center
        al.Parent = actions

        local function actBtn(text, color)
            local b = Instance.new('TextButton')

            b.Size = UDim2.new(0, 108, 0, 40)
            b.BackgroundColor3 = color
            b.Text = text
            b.Font = Enum.Font.GothamBold
            b.TextSize = 14
            b.TextColor3 = WHITE
            b.AutoButtonColor = false
            b.ZIndex = 53
            b.Parent = actions

            corner(b, 10)
            stroke(b, WHITE, 1, 0.82)
            b.MouseEnter:Connect(function()
                tw(b, 0.15, {
                    BackgroundColor3 = color:Lerp(WHITE, 0.16),
                    Size = UDim2.new(0, 112, 0, 42),
                })
            end)
            b.MouseLeave:Connect(function()
                tw(b, 0.18, {
                    BackgroundColor3 = color,
                    Size = UDim2.new(0, 108, 0, 40),
                })
            end)
            b.MouseButton1Down:Connect(function()
                tw(b, 0.07, {
                    BackgroundColor3 = color:Lerp(rgb(0, 0, 0), 0.15),
                }, Enum.EasingStyle.Quad)
            end)
            b.MouseButton1Up:Connect(function()
                tw(b, 0.15, {BackgroundColor3 = color})
            end)

            return b
        end

        local saveBtn = actBtn('Save', rgb(50, 175, 80))
        local exitBtn = actBtn('Exit', rgb(190, 55, 55))
        local handles = {}
        local startW, startH, startMouse, activeHandle
        local sessionStartW, sessionStartH = 0, 0

        local function makeHandle(edge)
            local h = Instance.new('TextButton')

            h.Text = ''
            h.AutoButtonColor = false
            h.BackgroundColor3 = WHITE
            h.BackgroundTransparency = 0.2
            h.Visible = false
            h.ZIndex = 55
            h.Parent = win

            corner(h, 5)

            local hg = Instance.new('UIGradient')

            hg.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, rgb(42, 42, 56)),
                ColorSequenceKeypoint.new(0.5, rgb(72, 72, 90)),
                ColorSequenceKeypoint.new(1, rgb(42, 42, 56)),
            })
            hg.Parent = h

            onTheme(function(p)
                hg.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, p:Lerp(rgb(0, 0, 0), 0.6)),
                    ColorSequenceKeypoint.new(0.5, p:Lerp(WHITE, 0.2)),
                    ColorSequenceKeypoint.new(1, p:Lerp(rgb(0, 0, 0), 0.6)),
                })
            end)

            if (edge == 'left') then
                h.AnchorPoint = Vector2.new(0, 0.5)
                h.Position = UDim2.new(0, 4, 0.5, 0)
                h.Size = UDim2.new(0, 7, 0, 64)
            elseif (edge == 'right') then
                h.AnchorPoint = Vector2.new(1, 0.5)
                h.Position = UDim2.new(1, -4, 0.5, 0)
                h.Size = UDim2.new(0, 7, 0, 64)
            elseif (edge == 'top') then
                h.AnchorPoint = Vector2.new(0.5, 0)
                h.Position = UDim2.new(0.5, 0, 0, 4)
                h.Size = UDim2.new(0, 74, 0, 7)
            else
                h.AnchorPoint = Vector2.new(0.5, 1)
                h.Position = UDim2.new(0.5, 0, 1, -4)
                h.Size = UDim2.new(0, 74, 0, 7)
            end

            h.InputBegan:Connect(function(i)
                if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
                    activeHandle = edge
                    startW, startH = W, H
                    startMouse = UserInputService:GetMouseLocation()

                    tw(h, 0.12, {BackgroundTransparency = 0})
                end
            end)
            h.MouseEnter:Connect(function()
                tw(h, 0.12, {BackgroundTransparency = 0.04})
            end)
            h.MouseLeave:Connect(function()
                if (activeHandle ~= edge) then
                    tw(h, 0.15, {BackgroundTransparency = 0.2})
                end
            end)

            handles[edge] = h
        end

        makeHandle('left')
        makeHandle('right')
        makeHandle('top')
        makeHandle('bottom')
        conn(UserInputService.InputChanged:Connect(function(i)
            if (activeHandle and ((i.UserInputType == Enum.UserInputType.MouseMovement) or (i.UserInputType == Enum.UserInputType.Touch))) then
                local d = UserInputService:GetMouseLocation() - startMouse

                if (activeHandle == 'right') then
                    applyWindowSize(startW + (d.X * 2), H)
                elseif (activeHandle == 'left') then
                    applyWindowSize(startW - (d.X * 2), H)
                elseif (activeHandle == 'bottom') then
                    applyWindowSize(W, startH + (d.Y * 2))
                elseif (activeHandle == 'top') then
                    applyWindowSize(W, startH - (d.Y * 2))
                end
            end
        end))
        conn(UserInputService.InputEnded:Connect(function(i)
            if ((i.UserInputType == Enum.UserInputType.MouseButton1) or (i.UserInputType == Enum.UserInputType.Touch)) then
                if (activeHandle and handles[activeHandle]) then
                    tw(handles[activeHandle], 0.15, {BackgroundTransparency = 0.2})
                end

                activeHandle = nil
            end
        end))

        local function setResizeVisual(on)
            dim.Visible = true
            actions.Visible = true

            for _, h in pairs(handles)do
                h.Visible = true
            end

            if on then
                tw(dim, 0.28, {BackgroundTransparency = 0.52})
            end
        end
        local function finishResize()
            resizeActive = false

            tw(dim, 0.25, {BackgroundTransparency = 1})

            for _, h in pairs(handles)do
                tw(h, 0.2, {BackgroundTransparency = 1})
            end

            task.delay(0.27, function()
                if not resizeActive then
                    dim.Visible = false
                    actions.Visible = false

                    for _, h in pairs(handles)do
                        h.Visible = false
                        h.BackgroundTransparency = 0.2
                    end
                end
            end)
        end

        function enterResize()
            if resizeActive then
                return
            end

            resizeActive = true
            sessionStartW, sessionStartH = W, H

            setResizeVisual(true)
            notify('Resize mode', 'Drag handles to resize.', 6)
        end

        saveBtn.MouseButton1Click:Connect(function()
            saveConfig()
            finishResize()
            notify('Size saved', 'Window size stored.', 3)
        end)
        exitBtn.MouseButton1Click:Connect(function()
            if ((W == sessionStartW) and (H == sessionStartH)) then
                finishResize()

                return
            end

            actions.Visible = false

            showConfirm('Keep new size?', 'Save the current size or revert?', function()
                saveConfig()
                finishResize()
                notify('Size saved', 'New size kept.', 3)
            end, {
                yesText = 'Keep',
                noText = 'Revert',
                noDismiss = true,
                onNo = function()
                    applyWindowSize(sessionStartW, sessionStartH, true)
                    finishResize()
                end,
            })
        end)
    end

    local prevSection = 'Home'

    gearBtn.MouseButton1Click:Connect(function()
        settingsOpen = not settingsOpen

        if settingsOpen then
            prevSection = currentSection

            for _, sec in pairs(sections)do
                sec.page.Visible = false
            end

            sections.Settings.page.Visible = true

            for _, data in pairs(navButtons)do
                tw(data.btn, 0.22, {BackgroundTransparency = 1})
                tw(data.line, 0.22, {
                    Size = UDim2.new(0, 0, 0, 3),
                })

                data.line.Visible = false
            end

            tw(gearBtn, 0.2, {
                TextColor3 = theme.primary,
            })
        else
            sections.Settings.page.Visible = false

            tw(gearBtn, 0.2, {
                TextColor3 = rgb(160, 160, 175),
            })
            selectSection(prevSection)
        end
    end)
    onTheme(function(p)
        if settingsOpen then
            tw(gearBtn, 0.2, {TextColor3 = p})
        end
    end)
    task.spawn(function()
        while SG.Parent do
            local t0 = os.clock()
            local dur = 10

            while(os.clock() - t0) < dur do
                if SG.Parent then
                    borderGrad.Rotation = ((os.clock() - t0) / dur) * 360
                end

                RunService.RenderStepped:Wait()
            end

            borderGrad.Rotation = 0

            task.wait(0.5)
        end
    end)
    conn(RunService.RenderStepped:Connect(function()
        local t = os.clock()

        waveGrad.Offset = Vector2.new(((t * 0.08) % 2) - 1, 0)
        wave.BackgroundTransparency = 0.52 + (0.12 * math.sin(t * 0.8))
        titleGrad.Offset = Vector2.new(math.sin(t * 0.65) * 0.45, 0)
        shadow.BackgroundTransparency = 0.7 + (0.08 * math.sin(t * 0.55))
        vmarkGrad.Offset = Vector2.new(math.sin(t * 1.1) * 0.3, 0)
        mapMoveLabelGrad.Offset = Vector2.new(math.sin(t * 0.65) * 0.45, 0)
    end))
    selectSection('Home')
    applyTheme()

    win.Size = UDim2.new(0, W, 0, 8)
    shadow.Size = UDim2.new(0, W + 32, 0, 8)

    task.wait()
    twBack(win, 0.52, {
        Size = UDim2.new(0, W, 0, H),
    })
    twBack(shadow, 0.52, {
        Size = UDim2.new(0, W + 32, 0, H + 32),
    })
    task.delay(0.4, function()
        notify('Welcome to ' .. VMARK .. ' Hub!', 'The script was created by the Vanezy Scripts team.', 7)
    end)
end
