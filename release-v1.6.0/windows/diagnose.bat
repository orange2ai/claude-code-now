@echo off
chcp 65001 >nul
REM 🖥 Claude Code Now - Windows 诊断脚本

echo.
echo ========================================
echo   🔍 Claude Code Now - 诊断工具
echo ========================================
echo.

echo 📋 系统信息:
echo   操作系统: %OS%
echo   用户名: %USERNAME%
echo   用户目录: %USERPROFILE%
echo   当前目录: %CD%
echo.

echo 🔍 检查安装环境:
REM 检查当前目录文件
echo 📁 当前目录中的文件:
dir /b *.ps1 *.bat 2>nul
echo.

REM 检查用户bin目录
echo 📁 用户bin目录: %USERPROFILE%\bin
if exist "%USERPROFILE%\bin" (
    echo ✅ bin目录存在
    echo 📋 bin目录内容:
    dir "%USERPROFILE%\bin" /b 2>nul
) else (
    echo ❌ bin目录不存在
)
echo.

REM 检查PATH
echo 📋 PATH 环境变量 (包含bin的部分):
echo %PATH% | findstr /C:"bin" || echo ⚠️ 未找到bin相关PATH
echo.

REM 检查PowerShell脚本
echo 🔍 检查 PowerShell 脚本:
if exist "claude-code-now.ps1" (
    echo ✅ 当前目录中存在 claude-code-now.ps1
    powershell -Command "Get-Item 'claude-code-now.ps1' | Select-Object Name, Length, LastWriteTime"
) else (
    echo ❌ 当前目录中不存在 claude-code-now.ps1
)

if exist "%USERPROFILE%\bin\claude-code-now.ps1" (
    echo ✅ 用户bin目录中存在 claude-code-now.ps1
    powershell -Command "Get-Item '%USERPROFILE%\bin\claude-code-now.ps1' | Select-Object Name, Length, LastWriteTime"
) else (
    echo ❌ 用户bin目录中不存在 claude-code-now.ps1
)
echo.

REM 检查Node.js和Claude
echo 🔍 检查开发环境:
where node >nul 2>&1
if %errorLevel% equ 0 (
    echo ✅ Node.js 已安装
    node --version
) else (
    echo ❌ Node.js 未安装
)

where npm >nul 2>&1
if %errorLevel% equ 0 (
    echo ✅ npm 已安装
    npm --version
) else (
    echo ❌ npm 未安装
)

where claude >nul 2>&1
if %errorLevel% equ 0 (
    echo ✅ Claude Code 已安装
    claude --version
) else (
    echo ❌ Claude Code 未安装
    echo 💡 请运行: npm install -g @anthropic-ai/claude-code
)
echo.

echo 📝 建议的修复步骤:
echo   1. 确保在 claude-code-now 项目目录中运行脚本
echo   2. 以管理员权限运行 install.bat
echo   3. 如果仍有问题，请提供上述诊断信息
echo.

pause