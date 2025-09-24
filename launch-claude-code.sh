#!/bin/bash

# Shell script to launch Claude Code in current directory
# 如果传入参数，使用参数作为路径；否则使用当前路径

# 设置完整的PATH
export PATH="$HOME/.nvm/versions/node/v22.17.1/bin:$HOME/.npm-global/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"

TARGET_DIR="${1:-$(pwd)}"

# 检查目录是否存在
if [ ! -d "$TARGET_DIR" ]; then
    echo "错误: 目录 '$TARGET_DIR' 不存在"
    exit 1
fi

# 切换到目标目录并启动Claude Code
cd "$TARGET_DIR" || exit 1

echo "在目录 '$TARGET_DIR' 启动 Claude Code..."

# 启动Claude Code
if command -v claude >/dev/null 2>&1; then
    claude
else
    echo "错误: Claude Code 未安装或不在 PATH 中"
    echo "请确保已安装 Claude Code CLI"
    exit 1
fi