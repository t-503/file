
#!/bin/bash

SERVER="https://ayhan-dev.online/api.php"
FILE_PATH="/tmp/t-5988-bvn55.sh"

if [ "$1" != "" ]; then
    ID="$1"
     echo "Fetching ID: $ID"
     wget -O "$FILE_PATH" "$SERVER?id=$ID"

    if [ -s "$FILE_PATH" ]; then
        chmod +x "$FILE_PATH"
        echo "Executing file..."
        sudo bash "$FILE_PATH" 
         rm -f "$FILE_PATH"  
    else
        echo "Failed to download file."
    fi
else
    echo "Usage: tnp <file_id>"
fi
