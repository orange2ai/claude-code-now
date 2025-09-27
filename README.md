# 🖥 Claude Code Now

专为 macOS 程序坞设计的极简启动器，让你一键直达 Claude Code 工作状态。

双击程序坞图标，立即开始智能工作。

## 🎯 为什么需要它？

**Claude Code 不止是代码助手**，它是全能的 AI 工作伙伴：

### 📝 代码开发
- 智能编程辅助和代码审查
- 项目架构设计和优化建议
- Bug 修复和性能优化

### 📊 数据分析
- CSV、Excel 数据处理和可视化
- 统计分析和趋势洞察
- 数据清洗和格式转换

### 📁 文件管理
- 批量文件整理和重命名
- 文档内容分析和总结
- 项目文件结构优化

### 🧠 知识工作
- Obsidian 笔记库分析
- 文档撰写和内容提取
- 工作流程自动化建议

但每次启动都要：打开终端 → 选择文件夹 → 确认路径 → 等待加载

**太繁琐了！**

## ✨ 程序坞解决方案

### 🖥 一键直达工作状态
将 Claude Code Now 添加到程序坞：
- ⚡ **零步骤** - 双击图标直接启动
- 🎯 **零配置** - 自动定位工作文件夹
- 🚀 **零等待** - 3秒进入工作状态

### 📁 智能文件夹管理
- **默认启动**：自动打开 `文稿/Claude Code` 文件夹
- **拖拽支持**：拖拽任意文件夹到图标仍然有效
- **Finder 集成**：完美融入 macOS 工作流

## 🎯 两种使用方式

### 1. 🖥 程序坞启动（主推）
```
双击程序坞图标 → 直达 Claude Code 工作文件夹
```

### 2. 📂 拖拽启动
```
拖拽任意文件夹到应用图标 → 在该文件夹启动
```

## ⚡ 快速开始

### 第一步：准备工作文件夹
在你的 `文稿` 文件夹中创建 `Claude Code` 文件夹：

```
文稿/
└── Claude Code/          # 创建这个文件夹
    ├── 数据分析项目/      # 存放数据文件和分析结果
    ├── 代码项目/          # 存放开发项目
    ├── 文档整理/          # 存放需要处理的文档
    └── Obsidian笔记/      # 存放笔记库文件
```

### 第二步：安装应用

#### 方法一：直接下载（推荐）
1. 下载 [最新版本](https://github.com/orange2ai/claude-code-now/releases)
2. 解压后拖拽 `Claude Code Now.app` 到 Applications 文件夹
3. 从 Applications 拖拽到程序坞
4. 双击即用！

#### 方法二：Git 克隆
```bash
git clone https://github.com/orange2ai/claude-code-now.git
cp -r "Claude Code Now.app" /Applications/
```

#### 方法三：Homebrew
```bash
brew tap orange2ai/claude-code-now
brew install claude-code-now
```

### 第三步：开始使用
1. **双击程序坞图标** - 自动启动到 `文稿/Claude Code` 文件夹
2. **开始工作** - 立即进行数据分析、代码开发或文档处理

## 🏆 效率对比

| 启动方式 | 操作步骤 | 启动位置 | 时间 |
|---------|----------|----------|------|
| **原生启动** | 打开终端 → cd 路径 → 输入命令 → 选择确认 | 手动指定 | ~30秒 |
| **🖥 程序坞启动** | 双击图标 | 自动定位 | ~3秒 ✨ |

**提效 10 倍！**

## 💡 设计理念

遵循 **"简单"** 的产品方法论：

### 预测 📈
用户需要频繁快速启动 Claude Code 进行各种智能工作

### 单点击穿 🎯
专注程序坞一键启动体验，做到极致简单

### All-in 💪
投入所有精力简化启动流程，删除一切冗余功能

**结果：一个功能，做到完美。**

## 🔧 系统要求

- **系统**：macOS 10.9 或更高版本
- **依赖**：已安装 [Claude Code CLI](https://docs.claude.com/en/docs/claude-code)
- **空间**：< 5MB
- **文件夹**：在 `文稿` 中创建 `Claude Code` 文件夹

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

## 🚀 工作场景示例

### 📊 数据分析师
1. 双击程序坞图标
2. 将 CSV 文件拖入 Claude Code
3. 立即开始数据清洗和可视化

### 💻 程序员
1. 双击程序坞图标
2. 选择项目文件夹
3. 开始代码审查和优化

### 📝 知识工作者
1. 双击程序坞图标
2. 导入 Obsidian 笔记库
3. 开始内容分析和总结

## 👨‍💼 关于作者

由 **orange** 创建，专注于极简产品设计。

核心理念：**预测 → 单点击穿 → All-in**

## 📄 许可证

MIT License - 自由使用和修改

---

⭐ **如果这个工具让你的 Claude Code 使用更高效，请给个 Star！**

💬 **有问题或建议？** [提交 Issue](https://github.com/orange2ai/claude-code-now/issues)

🔗 **GitHub:** https://github.com/orange2ai/claude-code-now