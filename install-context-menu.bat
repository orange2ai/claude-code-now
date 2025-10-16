@echo off
chcp 65001 >nul
REM 🖥 Claude Code Now - Windows 右键菜单安装脚本

echo.
echo ========================================
echo   🖥 安装右键菜单
echo ========================================
echo.

REM 检查是否以管理员权限运行
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ 请以管理员权限运行此脚本
    echo.
    echo 💡 右键点击此文件，选择 "以管理员身份运行"
    pause
    exit /b 1
)

REM 检查 PowerShell 脚本是否存在
if not exist "%USERPROFILE%\bin\claude-code-now.ps1" (
    echo ❌ 未找到 claude-code-now.ps1
    echo.
    echo 💡 请先运行 install.bat 进行基础安装
    pause
    exit /b 1
)

echo 📝 正在添加右键菜单...
echo.

REM 添加文件夹右键菜单（在文件夹上右键）
reg add "HKEY_CLASSES_ROOT\Directory\shell\ClaudeCodeNow" /ve /d "Claude Code Now" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\ClaudeCodeNow" /v "Icon" /d "%%SystemRoot%%\System32\SHELL32.dll,43" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\ClaudeCodeNow\command" /ve /d "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File \"%USERPROFILE%\bin\claude-code-now.ps1\" \"%%V\"" /f >nul

echo ✅ 已添加文件夹右键菜单

REM 添加文件夹背景右键菜单（在文件夹内空白处右键）
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ClaudeCodeNow" /ve /d "Claude Code Now" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ClaudeCodeNow" /v "Icon" /d "%%SystemRoot%%\System32\SHELL32.dll,43" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ClaudeCodeNow\command" /ve /d "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File \"%USERPROFILE%\bin\claude-code-now.ps1\" \"%%V\"" /f >nul

echo ✅ 已添加文件夹背景右键菜单

REM 添加驱动器右键菜单
reg add "HKEY_CLASSES_ROOT\Drive\shell\ClaudeCodeNow" /ve /d "Claude Code Now" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shell\ClaudeCodeNow" /v "Icon" /d "%%SystemRoot%%\System32\SHELL32.dll,43" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shell\ClaudeCodeNow\command" /ve /d "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File \"%USERPROFILE%\bin\claude-code-now.ps1\" \"%%V\"" /f >nul

echo ✅ 已添加驱动器右键菜单

echo.
echo ========================================
echo   ✅ 右键菜单安装完成！
echo ========================================
echo.
echo 💡 现在可以在任何文件夹上右键，选择 "Claude Code Now"
echo.
pause
