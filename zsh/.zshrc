# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

# 主题配置
ZSH_THEME="powerlevel10k/powerlevel10k"

# 插件配置 
plugins=(
    vi-mode
    autojump
    extract
    git
    you-should-use
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
#    zsh-history-substring-search
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 快捷键绑定
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down

# 别名
alias v='nvim'
alias vim='nvim'
alias vi='nvim'
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias cat='ccat'
alias jdk8='jenv global 1.8'
alias jdk17='jenv global 17.0'
alias jdk11='jenv global 11.0'
alias jdk8_tmp='jenv local 1.8'
alias jdk17_tmp='jenv local 17.0'
alias jdk11_tmp='jenv local 11.0'
alias yabai-stop='brew services stop yabai'
alias yabai-start='brew services start yabai'
alias rc='ranger'

#prompt_context() {
#  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#  fi
#}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/chason/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/chason/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/chason/opt/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/chason/opt/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
