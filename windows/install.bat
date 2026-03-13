@echo off
chcp 65001 >nul
:: 🖥 Claude Code Now - 一键安装脚本

echo.
echo ========================================
echo   🚀 Claude Code Now 一键安装
echo ========================================
echo.

:: 1. 检查管理员权限
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ 错误: 需要管理员权限
    echo 💡 请右键点击此文件，选择 "以管理员身份运行"
    pause
    exit /b 1
)

:: 2. 设置通用安装路径 (C:\Users\用户名\.claude\claude-code-now)
set "InstallDir=%USERPROFILE%\.claude\claude-code-now"
set "SourceDir=%~dp0"

echo 📂 目标安装路径: %InstallDir%

:: 3. 创建目录并复制文件
if not exist "%InstallDir%" mkdir "%InstallDir%"

echo 📝 正在复制文件...
copy /Y "%SourceDir%claude-code-now.ps1" "%InstallDir%\" >nul
if %errorLevel% neq 0 (
    echo ❌ 错误: 未找到 claude-code-now.ps1
    echo    请确保它和本脚本在同一目录下。
    pause
    exit /b 1
)

if exist "%SourceDir%claude.ico" (
    copy /Y "%SourceDir%claude.ico" "%InstallDir%\" >nul
    echo ✅ 图标文件已复制
) else (
    echo ⚠️ 未找到 claude.ico，将使用默认图标
)

:: 4. 注册右键菜单
echo 📝 正在注册右键菜单...

:: --- 文件夹右键 ---
reg add "HKEY_CLASSES_ROOT\Directory\shell\ClaudeCodeNow" /ve /d "Claude Code Now" /f >nul
if exist "%InstallDir%\claude.ico" (
    reg add "HKEY_CLASSES_ROOT\Directory\shell\ClaudeCodeNow" /v "Icon" /d "%InstallDir%\claude.ico" /f >nul
) else (
    reg add "HKEY_CLASSES_ROOT\Directory\shell\ClaudeCodeNow" /v "Icon" /d "powershell.exe" /f >nul
)
reg add "HKEY_CLASSES_ROOT\Directory\shell\ClaudeCodeNow\command" /ve /d "powershell.exe -ExecutionPolicy Bypass -NoExit -File \"%InstallDir%\claude-code-now.ps1\" \"%%V\"" /f >nul

:: --- 背景右键 ---
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ClaudeCodeNow" /ve /d "Claude Code Now" /f >nul
if exist "%InstallDir%\claude.ico" (
    reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ClaudeCodeNow" /v "Icon" /d "%InstallDir%\claude.ico" /f >nul
) else (
    reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ClaudeCodeNow" /v "Icon" /d "powershell.exe" /f >nul
)
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\ClaudeCodeNow\command" /ve /d "powershell.exe -ExecutionPolicy Bypass -NoExit -File \"%InstallDir%\claude-code-now.ps1\" \"%%V\"" /f >nul

:: --- 驱动器右键 ---
reg add "HKEY_CLASSES_ROOT\Drive\shell\ClaudeCodeNow" /ve /d "Claude Code Now" /f >nul
if exist "%InstallDir%\claude.ico" (
    reg add "HKEY_CLASSES_ROOT\Drive\shell\ClaudeCodeNow" /v "Icon" /d "%InstallDir%\claude.ico" /f >nul
) else (
    reg add "HKEY_CLASSES_ROOT\Drive\shell\ClaudeCodeNow" /v "Icon" /d "powershell.exe" /f >nul
)
reg add "HKEY_CLASSES_ROOT\Drive\shell\ClaudeCodeNow\command" /ve /d "powershell.exe -ExecutionPolicy Bypass -NoExit -File \"%InstallDir%\claude-code-now.ps1\" \"%%V\"" /f >nul

echo.
echo ========================================
echo   ✅ 安装成功！
echo ========================================
echo.
pause