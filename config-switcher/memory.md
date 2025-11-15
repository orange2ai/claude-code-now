# Claude Config Switcher App 分析记录

## 应用基本信息
- **应用名称**: Claude Config Switcher
- **版本**: 1.5.0
- **开发者**: orange
- **Bundle ID**: com.orange.claudeconfigswitcher
- **显示名称**: Claude配置切换器

## 应用架构分析

### 文件结构
```
Claude Config Switcher.app/
├── Contents/
│   ├── Info.plist              # 应用配置文件
│   ├── MacOS/
│   │   └── Claude Config Switcher  # 主可执行文件 (Shell脚本)
│   └── Resources/
│       ├── AppIcon.icns        # 应用图标
│       ├── claude-config-switcher.sh  # 核心功能脚本
│       ├── keys.local          # 本地密钥配置 (不包含在模板中)
│       ├── keys.template       # 密钥配置模板
│       └── 快速切换配置.command   # 双击执行的简化脚本
```

### 核心功能
这是一个用于快速切换 Claude Code API 配置的 macOS 应用程序，主要功能：

1. **多配置支持**:
   - 智谱AI (zhipu)
   - Anthropic官方 (anthropic) 
   - 自定义配置 (custom)

2. **安全特性**:
   - 密钥文件权限控制 (chmod 600)
   - 配置文件安全验证
   - 防止代码注入检查

3. **用户体验**:
   - 交互式配置选择
   - 自动备份现有配置
   - 彩色终端输出
   - 中文界面

### 技术实现

#### 启动流程
1. 主可执行文件使用 AppleScript 打开 Terminal
2. Terminal 执行 Resources 目录下的 `快速切换配置.command`
3. 该脚本调用核心的 `claude-config-switcher.sh`

#### 配置管理
- 配置文件位置: `$HOME/.claude/settings.json`
- 密钥存储: `keys.local` (不提交到版本控制)
- 自动备份: 切换前备份当前配置

#### 安全机制
- 密钥文件格式验证 (`claude-config-switcher.sh:32-53`)
- 仅允许安全的变量赋值格式
- 严格的文件权限控制

### 产品设计理念
符合 orange 的产品方法论：**简单**
- 专注单一功能：配置切换
- 极致的用户体验
- 简化的操作流程

### 版本信息
- 当前版本: 1.5.0
- 最低系统要求: macOS 10.9+
- 应用分类: 开发者工具

## 分析总结
这是一个设计精良的开发工具，完美体现了"简单"的产品理念。通过 shell 脚本和 macOS 应用包的结合，提供了直观易用的 Claude Code 配置切换功能。安全性和用户体验都考虑得很周到。

---
## 更新记录 - 2025-11-15
### 新增 Kimi 配置支持
- ✅ 修改主脚本 `claude-config-switcher.sh` 添加 Kimi 配置选项
- ✅ 更新密钥模板文件 `keys.template` 添加 KIMI_API_KEY 和 KIMI_BASE_URL
- ✅ 更新快速切换脚本 `快速切换配置.command` 添加第3个选项
- ✅ 测试验证所有功能正常工作

#### 新增的配置项:
- **Kimi (月之暗面)**: 
  - API Key: `KIMI_API_KEY`
  - Base URL: `https://api.moonshot.cn/v1`
  - 配置名: `kimi`

#### 修改的文件:
1. `Claude Config Switcher.app/Contents/Resources/claude-config-switcher.sh`
2. `Claude Config Switcher.app/Contents/Resources/keys.template`
3. `Claude Config Switcher.app/Contents/Resources/快速切换配置.command`

现在应用支持4个配置选项：
1. zhipu (智谱AI)
2. anthropic (Anthropic官方)
3. kimi (月之暗面) - **新增**
4. custom (自定义配置)

## 更新记录 - 2025-11-15 (第二次更新)
### Kimi 配置优化 - 添加 kimi-k2-thinking-turbo 高速模型支持
- ✅ 更新 Kimi Base URL 为 `https://api.moonshot.cn/anthropic`
- ✅ 添加完整的环境变量配置，支持 thinking-turbo 高速模型
- ✅ 验证 JSON 配置格式正确性

#### 新增的环境变量：
- `ANTHROPIC_MODEL=kimi-k2-thinking-turbo`
- `ANTHROPIC_DEFAULT_OPUS_MODEL=kimi-k2-thinking-turbo`
- `ANTHROPIC_DEFAULT_SONNET_MODEL=kimi-k2-thinking-turbo`
- `ANTHROPIC_DEFAULT_HAIKU_MODEL=kimi-k2-thinking-turbo`
- `CLAUDE_CODE_SUBAGENT_MODEL=kimi-k2-thinking-turbo`

#### 修改的文件：
1. `claude-config-switcher.sh` - 更新 Kimi 配置生成逻辑
2. `keys.template` - 更新 Base URL 和注释

现在 Kimi 配置完全对应你提供的高速版启动命令，可以直接使用 kimi-k2-thinking-turbo 模型。

---
分析时间: 2025-11-15
分析者: Claude Code Assistant