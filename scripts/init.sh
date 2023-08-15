#!/bin/bash
set -e

echo "INFO:Init Script Started"

# GRANT ALL PRIVILEGES ON DATABASE practise TO dbuser;
# 

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    create user dbuser with password '$POSTGRES_PASSWORD';
    drop database if exists practise;
    create database practise;  
    grant connect on database practise to dbuser;
    \connect practise;
    create schema if not exists solutions;
    create schema if not exists test;
    grant all on schema solutions to dbuser;
    grant all on schema test to dbuser;
    set search_path to solutions, test, public;
    show search_path;
EOSQL

psql -v --username dbuser --dbname practise -f /scripts/exercise-101/sample.sql
psql -v --username dbuser --dbname practise -f /scripts/exercise-football-102/create_table_teams.sql
psql -v --username dbuser --dbname practise -f /scripts/exercise-football-102/create_table_matches.sql

echo "INFO:Init Script Completed"