#!/bin/sh -l

# $1 should be the directory containing the items you want to compress
WORKSPACE_DIR="/github/workspace/"
DIR="${WORKSPACE_DIR}${1}"

ls

for FILE_EXT in '*.js' '*.css' '*.html'
do
	echo $FILE_EXT
	echo $DIR
	FILES=`find $DIR -type f -path $FILE_EXT`
	if [ -z "$FILES" ]
	then
		echo "no $FILE_EXT files found"
	else
		echo $FILES | xargs /brotli -v --
	fi
done
