FROM baselibrary/baseimage:1.0.0
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Version
ENV JAVA_MAJOR   8
ENV JAVA_VERSION 8b108~trusty~NoobsLab.com

## Repository
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 &&\
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main " > /etc/apt/sources.list.d/java.list &&\
  echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections &&\
  echo "debconf shared/accepted-oracle-license-v1-1 seen   true" | debconf-set-selections

## Packages
RUN \
  apt-get update &&\
  apt-get install -y oracle-java8-installer=$JAVA_VERSION &&\
  rm -rf /var/lib/apt/lists/*

## Environments
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

