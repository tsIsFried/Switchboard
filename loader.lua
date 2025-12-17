--[[
    ╔═══════════════════════════════════════════════════════════════╗
    ║                      SWITCHBOARD LOADER                       ║
    ║              Game-Aware Script Execution System               ║
    ╚═══════════════════════════════════════════════════════════════╝
    
    Put this single loadstring in your autoexec folder.
    It will automatically detect the game and present available scripts.
    
    Controls:
    - Q: Cycle through available scripts
    - Enter: Run the selected script
    - Y/N: Set/decline default after running
]]

-- ═══════════════════════════════════════════════════════════════
-- CONFIGURATION
-- ═══════════════════════════════════════════════════════════════

local REGISTRY_URL = "https://raw.githubusercontent.com/tsIsFried/Switchboard/master/registry.lua"
local NOTIFICATION_DURATION = 5 -- How long notifications stay visible (seconds)

-- ═══════════════════════════════════════════════════════════════
-- INITIALIZE PERSISTENT STORAGE
-- ═══════════════════════════════════════════════════════════════

if not getgenv().SwitchboardData then
    getgenv().SwitchboardData = {
        Defaults = {}, -- [GameId] = "ScriptKey"
        Version = "1.0.0"
    }
end

local SwitchboardData = getgenv().SwitchboardData

-- ═══════════════════════════════════════════════════════════════
-- EXECUTOR DATABASE
-- ═══════════════════════════════════════════════════════════════

local ExecutorInfo = {
    -- Format: { platform, price, rating }
    -- DISCONTINUED / DEAD
    ["Synapse X"]   = { platform = "Windows",      price = "DEAD (Oct 2023)", rating = "☠️" },
    ["Synapse Z"]   = { platform = "Windows",      price = "DEAD",            rating = "☠️" },
    ["SirHurt"]     = { platform = "Windows",      price = "DEAD",            rating = "☠️" },
    
    -- PAID - PREMIUM
    ["AWP"]         = { platform = "Windows",      price = "Paid ($7/wk)",    rating = "★★★★★" },
    ["Script-Ware"] = { platform = "Win/Mac",      price = "Paid ($13)",      rating = "★★★★★" },
    ["Wave"]        = { platform = "Windows",      price = "Paid ($7.50)",    rating = "★★★★☆" },
    ["Macsploit"]   = { platform = "Mac",          price = "Paid ($10)",      rating = "★★★★☆" },
    ["Seliware"]    = { platform = "Windows",      price = "Paid ($10/mo)",   rating = "★★★★☆" },
    ["Sentinel"]    = { platform = "Windows",      price = "Paid",            rating = "★★★★☆" },
    
    -- FREE - WINDOWS (TOP TIER)
    ["Electron"]    = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Oxygen U"]    = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Swift"]       = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Zorara"]      = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Codex"]       = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    ["Velocity"]    = { platform = "Windows",      price = "Free",            rating = "★★★★☆" },
    
    -- FREE - WINDOWS (MID TIER)
    ["Fluxus"]      = { platform = "Win/Android",  price = "Free (Key)",      rating = "★★★★☆" },
    ["Xeno"]        = { platform = "Windows",      price = "Free",            rating = "★★★☆☆" },
    ["Evon"]        = { platform = "Windows",      price = "Free (Key)",      rating = "★★★☆☆" },
    ["Comet"]       = { platform = "Windows",      price = "Free",            rating = "★★★☆☆" },
    ["Zenith"]      = { platform = "Windows",      price = "Free",            rating = "★★★☆☆" },
    ["Vega X"]      = { platform = "Windows",      price = "Free (Keyless)",  rating = "★★★☆☆" },
    
    -- FREE - WINDOWS (LOW TIER)
    ["Solara"]      = { platform = "Windows",      price = "Free (Keyless)",  rating = "★★☆☆☆" },
    ["JJSploit"]    = { platform = "Windows",      price = "Free",            rating = "★★☆☆☆" },
    ["Celery"]      = { platform = "Windows",      price = "Free",            rating = "★★☆☆☆" },
    ["Temple"]      = { platform = "Windows",      price = "Free",            rating = "★★☆☆☆" },
    
    -- MOBILE - ANDROID/IOS
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
    -- Try built-in functions first
    if identifyexecutor then
        local name = identifyexecutor()
        if name then return name end
    end
    if getexecutorname then
        local name = getexecutorname()
        if name then return name end
    end
    
    -- Check for specific executors
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

local function notify(title, text, duration)
    duration = duration or NOTIFICATION_DURATION
    
    -- Try multiple notification methods for compatibility
    if game:GetService("StarterGui"):GetCore("SendNotification") then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = title,
                Text = text,
                Duration = duration
            })
        end)
    end
    
    -- Also print to console for debugging
    print("[Switchboard] " .. title .. ": " .. text)
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
        notify("Switchboard", "Successfully loaded: " .. scriptData.Name, 3)
    else
        notify("Switchboard Error", "Failed to load: " .. scriptData.Name .. "\n" .. tostring(err), 5)
        warn("[Switchboard] Error loading script:", err)
    end
    
    return success
