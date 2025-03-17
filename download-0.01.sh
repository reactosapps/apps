#!/bin/bash

# Settings: List of files to download
FILELIST=files-0.01.txt
FILEURL=https://github.com/reactosapps/apps/releases/download/0.01/

# Set count of files
COUNTER=1
MAXFILECOUNT=$(cat $FILELIST | wc -l)

# Create download directory
mkdir download

# Changing to download directory
cd download

# Download files
while read -r FILENAME
do
  echo "Downloading file ${COUNTER} / ${MAXFILECOUNT}:"
  wget -c "$FILEURL$FILENAME"
  COUNTER=$((COUNTER+1))
done < ../$FILELIST

# Change to parent directory
cd ..
