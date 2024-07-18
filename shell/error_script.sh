#!/bin/bash

echo "Starting script..."


MY_VAR="Hello, World" # Missed double quotes

# Using "" not ''
echo "$MY_VAR"

echo "Entering for loop..."

for i in 1 2 3; 
do # Missed "do"
  echo "Number: $i"
done
echo "For loop completed."

# Quoting file name
FILE_NAME="aya dahbour.txt"
echo "FILE_NAME is set to: $FILE_NAME"

if [ -f "$FILE_NAME" ]; then # "$FILE_NAME"
    echo "File exists."
else
    echo "File does not exist."
fi

# DIR_PATH assignment 
DIR_PATH="/home/aya/Desktop/task11"
echo "DIR_PATH is set to: $DIR_PATH"

if [ -d "$DIR_PATH" ]; then
    echo "Directory exists."
else
    echo "Directory does not exist."
fi

echo "Running version..."
lsb_release -a

CURRENT_DATE=$(date +%Y-%m-%d)
echo "CURRENT_DATE is set to: $CURRENT_DATE"

# Writing to a safe location
echo "Attempting to write to a file..."
echo "Some content" > ~/test.txt 
echo "Write operation completed."

# Evaluating user input command
USER_INPUT="ls -l"
echo "USER_INPUT is set to: $USER_INPUT"
eval $USER_INPUT

echo "Script completed."
