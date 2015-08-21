FROM quay.io/baselibrary/ubuntu:14.04
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Add repository
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 &&\
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main " > /etc/apt/sources.list.d/java.list

## Install packages
RUN \
  echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections &&\
  echo "debconf shared/accepted-oracle-license-v1-1 seen true"   | debconf-set-selections &&\
  apt-get update &&\
  apt-get install -y oracle-java6-installer &&\
  rm -rf /var/lib/apt/lists/*

## Environments
ENV JAVA_HOME /usr/lib/jvm/java-6-oracle

