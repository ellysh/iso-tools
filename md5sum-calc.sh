#!/bin/bash

# Script for md5 sum calculation

. src/functions.sh

print_help "Usage: md5sum-calc.sh <iso-files-path>" "$1"

ISO_FILES_PATH="$1"
MD5SUM_FILE="md5sum.txt"
SKIP_FILES="$MD5SUM_FILE \
            isolinux.bin"

get_skip_files()
{
  local RETURN=""

  for FILE in $SKIP_FILES ; do
    RETURN+="-name $FILE -o "
  done

  # Remove the last "-o" substring
  echo ${RETURN:0:${#RETURN}-3}
}

find "$ISO_FILES_PATH" -type f -not \( $(get_skip_files) \) -print0 | xargs -0 md5sum > "$ISO_FILES_PATH"/"$MD5SUM_FILE"
