#!/bin/bash
function computeAnswer() {
flag="$1"
num_1="$2"
num_2="$3"

case "$flag" in
    "-a") result=$(echo "$num_1 + $num_2" | bc);;
    "-s") result=$(echo "$num_1 - $num_2" | bc);;
    "-m") result=$(echo "$num_1 * $num_2" | bc);;
    "-d") result=$(echo "scale=2; $num_1 / $num_2" | bc);;
    *) echo "Invalid syntax. Exiting..."; exit 1;;
esac

echo "$result"

}


if [ "$#" -eq 1 -a \( "$1" = "--version" -o "$1" = "-v" \) ]; then
    echo "v1.0.0"
    exit 0
elif [ "$#" -eq 3 ]; then
    computeAnswer "$1" "$2" "$3"
else
    echo "Usage: $0 [-a|-s|-m|-d] num1 num2"
    echo "Options:"
    echo "  -a    Addition"
    echo "  -s    Subtraction"
    echo "  -m    Multiplication"
    echo "  -d    Division"
    echo "  -h    Show this help message"
    echo "  --version    Show version information"
    exit 0
 
fi

