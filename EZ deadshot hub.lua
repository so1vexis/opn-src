
-- ============================================================
-- DEADSHOT HUB v33.0 — ontop.lua Edition
-- ItsZorlux / Godfather-team
-- UI: github.com/tsBelrux/dsui (ontop.lua)
-- YENİ: DS Toggle Btn | Wraith Fling | Wraith Autofarm
--       Streaming Mode | QB Presets | Kill Counter HUD
--       Round Timer HUD | Role Toast | Crosshair Overlay
-- ============================================================

repeat task.wait() until game:IsLoaded()

-- ===== UI LIBRARY =====
local UI
local _uiOk,_uiErr = pcall(function()
    UI = loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/tsBelrux/dsui/refs/heads/main/ontop.lua"
    ))()
end)
if not _uiOk or not UI then
    warn("[DS] UI Library hatası: "..tostring(_uiErr)) return
end

-- ===== SERVİSLER =====
local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace         = game:GetService("Workspace")
local Camera            = Workspace.CurrentCamera
local LocalPlayer       = Players.LocalPlayer
local CoreGui           = game:GetService("CoreGui")
local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")
local Lighting          = game:GetService("Lighting")
local Stats             = game:GetService("Stats")
local TextChatService   = game:GetService("TextChatService")
local HttpService       = game:GetService("HttpService")
local VirtualUser       = game:GetService("VirtualUser")
local Debris            = game:GetService("Debris")
local cloneref = (cloneref or clonereference or function(i) return i end)
if not LocalPlayer then warn("[DS] LocalPlayer yok!") return end

-- ===== RENKLER =====
local CR  = Color3.fromRGB
local Colors = UI.Colors
local C_RED   = CR(220,20,60)   local C_VIO  = CR(138,43,226)
local C_CYAN  = CR(0,200,255)   local C_GOLD = CR(255,215,0)
local C_GREEN = CR(0,255,127)   local C_BLUE = CR(30,144,255)
local C_WHITE = CR(255,255,255) local C_GREY = CR(170,170,180)
local C_DARK  = CR(8,5,16)

-- ===== STATE =====
local _S = {}
_S.char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
_S.hrp  = _S.char:WaitForChild("HumanoidRootPart",5)
_S.hum  = _S.char:WaitForChild("Humanoid",5)

-- Silent Aim
_S.saEnabled=false _S.saSharp=false _S.saWall=false _S.saShowPred=false
_S.saPredPart=nil  _S.saPredESP=nil
-- Knife SA
_S.knifeSA=false _S.knifeConn=nil _S.knifeH=1.0 _S.knifeV=1.0
-- Aura
_S.killAura=false _S.killAuraRange=20 _S.auraConn=nil
_S.throwAura=false _S.throwAuraRange=30 _S.throwConn=nil
-- Aimlock
_S.aimlockEnabled=false _S.aimlockActive=false
_S.aimlockTarget=nil _S.aimlockConn=nil _S.aimlockGui=nil
-- Shot / Flick
_S.flickEnabled=false _S.shotBtnGui=nil
-- Dual
_S.dualGun=false _S.dualKnife=false
-- Hitbox
_S.hitbox=false _S.hitboxSize=5 _S.hitboxColor=C_RED _S.hitboxAdorn={} _S.hitboxConn=nil
-- Fly
_S.fly=false _S.flySpeed=50 _S.flyDir={f=0,b=0,l=0,r=0}
-- Movement
_S.noclip=false _S.speedGlitch=false _S.speedGlitchConn=nil
_S.bunny=false _S.infJump=false
_S.ws={Val=16,Locked=false} _S.jp={Val=50,Locked=false}
_S.speedBypass=false _S.speedBypassVal=9 _S.godMode=false
-- ESP
_S.espHL=false _S.espBillboard=false _S.espFilter="All"
-- Invis
_S.invis=false _S.invisAnim=nil _S.invisHB=nil _S.invisABlock=nil _S.invisCol=nil
-- Autofarm
_S.coinFarm=false _S.coinMode="Nearest" _S.coinInterval=4
_S.spinEnabled=false _S.spinSpeed=5 _S.spinConn=nil _S.antiAFKConn=nil
_S.roundActive=false _S.coinsCollected=0 _S.smartFarm=false _S.autoFlingMurderer=false
-- Bomb Jump
_S.bjEnabled=false _S.bjOnCD=false _S.bjDebounce=false _S.bjAutoGet=false
_S.bjJustSpawned=false _S.bjGui=nil _S.bjBtn=nil _S.bjSize=68
-- Ninja Step
_S.ninjaEnabled=false _S.ninjaCD=false _S.ninjaOrigSpeed=16
-- Player / Fling
_S.selPlayer=nil _S.origCamSubject=Camera.CameraSubject
_S.loopTP=false _S.loopFling=false _S.orbit=false _S.orbitConn=nil
_S.deathNotify=false _S.deathConn=nil
_S.flingAura=false _S.clickFling=false _S.antiFling=false _S.antiFlingConns={}
_S.flingAll=false
getgenv().OldPos = nil
-- QB / Edit
_S.editMode=false _S.showStats=true _S.fpsGui=nil
-- Yeni
_S.killCount=0 _S.roundTimer=0 _S.roundTimerConn=nil
_S.crosshair=false _S.crosshairGui=nil
_S.streamingMode=false _S.streamConns={}
_S.lastRole="" _S.roleToast=true
-- DS Toggle
_S.dsToggleGui=nil _S.mainPanelRef=nil

local SAVE_FILE  = "DS_Hub_v33.json"
local BOMB_NAMES = {"Bomb","PrankBomb","FakeBomb"}
local MAPS = {"Factory","Prison","Bank2","Workplace","Office2","House2","MilBase",
    "ResearchFacility","Hotel2","Mansion2","PoliceStation","BioLab","Hospital3"}

-- ============================================================
-- AUTO-PREDICTION
-- ============================================================
local AutoConfig = {
    BulletSpeed=2500, MaxDistance=4000, BasePrediction=0.125,
    PingMultiplier=0.6, DistanceMultiplier=0.00035,
    SpeedMultiplier=0.002, JumpCompensation=0.85,
}
local TargetData = {LastPos=nil,LastTime=0,SmoothVel=Vector3.new(),VelocityHistory={}}
local PingData   = {Current=0.080,Average=0.080,Samples={},MaxSamples=10}

local function UpdatePingAvg()
    local ok,v=pcall(function() return Stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
    if ok then
        local ps=v/1000 table.insert(PingData.Samples,ps)
        if #PingData.Samples>PingData.MaxSamples then table.remove(PingData.Samples,1) end
        local sum=0 for _,s in ipairs(PingData.Samples) do sum=sum+s end
        PingData.Average=sum/#PingData.Samples PingData.Current=ps
    end
end
task.spawn(function() while true do UpdatePingAvg() task.wait(2) end end)

local function GetSmoothedVelocity(pos)
    local now=tick()
    if TargetData.LastPos then
        local dt=now-TargetData.LastTime
        if dt>0.001 then
            local iv=(pos-TargetData.LastPos)/dt
            local sf=math.clamp(0.5-(iv.Magnitude/200),0.15,0.5)
            TargetData.SmoothVel=TargetData.SmoothVel*(1-sf)+iv*sf
        end
    end
    TargetData.LastPos=pos TargetData.LastTime=now
    return TargetData.SmoothVel
end

local function CalculateAutoPrediction(tRoot,mRoot)
    local tp=tRoot.Position local mp=mRoot.Position
    local dist=(tp-mp).Magnitude
    if dist>AutoConfig.MaxDistance then return nil end
    local ping=PingData.Average
    local pingF=1+(ping*AutoConfig.PingMultiplier*10)
    local distF=1+(dist*AutoConfig.DistanceMultiplier)
    local vel=GetSmoothedVelocity(tp)
    local speedF=1+(vel.Magnitude*AutoConfig.SpeedMultiplier)
    local jumpF=1.0
    local hum=tRoot.Parent:FindFirstChildOfClass("Humanoid")
    if hum then
        local st=hum:GetState()
        if st==Enum.HumanoidStateType.Jumping then jumpF=AutoConfig.JumpCompensation
        elseif st==Enum.HumanoidStateType.Freefall then jumpF=1.1 end
    end
    local fm=math.clamp(AutoConfig.BasePrediction*pingF*distF*speedF*jumpF,0.08,0.25)
    local t=dist/AutoConfig.BulletSpeed
    for _=1,6 do
        local nd=((tp+vel*t*fm)-mp).Magnitude
        local nt=nd/AutoConfig.BulletSpeed
        if math.abs(nt-t)<0.005 then break end
        t=nt
    end
    local pred=tp+vel*t*fm
    if hum and hum:GetState()==Enum.HumanoidStateType.Freefall then
        pred=pred-Vector3.new(0,Workspace.Gravity*t*t*0.08,0) end
    if _S.saSharp then pred=pred+Vector3.new(0,1.2,0) end
    return pred
end

-- ============================================================
-- HELPERS
-- ============================================================
local function Notif(t,c,d) UI.Notify(t,c or "",d or 3) end
local function GetPing()
    local ok,v=pcall(function() return Stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
    return (ok and v or 100)
end
local function GetRole(p)
    if not p or not p.Character then return "Innocent" end
    local ch,bp=p.Character,p:FindFirstChild("Backpack")
    if ch:FindFirstChild("Knife") or (bp and bp:FindFirstChild("Knife")) then return "Murderer" end
    if ch:FindFirstChild("Gun") or (bp and bp:FindFirstChild("Gun"))
    or ch:FindFirstChild("Revolver") or (bp and bp:FindFirstChild("Revolver")) then return "Sheriff" end
    return "Innocent"
end
local function RoleColor(r) return r=="Murderer" and C_RED or r=="Sheriff" and C_BLUE or C_GREEN end
local function GetMurderer()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer and p.Character then
            local bp=p:FindFirstChild("Backpack")
            if p.Character:FindFirstChild("Knife") or (bp and bp:FindFirstChild("Knife")) then return p end
        end
    end
end
local function GetSheriff()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer and p.Character then
            local bp=p:FindFirstChild("Backpack")
            if p.Character:FindFirstChild("Gun") or (bp and bp:FindFirstChild("Gun"))
            or p.Character:FindFirstChild("Revolver") or (bp and bp:FindFirstChild("Revolver")) then return p end
        end
    end
end
local function IsSheriff()
    local bp,ch=LocalPlayer:FindFirstChild("Backpack"),LocalPlayer.Character
    return (bp and (bp:FindFirstChild("Gun") or bp:FindFirstChild("Revolver")))
        or (ch and (ch:FindFirstChild("Gun") or ch:FindFirstChild("Revolver")))
end
local function MakeDraggable(frame)
    local drag,di,mp,fp=false
    frame.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            drag=true mp=i.Position fp=frame.Position
            i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then drag=false end end)
        end
    end)
    frame.InputChanged:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch then di=i end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if drag and i==di then
            local d=i.Position-mp
            frame.Position=UDim2.new(fp.X.Scale,fp.X.Offset+d.X,fp.Y.Scale,fp.Y.Offset+d.Y)
        end
    end)
end

-- ============================================================
-- DS TOGGLE BUTONU
-- Çarpıya tıklayınca UI kapanır → siyah kare "DS" butonuna
-- tıklayınca UI yeniden açılır. Buton her zaman ekranda.
-- ============================================================
local function CreateDSToggleBtn()
    if _S.dsToggleGui then _S.dsToggleGui:Destroy() end
    local sg=Instance.new("ScreenGui")
    sg.Name="DSTglBtn" sg.ResetOnSpawn=false
    sg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
    sg.Parent=CoreGui

    local cont=Instance.new("Frame",sg)
    cont.Name="DSTglCont"
    cont.Size=UDim2.new(0,52,0,52)
    -- Sağ üst köşe, çarpı butonunun yanı
    cont.Position=UDim2.new(1,-64,0,12)
    cont.BackgroundTransparency=1

    local btn=Instance.new("TextButton",cont)
    btn.Size=UDim2.new(1,0,1,0)
    btn.BackgroundColor3=C_DARK
    btn.BackgroundTransparency=0.05
    btn.Text="" btn.AutoButtonColor=false btn.ZIndex=200
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,10)

    local stroke=Instance.new("UIStroke",btn)
    stroke.Color=C_VIO stroke.Thickness=2 stroke.Transparency=0.2

    -- Gradient (siyah arka plan, hafif mor ton)
    local grad=Instance.new("UIGradient",btn)
    grad.Color=ColorSequence.new{
        ColorSequenceKeypoint.new(0,CR(20,10,40)),
        ColorSequenceKeypoint.new(1,CR(35,10,50))
    }
    grad.Rotation=135

    -- "DS" yazısı — GothamBlack, ontop.lua'nın Accent1→Accent3 gradient rengi
    local lbl=Instance.new("TextLabel",btn)
    lbl.Size=UDim2.new(1,0,0.70,0)
    lbl.Position=UDim2.new(0,0,0.04,0)
    lbl.BackgroundTransparency=1
    lbl.Text="DS"
    lbl.Font=Enum.Font.GothamBlack
    lbl.TextSize=22
    lbl.TextColor3=C_WHITE
    lbl.ZIndex=201
    local txtGrad=Instance.new("UIGradient",lbl)
    txtGrad.Color=ColorSequence.new{
        ColorSequenceKeypoint.new(0,Colors.Accent1),
        ColorSequenceKeypoint.new(0.5,Colors.Accent4),
        ColorSequenceKeypoint.new(1,Colors.Accent3)
    }
    txtGrad.Rotation=90

    -- "HUB" alt yazı
    local sub=Instance.new("TextLabel",btn)
    sub.Size=UDim2.new(1,0,0.28,0)
    sub.Position=UDim2.new(0,0,0.70,0)
    sub.BackgroundTransparency=1
    sub.Text="HUB" sub.Font=Enum.Font.Gotham sub.TextSize=9
    sub.TextColor3=CR(160,120,220) sub.ZIndex=201

    -- Aktif nokta (sol alt)
    local dot=Instance.new("Frame",btn)
    dot.Size=UDim2.new(0,7,0,7)
    dot.Position=UDim2.new(0,4,1,-11)
    dot.BackgroundColor3=C_GREEN dot.ZIndex=202
    Instance.new("UICorner",dot).CornerRadius=UDim.new(1,0)
    TweenService:Create(dot,TweenInfo.new(0.9,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),
        {BackgroundTransparency=0.6}):Play()

    -- Pulse stroke
    TweenService:Create(stroke,TweenInfo.new(1.4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),
        {Color=CR(200,100,255),Transparency=0.6}):Play()

    MakeDraggable(cont)

    -- Hover
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.15),{BackgroundTransparency=0}):Play()
        TweenService:Create(stroke,TweenInfo.new(0.15),{Thickness=3}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.15),{BackgroundTransparency=0.05}):Play()
        TweenService:Create(stroke,TweenInfo.new(0.15),{Thickness=2}):Play()
    end)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.08),
            {Size=UDim2.new(0.88,0,0.88,0),Position=UDim2.new(0.06,0,0.06,0)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.1),
            {Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,0)}):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        if _S.mainPanelRef then
            local mp = _S.mainPanelRef
            local newVisible = not mp.Visible
            mp.Visible = newVisible
            -- dot rengi: UI açıksa yeşil, kapalıysa kırmızı
            dot.BackgroundColor3 = newVisible and C_GREEN or C_RED
        end
    end)

    _S.dsToggleGui = sg
