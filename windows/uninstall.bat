@echo off
chcp 65001 >nul
:: 🖥 Claude Code Now - 一键完全卸载

echo.
echo ========================================
echo   🗑️ Claude Code Now 卸载程序
echo ========================================
echo.

:: 1. 检查管理员权限
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ 请以管理员权限运行此脚本
    pause
    exit /b 1
)

echo 📝 正在移除右键菜单...

:: 2. 删除注册表项
reg delete "HKEY_CLASSES_ROOT\Directory\shell\ClaudeCodeNow" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\ClaudeCodeNow" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\Drive\shell\ClaudeCodeNow" /f >nul 2>&1

echo ✅ 注册表清理完成

:: 3. 删除安装文件
set "InstallDir=%USERPROFILE%\.claude\claude-code-now"

if exist "%InstallDir%" (
    echo 🗑️ 正在删除文件...
    rmdir /s /q "%InstallDir%"
    echo ✅ 已删除安装目录: %InstallDir%
    
    :: 尝试删除空的父目录 .claude (如果里面没别的东西)
    rmdir "%USERPROFILE%\.claude" >nul 2>&1
) else (
    echo ℹ️  安装目录已不存在
)

echo.
echo ========================================
echo   ✅ 卸载完成！
echo ========================================
echo.
pause
