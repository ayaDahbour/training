
#!/bin/bash

# !/bin/bash

MY_VAR = Hello, World

echo `MY_VAR`

for i in 1 2 3
  echo "Number: $i"

FILE_NAME=some file with spaces.txt
if [ -f $FILE_NAME ]; then
    echo "File exists."
else
    echo "File does not exist."
fi

if [ -d "/some/nonexistent/dir" ]; then
    echo "Directory exists."
    else
    echo "Directory does not exist."
fi

unavailable_command --version

CURRENT_DATE=$(date +%Y-%m-%d)

echo "Some content" > /etc/readonlyfile

USER_INPUT="ls -l"
eval $USER_INPUT
