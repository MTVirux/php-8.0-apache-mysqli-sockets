FROM oberd/php-8.0-apache

#PHP Plugins
RUN docker-php-ext-install mysqli sockets

#SSL Stuff
RUN apt-get update && apt-get install -y ssl-cert nano systemctl apt-utils

RUN mkdir -p /usr/local/bin

COPY ./docker/usr/local/bin/run_entrypoints.sh /usr/local/bin/run_entrypoints.sh

RUN mkdir -p /startup_scripts

#APACHE MOD ENABLES
RUN a2enmod rewrite
RUN a2enmod ssl

#INITIATE CONTAINER
RUN chmod +x /usr/local/bin/run_entrypoints.sh
CMD ["/usr/local/bin/run_entrypoints.sh"]