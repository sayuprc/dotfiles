# nvim

[AstroNvim](https://github.com/AstroNvim/AstroNvim) (v6) を使った Neovim の設定

[公式テンプレート](https://github.com/AstroNvim/template) をもとにしている

## Required

mise の `config.toml` で入れる

- neovim
- tree-sitter (構文解析のパーサーのビルドに使う)
- lazygit (`Space g g` で使う)
- ripgrep / fd (ファイルや中身の検索に使う)
- node (intelephense の実行に使う)

ほかに次のものが必要

- git
- C コンパイラ (`cc`)
- Nerd Font 3.2 以上 (アイコンの表示に使う。ターミナルのフォントに設定する)

## セットアップ

このディレクトリで実行する

```bash
mise run all
```

- `~/.config/nvim` にこのディレクトリへのシンボリックリンクを張る
- 初回起動時に lazy.nvim とプラグインが自動でインストールされる

## 設定の変え方

- `lua/plugins/` に `.lua` ファイルを置くと読み込まれる
- テンプレートのファイル (`astrocore.lua` など) は先頭の `if true then return {} end` で無効になっている。使うときはその行を消す
- オプションやキー割り当ては `astrocore.lua` の `opts` に書く (`:h astrocore`)

独自に追加している設定

| ファイル | 内容 |
| --- | --- |
| `lua/community.lua` | AstroCommunity の TOML (taplo) と YAML (yaml-language-server、SchemaStore) のパック、Markdown のブラウザプレビュー (markdown-preview.nvim) を読み込む |
| `init.lua` | 使わない gdu / btm の有無を確かめないようにする (WSL では見つからないコマンドの検索が遅く、起動が重くなるため) |
| `lua/plugins/clipboard.lua` | 右クリックをクリップボードからの貼り付けにする |
| `lua/plugins/colorscheme.lua` | 配色を catppuccin にする |
| `lua/plugins/docker.lua` | Dockerfile、Compose、Bake ファイルの LSP に docker-language-server (VS Code の Docker DX と同じもの) を使う |
| `lua/plugins/icons.lua` | ファイルのアイコンを Material 風 (nvim-material-icon) にする |
| `lua/plugins/markdown.lua` | WSL で Markdown のプレビューを Windows の既定ブラウザで開く |
| `lua/plugins/php.lua` | PHP の LSP に intelephense を使う。treesitter の php / phpdoc パーサーも入れる |
| `lua/plugins/terraform.lua` | Terraform の LSP に terraform-ls を使う |
| `lua/plugins/toggleterm.lua` | ターミナルを高さ 20 行で開く。`F8` で新しいターミナルを足す。ターミナルの中の `Ctrl-l` をシェルに渡す (画面のクリアに使う) |
| `lua/plugins/yaml.lua` | YAML のパックが Neovim 0.11 以降で SchemaStore のスキーマを渡せていないため、渡し直す |

## 更新

| コマンド | 動作 |
| --- | --- |
| `:Lazy update` | プラグインを更新する (AstroNvim のバージョンに合わせて固定されているので、2 回実行する) |
| `:Lazy` | プラグインの状態を確認する |
| `:Mason` | LSP やフォーマッターを管理する |

`lazy-lock.json` に各プラグインのバージョンが記録される

コミットしておけば、別の環境でも同じ状態を再現できる

## キー操作

`Space` (`<Leader>`) を押して少し待つと、続けて押せるキーの一覧が出る

### ファイル

| キー | 動作 |
| --- | --- |
| `Space f f` | ファイルを探して開く |
| `Space f w` | ファイルの中身を検索する |
| `Space f b` | 開いているバッファから探す |
| `Space f o` | 最近開いたファイルから探す |
| `Space e` | ファイルツリーを開く / 閉じる |
| `Space o` | ファイルツリーとファイルの間でカーソルを行き来する |

### バッファとウィンドウ

| キー | 動作 |
| --- | --- |
| `]b` / `[b` | 次 / 前のバッファに切り替える |
| `Space b b` | 上部のバッファ一覧に出る文字を押して、そのバッファに切り替える |
| `Space b p` | 直前に開いていたバッファに切り替える |
| `Space f b` | 開いているバッファを検索して切り替える |
| `>b` / `<b` | 上部のバッファ一覧で、今のバッファを右 / 左に移動する |
| `Space c` | バッファを閉じる (ウィンドウは残る) |
| `Ctrl-h` / `Ctrl-j` / `Ctrl-k` / `Ctrl-l` | 左 / 下 / 上 / 右のウィンドウへ移動する (ターミナルの中では `Ctrl-l` 以外が使える) |
| `Space q` | ウィンドウを閉じる |
| `Space Q` | 終了する |

### ターミナル

| キー | 動作 |
| --- | --- |
| `F7` | 開いているターミナルを全部まとめて隠す / 隠したターミナルをまとめて出し直す (下に高さ 20 行で開く) |
| `F8` | 新しいターミナルを足す (どのモードからでも使える) |
| `数字 F7` | その番号のターミナルだけを開く / 隠す (ノーマルモードで押す) |
| `Ctrl-k` | ターミナルから上のファイルに戻る |
| `Ctrl-h` | 左のターミナルに移る |
| `Ctrl-\` `Ctrl-n` | ターミナルの中でノーマルモードにする (スクロールやコピーができる。`i` で入力に戻る) |
| `:TermSelect` | ターミナルの一覧から選んで開く |
| `Space t h` | 下にターミナルを開く (高さ 20 行) |
| `Space t v` | 右にターミナルを開く |
| `Space t f` | 浮いたウィンドウでターミナルを開く |

ターミナルを複数使う手順

1. `F7` で 1 つ目のターミナルを開く
2. `F8` を押すたびに、新しいターミナルが右に足される (ターミナルに入力している最中でも押せる)
3. `Ctrl-h` で左のターミナルに、`Ctrl-k` で上のファイルに移る
4. `F7` で全部まとめて隠し、もう一度 `F7` で全部元通りに出す (中のシェルは隠している間も動いている)
5. 閉じたいターミナルでは `exit` を実行する

ターミナルに入ると自動で入力モードになり、キーはシェルに送られる

そのため、ターミナルの中で `2 F7` のように番号付きで押すと、番号がシェルに入ってしまう

番号付きで押すときは、先に `Ctrl-\` `Ctrl-n` でノーマルモードにするか、ファイル側で押す

### LSP

| キー | 動作 |
| --- | --- |
| `K` | カーソル位置の型やドキュメントを表示する |
| `gd` | 定義に移動する |
| `gy` | 型の定義に移動する |
| `Space l R` | 参照している箇所を探す |
| `Space l r` | 名前を変更する |
| `Space l a` | コードアクションを実行する |
| `Space l f` | フォーマットする |
| `Space l d` | カーソル行の診断 (エラーや警告) を表示する |
| `Space l i` | 動いている LSP の情報を表示する |

### Markdown

Markdown のファイルを開くと、見出し・表・コードブロック・チェックボックスなどが整形されて表示される

カーソルのある行は、元の書き方のまま表示される

| キー | 動作 |
| --- | --- |
| `Space u m` | 整形表示のオンとオフを切り替える |

### Git

| キー | 動作 |
| --- | --- |
| `Space g l` | カーソル行の git blame を表示する |
| `Space g L` | カーソル行の git blame を詳しく表示する |
| `Space g g` | lazygit を開く |
