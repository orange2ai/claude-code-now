#!/bin/bash

# Claude Code Now v1.5.0 发布脚本
# 作者: orange

echo "🚀 Claude Code Now v1.5.0 发布准备脚本"
echo "========================================="
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# 版本信息
VERSION="1.5.0"
RELEASE_NAME="Claude.Code.Now.v1.5.0"

echo -e "${BLUE}📋 发布检查清单:${NC}"
echo ""

# 检查文件完整性
echo "🔍 检查文件完整性..."

required_files=(
    "README.md"
    "README.zh.md" 
    "README.ja.md"
    "RELEASE_NOTES_v1.5.0.md"
    "config-switcher/Claude Config Switcher.app"
    "config-switcher/keys.template"
    "config-switcher/启动应用.sh"
    "memory.md"
)

all_files_exist=true
for file in "${required_files[@]}"; do
    if [[ -f "$file" || -d "$file" ]]; then
        echo -e "✅ $file"
    else
        echo -e "${RED}❌ $file (缺失)${NC}"
        all_files_exist=false
    fi
done

if [[ "$all_files_exist" == false ]]; then
    echo -e "${RED}❌ 文件检查失败，请先确保所有文件都存在${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}✅ 所有必需文件检查通过${NC}"

# 检查应用版本号
echo ""
echo "🔍 检查应用版本号..."

app_version=$(plutil -extract CFBundleShortVersionString raw "config-switcher/Claude Config Switcher.app/Contents/Info.plist" 2>/dev/null)
if [[ "$app_version" == "$VERSION" ]]; then
    echo -e "${GREEN}✅ 应用版本号正确: $app_version${NC}"
else
    echo -e "${RED}❌ 应用版本号不匹配: 期望 $VERSION, 实际 $app_version${NC}"
    exit 1
fi

# 创建发布包
echo ""
echo "📦 创建发布包..."

release_dir="release-$VERSION"
mkdir -p "$release_dir"

echo "📋 复制文件到发布目录..."

# 复制主要文件
cp -r "config-switcher" "$release_dir/"
cp "README.md" "$release_dir/"
cp "README.zh.md" "$release_dir/"
cp "README.ja.md" "$release_dir/"
cp "RELEASE_NOTES_v1.5.0.md" "$release_dir/"

# 复制主应用（如果存在）
if [[ -d "Claude Code Now.app" ]]; then
    cp -r "Claude Code Now.app" "$release_dir/"
fi

# 复制脚本文件
cp "claude-code-now.sh" "$release_dir/" 2>/dev/null || true
cp "claude-code-now.rb" "$release_dir/" 2>/dev/null || true

echo -e "${GREEN}✅ 文件复制完成${NC}"

# 创建zip包
echo ""
echo "🗜️ 创建压缩包..."

zip_name="${RELEASE_NAME}.macOS.zip"
cd "$release_dir"
zip -r "../$zip_name" . > /dev/null
cd ..

echo -e "${GREEN}✅ 压缩包创建完成: $zip_name${NC}"

# 计算文件大小
zip_size=$(du -h "$zip_name" | cut -f1)
echo "📊 包大小: $zip_size"

# 创建校验和
echo ""
echo "🔐 创建校验和..."
sha256sum "$zip_name" > "${zip_name}.sha256"
echo -e "${GREEN}✅ SHA256校验和已创建${NC}"

# 显示发布摘要
echo ""
echo "🎉 发布准备完成！"
echo ""
echo -e "${BLUE}📦 发布文件:${NC}"
echo "  📁 $release_dir/    - 发布目录"
echo "  📦 $zip_name       - 主要发布包"
echo "  🔐 ${zip_name}.sha256 - 校验和文件"
echo ""
echo -e "${BLUE}📋 发布内容:${NC}"
echo "  ✅ Claude Config Switcher macOS app"
echo "  ✅ 多语言README文档"
echo "  ✅ 详细发布说明"
echo "  ✅ 安全密钥模板"
echo "  ✅ 备用启动脚本"
echo ""
echo -e "${YELLOW}🚀 下一步操作:${NC}"
echo "  1. 测试 $zip_name 确保正常工作"
echo "  2. 在GitHub创建新release: v$VERSION"
echo "  3. 上传 $zip_name 到release"
echo "  4. 复制RELEASE_NOTES_v1.5.0.md内容到release描述"
echo "  5. 发布！🎉"
echo ""
echo -e "${GREEN}🎊 恭喜！Claude Code Now v$VERSION 准备发布！${NC}"