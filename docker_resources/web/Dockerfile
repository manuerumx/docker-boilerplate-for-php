FROM php:7.1-apache-jessie

COPY config/install-dependencies.sh /
RUN chmod o+x /install-dependencies.sh

RUN /install-dependencies.sh
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --allow-root

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/db049716e42767d39961e95dd9696103dca813f1/wait-for-it.sh /usr/bin/
RUN chmod +x /usr/bin/wait-for-it.sh

COPY config/host.conf /etc/apache2/sites-enabled/000-default.conf
COPY config/db.sql /root/
COPY config/php.ini /usr/local/etc/php/
COPY docker-entrypoint.sh /

RUN chmod o+x /docker-entrypoint.sh

WORKDIR /app

ENV COMPOSER_ALLOW_SUPERUSER=1

ENTRYPOINT ["/docker-entrypoint.sh"]
