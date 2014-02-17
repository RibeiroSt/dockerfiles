
Create a new Docker Image
-------------------------

Download Debian images:

    $ docker pull debian


Run an image on a new container:

    $ docker run -i -t debian:wheezy /bin/bash
    $ Install Apache2, etc...
    $
    $ CTRL-P + CTRL-Q

Retrieve the last Container ID:

    $ `dl`
    # dl is an alias -> alias dl='docker ps -l -q'


Commit your last container and create a new image:

    $ docker commit -m "Docker with Apache" `dl` mydebian_apache


Now launch a new container with open port for the image `mydebian_apache`:

    $ docker run -d -p 9080:80 mydebian_apache run
