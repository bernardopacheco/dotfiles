# Append this section at the bottom of your .zshrc file.

# Custom aliases

alias ez="vim ~/.zshrc"
alias ev="vim ~/.vimrc"
alias eg="vim ~/.gitconfig"
alias ei="vim ~/.gitignore"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -Flah $argv"
alias o="code $argv"
alias serve_this="python -m SimpleHTTPServer"

# Git alias
alias glog='git log --graph --pretty=oneline --abbrev-commit --decorate'
alias gupdate='git checkout master && git fetch --prune && git pull && git checkout -'
alias gco='git checkout'
alias gpl='git pull --ff-only'
alias gcb='git checkout -b'
alias gbr='git branch'
alias gdf='git diff'
alias gds='git diff --staged'
alias gdt='git difftool'
alias gdis='git checkout --'
alias gau='git add -u'
alias gaA='git add -A'
alias gca='git commit --amend'
alias gs='git status'
alias gc='git commit'
alias gfp='git fetch --prune'
alias gpo='git remote prune origin'
alias gcp='git cherry-pick'
alias grm-all='git rebase --onto master $(git merge-base HEAD master | tail -n 1) $(git branch --show-current | tail -n 1)'
alias grm='git rebase --onto master HEAD~1 $(git branch --show-current | tail -n 1)'
alias gp='git push'
alias gpf='git push -f'
alias gpu='git push --set-upstream origin $(git branch --show-current | tail -n 1)'
