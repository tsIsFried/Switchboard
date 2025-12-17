--[[
    ╔═══════════════════════════════════════════════════════════════╗
    ║                      SWITCHBOARD LOADER                       ║
    ║              Game-Aware Script Execution System               ║
    ╚═══════════════════════════════════════════════════════════════╝
    
    Controls:
    - P: Cycle through scripts
    - T: Toggle between Scripts / Debug Tools
    - Enter: Run selected script
    - Y/N: Set/decline default after running
]]

-- Wait for game to fully load first (like Voidware does)
repeat task.wait() until game:IsLoaded()

-- ═══════════════════════════════════════════════════════════════
-- CONFIGURATION
-- ═══════════════════════════════════════════════════════════════

local REGISTRY_URL = "https://raw.githubusercontent.com/tsIsFried/Switchboard/master/registry.lua"
local NOTIFICATION_DURATION = 5

-- Debug tools (shown in separate tab)
local DEBUG_TOOL_KEYS = {
    ["InfiniteYield"] = true,
    ["Dex"] = true,
    ["DarkDex"] = true,
    ["RemoteSpy"] = true,
    ["PepeHook"] = true,
}

-- ═══════════════════════════════════════════════════════════════
-- INITIALIZE PERSISTENT STORAGE
-- ═══════════════════════════════════════════════════════════════

if not getgenv().SwitchboardData then
    getgenv().SwitchboardData = {
        Defaults = {},
        Version = "1.0.0"
    }
end

local SwitchboardData = getgenv().SwitchboardData

-- ═══════════════════════════════════════════════════════════════
-- EXECUTOR DATABASE
-- ═══════════════════════════════════════════════════════════════

local ExecutorInfo = {
    ["Synapse X"]   = { platform = "Windows",      price = "DEAD (Oct 2023)", rating = "☠️" },
    ["Synapse Z"]   = { platform = "Windows",      price = "DEAD",            rating = "☠️" },
    ["SirHurt"]     = { platform = "Windows",      price = "DEAD",            rating = "☠️" },
    ["AWP"]         = { platform = "Windows",      price = "Paid ($7/wk)",    rating = "★★★★★" },
    ["Script-Ware"] = { platform = "Win/Mac",      price = "Paid ($13)",      rating = "★★★★★" },
    ["Wave"]        = { platform = "Windows",      price = "Paid ($7.50)",    rating = "★★★★☆" },
    ["Macsploit"]   = { platform = "Mac",          price = "Paid ($10)",      rating = "★★★★☆" },
    ["Seliware"]    = { platform = "Windows",      price = "Paid ($10/mo)",   rating = "★★★★☆" },
    ["Sentinel"]    = { platform = "Windows",      price = "Paid",            rating = "★★★★☆" },
    ["Electron"]    = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Oxygen U"]    = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Swift"]       = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Zorara"]      = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Codex"]       = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Velocity"]    = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Fluxus"]      = { platform = "Win/Android",  price = "Free (Key)",      rating = "★★★★☆" },
    ["Xeno"]        = { platform = "Windows",      price = "Free",            rating = "★★★☆☆" },
    ["Evon"]        = { platform = "Windows",      price = "Free (Key)",      rating = "★★★☆☆" },
    ["Comet"]       = { platform = "Windows",      price = "Free",            rating = "★★★☆☆" },
    ["Zenith"]      = { platform = "Windows",      price = "Free",            rating = "★★★☆☆" },
    ["Vega X"]      = { platform = "Windows",      price = "Free (Keyless)",  rating = "★★★☆☆" },
    ["Solara"]      = { platform = "Windows",      price = "Free (Keyless)",  rating = "★★☆☆☆" },
    ["JJSploit"]    = { platform = "Windows",      price = "Free",            rating = "★★☆☆☆" },
    ["Celery"]      = { platform = "Windows",      price = "Free",            rating = "★★☆☆☆" },
    ["Temple"]      = { platform = "Windows",      price = "Free",            rating = "★★☆☆☆" },
    ["Delta"]       = { platform = "Android/iOS",  price = "Free (Key)",      rating = "★★★★☆" },
    ["Hydrogen"]    = { platform = "Android",      price = "Free",            rating = "★★★★☆" },
    ["Arceus X"]    = { platform = "Android/iOS",  price = "Free",            rating = "★★★★☆" },
    ["Nihon"]       = { platform = "Android",      price = "Free",            rating = "★★★★☆" },
    ["Trigon"]      = { platform = "Android",      price = "Free (Key)",      rating = "★★★☆☆" },
    ["Cryptic"]     = { platform = "Android",      price = "Free",            rating = "★★★☆☆" },
    ["Ronix"]       = { platform = "Android",      price = "Free",            rating = "★★☆☆☆" },
    ["Unknown"]     = { platform = "?",            price = "?",               rating = "?" },
}

