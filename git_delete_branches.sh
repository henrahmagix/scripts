for branch in $@
do
	git branch --delete $branch
	git push origin :$branch
done
