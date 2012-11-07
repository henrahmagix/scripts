ack -H --nocolor "$1" | cut -d":" -f1 | xargs perl -pi -e "s,$1,$2,"
