@echo off
chcp 65001 >nul
REM 🖥 Claude Code Now - Windows 安装脚本

echo.
echo ========================================
echo   🖥 Claude Code Now - Windows 安装
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

REM 检查 Node.js 是否安装
where node >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ 未检测到 Node.js
    echo.
    echo 💡 请先安装 Node.js: https://nodejs.org
    pause
    exit /b 1
)

echo ✅ Node.js 已安装
node --version

REM 检查 npm 是否可用
where npm >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ 未检测到 npm
    pause
    exit /b 1
)

echo ✅ npm 已安装
npm --version

REM 检查 Claude Code 是否已安装
where claude >nul 2>&1
if %errorLevel% equ 0 (
    echo.
    echo ✅ Claude Code 已安装
    claude --version
) else (
    echo.
    echo ⚠️  Claude Code 未安装
    echo 💡 请运行: npm install -g @anthropic-ai/claude-code
    pause
    exit /b 1
)

REM 获取脚本所在目录
set "SCRIPT_DIR=%~dp0"

REM 创建用户脚本目录（如果不存在）
if not exist "%USERPROFILE%\bin" mkdir "%USERPROFILE%\bin"

REM 复制 PowerShell 脚本
echo.
echo 📝 复制启动脚本到 %USERPROFILE%\bin...
copy /Y "%SCRIPT_DIR%claude-code-now.ps1" "%USERPROFILE%\bin\claude-code-now.ps1" >nul

REM 创建批处理包装器，方便从命令行调用
echo @echo off > "%USERPROFILE%\bin\claude-code-now.bat"
echo powershell -ExecutionPolicy Bypass -File "%USERPROFILE%\bin\claude-code-now.ps1" %%* >> "%USERPROFILE%\bin\claude-code-now.bat"

echo ✅ 启动脚本已安装

REM 检查 PATH 中是否包含用户 bin 目录
echo.
echo 📝 检查 PATH 环境变量...
echo %PATH% | findstr /C:"%USERPROFILE%\bin" >nul
if %errorLevel% neq 0 (
    echo.
    echo ⚠️  %USERPROFILE%\bin 不在 PATH 中
    echo.
    echo 💡 请手动添加到 PATH，或者运行以下命令：
    echo.
    echo setx PATH "%%PATH%%;%USERPROFILE%\bin"
    echo.
    echo 添加后需要重启终端才能生效
    pause
) else (
    echo ✅ PATH 已包含用户 bin 目录
)

echo.
echo ========================================
echo   ✅ 基础安装完成！
echo ========================================
echo.
echo 📝 下一步：运行 install-context-menu.bat 安装右键菜单
echo.
pause
