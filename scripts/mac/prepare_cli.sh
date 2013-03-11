#!/bin/sh

export GETDOWN_DIR="$HOME/Library/Application Support/NeSI"
export JAVA_EXE="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Commands/java"

export DIR="/Library/Application Support/gee"

export JAVA_ARGS="-Xmx64m"


if [ ! -d "$GETDOWN_DIR" ]
then
  mkdir -p "$GETDOWN_DIR"
fi

if [ ! -f "$GETDOWN_DIR/getdown.txt" ] 
then 
	cp "$DIR/getdown.txt" "$GETDOWN_DIR"
fi

timestamp_file=$GETDOWN_DIR/last_update

# checking whether user wants local backend
ARGS="$@"
shopt -s nocasematch
if [[ ($ARGS =~ -b[\ \ *][local]) || ($ARGS =~ --backend[\ \ *][local]) ]]; then
	touch "$GETDOWN_DIR/local-backend.dat"
	java -Dsilent=true -jar "$DIR/getdown-client.jar" "$GETDOWN_DIR"
	touch "$timestamp_file"
	export JAVA_ARGS="-Xmx512m --XX:MaxPermSize=128M"
fi

if [ ! -f "$GETDOWN_DIR/grid-client-core.jar" ]
then
    echo "First time run, downloading main application. This might take a little while..."
    java -Dsilent=true -jar "$DIR/getdown-client.jar" "$GETDOWN_DIR"
    touch "$timestamp_file"
else
    # checking whether last update was in the last 24 hours
    if [[ ( ! -f "$timestamp_file" ) || ( -n `find "$timestamp_file" -mmin +1440` ) ]]
    then
	echo "Checking for updates. This might take a while..."
	java -Dsilent=true -jar "$DIR/getdown-client.jar" "$GETDOWN_DIR"
	touch "$timestamp_file"
    else 
	echo "Not checking for update, already checked today..."
    fi


fi

export GRID_CLIENT_CLASSPATH="$GETDOWN_DIR/grid-client-core.jar:$GETDOWN_DIR/grid-client-dependencies.jar:$GETDOWN_DIR/local-backend.jar"

export X509_USER_PROXY="$HOME/.grid/grid.proxy"

