#!/bin/bash

# Claude Code 配置切换器 - 简单双击版本
# 作者: orange

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 切换到脚本目录
cd "$SCRIPT_DIR"

# 显示标题
echo "🔧 Claude Code 配置切换器"
echo "=========================="
echo ""

# 显示当前配置
echo "📋 当前配置:"
if [[ -f "$HOME/.claude/settings.json" ]]; then
    cat "$HOME/.claude/settings.json"
else
    echo "⚠️ 配置文件不存在"
fi
echo ""

# 显示可用配置
echo "📚 可用配置:"
echo "1. zhipu     - 智谱AI (https://open.bigmodel.cn)"
echo "2. anthropic - Anthropic官方"
echo "3. custom    - 自定义配置"
echo ""

# 询问用户选择
echo "请选择要切换的配置 (输入数字):"
read -p "> " choice

case "$choice" in
    "1")
        echo "正在切换到智谱AI配置..."
        echo ""
        ./claude-config-switcher.sh zhipu
        ;;
    "2")
        echo "正在切换到Anthropic官方配置..."
        echo ""
        ./claude-config-switcher.sh anthropic
        ;;
    "3")
        echo "正在切换到自定义配置..."
        echo ""
        ./claude-config-switcher.sh custom
        ;;
    *)
        echo "❌ 无效选择"
        ;;
esac

echo ""
echo "操作完成！"
echo ""
echo "窗口将在5秒后关闭..."
sleep 5