end

-- ============================================================
-- FPS / PING HUD
-- ============================================================
local function CreateFPS()
    if _S.fpsGui then _S.fpsGui:Destroy() end
    local sg=Instance.new("ScreenGui",CoreGui)
    sg.Name="DSFps" sg.ResetOnSpawn=false sg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

    local function MakePanel(pos,ac)
        local f=Instance.new("Frame",sg)
        f.Size=UDim2.new(0,100,0,48) f.Position=pos
        f.BackgroundColor3=C_DARK f.BackgroundTransparency=0.08 f.BorderSizePixel=0
        Instance.new("UICorner",f).CornerRadius=UDim.new(0.22,0)
        local st=Instance.new("UIStroke",f) st.Color=ac st.Thickness=1.5 st.Transparency=0.25
        return f
    end
    local function MakeLbl(p,pos,txt,sz,col,bold)
        local l=Instance.new("TextLabel",p)
        l.Size=UDim2.new(1,-6,0.5,0) l.Position=pos l.BackgroundTransparency=1
        l.Text=txt l.TextColor3=col l.TextSize=sz
        l.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
        l.TextXAlignment=Enum.TextXAlignment.Left
        return l
    end

    local fF=MakePanel(UDim2.new(0,8,0,8),C_VIO)
    MakeLbl(fF,UDim2.new(0,7,0,3),"FPS",10,C_VIO,true)
    local fV=MakeLbl(fF,UDim2.new(0,7,0.48,-2),"0",19,C_WHITE,true)

    local pF=MakePanel(UDim2.new(0,8,0,62),Colors.Accent3)
    MakeLbl(pF,UDim2.new(0,7,0,3),"PING",10,Colors.Accent3,true)
    local pV=MakeLbl(pF,UDim2.new(0,7,0.48,-2),"0ms",16,C_WHITE,true)

    local last,frames=tick(),0
    RunService.Heartbeat:Connect(function()
        sg.Enabled=_S.showStats
        frames+=1
        local now=tick()
        if now-last>=1 then
            local fps=frames/(now-last)
            fV.Text=math.floor(fps)
            fV.TextColor3=fps>=55 and CR(0,255,100) or fps>=30 and CR(255,220,0) or CR(255,60,60)
            frames=0 last=now
        end
        local ok,p=pcall(function() return Stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
        if ok and p then
            pV.Text=math.floor(p).."ms"
            pV.TextColor3=p<=100 and CR(0,255,100) or p<=200 and CR(255,220,0) or CR(255,60,60)
        end
    end)
    _S.fpsGui=sg
end

-- ============================================================
-- CROSSHAIR OVERLAY
-- ============================================================
local function CreateCrosshair()
    if _S.crosshairGui then _S.crosshairGui:Destroy() end
    local sg=Instance.new("ScreenGui",CoreGui)
    sg.Name="DSCrosshair" sg.ResetOnSpawn=false sg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

    local function Line(sx,sy,ax,ay,col)
        local f=Instance.new("Frame",sg)
        f.BorderSizePixel=0
        f.BackgroundColor3=col or C_WHITE
        f.ZIndex=300
        f.AnchorPoint=Vector2.new(0.5,0.5)
        f.Size=UDim2.fromOffset(sx,sy)
        f.Position=UDim2.new(0.5,ax,0.5,ay)
        Instance.new("UICorner",f).CornerRadius=UDim.new(1,0)
        return f
    end
    -- yatay çizgiler
    Line(18,2,-14,0,C_WHITE) Line(18,2,14,0,C_WHITE)
    -- dikey çizgiler
    Line(2,18,0,-14,C_WHITE) Line(2,18,0,14,C_WHITE)
    -- merkez nokta
    local dot=Line(5,5,0,0,CR(255,60,60))
    dot.ZIndex=301
    TweenService:Create(dot,TweenInfo.new(0.6,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),
        {BackgroundTransparency=0.5}):Play()
    _S.crosshairGui=sg
end

-- ============================================================
-- KILL COUNTER HUD
-- ============================================================
local function CreateKillHUD()
    if _S.killHudGui then _S.killHudGui:Destroy() end
    local sg=Instance.new("ScreenGui",CoreGui)
    sg.Name="DSKillHUD" sg.ResetOnSpawn=false

    local f=Instance.new("Frame",sg)
    f.Size=UDim2.fromOffset(110,48) f.Position=UDim2.new(0,8,0,120)
    f.BackgroundColor3=C_DARK f.BackgroundTransparency=0.08 f.BorderSizePixel=0
    Instance.new("UICorner",f).CornerRadius=UDim.new(0.2,0)
    local st=Instance.new("UIStroke",f) st.Color=C_RED st.Thickness=1.5 st.Transparency=0.25

    local t1=Instance.new("TextLabel",f)
    t1.Size=UDim2.new(1,0,0.45,0) t1.Position=UDim2.new(0,6,0,2)
    t1.BackgroundTransparency=1 t1.Text="KILLS"
    t1.Font=Enum.Font.GothamBold t1.TextSize=10
    t1.TextColor3=C_RED t1.TextXAlignment=Enum.TextXAlignment.Left

    local kV=Instance.new("TextLabel",f)
    kV.Size=UDim2.new(1,-10,0.5,0) kV.Position=UDim2.new(0,6,0.48,-2)
    kV.BackgroundTransparency=1 kV.Text="0"
    kV.Font=Enum.Font.GothamBold kV.TextSize=20
    kV.TextColor3=C_WHITE kV.TextXAlignment=Enum.TextXAlignment.Left

    RunService.Heartbeat:Connect(function() kV.Text=tostring(_S.killCount) end)

    -- Kill algılama
    local function BindKill(char)
        if not char then return end
        local h=char:FindFirstChildOfClass("Humanoid") if not h then return end
        h.Died:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Knife") then
                _S.killCount+=1
            end
        end)
    end
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer and p.Character then BindKill(p.Character) end
        p.CharacterAdded:Connect(function(c) task.wait(1) BindKill(c) end)
    end
    Players.PlayerAdded:Connect(function(p)
        p.CharacterAdded:Connect(function(c) task.wait(1) BindKill(c) end)
    end)
    _S.killHudGui=sg
end

-- ============================================================
-- ROUND TIMER HUD
-- ============================================================
local function CreateRoundTimerHUD()
    if _S.roundTimerGui then _S.roundTimerGui:Destroy() end
    local sg=Instance.new("ScreenGui",CoreGui)
    sg.Name="DSRoundTimer" sg.ResetOnSpawn=false

    local f=Instance.new("Frame",sg)
    f.Size=UDim2.fromOffset(110,48) f.Position=UDim2.new(0,8,0,174)
    f.BackgroundColor3=C_DARK f.BackgroundTransparency=0.08 f.BorderSizePixel=0
    Instance.new("UICorner",f).CornerRadius=UDim.new(0.2,0)
    local st=Instance.new("UIStroke",f) st.Color=C_GOLD st.Thickness=1.5 st.Transparency=0.25

    local t1=Instance.new("TextLabel",f)
    t1.Size=UDim2.new(1,0,0.45,0) t1.Position=UDim2.new(0,6,0,2)
    t1.BackgroundTransparency=1 t1.Text="ROUND"
    t1.Font=Enum.Font.GothamBold t1.TextSize=10
    t1.TextColor3=C_GOLD t1.TextXAlignment=Enum.TextXAlignment.Left

    local rV=Instance.new("TextLabel",f)
    rV.Size=UDim2.new(1,-10,0.5,0) rV.Position=UDim2.new(0,6,0.48,-2)
    rV.BackgroundTransparency=1 rV.Text="--:--"
    rV.Font=Enum.Font.GothamBold rV.TextSize=18
    rV.TextColor3=C_WHITE rV.TextXAlignment=Enum.TextXAlignment.Left

    RunService.Heartbeat:Connect(function()
        if _S.roundActive and _S.roundTimer>0 then
            local m=math.floor(_S.roundTimer/60)
            local s=math.floor(_S.roundTimer%60)
            rV.Text=string.format("%d:%02d",m,s)
            rV.TextColor3=_S.roundTimer<=30 and C_RED or C_WHITE
        else
            rV.Text=_S.roundActive and "LIVE" or "--:--"
            rV.TextColor3=C_WHITE
        end
    end)
    _S.roundTimerGui=sg
end

-- ============================================================
-- ROLE TOAST
-- ============================================================
local function ShowRoleToast(role)
    if not _S.roleToast then return end
    local color=RoleColor(role)
    local icon=role=="Murderer" and "🔪" or role=="Sheriff" and "🔫" or "😇"
    local sg=Instance.new("ScreenGui",CoreGui)
    sg.Name="DSRoleToast" sg.ResetOnSpawn=false

    local f=Instance.new("Frame",sg)
    f.Size=UDim2.fromOffset(280,64)
    f.Position=UDim2.new(0.5,-140,-0.12,0)
    f.BackgroundColor3=C_DARK f.BackgroundTransparency=0.08 f.BorderSizePixel=0
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,16)
    local st=Instance.new("UIStroke",f) st.Color=color st.Thickness=2.5 st.Transparency=0.1

    local lbl=Instance.new("TextLabel",f)
    lbl.Size=UDim2.new(1,0,1,0) lbl.BackgroundTransparency=1
    lbl.Text=icon.."  YOU ARE: "..role:upper()
    lbl.Font=Enum.Font.GothamBlack lbl.TextSize=20 lbl.TextColor3=color

    TweenService:Create(f,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
        {Position=UDim2.new(0.5,-140,0.07,0)}):Play()
    task.delay(2.8,function()
        TweenService:Create(f,TweenInfo.new(0.3),{Position=UDim2.new(0.5,-140,-0.12,0)}):Play()
        task.wait(0.35) sg:Destroy()
    end)
end

-- Round event bağlama
task.spawn(function()
    local RoundStart,RoundEnd
    pcall(function()
        RoundStart = ReplicatedStorage.Remotes.Gameplay.RoundStart
        RoundEnd   = ReplicatedStorage.Remotes.Gameplay.RoundEndFade
    end)
    if RoundStart then
        RoundStart.OnClientEvent:Connect(function()
            _S.roundActive=true _S.coinsCollected=0 _S.killCount=0 _S.roundTimer=0
            if _S.roundTimerConn then _S.roundTimerConn:Disconnect() end
            _S.roundTimerConn=RunService.Heartbeat:Connect(function(dt)
                if _S.roundActive then _S.roundTimer+=dt end
            end)
            task.wait(1.5)
            local myRole=GetRole(LocalPlayer)
            if myRole~=_S.lastRole then _S.lastRole=myRole ShowRoleToast(myRole) end
        end)
    end
    if RoundEnd then
        RoundEnd.OnClientEvent:Connect(function()
            _S.roundActive=false
            if _S.roundTimerConn then _S.roundTimerConn:Disconnect() _S.roundTimerConn=nil end
        end)
    end
end)

-- ============================================================
-- AIMLOCK BUTTON
-- ============================================================
local function CreateAimlockBtn()
    if _S.aimlockGui then _S.aimlockGui:Destroy() end
    local sg=Instance.new("ScreenGui") sg.Name="DSAimlock" sg.ResetOnSpawn=false sg.Parent=CoreGui
    local cont=Instance.new("Frame",sg)
    cont.Size=UDim2.new(0,68,0,68) cont.Position=UDim2.new(0,12,0.5,-34) cont.BackgroundTransparency=1

    local btn=Instance.new("TextButton",cont)
    btn.Size=UDim2.new(1,0,1,0) btn.BackgroundColor3=CR(12,6,24)
    btn.BackgroundTransparency=0.08 btn.Text="" btn.AutoButtonColor=false
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0.5,0)

    local bg2=Instance.new("UIGradient",btn)
    bg2.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,C_VIO),ColorSequenceKeypoint.new(1,C_RED)}
    bg2.Rotation=45

    local stroke2=Instance.new("UIStroke",btn)
    stroke2.Color=CR(200,120,255) stroke2.Thickness=2.5 stroke2.Transparency=0.2
    TweenService:Create(stroke2,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),
        {Color=CR(255,200,100),Transparency=0.6}):Play()

    local cross2=Instance.new("TextLabel",btn)
    cross2.Size=UDim2.new(1,0,0.55,0) cross2.Position=UDim2.new(0,0,0.1,0)
    cross2.BackgroundTransparency=1 cross2.Text="⊕" cross2.TextSize=26
    cross2.TextColor3=C_WHITE cross2.Font=Enum.Font.GothamBold

    local statLbl=Instance.new("TextLabel",btn)
    statLbl.Size=UDim2.new(1,0,0.28,0) statLbl.Position=UDim2.new(0,0,0.7,0)
    statLbl.BackgroundTransparency=1 statLbl.Text="OFF" statLbl.TextSize=9
    statLbl.TextColor3=C_GREY statLbl.Font=Enum.Font.Gotham

    MakeDraggable(cont)

    local function FindClosestMurderer()
        local c=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
        local cl,d=nil,math.huge
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LocalPlayer and p.Character then
                local bp=p:FindFirstChild("Backpack")
                if p.Character:FindFirstChild("Knife") or (bp and bp:FindFirstChild("Knife")) then
                    local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local sp,vis=Camera:WorldToScreenPoint(hrp.Position)
                        if vis then local dd=(Vector2.new(sp.X,sp.Y)-c).Magnitude if dd<d then d=dd cl=p end end
                    end
                end
            end
        end
        return cl
    end

    btn.MouseButton1Click:Connect(function()
        if _S.editMode then return end
        _S.aimlockActive=not _S.aimlockActive
        if _S.aimlockActive then
            _S.aimlockTarget=FindClosestMurderer()
            if _S.aimlockTarget then
                statLbl.Text="ON" statLbl.TextColor3=C_GREEN cross2.TextColor3=C_RED
                _S.aimlockConn=RunService.RenderStepped:Connect(function()
                    if not _S.aimlockTarget or not _S.aimlockTarget.Character then
                        _S.aimlockActive=false statLbl.Text="OFF" statLbl.TextColor3=C_GREY cross2.TextColor3=C_WHITE
                        if _S.aimlockConn then _S.aimlockConn:Disconnect() _S.aimlockConn=nil end return end
                    local bp=_S.aimlockTarget:FindFirstChild("Backpack")
                    if not(_S.aimlockTarget.Character:FindFirstChild("Knife") or (bp and bp:FindFirstChild("Knife"))) then
                        _S.aimlockActive=false statLbl.Text="OFF" statLbl.TextColor3=C_GREY cross2.TextColor3=C_WHITE
                        if _S.aimlockConn then _S.aimlockConn:Disconnect() _S.aimlockConn=nil end return end
                    local hrp=_S.aimlockTarget.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local ping=GetPing()/1000 local vel=hrp.AssemblyLinearVelocity
                        Camera.CFrame=Camera.CFrame:Lerp(CFrame.lookAt(Camera.CFrame.Position,hrp.Position+vel*ping*1.8+Vector3.new(0,1.5,0)),0.3)
                    end
                end)
            else
                _S.aimlockActive=false statLbl.Text="NO TARGET"
                task.delay(1.5,function() statLbl.Text="OFF" end)
            end
        else
            statLbl.Text="OFF" statLbl.TextColor3=C_GREY cross2.TextColor3=C_WHITE
            if _S.aimlockConn then _S.aimlockConn:Disconnect() _S.aimlockConn=nil end
            _S.aimlockTarget=nil
        end
    end)
    _S.aimlockGui=sg
