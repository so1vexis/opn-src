loadstring(game:HttpGet('https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua'))()

local v1 = loadstring(game:HttpGet('https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua'))()

v1:Notify({
    Title = 'Tiger X Hub V3.5',
    Description = 'Welcome To Tiger X Hub',
}, {
    OutlineColor = Color3.fromRGB(80, 80, 80),
    Time = 5,
    Type = 'default',
})
wait(1)
v1:Notify({
    Title = 'Tiger X Hub V3.5',
    Description = 'Wait',
}, {
    OutlineColor = Color3.fromRGB(80, 80, 80),
    Time = 5,
    Type = 'default',
})
wait(1)
v1:Notify({
    Title = 'Tiger X Hub V3.5',
    Description = 'Done Thank you for using it',
}, {
    OutlineColor = Color3.fromRGB(80, 80, 80),
    Time = 5,
    Type = 'default',
})

local u2 = loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Omg-/main/Ohman'))()
local u3 = {
    SchemeColor = Color3.fromRGB(72, 202, 46),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20),
}
local _TigerXHubV35 = u2.CreateLib('Tiger X Hub V3.5', u3)
local _Players = game:GetService('Players')
local _Name = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name
local _LocalPlayer = _Players.LocalPlayer
local _Name2 = _LocalPlayer.Name
local _DisplayName = _LocalPlayer.DisplayName
local _PlaceId = game.PlaceId
local _UserId = _LocalPlayer.UserId
local _ = _LocalPlayer.Character
local _AccountAge = _LocalPlayer.AccountAge
local u13 = #game.Players:GetPlayers()
local u14 = identifyexecutor()
local _Home = _TigerXHubV35:NewTab('Home'):NewSection('Home')

_Home:NewButton('Username: ' .. _Name2 .. '', '', function()
    setclipboard('' .. _Name2 .. '')
end)
_Home:NewButton('Display: ' .. _DisplayName .. '', '', function()
    setclipboard('' .. _DisplayName .. '')
end)
_Home:NewButton('Player Id: ' .. _UserId .. '', '', function()
    setclipboard('' .. _UserId .. '')
end)
_Home:NewButton('Account Age: ' .. _AccountAge .. '', '', function()
    setclipboard('' .. _AccountAge .. '')
end)
_Home:NewButton('Executor: ' .. u14 .. '', '', function()
    setclipboard('' .. u14 .. '')
end)
_Home:NewButton('Game Name: ' .. _Name .. '', '', function()
    setclipboard('' .. _Name .. '')
end)
_Home:NewButton('Game Id: ' .. _PlaceId .. '', '', function()
    setclipboard('' .. _PlaceId .. '')
end)
_Home:NewButton('Players In Server: ' .. u13 .. '', '', function()
    setclipboard('' .. u13 .. '')
end)

local _Scripts = _TigerXHubV35:NewTab('Scripts'):NewSection('Scripts')

_Scripts:NewButton('Keyboard', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/kC3dAMvt'))()
end)
_Scripts:NewButton('Keyboard V3', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/DHBCommunity/DHBOfficialScript/main/mobkeyboardv3'))()
end)
_Scripts:NewButton('LALOL Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
end)
_Scripts:NewButton('Arosia', 'ButtonInfo', function()
    loadstring(Game:GetObjects('rbxassetid://1255908305')[1].Source)()
end)
_Scripts:NewButton('fly gui v3 (UPDATED)', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Universal-Script-I-Fly-gui-V3-I-6627'))()
end)
_Scripts:NewButton('perm tp tool', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastefy.app/IpjIW7ZH/raw'))()
end)
_Scripts:NewButton('Admin Chat', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/game-hax/uca/main/release/uca.min.lua'))()
end)
_Scripts:NewButton('QuirkyCMD', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw'))()
end)
_Scripts:NewButton('Time Stop', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/djAd7g2W'))()
end)
_Scripts:NewButton('Pshader V5.4', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastefy.app/xXkUxA0P/raw', true))()
end)
_Scripts:NewButton('Realistic Cam', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/kuK0XYAg', true))()
end)
_Scripts:NewButton('Spectate', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Spectate-Gui/main/Spectate'))()
end)
_Scripts:NewButton('FreeCam', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/zephyr10101/CameraSpy/main/Script', true))()
end)
_Scripts:NewButton('Touch Fling', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI'))()
end)
_Scripts:NewButton('Animation Pack Gui', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui', true))()
end)
_Scripts:NewButton('F3X', 'ButtonInfo', function()
    loadstring(game:GetObjects('rbxassetid://6695644299')[1].Source)()
end)
_Scripts:NewButton('FE Climb Walls', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_E872F3ky4888TSVdj6Adgi1hSLtM038AyxVpTVw07QA3QUDcI3sxmuD869hYR4id.lua.txt'))()
end)
_Scripts:NewButton('Car Fly', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/MHE1cbWF'))()
end)
_Scripts:NewButton('Advaced User Info', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/vortexexecutor/vortexscripts/main/userinfo'))()
end)
_Scripts:NewButton('Noclip', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/6T4skKuj'))()
end)
_Scripts:NewButton('Permanent ShiftLock', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Baseplate-Universal-Script-Permanent-Shift-Lock-6924'))()
end)
_Scripts:NewButton('Bypass Chat', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastes.io/raw/lstrrfipqq'))()
end)
_Scripts:NewButton('FE Chat draw', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Fe%20Chat%20Draw'))()
end)
_Scripts:NewButton('Mouse Cursor V2', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastefy.app/58d8d52G/raw'))()
end)
_Scripts:NewButton('Boombox', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/D184sp8a'))()
end)
_Scripts:NewButton('FE Sonic Speed', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt'))()
end)
_Scripts:NewButton('FE Car', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MonkoTubeYT/carscript/master/!carscript.lua', true))()
end)
_Scripts:NewButton('R6', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/uddpLUvu'))()
end)

