if status is-interactive
    # Commands to run in interactive sessions can go here
end

## aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias projects 'cd /home/jorge1504/Desktop/FILES/projects'
alias selftudies 'cd /home/jorge1504/Desktop/FILES/selftudies'
alias ls 'exa --git -g'
alias cat "bat " # replacement for cat
alias ps "procs"
alias grep 'rg '

alias dotfiles 'cd $HOME/.files'

alias clear '/usr/bin/clear;neofetch '


alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


alias vimdiff='nvim -d'


## setting  PATH to read from ~/.usr_scripts
set -gx PATH $HOME/.usr_scripts $PATH

## setting  PATH to read from ~/.local/bin
set -gx PATH $HOME/.local/bin $PATH

#set EDITOR
set  EDITOR /usr/bin/nvim


## Lenguaje Go
set --export GOROOT /usr/local/go
set -gx PATH /usr/local/go/bin $PATH
#set -gx PATH GOROOT/bin $PATH
set --export GOPATH $HOME/GoProjects
set -gx PATH $GOPATH/bin $PATH

# set -gx PATH $HOME/anaconda3/bin $PATH  # commented out by conda initialize

# set nvim as editor
set -gx EDITOR nvim


starship init fish | source
## pyenv init - | source
fish_vi_key_bindings
neofetch 



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/jorge1504/anaconda3/bin/conda
    eval /home/jorge1504/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<









pyenv init - | source
status --is-interactive; and source (pyenv virtualenv-init -|psub)

