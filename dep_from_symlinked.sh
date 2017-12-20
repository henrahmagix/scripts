if ! [[ "$PWD" =~ "go/src" ]]; then
    (cd $(pwd -P) && dep $@)
else
    dep $@
fi
