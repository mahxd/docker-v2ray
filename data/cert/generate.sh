domain=`hostname`
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout  /var/cert/server.key -out  /var/cert/server.crt -subj "/C=CN/ST=$domain/L=$domain/O=$domain/OU=$domain/CN=$domain"
