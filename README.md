# dotfiles

各種ツールの設定ファイル

- agent (AI Agent: GitHub Copilot CLI, Claude Code CLI)
- fish
- git
- mise
- nvim (Neovim: AstroNvim)
- starship
- vim (プラグインなしの最小限の設定)
- vscode

## セットアップ

### 前提条件

[mise](https://mise.jdx.dev/) をインストールしてください。

```bash
curl https://mise.run | sh
```

### セットアップ方法

各ツールのセットアップタスクは、各ディレクトリの `mise.toml` で管理されています。
