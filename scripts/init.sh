#!/bin/bash
set -e

active_exercises="101 102 103 104"
echo "INFO:Init Script Started"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    create user dbuser with password '$POSTGRES_PASSWORD';
    drop database if exists practise;
    create database practise;  
    GRANT ALL PRIVILEGES ON DATABASE practise TO dbuser;
    grant connect on database practise to dbuser;
    show search_path;
EOSQL

for ex in $active_exercises
do 
  echo $ex
  psql -v --username dbuser --dbname practise -f /scripts/exercise-$ex/code/setup.sql
done

echo "INFO:Init Script Completed"