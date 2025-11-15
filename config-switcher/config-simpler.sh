#!/bin/bash

# Claude Code 配置切换器 - 简化版
# 直接拷贝预设配置文件

SETTINGS_DIR="$HOME/.claude"
CONFIGS_DIR="$SETTINGS_DIR/configs"

echo "🔧 Claude Code 配置切换器 (简化版)"
echo "=================================="
echo ""

# 确保配置目录存在
mkdir -p "$CONFIGS_DIR"

# 显示当前配置
echo "📋 当前配置:"
if [[ -f "$SETTINGS_DIR/settings.json" ]]; then
    echo "$SETTINGS_DIR/settings.json"
    cat "$SETTINGS_DIR/settings.json" | python3 -m json.tool 2>/dev/null || cat "$SETTINGS_DIR/settings.json"
else
    echo "⚠️ 配置文件不存在"
fi
echo ""

# 显示可用配置
echo "📚 可用配置:"
echo "1. zhipu     - 智谱AI"
echo "2. anthropic - Anthropic官方"
echo "3. kimi      - 月之暗面"
echo "4. custom    - 自定义配置"
echo ""

# 询问用户选择
echo "请选择要切换的配置 (输入数字):"
read -p "> " choice

case "$choice" in
    "1")
        config_file="settings_zhipu.json"
        config_name="智谱AI"
        ;;
    "2")
        config_file="settings_anthropic.json"
        config_name="Anthropic官方"
        ;;
    "3")
        config_file="settings_kimi.json"
        config_name="月之暗面Kimi"
        ;;
    "4")
        config_file="settings_custom.json"
        config_name="自定义配置"
        ;;
    *)
        echo "❌ 无效选择"
        exit 1
        ;;
esac

echo ""
echo "正在切换到 $config_name 配置..."

# 备份当前配置
if [[ -f "$SETTINGS_DIR/settings.json" ]]; then
    cp "$SETTINGS_DIR/settings.json" "$SETTINGS_DIR/settings.json.backup.$(date +%Y%m%d_%H%M%S)"
    echo "✅ 当前配置已备份"
fi

# 拷贝配置
if [[ -f "$SETTINGS_DIR/$config_file" ]]; then
    cp "$SETTINGS_DIR/$config_file" "$SETTINGS_DIR/settings.json"
    echo "✅ 已应用配置: $config_name"
    echo ""
    echo "🎉 配置切换完成！配置文件已更新到:"
    echo "$SETTINGS_DIR/settings.json"
    echo ""
    echo "请重启 Claude Code 使配置生效"
else
    echo "❌ 错误: 配置文件 $SETTINGS_DIR/$config_file 不存在"
    echo ""
    echo "请先创建该配置文件:"
    echo "cp $SETTINGS_DIR/settings.json $SETTINGS_DIR/$config_file"
    exit 1
fi
