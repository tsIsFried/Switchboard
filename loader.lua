--[[
    ╔═══════════════════════════════════════════════════════════════╗
    ║                   SWITCHBOARD v1.1.0                          ║
    ║           Game-Aware Script Execution System                  ║
    ╚═══════════════════════════════════════════════════════════════╝
    
    Controls:
    - O/P: Previous/Next script
    - T: Toggle Scripts / Debug Tools
    - C: Clear saved default
    - Enter: Run script
    - Y/N: Save as default
]]

repeat task.wait() until game:IsLoaded()

-- ═══════════════════════════════════════════════════════════════
-- SERVICES
-- ═══════════════════════════════════════════════════════════════

local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")

-- ═══════════════════════════════════════════════════════════════
-- CONFIGURATION
-- ═══════════════════════════════════════════════════════════════

local VERSION = "1.1.0"
local REGISTRY_URL = "https://raw.githubusercontent.com/tsIsFried/Switchboard/master/registry.lua"

local DEBUG_TOOL_KEYS = {
    ["InfiniteYield"] = true,
    ["Dex"] = true,
    ["DarkDex"] = true,
    ["RemoteSpy"] = true,
    ["PepeHook"] = true,
    ["Hyperlib"] = true,
}

-- ═══════════════════════════════════════════════════════════════
-- PERSISTENT STORAGE
-- ═══════════════════════════════════════════════════════════════

if not getgenv().SwitchboardData then
    getgenv().SwitchboardData = {
        Defaults = {},
        RegistryCache = nil,
        CacheTime = 0,
    }
end

local Data = getgenv().SwitchboardData

-- ═══════════════════════════════════════════════════════════════
-- EXECUTOR DATABASE
-- ═══════════════════════════════════════════════════════════════

local Executors = {
    ["Synapse X"]   = { platform = "Windows",      price = "DEAD",           rating = "☠️" },
    ["Synapse Z"]   = { platform = "Windows",      price = "DEAD",           rating = "☠️" },
    ["SirHurt"]     = { platform = "Windows",      price = "DEAD",           rating = "☠️" },
    ["AWP"]         = { platform = "Windows",      price = "$7/wk",          rating = "★★★★★" },
    ["Script-Ware"] = { platform = "Win/Mac",      price = "$13",            rating = "★★★★★" },
    ["Wave"]        = { platform = "Windows",      price = "$7.50",          rating = "★★★★☆" },
    ["Macsploit"]   = { platform = "Mac",          price = "$10",            rating = "★★★★☆" },
    ["Seliware"]    = { platform = "Windows",      price = "$10/mo",         rating = "★★★★☆" },
    ["Sentinel"]    = { platform = "Windows",      price = "Paid",           rating = "★★★★☆" },
    ["Electron"]    = { platform = "Windows",      price = "Free",           rating = "★★★★☆" },
    ["Oxygen U"]    = { platform = "Windows",      price = "Free",           rating = "★★★★☆" },
    ["Swift"]       = { platform = "Windows",      price = "Free",           rating = "★★★★☆" },
    ["Zorara"]      = { platform = "Windows",      price = "Free",           rating = "★★★★☆" },
    ["Codex"]       = { platform = "Windows",      price = "Free",           rating = "★★★★☆" },
    ["Velocity"]    = { platform = "Windows",      price = "Free",           rating = "★★★★☆" },
    ["Fluxus"]      = { platform = "Win/Android",  price = "Free+Key",       rating = "★★★★☆" },
    ["Xeno"]        = { platform = "Windows",      price = "Free",           rating = "★★★☆☆" },
    ["Evon"]        = { platform = "Windows",      price = "Free+Key",       rating = "★★★☆☆" },
    ["Comet"]       = { platform = "Windows",      price = "Free",           rating = "★★★☆☆" },
    ["Zenith"]      = { platform = "Windows",      price = "Free",           rating = "★★★☆☆" },
    ["Vega X"]      = { platform = "Windows",      price = "Free",           rating = "★★★☆☆" },
    ["Solara"]      = { platform = "Windows",      price = "Free",           rating = "★★☆☆☆" },
    ["JJSploit"]    = { platform = "Windows",      price = "Free",           rating = "★★☆☆☆" },
    ["Celery"]      = { platform = "Windows",      price = "Free",           rating = "★★☆☆☆" },
    ["Temple"]      = { platform = "Windows",      price = "Free",           rating = "★★☆☆☆" },
    ["Delta"]       = { platform = "Android/iOS",  price = "Free+Key",       rating = "★★★★☆" },
    ["Hydrogen"]    = { platform = "Android",      price = "Free",           rating = "★★★★☆" },
    ["Arceus X"]    = { platform = "Android/iOS",  price = "Free",           rating = "★★★★☆" },
    ["Nihon"]       = { platform = "Android",      price = "Free",           rating = "★★★★☆" },
    ["Trigon"]      = { platform = "Android",      price = "Free+Key",       rating = "★★★☆☆" },
    ["Cryptic"]     = { platform = "Android",      price = "Free",           rating = "★★★☆☆" },
    ["Ronix"]       = { platform = "Android",      price = "Free",           rating = "★★☆☆☆" },
    ["Unknown"]     = { platform = "?",            price = "?",              rating = "?" },
}

