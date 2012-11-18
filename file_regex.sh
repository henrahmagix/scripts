INPLACE="-i"
if [[ $1 =~ ^-t$ ]] || [[ $1 =~ ^--test$ ]]; then
    shift
    INPLACE=""
fi
ack -H --nocolor "$1" | cut -d":" -f1 | xargs -I file perl -p `echo $INPLACE` -e "s,$1,$2," "file"
