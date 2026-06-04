#!/usr/bin/env bash
lsof -PiTCP -sTCP:LISTEN | while IFS= read -r line; do
  echo "$line"
  pid="$(echo "$line" | tr -s ' ' | cut -d' ' -f2)"
  [[ "$pid" =~ [0-9] ]] && ps -p "$pid" | sed '1d'
done
