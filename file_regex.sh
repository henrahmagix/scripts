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

find="$1"
shift
replace="$1"
shift

confirm_msg="Replace $find with $replace?"
if [[ -n "$@" ]]; then
    confirm_msg="Replace '$find' with '$replace' in $@?"
fi

source confirm.sh
confirm $confirm_msg && ag -l --no-color `echo $ALL` "$find" "$@" | xargs -I file perl -0777 -p `echo $INPLACE` -e "s,$find,$replace,sg" "file"
