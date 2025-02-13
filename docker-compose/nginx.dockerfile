FROM nginx:latest

ADD docker-compose/nginx/default.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/nginx-selfsigned.key \
  -out /etc/ssl/certs/nginx-selfsigned.crt \
  -subj "/C=IN/ST=State/L=City/O=Company Name/OU=Org/CN=localhost"

COPY ./public /var/www/public
