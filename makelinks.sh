#!/bin/bash

# Get the pwd of this script.
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

script="$DIR"
bin="$HOME/bin"
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
link $script/dep_from_symlinked.sh        $bin/dep_from_symlinked
link $script/file_regex.sh                $bin/file-regex
link $script/git_single_branch.sh         $bin/git-single-branch
link $script/gcloud_show_build_failure.sh $bin/build-failure
link $script/git_delete_branches.sh       $bin/git-delete-branches
link $script/git_rename.sh                $bin/git-rename
link $script/git_push_upstream.sh         $bin/git-push-upstream
link $script/git-diff-ignore-reorder.sh   $bin/git-diff-ignore-reorder
link $script/hub_override.sh              $bin/hub-override
link $script/handbrake_batch.sh           $bin/handbrake-batch
link $script/is_symlink.sh                $bin/issymlink
link $script/make_bootable.sh             $bin/make-bootable
link $script/number_of_files.sh           $bin/numfiles
link $script/newproject.sh                $bin/newproject
link $script/debian_rename                $bin/rename
link $script/retrotxt-image-clipboard.sh  $bin/retro

link $script/git-scripts/init-git-scripts $bin/init-git-scripts

link $script/list_open_ports.sh $bin/list_open_ports
