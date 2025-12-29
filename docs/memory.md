# Claude Code Now Project Memory

## Core Positioning
The fastest Claude Code launcher on macOS - focus on one-click launch, achieve ultimate simplicity

## Technical Architecture
- `Claude Code Now.app/Contents/MacOS/ClaudeCodeLauncher` - Main launch script (AppleScript + Bash)
- `macos/claude-code-now.sh` - Command-line version
- `macos/set-terminal.sh` - Terminal configuration tool
- `windows/` - Windows-specific scripts
- `docs/` - Documentation and project memory
- `archives/` - Historical release versions
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

### v1.5.0 (2025-10-19) - API Configuration Switcher
- **Major Feature**: Added complete API configuration switcher tool
- **New Components**:
  - `config-switcher/Claude Config Switcher.app` - Native macOS application
  - `config-switcher/claude-config-switcher.sh` - Shell script for CLI usage
  - `config-switcher/keys.template` - Secure API key template
  - `config-switcher/launch-app.sh` - Backup launcher utility
- **Core Functionality**:
  - Support for Zhipu AI (GLM), Anthropic Official, Custom APIs
  - Automatic API key management with local storage
  - First-time setup wizard with guided configuration
  - Secure template system with `.gitignore` protection
- **Technical Implementation**:
  - Solved macOS bash compatibility (removed associative arrays)
  - Implemented AppleScript integration for Terminal launching
  - Created intelligent key detection and validation
  - Added multi-launch support with fallback mechanisms
- **User Experience**:
  - Professional macOS app with custom icon
  - One-click API configuration switching
  - Colorful terminal output with clear status indicators
  - Comprehensive setup wizard for first-time users
- **Security Features**:
  - Local-only key storage (never uploaded)
  - Template-based system for open-source safety
  - Automatic backup of existing configurations
  - Input validation with masked key display
- **Documentation Updates**:
  - Updated all README files (EN, ZH, JA) with config switcher section
  - Created detailed troubleshooting guide
  - Added comprehensive installation instructions
  - Enhanced project structure documentation
- **Release Preparation**:
  - Version bump to 1.5.0 across all components
  - Created `RELEASE_NOTES_v1.5.0.md` with detailed changelog
  - Organized clean project structure for distribution
  - Automated release script with validation
- **Product Philosophy Achievement**:
  - **Simple**: Evolved from complex multi-file tools to single .app solution
  - **Focused**: Dedicated to solving API configuration switching pain point
  - **Ultimate**: One-click switch, 3-step configuration process
- **Market Impact**:
  - China users: Stable Zhipu AI access without manual configuration
  - Developers: Rapid switching between different API services
  - Enterprise users: Secure key management for teams
  - Open source community: Safe code sharing without exposing secrets

### v1.5.5 (2025-12-27) - Focus Strategy: Back to Core
- **Major Decision**: Complete removal of config-switcher functionality
- **Strategic Pivot**: Return to core value proposition - "Fastest Claude Code Launcher"
- **Product Philosophy Achievement**:
  - **Simple**: Removed 885 lines of non-core code (entire config-switcher directory)
  - **Focused**: 100% focus on one-click launch experience
  - **Ultimate**: Do one thing exceptionally well
- **Rationale**: 
  - Config switching is a separate problem space
  - Users can manage API configs through Claude Code's native settings
  - Maintaining config tools diluted the launcher's focus
- **Deleted Components**:
  - Entire `config-switcher/` directory (885 lines)
  - GUI app `Claude Config Switcher.app`
  - Preset templates and configuration scripts
  - All related documentation in READMEs
- **Core Value**: Speed + Simplicity - launch Claude Code instantly, anywhere

### v1.5.6 (2025-12-27) - Project Structure Organization
- **Major Refactoring**: Complete reorganization of project file structure
- **New Folder Structure**:
  - `macos/` - macOS-specific scripts and tools
  - `windows/` - Windows-specific scripts and tools
  - `docs/` - All documentation and project memory
  - `archives/` - Historical release versions
- **Benefits**:
  - Clear separation of platform-specific code
  - Easier navigation and maintenance
  - Better organization for contributors
  - Root directory now only contains essential files
- **Files Moved**:
  - 5 Windows files → `windows/` directory
  - 2 macOS scripts → `macos/` directory
  - 5 documentation files → `docs/` directory
  - 5 archive files → `archives/` directory
- **Updated References**:
  - README.md project structure section
  - memory.md technical architecture
  - All installation scripts remain functional

