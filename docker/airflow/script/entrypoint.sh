#!/usr/bin/env bash

CMD="airflow"

# Generate Fernet key
FERNET_KEY=$(python -c "from cryptography.fernet import Fernet; FERNET_KEY = Fernet.generate_key().decode(); print FERNET_KEY")
sed -i "s/{FERNET_KEY}/${FERNET_KEY}/" ${AIRFLOW_HOME}/airflow.cfg

if [ "$1" = "webserver" ] || [ "$1" = "scheduler" ] ; then
  echo "Initialize database..."
  ${CMD} initdb
fi

exec ${CMD} "$@"
