eval "$(/opt/homebrew/bin/brew shellenv)"

# java多版本管理
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export M2_HOME=/usr/local/maven/apache-maven-3.6.3
export PATH=$PATH:$M2_HOME/bin

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# export PATH=/opt/homebrew/opt/node@18/bin:$PATH
export NVM_DIR="$HOME/.nvm"
 [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
 [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

