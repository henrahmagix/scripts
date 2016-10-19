ALL=""
INPLACE="-i"
opts="at-"
while getopts $opts option; do
    case $option in
        a)
            ALL="-a"
            ;;
        t)
            INPLACE=""
            ;;
    esac
done
shift $((OPTIND-1))

source confirm.sh
confirm "Replace $1 with $2?" && ag -H --nocolor `echo $ALL` "$1" | cut -d":" -f1 | xargs -I file perl -p `echo $INPLACE` -e "s,$1,$2,g" "file"
