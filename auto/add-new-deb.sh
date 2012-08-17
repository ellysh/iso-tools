#!/bin/bash

# Script for automation deb packages adding to existing iso image

. ../src/functions.sh

SOURCE_PATH="/home/elly/Projects/uso-iso-set3"
SEED_FILE="$SOURCE_PATH/preseed/uso2.seed"
DEB_PATH="$SOURCE_PATH/spetstekhnika/binary/"
ISO_FILE="/home/elly/Projects/ubuntu.iso"

cd_safe ".."

deb-to-seed.sh "$SEED_FILE" "$DEB_PATH"

indexing-deb.sh "$DEB_PATH"

md5sum-calc.sh "$SOURCE_PATH"

create-iso.sh "$ISO_FILE" "$SOURCE_PATH"

restore_directory
