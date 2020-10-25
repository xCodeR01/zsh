
# setting or unsetting options
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

# Zsh directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.i

# create 1 to 9 indexes of recently visited directories, can be accessed using d
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# hide EOL sign ('%')
export PROMPT_EOL_MARK=""

# History configurations
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# path to completion files of various useful commands
fpath=($ZDOTDIR/plugs/zsh-completions $fpath)

# enable completion features, looks for compinit file and calls it
autoload -Uz compinit; compinit
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion
_comp_options+=(globdots) # With hidden files

# loads the plugs paths to fpath variable for autoload to search
fpath=($ZDOTDIR/plugs $fpath)
autoload -Uz auto_comp; auto_comp	# loads auto completion script
autoload -Uz cursor_mode; cursor_mode		# loads cursor_mode script, path to plugs already added

# loads folder **prompt** to fpath variable, loads and execute the script cool_prompt
fpath=($ZDOTDIR/prompt $fpath)
autoload -Uz cool_prompt; cool_prompt

# activating vim mode
bindkey -v
export KEYTIMEOUT=1

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# syntax highlighting plugin, sourcing directily 
source $ZDOTDIR/plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

