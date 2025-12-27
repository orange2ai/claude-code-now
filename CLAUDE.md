# Claude Code Now - Claude AI Project Instructions

## 🚨 Git工作流程 - 避免错误的正确方法

### ❌ 常见Git错误原因分析

#### 问题1: main分支引用冲突
```
error: src refspec main matches more than one
error: dst refspec main matches more than one
```

**根本原因**：
- 同时存在名为 `main` 的分支和tag
- Git无法区分引用目标

**解决方法**：
```bash
# 删除本地main tag
git tag -d main

# 检查是否还有其他冲突引用
git show-ref
```

#### 问题2: 分支保护规则冲突
```
remote: error: GH013: Repository rule violations found for refs/heads/main
- Changes must be made through a pull request
- Cannot force-push to this branch
```

**根本原因**：
- main分支有保护规则
- 必须通过PR合并，不能直接推送

**正确工作流程**：
```bash
# 1. 在新分支工作
git checkout -b feature/your-feature-name

# 2. 提交改动
git add .
git commit -m "Your commit message"

# 3. 推送分支
git push origin feature/your-feature-name

# 4. 创建PR（通过GitHub CLI或网页）
gh pr create --title "PR Title" --body "PR Description"

# 5. 合并PR
gh pr merge --squash --delete-branch
```

#### 问题3: rebase冲突
```
error: could not apply xxx
CONFLICT (modify/delete): xxx
```

**根本原因**：
- 本地和远程历史分叉
- 试图rebase时产生冲突

**解决方法**：
```bash
# 中止rebase
git rebase --abort

# 或者使用merge方式
git pull origin main --no-rebase
```

---

### ✅ 正确的Git工作流程

#### 场景1: 修改现有功能（小改动）

```bash
# 1. 确保在最新的main分支
git checkout main
git pull origin main

# 2. 创建feature分支
git checkout -b feature/short-description

# 3. 进行修改
# ... 编辑文件 ...

# 4. 提交改动
git add .
git commit -m "✨ Description of changes"

# 5. 推送分支
git push origin feature/short-description

# 6. 创建并合并PR
gh pr create --title "Title" --body "Description"
gh pr merge --squash --delete-branch
```

#### 场景2: 重大更新（新版本Release）

```bash
# 1. 创建release分支
git checkout -b release/v1.7.0

# 2. 进行重大修改
# ... 更新版本号、修改代码等 ...

# 3. 提交所有改动
git add .
git commit -m "🚀 Release v1.7.0 - Major update"

# 4. 推送分支
git push origin release/v1.7.0

# 5. 创建PR详细说明
gh pr create --title "🚀 Release v1.7.0" --body "Detailed release notes"

# 6. 合并前检查清单
# - [ ] 所有文件已提交
# - [ ] 版本号已更新
# - [ ] README已同步更新
# - [ ] 测试通过

# 7. 合并PR
gh pr merge --squash --delete-branch

# 8. 创建GitHub Release
gh release create v1.7.0 --title "v1.7.0" --notes "Release notes"
```

#### 场景3: 紧急hotfix（需要直接修改main）

```bash
# 注意：由于分支保护，还是需要通过PR

# 1. 创建hotfix分支
git checkout -b hotfix/critical-issue

# 2. 快速修复
# ... 修复问题 ...

# 3. 提交并推送
git add .
git commit -m "🐛 Hotfix: Critical issue"
git push origin hotfix/critical-issue

# 4. 加急处理PR
gh pr create --title "🐛 Hotfix" --body "Critical fix"
gh pr merge --squash --delete-branch
```

---

### 🔧 Git常用问题解决速查表

| 错误信息 | 原因 | 解决方法 |
|---------|------|----------|
| `refspec main matches more than one` | 分支和tag同名 | `git tag -d main` |
| `repository rule violations` | 分支保护 | 使用PR合并 |
| `fetch first` | 远程有新提交 | `git pull origin main` |
| `could not apply` | rebase冲突 | `git rebase --abort` |
| `Changes not staged for commit` | 文件未暂存 | `git add .` |
| `nothing to commit` | 无改动 | 检查是否已提交 |

---

### 📋 Git提交前检查清单

