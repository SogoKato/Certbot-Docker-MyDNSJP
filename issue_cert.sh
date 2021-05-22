#!/bin/bash

docker image build . -t certbot

docker run -it --rm --name certbot \
       -v "/etc/letsencrypt:/etc/letsencrypt" \
       -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
       certbot certonly --manual \
       --preferred-challenges=dns \
       --manual-auth-hook /var/DirectEdit-master/txtregist.php \
       --manual-cleanup-hook /var/DirectEdit-master/txtdelete.php \
       -d your-domain -d *.your-domain \
       --server https://acme-v02.api.letsencrypt.org/directory \
       --agree-tos -m your-mail-address \
       --manual-public-ip-logging-ok