local _Hub = _TigerXHubV35:NewTab('Hub')
local _Hub2 = _Hub:NewSection('Hub')

_Hub2:NewButton('Alysse Hub V0.3', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NathTheDev/AlysseAndroid/main/loader.lua'))()
end)
_Hub2:NewButton('Multi Scripter X', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GamerScripter/Multi-Scripter-X/main/loader'))()
end)
_Hub2:NewButton('Plenum V0.5.1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GamerScripter/Plenum-Hub/main/loader'))()
end)
_Hub2:NewButton('GHUB V14', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/gclich/GHUBV14XZ/main/Ghub_Main_Loader.txt'))()
end)
_Hub2:NewButton('Blizzard Hub V1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/uaahjajajqoqiqkqhwhwhw/Blizzard-Hub-Official/main/Blizzard%20Hub.lua'))()
end)
_Hub2:NewButton('Game Hub V5', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader'))()
end)
_Hub2:NewButton('Haxker_66666666 Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FreeRobloxScripts1/Haxker_6666666-Hub/main/loader'))()
end)
_Hub2:NewButton('Ghost Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
end)
_Hub2:NewButton('Karlix Hub V0.1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Jezxboi/KarlixV1/main/KarlixV1'))()
end)
_Hub2:NewButton('GigaChad V5.5', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/OWJBWKQLAISH/GigaChad-Hub/main/Protected_3038811338432694.lua.txt'))()
end)
_Hub2:NewButton('Pendulum Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua'))()
end)
_Hub2:NewButton('Sky Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Universal-Script-Sky-Hub-10706'))()
end)
_Hub2:NewButton('Equinox Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/NewHubX.txt'))()
end)
_Hub2:NewButton('Void Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Universal-Script-Void-Hub-11130'))()
end)
_Hub2:NewButton('Butif Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NEWBUTIF/Universal-Script-Hub/main/Butif%20Hub'))()
end)
_Hub2:NewButton('Junko Hub V5', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Juanko-Scripts/Roblox-scripts/main/Juanko%20Universal%20Hub%20OfuscasteLinkServerFile73829273728288ejfjshsrytdoudt7do'))()
end)
_Hub2:NewButton('SnapDragon Hub', 'Key:SnapDragon', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Ruszelds/Snap/main/Dragon', true))()
end)
_Hub2:NewButton('OrangeX Hub V4', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ImJosh66/OrangeX-Hub-V4/main/Protected%20V4%20OrangeX%20TOP.txt'))()
end)
_Hub2:NewButton('British Hub V17', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RedCoat7888/BH/main/Protected_6274400031599569.lua%20(1).txt'))()
end)

local _OLDVersionofMyHub = _Hub:NewSection('OLD Version of My Hub')

_OLDVersionofMyHub:NewButton('Tiger X Hub V2', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/balintTheDevX/TigerX-V2/main/Back'))()
end)
_OLDVersionofMyHub:NewButton('Tiger X Hub V1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/balintTheDevX/TigerXhubV1/main/TigerXHubV1'))()
end)

local _Games = _TigerXHubV35:NewTab('Games')
local _PrisonLife = _Games:NewSection('Prison Life')

_PrisonLife:NewButton('Fe Bypass', 'ButtonInfo', function()
    loadstring('loadstring(game:HttpGet("https://raw.githubusercontent.com/g00lXploiter/g00lXploiter/main/Fe%20bypass", true))()\n')()
end)
_PrisonLife:NewButton('Tiger Admin', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/dalloc2/Roblox/main/TigerAdmin.lua'))()
end)
_PrisonLife:NewButton('PrisionWare', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/WinterDinder/56-Clubs-Prison-Life-REMASTERED-SCRIPT/main/Main', true))()
end)
_PrisonLife:NewButton('PrisonBreaker V1.5', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/ryt9hGz6'))()
end)
_PrisonLife:NewButton('Tbao Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tbao143/thaibao/main/TbaohubPrisonLife'))()
end)

