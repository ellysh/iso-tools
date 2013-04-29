#!/bin/bash

# Script for automation deb packages adding to existing iso image

. ../src/functions.sh

HOME_PATH="/home/elly"
SOURCE_PATH="$HOME_PATH/Projects/uso-iso-source/iso"
SEED_FILE="$SOURCE_PATH/preseed/uso2.seed"
DEB_PATH="$SOURCE_PATH/spetstekhnika/binary/"
ISO_FILE="$HOME_PATH/Projects/ubuntu.iso"

cd_safe ".."

#./deb-to-seed.sh "$SEED_FILE" "$DEB_PATH"

#./indexing-deb.sh "$DEB_PATH"

./md5sum-calc.sh "$SOURCE_PATH"

./create-iso.sh "$ISO_FILE" "$SOURCE_PATH"

restore_directory
