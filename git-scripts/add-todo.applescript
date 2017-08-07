on run argv
    set tagName to item 1 of argv
    set todoName to item 2 of argv

    tell application "Things3"
        set newTodo to make new to do with properties {name:todoName}
        set tag names of newTodo to tagName
    end tell

end run
