#!/usr/bin/env bash
# https://docs.travis-ci.com/user/docker/#using-docker-compose 


DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION:-1.23.2}

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y -o Dpkg::Options::="--force-confnew" install docker-ce

# Update docker-compose
rm /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
chmod +x docker-compose
mv docker-compose /usr/local/bin

# install FUSE
apt-get install libfuse-dev

# install conda
source $(dirname $BASH_SOURCE)/install_conda.sh
