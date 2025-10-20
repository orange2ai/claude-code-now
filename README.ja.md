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

## 🧠 コンテキストの力

**なぜ異なるフォルダでClaude Codeを起動するのか？** **コンテキストがすべて**だからです！

Claude Codeは適切なコンテキストがあってこそ最高の結果を発揮します。例えば：
- 📊 **データ分析** - 研究フォルダで
- 💻 **コード作成** - プロジェクトディレクトリで  
- 📝 **文書処理** - レポートフォルダで
- 🎨 **クリエイティブ作業** - デザインフォルダで

**各コンテキストがClaude Codeにスーパーパワーを与えます。**

だからこそ**重要なフォルダすべて**にClaude Code Nowランチャーを配置し、完璧なコンテキストで瞬時に起動する必要があるのです。

**信じてください：コンテキスト対応のClaude Codeを体験したら、もうコンテキストなしのAIには戻れません。**

---

⭐ **このツールが気に入ったら、Starをお願いします！** ⭐

[![GitHub stars](https://img.shields.io/github/stars/orange2ai/claude-code-now?style=social)](https://github.com/orange2ai/claude-code-now/stargazers) [![GitHub forks](https://img.shields.io/github/forks/orange2ai/claude-code-now?style=social)](https://github.com/orange2ai/claude-code-now/network)

---

## ✨ 主要機能

### 🖥 Dock 起動 (macOS)
アプリを Dock に配置、クリックで Claude Code が起動。

### ⚡ Finder ツールバー起動 (macOS)
アプリを Finder ツールバーにドラッグ、任意のフォルダでクリックして起動。

### 📁 右クリック起動 (Windows)
任意のフォルダで右クリック、"Claude Code Now" を選択して起動。

### 🔧 API設定スイッチャー
**ワンクリックAPI設定切り替え**、ローカル安全保存。

**対応API：**
- **Zhipu AI** (GLM) - 中国国内ユーザー向け
- **Anthropic 公式** - 海外ユーザー向け
- **カスタム API** - その他互換サービス

**セキュリティ：** API キーはローカル保存、アップロードされません。

**使用方法：** `config-switcher/Claude Config Switcher.app` に移動

### 📁 ユニバーサル起動
アプリをどこにでも配置、アイコンをクリックで直接起動。

**とてもシンプルです。**

## ⚡ クイックスタート

### 🚀 ワンラインインストール（推奨）

```bash
curl -fsSL https://raw.githubusercontent.com/orange2ai/claude-code-now/main/install.sh | bash
```

**これだけです！** このコマンドで自動的に：
- ✅ 最新バージョンを自動ダウンロード
- ✅ Applications フォルダにインストール
- ✅ 作業ディレクトリを作成
- ✅ 適切な権限を設定
- ✅ 使用方法を表示

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

#### 方法3：コマンドラインインストール

```bash
# スクリプトをダウンロード
curl -fsSL https://raw.githubusercontent.com/orange2ai/claude-code-now/main/claude-code-now.sh -o claude-code-now
chmod +x claude-code-now

# システムパスに移動
sudo mv claude-code-now /usr/local/bin/
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
├── 🔧 config-switcher/          # 新機能：設定スイッチャー
│   └── Claude Config Switcher.app # API設定切り替えツール
├── claude-code-now.sh           # 起動スクリプト
├── install.sh                   # スマートワンラインインストーラー
└── 📚 ドキュメント
```

## 👨‍💼 作者について

**Orange** 制作、**[ListenHub.AI](https://listenhub.ai)** CEO 🎧

**ListenHub.AI** - AIを使用して任意のコンテンツを魅力的なポッドキャストに変換。学習、コンテンツ作成、アクセシビリティに最適。

理念：**予測 → 単点突破 → All-in**

*実際の問題を解決するミニマル製品設計に特化。*

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=orange2ai/claude-code-now&type=Date)](https://star-history.com/#orange2ai/claude-code-now&Date)

---

⭐ **気に入ったら Star をください！** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)

💬 **質問がありますか？** [Issue を作成](https://github.com/orange2ai/claude-code-now/issues)

🔗 **プロジェクト GitHub:** [https://github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)