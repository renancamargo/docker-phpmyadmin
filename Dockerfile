FROM phpmyadmin/phpmyadmin:latest

RUN a2enmod ssl

RUN sed -ri -e 's,80,443,'
RUN sed -i -e '/^<\/VirtualHost>/i SSLEngine on' 
RUN sed -i -e '/^<\/VirtualHost>/i SSLCertificateFile /cert/ssl.crt' 
RUN sed -i -e '/^<\/VirtualHost>/i SSLCertificateKeyFile /cert/ssl.key' 

EXPOSE 443
