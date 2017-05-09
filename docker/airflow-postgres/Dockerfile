#
# A wrapper for Postgres which 
# initializes the Airflow database
#
FROM postgres:9.6.2
MAINTAINER timkral
MAINTAINER thespags

ENV POSTGRES_MAJOR_VERSION 9.6

ENV POSTGRES_BOOTSTRAP_HOME /docker-entrypoint-initdb.d
ENV POSTGRES_SHARE_HOME /usr/share/postgresql/${POSTGRES_MAJOR_VERSION}
ENV POSTGRES_EXTENSION_HOME ${POSTGRES_SHARE_HOME}/extension
ENV POSTGRES_LIB_HOME /usr/lib/postgresql/${POSTGRES_MAJOR_VERSION}/lib

# Add bootstrap script
WORKDIR /
COPY airflow-postgres/bootstrap-airflow.sh    ${POSTGRES_BOOTSTRAP_HOME}/bootstrap-airflow.sh

