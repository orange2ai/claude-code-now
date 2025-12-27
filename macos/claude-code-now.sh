#!/bin/bash

# 🖥 Claude Code Now - 即时启动，无需确认
# Shell script to launch Claude Code Now in current directory

# Detect and add nvm Node.js path dynamically
NVM_NODE_PATH=""
if [ -d "$HOME/.nvm" ]; then
    # Try to load nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 2>/dev/null || true
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 2>/dev/null || true

    # Try to get current/default Node.js version
    if command -v nvm >/dev/null 2>&1; then
        # Get current node version or default version
        CURRENT_NODE_VERSION=$(nvm current 2>/dev/null | grep -v 'none' | head -1 || nvm alias default 2>/dev/null | grep -v 'default -> N/A' | head -1 || "")
        if [ -n "$CURRENT_NODE_VERSION" ] && [ "$CURRENT_NODE_VERSION" != "none" ] && [ "$CURRENT_NODE_VERSION" != "system" ]; then
            NVM_NODE_PATH="$HOME/.nvm/versions/node/$CURRENT_NODE_VERSION/bin"
        else
            # Fallback: find the latest installed version
            LATEST_NODE_VERSION=$(ls "$HOME/.nvm/versions/node/" 2>/dev/null | sort -V | tail -1 || echo "")
            if [ -n "$LATEST_NODE_VERSION" ]; then
                NVM_NODE_PATH="$HOME/.nvm/versions/node/$LATEST_NODE_VERSION/bin"
            fi
        fi
    else
        # Fallback: find the latest installed version without nvm command
        LATEST_NODE_VERSION=$(ls "$HOME/.nvm/versions/node/" 2>/dev/null | sort -V | tail -1 || echo "")
        if [ -n "$LATEST_NODE_VERSION" ]; then
            NVM_NODE_PATH="$HOME/.nvm/versions/node/$LATEST_NODE_VERSION/bin"
        fi
    fi
fi

# 设置完整的PATH，包含更多可能的安装路径
if [ -n "$NVM_NODE_PATH" ]; then
    export PATH="$NVM_NODE_PATH:$HOME/.npm-global/bin:$HOME/.npm/bin:$HOME/.local/bin:/usr/local/bin:/opt/homebrew/bin:/usr/local/share/npm/bin:$PATH"
else
    export PATH="$HOME/.npm-global/bin:$HOME/.npm/bin:$HOME/.local/bin:/usr/local/bin:/opt/homebrew/bin:/usr/local/share/npm/bin:$PATH"
fi

# 保存上次目录的配置文件
LAST_DIR_FILE="$HOME/.claude-code-now-last-dir"

# 如果用户提供了参数，使用参数
if [ -n "$1" ]; then
    TARGET_DIR="$1"
# 否则尝试读取上次的目录
elif [ -f "$LAST_DIR_FILE" ]; then
    TARGET_DIR=$(cat "$LAST_DIR_FILE")
# 都没有则使用主目录
else
    TARGET_DIR="$HOME"
fi

# 检查目录是否存在
if [ ! -d "$TARGET_DIR" ]; then
    echo "错误: 目录 '$TARGET_DIR' 不存在"
    exit 1
fi

# 切换到目标目录并启动Claude Code Now
cd "$TARGET_DIR" || exit 1

echo "🖥 在目录 '$TARGET_DIR' 启动 Claude Code Now..."

# 启动Claude Code - 即时启动，无需确认
# 尝试在多个可能的路径中查找 claude 命令
CLAUDE_PATH=""
if command -v claude >/dev/null 2>&1; then
    CLAUDE_PATH=$(command -v claude)
else
    # 尝试常见的安装位置
    for path in "$HOME/.npm-global/bin/claude" "$HOME/.npm/bin/claude" "$HOME/.local/bin/claude" "/usr/local/bin/claude" "/opt/homebrew/bin/claude"; do
        if [ -x "$path" ]; then
            CLAUDE_PATH="$path"
            break
        fi
    done
fi

if [ -z "$CLAUDE_PATH" ]; then
    echo "❌ 错误: Claude Code 未安装或不在 PATH 中"
    echo ""
    echo "💡 请确保已安装 Claude Code CLI"
    echo "💡 提示：请尝试运行 'command -v claude' 来检查 claude 的路径"
    echo ""
    echo "📝 常见安装位置："
    echo "   - $HOME/.npm-global/bin/claude"
    echo "   - $HOME/.npm/bin/claude"
    echo "   - /usr/local/bin/claude"
    echo "   - /opt/homebrew/bin/claude"
    exit 1
fi

echo "✅ 找到 Claude Code: $CLAUDE_PATH"

# 保存当前目录，供下次使用
echo "$TARGET_DIR" > "$LAST_DIR_FILE"

"$CLAUDE_PATH" --permission-mode bypassPermissions