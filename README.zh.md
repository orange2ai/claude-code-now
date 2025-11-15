# 🖥 Claude Code Now

[English](README.md) | **中文** | [日本語](README.ja.md)

**世界上最快的 Claude Code 启动器**

让 Claude Code 启动更简单，专为 MacOS 打造。

程序坞单击启动，或者在任何文件夹随时启动。

## 🏆 效率对比

| 启动方式 | 操作步骤 | 时间 |
|---------|----------|------|
| **原来** | 打开终端 → 选择文件夹 → 确认工作区 → 等待权限确认 | ~35秒 |
| **现在** | 程序坞单击 | ~3秒 ✨ |

一天启动 Claude Code 10次，就是宝贵的 5 分钟被浪费。

## 🎯 为什么需要它？

**Claude Code 不只是代码助手**，还能做数据分析、整理文件、处理文档。

Claude Code 很好用，但启动麻烦：

- 每次都要打开终端
- 还要选择文件夹
- 还要确认工作区信任
- 还要等待权限确认

**太麻烦了！**

**用 Claude Code Now，立即提效 10 倍！**

自动跳过权限确认，真正的一键启动。

每天帮你节省 5 分钟，一年帮你节省 30 个小时。

## 🧠 Context的威力

**为什么要在不同文件夹启动Claude Code？** 因为**Context（上下文）就是一切！**

Claude Code只有在正确的Context下才能发挥最佳效果。无论你是：
- 📊 **分析数据** - 在研究文件夹中
- 💻 **编写代码** - 在项目目录中
- 📝 **处理文档** - 在报告文件夹中
- 🎨 **创意工作** - 在设计文件夹中

**每个Context都让Claude Code拥有超能力。**

这就是为什么你需要在**每个重要文件夹**都放一个Claude Code Now启动器，随时以完美Context启动。

**相信我：体验过Context感知的Claude Code后，你绝对回不去没有Context的AI了。**

---

⭐ **喜欢这个工具？给个Star吧！** ⭐

