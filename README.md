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

### セットアップ方法

各ツールのセットアップタスクは、各ディレクトリの `mise.toml` で管理されています。

#### ルートディレクトリから実行

```bash
# すべてのツールをセットアップ
mise run all

# 個別にセットアップ
mise run git
mise run fish
mise run starship
mise run vim
```

#### 各ディレクトリから実行

各ディレクトリに移動して、個別のタスクを実行することもできます。

**Git**
```bash
cd git
# 環境変数を設定してユーザー情報を設定
USER_NAME="Your Name" EMAIL="your@email.com" mise run all

# または個別タスク
mise run dir        # ディレクトリ作成
mise run user-conf  # ユーザー設定ファイル作成
mise run link       # シンボリックリンク作成
```

**Fish**
```bash
cd fish
mise run all             # すべてのタスクを実行
mise run dir             # ディレクトリ作成
mise run link            # シンボリックリンク作成
mise run install-fisher  # fisher をインストール
```

**Starship**
```bash
cd starship
mise run all      # すべてのタスクを実行
mise run install  # Starship をインストール
mise run link     # シンボリックリンク作成
```

**Vim**
```bash
cd vim
mise run all   # すべてのタスクを実行
mise run dir   # ディレクトリ作成
mise run link  # シンボリックリンク作成
```
