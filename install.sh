#!/bin/bash

# Claude Code Now 智能一键安装脚本
# 作者: orange
# 产品理念: 简单 - 专注一个功能，做到极致

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# 常量定义
REPO_URL="https://github.com/orange2ai/claude-code-now"
API_URL="https://api.github.com/repos/orange2ai/claude-code-now/releases/latest"
APP_NAME="Claude Code Now.app"
INSTALL_DIR="/Applications"
CLAUDE_CODE_DIR="$HOME/Documents/Claude Code"

# 显示欢迎信息
show_welcome() {
    clear
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                    🖥 Claude Code Now                        ║"
    echo "║                                                              ║"
    echo "║            世界上最快的 Claude Code 启动器                   ║"
    echo "║                    智能一键安装脚本                          ║"
    echo "║                                                              ║"
    echo "║                   By orange | 简单哲学                       ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
}

# 检查系统要求
check_system() {
    echo -e "${BLUE}🔍 检查系统要求...${NC}"
    
    # 检查 macOS
    if [[ "$(uname)" != "Darwin" ]]; then
        echo -e "${RED}❌ 错误: 此安装脚本仅支持 macOS${NC}"
        echo -e "${YELLOW}💡 Windows 用户请使用 install.bat${NC}"
        exit 1
    fi
    
    # 检查 macOS 版本
    macos_version=$(sw_vers -productVersion)
    echo -e "${GREEN}✅ macOS 版本: $macos_version${NC}"
    
    # 检查网络连接
    if ! ping -c 1 github.com >/dev/null 2>&1; then
        echo -e "${RED}❌ 错误: 无法连接到 GitHub，请检查网络连接${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ 网络连接正常${NC}"
    
    # 检查 curl
    if ! command -v curl >/dev/null 2>&1; then
        echo -e "${RED}❌ 错误: 需要 curl 命令${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ curl 可用${NC}"
    
    echo ""
}

# 获取最新版本信息
get_latest_release() {
    echo -e "${BLUE}📡 获取最新版本信息...${NC}"
    
    # 获取最新 release 信息
    local release_info
    release_info=$(curl -s "$API_URL")
    
    if [[ $? -ne 0 ]] || [[ -z "$release_info" ]]; then
        echo -e "${RED}❌ 错误: 无法获取版本信息${NC}"
        exit 1
    fi
    
    # 提取版本号和下载链接
    VERSION=$(echo "$release_info" | grep '"tag_name"' | cut -d'"' -f4)
    DOWNLOAD_URL=$(echo "$release_info" | grep '"browser_download_url".*\.zip' | grep -v '\.sha256' | cut -d'"' -f4 | head -1)
    
    if [[ -z "$VERSION" ]] || [[ -z "$DOWNLOAD_URL" ]]; then
        echo -e "${RED}❌ 错误: 无法解析版本信息${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ 最新版本: $VERSION${NC}"
    echo -e "${GREEN}✅ 下载链接: $DOWNLOAD_URL${NC}"
    echo ""
}

# 检查是否已安装
check_existing() {
    if [[ -d "$INSTALL_DIR/$APP_NAME" ]]; then
        echo -e "${YELLOW}⚠️  检测到已安装的版本${NC}"
        echo -e "${YELLOW}📍 位置: $INSTALL_DIR/$APP_NAME${NC}"
        echo ""
        echo -e "${PURPLE}请选择操作:${NC}"
        echo "1. 覆盖安装（推荐）"
        echo "2. 取消安装"
        echo ""
        read -p "请输入选择 [1-2]: " choice
        
        case $choice in
            1)
                echo -e "${BLUE}🔄 将覆盖现有安装...${NC}"
                rm -rf "$INSTALL_DIR/$APP_NAME"
                ;;
            2)
                echo -e "${YELLOW}👋 安装已取消${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}❌ 无效选择，安装已取消${NC}"
                exit 1
                ;;
        esac
        echo ""
    fi
}

# 创建工作目录
create_workspace() {
    echo -e "${BLUE}📁 创建工作目录...${NC}"
    
    if [[ ! -d "$CLAUDE_CODE_DIR" ]]; then
        mkdir -p "$CLAUDE_CODE_DIR"
        echo -e "${GREEN}✅ 已创建: $CLAUDE_CODE_DIR${NC}"
    else
        echo -e "${GREEN}✅ 工作目录已存在: $CLAUDE_CODE_DIR${NC}"
    fi
    echo ""
}

