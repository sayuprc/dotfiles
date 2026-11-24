# fish shell

## Required

- fish shell
- curl
- fzf / fd (`fzf.fish` で使う)

## fzf

`fzf.fish` で有効にしている

| キー | 動作 |
| --- | --- |
| `Ctrl-r` | コマンド履歴をあいまい検索して、入力欄に入れる |
| `Ctrl-t` | ファイルを探して、パスを入力欄に入れる |
| `Alt-c` | ディレクトリを探して `cd` する |

`.gitignore` に書いたものは候補に出ない (`FZF_DEFAULT_COMMAND` で fd を使っている)
