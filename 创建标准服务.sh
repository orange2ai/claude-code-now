#!/bin/bash

echo "🔧 创建标准macOS右键菜单服务..."

# 服务目录
SERVICE_NAME="Launch Claude Code Here.workflow"
SERVICE_PATH="$HOME/Library/Services/$SERVICE_NAME"

# 删除旧的服务
rm -rf "$SERVICE_PATH"

# 创建服务目录结构
mkdir -p "$SERVICE_PATH/Contents"

# 创建 Info.plist
cat > "$SERVICE_PATH/Contents/Info.plist" << 'EOF'
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
				<string>Launch Claude Code Here</string>
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

# 创建 document.wflow
cat > "$SERVICE_PATH/Contents/document.wflow" << 'EOF'
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
				<key>AMApplication</key>
				<array>
					<string>Automator</string>
				</array>
				<key>ActionBundlePath</key>
				<string>/System/Library/Automator/Run Shell Script.action</string>
				<key>ActionName</key>
				<string>Run Shell Script</string>
				<key>ActionParameters</key>
				<dict>
					<key>COMMAND_STRING</key>
					<string>export PATH="$HOME/.nvm/versions/node/v22.17.1/bin:$HOME/.npm-global/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"

for f in "$@"
do
	if [ -d "$f" ]; then
		osascript -e "tell application \"Terminal\"
			activate
			do script \"cd '$f' && claude\"
		end tell"
		break
	fi
done</string>
					<key>CheckedForUserDefaultShell</key>
					<true/>
					<key>inputMethod</key>
					<integer>1</integer>
					<key>shell</key>
					<string>/bin/bash</string>
				</dict>
				<key>BundleIdentifier</key>
				<string>com.apple.RunShellScript</string>
			</dict>
		</dict>
	</array>
	<key>connectors</key>
	<dict/>
	<key>workflowMetaData</key>
	<dict>
		<key>applicationBundleIDsByPath</key>
		<dict/>
		<key>applicationPaths</key>
		<array/>
		<key>inputTypeIdentifier</key>
		<string>com.apple.Automator.fileSystemObject</string>
		<key>outputTypeIdentifier</key>
		<string>com.apple.Automator.nothing</string>
		<key>presentationMode</key>
		<integer>15</integer>
		<key>processesInput</key>
		<integer>0</integer>
		<key>serviceApplicationBundleID</key>
		<string>com.apple.finder</string>
		<key>serviceApplicationPath</key>
		<string>/System/Library/CoreServices/Finder.app</string>
		<key>serviceInputTypeIdentifier</key>
		<string>com.apple.Automator.fileSystemObject</string>
		<key>serviceOutputTypeIdentifier</key>
		<string>com.apple.Automator.nothing</string>
		<key>serviceProcessesInput</key>
		<integer>0</integer>
	</dict>
</dict>
</plist>
EOF

echo "✅ 服务创建完成: $SERVICE_PATH"
echo "🔄 刷新系统服务..."

# 刷新服务缓存
/System/Library/CoreServices/pbs -flush

echo "✅ 完成！请重启Finder并测试右键菜单"
echo "killall Finder"