local _Brookhaven = _Games:NewSection('Brookhaven')

_Brookhaven:NewButton('JulHub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/JulHubz/JulHub/main/JulHub'))()
end)
_Brookhaven:NewButton('Redz Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/REDzHUB/REDzHUB/main/REDzHUB'))()
end)
_Brookhaven:NewButton('Random Brookhaven Script', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://freenote.biz/raw/uWOAu0F62v', true))()
end)
_Brookhaven:NewButton('R4D', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script'))()
end)

local _BladeBall = _Games:NewSection('Blade Ball')

_BladeBall:NewButton('Bedol Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/nqxlOfc/Loaders/main/Blade_Ball.lua'))()
end)
_BladeBall:NewButton('EminX Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoader.lua', true))()
end)
_BladeBall:NewButton('Freya Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Athenamikaela/Freya/main/Freya%20by%20lenny'))()
end)
_BladeBall:NewButton('Gblade Hub V5', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GearV4/GBlade-V5/main/GBlade%20V5'))()
end)

local _MM2 = _Games:NewSection('MM2')

_MM2:NewButton('Highlight MM2', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Main'))()
end)
_MM2:NewButton('Vynixu', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Neon-Fox/roblox-scripts/main/VynixuMM2'))()
end)
_MM2:NewButton('Esp Charm', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://github.com/TheXploiterYT/scripts/raw/main/mm2chams'))()
end)
_MM2:NewButton('Eclipse Hub', 'ButtonInfo', function()
    getgenv().mainKey = 'nil'

    local v25 = loadstring
    local v26 = not request and (not (http_request or http and http.request) and syn)

    if v26 then
        v26 = syn.request
    end

    local v27 = assert
    local v28 = tostring
    local v29 = 'https://api.eclipsehub.xyz/auth'
    local v30

    if v25 then
        v30 = v26
    else
        v30 = v25
    end

    v27(v30, 'Executor not Supported')
    v25(v26({
        Url = v29 .. '?key=' .. v28(mainKey),
        Headers = {
            ['User-Agent'] = 'Eclipse',
        },
    }).Body)()
end)

local _Jailbreak = _Games:NewSection('Jailbreak')

_Jailbreak:NewButton('Universal Farm (Free)', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BlitzIsKing/UniversalFarm/main/Loader/Regular'))()
end)
_Jailbreak:NewButton('Project Auto V3', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Pxsta72/ProjectAuto/main/paid2'))()
end)
_Jailbreak:NewButton('Project Auto V2', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Jailbreak-project-auto-autorob-and-autoarrest-6846'))()
end)

local _Bedwars = _Games:NewSection('Bedwars')

_Bedwars:NewButton('Vape V4', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua', true))()
end)
_Bedwars:NewButton('AISploit', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/AlSploit/AlSploit/main/Bedwars'))()
end)

local _PetSim99 = _Games:NewSection('Pet Sim 99')

_PetSim99:NewButton('RedzHub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua'))()
end)
_PetSim99:NewButton('LDS Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/limaspeedy/limaspeedy/main/HubLDS'))()
end)
_PetSim99:NewButton('River Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/SKOIXLL/RIVERHUB-SKYHUB/main/WL.lua'))()
end)
_PetSim99:NewButton('Syrex Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://syrexhub.netlify.app/raw/petsimulator99/syrexhub'))()
end)

local _Piggy = _Games:NewSection('Piggy')

_Piggy:NewButton('T hub', 'ButtonInfo', function()
    _G.Key = 'E3R-O399-NIL'

    loadstring(game:HttpGet('https://raw.githubusercontent.com/BaconBABA/T-HUB/main/Main', true))()
end)
_Piggy:NewButton('Liver ZMods', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://encurtador.com.br/fiyFJ'))()
end)
_Piggy:NewButton('Peppa Script', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/ZNDQBwFy'))()
end)

local _BloxFruit = _Games:NewSection('BloxFruit')

_BloxFruit:NewButton('HOHO Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
end)
_BloxFruit:NewButton('Makori Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Domadicoof/Domadicoof/main/NewHubX.txt'))()
end)
_BloxFruit:NewButton('Modz Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1f0yt/community/master/modz'))()
end)
_BloxFruit:NewButton('Adel Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/AdelOnTheTop/Adel-Hub/main/Main.lua'))()
end)
_BloxFruit:NewButton('Achemy Hub V2', 'ButtonInfo', function()
    v = 1

    loadstring(game:HttpGet('https://alchemyhub.xyz/v2'))()
end)
_BloxFruit:NewButton('RedzHub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999'))()
end)
_BloxFruit:NewButton('WI-AZUR', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua'))()
end)
_BloxFruit:NewButton('Min Gaming Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Basicallyy/Basicallyy/main/MinGamingV4.lua'))()
end)
_BloxFruit:NewButton('Speed Hub X', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX', true))()
end)

