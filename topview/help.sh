#!/bin/bash
python3 -i <(
    grep import gl.py |
    sed 's/^ *//g' |
    cat
)