-- ═══════════════════════════════════════════════════════════════
-- EXECUTOR DETECTION
-- ═══════════════════════════════════════════════════════════════

local function detectExecutor()
    if identifyexecutor then
        local name = identifyexecutor()
        if name then return name end
    end
    if getexecutorname then
        local name = getexecutorname()
        if name then return name end
    end
    
    if syn and syn.protect_gui then return "Synapse X" end
    if fluxus then return "Fluxus" end
    if Electron then return "Electron" end
    if OXYGEN_LOADED then return "Oxygen U" end
    if delta then return "Delta" end
    if Arceus then return "Arceus X" end
    if HYDROGEN_EXECUTOR then return "Hydrogen" end
    if CODEX_LOADED then return "Codex" end
    if is_sirhurt_closure then return "SirHurt" end
    if secure_load then return "Sentinel" end
    if Solara then return "Solara" end
    if Wave then return "Wave" end
    if Xeno then return "Xeno" end
    if SELIWARE then return "Seliware" end
    if Zenith then return "Zenith" end
    if AWP then return "AWP" end
    if Velocity then return "Velocity" end
    if Swift then return "Swift" end
    if JJSploit then return "JJSploit" end
    if Macsploit then return "Macsploit" end
    if Cryptic then return "Cryptic" end
    if Evon then return "Evon" end
    if Comet then return "Comet" end
    if Trigon then return "Trigon" end
    if Nihon then return "Nihon" end
    if Ronix then return "Ronix" end
    if Celery then return "Celery" end
    if Temple then return "Temple" end
    
    return "Unknown"
end

local ExecutorName = detectExecutor()
local ExecutorData = ExecutorInfo[ExecutorName] or ExecutorInfo["Unknown"]

-- ═══════════════════════════════════════════════════════════════
-- UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════════

local StarterGui = game:GetService("StarterGui")

local function notify(title, text, duration)
    duration = duration or NOTIFICATION_DURATION
    print("[Switchboard] " .. title .. ": " .. text)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration
    })
end

local function waitForKey(validKeys)
    local UserInputService = game:GetService("UserInputService")
    local connection
    local result = nil
    local waiting = true
    
    connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        for _, keyCode in ipairs(validKeys) do
            if input.KeyCode == keyCode then
                result = keyCode
                waiting = false
                break
            end
        end
    end)
    
    while waiting do
        task.wait(0.1)
    end
    
    connection:Disconnect()
    return result
end

local function loadScript(scriptData)
    notify("Switchboard", "Loading: " .. scriptData.Name, 3)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(scriptData.Url))()
    end)
    
    if success then
        notify("Switchboard", "Loaded: " .. scriptData.Name, 3)
    else
        notify("Switchboard Error", "Failed: " .. scriptData.Name, 5)
        warn("[Switchboard] Error:", err)
    end
    
    return success
end

-- ═══════════════════════════════════════════════════════════════
-- MAIN SWITCHBOARD LOGIC
-- ═══════════════════════════════════════════════════════════════

