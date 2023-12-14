#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 -[a|s|m|d] num1 num2"
    exit 1
fi

flag="$1"
num_1="$2"
num_2="$3"

case "$flag" in
    "-a") result=$(echo "$num_1 + $num_2" | bc);;
    "-s") result=$(echo "$num_1 - $num_2" | bc);;
    "-m") result=$(echo "$num_1 * $num_2" | bc);;
    "-d") result=$(echo "scale=2; $num_1 / $num_2" | bc);;
    *) echo "Invalid flag"; exit 1;;
esac

echo $result