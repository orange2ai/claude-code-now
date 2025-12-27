#!/bin/bash

# 🖥 Claude Code Now - Terminal Configuration Tool
# 用于设置偏好的终端应用

TERMINAL_CONFIG_FILE="$HOME/.claude-code-now-terminal"

echo "🖥 Claude Code Now - Terminal Configuration"
echo "=========================================="
echo ""

# 检测已安装的终端应用
echo "🔍 Detecting installed terminal applications..."
AVAILABLE_TERMINALS=()

if [ -d "/Applications/iTerm.app" ]; then
    AVAILABLE_TERMINALS+=("iTerm2")
    echo "✅ iTerm2 detected"
elif [ -d "/Applications/iTerm 2.app" ]; then
    AVAILABLE_TERMINALS+=("iTerm2")
    echo "✅ iTerm2 detected (legacy version)"
fi

if [ -d "/Applications/Warp.app" ]; then
    AVAILABLE_TERMINALS+=("Warp")
    echo "✅ Warp detected"
fi

if [ -d "/Applications/Alacritty.app" ]; then
    AVAILABLE_TERMINALS+=("Alacritty")
    echo "✅ Alacritty detected"
fi

AVAILABLE_TERMINALS+=("Terminal")
echo "✅ Terminal (system default)"

echo ""

# 显示当前配置
if [ -f "$TERMINAL_CONFIG_FILE" ]; then
    CURRENT_TERMINAL=$(cat "$TERMINAL_CONFIG_FILE" 2>/dev/null | tr -d '\n\r')
    echo "📋 Current setting: $CURRENT_TERMINAL"
else
    echo "📋 Current setting: Auto-detect (iTerm2 > Warp > Terminal)"
fi

echo ""
echo "🛠 Choose your preferred terminal:"
echo "0) Auto-detect (remove custom setting)"

for i in "${!AVAILABLE_TERMINALS[@]}"; do
    echo "$((i+1))) ${AVAILABLE_TERMINALS[$i]}"
done

echo ""
read -p "Enter your choice (0-$((${#AVAILABLE_TERMINALS[@]}))): " choice

case $choice in
    0)
        if [ -f "$TERMINAL_CONFIG_FILE" ]; then
            rm "$TERMINAL_CONFIG_FILE"
            echo "✅ Custom terminal setting removed. Will auto-detect best available terminal."
        else
            echo "ℹ️  Already using auto-detection."
        fi
        ;;
    [1-9]*)
        index=$((choice-1))
        if [ $index -ge 0 ] && [ $index -lt ${#AVAILABLE_TERMINALS[@]} ]; then
            selected_terminal="${AVAILABLE_TERMINALS[$index]}"
            echo "$selected_terminal" > "$TERMINAL_CONFIG_FILE"
            echo "✅ Terminal preference set to: $selected_terminal"
        else
            echo "❌ Invalid choice. Please run the script again."
            exit 1
        fi
        ;;
    *)
        echo "❌ Invalid choice. Please run the script again."
        exit 1
        ;;
esac

echo ""
echo "🎉 Configuration complete! Claude Code Now will use your preferred terminal."
echo ""
echo "💡 Tips:"
echo "  - You can run this script anytime to change your preference"
echo "  - If your preferred terminal is not available, it will fall back to auto-detection"
echo "  - Supported terminals: iTerm2, Warp, Alacritty, Terminal"