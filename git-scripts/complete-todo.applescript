on run argv
    set tagName to item 1 of argv
    set todoNum to item 2 of argv

    tell application "Things3"
        set todos to to dos of tag tagName
        set todoToComplete to item todoNum of todos
        set status of todoToComplete to completed
    end tell

end run
