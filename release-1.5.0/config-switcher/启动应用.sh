#!/bin/bash

# Claude Config Switcher - 启动脚本
# 用于解决macOS应用双击无法打开的问题

echo "🔧 Claude Config Switcher 启动器"
echo "=================================="
echo ""

# 检查应用是否存在
APP_PATH="./Claude Config Switcher.app"

if [[ ! -d "$APP_PATH" ]]; then
    echo "❌ 找不到应用程序：$APP_PATH"
    echo "请确保此脚本与应用程序在同一目录下"
    read -p "按任意键退出..."
    exit 1
fi

echo "✅ 找到应用程序：$APP_PATH"
echo ""

# 方法1：直接打开应用
echo "🚀 正在启动应用程序..."
open "$APP_PATH"

# 等待一下让应用启动
sleep 2

# 检查应用是否成功启动（通过检查进程）
if pgrep -f "Claude Config Switcher" > /dev/null; then
    echo "✅ 应用程序启动成功！"
    echo ""
    echo "💡 如果应用窗口没有出现，请检查："
    echo "   1. Dock中是否有应用图标"
    echo "   2. 按Cmd+Tab切换应用"
    echo "   3. 检查是否需要允许应用运行"
else
    echo "⚠️ 应用程序可能未正常启动，尝试备用方案..."
    echo ""
    
    # 方法2：通过Terminal运行
    echo "🔄 备用方案：通过Terminal运行..."
    osascript <<EOF
tell application "Terminal"
    activate
    do script "cd '$(pwd)' && './Claude Config Switcher.app/Contents/MacOS/Claude Config Switcher'"
end tell
EOF
    
    echo "✅ 已在Terminal中启动应用"
fi

echo ""
echo "🎉 如果您遇到任何问题，请尝试："
echo "   1. 右键点击应用 → '打开'"
echo "   2. 在系统偏好设置中允许应用运行"
echo "   3. 运行此启动脚本"
echo ""
read -p "按任意键关闭此窗口..."