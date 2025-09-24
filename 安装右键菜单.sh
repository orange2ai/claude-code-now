#!/bin/bash

echo "🔧 创建Claude Code右键菜单服务..."

# 创建服务目录
SERVICE_DIR="$HOME/Library/Services/在此处启动Claude Code.workflow"
mkdir -p "$SERVICE_DIR/Contents"

# 创建Info.plist
cat > "$SERVICE_DIR/Contents/Info.plist" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>NSServices</key>
    <array>
        <dict>
            <key>NSMenuItem</key>
            <dict>
                <key>default</key>
                <string>在此处启动Claude Code</string>
            </dict>
            <key>NSMessage</key>
            <string>runWorkflowAsService</string>
            <key>NSSendFileTypes</key>
            <array>
                <string>public.folder</string>
            </array>
            <key>NSRequiredContext</key>
            <dict>
                <key>NSApplicationIdentifier</key>
                <string>com.apple.finder</string>
            </dict>
        </dict>
    </array>
</dict>
</plist>
EOF

# 创建简化的document.wflow
cat > "$SERVICE_DIR/Contents/document.wflow" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>actions</key>
    <array>
        <dict>
            <key>action</key>
            <dict>
                <key>AMActionVersion</key>
                <string>2.0.3</string>
                <key>ActionBundlePath</key>
                <string>/System/Library/Automator/Run Shell Script.action</string>
                <key>ActionName</key>
                <string>Run Shell Script</string>
                <key>ActionParameters</key>
                <dict>
                    <key>COMMAND_STRING</key>
                    <string>export PATH="$HOME/.nvm/versions/node/v22.17.1/bin:$HOME/.npm-global/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"
for f in "$@"; do
    if [ -d "$f" ]; then
        osascript -e "tell application \"Terminal\" to do script \"cd '$f' && claude\""
        break
    fi
done</string>
                    <key>inputMethod</key>
                    <integer>1</integer>
                    <key>shell</key>
                    <string>/bin/bash</string>
                </dict>
            </dict>
        </dict>
    </array>
</dict>
</plist>
EOF

echo "✅ 服务文件创建完成"
echo "🔄 刷新服务缓存..."

# 刷新服务
/System/Library/CoreServices/pbs -flush 2>/dev/null

echo "✅ 右键菜单服务安装完成！"
echo ""
echo "使用方法："
echo "1. 右键任意文件夹"
echo "2. 选择 '服务' → '在此处启动Claude Code'"
echo ""
echo "如果没有看到菜单项，请重启Finder："
echo "killall Finder"