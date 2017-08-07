on run argv
    set tagName to item 1 of argv

    tell application "Things3"
        set newTag to make new tag with properties {name:tagName}
        set parent tag of newTag to tag "Work"
        return name of newTag
    end tell

end run
