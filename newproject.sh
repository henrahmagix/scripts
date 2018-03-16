#!/usr/bin/env bash

if [ -z $1 ]; then
    echo "Folder name is required"
    exit 1
fi

dir=$1
title="$(echo $dir | sed -e 's/-/ /g' | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1')"

mkdir $dir
cd $dir
echo "# $title" > README.md
git init
git add .
git commit -m 'Initial commit'

subl .
subl README.md
