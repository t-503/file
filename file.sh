#!/bin/bash

SERVER="https://ayhan-dev.online/api.php"
FILE_PATH="/tmp/t-5988-bvn55.sh"

if [ "$1" == "tnp" ] && [ "$2" != "" ]; then
    ID="$2"
    echo "Downloading file with ID: $ID..."
    
    curl -s "$SERVER?id=$ID" -o "$FILE_PATH"
    
    if [ -s "$FILE_PATH" ]; then
        chmod +x "$FILE_PATH"
        echo "Executing file..."
        bash "$FILE_PATH"
    else
        echo "Failed to download file."
    fi
else
    echo "Usage: $0 tnp -<id>"
fi
