@echo off
chcp 65001 >nul
REM 🖥 Claude Code Now - Windows 右键菜单卸载脚本

echo.
echo ========================================
echo   🖥 卸载右键菜单
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

echo 📝 正在删除右键菜单...
echo.

REM 删除文件夹右键菜单
reg delete "HKEY_CLASSES_ROOT\Directory\shell\ClaudeCodeNow" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo ✅ 已删除文件夹右键菜单
) else (
    echo ℹ️  文件夹右键菜单不存在
)

REM 删除文件夹背景右键菜单
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\ClaudeCodeNow" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo ✅ 已删除文件夹背景右键菜单
) else (
    echo ℹ️  文件夹背景右键菜单不存在
)

REM 删除驱动器右键菜单
reg delete "HKEY_CLASSES_ROOT\Drive\shell\ClaudeCodeNow" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo ✅ 已删除驱动器右键菜单
) else (
    echo ℹ️  驱动器右键菜单不存在
)

echo.
echo ========================================
echo   ✅ 右键菜单卸载完成！
echo ========================================
echo.
pause
