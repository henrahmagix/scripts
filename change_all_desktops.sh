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

echo "Change all desktop backgrounds to $1"

defaults write com.apple.desktop Background "{default = {ImageFilePath="$1"; };}"; killall Dock;

