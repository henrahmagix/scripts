#!/bin/bash
#
# Calls handbrake_batch.sh with custom options, including removing .m4v
if [ $# -ne 2 ]
then
  echo "Usage: vid_lowres.sh <source> <dest>"
  echo
  exit 1
fi

handbrakebatch -x320 -y180 -r25 -m -i $1 -o "$2"