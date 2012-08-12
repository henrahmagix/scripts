#/bin/bash
# A Source shortcut to quickly refresh open sessions with new stuff.
files=( "/Users/henry/.bash_profile" )
for file in "${files[@]}"
do
  source "$file"
done
