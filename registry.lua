--[[
    Switchboard Registry
    ====================
    Host this file remotely (Pastebin, GitHub Raw, your own domain).
]]

return {
    Scripts = {
        -- ═══════════════════════════════════════════════════════════
        -- GAME-SPECIFIC HUBS
        -- ═══════════════════════════════════════════════════════════
        Voidware = {
            Name = "Voidware",
            Url = "https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/loader2.lua"
        },
        
        ForgeHub = {
            Name = "ForgeHub",
            Url = "https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"
        },
        
        PepeHook = {
            Name = "PepeHook",
            Url = "https://raw.githubusercontent.com/GiftStein1/pepehook-loader/refs/heads/main/loader.lua"
        },
        
        -- ═══════════════════════════════════════════════════════════
        -- MULTI-GAME HUBS
        -- ═══════════════════════════════════════════════════════════
        SpeedHub = {
            Name = "Speed Hub",
            Url = "https://raw.githubusercontent.com/SpeedHubDev/SpeedHubScript/main/SpeedHub.lua"
        },
        
        Hyperlib = {
            Name = "Hyperlib",
            Url = "https://raw.githubusercontent.com/Fantemil/Trenglehub/main/trenglehub.lua"
        },
        
        HoHoHub = {
            Name = "HoHo Hub",
            Url = "https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"
        },
        
        ZHub = {
            Name = "ZHub",
            Url = "https://raw.githubusercontent.com/ZHubTeam/zhubteam.github.io/main/zhub-script.lua"
        },
        
        -- ═══════════════════════════════════════════════════════════
        -- SINGLE GAME SCRIPTS (Popular Games)
        -- ═══════════════════════════════════════════════════════════
        
        -- Blox Fruits
        BloxFruitsHoHo = {
            Name = "Blox Fruits - HoHo Hub",
            Url = "https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"
        },
        
        -- Pet Simulator 99
        PetSim99 = {
            Name = "Pet Sim 99 - Auto Farm",
            Url = "https://raw.githubusercontent.com/SpeedHubDev/SpeedHubScript/main/SpeedHub.lua"
        },
        
        -- Murder Mystery 2
        MM2Script = {
            Name = "MM2 - ESP & Tools",
            Url = "https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"
        },
        
        -- Arsenal
        ArsenalScript = {
            Name = "Arsenal - Aimbot",
            Url = "https://raw.githubusercontent.com/ZHubTeam/zhubteam.github.io/main/zhub-script.lua"
        },
        
        -- Da Hood
        DaHoodScript = {
            Name = "Da Hood - Aimlock",
            Url = "https://raw.githubusercontent.com/ZHubTeam/zhubteam.github.io/main/zhub-script.lua"
        },
        
        -- Jailbreak
        JailbreakScript = {
            Name = "Jailbreak - Auto Rob",
            Url = "https://raw.githubusercontent.com/ZHubTeam/zhubteam.github.io/main/zhub-script.lua"
        },
        
        -- Tower of Hell
        ToHScript = {
            Name = "Tower of Hell - Fly",
            Url = "https://raw.githubusercontent.com/ZHubTeam/zhubteam.github.io/main/zhub-script.lua"
        },
        
        -- Adopt Me
        AdoptMeScript = {
            Name = "Adopt Me - Utilities",
            Url = "https://raw.githubusercontent.com/ZHubTeam/zhubteam.github.io/main/zhub-script.lua"
        },
        
        -- Brookhaven
        BrookhavenScript = {
            Name = "Brookhaven - Tools",
            Url = "https://raw.githubusercontent.com/ZHubTeam/zhubteam.github.io/main/zhub-script.lua"
        },
        
        -- Blade Ball
        BladeBallScript = {
            Name = "Blade Ball - Auto Parry",
            Url = "https://raw.githubusercontent.com/SpeedHubDev/SpeedHubScript/main/SpeedHub.lua"
        },
        
        -- King Legacy
        KingLegacy = {
            Name = "King Legacy - Auto Farm",
            Url = "https://raw.githubusercontent.com/SpeedHubDev/SpeedHubScript/main/SpeedHub.lua"
        },
        
        -- Anime Fighters
        AnimeFighters = {
            Name = "Anime Fighters - Farm",
            Url = "https://raw.githubusercontent.com/Fantemil/Trenglehub/main/trenglehub.lua"
        },
        
        -- ═══════════════════════════════════════════════════════════
        -- UTILITIES
        -- ═══════════════════════════════════════════════════════════
        InfiniteYield = {
            Name = "Infinite Yield",
            Url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
        },
        
        Dex = {
            Name = "Dex Explorer",
            Url = "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"
        },
        
        RemoteSpy = {
            Name = "Remote Spy",
            Url = "https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"
        },
        
        DarkDex = {
            Name = "Dark Dex",
            Url = "https://raw.githubusercontent.com/infyiff/backup/main/darkdex.lua"
        },
    },
    
    Games = {
        -- ═══════════════════════════════════════════════════════════
        -- VOIDWARE GAMES
        -- ═══════════════════════════════════════════════════════════
        [2619619496] = { "Voidware", "HoHoHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Bedwars
        [7008097940] = { "Voidware", "Hyperlib", "InfiniteYield", "Dex" },  -- Ink Game
        [6331902150] = { "Voidware", "ForgeHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Forsaken
        [7326934954] = { "Voidware", "ForgeHub", "Hyperlib", "InfiniteYield", "Dex" },  -- 99 Nights In The Forest
        [8316902627] = { "Voidware", "Hyperlib", "InfiniteYield", "Dex" },  -- Plants VS Brainrots
        
        -- ═══════════════════════════════════════════════════════════
        -- FORGEHUB GAMES
        -- ═══════════════════════════════════════════════════════════
        [6403373529] = { "ForgeHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Slap Battles
        [142823291] = { "ForgeHub", "MM2Script", "ZHub", "Hyperlib", "InfiniteYield", "Dex" },   -- Murder Mystery 2
        [4855457388] = { "ForgeHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Demonfall
        [6284583030] = { "ForgeHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Dead Rails
        [10449761463] = { "ForgeHub", "SpeedHub", "Hyperlib", "InfiniteYield", "Dex" }, -- The Strongest Battlegrounds
        [17625359962] = { "ForgeHub", "Hyperlib", "InfiniteYield", "Dex" }, -- Grow A Garden
        [15532962292] = { "ForgeHub", "PepeHook", "Hyperlib", "InfiniteYield", "Dex" }, -- The Forge
        
        -- ═══════════════════════════════════════════════════════════
        -- SPEED HUB GAMES
        -- ═══════════════════════════════════════════════════════════
        [13772394625] = { "BladeBallScript", "SpeedHub", "Hyperlib", "InfiniteYield", "Dex" }, -- Blade Ball
        [4637324453] = { "SpeedHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Muscle Legends
        [8737899170] = { "PetSim99", "SpeedHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Pet Simulator 99
        [9700570817] = { "SpeedHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Anime Punch Simulator
        [3956818381] = { "SpeedHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Ninja Legends
        [4520749081] = { "KingLegacy", "SpeedHub", "Hyperlib", "InfiniteYield", "Dex" },  -- King Legacy
        [6693673104] = { "SpeedHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Weapon Fighting Simulator
        
        -- ═══════════════════════════════════════════════════════════
        -- POPULAR GAMES WITH DEDICATED SCRIPTS
        -- ═══════════════════════════════════════════════════════════
        [2753915549] = { "BloxFruitsHoHo", "HoHoHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Blox Fruits
        [920587237] = { "AdoptMeScript", "ZHub", "Hyperlib", "InfiniteYield", "Dex" },   -- Adopt Me
        [4924922222] = { "BrookhavenScript", "ZHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Brookhaven RP
        [286090429] = { "ArsenalScript", "ZHub", "Hyperlib", "InfiniteYield", "Dex" },   -- Arsenal
        [606849621] = { "JailbreakScript", "ZHub", "Hyperlib", "InfiniteYield", "Dex" },   -- Jailbreak
        [1962086868] = { "ToHScript", "ZHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Tower of Hell
        [3260590327] = { "DaHoodScript", "ZHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Da Hood
        [6516141723] = { "SpeedHub", "Hyperlib", "InfiniteYield", "Dex" },  -- Pet Simulator X
        [5774256346] = { "AnimeFighters", "Hyperlib", "InfiniteYield", "Dex" },  -- Anime Fighters Simulator
        [537413528] = { "Hyperlib", "InfiniteYield", "Dex" },   -- Build A Boat For Treasure
        
        -- ═══════════════════════════════════════════════════════════
        -- MORE POPULAR GAMES
        -- ═══════════════════════════════════════════════════════════
        [3233893879] = { "Hyperlib", "InfiniteYield", "Dex" },  -- Bee Swarm Simulator
        [4442272183] = { "Hyperlib", "InfiniteYield", "Dex" },  -- Anime Dimensions
        [5616482982] = { "Hyperlib", "InfiniteYield", "Dex" },  -- Shindo Life
        [2809202155] = { "Hyperlib", "InfiniteYield", "Dex" },  -- Anime Fighting Simulator
        [9872472334] = { "Hyperlib", "InfiniteYield", "Dex" },  -- Evade
        [5060882074] = { "Hyperlib", "InfiniteYield", "Dex" },  -- Piggy
        [4972091010] = { "Hyperlib", "InfiniteYield", "Dex" },  -- Islands
        [6943918483] = { "Hyperlib", "InfiniteYield", "Dex" },  -- Doors
        [5511882441] = { "Hyperlib", "InfiniteYield", "Dex" },  -- Ragdoll Engine
        [189707] = { "Hyperlib", "InfiniteYield", "Dex" },      -- Natural Disaster Survival
        
        -- ═══════════════════════════════════════════════════════════
        -- UNIVERSAL FALLBACK
        -- ═══════════════════════════════════════════════════════════
        [0] = { "Hyperlib", "ZHub", "InfiniteYield", "Dex", "RemoteSpy", "DarkDex", "PepeHook" },
    }
}
