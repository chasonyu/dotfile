eval "$(/opt/homebrew/bin/brew shellenv)"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
export PATH=$JAVA_HOME/bin:$PATH:.

export M2_HOME=/usr/local/maven/apache-maven-3.6.3
export PATH=$PATH:$M2_HOME/bin

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export PATH=/opt/homebrew/opt/node@18/bin:$PATH


