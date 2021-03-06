#!/bin/bash

set -e -o pipefail

# Silence some warnings about Readline. Checkout more over her$
# https://github.com/phusion/baseimage-docker/issues/58
DEBIAN_FRONTEND=noninteractive
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Add some basics
apt-get update
#--no-install-recommends
apt-get install -y -qq \
	lsb-release ca-certificates wget rsync curl \
	less nano vim git locales make \
	dirmngr gnupg \
	libtool autoconf g++ gcc \
        ant \
	openjdk-8-jre openjdk-8-jdk \
	ocl-icd-opencl-dev pocl-opencl-icd

# Auto-detect platform
#DEBIAN_PLATFORM="$(lsb_release -c -s)"
#echo "Debian platform: $DEBIAN_PLATFORM"

# Add source for gcloud sdk
#echo "deb http://packages.cloud.google.com/apt cloud-sdk-$DEBIAN_PLATFORM main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
#curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# Install gcloud and aws
#apt-get update
#apt-get install -y -qq --no-install-recommends \
#	google-cloud-sdk awscli

# Upgrade and clean
#apt-get upgrade -y
apt-get clean -y

locale-gen en_US.UTF-8