end

-- ============================================================
-- GUN SILENT AIM
-- ============================================================
local function CreatePredESP()
    if _S.saPredESP then _S.saPredESP:Destroy() end
    if _S.saPredPart then _S.saPredPart:Destroy() end
    _S.saPredPart=Instance.new("Part") _S.saPredPart.Name="DSPred"
    _S.saPredPart.Size=Vector3.new(2,2,2) _S.saPredPart.Transparency=1
    _S.saPredPart.Anchored=true _S.saPredPart.CanCollide=false _S.saPredPart.Parent=workspace
    _S.saPredESP=Instance.new("BoxHandleAdornment")
    _S.saPredESP.Adornee=_S.saPredPart _S.saPredESP.Size=Vector3.new(2.4,2.4,2.4)
    _S.saPredESP.Color3=CR(0,255,140) _S.saPredESP.Transparency=0.3
    _S.saPredESP.AlwaysOnTop=true _S.saPredESP.ZIndex=10 _S.saPredESP.Parent=_S.saPredPart
end
local function UpdatePredESP(pos)
    if not _S.saShowPred or not _S.saPredESP then
        if _S.saPredESP then _S.saPredESP.Adornee=nil end return end
    if not pos then _S.saPredESP.Adornee=nil return end
    _S.saPredPart.CFrame=CFrame.new(pos) _S.saPredESP.Adornee=_S.saPredPart
end
local function HasClearShot(target)
    if not target or not target.Character then return false end
    local root=target.Character:FindFirstChild("HumanoidRootPart") if not root then return false end
    local mr=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") if not mr then return false end
    local params=RaycastParams.new()
    params.FilterDescendantsInstances={LocalPlayer.Character} params.FilterType=Enum.RaycastFilterType.Exclude
    local res=workspace:Raycast(mr.Position,(root.Position-mr.Position).Unit*1000,params)
    return res and res.Instance and res.Instance:IsDescendantOf(target.Character)
end
local function GetSATarget()
    local mr=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") if not mr then return end
    local cl,cd=nil,math.huge
    for _,p in ipairs(Players:GetPlayers()) do
        if p==LocalPlayer then continue end
        if not p.Character then continue end
        local bp=p.Backpack
        if not(p.Character:FindFirstChild("Knife") or (bp and bp:FindFirstChild("Knife"))
            or p.Character:FindFirstChild("Revolver") or (bp and bp:FindFirstChild("Revolver"))) then continue end
        local root=p.Character:FindFirstChild("HumanoidRootPart") if not root then continue end
        local d=(root.Position-mr.Position).Magnitude
        if d<cd then cd=d cl=p end
    end
    return cl
end
local function GetGunTool()
    local c=LocalPlayer.Character if not c then return nil,false end
    local gun=c:FindFirstChild("Gun") or c:FindFirstChild("Revolver")
    if gun then return gun,true end
    local bp=LocalPlayer:FindFirstChild("Backpack") if not bp then return nil,false end
    return bp:FindFirstChild("Gun") or bp:FindFirstChild("Revolver"),false
end
local function SAShoot()
    local char=LocalPlayer.Character if not char then return end
    local mr=char:FindFirstChild("HumanoidRootPart") if not mr then return end
    local gun,already=GetGunTool() if not gun then return end
    local remote=gun:FindFirstChild("Shoot") or gun:FindFirstChild("Fire") if not remote then return end
    local target=GetSATarget() if not target or not target.Character then return end
    local hrp=target.Character:FindFirstChild("HumanoidRootPart") if not hrp then return end
    if not already then gun.Parent=char task.wait(0.05) end
    local aimPos=CalculateAutoPrediction(hrp,mr)
    if not aimPos then if not already then gun.Parent=LocalPlayer.Backpack end return end
    if _S.saWall and not HasClearShot(target) then if not already then gun.Parent=LocalPlayer.Backpack end return end
    UpdatePredESP(aimPos)
    pcall(function() remote:FireServer(CFrame.new(mr.Position),CFrame.new(aimPos)) end)
    task.wait(0.05)
    if not already then gun.Parent=LocalPlayer.Backpack end
end

RunService.RenderStepped:Connect(function()
    if not _S.saShowPred or not _S.saEnabled then UpdatePredESP(nil) return end
    local t=GetSATarget()
    if t and t.Character then
        local hrp=t.Character:FindFirstChild("HumanoidRootPart")
        local mr=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp and mr then UpdatePredESP(CalculateAutoPrediction(hrp,mr)) else UpdatePredESP(nil) end
    else UpdatePredESP(nil) end
end)

-- ============================================================
-- FLICK SHOT
-- ============================================================
local function FlickShot()
    if UserInputService.MouseBehavior~=Enum.MouseBehavior.LockCenter then
        Notif("Shift Lock Off","Enable it first!",2) return false end
    if not IsSheriff() then return false end
    local murderer=GetMurderer() if not murderer or not murderer.Character then
        Notif("No Murderer","",2) return false end
    local char=LocalPlayer.Character if not char then return false end
    local gun=char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")
    if not gun then
        local bp=LocalPlayer:FindFirstChild("Backpack")
        local bg=bp and (bp:FindFirstChild("Gun") or bp:FindFirstChild("Revolver"))
        local h2=char:FindFirstChildOfClass("Humanoid")
        if bg and h2 then h2:EquipTool(bg) task.wait(0.1) gun=char:FindFirstChild("Gun") or char:FindFirstChild("Revolver") end
    end
    if not gun then return false end
    local mChar=murderer.Character
    local head=mChar:FindFirstChild("Head") local hrp=mChar:FindFirstChild("HumanoidRootPart")
    if not head or not hrp then return false end
    local origCam=Camera.CFrame
    task.wait(math.random(0,50)/1000)
    local ping=GetPing()/1000 local vel=hrp.AssemblyLinearVelocity
    local h2=mChar:FindFirstChildOfClass("Humanoid")
    local jumpPred=Vector3.new(0,0,0)
    if h2 then local st=h2:GetState()
        if st==Enum.HumanoidStateType.Jumping or st==Enum.HumanoidStateType.Freefall then
            jumpPred=Vector3.new(0,vel.Y*ping*2.0,0) end end
    local targetPos=head.Position+vel*ping*2.0+jumpPred
    local conn conn=RunService.RenderStepped:Connect(function()
        conn:Disconnect()
        Camera.CFrame=CFrame.lookAt(Camera.CFrame.Position,targetPos)
        local shoot=gun:FindFirstChild("Shoot")
        if shoot then
            local rh=char:FindFirstChild("RightHand") or char:FindFirstChild("Right Arm")
            if rh then pcall(function() shoot:FireServer(CFrame.new(rh.Position),CFrame.new(targetPos)) end) end
        end
        task.spawn(function()
            task.wait(0.05)
            local deg=math.random(10,12) local dir=math.random(0,1)==0 and 1 or -1
            Camera.CFrame=Camera.CFrame*CFrame.Angles(0,math.rad(deg*dir),0)
            task.wait(0.1)
            for i=0,1,0.2 do Camera.CFrame=Camera.CFrame:Lerp(origCam,i) task.wait() end
            Camera.CFrame=origCam
        end)
    end)
    return true
end

-- ============================================================
-- SHOT BUTTON
-- ============================================================
local function CreateShotBtn()
    if _S.shotBtnGui then _S.shotBtnGui:Destroy() end
    local sg=Instance.new("ScreenGui") sg.Name="DSShotBtn" sg.ResetOnSpawn=false sg.Parent=CoreGui
    local cont=Instance.new("Frame",sg)
    cont.Size=UDim2.new(0,110,0,110) cont.Position=UDim2.new(0.88,0,0.58,0)
    cont.AnchorPoint=Vector2.new(0.5,0.5) cont.BackgroundTransparency=1

    local ring=Instance.new("Frame",cont) ring.Size=UDim2.new(1,0,1,0) ring.BackgroundTransparency=1
    local ringImg=Instance.new("ImageLabel",ring)
    ringImg.Size=UDim2.new(1,0,1,0) ringImg.BackgroundTransparency=1
    ringImg.Image="rbxassetid://6764432293" ringImg.ImageColor3=C_VIO

    local btn=Instance.new("TextButton",cont)
    btn.Size=UDim2.new(0,82,0,82) btn.Position=UDim2.new(0.5,0,0.5,0)
    btn.AnchorPoint=Vector2.new(0.5,0.5) btn.BackgroundColor3=CR(10,6,20)
    btn.BackgroundTransparency=0.05 btn.Text="" btn.AutoButtonColor=false
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0.5,0)
    local btnStroke=Instance.new("UIStroke",btn)
    btnStroke.Thickness=2.5 btnStroke.Color=CR(180,80,255) btnStroke.Transparency=0.2
    local bg3=Instance.new("UIGradient",btn)
    bg3.Color=ColorSequence.new{
        ColorSequenceKeypoint.new(0,CR(138,0,255)),
        ColorSequenceKeypoint.new(0.5,CR(60,0,140)),
        ColorSequenceKeypoint.new(1,CR(180,20,60))
    }

    local cross=Instance.new("Frame",btn)
    cross.Size=UDim2.new(0,44,0,44) cross.Position=UDim2.new(0.5,0,0.42,0)
    cross.AnchorPoint=Vector2.new(0.5,0.5) cross.BackgroundTransparency=1
    local function MakeLine(sz,pos)
        local l=Instance.new("Frame",cross) l.Size=sz l.Position=pos
        l.AnchorPoint=Vector2.new(0.5,0.5) l.BackgroundColor3=C_WHITE l.BorderSizePixel=0
        Instance.new("UICorner",l).CornerRadius=UDim.new(1,0) return l
    end
    MakeLine(UDim2.new(0,38,0,2),UDim2.new(0.5,0,0.5,0))
    MakeLine(UDim2.new(0,2,0,38),UDim2.new(0.5,0,0.5,0))
    local dot2=MakeLine(UDim2.new(0,7,0,7),UDim2.new(0.5,0,0.5,0)) dot2.BackgroundColor3=CR(255,60,60)

    local lbl=Instance.new("TextLabel",btn)
    lbl.Size=UDim2.new(1,0,0.22,0) lbl.Position=UDim2.new(0,0,0.76,0)
    lbl.BackgroundTransparency=1 lbl.Text="SHOOT" lbl.TextSize=11
    lbl.TextColor3=C_WHITE lbl.Font=Enum.Font.GothamBold

    TweenService:Create(ringImg,TweenInfo.new(3,Enum.EasingStyle.Linear,Enum.EasingDirection.In,-1),{Rotation=360}):Play()
    local glow=Instance.new("Frame",btn) glow.Size=UDim2.new(1,0,1,0) glow.BackgroundTransparency=1
    local glowStroke=Instance.new("UIStroke",glow)
    glowStroke.Color=CR(160,80,255) glowStroke.Thickness=6 glowStroke.Transparency=0.7
    Instance.new("UICorner",glow).CornerRadius=UDim.new(0.5,0)
    TweenService:Create(glowStroke,TweenInfo.new(0.9,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),
        {Transparency=0.3,Color=CR(220,100,255)}):Play()

    btn.MouseButton1Down:Connect(function() TweenService:Create(btn,TweenInfo.new(0.08),{Size=UDim2.new(0,76,0,76)}):Play() end)
    btn.MouseButton1Up:Connect(function() TweenService:Create(btn,TweenInfo.new(0.12),{Size=UDim2.new(0,82,0,82)}):Play() end)
    MakeDraggable(cont)

    btn.MouseButton1Click:Connect(function()
        if _S.editMode then return end
        if _S.flickEnabled then FlickShot() elseif _S.saEnabled then SAShoot() end
        lbl.Text="BANG!" lbl.TextColor3=CR(255,220,80)
        task.delay(0.3,function() lbl.Text="SHOOT" lbl.TextColor3=C_WHITE end)
    end)
    _S.shotBtnGui=sg
end

-- ============================================================
-- KNIFE SILENT AIM (cursor tabanlı, WraithHub geliştirilmiş)
-- ============================================================
local function GetClosestCursor()
    local mp=UserInputService:GetMouseLocation()
    local cl,cd=nil,math.huge
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer and p.Character then
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local sp,vis=Camera:WorldToViewportPoint(hrp.Position)
                if vis then local d=(Vector2.new(sp.X,sp.Y)-mp).Magnitude if d<cd then cd=d cl=p end end
            end
        end
    end
    return cl
end
local function GetKnifePred(hrp)
    local ping=GetPing()/1000 local vel=hrp.AssemblyLinearVelocity
    local mr=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local dist=mr and (hrp.Position-mr.Position).Magnitude or 20
    local total=ping+dist/90
    local gravComp=Vector3.new(0,workspace.Gravity*total*0.35,0)
    return hrp.Position+Vector3.new(vel.X*_S.knifeH*total,vel.Y*_S.knifeV*total,vel.Z*_S.knifeH*total)+gravComp
end
local function FindKnifeRemote(knife)
    for _,n in ipairs({"Throw","ThrowKnife","KnifeThrow","Fire","Activate"}) do
        local r=knife:FindFirstChild(n)
        if r and(r:IsA("RemoteEvent") or r:IsA("BindableEvent")) then return r,"event" end
    end
    for _,c in ipairs(knife:GetDescendants()) do if c:IsA("RemoteEvent") then return c,"event" end end
    return nil,nil
end
local function StartKnifeSA()
    if _S.knifeConn then _S.knifeConn:Disconnect() end
    _S.knifeConn=UserInputService.InputBegan:Connect(function(inp,gpe)
        if gpe or not _S.knifeSA then return end
        if not(inp.KeyCode==Enum.KeyCode.E or inp.UserInputType==Enum.UserInputType.MouseButton2) then return end
        local ch=LocalPlayer.Character if not ch then return end
        local knife=nil for _,t in ipairs(ch:GetChildren()) do
            if t:IsA("Tool") and (t.Name=="Knife" or t.Name:lower():find("knife")) then knife=t break end end
        if not knife then return end
        local target=GetClosestCursor() if not target or not target.Character then return end
        local hrp=target.Character:FindFirstChild("HumanoidRootPart") if not hrp then return end
        local pred=GetKnifePred(hrp)
        local remote,rtype=FindKnifeRemote(knife)
        if remote then
            if rtype=="event" then pcall(function() remote:FireServer(CFrame.new(pred)) end)
            else pcall(function() remote:InvokeServer(CFrame.new(pred)) end) end
        else pcall(function() knife:Activate() end) end
    end)
end

