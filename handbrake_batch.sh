#!/bin/bash
#
# Run HandBrakeCLI, with fps $RATE and dimensions $WIDTH * $HEIGHT, over all files contained in $SOURCE directory and place them in
# $DEST directory with extension $FILE
#
# The following is from http://www.surlyjake.com/2010/08/script-to-run-handbrake-recursively-through-a-folder-tree/PRESET="iPhone & iPod Touch"
#if [ -z "$1" ] ; then
#	TRANSCODEDIR="."
#else
#TRANSCODEDIR="$1"
#fi
#find "$TRANSCODEDIR"/* -type f -exec bash -c 'HandBrakeCLI -i "$1" -o "${1%\.*}".mp4 --preset="$PRESET"' __ {} \;

usage()
{
cat << EOF
usage: $0 options

This script runs HandBrakeCLI over every file in the current folder, or supplied argument -i, with the following options.

MANDATORY ARGS:
  -x	Width
  -y	Height

OPTIONS:
  -f	Destination file extension, default is "m4v". (Not yet available)
  -h	Show this message
  -i	Source folder, default is current folder.
  -o	Destination folder, default is current folder.
  -n    Number of files to iterate over. (Not yet available)
  -r	Use custom FPS rate.
  -m    Flag to rename file after conversion to remove added extension '.m4v'
EOF
}

nonumyet()
{
cat << EOF
-n is not yet available as an argument.
handbrake_batch.sh will run over every file in the source folder.
EOF
}

nofileyet()
{
cat << EOF
-f is not yet available as an argument.
HandBrakeCLI will only accept '.m4v' or '.mp4' as file extensions.
Eventually, this script will allow a file extension argument, and will implement
it by renaming the files after HandBrakeCLI has run.
EOF
}

# Setup vars
SOURCE=
DEST=
FILE=
DOFILE=
WIDTH=
HEIGHT=
ISRATE=
RATE=
NUM=
RENAME=

# What we used to use. Now we use `ls`.
getfind()
{
  find "$SOURCE"/* -type f | sed "s:^\.:$DEST:g"
}

# Get all options passed to this script. Optionally print the help text if -h supplied, or no arguments.
while getopts "hi:o:f:x:y:r:n:m" OPTION
do
  case $OPTION in
    h)
	usage
	exit 1
	;;
    i)
	SOURCE=$OPTARG
	;;
    o)
	DEST=$OPTARG
	;;
    f)
	#FILE=$OPTARG
    nofileyet
    exit
	;;
    x)
	WIDTH=$OPTARG
	;;
    y)
	HEIGHT=$OPTARG
	;;
    r)
	RATE=$OPTARG
	;;
    n)
	#NUM=$OPTARG
    nonumyet
    exit
	;;
    m)
    RENAME=1
    ;;
    ?)
	usage
	exit
	;;
  esac
done

# These are our required arguments. If not set, print the help text and exit.
if [[ -z $WIDTH ]] || [[ -z $HEIGHT ]]
then
  usage
  exit 1
fi

# Start setting defaults and other variables based upon the arguments supplied.
# Set source directory.
if [ -z "$SOURCE" ]
then
  SOURCE="./"
fi

# Set destination directory.
if [ -z "$DEST" ]
then
  DEST="./"
fi

# Set file extension, and a flag to check whether to change the filename - see note below.
# NOTE: Currently, HandBrakeCLI will only output files with extension '.m4v' or '.mp4'.
# Until it is allowed to set the final filename, we have the convenience of '.m4v'
# being added on to the original filename by default, thus preserving it.
if [ -z $FILE ]
then
  DOFILE=""
  FILE="m4v"
else
  DOFILE="1"
fi

# Set file rate, FPS. If $RATE isn't set, "$ISRATE""$RATE" on the commandline will
# return as an empty string, thus not setting anything.
if [ -z $RATE ]
  then
  ISRATE=""
else
  ISRATE="-r"
fi

# Notify the user of the conversion details.
echo "The following files will be converted:"
for i in `ls $SOURCE`
do
{
  # If the extension added by Handbrake is to be removed after conversion, show here.
  if [ $RENAME ]
  then
    echo "${SOURCE}${i}  to  ${DEST}${i} at ${WIDTH}x${HEIGHT}, ${RATE}fps"
  else
    echo "${SOURCE}${i}  to  ${DEST}${i}.${FILE} at ${WIDTH}x${HEIGHT}, ${RATE}fps"
  fi
}
done

# Confirm the process.
echo "Continue (y/n)?"
read CONT
if [[ ! "$CONT" =~ ^[Yy]$ ]]
then
  echo "Exit"
  exit 1
fi
# Empty echo provides new line.
echo

# Now call HandBrakeCLI for every file in $SOURCE dir with the options set.
for i in `ls $SOURCE`
do
{
  HandBrakeCLI -i "$SOURCE""$i" -o "$DEST""$i"."$FILE" --width="$WIDTH" --height="$HEIGHT" "$ISRATE""$RATE"
  if [ $RENAME ]
  then
    mv -i "$DEST""$i"."$FILE" "$DEST""$i"
  fi
}
done

# Now remove the last extension from all the files in $DEST.
#if [ $RENAME ]
#then
#  find "$DEST" -type f -exec bash -c 'mv "$1" "${1%\.m4v}"' __ {} \;
#fi

# Post-run commands
#if [ -z $DOFILE ]
#then
#  for i in `ls $DEST`
#  do
#  {
#    #Change filename here
#    echo "Not used yet"
#  }
#  done
#fi

exit