-- ═══════════════════════════════════════════════════════════════
-- EXECUTOR DETECTION
-- ═══════════════════════════════════════════════════════════════

local function detectExecutor()
    local s, name = pcall(function()
        if identifyexecutor then return identifyexecutor() end
        if getexecutorname then return getexecutorname() end
    end)
    if s and name then return name end
    
    local checks = {
        {syn and syn.protect_gui, "Synapse X"},
        {fluxus, "Fluxus"}, {Electron, "Electron"}, {OXYGEN_LOADED, "Oxygen U"},
        {delta, "Delta"}, {Arceus, "Arceus X"}, {HYDROGEN_EXECUTOR, "Hydrogen"},
        {CODEX_LOADED, "Codex"}, {is_sirhurt_closure, "SirHurt"}, {secure_load, "Sentinel"},
        {Solara, "Solara"}, {Wave, "Wave"}, {Xeno, "Xeno"}, {SELIWARE, "Seliware"},
        {Zenith, "Zenith"}, {AWP, "AWP"}, {Velocity, "Velocity"}, {Swift, "Swift"},
        {JJSploit, "JJSploit"}, {Macsploit, "Macsploit"}, {Cryptic, "Cryptic"},
        {Evon, "Evon"}, {Comet, "Comet"}, {Trigon, "Trigon"}, {Nihon, "Nihon"},
        {Ronix, "Ronix"}, {Celery, "Celery"}, {Temple, "Temple"},
    }
    for _, v in ipairs(checks) do if v[1] then return v[2] end end
    return "Unknown"
end

local Executor = detectExecutor()
local ExecInfo = Executors[Executor] or Executors["Unknown"]

-- ═══════════════════════════════════════════════════════════════
-- UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════════

local lastNotify = 0
local function notify(title, text, duration)
    duration = duration or 5
    print("[Switchboard] " .. title .. ": " .. text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration
        })
    end)
    lastNotify = tick()
end

local lastKeyTime = 0
local DEBOUNCE = 0.15

local function waitForKey(validKeys)
    local result = nil
    local waiting = true
    
    local conn = UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if tick() - lastKeyTime < DEBOUNCE then return end
        
        for _, kc in ipairs(validKeys) do
            if input.KeyCode == kc then
                result = kc
                waiting = false
                lastKeyTime = tick()
                break
            end
        end
    end)
    
    while waiting do task.wait() end
    conn:Disconnect()
    return result
end

local function getGameName()
    local s, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    if s and info then return info.Name end
    return "Unknown Game"
end

local function loadScript(scriptData)
    notify("Loading", scriptData.Name, 2)
    
    local s, err = pcall(function()
        loadstring(game:HttpGet(scriptData.Url))()
    end)
    
    if s then
        notify("✓ Loaded", scriptData.Name, 3)
    else
        notify("✗ Failed", scriptData.Name, 4)
        warn("[Switchboard] Error:", err)
    end
    return s
end

-- ═══════════════════════════════════════════════════════════════
-- MAIN
-- ═══════════════════════════════════════════════════════════════

