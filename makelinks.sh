#!/bin/bash

script="/usr/local/scripts"
bin="/usr/local/bin"
apps="$HOME/Apps"

ln -sv $script/change_all_desktops.sh   $bin/changebackground
ln -sv $script/change_dns.sh            $bin/changedns
ln -sv $script/compare_md5.sh           $bin/compare-md5
ln -sv $script/confirm.sh               $bin/confirm
ln -sv $script/file_regex.sh            $bin/file-regex
ln -sv $script/git_single_branch.sh     $bin/git-single-branch
ln -sv $script/git_delete_branches.sh   $bin/git-delete-branches
ln -sv $script/git_rename.sh            $bin/git-rename
ln -sv $script/handbrake_batch.sh       $bin/handbrake-batch
ln -sv $script/is_symlink.sh            $bin/issymlink
ln -sv $script/make_bootable.sh         $bin/make-bootable
ln -sv $script/number_of_files.sh       $bin/numfiles
ln -sv $script/debian_rename            $bin/rename
ln -sv $apps/todo.sh                    $bin/
ln -sv $apps/HandBrakeCLI               $bin/
ln -sv $apps/mvim                       $bin/
