FROM certbot/certbot

RUN apk update \
 && apk add php7 php7-fpm php7-opcache php7-openssl php7-mbstring

COPY ./DirectEdit-master/* /var/DirectEdit-master/
RUN chmod 700 /var/DirectEdit-master/*.php \
 && chmod 600 /var/DirectEdit-master/*.conf
