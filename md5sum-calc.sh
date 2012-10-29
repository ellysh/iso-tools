#!/bin/bash

# Script for md5 sum calculation

. src/functions.sh

print_help "Usage: md5sum-calc.sh <source-path>" "$1"

SOURCE_PATH="$1"
MD5SUM_FILE="md5sum.txt"
SKIP_FILES="$MD5SUM_FILE \
            isolinux.bin
            boot.cat"

get_skip_files()
{
  local RETURN=""

  for FILE in $SKIP_FILES ; do
    RETURN+="-name $FILE -o "
  done

  # Remove the last "-o" substring
  echo ${RETURN:0:${#RETURN}-3}
}

cd_safe "$SOURCE_PATH"

find . -type f -not \( $(get_skip_files) \) -print0 | xargs -0 md5sum > "$SOURCE_PATH"/"$MD5SUM_FILE"

restore_directory
