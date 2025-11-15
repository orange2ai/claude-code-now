#!/bin/bash

# Claude Code 配置快速切换器
# 作者: orange
# 产品理念: 简单 - 专注一个功能，做到极致

# 配置文件路径
SETTINGS_FILE="$HOME/.claude/settings.json"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 检查密钥是否已设置
is_key_set() {
    local key_name="$1"
    local key_value="${!key_name}"
    
    # 检查密钥是否为空或使用默认模板值
    if [[ -z "$key_value" || "$key_value" =~ ^your_.*_api_key_here$ || "$key_value" =~ ^your_.*_api_key$ ]]; then
        return 1  # 密钥未设置
    else
        return 0  # 密钥已设置
    fi
}

# 验证密钥文件安全性
validate_keys_file() {
    local file="$1"
    
    # 检查文件是否存在
    if [[ ! -f "$file" ]]; then
        return 1
    fi
    
    # 检查文件内容只包含变量赋值，防止代码注入
    while IFS= read -r line; do
        # 跳过空行和注释
        [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
        
        # 检查是否为有效的变量赋值格式
        if ! [[ "$line" =~ ^[A-Z_][A-Z0-9_]*=\"[^\"]*\"$ ]]; then
            echo -e "${RED}❌ 密钥文件包含无效内容，安全检查失败${NC}" >&2
            return 1
        fi
    done < "$file"
    
    return 0
}

# 首次设置密钥
setup_key() {
    local config_name="$1"
    local key_var_name=""
    local url_var_name=""
    local prompt_text=""
    local default_url=""
    
    case "$config_name" in
        "zhipu")
            key_var_name="ZHIPU_API_KEY"
            url_var_name="ZHIPU_BASE_URL"
            prompt_text="智谱AI (GLM)"
            default_url="https://open.bigmodel.cn/api/anthropic"
            ;;
        "anthropic")
            key_var_name="ANTHROPIC_API_KEY"
            url_var_name="ANTHROPIC_BASE_URL"
            prompt_text="Anthropic官方"
            default_url="https://api.anthropic.com"
            ;;
        "kimi")
            key_var_name="KIMI_API_KEY"
            url_var_name="KIMI_BASE_URL"
            prompt_text="月之暗面 (Kimi)"
            default_url="https://api.moonshot.cn/v1"
            ;;
        "custom")
            key_var_name="CUSTOM_API_KEY"
            url_var_name="CUSTOM_BASE_URL"
            prompt_text="自定义API"
            default_url=""
            ;;
    esac
    
    echo -e "${BLUE}🔧 设置 $prompt_text API密钥${NC}"
    echo ""
    
    # 输入API密钥
    while true; do
        echo -e "${YELLOW}请输入 $prompt_text 的API密钥:${NC}"
        read -p "> " api_key
        
        if [[ -z "$api_key" ]]; then
            echo -e "${RED}❌ API密钥不能为空，请重新输入${NC}"
            continue
        fi
        
        echo -e "${YELLOW}确认密钥: ${api_key:0:8}...${api_key: -4}${NC}"
        read -p "密钥正确吗？(y/N): " confirm
        
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            break
        else
            echo -e "${BLUE}👍 请重新输入密钥${NC}"
        fi
    done
    
    # 输入Base URL（如果不是自定义配置）
    if [[ "$config_name" != "custom" ]]; then
        echo ""
        echo -e "${GREEN}✅ Base URL 将使用默认值: $default_url${NC}"
        echo -e "${YELLOW}如需自定义请输入，否则直接按回车使用默认值:${NC}"
        read -p "> " base_url
        
        if [[ -z "$base_url" ]]; then
            base_url="$default_url"
        fi
    else
        echo ""
        echo -e "${YELLOW}请输入自定义Base URL:${NC}"
        read -p "> " base_url
        
        if [[ -z "$base_url" ]]; then
            echo -e "${RED}❌ Base URL不能为空${NC}"
            return 1
        fi
    fi
    
    # 确保keys.local文件存在并设置安全权限
    local keys_file="$SCRIPT_DIR/keys.local"
    if [[ ! -f "$keys_file" ]]; then
        cp "$SCRIPT_DIR/keys.template" "$keys_file"
        # 设置严格的文件权限：只有所有者可读写
        chmod 600 "$keys_file"
        echo -e "${GREEN}🔒 已设置密钥文件安全权限${NC}"
    fi
    
    # 更新密钥文件
    if [[ "$config_name" == "custom" ]]; then
        # 对于自定义配置，替换所有相关行
        sed -i '' "s|^${key_var_name}=.*|${key_var_name}=\"${api_key}\"|g" "$keys_file"
        sed -i '' "s|^${url_var_name}=.*|${url_var_name}=\"${base_url}\"|g" "$keys_file"
    else
        # 对于预设配置，只替换对应的密钥和URL
        sed -i '' "s|^${key_var_name}=.*|${key_var_name}=\"${api_key}\"|g" "$keys_file"
        sed -i '' "s|^${url_var_name}=.*|${url_var_name}=\"${base_url}\"|g" "$keys_file"
    fi
    
    echo -e "${GREEN}✅ 密钥已保存！${NC}"
    echo ""
    
    # 安全验证后重新加载密钥
    if validate_keys_file "$keys_file"; then
        source "$keys_file"
        echo -e "${GREEN}🔒 密钥文件安全验证通过${NC}"
    else
        echo -e "${RED}❌ 密钥文件安全验证失败，请检查文件内容${NC}"
        return 1
    fi
}

