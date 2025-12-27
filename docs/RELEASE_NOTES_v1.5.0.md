# 🚀 Claude Code Now v1.5.0 - 配置切换器版本

## 🎉 重大新功能：API配置切换器

**一键切换Claude Code API配置** - 支持智谱AI、Anthropic官方、自定义API服务

### ✨ 新功能亮点

#### 🔧 全新配置切换器
- **智能切换**: 一键在不同API服务间切换
- **安全存储**: API密钥本地加密存储，绝不泄露
- **友好界面**: macOS原生应用体验
- **自动引导**: 首次使用智能设置向导

#### 🌍 多API支持
- **智谱AI (GLM)** - 国内用户首选，稳定快速
- **Anthropic官方** - 海外用户，原厂体验  
- **自定义API** - 支持其他兼容服务

#### 🛡️ 安全特性
- 本地密钥存储，不会被提交到开源项目
- 智能密钥验证和格式检查
- 自动备份现有配置
- 开源项目友好设计

### 🚀 使用体验升级

#### 简化到极致
1. 双击 `Claude Config Switcher.app`
2. 选择API服务 (1/2/3)
3. 输入API密钥（首次使用）
4. 完成！配置已自动应用

#### 专业应用体验
- 自定义应用图标
- macOS原生集成
- 彩色终端输出
- 详细的状态提示

### 📦 包装改进

#### 完整应用包
```
config-switcher/
├── Claude Config Switcher.app/  # 完整macOS应用
├── README.md                    # 使用指南
├── keys.template                # 安全密钥模板
├── 启动应用.sh                   # 备用启动器
└── 使用指南.md                  # 故障排除文档
```

#### 多语言文档
- 🇺🇸 **English**: 完整英文文档
- 🇨🇳 **中文**: 本土化中文说明
- 🇯🇵 **日本語**: 日本語ユーザーガイド

### 🔧 技术改进

#### 智能脚本系统
- 自动密钥检测和设置
- 兼容macOS安全机制
- 优雅的错误处理
- 多种启动方式支持

#### 开源友好
- 模板化的密钥管理
- `.gitignore` 自动忽略敏感文件
- 清晰的项目结构
- 详细的技术文档

### 🎯 用户体验

#### 首次使用
```
选择配置:
1. zhipu     - 智谱AI (https://open.bigmodel.cn)
2. anthropic - Anthropic官方
3. custom    - 自定义配置

请选择要切换的配置 (输入数字):
```

#### 密钥设置向导
```
🔧 设置 智谱AI (GLM) API密钥

请输入 智谱AI 的API密钥:
> [输入密钥]

确认密钥: 7228...F78P
密钥正确吗？(y/N): y

✅ 密钥已保存！
🎉 配置切换完成！现在可以使用Claude Code了
```

### 📋 兼容性

#### 系统要求
- **macOS**: 10.9+ (支持所有现代版本)
- **依赖**: Claude Code CLI
- **权限**: 标准用户权限

#### API服务支持
- ✅ Zhipu AI GLM-4 系列模型
- ✅ Anthropic Claude 3.5 Sonnet
- ✅ 所有兼容OpenAI API的服务

### 🛠️ 安装方式

#### 方式1: 下载应用包
1. 下载 `Claude Code Now v1.5.0.zip`
2. 解压到任意文件夹
3. 双击 `Claude Config Switcher.app` 开始使用

#### 方式2: Git克隆
```bash
git clone https://github.com/orange2ai/claude-code-now.git
cd claude-code-now/config-switcher
./启动应用.sh
```

### 🆕 版本对比

| 功能 | v1.4.0 | v1.5.0 |
|------|--------|--------|
| 快速启动 | ✅ | ✅ |
| Windows支持 | ✅ | ✅ |
| **API配置切换** | ❌ | ✅ |
| **多API支持** | ❌ | ✅ |
| **密钥管理** | ❌ | ✅ |
| **macOS应用** | ❌ | ✅ |
| **多语言文档** | ✅ | ✅ |

### 🎊 致谢

感谢所有用户的支持和反馈！这个版本完全基于用户需求开发：

- **国内用户**: 需要稳定的智谱AI接入方案
- **开发者**: 需要在不同API服务间快速切换
- **企业用户**: 需要安全的密钥管理方案

### 🚀 下一步计划

- [ ] Windows版本配置切换器
- [ ] 更多API服务支持
- [ ] 配置导入/导出功能
- [ ] 图形化配置界面

---

## 📥 下载

**[GitHub Releases](https://github.com/orange2ai/claude-code-now/releases/tag/v1.5.0)**

**⭐ 如果这个工具对你有帮助，请给个Star支持！**

---

🎉 **Claude Code Now v1.5.0 - 让Claude Code更灵活、更安全、更好用！**