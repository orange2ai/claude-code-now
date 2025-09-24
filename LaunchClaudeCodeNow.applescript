-- AppleScript to launch Claude Code Now in current Finder directory
-- 🖥 Claude Code Now - 即时启动，无需确认

tell application "Finder"
    set currentPath to ""

    try
        -- 尝试获取选中的文件夹
        set selectedItems to selection
        if (count of selectedItems) > 0 then
            set firstItem to item 1 of selectedItems
            if class of firstItem is folder then
                set currentPath to POSIX path of (firstItem as alias)
            else
                -- 如果选中的是文件，获取其父文件夹
                set currentPath to POSIX path of (container of firstItem as alias)
            end if
        else
            -- 如果没有选中项，获取当前窗口的文件夹
            set currentPath to POSIX path of (target of front window as alias)
        end if
    on error
        -- 如果出错，使用桌面作为默认路径
        set currentPath to POSIX path of (path to desktop)
    end try
end tell

-- 启动终端并在指定路径运行Claude Code Now
tell application "Terminal"
    activate
    do script "cd " & quoted form of currentPath & " && claude code now"
end tell