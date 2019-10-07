#!/bin/bash
python3 -i <(
    grep import graph.py |
    sed 's/^ *//g' |
    cat
)
