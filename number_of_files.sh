#!/bin/bash
# Find total number of non-hidden files in the current directory and below.
dir=`pwd`
num=`find $dir -type f ! -regex ".*/\..*" | wc -l`
echo $dir
echo $num
