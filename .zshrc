# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH=$HOME/Projects/flutter/bin:$HOME/.rvm/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="/Users/rlamsal/.oh-my-zsh"

export TERM="xterm-256color"

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"


# Change the git status to red when something isn't committed and pushed
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'

# Add a new line after the global prompt 
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/rlamsal/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rlamsal/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/rlamsal/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rlamsal/google-cloud-sdk/completion.zsh.inc'; fi


# mongod on catalina
alias mongod="mongod --dbpath /System/Volumes/Data/data/db"


# Add rbenv to bash so that it loads every time you open a terminal
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


source ~/.aliases ~/.functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/usr/local/Cellar/gnu-getopt/2.36/bin:$PATH

# export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home

export PATH=/usr/local/opt/make/libexec/gnubin:$PATH
export PATH=/usr/local/Cellar/diffutils/3.7/bin:$PATH

# Maven
export M2_HOME=/usr/local/Cellar/apache-maven-3.6.3
export PATH=$M2_HOME/bin:$PATH

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#direnv
eval "$(direnv hook zsh)"

# export LIBRARY_PATH=$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib

. /usr/local/opt/asdf/asdf.sh
