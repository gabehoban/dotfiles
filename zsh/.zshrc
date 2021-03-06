echo '🧙🏿‍♂️.zshrc loading...'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# # snippet
zinit wait lucid for \
    OMZL::git.zsh \
  atload"unalias grv" \
    OMZP::git

# Plugins
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
    zsh-users/zsh-syntax-highlighting \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

# powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
### End of Zinit's installer chunk



# Bundle files
ZSH_SRC_DIR="$HOME/Google Drive/Settings/dotfiles/zsh"

# Config
source "$ZSH_SRC_DIR/config.zsh"

# Aliases
source "$ZSH_SRC_DIR/alias.zsh"

# Last working dir
source "$ZSH_SRC_DIR/last-working-dir.zsh"

# Functions
source "$ZSH_SRC_DIR/functions.zsh"



# Syntax highlighting for man command
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Ruby env
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python env
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# n
export N_PREFIX="$HOME/.n"
export PATH="$PATH:$N_PREFIX/bin"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
