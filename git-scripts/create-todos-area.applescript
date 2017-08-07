on run argv
    set tagName to item 1 of argv

    tell application "Things3"
        set newTag to make new tag with properties {name:tagName}
        return name of newTag
    end tell

end run