local _AdoptMe = _Games:NewSection('Adopt Me')

_AdoptMe:NewButton('JulHub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/JulHubz/JulHub/main/JulHub'))()
end)
_AdoptMe:NewButton('Eclipse Hub', 'ButtonInfo', function()
    getgenv().mainKey = 'nil'

    local v37 = loadstring
    local v38 = not request and (not (http_request or http and http.request) and syn)

    if v38 then
        v38 = syn.request
    end

    local v39 = assert
    local v40 = tostring
    local v41 = 'https://api.eclipsehub.xyz/auth'
    local v42

    if v37 then
        v42 = v38
    else
        v42 = v37
    end

    v39(v42, 'Executor not Supported')
    v37(v38({
        Url = v41 .. '?key=' .. v40(mainKey),
        Headers = {
            ['User-Agent'] = 'Eclipse',
        },
    }).Body)()
end)
_Games:NewSection('The Strongest BattleGround'):NewButton('OP Random Script 1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastefy.app/REPoaFWC/raw', true))()
end)
_Games:NewSection('Car Dealership'):NewButton('Tora is Me', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Marco8642/science/main/car%20dealer', true))()
end)
_Games:NewSection('Doors'):NewButton('DarkCheatClient', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/VaniaPerets/FolderGui-FolderHub/main/loader.lua', true))()
end)

local _InfectiousSmile = _Games:NewSection('Infectious Smile')

_InfectiousSmile:NewButton('Op Script 1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/TqgbdDjF'))()
end)
_InfectiousSmile:NewButton('Nicuse', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/InfectiousSmile.lua', true))()
end)
_Games:NewSection('Bloxburg'):NewButton('Vysor (Free)', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://vysorbloxburg.vercel.app/free.lua', true))()
end)
_Games:NewSection('Bakugan Brawl Simulator'):NewButton('Inf Coins', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Bac0nHck/Scripts/main/Bakugan%20Brawl%20Simulator'))()
end)

local _Towerofhell = _Games:NewSection('Tower of hell')

_Towerofhell:NewButton('Vulture Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NoahCodeMaster/NoahsHub/main/Games/Toh.lua'))()
end)
_Towerofhell:NewButton('TheMystery_O_O', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/BbVHjH56'))()
end)
_Games:NewSection('Money Grab Simulator'):NewButton('Inf Strenght Inf Money', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Hah/main/Me%20and%20my%20monkeh'))()
end)
_Games:NewSection('Ultimate Factory Tycoon'):NewButton('Inf Money', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/AdminEvilDRagon/Ultimate-Factory-Tycoon/main/UFT.Lua'))()
end)
_Games:NewSection('Running Simulator'):NewButton('56 Clubs', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/WinterDinder/Running-Simulator/main/Main'))()
end)

local _Breakin2 = _Games:NewSection('Break in 2')

_Breakin2:NewButton('Jn hh and Playvora_ Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://freenote.biz/raw/80jXm2Q0a7'))()
end)
_Breakin2:NewButton('Breaking Blitz', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/BreakIn2.lua'))()
end)

local _NaturalDisasterSurvival = _Games:NewSection('Natural Disaster Survival')

_NaturalDisasterSurvival:NewButton('Six Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ySixxNz/Natural-Desastre/SIX-MENU/SIX-HUB-NATURAL-DESASTRE'))()
end)
_NaturalDisasterSurvival:NewButton('Rochips V0.1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/Vnqmafp0'))()
end)
_NaturalDisasterSurvival:NewButton('Natural Disaster Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/SmartModBoy/VortexAblity/main/SV'))()
end)
_Games:NewSection('Taxi Boss'):NewButton('Random Script', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/5ScA4pR9'))()
end)

local _DoomspriteBrickbattle = _Games:NewSection('Doomsprite Brickbattle')

_DoomspriteBrickbattle:NewButton('No Coldown', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/hanzakun/Roblox-Scripts/main/Doomspire%20Brickbattle.lua'))()
end)
_DoomspriteBrickbattle:NewButton('Brick Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Yousuck780/brickhub/main/V1'))()
end)

local _MurderVsSheriff = _Games:NewSection('Murder Vs Sheriff')

_MurderVsSheriff:NewButton('Ruby Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Deni210/murdersvssherrifsduels/main/rubyhub'))()
end)
_MurderVsSheriff:NewButton('Murder Vs Sheriff Duel', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/vjTWQ8wW'))()
end)

local _NinjaLegend = _Games:NewSection('Ninja Legend')

_NinjaLegend:NewButton('Horizon.cc V5', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Shadetamic/horizon/main/loadstring.lua'))()
end)
_NinjaLegend:NewButton('Proxima Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua'))()
end)

local _PetCatchers = _Games:NewSection('Pet Catchers')

_PetCatchers:NewButton('GatoHub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Catto-YFCN/GatoHub/main/PetCatchers'))()
end)
_PetCatchers:NewButton('Idiot Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/IdiotHub/Scripts/main/Pet%20Catcher/Pet%20Catchers%20Main'))()
end)

