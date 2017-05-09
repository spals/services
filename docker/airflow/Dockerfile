# 
# Airflow service image
#
FROM spals/ubuntu:16.04
MAINTAINER timkral
MAINTAINER thespags

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# Airflow
ARG AIRFLOW_VERSION=1.7.1.3
ENV AIRFLOW_HOME /usr/local/airflow
ENV AIRFLOW_DAGS_HOME ${AIRFLOW_HOME}/dags

# Define en_US.
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8
ENV LC_ALL  en_US.UTF-8

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
    checkinstall \
    libreadline-gplv2-dev \
    libncursesw5-dev \
    libssl-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    apt-utils \
    netcat \
    curl \
    pigz \
    libpq-dev \
    libkrb5-dev \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    locales \
    libblas-dev \
    liblapack-dev

RUN locale-gen en_US en_US.UTF-8 \
    && dpkg-reconfigure locales

RUN pip install --upgrade pip
RUN pip install pytz==2015.7 \
    && pip install cryptography \
    && pip install pyOpenSSL \
    && pip install ndg-httpsclient \
    && pip install pyasn1 \
    && pip install boto \
    && pip install boto3 \
    && pip install airflow==${AIRFLOW_VERSION} \
    && pip install airflow[celery]==${AIRFLOW_VERSION} \
    && pip install airflow[postgres]==${AIRFLOW_VERSION} \
    && pip install airflow[s3]==${AIRFLOW_VERSION} \
    && pip install airflow[hive]==${AIRFLOW_VERSION}

RUN apt-get remove --purge -yqq python-pip python-dev libkrb5-dev libsasl2-dev libssl-dev libffi-dev \
    && apt-get clean

RUN rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/man \
    /usr/share/doc \
    /usr/share/doc-base

ADD airflow/script/entrypoint.sh ${AIRFLOW_HOME}/entrypoint.sh
ADD airflow/config/airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

RUN \
  mkdir -p ${AIRFLOW_DAGS_HOME} \
  && chmod +x ${AIRFLOW_HOME}/entrypoint.sh

EXPOSE 8080

WORKDIR ${AIRFLOW_HOME}
ENTRYPOINT ["./entrypoint.sh"]
