FROM ubuntu:16.04

RUN apt-get update \
 && apt-get install apache2 -y \
 && apt-get install software-properties-common -y \
 && apt-add-repository ppa:git-core/ppa -y \
 && apt-get update \
 && apt-get install -y --no-install-recommends curl git

RUN mkdir /tmp/sources && cd /tmp/sources \
 && git clone https://github.com/croej/start.git \
 && cp ./start/index.html /var/www/html/

ENTRYPOINT service apache2 start && bash