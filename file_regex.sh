#!/usr/bin/env bash
ALL=""
IN_PLACE="-i"
CONFIRMED=""
opts="aty-"
while getopts $opts option; do
    case $option in
        a)
            ALL="-a"
            ;;
        t)
            IN_PLACE=""
            ;;
        y)
            CONFIRMED="1"
            ;;
    esac
done
shift $((OPTIND-1))

find="$1"
shift
replace="$1"
shift

confirm_msg="Replace $find with $replace?"
if [[ -n "$*" ]]; then
    confirm_msg="Replace \"$find\" with \"$replace\" in $*?"
fi

source confirm.sh
([[ $CONFIRMED == "1" ]] || confirm "$confirm_msg") && ag -l --no-color $ALL "$find" -- "$@" | xargs -I file perl -0777 -p $IN_PLACE -e "s,$find,$replace,sg" "file"
