FROM ubuntu:18.04

RUN apt-get update

RUN echo "Europe/London" > /etc/timezone
RUN apt-get install tzdata

# Install PHP7.4
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install php7.4 -y && \
    apt-get install php7.4-xml -y && \
    apt-get install php7.4-mbstring -y && \
    apt-get install php-mysql -y && \
    apt-get install php7.4-zip -y && \
    apt-get install php7.4-fpm -y
#    apt-get install php7.4-curl -y \
#    apt-get install php7.4-cli -y \
#    apt-get install php7.4-fpm -y \
#    apt-get install php7.4-gd -y \
#    apt-get install php7.4-xml -y \
#    apt-get install php7.4-dev -y \
#    apt-get install php7.4-common -y \
#    apt-get install php7.4-xmlrpc -y \
#    apt-get install php7.4-imagick -y \
#    apt-get install php7.4-imap -y \
#    apt-get install php7.4-opcache -y \
#    apt-get install php7.4-soap -y \

# Install other
RUN apt-get install apache2 -y && \
    apt-get install ufw -y && \
    apt-get install systemd -y && \
    apt-get install curl -y && \
    apt-get install composer -y && \
    apt-get install vim -y && \
    apt-get install mysql-client -y

# Install node and npm
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt install nodejs -y

# Apache2
COPY ./apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod proxy_fcgi
RUN a2enmod rewrite
RUN mkdir -p /var/www/project

ENV TZ Europe/London

EXPOSE 80
EXPOSE 443

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