local _SlapBattles = _Games:NewSection('Slap Battles')

_SlapBattles:NewButton('R20', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/cheesynob39/R2O/main/LOADSTRING.lua'))()
end)
_SlapBattles:NewButton('Dizzy Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua'))()
end)

local _KAT = _Games:NewSection('KAT')

_KAT:NewButton('Hitbox Gui', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/peFsakEW'))()
end)
_KAT:NewButton('Owl Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt'))()
end)

local _StrongmanSimulator = _Games:NewSection('Strongman Simulator')

_StrongmanSimulator:NewButton('KhSaeedHub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://github.com/KhSaeed90/Roblox/raw/workspace/6766156863'))()
end)
_StrongmanSimulator:NewButton('Destiny SS', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/itsnoctural/Destiny/main/loader.lua'))()
end)

local _MyRestaurant = _Games:NewSection('My Restaurant')

_MyRestaurant:NewButton('My Restaurant script 1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/uBpUr2vU'))()
end)
_MyRestaurant:NewButton('Uranium', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/SpencerDevv/4127570215e413bf8ab4e074791bcf45/raw/78b977974b36e2d5cde7a28dab7f9a464dd1a2c1/betaV5'))()
end)

local _aDustyTrip = _Games:NewSection('a Dusty Trip')

_aDustyTrip:NewButton('Legend Handles YT', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/LOLking123456/trip/main/dusty'))()
end)
_aDustyTrip:NewButton('Demonic Hub V2', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Alan0947383/Demonic-HUB-V2/main/S-C-R-I-P-T.lua'))()
end)
_aDustyTrip:NewButton('Suslik Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KrutoySuslik/-SuslikHub-/main/%7CSuslik%20Hub%7C%20%7CAll%20Scripts%7C'))()
end)
_aDustyTrip:NewButton('Script 4', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Scripterbacon/Test-Script/main/a%20dusty%20trip.Lua'))()
end)
_aDustyTrip:NewButton('Grenryhna', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/b24be4c2985c6ae58525a99ff6a47151.lua'))()
end)

local _BuildaBoatforTreasure = _Games:NewSection('Build a Boat for Treasure')

_BuildaBoatforTreasure:NewButton('Zolars X Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/VIPFirstTime/UploadFile/main/Protected_8627265294288055.lua'))()
end)
_BuildaBoatforTreasure:NewButton('Wayne.lua', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/epicdude99/waynee/main/loaderrr'))()
end)
_Games:NewSection('Bid Battles'):NewButton('Bid Battles 1.0', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/hawtdawgz/ScriptRepository/main/Protected.lua'))()
end)
_Games:NewSection("Barry's Prison Run V2 Obby"):NewButton('Infinite Scripts', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ZhenX201/FE-Infinite-Money/main/source'))()
end)
_Games:NewSection('Starving Artist'):NewButton('Starving Arts', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/itsnoctural/Utilities/main/Closed/StarvingArtist.lua'))()
end)
_Games:NewSection('Work at a Pizza Place'):NewButton('Pizza Factory', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastefy.app/yPtLMm8w/raw'))()
end)
_Games:NewSection('Greenville'):NewButton('Lightux', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md'))()
end)
_Games:NewSection('Eat The World'):NewButton('Reaper Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoReaper/Reaper-Hub/main/loader.lua'))()
end)

local _DaHood = _Games:NewSection('Da Hood')

_DaHood:NewButton('Detazy Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/I4MMO/Detazy/main/Main'))()
end)
_DaHood:NewButton('Balli Gui V6', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/DHBCommunity/DHBOfficialScript/main/DHHScript'))()
end)
_DaHood:NewButton('Faded', 'ButtonInfo', function()
    _G.Toggles = 'V'

    loadstring(game:HttpGet('https://raw.githubusercontent.com/NighterEpic/Faded/main/YesEpic', true))()
end)
_Games:NewSection('Raise A Floppa 2'):NewButton('Leo Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tip52/Leo-hub/main/loader.lua'))()
end)

local _KingLegacy = _Games:NewSection('King Legacy')

_KingLegacy:NewButton('BT Project', 'ButtonInfo', function()
    loadstring(game:HttpGetAsync('https://lua-library.btteam.net/script-auth.txt'))()
end)
_KingLegacy:NewButton('Legend HandlesYT', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/LOLking123456/Upd6/main/King'))()
end)
_KingLegacy:NewButton('Zen Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Zenhubtop/zen_hub_pr/main/zennewwwwui.lua', true))()
end)

local _PunchSimulator = _Games:NewSection('Punch Simulator')

