# 🖥 Claude Code Now

[English](README.md) | [中文](README.zh.md) | **日本語**

**世界最速の Claude Code ランチャー**

Claude Code の起動をもっと簡単に。macOS 専用設計。

Dock から1クリックで起動、または任意のフォルダから即座に起動。

## 🏆 効率比較

| 起動方法 | 操作手順 | 時間 |
|---------|----------|------|
| **従来** | ターミナルを開く → フォルダを選択 → ワークスペースを確認 → 権限確認を待つ | ~35秒 |
| **今** | Dock をクリック | ~3秒 ✨ |

1日に Claude Code を 10回起動すると、貴重な 5分間が無駄になります。

## 🎯 なぜ必要なのか？

**Claude Code はコードアシスタントだけではありません** - データ分析、ファイル整理、ドキュメント処理もできます。

Claude Code は素晴らしいツールですが、起動が面倒：

- 毎回ターミナルを開く必要がある
- フォルダを選択する必要がある
- ワークスペースの信頼を確認する必要がある
- 権限確認を待つ必要がある

**面倒すぎる！**

**Claude Code Now で、効率が 10倍に！**

権限確認を自動でスキップし、真の1クリック起動を実現。

毎日 5分節約、年間 30時間を取り戻します。

## ✨ ソリューション

### 🖥 Dock から起動

アプリを Dock に配置、クリックで Claude Code が起動。

### ⚡ Finder ツールバーから起動

アプリを Finder ツールバーにドラッグ、任意のフォルダでクリックして起動。

### 📁 任意のフォルダから起動

アプリをどこにでも配置、アイコンをクリックで直接起動。

とてもシンプルです。

## ⚡ クイックスタート

### ステップ1：作業フォルダの準備
`書類` に `Claude Code` フォルダを作成：

```
書類/
└── Claude Code/          # このフォルダを作成
```

### ステップ2：アプリのインストール

#### 方法1：直接ダウンロード（推奨）
1. [最新版](https://github.com/orange2ai/claude-code-now/releases) をダウンロード
2. `Claude Code Now.app` を Applications フォルダにドラッグ

**🖥 Dock にインストール：**

3. Applications から Dock にドラッグ
4. クリックで使用開始！

**⚡ Finder ツールバーにインストール：**

5. `Command` キーを押しながら、`Claude Code Now.app` を Finder ツールバーにドラッグ

6. ツールバーアイコンをクリックすると、現在のディレクトリで Claude Code が起動

#### 方法2：Git でダウンロード

```bash
git clone https://github.com/orange2ai/claude-code-now.git
cp -r "Claude Code Now.app" /Applications/
```

#### 方法3：Homebrew

```bash
brew tap orange2ai/claude-code-now
brew install claude-code-now
```

### ステップ3：使用開始

**🖥 Dock 方式：**
1. **Dock アイコンをクリック** - `書類/Claude Code` フォルダで自動起動
2. **作業開始** - データ分析、コーディング、ドキュメント処理

**⚡ Finder ツールバー方式：**
1. **任意のフォルダを開く** - Finder で作業したいディレクトリに移動
2. **ツールバーアイコンをクリック** - 現在のディレクトリで Claude Code が起動
3. **作業開始** - 選択したディレクトリで直接操作

## 💡 デザイン理念

**シンプル**：1つの機能に集中し、極限まで追求。

ユーザーニーズを予測 → コア機能を特定 → 全力を投入。

結果：1クリック起動、究極のシンプルさ。

## 🔧 システム要件

- **システム**：macOS 10.9+
- **依存関係**：[Claude Code CLI](https://docs.claude.com/en/docs/claude-code) がインストール済み
- **フォルダ**：`書類` に `Claude Code` フォルダを作成

## 📦 プロジェクトファイル

```
Claude Code Now/
├── 🖥 Claude Code Now.app        # メインアプリ
├── claude-code-now.sh           # 起動スクリプト
├── claude-code-now.rb           # Homebrew インストール
└── 📚 ドキュメント
```

## 👨‍💼 作者について

orange 制作、ミニマル製品に特化。

理念：**予測 → 単点突破 → All-in**

---

⭐ **気に入ったら Star をください！** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)

💬 **質問がありますか？** [Issue を作成](https://github.com/orange2ai/claude-code-now/issues)

🔗 **プロジェクト GitHub:** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)