-- ============================================================
-- KILL AURA / THROW AURA
-- ============================================================
local function StartKillAura()
    if _S.auraConn then _S.auraConn:Disconnect() end
    _S.auraConn=RunService.Heartbeat:Connect(function()
        if not _S.killAura then return end
        local char=LocalPlayer.Character if not char then return end
        local mr=char:FindFirstChild("HumanoidRootPart") if not mr then return end
        local knife=char:FindFirstChild("Knife") if not knife then return end
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LocalPlayer and p.Character then
                local pR=p.Character:FindFirstChild("HumanoidRootPart")
                if pR and(pR.Position-mr.Position).Magnitude<=_S.killAuraRange then
                    local stab=knife:FindFirstChild("Stab") or knife:FindFirstChild("Attack") or knife:FindFirstChild("Slash")
                    if stab then pcall(function() stab:FireServer("Stab",pR) end) end
                end
            end
        end
    end)
end
local function StartThrowAura()
    if _S.throwConn then _S.throwConn:Disconnect() end
    _S.throwConn=RunService.Heartbeat:Connect(function()
        if not _S.throwAura then return end
        local char=LocalPlayer.Character if not char then return end
        local mr=char:FindFirstChild("HumanoidRootPart") if not mr then return end
        local knife=char:FindFirstChild("Knife") if not knife then return end
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LocalPlayer and p.Character then
                local pR=p.Character:FindFirstChild("HumanoidRootPart")
                if pR and(pR.Position-mr.Position).Magnitude<=_S.throwAuraRange then
                    local pred=GetKnifePred(pR)
                    local remote,rtype=FindKnifeRemote(knife)
                    if remote then
                        if rtype=="event" then pcall(function() remote:FireServer(CFrame.new(pred)) end)
                        else pcall(function() remote:InvokeServer(CFrame.new(pred)) end) end
                    end
                end
            end
        end
    end)
end

-- ============================================================
-- KILL ALL
-- ============================================================
local killAllBusy=false
local function AutoKillAll()
    if killAllBusy then return end
    local char=LocalPlayer.Character if not char then return end
    local mr=char:FindFirstChild("HumanoidRootPart") if not mr then return end
    local knife=char:FindFirstChild("Knife")
    if not knife then
        local bp=LocalPlayer:FindFirstChild("Backpack") knife=bp and bp:FindFirstChild("Knife")
        if not knife then Notif("Kill All","Bıçak yok!",2) return end
        knife.Parent=char
    end
    local targets={}
    for _,p in pairs(Players:GetPlayers()) do
        if p~=LocalPlayer and p.Character and p.Character.PrimaryPart then
            local h2=p.Character:FindFirstChildOfClass("Humanoid")
            if h2 and h2.Health>0 then table.insert(targets,p.Character) end
        end
    end
    if #targets==0 then Notif("Kill All","Hedef yok.",2) return end
    killAllBusy=true Notif("Kill All! 🔪",#targets.." oyuncu",3)
    local st=tick() local con
    con=RunService.RenderStepped:Connect(function()
        if tick()-st>3 then con:Disconnect() killAllBusy=false Notif("Kill All ✅",#targets.." hedef",3) return end
        if char and char:IsDescendantOf(workspace) then
            for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end
        for _,c in pairs(targets) do
            if c and c.Parent and c.PrimaryPart then
                for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end
                c:SetPrimaryPartCFrame(mr.CFrame*CFrame.new(0,0,-2)) end end
    end)
end

-- ============================================================
-- DUAL WEAPON
-- ============================================================
local function SpawnDualVisual(stateKey,weaponName)
    task.spawn(function()
        local clones={}
        while _S[stateKey] do
            local char=LocalPlayer.Character
            if char then
                local weap=char:FindFirstChild(weaponName) or (weaponName=="Gun" and char:FindFirstChild("Revolver"))
                if weap and #clones==0 then
                    local handle=weap:FindFirstChild("Handle")
                    if handle then
                        local clone=Instance.new("Part") clone.Name="DS_DualVis"
                        clone.Size=handle.Size clone.Transparency=handle.Transparency
                        clone.CanCollide=false clone.Anchored=false clone.Massless=true
                        for _,v in pairs(handle:GetDescendants()) do
                            if v:IsA("SpecialMesh") or v:IsA("Decal") or v:IsA("Texture") then v:Clone().Parent=clone end end
                        clone.Parent=char
                        local lh=char:FindFirstChild("LeftHand") or char:FindFirstChild("Left Arm")
                        if lh then local m=Instance.new("Motor6D") m.Part0=lh m.Part1=clone
                            m.C0=CFrame.new(0,-0.5,0) m.Parent=lh end
                        table.insert(clones,clone)
                    end
                elseif not weap and #clones>0 then
                    for _,c in pairs(clones) do pcall(function() c:Destroy() end) end clones={}
                end
            end task.wait(0.1)
        end
        for _,c in pairs(clones) do pcall(function() c:Destroy() end) end
    end)
end

-- ============================================================
-- WRAITH HUB FLING (birebir BV + PerformFling döngüsü)
-- ============================================================
local function FlingPlayers(playerNames,flingAll)
    local function GetPlayerFromName(name)
        name=name:lower()
        for _,p in pairs(Players:GetPlayers()) do
            if p~=LocalPlayer then
                if p.Name:lower():match("^"..name) or p.DisplayName:lower():match("^"..name) then return p end
            end
        end
    end
    local function FlingPlayer(targetPlayer)
        if not targetPlayer then return end
        local localChar    = LocalPlayer.Character
        local localHum     = localChar and localChar:FindFirstChildOfClass("Humanoid")
        local localRoot    = localHum and localHum.RootPart
        local targetChar   = targetPlayer.Character
        local targetHum    = targetChar and targetChar:FindFirstChildOfClass("Humanoid")
        local targetRoot   = targetHum and targetHum.RootPart
        local targetHead   = targetChar and targetChar:FindFirstChild("Head")
        if not localChar or not localHum or not localRoot then return end
        if localRoot.Velocity.Magnitude<50 then getgenv().OldPos=localRoot.CFrame end
        if targetHum and targetHum.Sit and not flingAll then return end
        if targetHead then workspace.CurrentCamera.CameraSubject=targetHead
        elseif targetHum then workspace.CurrentCamera.CameraSubject=targetHum end
        local function Teleport(part,offset,rotation)
            if not part or not localRoot then return end
            localRoot.CFrame=CFrame.new(part.Position)*offset*rotation
            localChar:SetPrimaryPartCFrame(CFrame.new(part.Position)*offset*rotation)
            localRoot.Velocity=Vector3.new(9e8,9e8,9e8)
            localRoot.RotVelocity=Vector3.new(9e8,9e8,9e8)
        end
        local function PerformFling(part)
            if not part then return end
            local spin=0 local st=tick()
            while localRoot and part and part.Parent do
                if targetHum then
                    local ok,_=pcall(function()
                        if part.Velocity.Magnitude<50 then
                            spin=spin+100
                            Teleport(part,CFrame.new(0,1.5,0)+targetHum.MoveDirection*part.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(spin),0,0)) task.wait()
                            Teleport(part,CFrame.new(0,-1.5,0)+targetHum.MoveDirection*part.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(spin),0,0)) task.wait()
                            Teleport(part,CFrame.new(2.25,1.5,-2.25)+targetHum.MoveDirection*part.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(spin),0,0)) task.wait()
                            Teleport(part,CFrame.new(-2.25,-1.5,2.25)+targetHum.MoveDirection*part.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(spin),0,0)) task.wait()
                        else
                            Teleport(part,CFrame.new(0,1.5,targetHum.WalkSpeed),CFrame.Angles(math.rad(90),0,0)) task.wait()
                            Teleport(part,CFrame.new(0,-1.5,-targetHum.WalkSpeed),CFrame.Angles(0,0,0)) task.wait()
                        end
                    end)
                    if not ok then break end
                    if part.Velocity.Magnitude>500 then break end
                    if part.Parent~=targetPlayer.Character then break end
                    if targetPlayer.Parent~=Players then break end
                    if targetPlayer.Character~=targetChar then break end
                    if targetHum.Sit then break end
                    if localHum.Health<=0 then break end
                    if tick()>st+2 then break end
                else break end
            end
        end
        workspace.FallenPartsDestroyHeight=0/0
        local bv=Instance.new("BodyVelocity") bv.Name="DSFlingVel" bv.Parent=localRoot
        bv.Velocity=Vector3.new(9e8,9e8,9e8) bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
        localHum:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        if targetRoot and targetHead then
            if(targetRoot.CFrame.p-targetHead.CFrame.p).Magnitude>5 then PerformFling(targetHead) else PerformFling(targetRoot) end
        elseif targetRoot then PerformFling(targetRoot)
        elseif targetHead then PerformFling(targetHead) end
        bv:Destroy() localHum:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
        workspace.CurrentCamera.CameraSubject=localHum
        repeat
            if not localRoot or not getgenv().OldPos then break end
            localRoot.CFrame=getgenv().OldPos*CFrame.new(0,0.5,0)
            localChar:SetPrimaryPartCFrame(getgenv().OldPos*CFrame.new(0,0.5,0))
            localHum:ChangeState("GettingUp")
            for _,p in pairs(localChar:GetChildren()) do
                if p:IsA("BasePart") then p.Velocity=Vector3.new() p.RotVelocity=Vector3.new() end end
            task.wait()
        until not localRoot or not getgenv().OldPos or(localRoot.Position-getgenv().OldPos.p).Magnitude<25
        workspace.FallenPartsDestroyHeight=-500
    end
    if flingAll then
        for _,p in pairs(Players:GetPlayers()) do if p~=LocalPlayer then FlingPlayer(p) end end
    else
        for _,name in pairs(playerNames or {}) do
            local tp=GetPlayerFromName(name) if tp and tp~=LocalPlayer then FlingPlayer(tp) end
        end
    end
end

local function MiniFling(target) if not target then return end task.spawn(function() FlingPlayers({target.Name},false) end) end
local function FlingMurderer()
    local m=GetMurderer() if m then Notif("Fling 🌪️",m.Name,2) task.spawn(function() FlingPlayers({m.Name},false) end)
    else Notif("No Murderer","",2) end
end
local function FlingSheriff()
    local s=GetSheriff() if s then Notif("Sheriff Fling 🌪️",s.Name,2) task.spawn(function() FlingPlayers({s.Name},false) end)
    else Notif("No Sheriff","",2) end
end

-- ============================================================
-- GUN GET
-- ============================================================
local function GetGunNow()
    local char=LocalPlayer.Character if not char then return end
    local tp=char:FindFirstChild("LeftFoot") or char:FindFirstChild("Left Leg") or char:FindFirstChild("HumanoidRootPart")
    if not tp then return end
    local found=false
    for _,v in ipairs(workspace:GetDescendants()) do
        if v.Name=="GunDrop" then
            pcall(function() firetouchinterest(tp,v,0) task.wait() firetouchinterest(tp,v,1) end)
            found=true break
        end
    end
    Notif("GUN",found and "Gun picked up 🔫" or "No GunDrop found!",2)
end

-- ============================================================
-- WRAITH AUTOFARM (CoinContainer + firetouchinterest)
-- ============================================================
local function WraithAutofarm()
    task.spawn(function()
        while _S.coinFarm do
            local char=LocalPlayer.Character
            local hrp=char and char:FindFirstChild("HumanoidRootPart")
            local hum=char and char:FindFirstChildOfClass("Humanoid")
            if not(hrp and hum and hum.Health>0) then task.wait(0.5) continue end
            local tp=char:FindFirstChild("LeftFoot") or char:FindFirstChild("Left Leg") or hrp
            local coins={}
            for _,obj in pairs(workspace:GetDescendants()) do
                if obj.Name=="CoinContainer" then
                    for _,c in pairs(obj:GetChildren()) do
                        if c:IsA("BasePart") and c:FindFirstChild("TouchInterest") then
                            table.insert(coins,c)
                        elseif c:IsA("Model") and c.PrimaryPart then
                            table.insert(coins,c.PrimaryPart)
                        end
                    end
                end
            end
            for _,v in pairs(workspace:GetDescendants()) do
                local n=v.Name
                if v:IsA("BasePart") and(n=="Coin" or n=="GoldCoin" or n=="Candy" or n=="PresentDrop" or n=="DropCoin") then
                    table.insert(coins,v) end
            end
            if #coins==0 then task.wait(0.3) continue end
            if _S.coinMode=="Nearest" then
                table.sort(coins,function(a,b)
                    return(hrp.Position-a.Position).Magnitude<(hrp.Position-b.Position).Magnitude end)
            end
            for _,coin in ipairs(coins) do
                if not _S.coinFarm then break end
                if not coin or not coin.Parent then continue end
                local d=(hrp.Position-coin.Position).Magnitude
                if d>150 then hrp.CFrame=CFrame.new(coin.Position)
                else
                    local tw=TweenService:Create(hrp,TweenInfo.new(d/25,Enum.EasingStyle.Linear),{CFrame=CFrame.new(coin.Position)})
                    tw:Play()
                    local t=tick() while tick()-t<d/25+0.5 do
                        task.wait() if not coin or not coin.Parent then break end
                        if (hrp.Position-coin.Position).Magnitude<2 then break end
                    end
                    tw:Cancel()
                end
                pcall(function() firetouchinterest(tp,coin,0) task.wait(0.02) firetouchinterest(tp,coin,1) end)
                task.wait(0.05)
            end
            task.wait(0.1)
        end
    end)
end

-- Farm noclip
RunService.Stepped:Connect(function()
    if _S.coinFarm and _S.roundActive then
        local char=LocalPlayer.Character
        if char then for _,p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide=false end end end end
end)

-- ============================================================
-- ESP
-- ============================================================
local _espHL={} local _espBB={}
local function GetESPColor(p) local r=GetRole(p) return RoleColor(r),r end
local function RemoveHL(p) if _espHL[p] then pcall(function() _espHL[p]:Destroy() end) _espHL[p]=nil end end
local function RemoveBB(p) if _espBB[p] then pcall(function() _espBB[p]:Destroy() end) _espBB[p]=nil end end
local function CreateHL(p)
    if not p or not p.Character then return end
    RemoveHL(p)
    local color,role=GetESPColor(p)
    local show=(role=="Murderer" and _S.espFilter:find("Murder")) or (role=="Sheriff" and _S.espFilter:find("Sheriff")) or (_S.espFilter=="All")
    if not show then return end
    local hl=Instance.new("Highlight")
    hl.FillColor=color hl.OutlineColor=color hl.FillTransparency=0.45 hl.OutlineTransparency=0.0
    hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop hl.Adornee=p.Character hl.Parent=p.Character
    _espHL[p]=hl
end
local function CreateBB(p)
    if not p or not p.Character then return end
    local hrp=p.Character:FindFirstChild("HumanoidRootPart") if not hrp then return end
    RemoveBB(p)
    local bg=Instance.new("BillboardGui")
    bg.Size=UDim2.new(0,140,0,36) bg.StudsOffset=Vector3.new(0,3.8,0)
    bg.Adornee=hrp bg.AlwaysOnTop=true bg.MaxDistance=500 bg.Parent=hrp
    local frame=Instance.new("Frame",bg) frame.Size=UDim2.new(1,0,1,0)
    frame.BackgroundColor3=CR(0,0,0) frame.BackgroundTransparency=0.6
    Instance.new("UICorner",frame).CornerRadius=UDim.new(0.3,0)
    local lbl=Instance.new("TextLabel",frame)
    lbl.Size=UDim2.new(1,-6,1,0) lbl.Position=UDim2.new(0,3,0,0)
    lbl.BackgroundTransparency=1 lbl.Font=Enum.Font.GothamBold lbl.TextSize=13
    lbl.TextStrokeTransparency=0.4 lbl.TextXAlignment=Enum.TextXAlignment.Left
    _espBB[p]=bg
    task.spawn(function()
        while bg.Parent and bg:IsDescendantOf(workspace) do
            local color2,role=GetESPColor(p)
            local mr=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local dist=mr and hrp.Parent and math.floor((hrp.Position-mr.Position).Magnitude) or "?"
            lbl.Text=" "..p.Name.." ["..role.."] "..tostring(dist).."m"
            lbl.TextColor3=color2 task.wait(0.25)
        end
    end)
