FROM    ubuntu:latest

RUN         apt-get update
RUN         apt-get -y install redis-server

RUN mkdir -p /redis-data

EXPOSE      6379
ENTRYPOINT  ["/usr/bin/redis-server"]
