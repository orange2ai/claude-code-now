# 🖥 Claude Code Now - 即时启动，无需确认
# PowerShell script to launch Claude Code Now in current directory

# 保存上次目录的配置文件
$LastDirFile = "$env:USERPROFILE\.claude-code-now-last-dir"

# 如果用户提供了参数，使用参数
if ($args.Count -gt 0) {
    $TargetDir = $args[0]
}
# 否则尝试读取上次的目录
elseif (Test-Path $LastDirFile) {
    $TargetDir = Get-Content $LastDirFile
}
# 都没有则使用用户主目录
else {
    $TargetDir = $env:USERPROFILE
}

# 检查目录是否存在
if (-not (Test-Path $TargetDir -PathType Container)) {
    Write-Host "❌ 错误: 目录 '$TargetDir' 不存在" -ForegroundColor Red
    exit 1
}

# 切换到目标目录
Set-Location $TargetDir

Write-Host "🖥 在目录 '$TargetDir' 启动 Claude Code Now..." -ForegroundColor Green

# 查找 claude 命令
$ClaudePath = $null

# 尝试直接查找命令
$ClaudeCommand = Get-Command claude -ErrorAction SilentlyContinue
if ($ClaudeCommand) {
    $ClaudePath = $ClaudeCommand.Source
}
else {
    # 尝试常见的安装位置
    $PossiblePaths = @(
        "$env:APPDATA\npm\claude.cmd",
        "$env:ProgramFiles\nodejs\claude.cmd",
        "$env:LOCALAPPDATA\npm\claude.cmd"
    )

    foreach ($path in $PossiblePaths) {
        if (Test-Path $path) {
            $ClaudePath = $path
            break
        }
    }
}

if (-not $ClaudePath) {
    Write-Host "❌ 错误: Claude Code 未安装或不在 PATH 中" -ForegroundColor Red
    Write-Host ""
    Write-Host "💡 请确保已安装 Claude Code CLI" -ForegroundColor Yellow
    Write-Host "💡 提示：请尝试运行 'npm install -g @anthropic-ai/claude-code'" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "📝 常见安装位置：" -ForegroundColor Cyan
    Write-Host "   - $env:APPDATA\npm\claude.cmd"
    Write-Host "   - $env:ProgramFiles\nodejs\claude.cmd"
    Write-Host "   - $env:LOCALAPPDATA\npm\claude.cmd"
    exit 1
}

Write-Host "✅ 找到 Claude Code: $ClaudePath" -ForegroundColor Green

# 保存当前目录，供下次使用
$TargetDir | Out-File -FilePath $LastDirFile -Encoding utf8

# 验证 Claude 路径安全性
if ($ClaudePath -match "claude(\.exe|\.cmd)?$") {
    Write-Host "🔒 安全验证通过，启动 Claude Code..." -ForegroundColor Green
    & $ClaudePath --permission-mode bypassPermissions
} else {
    Write-Host "❌ 安全验证失败: 检测到无效的 Claude 路径" -ForegroundColor Red
    Write-Host "🔍 当前路径: $ClaudePath" -ForegroundColor Yellow
    Write-Host "⚠️  为了安全起见，拒绝执行该路径" -ForegroundColor Yellow
    exit 1
}
