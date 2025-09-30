# Claude Code Now Project Memory

## Core Positioning
The fastest Claude Code launcher on macOS - focus on one-click launch, achieve ultimate simplicity

## Technical Architecture
- `Claude Code Now.app/Contents/MacOS/ClaudeCodeLauncher` - Main launch script (AppleScript + Bash)
- `claude-code-now.sh` - Command-line version
- `claude-code-now.rb` - Homebrew Formula
- `CNAME` - GitHub Pages domain config (claudecodenow.com)

## Important Decisions & Lessons

### PATH Detection Strategy
- Cannot rely solely on `command -v`, must traverse common installation locations
- Common paths: `~/.npm-global/bin`, `~/.npm/bin`, `~/.local/bin`, `/usr/local/bin`, `/opt/homebrew/bin`
- Users' Node.js installation methods vary (nvm, npm, brew), need full coverage

### Release Publishing
- ⚠️ **Important**: Must upload compiled `.zip` file with each release
- v1.0.0 - v1.2.0 only published source code, poor user experience
- v1.2.1 onwards upload App.zip, users download and use immediately

### Homebrew Formula Updates
- Need to sync update `claude-code-now.rb` with each new version
- Update version number + calculate new sha256: `curl -sL "https://github.com/orange2ai/claude-code-now/archive/vX.X.X.tar.gz" | shasum -a 256`

## Version Changelog

### v1.2.1 (2024-09-30) - CLI Path Detection Enhancement
- Extended PATH search: added `~/.npm/bin`, `~/.local/bin`, `/usr/local/share/npm/bin`
- Smart traversal of common install locations, find even if PATH not configured
- Optimized error messages with diagnostic suggestions
- First time uploading App.zip to Release, users download and use immediately

### v1.2.0 (2024-09-30) - Claude Code 2.0 Adaptation
- Upgraded launch command: `claude code now` → `claude`
- Fixed Dock launch path issue (no longer jumps to desktop)
- Added `--permission-mode bypassPermissions` for zero-confirmation launch
- Three-level path selection: drag path → Finder path → default path

### v1.1.0 and Earlier
- Basic features: Dock launch, drag launch, toolbar integration
- Chinese/English docs, GitHub Pages, custom domain