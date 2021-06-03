#!/bin/bash

echo "===> Installing Yarn"

apt install gcc g++ make curl -y

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt install yarn -y

yarn --version

echo "===> Installing Nodejs"

apt install dirmngr apt-transport-https lsb-release ca-certificates -y

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

apt install nodejs -y

echo "===> Installing rbenv"

apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

type rbenv


echo "===> Installing Ruby"

rbenv install 2.7.0

rbenv global 2.7.0

apt install ruby-dev zlib1g-dev liblzma-dev -y

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
echo "* * * * * * * * * * * * * * * * * * * * * * *"
echo
echo "Modify password for role postgres:"
echo "sudo -u postgres psql postgres"
echo 
echo "alter user postgres with password 'postgres';"

read response

#
# Setup the repository
#

# Install the public key for the repository (if not done previously):
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

#
# Install pgAdmin
#

# Install for both desktop and web modes:
sudo apt install pgadmin4

# Install for web mode only: 
sudo apt install pgadmin4-web 

# Configure the webserver, if you installed pgadmin4-web:
sudo /usr/pgadmin4/bin/setup-web.sh

echo
echo "* * * * * * * * * * * * * * * * * * * * * * *"
echo
echo "Using pgadmin create a connection to localhost"
echo
echo "     name:  localhost"
echo "host name:  localhost"
echo " username:  postgres"
echo " password:  postgres"
echo
echo "* * * * * * * * * * * * * * * * *"
echo "* * *   Finish! All done!   * * *"
echo "* * * * * * * * * * * * * * * * *"
echo