end

-- ═══════════════════════════════════════════════════════════════
-- MAIN SWITCHBOARD LOGIC
-- ═══════════════════════════════════════════════════════════════

local function runSwitchboard()
    -- Show executor notification with details
    local execInfo = ExecutorName .. " | " .. ExecutorData.platform .. " | " .. ExecutorData.price .. " | " .. ExecutorData.rating
    notify("Switchboard", execInfo, 4)
    task.wait(1.5)
    
    -- Get current game ID
    local gameId = game.GameId
    
    notify("Switchboard", "Detected GameId: " .. tostring(gameId), 3)
    
    -- Load the registry
    local registrySuccess, registry = pcall(function()
        return loadstring(game:HttpGet(REGISTRY_URL))()
    end)
    
    if not registrySuccess or not registry then
        notify("Switchboard Error", "Failed to load registry!", 5)
        warn("[Switchboard] Registry load failed:", registry)
        return
    end
    
    -- Get available scripts for this game
    local availableScriptKeys = registry.Games[gameId]
    
    -- Fallback to universal scripts (GameId 0) if no specific mapping
    if not availableScriptKeys or #availableScriptKeys == 0 then
        availableScriptKeys = registry.Games[0]
        if availableScriptKeys then
            notify("Switchboard", "No game-specific scripts. Using universal scripts.", 3)
        end
    end
    
    -- No scripts available at all
    if not availableScriptKeys or #availableScriptKeys == 0 then
        notify("Switchboard", "No scripts available for this game.", 5)
        return
    end
    
    -- Build list of actual script data
    local availableScripts = {}
    for _, key in ipairs(availableScriptKeys) do
        local scriptData = registry.Scripts[key]
        if scriptData then
            table.insert(availableScripts, {
                Key = key,
                Name = scriptData.Name,
                Url = scriptData.Url
            })
        else
            warn("[Switchboard] Script key not found in registry:", key)
        end
    end
    
    if #availableScripts == 0 then
        notify("Switchboard", "No valid scripts found for this game.", 5)
        return
    end
    
    -- Check for saved default
    local defaultKey = SwitchboardData.Defaults[gameId]
    
    if defaultKey then
        -- Find the default script in available scripts
        for _, script in ipairs(availableScripts) do
            if script.Key == defaultKey then
                notify("Switchboard", "Auto-loading default: " .. script.Name, 3)
                task.wait(1)
                loadScript(script)
                return
            end
        end
        
        -- Default script not found in current game's scripts
        notify("Switchboard", "Saved default not available. Showing menu.", 3)
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- SCRIPT SELECTION MENU
    -- ═══════════════════════════════════════════════════════════
    
    local currentIndex = 1
    local selecting = true
    
    -- Build script list string
    local function getScriptListText()
        local lines = {}
        for i, script in ipairs(availableScripts) do
            local prefix = (i == currentIndex) and "► " or "  "
            table.insert(lines, prefix .. script.Name)
        end
        return table.concat(lines, "\n")
    end
    
    notify("Switchboard Menu", "Scripts for this game:\n" .. getScriptListText() .. "\n\n[Q] Cycle | [Enter] Run", 10)
    
    while selecting do
        local key = waitForKey({Enum.KeyCode.Q, Enum.KeyCode.Return})
        
        if key == Enum.KeyCode.Q then
            -- Cycle to next script
            currentIndex = currentIndex + 1
            if currentIndex > #availableScripts then
                currentIndex = 1
            end
            
            notify("Switchboard Menu", "Scripts for this game:\n" .. getScriptListText() .. "\n\n[Q] Cycle | [Enter] Run", 10)
            
        elseif key == Enum.KeyCode.Return then
            -- Run selected script
            selecting = false
        end
    end
    
    local selectedScript = availableScripts[currentIndex]
    local loadSuccess = loadScript(selectedScript)
    
    if not loadSuccess then
        return
    end
    
    -- ═══════════════════════════════════════════════════════════
    -- DEFAULT PROMPT
    -- ═══════════════════════════════════════════════════════════
    
    task.wait(1)
    notify("Switchboard", "Make '" .. selectedScript.Name .. "' the default?\n[Y] Yes | [N] No", 10)
    
    local defaultChoice = waitForKey({Enum.KeyCode.Y, Enum.KeyCode.N})
    
    if defaultChoice == Enum.KeyCode.Y then
        SwitchboardData.Defaults[gameId] = selectedScript.Key
        notify("Switchboard", "Default saved! '" .. selectedScript.Name .. "' will auto-load next time.", 5)
    else
        notify("Switchboard", "Default not saved. You'll see this menu next time.", 3)
    end
end

-- ═══════════════════════════════════════════════════════════════
-- START SWITCHBOARD
-- ═══════════════════════════════════════════════════════════════

-- Small delay to ensure game is loaded
task.wait(2)

local success, err = pcall(runSwitchboard)
if not success then
    warn("[Switchboard] Fatal error:", err)
    notify("Switchboard Error", "Fatal error occurred. Check console.", 5)
end
