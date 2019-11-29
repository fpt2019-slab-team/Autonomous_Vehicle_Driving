#!/bin/bash
(
    grep import line.py |
    sed 's/^ *//g' |
    cat
    echo import driver
    echo 'DRIVER = driver.Driver(IS_KALMAN=False,IS_SIMULATION=True)'
) > tmp.py

python3 -i tmp.py
