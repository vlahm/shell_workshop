
# navigation
c() { cd "$@" && ls; }
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lR="ls -R"
alias llR="ls -lR"
lh() {
  n=${1:-10}
  ls -lt | head -n "$n"
}
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dl="cd ~/Downloads"
alias db="cd ~/Dropbox"
alias dt="cd ~/Desktop"

# color
LS_COLORS='no=97:fi=97:di=01;04;96:mh=04;94:ln=04;01;94:or=04;01;31:mi=31:ex=00:*.rda=33:*.rds=33:*.tar=33:*.tgz=33:*.arj=33:*.taz=33:*.lzh=33:*.lzma=33:*.tlz=33:*.txz=33:*.zip=33:*.z=33:*.Z=33:*.dz=33:*.gz=33:*.lz=33:*.xz=33:*.bz2=33:*.bz=33:*.tbz=33:*.tbz2=33:*.tz=33:*.deb=33:*.rpm=33:*.jar=33:*.rar=33:*.ace=33:*.zoo=33:*.zpio=33:*.7z=33:*.rz=33:*.apk=33:*.log=37:*.bak=37:*.aux=37:*.bbl=37:*.blg=37:*~=37:*#=37:*part=37:*.incomplete=37:*swp=37:*tmp=37:*temp=37:*o=37:*pyc=37:*class=37:*.cache=37:*.vlah=08:*.bin=01;93:*.csh=01;93:*.ksh=01;93:*.out=01;93:*.ac=01;93:*.ahk=01;93:*.as=01;93:*.awk=01;93:*.beam=01;93:*.chm=01;93:*.crt=01;93:*.hta=01;93:*.jar=01;93:*.js=01;93:*.nexe=01;93:*.obs=01;93:*.tbl=01;93:*.url=01;93:*.wiz=01;93:*.xbap=01;93:*.exe=01;93:*.action=01;93:*.app=01;93:*.bat=01;93:*.cmd=01;93:*.com=01;93:*.command=01;93:*.cpl=01;93:*.inf=01;93:*.inx=01;93:*.isu=01;93:*.job=01;93:*.jse=01;93:*.lnk=01;93:*.msc=01;93:*.msi=01;93:*.msp=01;93:*.mst=01;93:*.paf=01;93:*.apk=01;93:*.osx=01;93:*.pif=01;93:*.prg=01;93:*.ps1=01;93:*.reg=01;93:*.rgs=01;93:*.sct=01;93:*.shb=01;93:*.shs=01;93:*.vb=01;93:*.vbe=01;93:*.vbs=01;93:*.vbscript=01;93:*.workflow=01;93:*.ws=01;93:*.wsf=01;93:*.wsh=01;93*:*.R=01;92:*.Rmd=01;92:*.rmd=01;92:*.py=01;92:*.c=01;92:*.conf=01;92:*.cfg=01;92:*.config=01;92:*.cpp=01;92:*.cc=01;92:*.ini=01;92:*Makefile=01;92:*Rakefile=01;92:*.tex=01;92:*.sh=01;92:*.ipynb=01;92:*.bug=01;92:*.m=01;92:*.tsv=32:*.csv=32:*.feather=32:*.json=32:*.xml=32:*.db=32:*.yml=95:*.md=95:*.doc=95:*.docx=95:*.xls=95:*.xlsx=95:*.ods=95:*.odt=95:*.ppt=95:*.pptx=95:*.odp=95:*.txt=95:*.rtf=95:*README=95:*readme=95:*.pdf=95:*.rst=95:do=97;41:pi=30;102:so=30;103:bd=30;104:cd=30;105'
export LS_COLORS
alias ls='gls --color=auto'
alias dir='gdir --color=auto'
alias vdir='gvdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='grep -F --color=auto'
alias egrep='grep -E --color=auto'
# bonus: same colors in zsh tab completion
autoload -Uz compinit && compinit
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# xclip (linux)

#alias xcp="pwd | xclip -selection clipboard"
#alias xclip="xclip -selection c"
#function xc {
#    realpath "$1" | tr -d '\n' | xclip -selection clipboard
#}
#function xcf {
#    echo "$1" | tr -d '\n' | xclip -selection clipboard
#}
#function xcc {
#    cat $1 | xclip
#}

# pbcopy (macos)
alias xcp='pwd | tr -d "\n" | pbcopy'
alias xclip='pbcopy'
xc()  { realpath "$1" | tr -d '\n' | pbcopy; }
xcf() { printf '%s' "$1" | pbcopy; }
xcc() { cat "$1" | pbcopy; }

# git (note that more complex git aliases need to be defined within git)
alias gits="git status"
alias gita="git add ."
gitc() { git commit -m "$1"; }
alias gitshows="git rev-list --objects --all |   git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |   sed -n 's/^blob //p' |   sort --numeric-sort --key=2 |   cut -c 1-12,41- |   $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest"
githist() { git grep "$1" $(git rev-list --all) -- "*$2"; }

# grep
# these require GNU grep, which can be installed with `brew install grep`.
# the export line below puts GNU grep first in system path
export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"
function ftgrep {
	#for perl-compatible regex
    grep -Pr --include="*$1" "$2" .
}
function ftgrepF {
	#for literal strings
	grep -rF --include="*$1" "$2" .
}
function ftgrepo {
    #for lines that contain ONLY the searched string
    grep -Pr --include="*$1" "(?:[^a-zA-Z0-9_]|^)$2(?:[^a-zA-Z0-9_]|$)" .
}
function ftgrepl {
    #for filenames only
    grep -Plr --include="*$1" "$2" .
}

# tmux
function tm {
    tmux new -s "$1"
}

# file ops
alias o="open"
alias bashrc="vim ~/git/config_files/zshrc"
alias bashrc2=". ~/.zshrc"
alias zshrc="vim ~/git/config_files/zshrc"
alias zshrc2=". ~/.zshrc"
function ffind() {
	find . -iname "*$1*"
}
or() {
    # open the Nth most recently modified file with its default app (default: 1st)
    local n="${1:-1}"
    local f=( *(N.om[$n]) )
    if [[ -n "$f" ]]; then
        open "$f"
    else
        echo "No such file (position $n)" >&2
        return 1
    fi
}

vor() {
    # open the Nth most recently modified file in vim (default: 1st)
    local n="${1:-1}"
    local f=( *(N.om[$n]) )
    if [[ -n "$f" ]]; then
        vim "$f"
    else
        echo "No such file (position $n)" >&2
        return 1
    fi
}

cr() {
    # change to the Nth most recently modified dir (default: 1st)
    local n="${1:-1}"
    local d=( *(N/om[$n]) )
    if [[ -n "$d" ]]; then
        cd "$d"
    else
        echo "No such dir (position $n)" >&2
        return 1
    fi
}

mvr() {
    # move the N most recent files from ~/Downloads to cwd (default: 1)
    local n="${1:-1}"
    local files=( ~/Downloads/*(Nom[1,$n]) )
    if (( ${#files} )); then
        mv "${files[@]}" .
    else
        echo "Nothing in ~/Downloads" >&2
        return 1
    fi
}
