on run argv
    set tagName to item 1 of argv

    tell application "Things3"
        set todos to to dos of tag tagName
        set todoNames to "" as text
        repeat with todo in todos
            set todoNames to todoNames & "- " & name of todo & linefeed
        end repeat
        return todoNames
    end tell

end run
