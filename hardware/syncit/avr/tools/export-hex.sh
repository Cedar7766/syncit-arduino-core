#!/bin/sh
set -e

SRC="$1"
DEST_DIR="$2"
NAME="$3"

if [ -z "$SRC" ] || [ -z "$DEST_DIR" ] || [ -z "$NAME" ]; then
  exit 0
fi

if [ ! -f "$SRC" ]; then
  exit 0
fi
echo "Exporting to $DEST_DIR" 
mkdir -p "$DEST_DIR"
cp "$SRC" "$DEST_DIR/${NAME}_noboot.hex"
