#!/bin/bash
python3 -i <(
    grep import line.py |
    sed 's/^ *//g' |
    cat
)
