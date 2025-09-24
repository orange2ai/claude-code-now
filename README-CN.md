# 🖥 Claude Code Now

我做了这款极简的 Claude Code 一键启动器，专为 macOS 设计，可以在任何文件夹快速启动 Claude Code。

Claude Code 并非只是一个开发工具，而是一个广泛的 Agent。

可以帮你分析文件、移动文件、整理文件。

可以基于你的 Obsidian 数据库进行分析、总结、提取洞察。

但是启动 Claude Code 的过程还是太繁琐了。

我们的目标就是一键启动，丝滑享受。

## ✨ 特性

- **🚀 即时启动** - 双击即可在当前文件夹启动 `Claude Code`
- **📁 智能路径** - 自动检测 Finder 当前路径，不需要再 cd 输入路径
- **🎯 零配置** - 不需要在终端再次确认文件夹权限，直接可用
- **🖥 精美图标** - 专业设计的应用图标

## 💡 设计理念

遵循 **"简单"** 的产品方法论：
- 专注一个功能并做到极致
- 最少操作步骤 - 一键启动
- 无需交互确认 - 立即工作状态

## 🎯 使用方法

1. **打开文件夹** - 打开 FInder 的任意文件夹
2. **点击启动** - 点击 Claude Code Now 图标

## 📦 包含文件

### 🍎 主要应用
- **🖥 Claude Code Now.app** - 主应用程序

### 🛠 脚本版本
- **claude-code-now.sh** - 终端脚本版本
- **LaunchClaudeCodeNow.applescript** - AppleScript 版本

### 📚 文档
- **使用说明.md** - 详细使用指南
- **简单解决方案.md** - 快速上手方案

## ⚡ 快速安装

```bash
# 1. 下载项目
git clone https://github.com/[your-username]/claude-code-now.git

# 2. 复制应用到 Applications
cp -r "Claude Code Now.app" /Applications/

# 3. 开始使用
# 开启两个 Finder 窗口，一个选择【自定义工作阑】，另一个找到这个app，把它拖到第一个Finder窗口的顶部。 Applications 中的 "🖥 Claude Code Now" 即可
```

## 🔧 系统要求

- macOS 10.9+
- 已安装 [Claude Code CLI](https://docs.claude.com/en/docs/claude-code)

## 🏆 与普通启动的区别

| 方式 | 操作步骤 | 启动后状态 |
|------|----------|------------|
| **claude code** | 选择路径 → 确认 | 需要手动确认 |
| **🖥 claude code now** | 双击启动 | 立即开始工作 ✨ |

## 👨‍💼 关于作者

由 orange 创建，专注于极简产品设计。

核心理念：**预测 → 单点击穿 → All-in**

---

⭐ 如果这个工具对你有帮助，请给个 Star！