#!/bin/bash

sudo apt install gcc g++ make curl -y

echo "===> Installing Nodejs"

curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -

sudo apt install nodejs -y

node --version

echo "===> Installing Yarn"

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install yarn -y

yarn --version

echo "===> Installing rbenv"

sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev -y

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

type rbenv

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv --version

echo "===> Installing Ruby"

echo "rbenv install --list"

echo "rbenv install 2.7.3"

echo "rbenv global 2.7.3"

echo "rbenv versions"
 
echo "ruby --version"

read response

echo "===> Installing Gem"

sudo apt install gem -y

gem install bundle

gem install bundler

gem install webpacker

echo "===> Installing Rails"

gem install rails

echo "===> Installing Postgresql"

sudo apt install postgresql postgresql-contrib libpq-dev -y

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

echo "===> Installing pgAdmin"

curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" | sudo tee /etc/apt/sources.list.d/pgadmin4.list

sudo apt update

sudo apt install pgadmin4-desktop -y

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