_PunchSimulator:NewButton('Demonic Hub V2', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Alan0947383/Boom/main/Protected_1198219713372149.lua.txt', true))()
end)
_PunchSimulator:NewButton('BaconBossScript', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BaconBossScript/PunchSim/main/PunchSim', true))()
end)
_Games:NewSection('Race Clicker'):NewButton('Script 1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Saaakai/Random-Roblox-Script/main/Race%20Clicker'))()
end)
_Games:NewSection('Pull a Sword'):NewButton('ToraScripts', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraScript/Script/main/PullaSword'))()
end)
_Games:NewSection('Goal Kick Simulator'):NewButton('Script 1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://github.com/KhSaeed90/Roblox/raw/workspace/9281034297'))()
end)

local _FunkyFriday = _Games:NewSection('Funky Friday')

_FunkyFriday:NewButton('Plutonium Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua', true))()
end)
_FunkyFriday:NewButton('Script 2', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Nadir3709/RandomScript/main/FunkyFridayMobile'))()
end)

local _Answerordie = _Games:NewSection('Answer or die')

_Answerordie:NewButton('Project PopCat', 'Key:$8FUS5UjpGhaXzNCepDQUEhtb8Vsu2Cyd!', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Agent1Anonymous/gravitygun-main/main/0000ProjectpopCat.lua'))()
end)
_Answerordie:NewButton('S Ware', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/jaeelin/S-Ware/main/S-WAR'))()
end)
_Games:NewSection('Youtube Simulator Z'):NewButton('Devil Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/DEVIL-Script/DEVIL-Hub/main/DEVIL-Hub-Main', true))()
end)

local _DemonPiece = _Games:NewSection('Demon Piece')

_DemonPiece:NewButton('OMG Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua'))()
end)
_DemonPiece:NewButton('Mewing Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/TranVanBao1411/MewingHub/main/Loader.lua'))()
end)

local _MegaMansionTycoon = _Games:NewSection('Mega Mansion Tycoon')

_MegaMansionTycoon:NewButton('Nicuse', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/MegaMansionTycoon.lua'))()
end)
_MegaMansionTycoon:NewButton('Statue Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/idontknowwhattonamemyself/Statue-Hub/Lua/Main'))()
end)

local _FleeTheFacility = _Games:NewSection('Flee The Facility')

_FleeTheFacility:NewButton('Infinity Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Aboahaogsigsigaivva/__Scripts/__Main/__Code/__FleeTheFacility.lua'))()
end)
_FleeTheFacility:NewButton('Lunar', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NexIsHot/Lunar/main/FTF.lua', true))()
end)
_Games:NewSection('3008'):NewButton('CheatX', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/4WtjGYge'))()
end)
_Games:NewSection('Driving Simulator'):NewButton('Jens Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/3a9x76Qq'))()
end)
_Games:NewSection('Military Tycoon'):NewButton('Script 1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://thedragonslayer2.github.io'))()
end)
_Games:NewSection('Piano Games'):NewButton('Panda Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Madness676/3.2Lol/main/AutoPiano3-2.lua', true))()
end)
_Games:NewSection('Pillow Fighting Simulator'):NewButton('NS Hub', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/HenSeu87PofghYT/PILLOW-FIGHTING-SIM/main/Nameless%20Scripts'))()
end)
_Games:NewSection('Project Mugetsu'):NewButton('Script 1', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/TheyCallMeVox/scripts/main/PM'))()
end)
_Games:NewSection('Merge Simulator'):NewButton('Inferno X', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/alyssagithub/Scripts/main/Script%20Hub%20-%20Inferno%20X.lua'))()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/alyssagithub/Scripts/main/Script%20Hub%20-%20Inferno%20X.lua'))()
end)

local _Admin = _TigerXHubV35:NewTab('Admin'):NewSection('Admin')

