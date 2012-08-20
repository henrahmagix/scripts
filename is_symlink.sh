#!/bin/bash
# Is the passed file a symlink?
[ $# -ne 1 ] && echo "No file passed" && exit 1
[[ `ls -l $1` =~ ^l ]] && echo "$1 is a symlink" && exit 1
echo "Nonono... no"
