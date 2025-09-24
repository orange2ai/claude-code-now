-- 创建右键菜单服务的AppleScript
-- 保存时选择"应用程序"格式，并勾选"保留打开状态"为否

on run
    -- 当直接运行时显示说明
    display dialog "这是Claude Code启动器的右键菜单版本。

使用方法：
1. 在Finder中选中一个文件夹
2. 右键选择此应用程序
3. 或将文件夹拖拽到此应用程序图标上

点击确定继续..." buttons {"确定"} default button "确定"

    -- 获取当前Finder路径
    tell application "Finder"
        try
            set currentPath to POSIX path of (target of front window as alias)
        on error
            set currentPath to POSIX path of (path to desktop)
        end try
    end tell

    launchClaudeCode(currentPath)
end run

on open droppedItems
    -- 当拖拽文件/文件夹到应用图标时运行
    repeat with anItem in droppedItems
        set itemPath to POSIX path of anItem
        tell application "System Events"
            if (exists folder itemPath) then
                launchClaudeCode(itemPath)
                exit repeat
            else
                -- 如果是文件，获取其父目录
                set parentPath to do shell script "dirname " & quoted form of itemPath
                launchClaudeCode(parentPath)
                exit repeat
            end if
        end tell
    end repeat
end open

-- 启动Claude Code的函数
on launchClaudeCode(targetPath)
    -- 设置PATH环境变量
    set pathEnv to "export PATH=\"$HOME/.nvm/versions/node/v22.17.1/bin:$HOME/.npm-global/bin:/usr/local/bin:/opt/homebrew/bin:$PATH\""

    -- 构建命令
    set cdCommand to "cd " & quoted form of targetPath
    set claudeCommand to "claude"
    set fullCommand to pathEnv & " && " & cdCommand & " && " & claudeCommand

    -- 启动Terminal并运行命令
    tell application "Terminal"
        activate
        do script fullCommand
    end tell
end launchClaudeCode