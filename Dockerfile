# VERSION 1.0
# AUTHOR:         Jerome Guibert <jguibert@gmail.com>
# DESCRIPTION:    Ngnix docker Image
# TO_BUILD:       docker build --rm -t airdock/mongodb .
# SOURCE:         https://github.com/airdock-io/docker-mongodb

# Pull base image.
FROM airdock/base:latest

MAINTAINER Jerome Guibert <jguibert@gmail.com>

# Version
ENV MONGODB_VERSION=1.6.2

# Add 10gen official apt source to the sources list
# Install mogodb full

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 && \
	echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
	apt-get update -qq && \
	apt-get install -y adduser mongodb-org=$MONGODB_VERSION && \
	apt-get clean -qq && \
	rm -rf /var/lib/apt/lists/* /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Create the MongoDB data directory
RUN mkdir -p /data/db
RUN mkdir -p /data/configdb

WORKDIR /data

# declare volume
VOLUME ["/data/db"]
VOLUME ["/data/configdb"]

# expose standard port
EXPOSE 27017 27019 28017

CMD ["mongod"]
