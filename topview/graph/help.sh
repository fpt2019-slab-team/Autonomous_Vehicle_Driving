#!/bin/bash
python3 -i <(
    grep import subplot.py |
    sed 's/^ *//g' |
    cat
)
