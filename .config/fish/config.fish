if status is-interactive
    # Commands to run in interactive sessions can go here
end

## aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias projects 'cd /home/jorge1504/Desktop/FILES/projects'
alias selftudies 'cd /home/jorge1504/Desktop/FILES/selftudies'
alias ls 'exa --git'
alias cat "bat " # replacement for cat
alias ps "procs"
alias grep 'rg '

alias dotfiles 'cd $HOME/.files'

alias clear '/usr/bin/clear;neofetch '


alias config '/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

## Lenguaje Go
set --export GOROOT /usr/local/go
set -gx PATH /usr/local/go/bin $PATH
#set -gx PATH GOROOT/bin $PATH
set --export GOPATH $HOME/GoProjects
set -gx PATH $GOPATH/bin $PATH


starship init fish | source
pyenv init - | source
fish_vi_key_bindings
neofetch 


