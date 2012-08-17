#!/bin/bash

# Script for indexing deb packages

. src/functions.sh

print_help "Usage: indexing-deb.sh <deb-files-path>" "$1"

DEB_PATH="$1"

dpkg-scanpackages -m "$DEB_PATH" /dev/null | gzip -9c > "$DEB_PATH"/Packages.gz
