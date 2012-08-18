#!/bin/bash

script="$HENRY_CODEDIR/scripts"
bin="/usr/local/bin"
apps="$HOME/Apps"

ln -f -s $script/debian_rename $bin/rename
ln -f -s $script/handbrake_batch.sh $bin/handbrake-batch
ln -f -s $script/number_of_files.sh $bin/numfiles
ln -f -s $script/change_all_desktops.sh $bin/chbg
ln -f -s $apps/todo.sh $bin/
ln -f -s $apps/HandBrakeCLI $bin/
ln -f -s $apps/mvim $bin