#### 每次提交前
- [ ] 确认在正确的分支（feature分支，不是main）
- [ ] 检查`git status`确认改动文件
- [ ] 确认提交信息遵循规范
- [ ] 测试改动是否正常工作

#### 推送前
- [ ] 确认分支名称清晰描述功能
- [ ] 检查是否有敏感信息
- [ ] 确认远程分支存在

#### PR合并前
- [ ] 检查PR描述是否完整
- [ ] 确认没有merge冲突
- [ ] 验证CI/CD是否通过

---

### 🎯 分支命名规范

```
feature/新增功能描述
fix/修复问题描述
hotfix/紧急修复描述
release/vX.X.X
docs/文档更新
refactor/重构描述
```

---

### 🚨 绝对禁止的操作

1. ❌ **永远不要直接修改main分支**
   - 所有改动都要通过feature分支
   - 通过PR合并到main

2. ❌ **永远不要force-push到main**
   - 会丢失历史记录
   - 违反分支保护规则

3. ❌ **不要在tag和分支使用相同名称**
   - 导致引用冲突
   - Git无法区分目标

4. ❌ **不要在pull时使用rebase**
   - 容易产生冲突
   - 使用merge更安全

---

## 🎯 项目核心定位

**The Fastest Claude Code Launcher for macOS & Windows**

产品哲学：**简单 → 专注 → 极致**
- 一个功能：3秒启动Claude Code
- 一个目标：每天节省用户5分钟
- 一个标准：行业最简洁体验

---

## 📋 README 标准结构模板

### 必须包含的10个部分：

#### 1. **价值主张** (最顶部，一行)
- 格式：`**3秒启动Claude Code，每天省5分钟** ⚡`
- 目的：3秒内让用户理解核心价值

#### 2. **用户信任证明** (价值下方)
- 用户数量：`⭐ **400+ GitHub Stars`` （根据实际star数量调整）
- 用户评价或使用感受

#### 3. **问题对比** (Why What Does It Do)
```markdown
**现在的工作流程：** ❌ 打开终端 → 输入命令 → 选择文件夹 → 确认
**使用Claude Code Now：** ✨ 点击图标 → 立即开始工作
```

#### 4. **效果对比表格**
```markdown
| 对比项 | 传统方式 | Claude Code Now |
|--------|----------|------------------|
| 所需时间 | ~35秒 | ~3秒 |
| 操作步骤 | 5-6步 | 1步 |
```

#### 5. **核心特性** (Why It's Special) - **必须在安装步骤前**
- 💡 上下文的重要性
- ⚡ 核心功能列表（3-5个要点）

#### 6. **安装步骤** (30秒完成安装)
- 🔥 Step 1: 醒目下载按钮
- 👆 Step 2: 拖拽安装（带图示）
- ▶️ Step 3: 开始使用

#### 7. **使用说明** (How to Use)
- 📱 不同启动方式
- 📸 使用场景说明

#### 8. **常见问题FAQ** (消除疑虑)
- 安全性问题
- 依赖问题
- 退款/卸载问题
- 至少5个Q&A

#### 9. **高级用户选项** (折叠/后置)
- 命令行安装
- 自定义配置

#### 10. **产品理念** (关于作者前)
- 重复强调：简单 → 专注 → 极致

#### 11. **行动号召CTA** (至少2处)
- 安装前的下载按钮
- 页面底部的"立即开始"

---

## ✅ README 发布前检查清单

### 内容完整性
- [ ] 价值主张是否在第一屏可见？
- [ ] 核心特性是否在安装步骤前？
- [ ] 下载按钮是否醒目（使用🔥 emoji）？
- [ ] FAQ是否覆盖了小白的主要疑虑？
- [ ] 是否有用户评价或社会证明？

### 小白友好度
- [ ] 避免技术术语（CLI、bash、终端等）
- [ ] 是否有可视化步骤说明？
- [ ] 文件大小和下载时间是否标注？
- [ ] 卸载方式是否简单说明？

### 结构逻辑
- [ ] 是否遵循：价值 → 特性 → 安装 → 使用 → FAQ 顺序？
- [ ] 重要内容是否在折叠区域内？（不应该）
- [ ] 重复内容是否已删除？

### 三语言一致性
- [ ] 英文/中文/日文结构是否一致？
- [ ] emoji使用是否统一？
- [ ] 链接是否都有效？

---

## 🎯 产品使用场景

### 目标用户痛点
- ❌ 每次启动Claude Code都要打开终端
- ❌ 需要记忆命令和输入参数
- ❌ 要手动选择工作文件夹
- ❌ 需要确认权限对话框
- ❌ 浪费时间在重复操作上

### Claude Code Now 解决方案
- ✅ 点击即启动，3秒完成
- ✅ 无需记忆任何命令
- ✅ 智能文件夹启动
- ✅ 自动跳过权限确认
- ✅ 每天节省5分钟

---

## 📊 项目数据

### 当前版本
- 版本号：v1.6.0
- 发布日期：2025-12-27
- 文件大小：1.0MB
- 下载时间：~3秒

### 用户统计
- GitHub Stars：实时数据
- 累计下载：查看GitHub Insights
- 活跃用户：待补充

---

## 🚀 Release 流程

### 发布前检查
1. [ ] 更新 `Claude Code Now.app/Contents/Info.plist` 版本号
2. [ ] 更新 `docs/memory.md` 记录本次改动
3. [ ] 检查install.sh脚本是否能正确解析新版本
4. [ ] 创建release package
5. [ ] 生成SHA256校验和
6. [ ] 更新三个README文件（按模板）
7. [ ] 创建GitHub Release

### Release Notes 模板
```markdown
## 🚀 Claude Code Now v{VERSION}

