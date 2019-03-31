FROM ubuntu:bionic
LABEL maintainer="Martin Chan <osiutino@gmail.com>"
ENV REFRESHED_AT 2019-04-01
ENV RUBY_VERSION 2.3.8
ENV TZ Asia/Hong_Kong
USER root

# Update 
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install locales -y 
RUN apt-get install curl -y
RUN apt-get install gpg -y 
RUN apt-get install sudo -y
RUN apt-get install patch gawk g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make patch pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl1.0-dev -y

# Setup environment
RUN locale-gen en_US.UTF-8

# Setup User
RUN useradd --home /home/worker -M worker -K UID_MIN=10000 -K GID_MIN=10000 -s /bin/bash
RUN mkdir /home/worker
RUN chown worker:worker /home/worker
RUN adduser worker sudo
RUN echo 'worker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER worker

# Install RVM
RUN for server in $(shuf -e hkp://pool.sks-keyservers.net \
                          hkp://ipv4.pool.sks-keyservers.net \
                          hkp://pgp.mit.edu \
                          hkp://keyserver.pgp.com) ; do \
      gpg --keyserver "$server" --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && break || : ; \
  done
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c 'source ~/.rvm/scripts/rvm'

# Install Ruby
RUN /bin/bash -l -c 'rvm autolibs fail'
RUN /bin/bash -l -c 'rvm install $RUBY_VERSION'
RUN /bin/bash -l -c 'rvm use $RUBY_VERSION --default'
RUN /bin/bash -l -c 'rvm rubygems current'

# Install bundler
RUN /bin/bash -l -c 'gem install bundler --no-doc --no-ri'