### v1.6.1 (2025-12-27) - Documentation Principles & Workflow Guide 📝
- **Major Achievement**: CLAUDE.md transformation from operations manual to principles-based guide
- **Strategic Shift**: Abstract principles over step-by-step procedures
- **Complete Documentation Overhaul**:
  - CLAUDE.md now contains decision frameworks and mental models
  - Comprehensive Git workflow guide to prevent 90% of common errors
  - README redesign with user psychology principles applied
  - All three languages (EN/ZH/JA) updated consistently
- **Git Workflow Improvements**:
  - Documented correct mental models for branch protection
  - Clear decision trees for common scenarios
  - Pre-commit checklist to prevent errors
  - Absolute prohibitions list to avoid dangerous operations
- **README Structure Enhancement**:
  - Added "Why It's Special" section before installation
  - Context explanation moved to front of user journey
  - Core features listed early for better value proposition
  - Improved logical flow based on user psychology
- **Technical Fixes**:
  - install.sh URL parsing updated for v1.6.0 release format
  - Merged conflicting branches successfully
  - Resolved Git workflow complexities
- **Pull Request**: #36 - Successfully merged
- **Philosophy Achievement**:
  - External memory system established
  - Decision frameworks for future development
  - Clear principles to guide project evolution
  - Reduced cognitive load for decision making

### v1.6.0 (2025-12-28) - The Renaissance Release 🚀
- **Major Version Update**: 1.2.2 → 1.6.0 (Significant architectural changes)
- **Strategic Pivot**: Complete return to core value - "Fastest Claude Code Launcher"
- **Release Highlights**:
  - Published to GitHub as official release
  - Complete project restructuring
  - 70% documentation reduction across all languages
  - Professional release package with SHA256 checksums
- **Release Statistics**:
  - Package size: 1.0MB
  - Files changed: 25
  - Lines added: 2,407
  - Release URL: https://github.com/orange2ai/claude-code-now/releases/tag/v1.6.0
  - Pull Request: #32
- **Marketing Achievement**:
  - Clear value proposition restored
  - Professional project structure
  - Enhanced user experience
  - Improved maintainability
- **Product Philosophy Perfection**:
  - **Simple**: From complex multi-tool to focused launcher
  - **Focused**: 100% dedication to one function
  - **Ultimate**: Industry-leading simplicity and speed
- **Community Impact**:
  - Easier onboarding for new users
  - Clearer documentation
  - Better contribution structure
  - Professional open-source standards
### v1.6.2+ (2025-12-29) - Smart Terminal Selection Feature 💡
- **New Feature**: First-launch terminal preference selection
- **User Request**: Users wanted to choose their preferred terminal when multiple are available
- **Implementation**:
  - **Automatic Detection**: On first launch, if multiple terminals detected, show selection dialog
  - **Smart Logic**:
    - Check if `~/.claude-code-now-terminal` config exists
    - If not, count available terminals (iTerm2, Warp, Alacritty, Terminal)
    - If ≥2 terminals available, display native macOS dialog
    - Save user preference to config file for future launches
    - If only 1 terminal, use it silently (no dialog)
  - **Graceful Degradation**: If user cancels dialog, fall back to default priority (iTerm2 > Warp > Terminal)
- **New Functions Added**:
  - `count_available_terminals()` - Count installed terminal apps
  - `show_first_time_terminal_selection()` - Display dialog and save preference
- **User Experience Improvements**:
  - No setup required for new users - works out of the box
  - Preference remembered once selected
  - Can still manually configure via `macos/set-terminal.sh`
  - Native macOS UI for familiar experience
- **Supported Terminals**: iTerm2, Warp, Alacritty, Terminal (system default)
- **Documentation Updates**:
  - All three READMEs (EN/ZH/JA) updated with "Smart Terminal Selection" section
  - Added explanation of first-launch behavior
  - Included link to `set-terminal.sh` for manual configuration
- **Files Modified**:
  - `Claude Code Now.app/Contents/MacOS/ClaudeCodeLauncher` (lines 203-292)
  - `README.md` - Added Smart Terminal Selection section
  - `README.zh.md` - Added 智能终端选择 section
  - `README.ja.md` - Added スマート端末選択 section
  - Added `test-terminal-selection.sh` for testing
- **Product Philosophy Achievement**:
  - **Simple**: No configuration needed for most users
  - **Thoughtful**: Anticipates user needs and provides choice
  - **Respectful**: Remembers user preference, doesn't ask again
