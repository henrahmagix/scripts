#!/bin/bash

script="/usr/local/scripts"
bin="/usr/local/bin"
apps="$HOME/Apps"

ln -s $script/debian_rename $bin/rename
ln -s $script/handbrake_batch.sh $bin/handbrake-batch
ln -s $script/number_of_files.sh $bin/numfiles
ln -s $script/change_all_desktops.sh $bin/changebackground
ln -s $apps/todo.sh $bin/
ln -s $apps/HandBrakeCLI $bin/
ln -s $apps/mvim $bin/
