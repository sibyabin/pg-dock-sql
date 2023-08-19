#!/bin/bash

# Function to display usage instructions
usage() {
    echo "${RED}Usage: $0 <exercise_number>${NC}"
    echo "${RED}exercise_number should be between 101 and 200 ${NC}"
    exit 1
}

error() {
    echo "${RED}ERROR: Failed to run commands.Please check logs for more information ${NC}"
    exit 1
}

# Check if exactly one argument(exercise_number) is provided
if [ $# -ne 1 ]; then
    usage
    exit 1
fi



# Check if the argument is within the range 101 to 200
if [ $1 -ge 101 ] && [ $1 -le 200 ]; then
    
    exercise_number=$1
    seed_sqls="expected solution"
    exercise_base_path="scripts/exercise-$exercise_number"
    
    for seed in $seed_sqls; do
        create_view="CREATE OR REPLACE VIEW $seed AS "
        original_query=$(cat $exercise_base_path/code/$seed.sql)

        query="$create_view
                $original_query"
        psql -c "SET search_path TO exercise_$exercise_number;" --username dbuser --dbname practise -c "$query"
        if [ $? -ne 0 ]; then
           error
        fi
    done

    for script in $exercise_base_path/tests/*.sql; do
        base_script=`basename $script`
        test_number=`echo $base_script | sed -e s/.sql//`
        echo "${BLUE}"
        echo "TEST EXECUTIONS:"
        echo "================"
        echo "${NC}"
        echo "${GREEN}INFO:TEST '${test_number}'${NC}"      
        test_sql="CREATE OR REPLACE VIEW ${test_number}_output AS "$(cat $script)
        psql -c "SET search_path TO exercise_$exercise_number;" --username dbuser --dbname practise -c "$test_sql"
        if [ $? -ne 0 ]; then
           error
        else
            psql -c "SET search_path TO exercise_$exercise_number;" --username dbuser --dbname practise -c "SELECT * FROM ${test_number}_output;" 
        fi
    done

else
    echo "${RED}Argument must be between 101 and 200${NC}"
    usage
fi

exit 0