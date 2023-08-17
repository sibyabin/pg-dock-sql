#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 <exercise_number>"
    echo "exercise_number should be between 101 and 200"
}

# Check if exactly one argument(exercise_number) is provided
if [ $# -ne 1 ]; then
    usage
    exit 1
fi

# Check if the argument is within the range 101 to 200
if [ $1 -ge 101 ] && [ $1 -le 200 ]; then
    exercise_number=$1
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "                               START                                         "
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo ""
    echo "EXERCISE TO VALIDATE: $exercise_number"
    echo "========================="
    echo ""
    echo "EXPECTED OUTPUT:"
    echo "================"
    psql -c "SET search_path TO exercise_$exercise_number;" --username dbuser --dbname practise -f /scripts/exercise-$exercise_number/code/expected.sql
    
    echo ""
    echo "SOLUTION OUTPUT:"
    echo "================"
    psql -c "SET search_path TO exercise_$exercise_number;" --username dbuser --dbname practise -f /scripts/exercise-$exercise_number/code/solution.sql
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "                                END                                          "
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
else
    echo "Argument must be between 101 and 200"
    usage
fi
