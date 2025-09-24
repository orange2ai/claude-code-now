#!/bin/bash

echo "🚀 Claude Code Launcher 一键安装脚本"
echo "=================================="

# 检查Claude Code是否已安装
export PATH="$HOME/.nvm/versions/node/v22.17.1/bin:$HOME/.npm-global/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"
if ! command -v claude >/dev/null 2>&1; then
    echo "❌ 未找到 Claude Code CLI"
    echo "请先安装 Claude Code CLI"
    exit 1
fi

echo "✅ 发现 Claude Code CLI: $(which claude)"

# 1. 安装应用程序到Applications
echo "📦 安装应用程序到 /Applications..."
if [ -d "/Applications/Claude Code Launcher.app" ]; then
    echo "⚠️  应用程序已存在，正在覆盖..."
    rm -rf "/Applications/Claude Code Launcher.app"
fi

cp -r "Claude Code Launcher.app" "/Applications/"
echo "✅ 应用程序安装完成"

# 2. 安装右键菜单服务
echo "🖱️  安装右键菜单服务..."
if [ -d "$HOME/Library/Services/在此处启动Claude Code.workflow" ]; then
    echo "⚠️  服务已存在，正在覆盖..."
    rm -rf "$HOME/Library/Services/在此处启动Claude Code.workflow"
fi

cp -r "在此处启动Claude Code.workflow" "$HOME/Library/Services/"
echo "✅ 右键菜单服务安装完成"

# 3. 刷新服务缓存
echo "🔄 刷新系统服务缓存..."
/System/Library/CoreServices/pbs -flush 2>/dev/null || true

echo ""
echo "🎉 安装完成！"
echo ""
echo "使用方法："
echo "1. 双击桌面或Applications中的 'Claude Code Launcher' 启动"
echo "2. 右键任意文件夹 → 服务 → '在此处启动Claude Code'"
echo "3. 拖拽文件夹到 Claude Code Launcher 应用图标上"
echo ""
echo "如果右键菜单没有出现，请重启Finder："
echo "sudo killall Finder"