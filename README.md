# 🎛️ Switchboard

**Game-Aware Script Execution System for Roblox**

Switchboard automatically detects the game you're in, shows available scripts, lets you pick one, and saves your choice as default for instant loading next time.

![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![Roblox](https://img.shields.io/badge/Roblox-000000?style=for-the-badge&logo=roblox&logoColor=white)

---

## ✨ Features

- 🎮 **Auto Game Detection** - Detects `game.GameId` automatically
- 📜 **Script Menu** - Shows all available scripts for the current game
- ⭐ **Default System** - Save your favorite script per game
- 🖥️ **Executor Detection** - Shows your executor name, platform, price, and rating
- 🔄 **Universal Fallback** - Utility scripts available for any game

---

## 🚀 Loadstring

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/tsIsFried/Switchboard/master/loader.lua"))()
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

## 📦 Included Scripts

### Script Hubs
- **Voidware** - Bedwars, Forsaken, 99 Nights, Ink Game, Plants VS Brainrots
- **ForgeHub** - Slap Battles, MM2, Demonfall, Dead Rails, The Forge, Grow A Garden
- **Speed Hub** - Blade Ball, Pet Sim 99, King Legacy, Muscle Legends
- **HoHo Hub** - Blox Fruits
- **ZHub** - Arsenal, Da Hood, Jailbreak, Tower of Hell, Brookhaven
- **Hyperlib** - Universal (works on any game)

### Utilities
- Infinite Yield
- Dex Explorer  
- Dark Dex
- Remote Spy

---

## 🖥️ Supported Executors

### Paid
| Executor | Platform | Price | Rating |
|----------|----------|-------|--------|
| AWP | Windows | $7/week | ★★★★★ |
| Script-Ware | Win/Mac | $13 | ★★★★★ |
| Wave | Windows | $7.50 | ★★★★☆ |
| Macsploit | Mac | $10 | ★★★★☆ |

### Free - Windows
| Executor | Key? | Rating |
|----------|------|--------|
| Electron | No | ★★★★☆ |
| Oxygen U | No | ★★★★☆ |
| Swift | No | ★★★★☆ |
| Velocity | No | ★★★★☆ |
| Fluxus | Yes | ★★★★☆ |
| Solara | No | ★★☆☆☆ |
| JJSploit | No | ★★☆☆☆ |

### Free - Mobile
| Executor | Platform | Rating |
|----------|----------|--------|
| Delta | Android/iOS | ★★★★☆ |
| Hydrogen | Android | ★★★★☆ |
| Arceus X | Android/iOS | ★★★★☆ |
| Nihon | Android | ★★★★☆ |

### ☠️ Dead Executors
- Synapse X (Oct 2023)
- SirHurt
- Synapse Z

---

## ➕ Adding Scripts

### 1. Add to Scripts table in `registry.lua`:
```lua
MyScript = {
    Name = "My Script",
    Url = "https://raw.githubusercontent.com/user/repo/main/script.lua"
}
```

### 2. Add to Games table:
```lua
[GAME_ID] = { "MyScript", "InfiniteYield", "Dex" },
```

---

## ⚠️ Disclaimer

This project is for educational purposes. Using exploits violates Roblox ToS and may result in bans. Use at your own risk.

---

## 📄 License

MIT - Free to use, modify, and distribute.
