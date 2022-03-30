FROM ubuntu:20.04 AS base

ENV CONFIG_VERSION="0.8.22-1"

RUN apt-get update && \
    apt-get install -y wget \
        lsb-release \
        gnupg && \
    wget -q https://dev.mysql.com/get/mysql-apt-config_${CONFIG_VERSION}_all.deb \
        -O /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    yes -4 | dpkg -i /tmp/mysql-apt-config_${CONFIG_VERSION}_all.deb && \
    apt-get update && \
    apt-get install -y mysql-shell\
        mysql-router && \
    rm -rf /var/lib/apt/lists/*

FROM base AS runtime

COPY run.sh /run.sh

CMD ["/run.sh"]