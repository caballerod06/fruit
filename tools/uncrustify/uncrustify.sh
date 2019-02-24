#!/bin/sh

PROJ_DIR=`eval "cd ../../;pwd;cd - > /dev/null"`   # project root directory
SCRIPT_RELATIVE_DIR=`dirname "$0"`                 # current directory (tools/uncrustify)
SRC_DIR=src                                        # source code directory 
UT_DIR=unittest                                    # unittest code directory

ln -s $SCRIPT_RELATIVE_DIR/config.cfg

find firmware ! -path "*flex*" -iname "*.c"  > sourcefiles.txt
find firmware ! -path "*flex*" -iname '*.h' >> sourcefiles.txt
find firmware ! -path "*flex*" -iname "*.cpp"  >> sourcefiles.txt

#Replaces original files.
uncrustify -c config.cfg --no-backup -F sourcefiles.txt

# For testing purposes, not deleting the original files.
# uncrustify -c config.cfg --suffix.out -F sourcefiles.txt

unlink config.cfg
rm -f sourcefiles.txt
