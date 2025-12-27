#!/bin/bash

# 推送README优化更新到GitHub的脚本
echo "🚀 准备推送README优化更新..."

# 检查网络连接
if curl -Is https://github.com | head -n 1 | grep -q "200 OK"; then
    echo "✅ 网络连接正常"
    
    # 强制推送更新（因为分支保护可能需要PR）
    echo "📤 推送到远程仓库..."
    git push origin main --force-with-lease
    
    if [ $? -eq 0 ]; then
        echo "✅ 推送成功！"
        echo "🌐 请检查GitHub仓库：https://github.com/orange2ai/claude-code-now"
    else
        echo "❌ 推送失败，可能需要通过PR方式："
        echo "1. git checkout -b readme-update-$(date +%s)"
        echo "2. git push origin readme-update-$(date +%s)"
        echo "3. gh pr create --title 'README优化更新' --body '完成Star引导和ListenHub.AI推广'"
        echo "4. gh pr merge [PR_NUMBER] --squash --delete-branch"
    fi
else
    echo "❌ 网络连接失败，请稍后重试"
    echo "📝 本地更改已完成，包括："
    echo "   - ⭐ 早期Star引导位置优化"
    echo "   - 🎧 ListenHub.AI作者部分推广"
    echo "   - 📝 多语言版本一致性更新"
fi