# fzf や Ctrl-t で、.gitignore に書いたものを候補から外す
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# conf.d は config.fish の mise activate より先に読まれ、この時点では fzf が PATH に無いため、最初のプロンプトまで待つ
if status is-interactive
    function __fzf_setup --on-event fish_prompt
        functions --erase __fzf_setup
        type -q fzf; and fzf --fish | source
    end
end
