# 🖥 Claude Code Now

[中文](README.md) | **English**

Make Claude Code launching simpler.

Click Dock to launch, or start from any folder instantly.

## 🏆 Efficiency Comparison

| Launch Method | Steps | Time |
|---------------|-------|------|
| **Before** | Open Terminal → Choose folder → Confirm | ~30s |
| **Now** | Click Dock | ~3s ✨ |

**10x Faster!**

## 🎯 Why Do You Need This?

Claude Code is great, but launching is tedious:
- Always need to open Terminal
- Have to choose folders
- Need to confirm paths

**Too much hassle!**

**Claude Code isn't just a coding assistant** — it does data analysis, file organization, and document processing. Such a powerful tool deserves easier launching.

## ✨ Solution

### 🖥 Dock Launch
Put the app in Dock, click to launch Claude Code instantly.

### 📁 Launch from Any Folder
Drag any folder to the icon to launch there.

That simple.

## 🎯 Two Ways to Use

### 1. 🖥 Dock Launch (Primary)
```
Click Dock → Start working in Claude Code folder
```

### 2. 📂 Drag & Drop Launch (Flexible)
```
Drag any folder to icon → Launch in that folder
```

## ⚡ Quick Start

### Step 1: Prepare Working Folder
Create `Claude Code` folder in your `Documents`:

```
Documents/
└── Claude Code/          # Create this folder
    ├── DataAnalysis/      # For data files
    ├── CodeProjects/      # For code
    ├── Documents/         # For documents
    └── Projects/          # Other projects
```

### Step 2: Install App

#### Method 1: Direct Download (Recommended)
1. Download [Latest Release](https://github.com/orange2ai/claude-code-now/releases)
2. Drag `Claude Code Now.app` to Applications folder
3. Drag from Applications to Dock
4. Click to use!

#### Method 2: Git Clone
```bash
git clone https://github.com/orange2ai/claude-code-now.git
cp -r "Claude Code Now.app" /Applications/
```

#### Method 3: Homebrew
```bash
brew tap orange2ai/claude-code-now
brew install claude-code-now
```

### Step 3: Start Using
1. **Click Dock icon** - Auto-launch in `~/Documents/Claude Code` folder
2. **Start working** - Data analysis, coding, document processing

## 🎯 Use Cases

### 📊 Data Analysis
Click launch → Drag Excel file → Start analyzing

### 💻 Coding
Click launch → Choose project folder → Start coding

### 📝 Document Processing
Click launch → Import documents → Start organizing

## 💡 Design Philosophy

**Simple**: Focus on one thing, do it perfectly.

Predict user needs → Find core function → Put all energy into it.

Result: One-click launch, ultimate simplicity.

## 🔧 System Requirements

- **System**: macOS 10.9+
- **Dependency**: [Claude Code CLI](https://docs.claude.com/en/docs/claude-code) installed
- **Folder**: Create `Claude Code` folder in `~/Documents`

## 📦 Project Files

```
Claude Code Now/
├── 🖥 Claude Code Now.app        # Main app
├── claude-code-now.sh           # Launch script
├── claude-code-now.rb           # Homebrew install
└── 📚 Documentation
```

## 👨‍💼 About Author

Made by orange, focused on minimal product design.

Philosophy: **Predict → Single Point Breakthrough → All-in**

---

⭐ **Give a Star if it helps!**

💬 **Questions?** [Submit Issue](https://github.com/orange2ai/claude-code-now/issues)

🔗 **GitHub:** https://github.com/orange2ai/claude-code-now