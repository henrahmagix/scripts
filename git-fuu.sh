#!/bin/bash

function git-fuu() {
    if [[ "$1" =~ ^f+uu+$ ]]; then
        git reset --hard HEAD^
    else
        git $@
    fi
}