[![GitHub stars](https://img.shields.io/github/stars/orange2ai/claude-code-now?style=social)](https://github.com/orange2ai/claude-code-now/stargazers) [![GitHub forks](https://img.shields.io/github/forks/orange2ai/claude-code-now?style=social)](https://github.com/orange2ai/claude-code-now/network)

---

## ✨ 核心特性

### 🖥 程序坞启动 (macOS)
把应用放到程序坞，单击就能启动 Claude Code。

### ⚡ Finder 工具栏启动 (macOS)
把应用拖到 Finder 工具栏，在任意文件夹点击就能启动。

### 📁 右键启动 (Windows)
在任何文件夹右键选择"Claude Code Now"即可启动。

### 🔧 API配置切换器

**一键切换API配置**，本地安全存储。

**支持的API：**
- **智谱AI** (GLM) - 国内用户首选
- **Kimi** (月之暗面) - 高速 thinking-turbo 模型
- **Anthropic官方** - 海外用户
- **自定义API** - 其他兼容服务

**极简版（仅85行）：**

使用命令行版本，无需GUI应用：

```bash
cd config-switcher
./config-simpler.sh
```

**支持的配置：**
1. zhipu - 智谱AI
2. kimi - 月之暗面 (高速 thinking-turbo)
3. anthropic - Anthropic官方
4. custom - 自定义配置

**如何添加配置文件：**

极简版使用预设配置文件，创建方法：

```bash
cd ~

# 1. 创建智谱AI配置
cp .claude/settings.json .claude/settings_zhipu.json

# 2. 修改配置内容为智谱AI的API密钥
# 编辑 .claude/settings_zhipu.json，修改 ANTHROPIC_AUTH_TOKEN 和 ANTHROPIC_BASE_URL

# 3. 同样方式创建其他配置
cp .claude/settings.json .claude/settings_kimi.json
cp .claude/settings.json .claude/settings_anthropic.json
cp .claude/settings.json .claude/settings_custom.json
```

**配置文件模板：**

**智谱AI (zhipu):**
```json
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "your_zhipu_api_key",
    "ANTHROPIC_BASE_URL": "https://open.bigmodel.cn/api/anthropic",
    "API_TIMEOUT_MS": "3000000"
  }
}
```

**Kimi (kimi):**
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

**快速使用预设模板：**

我们在 `config-switcher/presets/` 提供了4个预设配置文件：

```bash
# 复制所有预设配置到 ~/.claude/
cd ~/.claude
cp /path/to/claude-code-now/config-switcher/presets/settings*.json .
```

或者单独复制：
```bash
cp /path/to/claude-code-now/config-switcher/presets/settings_anthropic.json ~/.claude/
cp /path/to/claude-code-now/config-switcher/presets/settings_kimi.json ~/.claude/
cp /path/to/claude-code-now/config-switcher/presets/settings_zhipu.json ~/.claude/
cp /path/to/claude-code-now/config-switcher/presets/settings_custom.json ~/.claude/
```

然后编辑文件填入你的实际API密钥即可使用配置切换器！

**安全性：** API密钥本地存储，绝不上传。

**使用图形界面：** 进入 `config-switcher/Claude Config Switcher.app`

### 📁 通用启动
把APP放在任何文件夹里，点击图标直接启动。

**就这么简单。**

## ⚡ 快速开始

### 🚀 一行命令安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/orange2ai/claude-code-now/main/install.sh | bash
```

**就这么简单！** 这一行命令会自动：
- ✅ 自动下载最新版本
- ✅ 安装到 Applications 文件夹
- ✅ 创建工作目录
- ✅ 设置正确权限
- ✅ 显示使用说明

### 第一步：准备工作文件夹
在 `文稿` 里创建 `Claude Code` 文件夹：

```
文稿/
└── Claude Code/          # 创建这个文件夹
```

### 第二步：安装应用

#### 方法一：直接下载（推荐）
1. 下载 [最新版本](https://github.com/orange2ai/claude-code-now/releases)
2. 拖拽 `Claude Code Now.app` 到 Applications 文件夹

**🖥 程序坞安装：**

3. 从 Applications 拖拽到程序坞
4. 单击就能用！

**⚡ Finder 工具栏安装：**

5. 按住 `Command` 键，把 `Claude Code Now.app` 拖拽到 Finder 工具栏

6. 点击工具栏图标，Claude Code 在当前目录启动

#### 方法二：Git 下载

```bash
git clone https://github.com/orange2ai/claude-code-now.git
cp -r "Claude Code Now.app" /Applications/
```

#### 方法三：命令行安装

```bash
# 下载脚本
curl -fsSL https://raw.githubusercontent.com/orange2ai/claude-code-now/main/claude-code-now.sh -o claude-code-now
chmod +x claude-code-now

# 移动到系统路径
sudo mv claude-code-now /usr/local/bin/
```

### 第三步：开始使用

**🖥 程序坞方式：**
1. **单击程序坞图标** - 自动在 `文稿/Claude Code` 文件夹启动
2. **开始工作** - 数据分析、写代码、处理文档

**⚡ Finder 工具栏方式：**
1. **打开任意文件夹** - 在 Finder 中进入想要工作的目录
2. **点击工具栏图标** - Claude Code 在当前目录启动
3. **开始工作** - 直接在选定目录进行操作

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
├── 🔧 config-switcher/          # 新功能：配置切换器
│   └── Claude Config Switcher.app # API配置切换工具
├── install.sh                   # 智能一键安装脚本
├── claude-code-now.sh           # 启动脚本
└── 📚 说明文档
```

## 👨‍💼 关于作者

**Orange** 制作，**[ListenHub.AI](https://listenhub.ai)** CEO 🎧

**ListenHub.AI** - 使用AI将任何内容转换为引人入胜的播客。非常适合学习、内容创作和无障碍访问。

理念：**预测 → 单点击穿 → All-in**

*专注于解决真实问题的极简产品设计。*

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=orange2ai/claude-code-now&type=Date)](https://star-history.com/#orange2ai/claude-code-now&Date)

---

⭐ **好用就给个 Star！** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)

💬 **有问题？** [提交 Issue](https://github.com/orange2ai/claude-code-now/issues)

🔗 **项目永久链接GitHub:** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)