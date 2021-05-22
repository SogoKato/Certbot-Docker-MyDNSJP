DirectEdit
=============

These are scripts for users of MyDNS.JP and are necessary to obtain server certificates with Let's Encrypt's DNS-01.

これらは、MyDNS.JPのユーザーのためのスクリプトで、Let's EncryptのDNS-01でサーバー証明書を取得するために必要です。

必要環境
-------------
phpが/usr/bin/下に設置されているサーバ

Let's Encryptが使用可能なサーバ

phpの拡張機能、php-mbstringが有効化されていること


使い方/Usage
-------------

*STEP1:*

    cd /your/domain/directory/
    wget 'https://github.com/disco-v8/DirectEdit/archive/master.zip' -O DirectEdit-master.zip
    unzip ./DirectEdit-master.zip
    cd /your/domain/directory/DirectEdit-master/
    chmod 700 ./*.php
    chmod 600 ./*.conf


*STEP2:*

edit "txtedit.conf".

    $MYDNSJP_MASTERID  = 'yourmasterid';
    $MYDNSJP_MASTERPWD = 'yourpasswd';
    $MYDNSJP_DOMAIN = 'yourdomain';


*STEP3:*

    certbot certonly --manual \
    --preferred-challenges=dns \
    --manual-auth-hook /your/domain/directory/DirectEdit-master/txtregist.php \
    --manual-cleanup-hook /your/domain/directory/DirectEdit-master/txtdelete.php \
    -d yourdomain -d *.yourdomain \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --agree-tos -m yourmailaddr \
    --manual-public-ip-logging-ok


**Congratulations! or NOT? :-)**

AFTER:
**Do not forget** to run "certbot renew" once every few weeks.

Thanks.

T.Kabu/MyDNS.JP
