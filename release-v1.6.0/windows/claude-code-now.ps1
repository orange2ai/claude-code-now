# Claude Code Now - Launch Claude Code instantly
# PowerShell script to launch Claude Code Now in current directory

# Error handling
$ErrorActionPreference = "Continue"
$LogDir = "$env:USERPROFILE\.claude-code-now-logs"
$LogFile = "$LogDir\claude-code-now-$(Get-Date -Format 'yyyyMMdd-HHmmss').log"

# Create log directory
if (-not (Test-Path $LogDir)) {
    New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
}

# Log function
function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"
    try {
        Add-Content -Path $LogFile -Value $logMessage -ErrorAction SilentlyContinue
    } catch {
        # Ignore log write errors
    }
}

# Check if in debug mode
$IsDebugMode = $args -contains "--debug" -or $args -contains "-d"

try {
    Write-Log -Message "=== Claude Code Now Starting ==="
    Write-Log -Message "Args: $($args -join ' ')"
    Write-Log -Message "Current directory: $PWD"

    # Last directory file
    $LastDirFile = "$env:USERPROFILE\.claude-code-now-last-dir"

    # Filter args to exclude debug flags
    $FilteredArgs = @()
    foreach ($arg in $args) {
        if ($arg -ne "--debug" -and $arg -ne "-d") {
            $FilteredArgs += $arg
        }
    }

    # Determine target directory
    if ($FilteredArgs.Count -gt 0) {
        $TargetDir = $FilteredArgs[0]
        Write-Log -Message "Using arg directory: $TargetDir"
    }
    elseif (Test-Path $LastDirFile) {
        $TargetDir = Get-Content $LastDirFile
        Write-Log -Message "Using last directory: $TargetDir"
    }
    else {
        $TargetDir = $env:USERPROFILE
        Write-Log -Message "Using user home: $TargetDir"
    }

    # Check if directory exists
    if (-not (Test-Path $TargetDir -PathType Container)) {
        $errorMsg = "Error: Directory '$TargetDir' does not exist"
        Write-Host $errorMsg -ForegroundColor Red
        Write-Log -Message $errorMsg -Level "ERROR"
        if ($IsDebugMode) {
            Read-Host "Press Enter to exit..."
        }
        exit 1
    }

    # Change to target directory
    Set-Location $TargetDir
    Write-Log -Message "Changed to directory: $TargetDir"

    Write-Host "Starting Claude Code in '$TargetDir'..." -ForegroundColor Green

    # Find claude command
    $ClaudePath = $null

    # Try to find command directly
    $ClaudeCommand = Get-Command claude -ErrorAction SilentlyContinue
    if ($ClaudeCommand) {
        $ClaudePath = $ClaudeCommand.Source
        Write-Log -Message "Found Claude command: $ClaudePath"
    }
    else {
        Write-Log -Message "Claude command not found, searching common locations..." -Level "WARN"
        # Try common installation paths
        $PossiblePaths = @(
            "$env:APPDATA\npm\claude.cmd",
            "$env:ProgramFiles\nodejs\claude.cmd",
            "$env:LOCALAPPDATA\npm\claude.cmd"
        )

        foreach ($path in $PossiblePaths) {
            if (Test-Path $path) {
                $ClaudePath = $path
                Write-Log -Message "Found Claude: $ClaudePath"
                break
            }
        }
    }

    if (-not $ClaudePath) {
        $errorMsg = "Error: Claude Code is not installed or not in PATH"
        Write-Host $errorMsg -ForegroundColor Red
        Write-Host ""
        Write-Host "Please ensure Claude Code CLI is installed" -ForegroundColor Yellow
        Write-Host "Try running: npm install -g @anthropic-ai/claude-code" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Common installation locations:" -ForegroundColor Cyan
        Write-Host "   - $env:APPDATA\npm\claude.cmd"
        Write-Host "   - $env:ProgramFiles\nodejs\claude.cmd"
        Write-Host "   - $env:LOCALAPPDATA\npm\claude.cmd"
        Write-Log -Message $errorMsg -Level "ERROR"
        Write-Log -Message "Log file: $LogFile" -Level "ERROR"

        if ($IsDebugMode) {
            Write-Host ""
            Write-Host "Log file: $LogFile" -ForegroundColor Cyan
            Read-Host "Press Enter to exit..."
        }
        exit 1
    }

    Write-Host "Found Claude Code: $ClaudePath" -ForegroundColor Green
    Write-Log -Message "Claude path: $ClaudePath"

    # Save current directory for next time
    $TargetDir | Out-File -FilePath $LastDirFile -Encoding utf8
    Write-Log -Message "Saved directory to: $LastDirFile"

    # Verify Claude path security
    if ($ClaudePath -match "claude(\.exe|\.cmd|\.ps1)?$") {
        Write-Host "Security check passed, starting Claude Code..." -ForegroundColor Green
        Write-Log -Message "Starting Claude Code..."

        # Start Claude Code
        & $ClaudePath --permission-mode bypassPermissions
        $exitCode = $LASTEXITCODE

        Write-Log -Message "Claude Code exited, code: $exitCode"

        if ($exitCode -ne 0 -and $IsDebugMode) {
            Write-Host ""
            Write-Host "Claude Code exited abnormally (code: $exitCode)" -ForegroundColor Yellow
            Write-Host "Log file: $LogFile" -ForegroundColor Cyan
            Read-Host "Press Enter to exit..."
        }

        exit $exitCode
    }
    else {
        $errorMsg = "Security check failed: Invalid Claude path detected"
        Write-Host $errorMsg -ForegroundColor Red
        Write-Host "Current path: $ClaudePath" -ForegroundColor Yellow
        Write-Host "For security reasons, execution denied" -ForegroundColor Yellow
        Write-Log -Message "$errorMsg, path: $ClaudePath" -Level "ERROR"

        if ($IsDebugMode) {
            Write-Host "Log file: $LogFile" -ForegroundColor Cyan
            Read-Host "Press Enter to exit..."
        }
        exit 1
    }
}
catch {
    $errorMsg = "Unexpected error: $($_.Exception.Message)"
    Write-Host $errorMsg -ForegroundColor Red
    Write-Host ""
    Write-Host "Error details: $($_.Exception.GetType().FullName)" -ForegroundColor Yellow
    Write-Host "Location: $($_.InvocationInfo.ScriptLineNumber):$($_.InvocationInfo.OffsetInLine)" -ForegroundColor Yellow
    Write-Log -Message "$errorMsg`nStack: $($_.ScriptStackTrace)" -Level "ERROR"
    Write-Log -Message "Log file: $LogFile" -Level "ERROR"

    if ($IsDebugMode) {
        Write-Host ""
        Write-Host "Full log file: $LogFile" -ForegroundColor Cyan
        Write-Host "Use --debug flag to see detailed information" -ForegroundColor Cyan
        Read-Host "Press Enter to exit..."
    }
    exit 1
}