# 加载本地密钥配置
load_keys() {
    local keys_file="$SCRIPT_DIR/keys.local"
    
    if [[ -f "$keys_file" ]]; then
        # 安全验证后加载密钥
        if validate_keys_file "$keys_file"; then
            source "$keys_file"
            return 0
        else
            echo -e "${RED}❌ 密钥文件安全验证失败，拒绝加载${NC}" >&2
            return 1
        fi
    else
        return 1
    fi
}

# 获取配置函数
get_config() {
    # 先加载密钥
    load_keys
    
    case "$1" in
        "zhipu")
            echo "{
    \"env\": {
        \"ANTHROPIC_AUTH_TOKEN\": \"${ZHIPU_API_KEY:-your_zhipu_api_key}\",
        \"ANTHROPIC_BASE_URL\": \"${ZHIPU_BASE_URL:-https://open.bigmodel.cn/api/anthropic}\",
        \"API_TIMEOUT_MS\": \"${API_TIMEOUT_MS:-3000000}\",
        \"CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC\": 1
    }
}"
            ;;
        "anthropic")
            echo "{
    \"env\": {
        \"ANTHROPIC_AUTH_TOKEN\": \"${ANTHROPIC_API_KEY:-your_anthropic_api_key}\",
        \"ANTHROPIC_BASE_URL\": \"${ANTHROPIC_BASE_URL:-https://api.anthropic.com}\",
        \"API_TIMEOUT_MS\": \"${API_TIMEOUT_MS:-300000}\",
        \"CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC\": 1
    }
}"
            ;;
        "kimi")
            echo "{
    \"env\": {
        \"ANTHROPIC_AUTH_TOKEN\": \"${KIMI_API_KEY:-your_kimi_api_key}\",
        \"ANTHROPIC_BASE_URL\": \"${KIMI_BASE_URL:-https://api.moonshot.cn/anthropic}\",
        \"ANTHROPIC_MODEL\": \"kimi-k2-thinking-turbo\",
        \"ANTHROPIC_DEFAULT_OPUS_MODEL\": \"kimi-k2-thinking-turbo\",
        \"ANTHROPIC_DEFAULT_SONNET_MODEL\": \"kimi-k2-thinking-turbo\",
        \"ANTHROPIC_DEFAULT_HAIKU_MODEL\": \"kimi-k2-thinking-turbo\",
        \"CLAUDE_CODE_SUBAGENT_MODEL\": \"kimi-k2-thinking-turbo\",
        \"API_TIMEOUT_MS\": \"${API_TIMEOUT_MS:-300000}\",
        \"CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC\": 1
    }
}"
            ;;
        "custom")
            echo "{
    \"env\": {
        \"ANTHROPIC_AUTH_TOKEN\": \"${CUSTOM_API_KEY:-your_custom_api_key}\",
        \"ANTHROPIC_BASE_URL\": \"${CUSTOM_BASE_URL:-your_custom_base_url}\",
        \"API_TIMEOUT_MS\": \"${API_TIMEOUT_MS:-300000}\",
        \"CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC\": 1
    }
}"
            ;;
        *)
            echo ""
            ;;
    esac
}

# 检查配置是否存在
config_exists() {
    local config=$(get_config "$1")
    if [[ -n "$config" ]]; then
        return 0
    else
        return 1
    fi
}