end
local function UpdateESP()
    for _,p in ipairs(Players:GetPlayers()) do
        if p==LocalPlayer then continue end
        if _S.espHL and p.Character then CreateHL(p) else RemoveHL(p) end
        if _S.espBillboard and p.Character then CreateBB(p) else RemoveBB(p) end
    end
end
local function ClearESP()
    for p in pairs(_espHL) do RemoveHL(p) end
    for p in pairs(_espBB) do RemoveBB(p) end
end
for _,p in ipairs(Players:GetPlayers()) do if p~=LocalPlayer then
    p.CharacterAdded:Connect(function() task.wait(0.5) UpdateESP() end) end end
Players.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function() task.wait(0.5) UpdateESP() end) end)
Players.PlayerRemoving:Connect(function(p) RemoveHL(p) RemoveBB(p) end)
task.spawn(function() while true do task.wait(1) if _S.espHL or _S.espBillboard then UpdateESP() end end end)

-- ============================================================
-- HITBOX
-- ============================================================
local function UpdateHitboxes()
    for _,p in pairs(Players:GetPlayers()) do
        if p~=LocalPlayer then
            local ch=p.Character local adorn=_S.hitboxAdorn[p]
            if ch and _S.hitbox then
                local rp=ch:FindFirstChild("HumanoidRootPart")
                if rp then
                    if adorn and adorn.Parent then
                        adorn.Size=Vector3.new(_S.hitboxSize,_S.hitboxSize,_S.hitboxSize) adorn.Color3=_S.hitboxColor
                    else
                        local na=Instance.new("BoxHandleAdornment")
                        na.Adornee=rp na.Size=Vector3.new(_S.hitboxSize,_S.hitboxSize,_S.hitboxSize)
                        na.Color3=_S.hitboxColor na.Transparency=0.4 na.ZIndex=10 na.Parent=rp
                        _S.hitboxAdorn[p]=na
                    end
                end
            elseif adorn then pcall(function() adorn:Destroy() end) _S.hitboxAdorn[p]=nil end
        end
    end
end

-- ============================================================
-- INVISIBILITY
-- ============================================================
local InvisAnimId="90878454666108"
local function SetCharTrans(char,t)
    if not char then return end
    for _,n in ipairs({"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand",
        "RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot"}) do
        local p=char:FindFirstChild(n) if p and p:IsA("BasePart") then p.Transparency=t end end
end
local function EnableInvis(char)
    if not char then return end
    SetCharTrans(char,0.5)
    local hum=char:WaitForChild("Humanoid")
    local animator=hum and hum:FindFirstChildOfClass("Animator")
    if animator then
        if _S.invisABlock then _S.invisABlock:Disconnect() end
        _S.invisABlock=hum.AnimationPlayed:Connect(function(at)
            if at.Animation.AnimationId:match("%d+")~=InvisAnimId then at:Stop() end end)
        if _S.invisHB then _S.invisHB:Disconnect() end
        _S.invisHB=RunService.Heartbeat:Connect(function()
            if _S.invis and not(_S.invisAnim and _S.invisAnim.IsPlaying) then
                local anim=Instance.new("Animation") anim.AnimationId="rbxassetid://"..InvisAnimId
                _S.invisAnim=animator:LoadAnimation(anim)
                _S.invisAnim:Play() _S.invisAnim.TimePosition=0.2 _S.invisAnim:AdjustSpeed(0) end end)
    end
    if _S.invisCol then _S.invisCol:Disconnect() end
    _S.invisCol=RunService.Stepped:Connect(function()
        if char then for _,d in ipairs(char:GetDescendants()) do
            if d:IsA("BasePart") and d.Name~="HumanoidRootPart" then d.CanCollide=false end end end end)
end
local function DisableInvis(char)
    if _S.invisAnim then _S.invisAnim:Stop() _S.invisAnim=nil end
    if _S.invisABlock then _S.invisABlock:Disconnect() _S.invisABlock=nil end
    if _S.invisHB then _S.invisHB:Disconnect() _S.invisHB=nil end
    if _S.invisCol then _S.invisCol:Disconnect() _S.invisCol=nil end
    SetCharTrans(char,0)
    if char then for _,d in ipairs(char:GetDescendants()) do if d:IsA("BasePart") then d.CanCollide=true end end end
end

-- ============================================================
-- SPEED GLITCH
-- ============================================================
local function EnableSpeedGlitch()
    if _S.speedGlitchConn then _S.speedGlitchConn:Disconnect() end
    local char=LocalPlayer.Character if not char then return end
    local h2=char:FindFirstChildOfClass("Humanoid") if not h2 then return end
    _S.speedGlitchConn=h2.StateChanged:Connect(function(_,new)
        if _S.speedGlitch and new==Enum.HumanoidStateType.Jumping then
            task.spawn(function() task.wait(0.05) local o=h2.WalkSpeed h2.WalkSpeed=250
                task.wait(0.4) if _S.speedGlitch then h2.WalkSpeed=o end end) end
    end)
end

-- ============================================================
-- BOMB JUMP
-- ============================================================
local function BJ_GetAnyBomb()
    local c=LocalPlayer.Character if not c then return false,nil end
    for _,n in ipairs(BOMB_NAMES) do local b=c:FindFirstChild(n) if b then return true,b end end
    local bp=LocalPlayer:FindFirstChild("Backpack")
    if bp then for _,n in ipairs(BOMB_NAMES) do local b=bp:FindFirstChild(n) if b then b.Parent=c return true,b end end end
    local ok=pcall(function() ReplicatedStorage.Remotes.Extras.ReplicateToy:InvokeServer("FakeBomb") end)
    if ok then for _=1,5 do for _,n in ipairs(BOMB_NAMES) do local b=c:FindFirstChild(n) if b then return true,b end end task.wait(0.05) end end
    return false,nil
end
local function BJ_StartCD()
    _S.bjOnCD=true _S.bjDebounce=false
    if _S.bjBtn and _S.bjBtn.Parent then _S.bjBtn.Text="⏳" end
    task.spawn(function()
        for i=22,1,-1 do
            if not _S.bjOnCD then break end
            if _S.bjBtn and _S.bjBtn.Parent then _S.bjBtn.Text=tostring(i) end task.wait(1) end
        _S.bjOnCD=false if _S.bjBtn and _S.bjBtn.Parent then _S.bjBtn.Text="💣" end
    end)
end
local function FastBombJump()
    if _S.bjOnCD or _S.bjDebounce or _S.bjJustSpawned then return end
    _S.bjDebounce=true
    local ok,bomb=BJ_GetAnyBomb()
    if ok and bomb then
        local c=LocalPlayer.Character local hrp=c and c:FindFirstChild("HumanoidRootPart")
        if hrp then
            local rem=bomb:FindFirstChild("Remote")
            if rem then pcall(function() rem:FireServer(CFrame.new(hrp.Position+(Camera.CFrame.LookVector*5)),50) end) end
            local hum=c:FindFirstChildOfClass("Humanoid") if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            task.spawn(function() task.wait(0.1) BJ_StartCD() end)
        end
    end
    task.spawn(function() task.wait(0.5) _S.bjDebounce=false end)
end

-- ============================================================
-- NINJA STEP
-- ============================================================
local function NinjaStepActivate()
    if _S.ninjaCD then return end
    local char=LocalPlayer.Character
    local hum=char and char:FindFirstChildOfClass("Humanoid") if not hum then return end
    _S.ninjaCD=true _S.ninjaOrigSpeed=hum.WalkSpeed hum.WalkSpeed=50
    Notif("⚡ Ninja Step!","5 saniye hız 50",2)
    task.spawn(function()
        task.wait(5)
        if LocalPlayer.Character then
            local h2=LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if h2 then h2.WalkSpeed=_S.ninjaOrigSpeed end
        end
        _S.ninjaCD=false
        Notif("Ninja Step","Hız normal",2)
    end)
end

-- ============================================================
-- STREAMING MODE (trail + kill efekti + ekran çerçevesi)
-- ============================================================
local function CreateKillEffect(position)
    task.spawn(function()
        local part=Instance.new("Part")
        part.Size=Vector3.new(0.1,0.1,0.1) part.Anchored=true part.CanCollide=false
        part.Transparency=1 part.CFrame=CFrame.new(position) part.Parent=workspace
        local pe=Instance.new("ParticleEmitter",part)
        pe.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,CR(255,60,60)),ColorSequenceKeypoint.new(0.5,CR(255,160,0)),ColorSequenceKeypoint.new(1,CR(80,0,200))}
        pe.LightEmission=1 pe.LightInfluence=0
        pe.Size=NumberSequence.new{NumberSequenceKeypoint.new(0,1.5),NumberSequenceKeypoint.new(1,0)}
        pe.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}
        pe.Speed=NumberRange.new(8,20) pe.Lifetime=NumberRange.new(0.4,0.9) pe.Rate=0 pe.SpreadAngle=Vector2.new(180,180) pe:Emit(40)
        local ring=Instance.new("Part") ring.Shape=Enum.PartType.Cylinder ring.Size=Vector3.new(0.2,0.5,0.5)
        ring.Anchored=true ring.CanCollide=false ring.Material=Enum.Material.Neon ring.Color=CR(220,0,80)
        ring.CFrame=CFrame.new(position)*CFrame.Angles(0,0,math.pi/2) ring.Parent=workspace
        TweenService:Create(ring,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=Vector3.new(0.05,8,8),Transparency=1}):Play()
        Debris:AddItem(part,1.2) Debris:AddItem(ring,0.4)
    end)
end
local function CreateCharTrail()
    local char=LocalPlayer.Character if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart") if not hrp then return end
    for _,v in pairs(hrp:GetChildren()) do if v.Name=="DSTrail" then v:Destroy() end end
    local a0=Instance.new("Attachment",hrp) a0.Position=Vector3.new(0,1,0) a0.Name="DSTrailA0"
    local a1=Instance.new("Attachment",hrp) a1.Position=Vector3.new(0,-1,0) a1.Name="DSTrailA1"
    local trail=Instance.new("Trail",hrp) trail.Name="DSTrail" trail.Attachment0=a0 trail.Attachment1=a1
    trail.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,CR(180,0,255)),ColorSequenceKeypoint.new(0.5,CR(80,200,255)),ColorSequenceKeypoint.new(1,CR(255,80,180))}
    trail.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}
    trail.LightEmission=0.8 trail.Lifetime=0.45 trail.MinLength=0 trail.FaceCamera=true
end
local function RemoveCharTrail()
    local char=LocalPlayer.Character if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart") if not hrp then return end
    for _,v in pairs(hrp:GetChildren()) do if v.Name=="DSTrail" then v:Destroy() end end
end
local function CreateKnifeTrail()
    local char=LocalPlayer.Character if not char then return end
    local knife=char:FindFirstChild("Knife") if not knife then return end
    local handle=knife:FindFirstChild("Handle") if not handle then return end
    for _,v in pairs(handle:GetChildren()) do if v.Name=="DSKnifeTrail" then v:Destroy() end end
    local a0=Instance.new("Attachment",handle) a0.Position=Vector3.new(0,0.5,0) a0.Name="DSKnifeTrailA0"
    local a1=Instance.new("Attachment",handle) a1.Position=Vector3.new(0,-0.5,0) a1.Name="DSKnifeTrailA1"
    local trail=Instance.new("Trail",handle) trail.Name="DSKnifeTrail" trail.Attachment0=a0 trail.Attachment1=a1
    trail.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,CR(255,20,60)),ColorSequenceKeypoint.new(0.5,CR(255,140,0)),ColorSequenceKeypoint.new(1,CR(255,255,100))}
    trail.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)}
    trail.LightEmission=1 trail.Lifetime=0.3 trail.MinLength=0 trail.FaceCamera=true
end
local function EnableStreamingMode()
    for _,c in pairs(_S.streamConns) do pcall(function() c:Disconnect() end) end _S.streamConns={}
    CreateCharTrail()
    local kc=LocalPlayer.Character and LocalPlayer.Character.ChildAdded:Connect(function(c)
        if c.Name=="Knife" then task.wait(0.1) CreateKnifeTrail() end end)
    if kc then table.insert(_S.streamConns,kc) end
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer and p.Character then
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h then local dc=h.Died:Connect(function()
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    CreateKillEffect(p.Character.HumanoidRootPart.Position) end end)
                table.insert(_S.streamConns,dc) end end end
    local sg=Instance.new("ScreenGui",CoreGui) sg.Name="DSStreamGlow" sg.ResetOnSpawn=false
    local frame=Instance.new("Frame",sg) frame.Size=UDim2.new(1,0,1,0) frame.BackgroundTransparency=1
    local stroke=Instance.new("UIStroke",frame) stroke.Thickness=12 stroke.Color=CR(160,0,255) stroke.Transparency=0.5
    stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
    TweenService:Create(stroke,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),{Transparency=0.1,Color=CR(255,80,200)}):Play()
    _S.streamGui=sg table.insert(_S.streamConns,{Disconnect=function() sg:Destroy() end})
end
local function DisableStreamingMode()
    RemoveCharTrail()
    for _,c in pairs(_S.streamConns) do pcall(function() c:Disconnect() end) end _S.streamConns={}
    if _S.streamGui then _S.streamGui:Destroy() _S.streamGui=nil end
end

-- ============================================================
-- PLAYER SELECT
-- ============================================================
local function SelectPlayer(name)
    if _S.deathConn then _S.deathConn:Disconnect() _S.deathConn=nil end
    _S.selPlayer=nil
    if not name or name=="" then Notif("Seçim","Boş",2) return end
    local lower=name:lower()
    for _,p in ipairs(Players:GetPlayers()) do
        if p.Name:lower():find(lower,1,true) or p.DisplayName:lower():find(lower,1,true) then
            _S.selPlayer=p Notif("Seçildi: "..p.DisplayName,"",3) return end
    end
    Notif("Oyuncu bulunamadı","",2)
end

