# Setup a single branch of a repo by not getting all remote refs (all branches and tags).
# See second answer at http://stackoverflow.com/questions/1778088/how-to-clone-a-single-branch-in-git

USAGE="usage: $0 remote_repo branch"
[ $# -lt 2 ] && echo $USAGE && exit 1
REMOTE_REPO=$1
BRANCH=$2

git init
git remote add -t $BRANCH -f origin $REMOTE_REPO
git checkout $BRANCH

# Get all submodules if applicable.
git submodule update --init --recursive
