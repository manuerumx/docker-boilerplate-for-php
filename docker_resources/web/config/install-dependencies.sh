set -e

# for libjpeg8, libpng12-0, libxrender1 and libfontconfig1
echo "deb http://ftp.br.debian.org/debian wheezy main" >> /etc/apt/sources.list

apt-get update

apt-get install -y \
  mysql-client \
  libxml2-dev \
  libmysqlclient-dev \
  libmcrypt-dev \
  netcat \
  libicu-dev \
  libjpeg8 \
  libpng12-0 \
  libxrender1 \
  libfontconfig1 \
  libgpgme11-dev \
  libpng-dev \
  libpq-dev \
  git

docker-php-ext-install -j$(nproc) \
  mysqli \
  bcmath \
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
  opcache

pecl install gnupg && \
  echo "extension=gnupg.so" > /usr/local/etc/php/conf.d/gnupg.ini

pecl install xdebug

docker-php-ext-enable xdebug

echo -e "xdebug.remote_enable=1 \nxdebug.remote_host=EB-C02W60KXHV27.local" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

a2enmod rewrite

apt-get clean
