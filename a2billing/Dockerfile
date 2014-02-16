FROM debian

RUN apt-get update
RUN apt-get install -y wget

RUN wget https://raw.github.com/Star2Billing/a2billing/develop/addons/debian/install_debian.sh

RUN bash install_debian.sh

EXPOSE 80
EXPOSE 5060

#ENTRYPOINT ["/usr/sbin/apache2"]
#CMD ["-D", "FOREGROUND"]
