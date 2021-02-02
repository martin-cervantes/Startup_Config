#!/bin/bash

echo
echo "* * *   Ruby Installation. . .   * * *"
echo


apt install gcc g++ make curl -y

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get install yarn -y

yarn --version

apt install dirmngr apt-transport-https lsb-release ca-certificates -y

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

apt install nodejs

apt install rbenv

rbenv install 2.7.0

rbenv global 2.7.0

apt install gem

gem install bundle

gem install bundler

gem install webpacker

gem install rails

gem install hirb

echo "if ENV['RAILS_ENV']
  require 'rubygems'
  require 'hirb'
  require 'active_record'
  Hirb.enable
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end" >> ~/.irbrc

apt install postgresql postgresql-contrib libpq-dev

/usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l logfile start

gem install pg

echo "dont forget to create a new user"
echo "sudo -u postgres createuser --interactive"