-- ============================================================
-- CHARACTER ADDED
-- ============================================================
LocalPlayer.CharacterAdded:Connect(function(char)
    _S.char=char _S.hrp=char:WaitForChild("HumanoidRootPart",5) _S.hum=char:WaitForChild("Humanoid",5)
    _S.bjOnCD=false if _S.bjBtn and _S.bjBtn.Parent then _S.bjBtn.Text="💣" end
    _S.bjJustSpawned=true task.delay(1,function() _S.bjJustSpawned=false end)
    if _S.bjAutoGet then task.wait(1.2) pcall(function() ReplicatedStorage.Remotes.Extras.ReplicateToy:InvokeServer("FakeBomb") end) end
    _S.ninjaCD=false
    if _S.invis then task.wait(0.5) EnableInvis(char) end
    if _S.speedGlitch then EnableSpeedGlitch() end
    if _S.espHL or _S.espBillboard then UpdateESP() end
    local h=char:FindFirstChildOfClass("Humanoid")
    if h then
        if not _S.ws.Locked then h.WalkSpeed=_S.ws.Val end
        if not _S.jp.Locked then h.JumpPower=_S.jp.Val end
    end
    if _S.streamingMode then
        CreateCharTrail()
        char.ChildAdded:Connect(function(c) if c.Name=="Knife" then task.wait(0.1) CreateKnifeTrail() end end)
    end
    Notif("Respawn","Ready! 🎯",2)
end)

RunService.Stepped:Connect(function()
    if _S.noclip and LocalPlayer.Character then
        for _,p in pairs(LocalPlayer.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end
end)
RunService.Heartbeat:Connect(function()
    if _S.bunny and UserInputService:IsKeyDown(Enum.KeyCode.Space) and LocalPlayer.Character then
        local h=LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if h and h:GetState()==Enum.HumanoidStateType.Landed then h:ChangeState(Enum.HumanoidStateType.Jumping) end end
    if _S.hitbox then pcall(UpdateHitboxes) end
end)
UserInputService.JumpRequest:Connect(function()
    if _S.infJump and LocalPlayer.Character then
        local h=LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end end
end)

-- Touch Bomb Jump
local _touches={}
UserInputService.InputBegan:Connect(function(inp,gp)
    if gp then return end
    if inp.UserInputType==Enum.UserInputType.Touch or inp.UserInputType==Enum.UserInputType.MouseButton1 then
        _touches[inp]={sp=inp.Position,st=tick(),moved=false} end
end)
UserInputService.InputChanged:Connect(function(inp)
    local td=_touches[inp] if not td then return end
    if (inp.Position-td.sp).Magnitude>10 then td.moved=true end end)
UserInputService.InputEnded:Connect(function(inp,gp)
    if gp then _touches[inp]=nil return end
    local td=_touches[inp] if not td then return end
    if not td.moved and (tick()-td.st)<=0.3 and _S.bjEnabled then
        local c=LocalPlayer.Character
        if c then for _,n in ipairs(BOMB_NAMES) do if c:FindFirstChild(n) then FastBombJump() break end end end
    end
    _touches[inp]=nil
end)

-- Speed bypass (V tuşu)
UserInputService.InputBegan:Connect(function(inp,gp)
    if inp.KeyCode==Enum.KeyCode.V and not gp then
        _S.speedBypass=not _S.speedBypass
        if _S.speedBypass then task.spawn(function()
            while _S.speedBypass and LocalPlayer.Character do
                local hum=LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum and hum.MoveDirection.Magnitude>0 then
                    LocalPlayer.Character:TranslateBy(hum.MoveDirection*_S.speedBypassVal*RunService.Heartbeat:Wait()*7)
                else task.wait() end end end) end
    end
end)

-- Click fling
local mouse=LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    if _S.clickFling then
        local tp=mouse.Target and mouse.Target.Parent and Players:FindFirstChild(mouse.Target.Parent.Name)
        if tp and tp~=LocalPlayer then MiniFling(tp) end end
end)

-- ============================================================
-- QUICK BUTTONS SYSTEM
-- ============================================================
local _BtnMeta={}
local CreatedButtons={}
local SelectedButton=nil

local QB_Gui=Instance.new("ScreenGui")
QB_Gui.Name="DSQuickBtns" QB_Gui.ResetOnSpawn=false QB_Gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
QB_Gui.Parent=cloneref(LocalPlayer:WaitForChild("PlayerGui"))

local EditModeLabel=Instance.new("TextLabel",QB_Gui)
EditModeLabel.Size=UDim2.new(0,400,0,42) EditModeLabel.Position=UDim2.new(0.5,0,0.36,0) EditModeLabel.AnchorPoint=Vector2.new(0.5,0.5)
EditModeLabel.BackgroundTransparency=1 EditModeLabel.Visible=false EditModeLabel.Font=Enum.Font.GothamBold
EditModeLabel.TextColor3=Colors.Accent1 EditModeLabel.TextSize=18 EditModeLabel.TextStrokeTransparency=0.3

local function RefreshEditLabel()
    if _S.editMode and SelectedButton then
        EditModeLabel.Text="✏  EDIT: "..SelectedButton.Name:upper() EditModeLabel.Visible=true
    else EditModeLabel.Visible=false end
end

local function MakeBtnDraggable(gui)
    local dragging,dragInput,dragStart,startPos
    gui.InputBegan:Connect(function(input)
        if not _S.editMode then return end
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            if SelectedButton and SelectedButton~=gui then SelectedButton.BackgroundColor3=CR(20,18,30) end
            SelectedButton=gui gui.BackgroundColor3=Colors.Accent1 RefreshEditLabel()
            dragging=true dragStart=input.Position startPos=gui.Position
            input.Changed:Connect(function() if input.UserInputState==Enum.UserInputState.End then dragging=false end end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if not _S.editMode then return end
        if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then dragInput=input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input==dragInput and dragging then
            local delta=input.Position-dragStart
            gui.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
        end
    end)
end

local function SaveLayout()
    local data={}
    for _,btn in ipairs(CreatedButtons) do
        data[btn.Name]={
            PX=btn.Position.X.Scale, PXO=btn.Position.X.Offset,
            PY=btn.Position.Y.Scale, PYO=btn.Position.Y.Offset,
            SX=btn.Size.X.Offset, SY=btn.Size.Y.Offset,
        }
    end
    pcall(function() writefile(SAVE_FILE,HttpService:JSONEncode(data)) end)
    Notif("Kaydedildi ✅","Layout kaydedildi",3)
end
local function LoadLayout()
    pcall(function()
        if not isfile or not isfile(SAVE_FILE) then return end
        local ok,data=pcall(function() return HttpService:JSONDecode(readfile(SAVE_FILE)) end)
        if not ok or not data then return end
        for _,btn in ipairs(CreatedButtons) do
            local d=data[btn.Name] if d then
                btn.Position=UDim2.new(d.PX,d.PXO,d.PY,d.PYO)
                btn.Size=UDim2.fromOffset(d.SX,d.SY) end
        end
    end)
end

local function CreateQBtn(name,pos,text,callback)
    local sz=_S.bjSize
    local btn=Instance.new("TextButton",QB_Gui)
    btn.Name=name btn.Size=UDim2.fromOffset(sz,sz) btn.Position=pos
    btn.AnchorPoint=Vector2.new(0.5,0.5) btn.BackgroundColor3=CR(20,18,30)
    btn.BackgroundTransparency=0.3 btn.Visible=false btn.Text=text
    btn.TextColor3=C_WHITE btn.Font=Enum.Font.GothamBold btn.TextScaled=true btn.AutoButtonColor=false
    local uc=Instance.new("UICorner",btn) uc.CornerRadius=UDim.new(1,0)
    local st=Instance.new("UIStroke",btn)
    st.Thickness=2.5 st.ApplyStrokeMode=Enum.ApplyStrokeMode.Border st.Color=CR(200,150,255)
    local grad=Instance.new("UIGradient",st)
    grad.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Colors.Accent1),ColorSequenceKeypoint.new(0.5,C_WHITE),ColorSequenceKeypoint.new(1,Colors.Accent1)}
    RunService.RenderStepped:Connect(function(dt) grad.Rotation=(grad.Rotation+(160*dt))%360 end)
    _BtnMeta[btn]={uc=uc,st=st,grad=grad}
    btn.MouseButton1Down:Connect(function()
        if not _S.editMode then TweenService:Create(btn,TweenInfo.new(0.08),{Size=UDim2.fromOffset(sz-5,sz-5)}):Play() end
    end)
    btn.MouseButton1Up:Connect(function() TweenService:Create(btn,TweenInfo.new(0.1),{Size=UDim2.fromOffset(sz,sz)}):Play() end)
    btn.MouseButton1Click:Connect(function() if not _S.editMode then callback() end end)
    MakeBtnDraggable(btn)
    table.insert(CreatedButtons,btn)
    return btn
end

-- ============================================================
-- QB LAYOUT PRESETS
-- ============================================================
local QB_PRESETS={
    {name="iPhone",data={
        SHOT_MRD={PX=0.85,PXO=0,PY=0.60,PYO=0,SX=72,SY=72},
        FLING    ={PX=0.85,PXO=0,PY=0.72,PYO=0,SX=60,SY=60},
        KILL_ALL ={PX=0.85,PXO=0,PY=0.48,PYO=0,SX=60,SY=60},
        ESP_BTN  ={PX=0.73,PXO=0,PY=0.60,PYO=0,SX=56,SY=56},
        NINJA    ={PX=0.73,PXO=0,PY=0.72,PYO=0,SX=56,SY=56},
        INVIS    ={PX=0.73,PXO=0,PY=0.48,PYO=0,SX=56,SY=56},
    }},
    {name="Android",data={
        SHOT_MRD={PX=0.87,PXO=0,PY=0.58,PYO=0,SX=82,SY=82},
        FLING    ={PX=0.87,PXO=0,PY=0.70,PYO=0,SX=68,SY=68},
        KILL_ALL ={PX=0.87,PXO=0,PY=0.46,PYO=0,SX=68,SY=68},
        ESP_BTN  ={PX=0.75,PXO=0,PY=0.58,PYO=0,SX=62,SY=62},
        NINJA    ={PX=0.75,PXO=0,PY=0.70,PYO=0,SX=62,SY=62},
        INVIS    ={PX=0.75,PXO=0,PY=0.46,PYO=0,SX=62,SY=62},
    }},
    {name="Tablet",data={
        SHOT_MRD={PX=0.90,PXO=0,PY=0.62,PYO=0,SX=90,SY=90},
        FLING    ={PX=0.90,PXO=0,PY=0.77,PYO=0,SX=74,SY=74},
        KILL_ALL ={PX=0.90,PXO=0,PY=0.47,PYO=0,SX=74,SY=74},
        ESP_BTN  ={PX=0.80,PXO=0,PY=0.62,PYO=0,SX=68,SY=68},
        NINJA    ={PX=0.80,PXO=0,PY=0.77,PYO=0,SX=68,SY=68},
        INVIS    ={PX=0.80,PXO=0,PY=0.47,PYO=0,SX=68,SY=68},
    }},
    {name="Sol El",data={
        SHOT_MRD={PX=0.15,PXO=0,PY=0.60,PYO=0,SX=76,SY=76},
        FLING    ={PX=0.15,PXO=0,PY=0.72,PYO=0,SX=62,SY=62},
        KILL_ALL ={PX=0.15,PXO=0,PY=0.48,PYO=0,SX=62,SY=62},
        ESP_BTN  ={PX=0.26,PXO=0,PY=0.60,PYO=0,SX=58,SY=58},
        NINJA    ={PX=0.26,PXO=0,PY=0.72,PYO=0,SX=58,SY=58},
        INVIS    ={PX=0.26,PXO=0,PY=0.48,PYO=0,SX=58,SY=58},
    }},
    {name="Merkez",data={
        SHOT_MRD={PX=0.55,PXO=0,PY=0.82,PYO=0,SX=78,SY=78},
        FLING    ={PX=0.66,PXO=0,PY=0.88,PYO=0,SX=62,SY=62},
        KILL_ALL ={PX=0.44,PXO=0,PY=0.88,PYO=0,SX=62,SY=62},
        ESP_BTN  ={PX=0.44,PXO=0,PY=0.75,PYO=0,SX=58,SY=58},
        NINJA    ={PX=0.55,PXO=0,PY=0.72,PYO=0,SX=58,SY=58},
        INVIS    ={PX=0.66,PXO=0,PY=0.75,PYO=0,SX=58,SY=58},
    }},
}
local function ApplyQBPreset(preset)
    for _,btn in ipairs(CreatedButtons) do
        local d=preset.data[btn.Name] if d then
            btn.Position=UDim2.new(d.PX,d.PXO,d.PY,d.PYO)
            btn.Size=UDim2.fromOffset(d.SX,d.SY)
        end
    end
    Notif("Preset: "..preset.name,"",2)
end

-- ============================================================
-- ANA PENCERE (ontop.lua CreateWindow)
-- ============================================================
UI.CreateLoadingScreen()

local Win = UI.CreateWindow({
    Title    = "DEADSHOT",
    Subtitle = "v33.0 | ItsZorlux",
    Tabs = {
        {Name="Main",      Icon="MAIN", Color=Colors.Accent1},
        {Name="ESP",       Icon="ESP",  Color=Colors.Accent3},
        {Name="Farm",      Icon="FARM", Color=Colors.Accent2},
        {Name="Fling",     Icon="FLNG", Color=Colors.Danger},
        {Name="Misc",      Icon="MISC", Color=Colors.Accent4},
        {Name="QB",        Icon="QB",   Color=Colors.Accent1},
        {Name="Settings",  Icon="SET",  Color=Colors.Accent3},
    }
})

-- DS Toggle butonunu yarat, MainPanel referansını ver
_S.mainPanelRef = Win.MainPanel
CreateDSToggleBtn()

-- Kısaltmalar
local function T(tab,title,default,cb) return Win:AddToggleTo(Win:GetPage(tab),title,default,cb) end
local function S(tab,title,min,max,def,suf,cb) return Win:AddSliderTo(Win:GetPage(tab),title,min,max,def,suf,cb) end
local function Btn(tab,text,icon,cb) return Win:AddButtonTo(Win:GetPage(tab),text,icon,cb) end
local function Lbl(tab,text,col) return Win:AddLabel(tab,text,col) end
local function Div(tab) return Win:AddDivider(tab) end

-- ============================================================
-- TAB: MAIN
-- ============================================================
Lbl("Main","— FOV",Colors.Accent3)
S("Main","Field of View",30,120,70,"°",function(v) Camera.FieldOfView=v end)
Btn("Main","Reset FOV","↺",function() Camera.FieldOfView=70 Notif("FOV","70° Reset",2) end)
Div("Main")

Lbl("Main","— 🔫 Sheriff / Combat",Colors.Accent3)
T("Main","Silent Aim (Pred.)",false,function(v) _S.saEnabled=v Notif(v and "SA AÇIK 🎯" or "SA KAPALI","",2) end)
S("Main","Bullet Speed",500,5000,2500,"",function(v) AutoConfig.BulletSpeed=v end)
S("Main","Base Prediction (x100)",1,50,12,"",function(v) AutoConfig.BasePrediction=v/100 end)
S("Main","Ping Multiplier (x10)",1,20,6,"",function(v) AutoConfig.PingMultiplier=v/10 end)
T("Main","Sharp Shooter (Kafa +1.2)",false,function(v) _S.saSharp=v end)
T("Main","Wall Check",false,function(v) _S.saWall=v end)
T("Main","Prediction ESP (Yeşil Kutu)",false,function(v) _S.saShowPred=v if v then CreatePredESP() else UpdatePredESP(nil) end end)
T("Main","Flick Shot (Shift Lock)",false,function(v) _S.flickEnabled=v Notif(v and "Flick ON" or "OFF","",2) end)
T("Main","Aimlock Button",false,function(v)
    _S.aimlockEnabled=v
    if v then CreateAimlockBtn() Notif("Aimlock ON","",2)
    else
        if _S.aimlockGui then _S.aimlockGui:Destroy() _S.aimlockGui=nil end
        if _S.aimlockConn then _S.aimlockConn:Disconnect() _S.aimlockConn=nil end
        _S.aimlockActive=false _S.aimlockTarget=nil Notif("Aimlock OFF","",2)
    end
end)
T("Main","Shot Button",false,function(v)
    if v then CreateShotBtn() else if _S.shotBtnGui then _S.shotBtnGui:Destroy() _S.shotBtnGui=nil end end end)
