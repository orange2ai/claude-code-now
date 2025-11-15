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

## 🧠 The Power of Context

**Why launch Claude Code in different folders?** Because **CONTEXT is everything!**

Claude Code delivers its best results when it has the right context. Whether you're:
- 📊 **Analyzing data** in your research folder
- 💻 **Writing code** in your project directory  
- 📝 **Processing documents** in your reports folder
- 🎨 **Managing creative work** in your design folder

**Each context gives Claude Code superpowers.**

That's why you need Claude Code Now **everywhere** - place the launcher in every important folder and launch instantly with perfect context.

**Trust us: Once you experience context-aware Claude Code, you'll never go back to context-less AI again.**

---

⭐ **Love this tool? Give it a star!** ⭐

[![GitHub stars](https://img.shields.io/github/stars/orange2ai/claude-code-now?style=social)](https://github.com/orange2ai/claude-code-now/stargazers) [![GitHub forks](https://img.shields.io/github/forks/orange2ai/claude-code-now?style=social)](https://github.com/orange2ai/claude-code-now/network)

---

## ✨ Features

### 🖥 Dock Launch (macOS)

Put the app in Dock, click to launch Claude Code instantly.

### ⚡ Finder Toolbar Launch (macOS)
Drag the app to Finder toolbar, click to launch in any folder.

### 📁 Right-Click Launch (Windows)
Right-click on any folder to launch Claude Code Now.

### 🔧 API Config Switcher

**One-click API configuration switching** with secure local storage.

**Supported APIs:**
- **Zhipu AI** (GLM) - Best for China users
- **Kimi** (Moonshot AI) - High-speed thinking-turbo model
- **Anthropic Official** - International users  
- **Custom API** - Other compatible services

**Minimal Version (Only 85 lines):**

Use the command-line version without GUI app:

```bash
cd config-switcher
./config-simpler.sh
```

**Supported Configs:**
1. zhipu - Zhipu AI
2. kimi - Moonshot AI (High-speed thinking-turbo)
3. anthropic - Anthropic Official
4. custom - Custom configuration

**How to Add Configuration Files:**

The minimal version uses preset configuration files. Here's how to create them:

```bash
cd ~

# 1. Create Zhipu AI config
cp .claude/settings.json .claude/settings_zhipu.json

# 2. Edit the config with your Zhipu API key
# Edit .claude/settings_zhipu.json, modify ANTHROPIC_AUTH_TOKEN and ANTHROPIC_BASE_URL

# 3. Create other configs the same way
cp .claude/settings.json .claude/settings_kimi.json
cp .claude/settings.json .claude/settings_anthropic.json
cp .claude/settings.json .claude/settings_custom.json
```

**Configuration File Templates:**

**Zhipu AI (zhipu):**
```json
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "your_zhipu_api_key",
    "ANTHROPIC_BASE_URL": "https://open.bigmodel.cn/api/anthropic",
    "API_TIMEOUT_MS": "3000000"
  }
}
```

**Kimi (kimi)::**
```json
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "your_kimi_api_key",
    "ANTHROPIC_BASE_URL": "https://api.moonshot.cn/anthropic",
    "ANTHROPIC_MODEL": "kimi-k2-thinking-turbo",
    "API_TIMEOUT_MS": "3000000"
  }
}
```

**Quick Setup with Preset Templates:**

We provide 4 preset configuration templates in `config-switcher/presets/`:

```bash
# Copy all preset configs to ~/.claude/
cd ~/.claude
cp /path/to/claude-code-now/config-switcher/presets/settings*.json .
```

Or copy individually:
```bash
cp /path/to/claude-code-now/config-switcher/presets/settings_anthropic.json ~/.claude/
cp /path/to/claude-code-now/config-switcher/presets/settings_kimi.json ~/.claude/
cp /path/to/claude-code-now/config-switcher/presets/settings_zhipu.json ~/.claude/
cp /path/to/claude-code-now/config-switcher/presets/settings_custom.json ~/.claude/
```

Then edit the files with your actual API keys and you're ready to use the config switcher!

**Security:** API keys stored locally, never uploaded anywhere.

**Use GUI:** Navigate to `config-switcher/Claude Config Switcher.app`

### 📁 Universal Launch
Put the APP in any folder, click the icon to launch directly.

**That simple.**


## ⚡ Quick Start

### 🚀 One-Line Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/orange2ai/claude-code-now/main/install.sh | bash
```

**That's it!** This single command will:
- ✅ Download the latest version automatically
- ✅ Install to Applications folder
- ✅ Create working directory
- ✅ Set proper permissions
- ✅ Show usage instructions

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

**Method 3: Command Line Installation**

```bash
# Download script
curl -fsSL https://raw.githubusercontent.com/orange2ai/claude-code-now/main/claude-code-now.sh -o claude-code-now
chmod +x claude-code-now

# Move to system path
sudo mv claude-code-now /usr/local/bin/
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


## 👨‍💼 About Author

Made by **Orange**, CEO of **[ListenHub.AI](https://listenhub.ai)** 🎧

**ListenHub.AI** - Transform any content into engaging podcasts using AI. Perfect for learning, content creation, and accessibility.

Philosophy: **Predict → Single Point Breakthrough → All-in**

*Focused on minimal product design that solves real problems.*

---

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
├── install.sh                   # Smart one-line installer
├── claude-code-now.sh           # macOS launch script
├── claude-code-now.ps1          # Windows PowerShell script
├── install.bat                  # Windows installation script
├── install-context-menu.bat     # Windows right-click menu installer
├── uninstall-context-menu.bat   # Windows right-click menu uninstaller
└── 📚 Documentation
```

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=orange2ai/claude-code-now&type=Date)](https://star-history.com/#orange2ai/claude-code-now&Date)

---

⭐ **Give a Star if it helps!** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)

💬 **Questions?** [Submit Issue](https://github.com/orange2ai/claude-code-now/issues)

🔗 **Permanent Project Link:** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)
