# nvm lines producing SC1091 error
# shellcheck disable=SC1091

# prevent duplicates when hitting the up arrow in the shell
setopt HIST_IGNORE_DUPS

# starship
# eval "$(starship init zsh)"
# pure
fpath+=("$HOME/.config/dotfiles/software/macos/pure")
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

# completion: https://thevaluable.dev/zsh-completion-guide-examples/
# https://github.com/conda-incubator/conda-zsh-completion
fpath+=("$HOME/.config/dotfiles/conda-zsh-completion")
fpath+=("$HOME/.config/dotfiles/zsh/completions")
autoload -U compinit; compinit

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

# aliases same as bash
alias l='ls'
alias ls='ls --color'
alias ll='ls -la'
alias lt='ls -lt'
alias ..='cd ..'
alias o='open'

# add timestamp to prompt
# PROMPT='%{$fg[yellow]%}[%D{%L:%M:%S}] '$PROMPT
PROMPT='%D{%L:%M:%S}'$PROMPT

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ahadjigeorgalis/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# shellcheck disable=SC2181
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ahadjigeorgalis/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ahadjigeorgalis/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ahadjigeorgalis/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate local

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