local function runSwitchboard()
    -- Show executor info
    local execInfo = ExecutorName .. " | " .. ExecutorData.platform .. " | " .. ExecutorData.rating
    notify("Switchboard", execInfo, 3)
    task.wait(1)
    
    -- Get current game ID
    local gameId = game.GameId
    notify("Switchboard", "Game: " .. tostring(gameId), 2)
    
    -- Load the registry
    local registrySuccess, registry = pcall(function()
        return loadstring(game:HttpGet(REGISTRY_URL))()
    end)
    
    if not registrySuccess or not registry then
        notify("Switchboard Error", "Failed to load registry!", 5)
        return
    end
    
    -- Get available scripts for this game
    local availableScriptKeys = registry.Games[gameId]
    
    if not availableScriptKeys or #availableScriptKeys == 0 then
        availableScriptKeys = registry.Games[0]
    end
    
    if not availableScriptKeys or #availableScriptKeys == 0 then
        notify("Switchboard", "No scripts for this game.", 5)
        return
    end
    
    -- Separate scripts into tabs
    local gameScripts = {}
    local debugTools = {}
    
    for _, key in ipairs(availableScriptKeys) do
        local scriptData = registry.Scripts[key]
        if scriptData then
            local entry = {
                Key = key,
                Name = scriptData.Name,
                Url = scriptData.Url
            }
            if DEBUG_TOOL_KEYS[key] then
                table.insert(debugTools, entry)
            else
                table.insert(gameScripts, entry)
            end
        end
    end
    
    -- Check for saved default
    local defaultKey = SwitchboardData.Defaults[gameId]
    
    if defaultKey then
        for _, script in ipairs(gameScripts) do
            if script.Key == defaultKey then
                notify("Switchboard", "Auto-loading: " .. script.Name, 3)
                task.wait(1)
                loadScript(script)
                return
            end
        end
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- SCRIPT SELECTION MENU
    -- ═══════════════════════════════════════════════════════════
    
    local currentTab = 1  -- 1 = Scripts, 2 = Debug Tools
    local scriptIndex = 1
    local debugIndex = 1
    local selecting = true
    
    local function getCurrentList()
        return currentTab == 1 and gameScripts or debugTools
    end
    
    local function getCurrentIndex()
        return currentTab == 1 and scriptIndex or debugIndex
    end
    
    local function setCurrentIndex(val)
        if currentTab == 1 then
            scriptIndex = val
        else
            debugIndex = val
        end
    end
    
    local function showMenu()
        local list = getCurrentList()
        local idx = getCurrentIndex()
        local tabName = currentTab == 1 and "SCRIPTS" or "DEBUG TOOLS"
        local total = #list
        
        if total == 0 then
            notify("Switchboard", tabName .. "\nNo items\n\n[T] Switch Tab", 10)
            return
        end
        
        local current = list[idx]
        local text = tabName .. " (" .. idx .. "/" .. total .. ")\n\n► " .. current.Name .. "\n\n[P] Next | [T] Tab | [Enter] Run"
        notify("Switchboard", text, 10)
    end
    
    showMenu()
    
    while selecting do
        local key = waitForKey({Enum.KeyCode.P, Enum.KeyCode.T, Enum.KeyCode.Return})
        
        if key == Enum.KeyCode.P then
            local list = getCurrentList()
            if #list > 0 then
                local idx = getCurrentIndex() + 1
                if idx > #list then idx = 1 end
                setCurrentIndex(idx)
            end
            showMenu()
            
        elseif key == Enum.KeyCode.T then
            -- Toggle tab
            if currentTab == 1 and #debugTools > 0 then
                currentTab = 2
            elseif currentTab == 2 and #gameScripts > 0 then
                currentTab = 1
            end
            showMenu()
            
        elseif key == Enum.KeyCode.Return then
            local list = getCurrentList()
            if #list > 0 then
                selecting = false
            end
        end
    end
    
    local selectedScript = getCurrentList()[getCurrentIndex()]
    local loadSuccess = loadScript(selectedScript)
    
    if not loadSuccess then return end
    
    -- Only ask to save default for game scripts, not debug tools
    if currentTab == 1 then
        task.wait(1)
        notify("Switchboard", "Save as default?\n[Y] Yes | [N] No", 10)
        
        local defaultChoice = waitForKey({Enum.KeyCode.Y, Enum.KeyCode.N})
        
        if defaultChoice == Enum.KeyCode.Y then
            SwitchboardData.Defaults[gameId] = selectedScript.Key
            notify("Switchboard", "Default saved!", 3)
        else
            notify("Switchboard", "Not saved.", 2)
        end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- START SWITCHBOARD
-- ═══════════════════════════════════════════════════════════════

local success, err = pcall(runSwitchboard)
if not success then
    warn("[Switchboard] Fatal error:", err)
    pcall(function()
        notify("Switchboard Error", "Check console.", 5)
    end)
end
