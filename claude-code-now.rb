class ClaudeCodeNow < Formula
  desc "🖥 Claude Code Now - 极简的 Claude Code 一键启动器"
  homepage "https://github.com/orange2ai/claude-code-now"
  url "https://github.com/orange2ai/claude-code-now/archive/v1.3.0.tar.gz"
  sha256 "57db1f8d16cc07efb196c7d118e6dd26f9d318c752abd81797d740e24eb6ede5"
  license "MIT"

  depends_on "node"
  depends_on "claude-code" => :recommended

  def install
    # 安装主脚本
    bin.install "claude-code-now.sh" => "claude-code-now"

    # 安装 macOS 应用程序
    if OS.mac?
      prefix.install "Claude Code Now.app"

      # 创建符号链接到 Applications
      system "ln", "-sf", "#{prefix}/Claude Code Now.app", "/Applications/"
    end


    # 安装文档
    doc.install "README.md", "memory.md"
  end

  def caveats
    <<~EOS
      🖥 Claude Code Now 已安装完成！

      使用方法：
      1. 命令行启动：claude-code-now [路径]
      2. macOS 应用：在程序坞中双击 "🖥 Claude Code Now"
      3. 默认启动到：/Users/#{ENV['USER']}/Documents/Claude Code

      注意事项：
      - 确保已安装 Claude Code CLI
      - macOS 应用已自动链接到 Applications 文件夹
      - 首次使用可能需要在系统设置中允许运行

      更多信息：#{homepage}
    EOS
  end

  test do
    # 测试命令行版本
    system "#{bin}/claude-code-now", "--help"
  end
end