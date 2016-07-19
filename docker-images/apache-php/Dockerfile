FROM php:7-apache

RUN    apt-get update \
    && apt-get install -y \
            imagemagick  \
            libcurl4-openssl-dev \
            libfreetype6-dev \
            libicu-dev \
            libjpeg62-turbo-dev \
            libmagickwand-dev \
            libmcrypt-dev \
            libpng12-dev \
            libxslt1-dev \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-install -j$(nproc) \
            curl \
            intl \
            mcrypt \
            pdo_mysql \
            xsl \
            zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && cd /tmp \
    && pecl download imagick \
    && tar xf imagick*.tgz \
    && cd imagick* \
    && phpize \
    && ./configure --with-imagick=/usr/bin \
    && make \
    && make install \
    && cd - \
    && rm -rf /tmp/imagick* \
    && docker-php-ext-enable imagick


COPY run.sh /root/run.sh
RUN chmod 755 /root/run.sh
CMD ["/bin/bash", "/root/run.sh"]