✨ **New Features:**
- 特性1描述
- 特性2描述

🐛 **Bug Fixes:**
- 修复问题1
- 修复问题2

📝 **Documentation:**
- 文档改进

🎯 **Philosophy:** Simple → Focused → Ultimate
```

---

## 🎨 设计原则

### 产品三段论
1. **预测** - 预测用户需求（快速启动）
2. **单点击穿** - 找到一个点（3秒启动）
3. **All-in** - 投入所有资源做到极致

### README 设计原则
- **价值前置** - 核心价值在第一屏
- **信任建立** - 用户数 + 安全承诺
- **行动明确** - 醒目下载按钮
- **疑虑消除** - 全面FAQ覆盖
- **视觉引导** - emoji + 结构化内容

---

## 📝 常见错误 & 预防

### 历史错误记录

#### ❌ 错误1：README结构逻辑混乱
- **问题**：安装步骤在核心特性前
- **原因**：技术思维重于用户思维
- **预防**：强制使用README模板检查清单

#### ❌ 错误2：install.sh URL解析失败
- **问题**：v1.6.0文件名格式变化导致grep模式不匹配
- **原因**：Release文件名从简单模式变更为复杂模式
- **预防**：每次Release后必须测试install.sh

#### ❌ 错误3：遗漏上下文重要性说明
- **问题**：用户不理解为什么需要在不同文件夹启动
- **原因**：默认用户已经了解Claude Code的上下文概念
- **预防**：在README模板中强制要求"上下文重要性"在安装前

#### ❌ 错误4：README重复内容
- **问题**：同一概念在多个section重复
- **原因**：编辑过程中没有全局检查
- **预防**：发布前使用grep检查关键词重复

---

## 🔄 版本发布历史

### v1.6.0 (2025-12-27) - The Renaissance Release
- **重大重构**：移除API Config Switcher，回归核心功能
- **项目结构**：新增macos/、windows/、docs/、archives/分类
- **README革命**：从小白友好视角完全重写
- **安装修复**：修正install.sh的URL解析逻辑

### v1.5.x (历史版本)
- 详见 docs/memory.md

---

## 🎯 未来规划

### 短期 (1个月内)
- [ ] 收集用户反馈
- [ ] 监控下载量和使用情况
- [ ] 优化README转化率

### 中期 (3个月内)  
- [ ] 考虑制作DMG安装包（更小白友好）
- [ ] 添加使用教程截图/GIF
- [ ] 制作30秒安装视频

### 长期 (6个月内)
- [ ] Windows版本优化
- [ ] 可能的插件系统
- [ ] 社区贡献指南

---

## 💬 用户反馈渠道

- **GitHub Issues**: https://github.com/orange2ai/claude-code-now/issues
- **Pull Requests**: 欢迎
- **讨论区**: GitHub Discussions

---

**📌 记住：每次更新README前，先查看本文件！**