Btn("Main","Get Gun (GunDrop)","🔫",function() GetGunNow() end)
Div("Main")

Lbl("Main","— 🔪 Murderer / Knife",Colors.Danger)
Btn("Main","Kill All 🔪","⚔",function() AutoKillAll() end)
Btn("Main","Kill Sheriff","🎯",function()
    local s=GetSheriff() if not s then Notif("No Sheriff","",2) return end
    local char=LocalPlayer.Character if not char then return end
    local knife=char:FindFirstChild("Knife")
    if not knife then local bp=LocalPlayer:FindFirstChild("Backpack") if bp then
        local bk=bp:FindFirstChild("Knife") if bk then
            local h2=char:FindFirstChildOfClass("Humanoid") if h2 then h2:EquipTool(bk) task.wait(0.2) knife=char:FindFirstChild("Knife") end end end end
    if knife and s.Character then
        local tr=s.Character:FindFirstChild("HumanoidRootPart") local mr=char:FindFirstChild("HumanoidRootPart")
        if tr and mr then
            local saved=mr.CFrame mr.CFrame=tr.CFrame*CFrame.new(0,0,1.5) task.wait(0.03)
            local stab=knife:FindFirstChild("Stab") or knife:FindFirstChild("Attack") or knife:FindFirstChild("Slash")
            if stab then pcall(function() stab:FireServer("Stab",tr) end) end
            task.wait(0.03) mr.CFrame=saved Notif("Sheriff Killed!",s.Name,2)
        end
    end
end)
T("Main","Knife Silent Aim",false,function(v) _S.knifeSA=v if v then StartKnifeSA() end Notif(v and "Knife SA ON" or "OFF","",2) end)
S("Main","Knife Yatay Pred.",0,500,100,"",function(v) _S.knifeH=v/100 end)
S("Main","Knife Dikey Pred.",0,500,100,"",function(v) _S.knifeV=v/100 end)
T("Main","Kill Aura",false,function(v) _S.killAura=v if v then StartKillAura() end Notif(v and "Kill Aura ON" or "OFF","",2) end)
S("Main","Kill Aura Range",3,60,20,"s",function(v) _S.killAuraRange=v end)
T("Main","Throw Knife Aura",false,function(v) _S.throwAura=v if v then StartThrowAura() end Notif(v and "Throw Aura ON" or "OFF","",2) end)
S("Main","Throw Aura Range",3,80,30,"s",function(v) _S.throwAuraRange=v end)
T("Main","Dual Knife",false,function(v) _S.dualKnife=v if v then SpawnDualVisual("dualKnife","Knife") end end)
T("Main","Dual Gun",false,function(v) _S.dualGun=v if v then SpawnDualVisual("dualGun","Gun") end end)
Div("Main")

Lbl("Main","— 😇 Innocent",Colors.Success)
T("Main","Invisibility",false,function(v)
    _S.invis=v if v then EnableInvis(LocalPlayer.Character) else DisableInvis(LocalPlayer.Character) end
    Notif(v and "Invisible ON 👻" or "OFF","",2) end)
T("Main","Hitbox Expander",false,function(v)
    _S.hitbox=v
    if v then if not _S.hitboxConn then _S.hitboxConn=RunService.Heartbeat:Connect(UpdateHitboxes) end
    else if _S.hitboxConn then _S.hitboxConn:Disconnect() _S.hitboxConn=nil end
        for _,a in pairs(_S.hitboxAdorn) do pcall(function() a:Destroy() end) end _S.hitboxAdorn={} end
end)
S("Main","Hitbox Size",1,25,5,"s",function(v) _S.hitboxSize=v end)
Div("Main")

Lbl("Main","— 🚀 Fly",Colors.Accent4)
S("Main","Fly Speed",10,300,50,"",function(v) _S.flySpeed=v end)
T("Main","Fly (WASD+Space/Shift)",false,function(v)
    _S.fly=v
    if v then
        local char=LocalPlayer.Character if not char then return end
        local torso=char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart") if not torso then return end
        local hum=char:FindFirstChildOfClass("Humanoid") if not hum then return end
        for _,c in pairs(torso:GetChildren()) do if c.Name=="DSFlyMover" then c:Destroy() end end
        local bg=Instance.new("BodyGyro",torso) bg.Name="DSFlyMover" bg.P=20000 bg.MaxTorque=Vector3.new(math.huge,math.huge,math.huge) bg.CFrame=torso.CFrame
        local bv=Instance.new("BodyVelocity",torso) bv.Name="DSFlyMover" bv.Velocity=Vector3.new(0,0.1,0) bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
        local ib=UserInputService.InputBegan:Connect(function(inp,gp)
            if gp or inp.UserInputType~=Enum.UserInputType.Keyboard then return end
            local k=inp.KeyCode.Name:lower()
            if k=="w" then _S.flyDir.f=-1 elseif k=="s" then _S.flyDir.b=1
            elseif k=="a" then _S.flyDir.l=-1 elseif k=="d" then _S.flyDir.r=1 end end)
        local ie=UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType~=Enum.UserInputType.Keyboard then return end
            local k=inp.KeyCode.Name:lower()
            if k=="w" then _S.flyDir.f=0 elseif k=="s" then _S.flyDir.b=0
            elseif k=="a" then _S.flyDir.l=0 elseif k=="d" then _S.flyDir.r=0 end end)
        task.spawn(function()
            while _S.fly and torso and torso.Parent and hum do
                task.wait() pcall(function()
                    if hum:GetState()==Enum.HumanoidStateType.Dead then _S.fly=false return end
                    hum.PlatformStand=true
                    local dir=Vector3.new(_S.flyDir.l+_S.flyDir.r,0,_S.flyDir.f+_S.flyDir.b)
                    local spaceDown=UserInputService:IsKeyDown(Enum.KeyCode.Space)
                    local shiftDown=UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
                    local upDown=spaceDown and Vector3.new(0,1,0) or shiftDown and Vector3.new(0,-1,0) or Vector3.new()
                    local wd=Camera.CFrame:VectorToWorldSpace(dir)
                    bv.Velocity=dir.Magnitude>0 and (wd.Unit+upDown)*_S.flySpeed or upDown*_S.flySpeed
                    bg.CFrame=Camera.CFrame end) end
            pcall(function() bg:Destroy() bv:Destroy() hum.PlatformStand=false end)
            ib:Disconnect() ie:Disconnect() _S.flyDir={f=0,b=0,l=0,r=0}
        end)
    end
end)
Div("Main")

Lbl("Main","— ⚡ Movement",Colors.Warning)
S("Main","Walk Speed",0,250,16,"",function(v) _S.ws.Val=v local h=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if h and not _S.ws.Locked then h.WalkSpeed=v end end)
T("Main","Lock WalkSpeed",false,function(v) _S.ws.Locked=v end)
S("Main","Jump Power",0,250,50,"",function(v) _S.jp.Val=v local h=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if h and not _S.jp.Locked then h.JumpPower=v end end)
T("Main","Lock JumpPower",false,function(v) _S.jp.Locked=v end)
T("Main","Noclip",false,function(v) _S.noclip=v end)
T("Main","Infinite Jump",false,function(v) _S.infJump=v end)
T("Main","Bunny Hop",false,function(v) _S.bunny=v end)
T("Main","Speed Glitch",false,function(v) _S.speedGlitch=v if v then EnableSpeedGlitch() else if _S.speedGlitchConn then _S.speedGlitchConn:Disconnect() _S.speedGlitchConn=nil end end end)
T("Main","Speed Bypass (V tuşu)",false,function(v) _S.speedBypass=v end)
S("Main","Speed Bypass Değeri",1,100,9,"",function(v) _S.speedBypassVal=v end)
T("Main","God Mode",false,function(v) _S.godMode=v if v and LocalPlayer.Character then local h=LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if h then h.MaxHealth=math.huge h.Health=math.huge end end end)

-- ============================================================
-- TAB: ESP
-- ============================================================
Lbl("ESP","— Player ESP",Colors.Accent3)
T("ESP","Highlight ESP",false,function(v) _S.espHL=v if not v then ClearESP() end Notif(v and "ESP AÇIK" or "KAPALI","",2) end)
T("ESP","Billboard (Name+Role+Dist)",false,function(v) _S.espBillboard=v if not v then for p in pairs(_espBB) do RemoveBB(p) end end end)
do
    local filterList={"All","Murderer Only","Sheriff Only","Murderer+Sheriff"}
    local fi=1
    Btn("ESP","ESP Filter: All →","🔄",function()
        fi=fi%#filterList+1 _S.espFilter=filterList[fi] ClearESP()
        Notif("ESP Filter",_S.espFilter,2)
    end)
end
Div("ESP")
Lbl("ESP","— Role Expose",Colors.Warning)
local function SendChat(msg)
    pcall(function()
        if TextChatService and TextChatService:FindFirstChild("TextChannels") and TextChatService.TextChannels:FindFirstChild("RBXGeneral") then
            TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
        else local ce=ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") if ce then ce.SayMessageRequest:FireServer(msg,"All") end end end)
end
local function ExposeR(weapon,role)
    for _,p in pairs(Players:GetPlayers()) do
        local ch=p.Character local bp=p.Backpack
        if (ch and ch:FindFirstChild(weapon)) or (bp and bp:FindFirstChild(weapon)) then
            SendChat(role..": "..p.Name) return true end end return false end
Btn("ESP","Expose Murderer","💬",function() ExposeR("Knife","Murderer") end)
Btn("ESP","Expose Sheriff","💬",function() ExposeR("Gun","Sheriff") end)
local function NotifRole(weapon,role)
    for _,p in pairs(Players:GetPlayers()) do
        local ch=p.Character local bp=p.Backpack
        if (ch and ch:FindFirstChild(weapon)) or (bp and bp:FindFirstChild(weapon)) then
            Notif(role,p.Name,4) return true end end return false end
Btn("ESP","Notify Murderer","🔔",function() NotifRole("Knife","Murderer") end)
Btn("ESP","Notify Sheriff","🔔",function() NotifRole("Gun","Sheriff") end)
do local ntM,ntS=nil,nil
    T("ESP","Auto Notify Murderer",false,function(v)
        if v then ntM=RunService.Heartbeat:Connect(function() if NotifRole("Knife","Murderer") and ntM then ntM:Disconnect() ntM=nil end end)
        elseif ntM then ntM:Disconnect() ntM=nil end end)
    T("ESP","Auto Notify Sheriff",false,function(v)
        if v then ntS=RunService.Heartbeat:Connect(function() if NotifRole("Gun","Sheriff") and ntS then ntS:Disconnect() ntS=nil end end)
        elseif ntS then ntS:Disconnect() ntS=nil end end)
end
Div("ESP")
Lbl("ESP","— Spectate",Colors.TextMuted)
Btn("ESP","Spectate Murderer","👁",function() local m=GetMurderer() if m and m.Character then local h=m.Character:FindFirstChildOfClass("Humanoid") if h then Camera.CameraSubject=h end else Notif("No Murderer","",2) end end)
Btn("ESP","Spectate Sheriff","👁",function() local s=GetSheriff() if s and s.Character then local h=s.Character:FindFirstChildOfClass("Humanoid") if h then Camera.CameraSubject=h end else Notif("No Sheriff","",2) end end)
Btn("ESP","Stop Spectating","↩",function() if LocalPlayer.Character then local h=LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if h then Camera.CameraSubject=h end end end)

-- ============================================================
-- TAB: FARM
-- ============================================================
Lbl("Farm","— Coin Farm (Wraith Tabanlı)",Colors.Accent3)
T("Farm","Auto Farm Coins",false,function(v)
    _S.coinFarm=v if v then WraithAutofarm() Notif("Coin Farm ON 💰","firetouchinterest",2)
    else Notif("Coin Farm OFF","",2) end end)
do
    local modeList={"Nearest","Random"} local mi=1
    Btn("Farm","Mode: Nearest →","🔄",function()
        mi=mi%#modeList+1 _S.coinMode=modeList[mi] Notif("Coin Mode",_S.coinMode,2) end)
end
T("Farm","Smart Farm (Bag Full Action)",false,function(v) _S.smartFarm=v end)
T("Farm","Auto Fling Murderer (Bag Full)",false,function(v) _S.autoFlingMurderer=v end)
T("Farm","Spin (Coin Collect)",false,function(v)
    _S.spinEnabled=v
    if v then local rp=(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
        _S.spinConn=RunService.RenderStepped:Connect(function(_) if _S.spinEnabled and rp then rp.CFrame=rp.CFrame*CFrame.Angles(0,math.rad(_S.spinSpeed),0) end end)
    else if _S.spinConn then _S.spinConn:Disconnect() _S.spinConn=nil end end end)
S("Farm","Spin Speed",1,30,5,"",function(v) _S.spinSpeed=v end)
T("Farm","Anti-AFK",false,function(v)
    if v then _S.antiAFKConn=LocalPlayer.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0,0),Camera.CFrame) task.wait(10) VirtualUser:Button2Up(Vector2.new(0,0),Camera.CFrame) end)
    elseif _S.antiAFKConn then _S.antiAFKConn:Disconnect() _S.antiAFKConn=nil end end)
Div("Farm")

Lbl("Farm","— 💣 Bomb Jump",Colors.Warning)
T("Farm","Bomb Jump (Dokunma/Tık)",false,function(v) _S.bjEnabled=v end)
T("Farm","Ninja Step (5s Speed Boost)",false,function(v) _S.ninjaEnabled=v end)
Btn("Farm","⚡ Ninja Step Aktifleştir","⚡",function() NinjaStepActivate() end)
T("Farm","Auto Get Fake Bomb",false,function(v) _S.bjAutoGet=v end)
Btn("Farm","Get Fake Bomb","💣",function()
    pcall(function() ReplicatedStorage.Remotes.Extras.ReplicateToy:InvokeServer("FakeBomb") end)
    Notif("Bomb","Requested!",2) end)
