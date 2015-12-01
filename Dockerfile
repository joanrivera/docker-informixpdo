FROM php:5.6-apache

ENV INFORMIXDIR /opt/IBM/informix
ENV PATH $INFORMIXDIR/bin:$PATH

#Informix SDK installation
COPY scripts/install-informix-clientsdk.sh /tmp/
RUN sh /tmp/install-informix-clientsdk.sh

#Generation and installation of the PDO
COPY scripts/install-informixpdo.sh /tmp/
RUN sh /tmp/install-informixpdo.sh

#Informix environment variables for Apache
COPY scripts/envvars.sh /tmp
RUN sh /tmp/envvars.sh

#Configuration files
COPY php.ini /usr/local/etc/php/
COPY informix/sqlhosts $INFORMIXDIR/etc/
RUN echo "extension=pdo_informix.so" >> /usr/local/etc/php/conf.d/pdo.ini
RUN echo "sqlexec  9088/tcp\nsqlexec-ssl  9089/tcp" >> /etc/services

RUN a2enmod rewrite

#Cleaning up
RUN rm -r /tmp/*


CMD ["apache2-foreground"]
