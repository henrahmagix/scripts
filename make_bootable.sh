#!/bin/bash
usage="usage: $0 file"
[ $# -ne 1 ] && echo $usage && exit 1
file=$1
newfile=${file%.*}.img
echo "Converting $file to $newfile..."
hdiutil convert -format UDRW -o $newfile $file
echo "Removing .dmg extension..."
mv $newfile.dmg $newfile
