1. Setting Up
Create the project directory:

mkdir my-bash-backup
cd my-bash-backup
Create a test folder (optional):

mkdir test_data
# Add some files inside test_data to test the backup
echo "Hello, world!" > test_data/sample.txt
Create the Bash script: Use a text editor (like nano or vim) to create backup_script.sh:

nano backup_script.sh
Paste the following script into the file:

#!/bin/bash

# Variables: change these as needed
SOURCE_DIR="./test_data"       # Directory to back up
BACKUP_DIR="./backups"         # Where backups will be stored

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Get current timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create backup filename with timestamp
BACKUP_FILE="$BACKUP_DIR/$SOURCE_DIR\_backup_\_$TIMESTAMP.zip"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Create the backup using zip
zip -r "$BACKUP_FILE" "$SOURCE_DIR" && echo "Backup created: $BACKUP_FILE"
# If zip fails, show error
if [ $? -ne 0 ]; then
    echo "Error: Backup failed."
    exit 1
fi
Save and exit the editor (Ctrl+X, then Y in nano).

Make the script executable:

chmod +x backup_script.sh
