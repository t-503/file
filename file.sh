#!/bin/bash

SERVER="https://ayhan-dev.online/api.php"
FILE_PATH="/tmp/t-5988-bvn55.sh"

function fetch_and_execute() {
    ID="$1"
    echo "Fetching ID: $ID"
    wget -O "$FILE_PATH" "$SERVER?id=$ID"
    
    if [ -s "$FILE_PATH" ]; then
        echo "==========[file]=============="
        ls
        echo "==========[tmp]==============="
        ls "/tmp/"
        echo "============================="
        chmod +x "$FILE_PATH"
        echo "Executing file..."
        sudo bash "$FILE_PATH"
        rm -f "$FILE_PATH"
    else
        echo "Failed to download file."
    fi
}

function list_files() {
    ls -l 
}

function change_directory_and_run() {
    cd "$1" || exit
    bash "$2"
}

function run_file() {
    bash "$1"
}

function unzip_file() {
    unzip "$1"
}

function show_help() {
    echo "Usage: tnp <command> [arguments]"
    echo "Commands:"
    echo "  <file_id>         Fetch and execute file by ID"
    echo "  -ls                List files in the current directory"
    echo "  -cd <dir> -run <file>  Change directory and run a file"
    echo "  -run <file>       Run a specified file"
    echo "  -unzip <file>     Unzip a specified file"
    echo "  -help             Show this help message"
}

if [ "$1" == "-ls" ]; then
    list_files
elif [ "$1" == "-cd" ] && [ "$2" != "" ] && [ "$3" == "-run" ] && [ "$4" != "" ]; then
    change_directory_and_run "$2" "$4"
elif [ "$1" == "-run" ] && [ "$2" != "" ]; then
    run_file "$2"
elif [ "$1" == "-unzip" ] && [ "$2" != "" ]; then
    unzip_file "$2"
elif [ "$1" == "-help" ]; then
    show_help
elif [ "$1" != "" ]; then
    fetch_and_execute "$1"
else
    show_help
fi
