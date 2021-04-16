#!/usr/bin/env bash
while IFS= read -r line; do
  echo "$line"
  pid="$(echo "$line" | tr -s ' ' | cut -d' ' -f2)"
  ps -p $pid | sed '1d'
done <<< $(lsof -PiTCP -sTCP:LISTEN)
