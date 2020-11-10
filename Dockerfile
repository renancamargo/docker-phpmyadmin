FROM phpmyadmin/phpmyadmin:latest

RUN a2enmod ssl

RUN sed -ri -e 's,80,443,' /etc/apache2/sites-available/000-default.conf
RUN sed -i -e '/^<\/VirtualHost>/i SSLEngine on' /etc/apache2/sites-available/000-default.conf
RUN sed -i -e '/^<\/VirtualHost>/i SSLCertificateFile /certs/ssl.crt' /etc/apache2/sites-available/000-default.conf
RUN sed -i -e '/^<\/VirtualHost>/i SSLCertificateKeyFile /certs/ssl.key' /etc/apache2/sites-available/000-default.conf

EXPOSE 443
