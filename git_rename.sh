[ $# -lt 3 ] && echo "usage: $0 pattern replacestring files [...]" && exit 1
pattern=$1
shift
replace=$1
shift
for x in $@
do
    git mv "${x}" "${x/$pattern/$replace}"
done
