#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 {add|delete|modify} [username] [new_username]"
    exit 1
}

# Function to add a new user
add_user() {
    username=$1
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
    else
        sudo useradd "$username"
        if [ $? -eq 0 ]; then  # Check the exit status 
            echo "User '$username' has been added."
        else
            echo "Failed to add user '$username'."
        fi
    fi
}

# Function to delete an existing user
delete_user() {
    username=$1
    if id "$username" &>/dev/null; then
        sudo userdel "$username"
        if [ $? -eq 0 ]; then
            echo "User '$username' has been deleted."
        else
            echo "Failed to delete user '$username'."
        fi
    else
        echo "User '$username' does not exist."
    fi
}

# Function to modify an existing user
modify_user() {
    old_username=$1
    new_username=$2
    if id "$old_username" &>/dev/null; then
        if id "$new_username" &>/dev/null; then
            echo "User '$new_username' already exists."
        else
            sudo usermod -l "$new_username" "$old_username"
            if [ $? -eq 0 ]; then
                echo "User '$old_username' has been renamed to '$new_username'."
            else
                echo "Failed to rename user '$old_username' to '$new_username'."
            fi
        fi
    else
        echo "User '$old_username' does not exist."
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
command=$1
username=$2
new_username=$3

# Execute the appropriate function based on the command
case $COMMAND in
    add)
        add_user "$username"
        ;;
    delete)
        delete_user "$username"
        ;;
    modify)
        if [ -z "$new_username" ]; then
            usage
        fi
        modify_user "$username" "$new_username"
        ;;
    *)
        usage
        ;;
esac