# 显示当前配置
show_current() {
    echo -e "${BLUE}📋 当前配置:${NC}"
    if [[ -f "$SETTINGS_FILE" ]]; then
        cat "$SETTINGS_FILE" | python3 -m json.tool 2>/dev/null || cat "$SETTINGS_FILE"
    else
        echo -e "${YELLOW}⚠️  配置文件不存在${NC}"
    fi
}

# 显示可用配置
show_configs() {
    echo -e "${BLUE}📚 可用配置:${NC}"
    echo "1. zhipu     - 智谱AI (https://open.bigmodel.cn)"
    echo "2. anthropic - Anthropic官方"
    echo "3. kimi      - 月之暗面 (https://kimi.moonshot.cn)"
    echo "4. custom    - 自定义配置"
}

# 备份当前配置
backup_config() {
    if [[ -f "$SETTINGS_FILE" ]]; then
        cp "$SETTINGS_FILE" "$SETTINGS_FILE.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${GREEN}✅ 当前配置已备份${NC}"
    fi
}

# 应用配置
apply_config() {
    local config_name="$1"
    
    if ! config_exists "$config_name"; then
        echo -e "${RED}❌ 未知的配置: $config_name${NC}"
        return 1
    fi
    
    # 加载现有密钥
    load_keys
    
    # 检查对应的密钥是否已设置
    local key_var_name=""
    case "$config_name" in
        "zhipu")
            key_var_name="ZHIPU_API_KEY"
            ;;
        "anthropic")
            key_var_name="ANTHROPIC_API_KEY"
            ;;
        "kimi")
            key_var_name="KIMI_API_KEY"
            ;;
        "custom")
            key_var_name="CUSTOM_API_KEY"
            ;;
    esac
    
    # 如果密钥未设置，引导用户设置
    if ! is_key_set "$key_var_name"; then
        echo -e "${YELLOW}⚠️  检测到 $config_name 的API密钥未设置${NC}"
        echo ""
        setup_key "$config_name"
        
        # 如果设置失败，退出
        if ! is_key_set "$key_var_name"; then
            echo -e "${RED}❌ 密钥设置失败，无法继续${NC}"
            return 1
        fi
    fi
    
    backup_config
    
    get_config "$config_name" > "$SETTINGS_FILE"
    echo -e "${GREEN}✅ 已应用配置: $config_name${NC}"
    echo -e "${GREEN}🎉 配置切换完成！现在可以使用Claude Code了${NC}"
}

# 交互式选择
interactive_mode() {
    echo -e "${BLUE}🔧 Claude Code 配置切换器${NC}"
    echo ""
    show_current
    echo ""
    show_configs
    echo ""
    echo -e "${YELLOW}请选择配置 (输入配置名或 'q' 退出):${NC}"
    
    read -p "> " choice
    
    case "$choice" in
        "q"|"quit"|"exit")
            echo -e "${BLUE}👋 退出${NC}"
            ;;
        "zhipu"|"anthropic"|"kimi"|"custom")
            apply_config "$choice"
            ;;
        *)
            echo -e "${RED}❌ 无效选择: $choice${NC}"
            ;;
    esac
}

# 显示帮助
show_help() {
    echo -e "${BLUE}🔧 Claude Code 配置切换器${NC}"
    echo ""
    echo "用法:"
    echo "  $0 [配置名]"
    echo ""
    echo "可用配置:"
    echo "  zhipu     - 智谱AI"
    echo "  anthropic - Anthropic官方"
    echo "  kimi      - 月之暗面"
    echo "  custom    - 自定义配置"
    echo ""
    echo "命令:"
    echo "  -h, --help     显示帮助"
    echo "  -l, --list     显示可用配置"
    echo "  -s, --show     显示当前配置"
    echo "  -i, --interactive 交互式选择"
    echo ""
    echo "示例:"
    echo "  $0 zhipu       # 应用智谱AI配置"
    echo "  $0 --show      # 显示当前配置"
    echo "  $0 --list      # 显示所有可用配置"
}

# 主程序
main() {
    case "$1" in
        "")
            interactive_mode
            ;;
        "zhipu"|"anthropic"|"kimi"|"custom")
            apply_config "$1"
            ;;
        "-h"|"--help")
            show_help
            ;;
        "-l"|"--list")
            show_configs
            ;;
        "-s"|"--show")
            show_current
            ;;
        "-i"|"--interactive")
            interactive_mode
            ;;
        *)
            echo -e "${RED}❌ 未知参数: $1${NC}"
            show_help
            exit 1
            ;;
    esac
}

# 运行主程序
main "$@"