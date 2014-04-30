FROM ubuntu:13.10
MAINTAINER George Sapkin, "https://github.com/GeorgeSapkin/"

RUN export DEBIAN_FRONTEND=noninteractive

# Update OS
RUN apt-get -qq update
RUN apt-get -qqy upgrade

# Add node.js repository
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:chris-lea/node.js

# Install required packages
# ttf-mscorefonts-installer
RUN ( echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections )
RUN apt-get install ruby1.9.3 nodejs npm git wget -y

# Install compass
RUN gem install --no-ri --no-rdoc compass

# Install grunt-cli
RUN npm install -g grunt-cli

# Create user and home directory
RUN useradd --create-home popcorn-build

# Switch working directory to home directory
WORKDIR /home/popcorn-build

# Copy build script
ADD build-popcorn.sh /home/popcorn-build/
