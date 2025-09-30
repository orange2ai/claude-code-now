# Claude Code Now 项目记忆

## 核心定位
macOS 上最快的 Claude Code 启动器 - 专注一键启动，做到极致简单

## 技术架构
- `Claude Code Now.app/Contents/MacOS/ClaudeCodeLauncher` - 主启动脚本（AppleScript + Bash）
- `claude-code-now.sh` - 命令行版本
- `claude-code-now.rb` - Homebrew Formula
- `CNAME` - GitHub Pages 域名配置（claudecodenow.com）

## 重要决策与经验

### PATH 检测策略
- 不能只依赖 `command -v`，要遍历常见安装位置
- 常见路径：`~/.npm-global/bin`, `~/.npm/bin`, `~/.local/bin`, `/usr/local/bin`, `/opt/homebrew/bin`
- 用户的 Node.js 安装方式多样（nvm、npm、brew），需要全覆盖

### Release 发布
- ⚠️ **重要**：每次发布必须上传编译好的 `.zip` 文件
- v1.0.0 - v1.2.0 只发布了源码，用户体验差
- v1.2.1 开始上传 App.zip，用户下载即用

### Homebrew Formula 更新
- 每次发布新版本需要同步更新 `claude-code-now.rb`
- 更新版本号 + 计算新的 sha256：`curl -sL "https://github.com/orange2ai/claude-code-now/archive/vX.X.X.tar.gz" | shasum -a 256`

## 版本更新日志

### v1.2.1 (2024-09-30) - CLI 路径检测增强
- 扩展 PATH 搜索：新增 `~/.npm/bin`, `~/.local/bin`, `/usr/local/share/npm/bin`
- 智能遍历常见安装位置，即使 PATH 未配置也能找到
- 优化错误提示，提供诊断建议
- 首次上传 App.zip 到 Release，用户下载即用

### v1.2.0 (2024-09-30) - Claude Code 2.0 适配
- 升级启动命令：`claude code now` → `claude`
- 修复程序坞启动路径问题（不再跳转到桌面）
- 添加 `--permission-mode bypassPermissions` 实现零确认启动
- 三级路径选择：拖拽路径 → Finder路径 → 默认路径

### v1.1.0 及之前
- 基础功能：程序坞启动、拖拽启动、工具栏集成
- 中英文文档、GitHub Pages、自定义域名