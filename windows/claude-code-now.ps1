# 🖥 Claude Code Now - 即时启动，无需确认
# PowerShell script to launch Claude Code Now in current directory

# --- 1. 确定工作目录 ---
# 保存上次目录的配置文件
$LastDirFile = "$env:USERPROFILE\.claude-code-now-last-dir"

# 优先级 1: 如果用户通过右键菜单提供了参数，直接使用
if ($args.Count -gt 0) {
    $TargetDir = $args[0]
}
# 优先级 2: 尝试读取上次工作的目录
elseif (Test-Path $LastDirFile) {
    $TargetDir = Get-Content $LastDirFile
}
# 优先级 3: 默认回退到用户主目录
else {
    $TargetDir = $env:USERPROFILE
}

# 检查目录是否存在，不存在则报错
if (-not (Test-Path $TargetDir -PathType Container)) {
    Write-Host "❌ 错误: 目录 '$TargetDir' 不存在" -ForegroundColor Red
    exit 1
}

# 切换到目标目录
Set-Location $TargetDir
Write-Host "🖥 在目录 '$TargetDir' 启动 Claude Code..." -ForegroundColor Green

# --- 2. 寻找 Claude 可执行文件 (混合策略) ---
$ClaudePath = $null

# 策略 A: 硬编码优先路径
$PossiblePaths = @(
    # 优先：PowerShell 脚本版本
    "$env:APPDATA\npm\claude.ps1",
    "$env:LOCALAPPDATA\npm\claude.ps1",
    "$env:ProgramFiles\nodejs\claude.ps1",
    
    # 次选：CMD 批处理版本
    "$env:APPDATA\npm\claude.cmd",
    "$env:LOCALAPPDATA\npm\claude.cmd",
    "$env:ProgramFiles\nodejs\claude.cmd"
)

Write-Host "🔍 正在搜索 Claude Code 安装路径..." -ForegroundColor DarkGray

foreach ($path in $PossiblePaths) {
    if (Test-Path $path) {
        $ClaudePath = $path
        Write-Host "✅ 在常用位置找到: $path" -ForegroundColor DarkGray
        break
    }
}

# 策略 B: 系统环境搜索
if (-not $ClaudePath) {
    Write-Host "⚠️ 常用位置未找到，尝试系统全局搜索..." -ForegroundColor DarkGray
    $ClaudeCommand = Get-Command claude -ErrorAction SilentlyContinue
    
    if ($ClaudeCommand) {
        $ClaudePath = $ClaudeCommand.Source
        Write-Host "✅ 通过系统 PATH 找到: $ClaudePath" -ForegroundColor DarkGray
    }
}

# --- 3. 最终检查与执行 ---
if (-not $ClaudePath) {
    Write-Host "❌ 致命错误: 未找到 Claude Code" -ForegroundColor Red
    Write-Host ""
    Write-Host "💡 解决方案：" -ForegroundColor Yellow
    Write-Host "   请运行: npm install -g @anthropic-ai/claude-code"
    exit 1
}

# 保存当前目录，供下次使用
$TargetDir | Out-File -FilePath $LastDirFile -Encoding utf8

# 安全验证与启动
# 正则说明：允许 .exe, .cmd, .ps1 或无后缀文件
if ($ClaudePath -match "claude(\.exe|\.cmd|\.ps1)?$") {
    Write-Host "🚀 正在启动..." -ForegroundColor Green
    Write-Host "----------------------------------------"
    
    # 使用调用操作符 & 直接在当前窗口运行，保持交互性
    & $ClaudePath --permission-mode bypassPermissions
    
} else {
    Write-Host "❌ 安全验证失败: 路径看起来不像 Claude" -ForegroundColor Red
    Write-Host "🔍 路径: $ClaudePath" -ForegroundColor Yellow
    exit 1
}