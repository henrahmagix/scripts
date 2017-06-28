#!/bin/bash

script="/usr/local/scripts"
bin="/usr/local/bin"
apps="$HOME/Apps"

link () {
    if [ -f $1 ]; then
        ln -sv $1 $2
    else
        echo "No script to link: $1"
    fi
}

link $script/change_all_desktops.sh       $bin/changebackground
link $script/change_dns.sh                $bin/changedns
link $script/compare_md5.sh               $bin/compare-md5
link $script/confirm.sh                   $bin/
link $script/file_regex.sh                $bin/file-regex
link $script/git_single_branch.sh         $bin/git-single-branch
link $script/git_delete_branches.sh       $bin/git-delete-branches
link $script/git_rename.sh                $bin/git-rename
link $script/git-diff-ignore-reorder.sh   $bin/git-diff-ignore-reorder
link $script/handbrake_batch.sh           $bin/handbrake-batch
link $script/is_symlink.sh                $bin/issymlink
link $script/make_bootable.sh             $bin/make-bootable
link $script/number_of_files.sh           $bin/numfiles
link $script/debian_rename                $bin/rename
link $apps/todo.sh                        $bin/
link $apps/HandBrakeCLI                   $bin/
link $apps/mvim                           $bin/
