#!/bin/bash
set -e

active_exercises="101 102 103"

echo "INFO:Init Script Started"

# GRANT ALL PRIVILEGES ON DATABASE practise TO dbuser;
# \connect practise;
# create schema if not exists solutions;
# create schema if not exists test;
# grant all on schema solutions to dbuser;
# grant all on schema test to dbuser;
# set search_path to solutions, test, public;

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    create user dbuser with password '$POSTGRES_PASSWORD';
    drop database if exists practise;
    create database practise;  
    GRANT ALL PRIVILEGES ON DATABASE practise TO dbuser;
    grant connect on database practise to dbuser;
    show search_path;
EOSQL

# psql -v --username dbuser --dbname practise -f /scripts/exercise-101/sample.sql
# psql -v --username dbuser --dbname practise -f /scripts/exercise-102/1-setup.sql
# psql -v --username dbuser --dbname practise -f /scripts/exercise-103/1-setup.sql

for ex in $active_exercises
do 
  echo $ex
  psql -v --username dbuser --dbname practise -f /scripts/exercise-$ex/1-setup.sql
done

echo "INFO:Init Script Completed"