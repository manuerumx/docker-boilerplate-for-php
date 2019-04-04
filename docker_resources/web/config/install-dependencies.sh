set -e

apt-get update

apt-get install -y \
  mysql-client \
  libxml2-dev \
  libmysqlclient-dev \
  libmcrypt-dev \
  libicu-dev \
  libgpgme11-dev \
  libpng-dev \
  libpq-dev \
  netcat \
  nano \
  git

docker-php-ext-install -j$(nproc) \
  mysqli \
  bcmath \
  mbstring \
  mcrypt \
  soap \
  pdo \
  pdo_mysql \
  sockets \
  intl \
  gd \
  pgsql \
  pdo_pgsql \
  zip \
  opcache \
  json

pecl install gnupg && \
  echo "extension=gnupg.so" > /usr/local/etc/php/conf.d/gnupg.ini

pecl install xdebug

docker-php-ext-enable xdebug

echo -e "xdebug.remote_enable=1 \nxdebug.remote_host=EB-C02W60KXHV27.local" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

a2enmod rewrite

apt-get clean
