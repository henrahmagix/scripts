#!/usr/bin/env bash
if [ "$1" == "pr" ]; then
    # New hub command `pr` has broken my `pr` alias, since it will always prefer
    # it's own command over a git alias. This is broken until the new `pr`
    # command gets a `create` command.
    # See https://github.com/github/hub/issues/1536
    hub pull-request
else
    hub "$@"
fi