Btn("Farm","Manuel Bomb Jump","💥",function() FastBombJump() end)
T("Farm","BJ Button (Ekranda Göster)",false,function(v)
    if v then
        if _S.bjGui then _S.bjGui:Destroy() end
        _S.bjGui=Instance.new("ScreenGui") _S.bjGui.Name="DSBJGui" _S.bjGui.ResetOnSpawn=false _S.bjGui.Parent=LocalPlayer:WaitForChild("PlayerGui")
        _S.bjBtn=Instance.new("TextButton",_S.bjGui) _S.bjBtn.Text="💣" _S.bjBtn.TextSize=_S.bjSize/3.5
        _S.bjBtn.Size=UDim2.new(0,_S.bjSize,0,_S.bjSize) _S.bjBtn.Position=UDim2.new(0.5,-_S.bjSize/2,0.84,0)
        _S.bjBtn.BackgroundColor3=CR(25,20,40) _S.bjBtn.TextColor3=C_WHITE _S.bjBtn.Font=Enum.Font.GothamBold _S.bjBtn.BackgroundTransparency=0.2
        Instance.new("UICorner",_S.bjBtn).CornerRadius=UDim.new(1,0)
        MakeDraggable(_S.bjBtn)
        _S.bjBtn.MouseButton1Click:Connect(function() if not _S.bjOnCD then FastBombJump() end end)
    else if _S.bjGui then _S.bjGui:Destroy() _S.bjGui=nil _S.bjBtn=nil end end end)

-- ============================================================
-- TAB: FLING (Wraith BV sistemi)
-- ============================================================
Lbl("Fling","— Role Fling",Colors.Danger)
Btn("Fling","Fling Murderer 🌪️","🌪",function() FlingMurderer() end)
Btn("Fling","Fling Sheriff 🌪️","🌪",function() FlingSheriff() end)
Btn("Fling","Fix Bug (OldPos)","+",function()
    local mr=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if mr and getgenv().OldPos then mr.CFrame=getgenv().OldPos Notif("Fixed!","",2)
    else Notif("Kaydedilmiş konum yok","",2) end end)
Div("Fling")

Lbl("Fling","— Player Select",Colors.Accent3)
Btn("Fling","Oyuncu Listesi","📋",function()
    local names={}
    for _,p in ipairs(Players:GetPlayers()) do if p~=LocalPlayer then table.insert(names,p.Name) end end
    Notif("Oyuncular",table.concat(names,", "),5)
end)
Btn("Fling","Murderer'ı Seç","🔪",function()
    local m=GetMurderer() if m then SelectPlayer(m.Name) else Notif("Murderer yok","",2) end end)
Btn("Fling","Sheriff'i Seç","🔫",function()
    local s=GetSheriff() if s then SelectPlayer(s.Name) else Notif("Sheriff yok","",2) end end)
Div("Fling")

Lbl("Fling","— Seçili Oyuncu",Colors.Accent4)
Btn("Fling","TP to Selected","📍",function()
    if not _S.selPlayer then Notif("Oyuncu seç","",2) return end
    local mr=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local tr=_S.selPlayer.Character and _S.selPlayer.Character:FindFirstChild("HumanoidRootPart")
    if mr and tr then mr.CFrame=tr.CFrame end end)
T("Fling","Loop TP",false,function(v)
    _S.loopTP=v if v and _S.selPlayer then task.spawn(function()
        while _S.loopTP and _S.selPlayer and _S.selPlayer.Parent do
            local mr=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local tr=_S.selPlayer.Character and _S.selPlayer.Character:FindFirstChild("HumanoidRootPart")
            if mr and tr then mr.CFrame=tr.CFrame end task.wait() end end) end end)
Btn("Fling","Fling Selected","🌪",function()
    if _S.selPlayer then MiniFling(_S.selPlayer) else Notif("Oyuncu seç","",2) end end)
T("Fling","Loop Fling",false,function(v)
    _S.loopFling=v if v and _S.selPlayer then task.spawn(function()
        while _S.loopFling and _S.selPlayer and _S.selPlayer.Parent do MiniFling(_S.selPlayer) task.wait(0.5) end end) end end)
T("Fling","Orbit (Etrafında Dön)",false,function(v)
    _S.orbit=v if _S.orbitConn then _S.orbitConn:Disconnect() end
    if v and _S.selPlayer then local angle=0
        _S.orbitConn=RunService.Heartbeat:Connect(function()
            if not _S.orbit then return end
            local mr=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local tr=_S.selPlayer.Character and _S.selPlayer.Character:FindFirstChild("HumanoidRootPart")
            if mr and tr then angle=angle+8 mr.CFrame=CFrame.new(tr.Position)*CFrame.Angles(0,math.rad(angle),0)*CFrame.new(10,0,0) end end) end end)
T("Fling","Death Notify",false,function(v)
    _S.deathNotify=v if _S.deathConn then _S.deathConn:Disconnect() _S.deathConn=nil end
    if v and _S.selPlayer then
        local h=_S.selPlayer.Character and _S.selPlayer.Character:FindFirstChildOfClass("Humanoid")
        if h then _S.deathConn=h.Died:Connect(function() Notif("Öldü!",_S.selPlayer.DisplayName,4) end) end end end)
Div("Fling")

Lbl("Fling","— Advanced Fling",Colors.Warning)
T("Fling","Fling Aura (10 studs)",false,function(v)
    _S.flingAura=v if v then task.spawn(function()
        while _S.flingAura do
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                for _,P in pairs(Players:GetPlayers()) do
                    if P~=LocalPlayer and P.Character and P.Character:FindFirstChild("HumanoidRootPart") then
                        if(LocalPlayer.Character.HumanoidRootPart.Position-P.Character.HumanoidRootPart.Position).Magnitude<=10 then MiniFling(P) end end end end
            task.wait(0.5) end end) end end)
T("Fling","Click Fling",false,function(v) _S.clickFling=v end)
T("Fling","Fling All",false,function(v)
    _S.flingAll=v if v then task.spawn(function()
        while _S.flingAll do task.spawn(function() FlingPlayers(nil,true) end) task.wait(0.5) end end) end end)
T("Fling","Anti Fling",false,function(v)
    _S.antiFling=v
    if v then for _,P in pairs(Players:GetPlayers()) do if P~=LocalPlayer then
        local c=RunService.Stepped:Connect(function()
            if P.Character then for _,d in pairs(P.Character:GetDescendants()) do if d:IsA("BasePart") and d.CanCollide then d.CanCollide=false end end end end)
        table.insert(_S.antiFlingConns,c) end end
    else for _,c in pairs(_S.antiFlingConns) do c:Disconnect() end table.clear(_S.antiFlingConns) end end)

-- ============================================================
-- TAB: MISC
-- ============================================================
Lbl("Misc","— Visual",Colors.Accent3)
T("Misc","Fullbright",false,function(v)
    if v then Lighting.Brightness=10 Lighting.GlobalShadows=false Lighting.Ambient=CR(255,255,255)
    else Lighting.Brightness=1 Lighting.GlobalShadows=true Lighting.Ambient=CR(127,127,127) end end)
T("Misc","Remove Fog",false,function(v) Lighting.FogEnd=v and 1e6 or 100000 end)
T("Misc","Crosshair Overlay",false,function(v)
    _S.crosshair=v
    if v then CreateCrosshair() else if _S.crosshairGui then _S.crosshairGui:Destroy() _S.crosshairGui=nil end end end)
T("Misc","Color Correction (Mor Ton)",false,function(v)
    local cc=Lighting:FindFirstChild("DSCC")
    if v then if not cc then cc=Instance.new("ColorCorrectionEffect",Lighting) cc.Name="DSCC"
        cc.Brightness=0.05 cc.Contrast=0.1 cc.Saturation=0.2 cc.TintColor=CR(139,0,255) end
    else if cc then cc:Destroy() end end end)
Div("Misc")
Lbl("Misc","— Tools",Colors.TextMuted)
local function LS(url) task.spawn(function() pcall(function() loadstring(game:HttpGet(url))() end) end) end
Btn("Misc","Inf Yield","🔧",function() LS("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source") end)
Btn("Misc","Dex Explorer","🔍",function() LS("https://rawscripts.net/raw/Universal-Script-Classic-Dex-Explorer-21009") end)
Btn("Misc","Remote Spy","👁",function() LS("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua") end)
Btn("Misc","Rejoin","↺",function() game:GetService("TeleportService"):Teleport(game.PlaceId) end)
Btn("Misc","Reset","💀",function() local h=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if h then h.Health=0 end end)

-- ============================================================
-- TAB: QB (Quick Buttons + Streaming + HUD)
-- ============================================================
Lbl("QB","— Quick Buttons",Colors.Accent1)
T("QB","Tüm Butonları Göster",false,function(v)
    for _,btn in ipairs(CreatedButtons) do btn.Visible=v end end)
Div("QB")

Lbl("QB","— Edit Mode",Colors.Warning)
Btn("QB","✏ Edit Mode Aç/Kapat","✏",function()
    _S.editMode=not _S.editMode
    if not _S.editMode and SelectedButton then SelectedButton.BackgroundColor3=CR(20,18,30) SelectedButton=nil end
    RefreshEditLabel() Notif(_S.editMode and "✏ Edit Mode ON" or "Edit Mode OFF","",2) end)
Btn("QB","💾 Save Layout","💾",function() SaveLayout() end)
Btn("QB","📂 Load Layout","📂",function() LoadLayout() Notif("Yüklendi ✅","",2) end)
S("QB","Buton Boyutu",40,120,68,"px",function(v)
    _S.bjSize=v for _,btn in ipairs(CreatedButtons) do btn.Size=UDim2.fromOffset(v,v) end end)
Div("QB")

Lbl("QB","— Layout Presets",Colors.Accent3)
for _,preset in ipairs(QB_PRESETS) do
    local p=preset
    Btn("QB","📱 "..p.name,"📱",function() ApplyQBPreset(p) end)
end
Div("QB")

Lbl("QB","— Streaming Mode 🎬",Colors.Accent4)
T("QB","Streaming Mode (Kill FX + Trail + Glow)",false,function(v)
    _S.streamingMode=v
    if v then EnableStreamingMode() Notif("🎬 Streaming Mode ON","Kill FX + Trail",3)
    else DisableStreamingMode() Notif("Streaming Mode OFF","",2) end end)
T("QB","Character Trail",false,function(v)
    if v then CreateCharTrail() else RemoveCharTrail() end end)
T("QB","Knife Trail",false,function(v)
    if v then CreateKnifeTrail() else
        local char=LocalPlayer.Character if char then
            local knife=char:FindFirstChild("Knife") if knife then
                local handle=knife:FindFirstChild("Handle") if handle then
                    for _,vv in pairs(handle:GetChildren()) do if vv.Name=="DSKnifeTrail" then vv:Destroy() end end end end end
    end end)
Div("QB")

Lbl("QB","— HUD",Colors.Accent3)
T("QB","Kill Counter HUD",false,function(v)
    if v then CreateKillHUD() else if _S.killHudGui then _S.killHudGui:Destroy() _S.killHudGui=nil end end end)
T("QB","Round Timer HUD",false,function(v)
    if v then CreateRoundTimerHUD() else if _S.roundTimerGui then _S.roundTimerGui:Destroy() _S.roundTimerGui=nil end end end)
T("QB","Role Toast (Round Start)",true,function(v) _S.roleToast=v end)

-- ============================================================
-- TAB: SETTINGS
-- ============================================================
Lbl("Settings","— UI",Colors.Accent3)
T("Settings","FPS/Ping Counter",true,function(v)
    _S.showStats=v if v then CreateFPS() else if _S.fpsGui then _S.fpsGui:Destroy() _S.fpsGui=nil end end end)
Div("Settings")
Lbl("Settings","— Config",Colors.TextMuted)
Btn("Settings","💾 Save Settings","💾",function() Win.SaveSettings() end)
Btn("Settings","📂 Load Settings","📂",function() Win.LoadSettings() end)
Div("Settings")
Lbl("Settings","— Info",Colors.TextMuted)
Btn("Settings","DeadShot Hub v33.0","⭐",function()
    Notif("DeadShot Hub v33","ItsZorlux | ontop.lua UI | Wraith Fling+Farm",4) end)
Btn("Settings","Tüm GUI'yi Temizle","🗑",function()
    for _,sg in pairs(CoreGui:GetChildren()) do
        if sg.Name:find("^DS") then pcall(function() sg:Destroy() end) end end
    Notif("Temizlendi","Yeniden başlatın.",2) end)

-- ============================================================
-- QUICK BUTTONS OLUŞTUR
-- ============================================================
local qSHOOT = CreateQBtn("SHOT_MRD",UDim2.new(0.82,0,0.55,0),"🎯\nSHOOT",function() SAShoot() end)
CreateQBtn("FLING",    UDim2.new(0.82,0,0.72,0),"🌪️\nFLING",   function() FlingMurderer() end)
CreateQBtn("KILL_ALL", UDim2.new(0.82,0,0.38,0),"🔪\nKILL\nALL",function() AutoKillAll() end)
CreateQBtn("ESP_BTN",  UDim2.new(0.72,0,0.55,0),"👁️\nESP",     function()
    _S.espHL=not _S.espHL if not _S.espHL then ClearESP() end UpdateESP()
    for _,b in ipairs(CreatedButtons) do if b.Name=="ESP_BTN" then
        b.Text=_S.espHL and "👁️\nESP\nON" or "👁️\nESP" break end end
end)
CreateQBtn("NINJA",    UDim2.new(0.72,0,0.72,0),"🥷\nNINJA",   function()
    if not _S.ninjaEnabled then _S.ninjaEnabled=true end NinjaStepActivate()
end)
CreateQBtn("INVIS",    UDim2.new(0.72,0,0.38,0),"👻\nINVIS",   function()
    _S.invis=not _S.invis
    if _S.invis then EnableInvis(LocalPlayer.Character) else DisableInvis(LocalPlayer.Character) end
    for _,b in ipairs(CreatedButtons) do if b.Name=="INVIS" then
        b.Text=_S.invis and "👻\nINVIS\nON" or "👻\nINVIS" break end end
end)
CreateQBtn("GUN",      UDim2.new(0.62,0,0.55,0),"🔫\nGET\nGUN", function() GetGunNow() end)
CreateQBtn("BOMB",     UDim2.new(0.62,0,0.72,0),"💣\nBOMB\nJUMP",function() FastBombJump() end)
CreateQBtn("KNIFE_SA", UDim2.new(0.62,0,0.38,0),"🎯\nKNIFE\nSA",function()
    _S.knifeSA=not _S.knifeSA if _S.knifeSA then StartKnifeSA() end
    for _,b in ipairs(CreatedButtons) do if b.Name=="KNIFE_SA" then
        b.Text=_S.knifeSA and "🎯\nKNIFE\nSA ON" or "🎯\nKNIFE\nSA" break end end
end)

-- SHOT_MRD double-tap lock
do
    local locked=false local lastTap=0
    qSHOOT.MouseButton1Click:Connect(function()
        if _S.editMode then return end
        local now=tick()
        if now-lastTap<0.35 then
            locked=not locked
            qSHOOT.Text=locked and "🎯\nSHOOT\n🔒" or "🎯\nSHOOT"
            local meta=_BtnMeta[qSHOOT]
            if meta then meta.st.Color=locked and C_GOLD or CR(200,150,255) end
            lastTap=0 return
        end
        lastTap=now
        if not locked then SAShoot() end
    end)
end

-- Respawn → trail yenile
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if _S.streamingMode then CreateCharTrail() end
end)

-- Layout yükle
pcall(LoadLayout)

-- ============================================================
-- STARTUP
-- ============================================================
CreateFPS()

Notif(
    "DeadShot Hub v33 🎯",
    "DS butonu = Aç/Kapat | RightControl da çalışır\nWraith Fling+Farm | Kill HUD | Round Timer | DS Toggle",
    6
)
