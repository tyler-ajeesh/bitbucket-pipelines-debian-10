FROM debian:buster-slim
MAINTAINER Ajeesh <tyler.ajeesh@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

RUN \
 apt-get update &&\
 apt-get -y --no-install-recommends install curl locales apt-utils &&\
 echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen &&\
 locale-gen en_US.UTF-8 &&\
 /usr/sbin/update-locale LANG=en_US.UTF-8 &&\
 apt-get -y --no-install-recommends install ca-certificates gnupg git subversion imagemagick openssh-client curl software-properties-common gettext zip unzip default-mysql-server default-mysql-client apt-transport-https ruby python python3 perl memcached geoip-database make ffmpeg rhash &&\
 curl -sSL https://deb.nodesource.com/setup_10.x | bash - &&\
 apt-get -y --no-install-recommends install php-apcu php-bcmath php-cli php-curl php-gd php-geoip php-gettext php-imagick php-intl php-json php-mbstring php-mysql php-sqlite3 php-xdebug php-xml php-xmlrpc php-zip php-memcached nodejs &&\
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* /var/log/*

RUN \
 sed -ri -e "s/^variables_order.*/variables_order=\"EGPCS\"/g" /etc/php/7.3/cli/php.ini &&\
 echo "\nmemory_limit=-1" >> /etc/php/7.3/cli/php.ini &&\
 echo "xdebug.max_nesting_level=250" >> /etc/php/7.3/mods-available/xdebug.ini

RUN \
 curl -sSL https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin &&\
 npm install --no-color --production --global gulp-cli webpack mocha grunt yarn n &&\
 rm -rf /root/.npm /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/log/*
