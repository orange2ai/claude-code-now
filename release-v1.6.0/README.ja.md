# 🖥 Claude Code Now

[English](README.md) | [中文](README.zh.md) | **日本語**

**世界最速の Claude Code 起動ツール**

ワンクリックで Claude Code を起動。ターミナル不要、権限確認不要、ストレスフリー。

## ⚡ なぜ必要か

| 従来の方法 | 現在 |
|-----------|------|
| ターミナル開く → フォルダ選択 → 確認 → 待機 ~35秒 | Dockクリック ~3秒 ✨ |

**毎日5分節約、年間30時間節約。**

## 🚀 クイックスタート

### macOS

```bash
curl -fsSL https://raw.githubusercontent.com/orange2ai/claude-code-now/main/install.sh | bash
```

**手動インストール：**
1. [最新版](https://github.com/orange2ai/claude-code-now/releases)をダウンロード
2. `Claude Code Now.app` をアプリケーションフォルダにドラッグ
3. Dockアイコンクリックで起動

**Finder ツールバー：**
- `Command` キーを押しながらアプリをツールバーにドラッグ
- ツールバーアイコンクリックで任意のフォルダで起動

### Windows

```batch
# 先に Claude Code CLI をインストール
npm install -g @anthropic-ai/claude-code

# インストーラー実行（管理者権限）
install.bat
install-context-menu.bat
```

フォルダ右クリック → "Claude Code Now"

## ✨ 主な機能

- **🖥 Dock 起動** (macOS) - ワンクリック起動
- **⚡ Finder ツールバー** (macOS) - 任意のフォルダで起動
- **📁 右クリック起動** (Windows) - コンテキストメニュー統合
- **🚀 零設定** - インストール即使用

## 💡 コンテキストの重要性

Claude Code は適切なコンテキストで最高の結果を出します：
- 📊 リサーチフォルダでデータ分析
- 💻 プロジェクトディレクトリでコーディング
- 📝 レポートフォルダでドキュメント処理

**仕事するすべての場所で Claude Code Now を起動。**

## 📦 プロジェクト構造

```
Claude Code Now/
├── 📱 Claude Code Now.app    # macOS アプリ
├── 🚀 install.sh              # ワンラインインストーラー
├── 📂 macos/                  # macOS スクリプト
├── 📂 windows/                # Windows スクリプト
└── 📂 docs/                   # ドキュメント
```

## 🛠️ 動作環境

**macOS:** macOS 10.9+ + Claude Code CLI  
**Windows:** Windows 7+ + Node.js + Claude Code CLI

## 👨‍💼 製作者について

**Orange** による開発、[ListenHub.AI](https://listenhub.ai) CEO

設計哲学：**シンプル → フォーカス → 極致**

---

⭐ **役に立ったらStarを！** [GitHub](https://github.com/orange2ai/claude-code-now)

💬 **質問？** [Issue](https://github.com/orange2ai/claude-code-now/issues)