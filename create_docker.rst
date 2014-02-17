

Create a new Docker Image
-------------------------


Download Debian images:

    $ docker pull debian


Run an image on a new container:

    $ docker run -i -t debian:wheezy /bin/bash
    $ Install apache2, Asterisk, etc...
    $ sed -i "s/rtpstart=10000/rtpstart=16384/g" /etc/asterisk/rtp.conf
    $ sed -i "s/rtpend=20000/rtpend=16394/g" /etc/asterisk/rtp.conf
    $
    $ CTRL-P + CTRL-Q

Retrieve the last Container ID:

    $ `dl`
    # dl is an alias -> alias dl='docker ps -l -q'


Commit your last container and create a new image:

    $ docker commit -m "Asterisk with Apache" `dl` mydebian_apache_asterisk


Now launch a new container with open port for the image mydebian_apache_asterisk:

    $ docker run -d -p 9080:80 -p 5060:5060/tcp -p 5060:5060/udp -p 16384:16384/udp -p 16385:16385/udp -p 16386:16386/udp -p 16387:16387/udp -p 16388:16388/udp -p 16389:16389/udp -p 16390:16390/udp -p 16391:16391/udp -p 16392:16392/udp -p 16393:16393/udp -p 16394:16394/udp mydebian_apache_asterisk run


$ docker run -d -p 9080:80 -p 5060:5060/tcp -p 5060:5060/udp -p 16384:16384/udp -p 16385:16385/udp -p 16386:16386/udp -p 16387:16387/udp -p 16388:16388/udp -p 16389:16389/udp -p 16390:16390/udp -p 16391:16391/udp -p 16392:16392/udp -p 16393:16393/udp -p 16394:16394/udp mydebian_123 run