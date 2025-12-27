# 🖥 Claude Code Now

[English](README.md) | **中文** | [日本語](README.ja.md)

**世界上最快的 Claude Code 启动器**

单击启动 Claude Code，无需终端，无需权限确认，零麻烦。

## ⚡ 为什么需要它

| 原来的方式 | 现在 |
|-----------|------|
| 打开终端 → 选文件夹 → 确认 → 等待 ~35秒 | 单击程序坞 ~3秒 ✨ |

**每天节省5分钟，每年节省30小时。**

## 🚀 快速开始

### macOS

```bash
curl -fsSL https://raw.githubusercontent.com/orange2ai/claude-code-now/main/install.sh | bash
```

**手动安装：**
1. 下载[最新版本](https://github.com/orange2ai/claude-code-now/releases)
2. 拖拽 `Claude Code Now.app` 到应用程序
3. 单击程序坞图标启动

**Finder 工具栏：**
- 按住 `Command`，拖拽应用到 Finder 工具栏
- 单击工具栏图标在任何文件夹启动

### Windows

```batch
# 先安装 Claude Code CLI
npm install -g @anthropic-ai/claude-code

# 运行安装器（管理员权限）
install.bat
install-context-menu.bat
```

右键任何文件夹 → "Claude Code Now"

## ✨ 核心特性

- **🖥 程序坞启动** (macOS) - 单击即启动
- **⚡ Finder 工具栏** (macOS) - 任意文件夹启动
- **📁 右键启动** (Windows) - 右键菜单集成
- **🚀 零配置** - 开箱即用

## 💡 为什么上下文很重要

Claude Code 在正确上下文下效果最佳：
- 📊 在研究文件夹分析数据
- 💻 在项目目录编写代码
- 📝 在报告文件夹处理文档

**在你工作的每个地方启动 Claude Code Now。**

## 📦 项目结构

```
Claude Code Now/
├── 📱 Claude Code Now.app    # macOS 应用
├── 🚀 install.sh              # 一键安装脚本
├── 📂 macos/                  # macOS 脚本
├── 📂 windows/                # Windows 脚本
└── 📂 docs/                   # 文档
```

## 🛠️ 系统要求

**macOS:** macOS 10.9+ + Claude Code CLI  
**Windows:** Windows 7+ + Node.js + Claude Code CLI

## 👨‍💼 关于作者

由 **Orange** 制作，[ListenHub.AI](https://listenhub.ai) CEO

产品哲学：**简单 → 专注 → 极致**

---

⭐ **有用就给个Star！** [GitHub](https://github.com/orange2ai/claude-code-now)

💬 **问题？** [提交Issue](https://github.com/orange2ai/claude-code-now/issues)