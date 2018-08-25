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

cat > $dir.sublime-project << EOF
{
    "folders":
    [
        {
            "path": "."
        }
    ],
    "settings": {
        "translate_tabs_to_spaces": true
    }
}
EOF

if [ "$2" == "go" ]; then
    cat > $dir.sublime-project << EOF
{
    "folders":
    [
        {
            "path": "."
        }
    ],
    "settings":
    {
        "filename_filter": "\\\\.(go)$",
        "build_on_save": 1
    }
}
EOF
fi

subl $dir.sublime-project
subl README.md
