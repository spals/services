#!/bin/bash
set -e

# Create airflow user and database
psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER}" <<-EOSQL
    CREATE USER ${AIRFLOW_POSTGRES_USER} WITH PASSWORD '${AIRFLOW_POSTGRES_PASSWORD}';
    CREATE DATABASE airflow OWNER ${AIRFLOW_POSTGRES_USER};    
EOSQL