local function run()
    local gameId = game.GameId
    local gameName = getGameName()
    
    -- Show startup info
    notify("Switchboard v" .. VERSION, Executor .. " | " .. ExecInfo.rating, 2)
    task.wait(0.5)
    notify("Game", gameName, 2)
    
    -- Load registry (with cache)
    local registry
    if Data.RegistryCache and tick() - Data.CacheTime < 300 then
        registry = Data.RegistryCache
    else
        local s, r = pcall(function()
            return loadstring(game:HttpGet(REGISTRY_URL))()
        end)
        if not s or not r then
            notify("Error", "Failed to load registry", 5)
            return
        end
        registry = r
        Data.RegistryCache = r
        Data.CacheTime = tick()
    end
    
    -- Get scripts
    local keys = registry.Games[gameId] or registry.Games[0]
    if not keys or #keys == 0 then
        notify("No Scripts", "Nothing available for this game", 5)
        return
    end
    
    -- Separate into tabs
    local scripts, tools = {}, {}
    for _, key in ipairs(keys) do
        local sd = registry.Scripts[key]
        if sd then
            local entry = {Key = key, Name = sd.Name, Url = sd.Url}
            if DEBUG_TOOL_KEYS[key] then
                table.insert(tools, entry)
            else
                table.insert(scripts, entry)
            end
        end
    end
    
    -- Check for saved default
    local defaultKey = Data.Defaults[gameId]
    if defaultKey then
        for _, s in ipairs(scripts) do
            if s.Key == defaultKey then
                notify("Auto-loading", s.Name, 2)
                task.wait(0.5)
                loadScript(s)
                return
            end
        end
    end
    
    -- Menu state
    local tab = 1
    local idx = {1, 1}
    
    local function getList() return tab == 1 and scripts or tools end
    local function getIdx() return idx[tab] end
    local function setIdx(v) idx[tab] = v end
    
    local function showMenu()
        local list = getList()
        local i = getIdx()
        local tabName = tab == 1 and "SCRIPTS" or "TOOLS"
        local hasDefault = Data.Defaults[gameId] and tab == 1
        
        if #list == 0 then
            notify(tabName, "Empty\n\n[T] Switch tab", 10)
            return
        end
        
        local item = list[i]
        local defaultMark = (hasDefault and Data.Defaults[gameId] == item.Key) and " ★" or ""
        local text = tabName .. " (" .. i .. "/" .. #list .. ")" .. defaultMark .. "\n\n► " .. item.Name .. "\n\n[O]◄ [P]► [T]Tab [C]Clear [Enter]Run"
        notify("Switchboard", text, 15)
    end
    
    showMenu()
    
    while true do
        local key = waitForKey({
            Enum.KeyCode.O, Enum.KeyCode.P, Enum.KeyCode.T,
            Enum.KeyCode.C, Enum.KeyCode.Return
        })
        
        local list = getList()
        
        if key == Enum.KeyCode.O and #list > 0 then
            local i = getIdx() - 1
            if i < 1 then i = #list end
            setIdx(i)
            showMenu()
            
        elseif key == Enum.KeyCode.P and #list > 0 then
            local i = getIdx() + 1
            if i > #list then i = 1 end
            setIdx(i)
            showMenu()
            
        elseif key == Enum.KeyCode.T then
            if tab == 1 and #tools > 0 then
                tab = 2
            elseif tab == 2 and #scripts > 0 then
                tab = 1
            end
            showMenu()
            
        elseif key == Enum.KeyCode.C then
            if Data.Defaults[gameId] then
                Data.Defaults[gameId] = nil
                notify("Cleared", "Default removed for this game", 2)
                task.wait(0.3)
                showMenu()
            else
                notify("No Default", "Nothing to clear", 2)
                task.wait(0.3)
                showMenu()
            end
            
        elseif key == Enum.KeyCode.Return and #list > 0 then
            break
        end
    end
    
    local selected = getList()[getIdx()]
    local success = loadScript(selected)
    
    if not success then return end
    
    -- Only prompt for default on scripts tab
    if tab == 1 then
        task.wait(0.5)
        notify("Save Default?", "[Y] Yes | [N] No", 10)
        
        local choice = waitForKey({Enum.KeyCode.Y, Enum.KeyCode.N})
        
        if choice == Enum.KeyCode.Y then
            Data.Defaults[gameId] = selected.Key
            notify("✓ Saved", selected.Name .. " is now default", 3)
        else
            notify("Skipped", "Not saved", 2)
        end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- START
-- ═══════════════════════════════════════════════════════════════

local s, e = pcall(run)
if not s then
    warn("[Switchboard] Fatal:", e)
    pcall(function() notify("Error", "Check console", 5) end)
end
