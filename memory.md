# Claude Code Now Project Memory

## Core Positioning
The fastest Claude Code launcher on macOS - focus on one-click launch, achieve ultimate simplicity

## Technical Architecture
- `Claude Code Now.app/Contents/MacOS/ClaudeCodeLauncher` - Main launch script (AppleScript + Bash)
- `claude-code-now.sh` - Command-line version
- `claude-code-now.rb` - Homebrew Formula
- `CNAME` - GitHub Pages domain config (claudecodenow.com)

## Important Decisions & Lessons

### Internationalization Principle
- **English as default**: All documentation (README.md, memory.md) use English as default language
- **Multilingual support**: Provide Chinese (README.zh.md) and Japanese (README.ja.md) versions
- **Commit messages**: Always write in English for global collaboration
- **Rationale**: Project targets global users, not just Chinese users

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

### v1.4.0 (2025-10-16) - Windows Support Integration
- **Major Feature**: Merged Windows support from `windows` branch into main
- **Cross-Platform**: Now supports both macOS and Windows with unified experience
- **Windows Features**:
  - PowerShell launcher script (`claude-code-now.ps1`)
  - Automated installation script (`install.bat`)
  - Right-click context menu integration (`install-context-menu.bat`)
  - Easy uninstallation (`uninstall-context-menu.bat`)
  - PATH detection for Windows Node.js installations
- **Documentation**: Updated README.md with comprehensive Windows installation guide
- **Compatibility**: Maintains all existing macOS functionality
- **Files Added**: 
  - `claude-code-now.ps1` (Windows PowerShell launcher)
  - `install.bat` (Windows installation script)
  - `install-context-menu.bat` (Right-click menu installer)
  - `uninstall-context-menu.bat` (Right-click menu uninstaller)

### v1.3.1 (2025-10-16) - Terminal Configuration Support
- **Feature**: Added configurable terminal application support
- **Issue**: Users reported iTerm2 not being used despite being installed
- **Solution**: Enhanced terminal detection with user preference configuration
- **New Features**:
  - User configurable terminal preference via `~/.claude-code-now-terminal` config file
  - Support for iTerm2, Warp, Alacritty, and Terminal
  - Improved detection logic for modern iTerm2 installations
  - Configuration tool: `set-terminal.sh` for easy terminal preference setup
- **Detection Priority**: User preference → iTerm2 → Warp → Terminal (fallback)
- **Files Modified**: 
  - `Claude Code Now.app/Contents/MacOS/ClaudeCodeLauncher` (lines 54-224)
  - Added: `set-terminal.sh` (terminal configuration utility)
- **Usage**: Run `./set-terminal.sh` to configure preferred terminal

### v1.3.0 (2025-10-11) - Dynamic Node.js Detection
- **PR #5**: Merged from lemon-codehub/feature/dynamic-nvm-detection
- **Core Change**: Replace hardcoded Node.js path (v22.17.1) with intelligent dynamic detection
- **Detection Priority**:
  1. Current active nvm version (`nvm current`)
  2. Default nvm alias version (`nvm alias default`)
  3. Latest installed version (auto-detect from `~/.nvm/versions/node/`)
- **Benefits**: Zero configuration, auto-adapts to user's Node.js version
- **Compatibility**: Works with both nvm and non-nvm environments
- **File Modified**: `Claude Code Now.app/Contents/MacOS/ClaudeCodeLauncher` (lines 17-52)
- **Homebrew Formula**: Updated to v1.3.0 with new sha256

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

## GitHub Repository Settings

### Branch Protection (2025-10-11)
- **Repository**: orange2ai/claude-code-now
- **Ruleset Name**: high
- **Protected Branch**: main
- **Status**: Active
- **Rules Configured**:
  - Require pull request before merging (no direct push to main)
  - Block force pushes (prevent git push --force)
  - Prevent branch deletion (cannot delete main branch)
- **View**: https://github.com/orange2ai/claude-code-now/rules/8809548
- **Purpose**: Protect main branch from accidental damage, ensure code review process