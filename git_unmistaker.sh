[[ $@ -lt 2 ]] && echo "Not enough arguements" && exit 1
exit 1

commit=$1
branch=$2

# Create new branch with commits on master.
git branch $branch

# Reset master back to commit. git pull to revert this.
git reset --hard HEAD:$commit

# Check you're in the right place.
git whatchanged

# Checkout and push the new branch.
echo -n 'Looks good?'
read -e confirm
[[ "$confirm" =~ ^[yY](es|ES)?$ ]] && echo yes && exit 1
echo no
# git checkout $branch && git push --set-upstream origin $branch
