#!/bin/bash

# 测试终端选择功能的脚本

echo "🧪 Testing Terminal Selection Feature"
echo "======================================"
echo ""

# 备份现有配置
CONFIG_FILE="$HOME/.claude-code-now-terminal"
BACKUP_FILE="$HOME/.claude-code-now-terminal.backup"

if [ -f "$CONFIG_FILE" ]; then
    echo "📦 Backing up existing config..."
    cp "$CONFIG_FILE" "$BACKUP_FILE"
    echo "✅ Backup created at: $BACKUP_FILE"
    echo ""
fi

# 删除配置文件模拟首次启动
if [ -f "$CONFIG_FILE" ]; then
    echo "🗑️  Removing existing config to simulate first-time launch..."
    rm "$CONFIG_FILE"
    echo "✅ Config removed"
    echo ""
fi

# 检测当前可用的终端
echo "🔍 Detecting available terminals..."
echo ""

check_terminal() {
    local app_name="$1"
    local app_path="$2"

    if [ -d "$app_path" ]; then
        echo "  ✅ $app_name"
        return 0
    else
        echo "  ❌ $app_name (not installed)"
        return 1
    fi
}

check_terminal "iTerm" "/Applications/iTerm.app"
check_terminal "iTerm 2" "/Applications/iTerm 2.app"
check_terminal "Warp" "/Applications/Warp.app"
check_terminal "Alacritty" "/Applications/Alacritty.app"
check_terminal "Terminal" "/System/Applications/Utilities/Terminal.app"

echo ""
echo "📊 Summary:"
echo "-----------"

count=0
[ -d "/Applications/iTerm.app" ] && count=$((count + 1))
[ -d "/Applications/iTerm 2.app" ] && count=$((count + 1))
[ -d "/Applications/Warp.app" ] && count=$((count + 1))
[ -d "/Applications/Alacritty.app" ] && count=$((count + 1))
[ -d "/System/Applications/Utilities/Terminal.app" ] && count=$((count + 1))

echo "Total terminals detected: $count"

if [ $count -ge 2 ]; then
    echo ""
    echo "✅ Multiple terminals detected!"
    echo "🎯 The selection dialog will appear on first launch."
    echo ""
    echo "📝 To test the full flow:"
    echo "   1. Run: open 'Claude Code Now.app'"
    echo "   2. A dialog will appear to select your preferred terminal"
    echo "   3. Your choice will be saved for future launches"
else
    echo ""
    echo "ℹ️  Only one terminal detected."
    echo "   The selection dialog will not appear in this case."
fi

echo ""
echo "🔄 To restore your previous config:"
echo "   mv $BACKUP_FILE $CONFIG_FILE"
echo ""
