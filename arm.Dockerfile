FROM arm32v7/ubuntu:18.04

RUN apt-get update

RUN echo "Europe/London" > /etc/timezone
RUN apt-get install tzdata

# Install PHP7.4
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt -y install php7.4 && \
    apt-get install php7.4-xml -y && \
    apt-get install php7.4-mbstring -y && \
    apt-get install php-mysql -y && \
    apt-get install php7.4-zip -y

# Install other
RUN apt-get install apache2 -y && \
    apt-get install ufw -y && \
    apt-get install systemd -y && \
    apt-get install curl -y && \
    apt-get install composer -y && \
    apt-get install vim -y && \
    apt-get install mysql-client -y

# Install node and npm
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install nodejs -y

ENV TZ Europe/London

RUN a2enmod rewrite
RUN mkdir -p /var/www/project

EXPOSE 80
EXPOSE 443

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
