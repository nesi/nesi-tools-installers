#! /bin/bash

unset DISPLAY

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export GETDOWN_DIR="$DIR/../launch"


export JAVA_OPTS="-Djava.awt.headless=true -Xms64m -Xmx64m"

timestamp_file=$GETDOWN_DIR/last_update

# checking whether user wants local backend
ARGS="$@"
shopt -s nocasematch
if [[ ($ARGS =~ -b[\ \ *][local]) || ($ARGS =~ --backend[\ \ *][local]) ]]; then
	touch "$GETDOWN_DIR/local-backend.dat"
	#echo "Checking whether local backend is available and up to date..."
	java -Dsilent=true -jar "$GETDOWN_DIR/getdown-client.jar" "$GETDOWN_DIR"
	touch "$timestamp_file"
	JAVA_OPTS="-Djava.awt.headless=true -Xms128m -Xmx512m"
fi

if [ ! -f "$GETDOWN_DIR/grid-client-core.jar" ]
then
    #echo "First time run, downloading main application. This might take a little while..."
    java -Dsilent=true -jar "$GETDOWN_DIR/getdown-client.jar" "$GETDOWN_DIR"
else
    # checking whether last update was in the last 24 hours
    if [[ ( ! -f "$timestamp_file" ) || ( -n `find "$timestamp_file" -mmin +1440` ) ]]
    then
	#echo "Checking for updates. This might take a while..."
	java -Dsilent=true -jar "$GETDOWN_DIR/getdown-client.jar" "$DIR"
    else
	#echo "Not checking for update, already checked today..."
    fi
fi

touch "$timestamp_file"

export X509_USER_PROXY="$HOME/.grid/grid.proxy"

# check whether we have our own jvm
if [ -f "$GETDOWN_DIR/java_vm/bin/java" ]
then
	export JAVA_EXE="$DIR/../launch/java_vm/bin/java"
else
	export JAVA_EXE=`which java`
fi

export GRID_CLIENT_CLASSPATH="$GETDOWN_DIR/grid-client-core.jar:$GETDOWN_DIR/grid-client-dependencies.jar:$GETDOWN_DIR/local-backend.jar"
