# 🎛️ Switchboard

**Game-Aware Script Execution System for Roblox**

Switchboard automatically detects the game you're in, shows your executor info, presents available scripts, and lets you set defaults for instant loading.

---

## 🚀 Quick Start

### 1. Host the Registry
Upload `registry.lua` to GitHub (use the Raw URL) or Pastebin.

### 2. Configure the Loader
In `loader.lua`, replace:
```lua
local REGISTRY_URL = "YOUR_REGISTRY_URL_HERE"
```
With your hosted registry URL.

### 3. Run It
Put `loader.lua` in your executor's autoexec, or use a loadstring:
```lua
loadstring(game:HttpGet("YOUR_LOADER_URL"))()
```

---

## ⌨️ Controls

| Key | Action |
|-----|--------|
| **Q** | Cycle through scripts |
| **Enter** | Run selected script |
| **Y** | Save as default |
| **N** | Don't save |

---

## 📋 Features

### Executor Detection
Shows your executor with platform, price, and rating:
```
Delta | Android/iOS | Free (Key) | ★★★★☆
```

### Supported Executors
| Tier | Executors |
|------|-----------|
| **Premium (Paid)** | AWP, Script-Ware, Wave, Macsploit, Seliware |
| **Top Free (Win)** | Electron, Oxygen U, Swift, Zorara, Codex, Velocity |
| **Mid Free (Win)** | Fluxus, Xeno, Evon, Comet, Vega X |
| **Mobile** | Delta, Hydrogen, Arceus X, Nihon, Trigon |
| **Dead ☠️** | Synapse X, SirHurt |

### Script Hubs Included
- **Voidware** - Bedwars, Forsaken, 99 Nights, Plants VS Brainrots
- **ForgeHub** - Slap Battles, MM2, Demonfall, Dead Rails, The Forge
- **Speed Hub** - Blade Ball, Pet Sim 99, King Legacy, Ninja Legends
- **Hyperlib** - Universal (works on any game)
- **ZHub** - Arsenal, Da Hood, Jailbreak, Tower of Hell
- **HoHo Hub** - Blox Fruits, Bedwars
- **PepeHook** - The Forge

### Utilities
- Infinite Yield
- Dex Explorer
- Dark Dex
- Remote Spy

---

## 📁 Files

```
Switchboard/
├── loader.lua      # Main script (autoexec)
├── registry.lua    # Script database (host remotely)
└── README.md
```

---

## 🎮 Supported Games (50+)

Blox Fruits, Bedwars, Pet Simulator 99, Murder Mystery 2, Arsenal, Da Hood, Jailbreak, Tower of Hell, Adopt Me, Brookhaven, Blade Ball, King Legacy, Anime Fighters, The Strongest Battlegrounds, Grow A Garden, The Forge, Dead Rails, Forsaken, 99 Nights, Shindo Life, Doors, Evade, and many more...

---

## 💾 How Defaults Work

1. Run a script → Asked to save as default
2. Press **Y** → Auto-loads next time you join that game
3. Defaults persist for the session

Clear defaults:
```lua
getgenv().SwitchboardData.Defaults = {}
```

---

## 📄 License

Free to use, modify, and distribute.
