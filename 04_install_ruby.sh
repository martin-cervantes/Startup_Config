#!/bin/bash

echo "===> Installing Yarn"

apt install gcc g++ make curl -y

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get install yarn -y

yarn --version

echo "===> Installing Nodejs"

apt install dirmngr apt-transport-https lsb-release ca-certificates -y

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

apt install nodejs -y

echo "===> Installing rbenv"

apt install rbenv -y

echo "===> Installing Ruby"

rbenv install 2.7.0

rbenv global 2.7.0

echo "===> Installing Gem"

apt install gem -y

gem install bundle

gem install bundler

gem install webpacker

echo "===> Installing Rails"

gem install rails

gem install hirb

echo "if ENV['RAILS_ENV']
  require 'rubygems'
  require 'hirb'
  require 'active_record'
  Hirb.enable
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end" >> ~/.irbrc

echo "===> Installing Postgresql"

apt install postgresql postgresql-contrib libpq-dev -y

/usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l logfile start

gem install pg

echo
echo "* * * * * * * * * * * * * * * * * * * * * * *"
echo
echo "Don't forget to create a new user"
echo
echo "sudo -u postgres createuser --interactive"

read response

echo
echo "* * * * * * * * * * * * * * * * *"
echo "* * *   Finish! All done!   * * *"
echo "* * * * * * * * * * * * * * * * *"
echo
