#!/bin/bash

# Script for iso image creating
# Usage: create-iso.sh <iso-filename> <source-files-path>

ISO_NAME="$1"
SOURCE_PATH="$2"

mkisofs -o "$ISO_NAME" -b isolinux/isolinux.bin -c boot.cat -no-emul-boot \
        -boot-load-size 4 -boot-info-table -J -hide-rr-moved -R "$SOURCE_PATH"

exit 0
