# Docker MongoDb

Docker Image for MongoDb based on airdock/base:latest

Purpose of this image is:

- provide a mongodb server
- based on airdock/base:latest

> Name: airdock/mongodb

***Dependency***: airdock/base:latest

***Few links***:

- [Dockerizing MongoDB](https://docs.docker.com/examples/mongodb/)
- [Iron Pinguin dockerfile](https://github.com/ironpinguin/docker-mongodb/blob/master/Dockerfile)
- [Sharded Cluster](https://sebastianvoss.com/docker-mongodb-sharded-cluster.html)

# Usage

You should have already install [Docker](https://www.docker.com/).

Execute:

	'docker run -t -i -p 27017:27017 --name mongodb airdock/mongodb '


## With a persistent storage


	'docker run -d -p 27017:27017 -v /var/lib/mongodb:/var/lib/mongodb --name mongodb airdock/mongodb'

Take care about your permission on host folder named '/var/lib/mongodb'.

The user mongodb (uid 4203) in your container should be known into your host.
See :
* [How Managing user in docker container ?](https://github.com/airdock-io/docker-base/wiki/How-Managing-user-in-docker-container)
* [Common User List](https://github.com/airdock-io/docker-base/wiki/Common-User-List)


So you should create an user with this uid:gid:

```
  sudo groupadd mongodb -g 4203
  sudo useradd -u 4203  --no-create-home --system --no-user-group mongodb
  sudo usermod -g mongodb mongodb
```

And then set owner and permissions on your host directory:

```
	chown -R mongodb:mongodb /var/lib/mongodb
```
Don't forget to add your current user to this new group.



### Notes:

- configuration file: /etc/mongod.conf
- data file: /var/lib/mongodb


TODO add sharded cluster DockerFig sample

# Change Log

## latest (current)

- add mongodb 2.6.7
- add variable MONGODB_VERSION
- Listen on all address
- Output log to stdout
- Add volume to data (/var/lib/mongodb) and log folder (/var/log/mongodb)
- launch mongod with mongodb:mongodb
- MIT license

# Build

- Install "make" utility, and execute: `make build`
- Or execute: 'docker build -t airdock/mongodb:latest --rm .'

See [Docker Project Tree](https://github.com/airdock-io/docker-base/wiki/Docker-Project-Tree) for more details.


# MIT License

```
The MIT License (MIT)

Copyright (c) 2015 Airdock.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
