FROM debian

RUN apt-get update
RUN apt-get install -y apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]


# Then run:
# docker build -t="apache2" .
# or
# docker build -t apache2 - < /home/areski/projects/docker/dockerfiles/apache2/Dockerfile


# That will take a few minutes to install packages and then you can run:

# $ docker run -d apache2
# 5765535796f8