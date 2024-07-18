#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 {add|delete|modify} [username] [new_username]"
    exit 1
}

# Function to add a new user
add_user() {
    USERNAME=$1
    if id "$USERNAME" &>/dev/null; then
        echo "User '$USERNAME' already exists."
    else
        sudo useradd "$USERNAME"
        if [ $? -eq 0 ]; then
            echo "User '$USERNAME' has been added."
        else
            echo "Failed to add user '$USERNAME'."
        fi
    fi
}

# Function to delete an existing user
delete_user() {
    USERNAME=$1
    if id "$USERNAME" &>/dev/null; then
        sudo userdel "$USERNAME"
        if [ $? -eq 0 ]; then
            echo "User '$USERNAME' has been deleted."
        else
            echo "Failed to delete user '$USERNAME'."
        fi
    else
        echo "User '$USERNAME' does not exist."
    fi
}

# Function to modify an existing user
modify_user() {
    OLD_USERNAME=$1
    NEW_USERNAME=$2
    if id "$OLD_USERNAME" &>/dev/null; then
        if id "$NEW_USERNAME" &>/dev/null; then
            echo "User '$NEW_USERNAME' already exists."
        else
            sudo usermod -l "$NEW_USERNAME" "$OLD_USERNAME"
            if [ $? -eq 0 ]; then
                echo "User '$OLD_USERNAME' has been renamed to '$NEW_USERNAME'."
            else
                echo "Failed to rename user '$OLD_USERNAME' to '$NEW_USERNAME'."
            fi
        fi
    else
        echo "User '$OLD_USERNAME' does not exist."
    fi
}

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

# Check if at least two arguments are provided
if [ $# -lt 2 ]; then
    usage
fi

# Parse the command and arguments
COMMAND=$1
USERNAME=$2
NEW_USERNAME=$3

# Execute the appropriate function based on the command
case $COMMAND in
    add)
        add_user "$USERNAME"
        ;;
    delete)
        delete_user "$USERNAME"
        ;;
    modify)
        if [ -z "$NEW_USERNAME" ]; then
            usage
        fi
        modify_user "$USERNAME" "$NEW_USERNAME"
        ;;
    *)
        usage
        ;;
esac
