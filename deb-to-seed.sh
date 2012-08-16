#!/bin/bash

# Script for deb packages list adding to the seed file
# Usage: deb-to-seed.sh <seed-file> <deb-files-path>

SEED_FILE="$1"
DEB_PATH="$2"

# Add install packages to preseed file
local FILES=$(ls $DEB_PATH | grep "\.deb$")

echo "d-i pkgsel/include string \\" >> "$SEED_FILE"

for FILE in $FILES ; do
  echo "${FILE%%_*} \\" >> "$SEED_FILE"
done

# Remove "\" symbol for last package
sed "s/$_\/${FILE%%_*}/" "$SEED_FILE" > "$SEED_FILE.tmp"
mv "$SEED_FILE.tmp" "$SEED_FILE"

exit 0
