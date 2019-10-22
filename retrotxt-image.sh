#!/usr/bin/env bash
first="$(echo $1 | sed 's/ /+/g')"
second="$(echo $2 | sed 's/ /+/g')"
third="$(echo $3 | sed 's/ /+/g')"
bg=$(perl -e 'print int(rand(5))+1')
txt=$(perl -e 'print int(rand(4))+1')

>&2 echo "Creating..."
link="$(curl --silent -L -X POST --data "current-category=all_effects&bcg=$bg&txt=$txt&text1=$first&text2=$second&text3=$third" https://photofunia.com/categories/all_effects/retro-wave?server=1 | ag -o '(?<=href=")[^"]+' | ag -Q '.jpg' | head -1)"

>&2 echo "Downloading..."
curl --silent "$link"
>&2 echo "$link"
