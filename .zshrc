
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/rlamsal/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	  git
	  zsh-autosuggestions
    zsh-syntax-highlighting
)

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

#### UNCOMMENT TO INSTALL RUBY ####
# Homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"
# rbenv
export RBENV_ROOT=/opt/homebrew/opt/rbenv
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init - zsh)"

export PATH="$HOME/.rbenv/shims:$PATH"

# openssl
# export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
# Install using:
# RUBY_CFLAGS="-Wno-error=implicit-function-declaration" rbenv install 2.5

#### UNCOMMENT TO INSTALL RUBY ####

export PATH=/opt/homebrew/bin/chromedriver:$PATH


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


export GEM_HOME=/Users/rlamsal/.gem


#### JENV INSTALL FOR JAVA WORK ####
eval export PATH="/Users/rlamsal/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/opt/homebrew/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}
#### JENV INSTALL FOR JAVA WORK ####

#### Autoraptor ####
function arup {
  docker compose down && \
  docker compose run --rm web bundle install && \
  docker compose run --rm assets_js yarn install && \
  docker compose run --rm web bin/rails db:reset db:create db:schema:load db:seed
  # && \
  # docker compose up web
}

# . /opt/homebrew/opt/asdf/libexec/asdf.sh

#### Autoraptor ####


#### Docker ####
function dd {
    docker compose down && \
    docker rm -f $(docker ps -a -q) && \
    docker rmi -f `docker images -aq` && \
    docker volume rm $(docker volume ls -q)
}
#### Docker ####

#### Healthcasts ####
function clean_up {
    rm -rf ./node/node_modules && \
    rm -rf ./node/dist-node && \
    rm -rf ./react/dist-react && \
    rm -rf ./react/node_modules
}
function start_up {
    nvm use 12.22.6 && \
    npm --prefix react install && \
    npm --prefix react run build && \
    npm --prefix node install && \
    npm --prefix node run build
}
#### Healthcasts ####

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/rlamsal/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Created by `pipx` on 2023-02-01 01:54:49
export PATH="$PATH:/Users/rlamsal/.local/bin"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# PYTHON ML
export PATH=~/miniforge3/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# pipenv openssl config
export LIBRARY_PATH=$(brew --prefix openssl)/lib
export LD_LIBRARY_PATH=$(brew --prefix openssl)/lib

# For Healthcasts AWS
export AWS_DEFAULT_PROFILE=healthcasts
export AWS_DEFAULT_REGION=us-east-2

# temp healthcasts python setup
export PYTHONPATH=/Users/rlamsal/Projects/healthcasts/healthcasts-ai/modules:$PYTHONPATH
