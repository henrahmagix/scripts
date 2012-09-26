#!/bin/bash
# script to change all desktop backgrounds
# https://discussions.apple.com/message/18805586#18805586
# https://applehelpwriter.wordpress.com/category/mountain-lion/

# Exit if no image provided.
# @TODO check for file extension and file existence?
if [[ $# -lt 1 ]]; then
	echo "No image path provided."
	exit 1
fi

# Get dir of image file.
cd `dirname $1`
DIR=`pwd`
FILE=`basename $1`
IMGPATH=$DIR/$FILE

[ ! -e $FILE ] && echo "$FILE does not exist" && exit 1

echo "Change all desktop backgrounds to $IMGPATH"

defaults write com.apple.desktop Background "{default = {ImageFilePath="$IMGPATH"; };}"; killall Dock;

