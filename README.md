# 🖥 Claude Code Now

极简的 Claude Code 一键启动器，专为 macOS 程序坞设计。

一键双击，直达 Claude Code 工作状态。

## 🎯 为什么需要它？

Claude Code 是强大的 AI 编程助手，可以：
- 📝 分析和编辑代码文件
- 📁 整理和管理项目文件
- 🧠 基于项目内容提供智能建议
- 💡 协助 Obsidian 笔记分析和洞察提取

但每次启动都要：选择文件夹 → 确认路径 → 等待加载

**太繁琐了！**

## ✨ 极简解决方案

### 🖥 程序坞一键启动
将 Claude Code Now 添加到程序坞，双击即可：
- ⚡ **零步骤** - 直接启动到你的 Claude Code 工作文件夹
- 🎯 **零配置** - 无需设置，开箱即用
- 🚀 **零等待** - 立即进入工作状态

### 📁 智能路径检测
- **默认启动**：自动打开 `/Users/[用户名]/Documents/Claude Code`
- **灵活使用**：拖拽任意文件夹到图标仍然有效
- **命令行版**：`claude-code-now [自定义路径]`

## 🎯 三种使用方式

### 1. 🖥 程序坞启动（主推）
```
双击程序坞图标 → 直达 Claude Code 文件夹
```

### 2. 📂 拖拽启动
```
拖拽任意文件夹到应用图标 → 在该文件夹启动
```

### 3. ⌨️ 命令行启动
```bash
claude-code-now                    # 启动到默认文件夹
claude-code-now /path/to/project   # 启动到指定文件夹
```

## ⚡ 快速安装

### 方法一：直接下载
1. 下载 [最新版本](https://github.com/orange2ai/claude-code-now/releases)
2. 解压后拖拽 `Claude Code Now.app` 到 Applications 文件夹
3. 从 Applications 拖拽到程序坞
4. 双击即用！

### 方法二：Git 克隆
```bash
git clone https://github.com/orange2ai/claude-code-now.git
cp -r "Claude Code Now.app" /Applications/
```

### 方法三：Homebrew（即将支持）
```bash
brew tap orange2ai/claude-code-now
brew install claude-code-now
```

## 🏆 效率对比

| 启动方式 | 操作步骤 | 启动位置 | 时间 |
|---------|----------|----------|------|
| **原生 claude code** | 打开终端 → cd 路径 → 输入命令 → 选择确认 | 手动指定 | ~30秒 |
| **🖥 Claude Code Now** | 程序坞双击 | 自动定位 | ~3秒 ✨ |

**提效 10 倍！**

## 💡 设计理念

遵循 **"简单"** 的产品方法论：

### 预测 📈
开发者需要频繁快速启动 Claude Code 的强需求

### 单点击穿 🎯
专注程序坞一键启动这个核心体验，做到极致

### All-in 💪
投入所有精力简化启动流程，删除一切冗余功能

**结果：一个功能，做到完美。**

## 🔧 系统要求

- **系统**：macOS 10.9 或更高版本
- **依赖**：已安装 [Claude Code CLI](https://docs.claude.com/en/docs/claude-code)
- **空间**：< 5MB

## 📦 项目结构

```
Claude Code Now/
├── 🖥 Claude Code Now.app        # 主应用程序
├── claude-code-now.sh           # 核心启动脚本
├── claude-code-now.rb           # Homebrew Formula
├── LaunchClaudeCodeNow.applescript  # AppleScript版本
└── 📚 文档/
    ├── README.md                # 项目说明
    ├── 使用说明.md               # 详细指南
    ├── memory.md                # 项目记忆
    └── log.md                   # 更新日志
```

## 🚀 开始使用

1. **安装应用** - 按照上面的安装方法
2. **添加到程序坞** - 从 Applications 拖拽到 Dock
3. **开始享受** - 双击图标，直达工作状态！

就是这么简单。

## 👨‍💼 关于作者

由 **orange** 创建，专注于极简产品设计。

核心理念：**预测 → 单点击穿 → All-in**

## 📄 许可证

MIT License - 自由使用和修改

---

⭐ **如果这个工具让你的 Claude Code 使用更高效，请给个 Star！**

💬 **有问题或建议？** [提交 Issue](https://github.com/orange2ai/claude-code-now/issues)

🔗 **GitHub:** https://github.com/orange2ai/claude-code-now