# 下载和安装
download_and_install() {
    echo -e "${BLUE}⬇️  下载 Claude Code Now $VERSION...${NC}"
    
    # 创建临时目录
    local temp_dir
    temp_dir=$(mktemp -d)
    local zip_file="$temp_dir/claude-code-now.zip"
    
    # 下载文件
    echo -e "${YELLOW}📥 正在下载...${NC}"
    if curl -L -o "$zip_file" "$DOWNLOAD_URL" --progress-bar; then
        echo -e "${GREEN}✅ 下载完成${NC}"
    else
        echo -e "${RED}❌ 下载失败${NC}"
        rm -rf "$temp_dir"
        exit 1
    fi
    
    # 解压文件
    echo -e "${BLUE}📦 解压安装包...${NC}"
    cd "$temp_dir"
    if unzip -q "$zip_file"; then
        echo -e "${GREEN}✅ 解压完成${NC}"
    else
        echo -e "${RED}❌ 解压失败${NC}"
        rm -rf "$temp_dir"
        exit 1
    fi
    
    # 查找 .app 文件
    local app_path
    app_path=$(find "$temp_dir" -name "*.app" -type d | head -1)
    
    if [[ -z "$app_path" ]]; then
        echo -e "${RED}❌ 错误: 找不到 .app 文件${NC}"
        rm -rf "$temp_dir"
        exit 1
    fi
    
    # 安装到 Applications
    echo -e "${BLUE}🚀 安装到 Applications...${NC}"
    if cp -R "$app_path" "$INSTALL_DIR/"; then
        echo -e "${GREEN}✅ 安装完成${NC}"
    else
        echo -e "${RED}❌ 安装失败，可能需要管理员权限${NC}"
        echo -e "${YELLOW}💡 尝试使用 sudo 权限...${NC}"
        if sudo cp -R "$app_path" "$INSTALL_DIR/"; then
            echo -e "${GREEN}✅ 安装完成${NC}"
        else
            echo -e "${RED}❌ 安装失败${NC}"
            rm -rf "$temp_dir"
            exit 1
        fi
    fi
    
    # 清理临时文件
    rm -rf "$temp_dir"
    echo ""
}

# 配置启动器
setup_launcher() {
    echo -e "${BLUE}⚙️  配置启动器...${NC}"
    
    # 设置可执行权限
    chmod +x "$INSTALL_DIR/$APP_NAME/Contents/MacOS/"*
    
    # 检查 Claude Code CLI
    if command -v claude >/dev/null 2>&1; then
        echo -e "${GREEN}✅ Claude Code CLI 已安装${NC}"
    else
        echo -e "${YELLOW}⚠️  未检测到 Claude Code CLI${NC}"
        echo -e "${YELLOW}💡 请安装 Claude Code CLI: https://docs.claude.com/en/docs/claude-code${NC}"
    fi
    echo ""
}

# 显示完成信息
show_completion() {
    echo -e "${GREEN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                    🎉 安装成功完成！                         ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
    echo -e "${BLUE}📍 安装位置:${NC} $INSTALL_DIR/$APP_NAME"
    echo -e "${BLUE}📁 工作目录:${NC} $CLAUDE_CODE_DIR"
    echo -e "${BLUE}📋 版本信息:${NC} $VERSION"
    echo ""
    echo -e "${PURPLE}🚀 使用方法:${NC}"
    echo "1. 🖥  程序坞启动: 从 Applications 拖拽到程序坞，点击启动"
    echo "2. ⚡ 工具栏启动: 按住 Command 键拖拽到 Finder 工具栏"
    echo "3. 📁 文件夹启动: 双击应用图标直接启动"
    echo ""
    echo -e "${YELLOW}💡 提示:${NC}"
    echo "• 首次启动可能需要确认安全性设置"
    echo "• 确保已安装 Claude Code CLI"
    echo "• 享受一键启动的便利！"
    echo ""
    echo -e "${BLUE}🔧 配置切换器:${NC}"
    echo "• 位置: $INSTALL_DIR/$APP_NAME/Contents/Resources/config-switcher/"
    echo "• 支持: 智谱AI、Anthropic官方、自定义API"
    echo ""
    echo -e "${GREEN}感谢使用 Claude Code Now! 🙏${NC}"
    echo ""
}

# 错误处理
error_handler() {
    echo -e "${RED}❌ 安装过程中发生错误${NC}"
    echo -e "${YELLOW}💡 请检查网络连接和系统权限${NC}"
    echo -e "${YELLOW}💡 或访问 $REPO_URL 手动下载${NC}"
    exit 1
}

# 主函数
main() {
    # 设置错误处理
    trap error_handler ERR
    
    # 执行安装步骤
    show_welcome
    check_system
    get_latest_release
    check_existing
    create_workspace
    download_and_install
    setup_launcher
    show_completion
}

# 运行主函数
main "$@"