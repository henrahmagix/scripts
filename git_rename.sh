[ $# -lt 3 ] && echo "usage: $0 pattern replacestring files [...]" && exit 1
source `which confirm.sh`
pattern=$1
shift
replace=$1
shift
for x in $@
do
    confirm "rename ${x} --> ${x/$pattern/$replace} ?" && g mv "${x}" "${x/$pattern/$replace}"
done
