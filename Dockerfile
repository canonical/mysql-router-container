FROM ubuntu:22.04

ARG CONFIG_VERSION="0.8.24-1"

RUN apt-get update && \
    apt-get install -y wget \
        lsb-release \
        gnupg && \
    wget -q https://dev.mysql.com/get/mysql-apt-config_${CONFIG_VERSION}_all.deb \
        -O /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    yes -4 | dpkg -i /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    apt-get update && \
    apt-get install -y mysql-client && \
    apt-get install -y mysql-router && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh

EXPOSE 6446 6447