_Admin:NewButton('Delta infinite yield', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://gist.githubusercontent.com/lxnnydev/c533c374ca4c1dcef4e1e10e33fa4a0c/raw/03e74f184f801dad77d3ebe1e2f18c6ac87ca612/delta___IY.gistfile1.txt.lua', true))()
end)
_Admin:NewButton('infinite yield', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
_Admin:NewButton('nameless admin', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)
_Admin:NewButton('orca admin', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Universal-Script-Orca-7620'))()
end)
_Admin:NewButton('Reviz Admin', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Universal-Script-Reviz-3841'))()
end)
_Admin:NewButton('Cmd-x', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Universal-Script-CMD-X-Admin-Commands-Script-3837'))()
end)
_Admin:NewButton('Dark Dex V3', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua', true))()
end)
_Admin:NewButton('nameless admin v2', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Universal-Script-Nameless-Admin-V2-UNFINISHED-source-code-9359'))()
end)
_Admin:NewButton('Dex Explorer', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()
end)
_Admin:NewButton('Simple Spy', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua'))()
end)

local _Exploits = _TigerXHubV35:NewTab('Exploits')
local _Mobile = _Exploits:NewSection('Mobile')

_Mobile:NewButton('Arceus X', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Universal-Script-Arceus-X-Script-Credit-to-AnyaDev-WORKS-WITH-ALL-SCRIPTS-8561'))()
end)
_Mobile:NewButton('Fluxus Coral', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://scriptblox.com/raw/Universal-Script-Fluxus-Coral-ReMake-Beta-by-AnyaDev-8562'))()
end)
_Mobile:NewButton('Evon V2', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Gjdiddkslwodi/main/Vjvidie7fi3oe'))()
end)
_Mobile:NewButton('Krypton', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Ajdkfoepdpfpf0/main/FNUGGEYSJWIWOROD'))()
end)
_Mobile:NewButton('Codex', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Nuggey/main/Davabataxq'))()
end)
_Mobile:NewButton('Trigon', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Omg/main/Triaglan'))()
end)
_Mobile:NewButton('Vega X', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/OMGSUSIDSKEKWKAI3O/main/Cjdkwowiwi'))()
end)
_Mobile:NewButton('Delta X', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Deltozoz/main/Rick%20rolled'))()
end)
_Mobile:NewButton('Hydrogen', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Gjcjsjsidicuskdkfofofidkckfkwpw9er8fudidpapq0/main/Zhcifodoelsjaisdoocc9x9x0'))()
end)
_Mobile:NewButton('Kato', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Gdcucisuduvifnslzivv8dmebshd/main/Fjcjzicuveuwjd9dksjdf6r8ejej'))()
end)
_Mobile:NewButton('Flooded V', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Dudidwkoff7wueoeiddj/main/Ahdufidwid8fudkdkgoel'))()
end)
_Mobile:NewButton('Punk Team', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Hufuddixidke8vogd/main/Vdurigofeod8f'))()
end)
_Mobile:NewButton('Cubix', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/BarkOffCubix/main/Laughs'))()
end)
_Mobile:NewButton('Appleware', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Ohio/main/Xhdjskdkdiduvudke'))()
end)
_Mobile:NewButton('Techno', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Ucdjlsidufudekdififoek/main/Djdkgirueidiciswheh'))()
end)

local _Custom = _Exploits:NewSection('Custom')

_Custom:NewButton('Nathans Executor', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Makeruwu/Scfipg/main/Executor2%2C3'))()
end)
_Custom:NewButton('Neptune', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://pastebin.com/raw/y3jhxS5r'))()
end)
_Custom:NewButton('Saturn', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://github.com/AnAvaragelilmemer/saturn/blob/main/main.lua?raw=true'))()
end)
_Custom:NewButton('Syctro Executor', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/anyahubs/executer/main/S_UI.lua'))()
end)
_Custom:NewButton('Chat Executor', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/zephyr10101/chat-executor/main/chat-executor', true))()
end)

local _PC = _Exploits:NewSection('PC')

_PC:NewButton('Synapse X', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua'))()
end)
_PC:NewButton('Netflix CE 2.0', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Dhdusgdjyxuskxiv7didj/main/Ejdifydjakwidd7cisjsjsks8suwjdkdod'))()
end)
_PC:NewButton('Arceus X PC', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/AMONJDJDJDJGUSSYDUDJXJDISKSJ/main/ADJXDIOSDIFUEKEPDODP'))()
end)
_PC:NewButton('Codex PC', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/maxJJEDJDJSKwellDJDIFKDKEKK/main/Dhdjifudiekeksixi'))()
end)
_PC:NewButton('Krnl', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/wtfplayer/redemption/main/krnlnoui.lua'))()
end)
_PC:NewButton('Fluxus PC', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/anyahubs/executer/main/flux.lua'))()
end)
_PC:NewButton('Electron', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Elec/main/PC'))()
end)
_PC:NewButton('JJsploit', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/Fjcjdugifisshnrjdjdigrjejdiga3irifhsh/main/XSDEHUDDUSJWKEKRO'))()
end)
_PC:NewButton('Krampus', 'ButtonInfo', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KevinScripts2024/HmmGuestoDeNoche/main/Ufosjsfieoeif'))()
end)

local _Settings = _TigerXHubV35:NewTab('Settings')
local _SpeedChanger = _Settings:NewSection('Speed Changer')

_SpeedChanger:NewTextBox('Set WalkSpeed', 'Info', function(p72)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = p72
end)
_SpeedChanger:NewTextBox('Set JumpPower', 'Info', function(p73)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = p73
end)
_SpeedChanger:NewButton('Reset Walkspeed', 'ButtonInfo', function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)
_SpeedChanger:NewButton('Reset Jumpower', 'ButtonInfo', function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

local _ColorPickersUIColorChanger = _Settings:NewSection('ColorPickers UI Color Changer')
local v75, v76, v77 = ipairs({
    'SchemeColor',
    'Background',
    'Header',
    'TextColor',
    'ElementColor',
})

while true do
    local u78

    v77, u78 = v75(v76, v77)

    if v77 == nil then
        break
    end

    _ColorPickersUIColorChanger:NewColorPicker(u78, 'Change your ' .. u78, u3[u78], function(p79)
        u3[u78] = p79
    end)
end

Instance.new('ScreenGui')
Instance.new('TextButton')
Instance.new('UICorner')

local _ScreenGui = Instance.new('ScreenGui')
local _TextButton = Instance.new('TextButton')
local _UICorner = Instance.new('UICorner')

_ScreenGui.Name = 'ToggleGui_HE'
_ScreenGui.Parent = game.CoreGui
_TextButton.Name = 'Toggle'
_TextButton.Parent = _ScreenGui
_TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_TextButton.Position = UDim2.new(0.4557916224002838, 0, 0.018518516793847084, 0)
_TextButton.Size = UDim2.new(0, 55, 0, 55)
_TextButton.Font = Enum.Font.SourceSans
_TextButton.Text = 'Tiger X'
_TextButton.TextColor3 = Color3.fromRGB(106, 242, 27)
_TextButton.TextSize = 20
_TextButton.TextWrapped = true
_TextButton.Active = true
_TextButton.Draggable = true

_TextButton.MouseButton1Click:connect(function()
    u2:ToggleUI()
end)

_UICorner.Parent = _TextButton

local _Credits = _TigerXHubV35:NewTab('Credits')

_Credits:NewSection('Credits'):NewButton('BananaBalintYT:Owner of script hub', 'Like And Subscribe', function()
    setclipboard('https://m.youtube.com/@BananaBalintYT')
end)

local _DiscordServer = _Credits:NewSection('Discord Server')

_DiscordServer:NewButton('Tiger X', 'Join', function()
    setclipboard('https://discord.com/invite/fXskDV3T9u')
end)
_DiscordServer:NewButton('Panda X', 'Join', function()
    setclipboard('https://discord.com/invite/kBDAYv53Gj')
end)
_Credits:NewSection('Supports us'):NewButton('Buy Roblox Gaming Shirt For Supporting Us', 'Join', function()
    setclipboard('https://www.roblox.com/catalog/12349077059/Gaming-Shirt')
end)

local _FeedbackBeta = _TigerXHubV35:NewTab('Feedback (Beta)')

_FeedbackBeta:NewSection('Suggestion'):NewTextBox('feedback', '', function(p86)
    local v87 = {
        WebhookUrl = 'https://discord.com/api/webhooks/1275851106622246933/esXmUmUXNOISz2XKfDwShfI7fcSbrBRwG6GGz6OWX1orOIfqI40VKsDXD7pcGV3bMvY-',
        Content = '',
        Title = 'Suggestion',
        Description = p86,
        ThumbnailUrl = '',
        Color = 0,
        Footer = 'Footer Content',
        FooterThumbnailUrl = '',
        Timestamp = false,
        Thumbnail = false,
        Footers = true,
        FootersThumbnail = false,
        Fields = {
            {
                Field = 'Field Title Content',
                Description = 'Field Description Content',
            },
            {
                Field = 'Field Title Content',
                Description = 'Field Description Content',
            },
        },
    }

    getgenv().Config = v87

    loadstring(game:HttpGet('https://raw.githubusercontent.com/8rk1/8rk.1/main/Main.lua', true))()
end)
_FeedbackBeta:NewSection('What Scripts/feature you want to be added on V4')
_FeedbackBeta:NewSection('Report Bugs Here'):NewTextBox('feedback', '', function(p88)
    local v89 = {
        WebhookUrl = 'https://discord.com/api/webhooks/1279429042701078560/BA4BZIRfwZmhTe52EH7LgXLwH_FpcTPEho6_1nBHwELxL3QMM6auZ8ulVhlAp-RDNfLG',
        Content = '',
        Title = 'Bug Report',
        Description = p88,
        ThumbnailUrl = '',
        Color = 0,
        Footer = 'Footer Content',
        FooterThumbnailUrl = '',
        Timestamp = false,
        Thumbnail = false,
        Footers = true,
        FootersThumbnail = false,
        Fields = {
            {
                Field = 'Field Title Content',
                Description = 'Field Description Content',
            },
            {
                Field = 'Field Title Content',
                Description = 'Field Description Content',
            },
        },
    }

    getgenv().Config = v89

    loadstring(game:HttpGet('https://raw.githubusercontent.com/8rk1/8rk.1/main/Main.lua', true))()
end)
_FeedbackBeta:NewSection('if feedback its not working join on server and report it')

local _UptadeLog = _TigerXHubV35:NewTab('Uptade Log')

_UptadeLog:NewSection('Update Log')
_UptadeLog:NewSection('Fixed Issue Caused Tiger X to not Working')
_UptadeLog:NewSection('Added Feedback (Beta)')
_UptadeLog:NewSection('Added More Executors')
_UptadeLog:NewSection('Added New Notify Gui')
_UptadeLog:NewSection('V4 Coming Soon!')
_UptadeLog:NewSection('Join my discord server for more info')
_UptadeLog:NewSection('Thx for using my Script Hub')
