#!/bin/sh

# Common functions


# Temporary variable for current directory save
CURRENT_DIR_SAVE=""

cd_safe()
{
  # Save current directory
  CURRENT_DIR_SAVE=$(pwd)

  cd $1
}

restore_directory()
{
  # Restore saved by cd_safe() directory
  cd $CURRENT_DIR_SAVE
}

print_help()
{
    HELP_MESSAGE="$1"
    SCRIPT_ARGUMENT="$2"

    if [ "$SCRIPT_ARGUMENT" == "" ]
    then
        echo "$HELP_MESSAGE"
        exit 1
    fi
}
