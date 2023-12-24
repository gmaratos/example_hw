#!/bin/bash

EXEC=hw0
KEY=$(echo $GITHUB_REPOSITORY | md5sum | sed 's/\ -//')

# this should never trigger because autograding should have stopped earlier

if ! [ -f $EXEC ]; then
    echo "Your assignment did not compile!"
    echo "fail" > grade.txt
else
    echo $KEY > expected
    timeout 30 ./$EXEC > actual
    diff expected actual

    result=$?
    if [ "$result" -eq "0" ]; then
        echo "You have completed HW 0!"
        echo "pass" > grade.txt
    else
        echo "Wrong Key!"
        echo "The correct KEY is: $KEY"
        echo "fail" > grade.txt
    fi
fi

rm -f expected actual
