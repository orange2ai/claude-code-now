# 🚀 Claude Code Now 发布流程规范

## 🎯 目标：零遗漏的完美发布

> 避免"本地完成但GitHub未更新"的问题，确保每次发布都完整无遗漏。

## ✅ 发布前检查清单

### 📝 1. 开发完成检查
- [ ] 所有功能开发完成
- [ ] 本地测试通过
- [ ] 文档更新完成（README.md, README.zh.md, README.ja.md）
- [ ] memory.md 记录更新

### 🔍 2. 代码质量检查
- [ ] `git status` 确认所有文件已暂存
- [ ] `git log --oneline -5` 查看提交历史
- [ ] 提交信息规范且描述清晰
- [ ] 没有敏感信息或临时文件

### 🌐 3. GitHub 同步检查 ⚠️ **关键**
- [ ] `git push origin main` 成功推送
- [ ] 或通过 PR 方式推送到主分支
- [ ] **验证 GitHub 网页端已显示更新**
- [ ] 确认所有分支都已推送

### 🏷️ 4. 版本标签管理
- [ ] 创建版本标签：`git tag v1.x.x`
- [ ] 推送标签：`git push origin --tags`
- [ ] 确认 GitHub Tags 页面显示新标签

### 📦 5. GitHub Release 创建
- [ ] 使用 `gh release create` 创建发布
- [ ] Release 标题格式正确
- [ ] Release 说明详细且有价值
- [ ] 设置为 `--latest` 最新版本

### 🔄 6. 最终验证 ⚠️ **关键**
- [ ] **GitHub 仓库主页显示最新 README**
- [ ] **GitHub Releases 页面显示新版本**
- [ ] **所有语言的 README 都已更新**
- [ ] 一键安装脚本指向正确版本

## 🚨 常见遗漏点

### ❌ 最容易遗漏的问题
1. **本地提交但未推送** - 导致 GitHub 不显示更新
2. **分支保护规则** - 导致直接推送失败，需要 PR
3. **标签未推送** - 导致 Release 创建失败
4. **文档更新不同步** - 某个语言版本未更新

### ✅ 防遗漏检查口诀
**"本地→远程→验证→发布→确认"**

## 📋 标准发布流程

### 第一阶段：本地准备
```bash
# 1. 检查状态
git status
git log --oneline -5

# 2. 暂存所有更改
git add -A

# 3. 创建提交
git commit -m "🎯 [TYPE]: Description

详细说明
- 改动1
- 改动2

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-Authored-By: Claude <noreply@anthropic.com>"
```

### 第二阶段：推送到 GitHub
```bash
# 方法1：直接推送（如果允许）
git push origin main --tags

# 方法2：PR方式（推荐）
git checkout -b feature-branch-name
git push origin feature-branch-name
gh pr create --title "标题" --body "详细说明"
gh pr merge [PR-NUMBER] --squash --delete-branch
```

### 第三阶段：创建版本
```bash
# 1. 创建标签
git tag v1.x.x

# 2. 推送标签
git push origin v1.x.x

# 3. 创建 Release
gh release create v1.x.x --title "标题" --notes "详细说明" --latest
```

### 第四阶段：验证确认 ⚠️ **必须**
1. **打开 GitHub 仓库主页** - 确认 README 显示最新内容
2. **检查 Releases 页面** - 确认新版本已发布
3. **测试一键安装** - 确认脚本正常工作
4. **检查所有语言文档** - 确认多语言一致性

## 🔧 自动化检查脚本

### 发布前检查脚本
```bash
#!/bin/bash
# pre-release-check.sh

echo "🔍 发布前检查..."

# 检查是否有未提交的更改
if [[ -n $(git status --porcelain) ]]; then
    echo "❌ 有未提交的更改"
    git status
    exit 1
fi

# 检查是否与远程同步
if [[ $(git rev-list --count HEAD ^origin/main) -gt 0 ]]; then
    echo "⚠️  本地领先远程 $(git rev-list --count HEAD ^origin/main) 个提交"
    echo "需要推送到远程"
fi

# 检查 README 文件是否存在
required_files=("README.md" "README.zh.md" "README.ja.md")
for file in "${required_files[@]}"; do
    if [[ ! -f "$file" ]]; then
        echo "❌ 缺少文件: $file"
        exit 1
    fi
done

echo "✅ 检查通过"
```

### 发布后验证脚本
```bash
#!/bin/bash
# post-release-verify.sh

echo "🔍 发布后验证..."

# 检查 GitHub API 确认 README 更新
echo "正在检查 GitHub README..."
curl -s "https://api.github.com/repos/orange2ai/claude-code-now/readme" | grep -q "Context" && echo "✅ README 已更新" || echo "❌ README 未更新"

# 检查最新 Release
echo "正在检查最新 Release..."
latest_tag=$(curl -s "https://api.github.com/repos/orange2ai/claude-code-now/releases/latest" | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4)
echo "最新版本: $latest_tag"

echo "✅ 验证完成"
```

## 📊 发布质量指标

### 成功发布的标准
- [ ] GitHub 主页立即显示最新内容
- [ ] 所有用户能看到更新后的文档
- [ ] 新版本在 Releases 页面可见
- [ ] 一键安装脚本正常工作

### 失败发布的特征
- ❌ 本地有更新但 GitHub 显示旧内容
- ❌ 版本号不匹配
- ❌ 某个语言的文档未更新
- ❌ 用户反馈看不到更新

## 🎯 改进建议

### 工作流优化
1. **永远先验证 GitHub 再宣布完成**
2. **使用 PR 工作流避免推送问题**
3. **建立发布检查习惯**
4. **自动化验证脚本**

### 团队协作
1. **发布责任人制度**
2. **发布后验证义务**
3. **问题快速修复流程**

## 💡 记住：产品的"简单"哲学也适用于发布流程

**简单且可靠的发布流程：**
- 开发 → 推送 → 验证 → 发布 → 确认
- 每一步都要确认成功再进行下一步
- 永远不跳过验证环节

---

**遵循这个规范，确保每次发布都完美无缺！** 🎯