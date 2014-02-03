# See http://stackoverflow.com/a/18359250/3150057 for awk branch parsing.
LOCAL_HEADS=$(git branch | awk -F ' +' '! /\(no branch\)/ {print $2}')
REMOTE_HEADS=$(git branch -r | awk -F ' +' '! /\(no branch\)/ {print "^"$2}')

# -- is needed at the end to tell git we are only giving it revisions.
# List all commits not on the remote.
git rev-list $REMOTE_HEADS $LOCAL_HEADS --
# Create a bundle of all the above commits.
git bundle create my-backup-today.bundle $REMOTE_HEADS $LOCAL_HEADS --
