export PF_INFO="ascii title os uptime pkgs memory palette"
pfetch # gatico

# autocomplete
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

eval "$(starship init zsh)"

eval "$(pyenv init --path)"

eval "$(zoxide init zsh)"

eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

export BAT_THEME="Catppuccin Mocha"


source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# vim mode for zsh
bindkey -v

# up and down for suggestions
#bindkey "^[[A" up-line-or-search
#bindkey "^[[B" down-line-or-search

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
#bindkey -M menuselect '^M' .accept-line
# autocompletition for zsh
#   autoload -U compinit && compinit

# Habilitar el autocompletado de fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/Users/agustin/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/agustin/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.5 # run chruby to see actual version
