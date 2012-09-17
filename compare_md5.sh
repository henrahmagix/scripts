#Produces a diff output
file=$1
md5=$2
md5 $file | sed 's/[^=]*= //' | tr "[:lower:]" "[:upper:]" | diff $md5 -
