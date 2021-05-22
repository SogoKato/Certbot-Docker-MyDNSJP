#!/bin/bash

docker run -it --rm --name certbot \
       -v "/etc/letsencrypt:/etc/letsencrypt" \
       -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
       certbot renew
