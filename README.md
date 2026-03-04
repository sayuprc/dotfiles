# dotfiles

各種ツールの設定ファイル

- fish
- git
- vim
- starship
- vscode

## セットアップ

### 前提条件

[mise](https://mise.jdx.dev/) をインストールしてください。

```bash
curl https://mise.run | sh
```

### 利用可能なタスク

利用可能なタスクの一覧を表示:

```bash
mise tasks
```

### 個別セットアップ

#### Git

```bash
# 環境変数を設定してユーザー情報を設定
USER_NAME="Your Name" EMAIL="your@email.com" mise run git:all
```

または

```bash
mise run git:all
```

#### Fish

```bash
mise run fish:all
```

#### Starship

```bash
mise run starship:all
```

#### Vim

```bash
mise run vim:all
```
