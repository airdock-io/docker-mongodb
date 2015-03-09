# VERSION 1.0
# AUTHOR:         Jerome Guibert <jguibert@gmail.com>
# DESCRIPTION:    MongoDB Docker Image
# TO_BUILD:       docker build --rm -t airdock/mongodb .
# SOURCE:         https://github.com/airdock-io/docker-mongodb

# Pull base image.
FROM airdock/base:latest

MAINTAINER Jerome Guibert <jguibert@gmail.com>

# Version
ENV MONGODB_VERSION=2.6.7

# Add 10gen official apt source to the sources list
# Install mondoDb
# Fix port, bind on all local address, log to stdout
# set mongodb user id 103:103
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 && \
	echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
	apt-get update -qq && \
	apt-get install -y adduser mongodb-org=$MONGODB_VERSION && \
	sed 's/^bind_ip/#bind_ip/' -i /etc/mongod.conf && \
	sed 's/^#port/port/' -i /etc/mongod.conf && \
	sed 's/^logpath/#logpath/' -i /etc/mongod.conf && \
	/root/post-install

# declare volume
VOLUME ["/var/lib/mongodb", "/var/log/mongodb"]

# expose standard port
EXPOSE 27017 27019 28017

CMD ["gosu", "mongodb:mongodb", "/usr/bin/mongod", "--config", "/etc/mongod.conf"]
