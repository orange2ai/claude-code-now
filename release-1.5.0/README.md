# 🖥 Claude Code Now

**English** | [中文](README.zh.md) | [日本語](README.ja.md)

**The World's Fastest Claude Code Launcher**

Make Claude Code launching simpler, built for macOS and Windows.

Click Dock to launch, or start from any folder instantly.

> **🔔 Windows Users**: Windows support is now available! See the Windows installation section below.

## 🏆 Efficiency Comparison

| Launch Method | Steps | Time |
|---------------|-------|------|
| **Before** | Open Terminal → Choose folder → Confirm workspace → Wait for permission | ~35s |
| **Now** | Click Dock | ~3s ✨ |

Launch Claude Code 10 times a day? That's 5 precious minutes wasted.

## 🎯 Why Do You Need This?

**Claude Code isn't just a coding assistant** — it does data analysis, file organization, and document processing.

Claude Code is great, but launching is tedious:

- Always need to open Terminal
- Have to choose folders
- Need to confirm workspace trust
- Wait for permission dialogs

**Too much hassle!**

**Use Claude Code Now, get 10x efficiency boost instantly!**

Auto-skip permission dialogs, truly one-click launch.

Save 5 minutes daily, save 30 hours annually.

## ✨ Solution

### 🖥 Dock Launch (macOS)

Put the app in Dock, click to launch Claude Code instantly.

### ⚡ Finder Toolbar Launch (macOS)

Drag the app to Finder toolbar, click to launch in any folder.

### 📁 Right-Click Launch (Windows)

Right-click on any folder to launch Claude Code Now.

### 📁 Launch from Any Folder

Put the APP in any folder, click the icon to launch directly.

That simple.

## 🔧 NEW: Config Switcher

**One-click Claude Code API configuration switching** - Support for Zhipu AI, Anthropic Official, Custom APIs

### 🚀 How to Use
1. Navigate to `config-switcher/` folder
2. Double-click `Claude Config Switcher.app` to launch
3. Select configuration type and enter API key
4. Done! Configuration switched automatically

### ✨ Supported Configurations
- **Zhipu AI** (GLM) - Best for China users
- **Anthropic Official** - International users
- **Custom API** - Other compatible services

### 🔒 Security Features
- API keys stored locally and securely
- Never uploaded anywhere
- Open-source project friendly

> 📍 **Location**: `config-switcher/Claude Config Switcher.app`


## ⚡ Quick Start

### macOS

#### Step 1: Prepare Working Folder
Create `Claude Code` folder in your `Documents`:

```
Documents/
└── Claude Code/          # Create this folder
```

#### Step 2: Install App

**Method 1: Direct Download (Recommended)**
1. Download [Latest Release](https://github.com/orange2ai/claude-code-now/releases)
2. Drag `Claude Code Now.app` to Applications folder

**🖥 Dock Installation:**

3. Drag from Applications to Dock
4. Click to use!

**⚡ Finder Toolbar Installation:**

5. Hold `Command` key, drag `Claude Code Now.app` to Finder toolbar

6. Click toolbar icon, Claude Code launches in current directory

**Method 2: Git Clone**
```bash
git clone https://github.com/orange2ai/claude-code-now.git
cp -r "Claude Code Now.app" /Applications/
```

**Method 3: Homebrew**
```bash
brew tap orange2ai/claude-code-now
brew install claude-code-now
```

#### Step 3: Start Using

**🖥 Dock Method:**
1. **Click Dock icon** - Auto-launch in `~/Documents/Claude Code` folder
2. **Start working** - Data analysis, coding, document processing

**⚡ Finder Toolbar Method:**
1. **Open any folder** - Navigate to your desired working directory in Finder
2. **Click toolbar icon** - Claude Code launches in current directory
3. **Start working** - Directly operate in selected directory

### Windows

#### Step 1: Prerequisites
- Install [Node.js](https://nodejs.org)
- Install Claude Code CLI: `npm install -g @anthropic-ai/claude-code`

#### Step 2: Download and Install
1. Download from the `windows` branch or clone:
```bash
git clone -b windows https://github.com/orange2ai/claude-code-now.git
cd claude-code-now
```

2. Run installation (as Administrator):
```batch
install.bat
```

3. Install right-click menu (as Administrator):
```batch
install-context-menu.bat
```

#### Step 3: Start Using

**Right-click Method:**
1. Right-click on any folder in File Explorer
2. Select "Claude Code Now"
3. Claude Code launches in that directory

**Command Line:**
```batch
claude-code-now
```

**Uninstall right-click menu:**
```batch
uninstall-context-menu.bat
```

### 🔧 Windows Troubleshooting

**Issue: "claude-code-now.ps1 not found"**
- Run `diagnose.bat` for detailed system diagnosis
- Ensure you're running scripts in the claude-code-now project directory
- Run `install.bat` with administrator privileges before `install-context-menu.bat`

**Common solutions:**
1. **Administrator privileges**: Right-click → "Run as administrator"
2. **File permissions**: Make sure PowerShell scripts are not blocked
3. **PATH issues**: Manually add `%USERPROFILE%\bin` to system PATH
4. **PowerShell policy**: Run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`


## 💡 Design Philosophy

**Simple**: Focus on one thing, do it perfectly.

Predict user needs → Find core function → Put all energy into it.

Result: One-click launch, ultimate simplicity.

## 🔧 System Requirements

### macOS
- **System**: macOS 10.9+
- **Dependency**: [Claude Code CLI](https://docs.claude.com/en/docs/claude-code) installed
- **Folder**: Create `Claude Code` folder in `~/Documents`

### Windows
- **System**: Windows 7+
- **Dependency**: Node.js and [Claude Code CLI](https://docs.claude.com/en/docs/claude-code)
- **Permissions**: Administrator rights for installation

## 📦 Project Files

```
Claude Code Now/
├── 🖥 Claude Code Now.app        # macOS app
├── 🔧 config-switcher/          # NEW: Config Switcher
│   └── Claude Config Switcher.app # API configuration tool
├── claude-code-now.sh           # macOS launch script
├── claude-code-now.ps1          # Windows PowerShell script
├── install.bat                  # Windows installation script
├── install-context-menu.bat     # Windows right-click menu installer
├── uninstall-context-menu.bat   # Windows right-click menu uninstaller
├── claude-code-now.rb           # Homebrew install
└── 📚 Documentation
```

## 👨‍💼 About Author

Made by orange, focused on minimal product design.

Philosophy: **Predict → Single Point Breakthrough → All-in**

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=orange2ai/claude-code-now&type=Date)](https://star-history.com/#orange2ai/claude-code-now&Date)

---

⭐ **Give a Star if it helps!** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)

💬 **Questions?** [Submit Issue](https://github.com/orange2ai/claude-code-now/issues)

🔗 **Permanent Project Link:** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)
