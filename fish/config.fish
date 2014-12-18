# PATH
set -g -x PATH $PATH $HOME/bin
set -g -x PATH $PATH $HOME/local/bin
set -g -x PATH $PATH $HOME/.local/bin

# Other variables
set -g -x fish_greeting ''
set -g -x EDITOR vim
set -g -x TERM xterm-256color

# Functions
function ef; vim ~/.config/fish/config.fish; end
function ev; vim ~/.vimrc; end
function eg; vim ~/.gitconfig; end
function eh; vim ~/.hgrc; end

function ..;    cd ..; end
function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end

function l; ls -Flah $argv; end
function serve_this; python -m SimpleHTTPServer; end

# Opens the file with your preferred program
function o; gvfs-open $argv; end

# Mercurial
function hcp; hg qref; and hg qci -m backup; and hg push --mq; end

# Prompt
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)
set white (set_color white)
set hg_promptstring "< on $magenta<branch>$normal>< at $yellow<tags|$normal, $yellow>$normal>$green<status|modified|unknown><update>$normal<
patches: <patches|join( → )|pre_applied($yellow)|post_applied($white)|pre_unapplied($gray)|post_unapplied($white)>>" 2>/dev/null

function virtualenv_prompt
    if [ -n "$VIRTUAL_ENV" ]
        printf '(%s) ' (basename "$VIRTUAL_ENV")
    end
end

function hg_prompt
    hg prompt --angle-brackets $hg_promptstring 2>/dev/null
end

function git_prompt
    if git root >/dev/null 2>&1
        set_color normal
        printf ' on '
        set_color magenta
        printf '%s' (git currentbranch ^/dev/null)
        set_color green
        git_prompt_status
        set_color normal
    end
end

function prompt_pwd --description 'Print the current working directory, shortend to fit the prompt'
    echo $PWD | sed -e "s|^$HOME|~|"
end

function fish_prompt
    set last_status $status

    echo

    set_color magenta
    printf '%s' (whoami)
    set_color normal
    printf ' at '

    set_color yellow
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    hg_prompt
    git_prompt

    echo

    virtualenv_prompt

    if test $last_status -eq 0
        set_color white -o
        printf '><((°> '
    else
        set_color red -o
        printf '[%d] ><((ˣ> ' $last_status
    end

    set_color normal
end
