set -e

if ! git symbolic-ref HEAD >/dev/null 2>&1; then
  echo >&2 'Cannot push from detached HEAD'
  false
else
  options="$GIT_PUSH_OPTIONS"
  if [ "$1" == "--no-verify" ]; then
    options="$options --no-verify"
    shift
  elif [ "$NO_VERIFY" == "1" ]; then
    options="$options --no-verify"
  fi
  branch=$(git rev-parse --abbrev-ref HEAD)
  remote=${1-origin}
  echo >&2 "git push $options --set-upstream $remote $branch"
  git push $options --set-upstream $remote $branch && echo >/dev/null
fi
