#!/usr/bin/env bash
~/Code/scripts/retrotxt-image.sh "$@" > /tmp/retro.jpg && osascript -e 'set the clipboard to (read (POSIX file "/tmp/retro.jpg") as JPEG picture)'
