#!/bin/bash

REGEX=$(
    (echo vao; ls *.py) |
    awk -v FS=. -v ORS='|' '{print $1}' |
    sed -e 's/^/(/' -e 's/.$/)/' |
    cat
)
#echo "$REGEX";exit

IMPORT=$(
    grep -h import gl.py |
    cat
)
#echo "$IMPORT";exit

PY=$(
    echo "$IMPORT" |
    egrep -v "^from $REGEX" |
    sed 's/^ *//g' |
    cat
)
#echo "$PY";exit

python3 -i <(
    echo "$PY"
)
