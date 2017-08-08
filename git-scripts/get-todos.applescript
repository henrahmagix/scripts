on run argv
    set tagName to item 1 of argv

    tell application "Things3"
        set todos to to dos of tag tagName
        set todoNames to "" as text
        repeat with n from 1 to count of todos
            set todo to item n of todos
            set todoStatus to " [ ] "
            if status of todo is completed then
                set todoStatus to " [x] "
            end if
            set todoNames to todoNames & n & todoStatus & name of todo & linefeed
        end repeat
        return todoNames
    end tell

end run
