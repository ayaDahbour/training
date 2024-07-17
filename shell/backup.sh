#!/bin/bash

# Define source and destination directories
Source="/home/aya/Desktop/task1/source"
Destination="/home/aya/Desktop/task1"

# Check if source directory exists
if [ ! -d "$Source" ]; then
  echo "Source directory does not exist: $Source"
  exit 1
fi

# Check if destination directory exists, create if it doesn't
if [ ! -d "$Destination" ]; then
  echo "Destination directory does not exist, creating: $Destination"
  mkdir -p "$Destination"
fi

# Copy all .txt files from source to destination
cp "$Source"/*.txt "$Destination"

# Verify the copy operation
if [ $? -eq 0 ]; then
  echo "Backup successful! All .txt files have been copied from $Source to $Destination"
else
  echo "Backup failed!"
  exit 1
fi
