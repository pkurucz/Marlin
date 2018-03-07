#!/bin/bash
CURRENT_DIR=`pwd`/
rm tags cscope* 2> /dev/null
echo ----- Building Tags -----
ctags -R $CURRENT_DIR

echo ----- Building cscope -----
find $CURRENT_DIR -iname "*.[ch]" | awk '{print "\""$0"\""}' > cscope.in
find $CURRENT_DIR -iname "*.cc" | awk '{print "\""$0"\""}' >> cscope.in
find $CURRENT_DIR -iname "*.cpp" | awk '{print "\""$0"\""}' >> cscope.in
cscope -b -k -q -u -i cscope.in

echo ----- Done -----
