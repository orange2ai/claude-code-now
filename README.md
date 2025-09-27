# 🖥 Claude Code Now

**中文** | [English](README.en.md)

让 Claude Code 启动更简单。

程序坞单击启动，或者在任何文件夹随时启动。

## 🏆 效率对比

| 启动方式 | 操作步骤 | 时间 |
|---------|----------|------|
| **原来** | 打开终端 → 选择文件夹 → 确认 | ~30秒 |
| **现在** | 程序坞单击 | ~3秒 ✨ |

**提效 10 倍！**

## 🎯 为什么需要它？

Claude Code 很好用，但启动麻烦：
- 每次都要打开终端
- 还要选择文件夹
- 还要确认路径

**太麻烦了！**

**Claude Code 不只是代码助手**，还能做数据分析、整理文件、处理文档。这么好用的工具，启动应该更简单。

## ✨ 解决方案

### 🖥 程序坞启动
把应用放到程序坞，单击就能启动 Claude Code。

### 📁 任意文件夹启动
在任何文件夹里，拖拽到图标上就能启动。

就这么简单。

## 🎯 两种使用方式

### 1. 🖥 程序坞启动（主要）
```
程序坞单击 → 直接在 Claude Code 文件夹开始工作
```

### 2. 📂 拖拽启动（灵活）
```
拖拽任意文件夹到图标 → 在那个文件夹启动
```

## ⚡ 快速开始

### 第一步：准备工作文件夹
在 `文稿` 里创建 `Claude Code` 文件夹：

```
文稿/
└── Claude Code/          # 创建这个文件夹
    ├── 数据分析/          # 放数据文件
    ├── 代码项目/          # 放代码
    ├── 文档处理/          # 放文档
    └── 其他项目/          # 其他文件
```

### 第二步：安装应用

#### 方法一：直接下载（推荐）
1. 下载 [最新版本](https://github.com/orange2ai/claude-code-now/releases)
2. 拖拽 `Claude Code Now.app` 到 Applications 文件夹
3. 从 Applications 拖拽到程序坞
4. 单击就能用！

#### 方法二：Git 下载
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
1. **单击程序坞图标** - 自动在 `文稿/Claude Code` 文件夹启动
2. **开始工作** - 数据分析、写代码、处理文档

## 🎯 使用场景

### 📊 分析数据
单击启动 → 拖入 Excel 文件 → 开始分析

### 💻 写代码
单击启动 → 选择项目文件夹 → 开始编程

### 📝 处理文档
单击启动 → 导入文档 → 开始整理

## 💡 设计理念

**简单**：专注一个功能，做到极致。

预测用户需求 → 找到核心功能 → 投入全部精力。

结果：一键启动，极致简单。

## 🔧 系统要求

- **系统**：macOS 10.9+
- **依赖**：已安装 [Claude Code CLI](https://docs.claude.com/en/docs/claude-code)
- **文件夹**：在 `文稿` 中创建 `Claude Code` 文件夹

## 📦 项目文件

```
Claude Code Now/
├── 🖥 Claude Code Now.app        # 主应用
├── claude-code-now.sh           # 启动脚本
├── claude-code-now.rb           # Homebrew 安装
└── 📚 说明文档
```

## 👨‍💼 关于作者

orange 制作，专注极简产品。

理念：**预测 → 单点击穿 → All-in**

---

⭐ **好用就给个 Star！**

💬 **有问题？** [提交 Issue](https://github.com/orange2ai/claude-code-now/issues)

🔗 **GitHub:** https://github.com/orange2ai/claude-code-now