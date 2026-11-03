# ~/.bash_aliases — aliases for Arch Linux
# Add to ~/.bashrc:  [ -f ~/.bash_aliases ] && source ~/.bash_aliases

# ---------- Default editor ----------
export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'
alias v='nvim'

# ---------- Listing (eza with icons if installed, plain ls otherwise) ----------
# Soft eza colors: directories are a muted steel blue (256-color 110),
# every file category gets a calm, non-bold color
# (code yellow, archives red, media magenta, temp/compiled dimmed).
# Permissions, sizes, user, date and punctuation are dimmed (2 = dim).
export EZA_COLORS="di=38;2;168;134;116:ex=32:ln=36:\
sc=33:bu=33:do=0:co=31:cr=31:im=35:vi=35:mu=35:lo=35:tm=2:cm=2:\
ur=2:uw=2:ux=2:ue=2:gr=2:gw=2:gx=2:tr=2:tw=2:tx=2:\
sn=2:sb=2:uu=2:gu=2:da=2:xx=2"

if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -lh --icons --group-directories-first --git'
    alias la='eza -lah --icons --group-directories-first --git'
    alias lt='eza --tree --level=2 --icons'
else
    alias ls='ls --color=auto'
    alias ll='ls -lh --color=auto'
    alias la='ls -lAh --color=auto'
fi

# ---------- bat instead of cat (if installed) ----------
command -v bat >/dev/null 2>&1 && alias cat='bat --paging=never'

# ---------- Colored output ----------
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# ---------- Navigation ----------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# ---------- Safer file operations ----------
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkdir='mkdir -pv'

# ---------- Pacman / AUR ----------
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
alias pkginfo='pacman -Qi'
alias orphans='pacman -Qdtq'
alias cleanup='pacman -Qdtq | sudo pacman -Rns -'
alias cache='sudo paccache -r'              # requires pacman-contrib
alias mirrors='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
command -v yay >/dev/null 2>&1 && alias yupdate='yay -Syu'
command -v paru >/dev/null 2>&1 && alias pupdate='paru -Syu'

# ---------- Git ----------
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate --all'

# ---------- System ----------
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ports='ss -tulnp'
alias myip='curl -s ifconfig.me; echo'
alias journal='journalctl -p 3 -xb'          # errors from current boot
alias failed='systemctl --failed'
alias h='history | grep'
alias c='clear'

# ---------- Config files ----------
alias bashrc='nvim ~/.bashrc && source ~/.bashrc'
alias aliases='nvim ~/.bash_aliases && source ~/.bash_aliases'
alias starshiprc='nvim ~/.config/starship.toml'
alias reload='source ~/.bashrc'

# ---------- Small functions ----------
# Create a directory and cd into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# Extract any kind of archive
extract() {
    if [ ! -f "$1" ]; then echo "'$1' not found"; return 1; fi
    case "$1" in
        *.tar.gz|*.tgz)   tar xzf "$1" ;;
        *.tar.bz2|*.tbz2) tar xjf "$1" ;;
        *.tar.xz)         tar xJf "$1" ;;
        *.tar.zst)        tar --zstd -xf "$1" ;;
        *.tar)            tar xf "$1" ;;
        *.zip)            unzip "$1" ;;
        *.gz)             gunzip "$1" ;;
        *.bz2)            bunzip2 "$1" ;;
        *.xz)             unxz "$1" ;;
        *.7z)             7z x "$1" ;;
        *.rar)            unrar x "$1" ;;
        *) echo "'$1': unknown archive format" ;;
    esac
}
