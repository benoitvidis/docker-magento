FROM eboraas/apache-php

RUN apt-get update
RUN apt-get install -y imagemagick
RUN apt-get install -y php5-imagick
RUN apt-get install -y php5-curl
RUN apt-get install -y php5-intl
RUN apt-get install -y php5-mcrypt
RUN apt-get install -y php5-xsl
RUN apt-get install -y php5-memcached
RUN apt-get install -y php5-gd


COPY run.sh /root/run.sh
RUN chmod 755 /root/run.sh
CMD ["/root/run.sh"]