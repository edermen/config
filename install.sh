#!/bin/bash


# add repositories
add-apt-repository -y ppa:pi-rho/dev
add-apt-repository -y ppa:webupd8team/sublime-text-3
sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
add-apt-repositoryi -y ppa:chris-lea/node.js

#Update package to current version
apt-get update

#install basic package
apt-get install -y wget \
git-core \
curl \
xclip \
zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev \
libcurl4-openssl-dev \
python-software-properties software-properties-common \
libffi-dev \
node.js \
mysql-server mysql-client libmysqlclient-dev \
postgresql-common postgresql-9.3 postgresql-contrib  libpq-dev pgadmin3 \
exuberant-ctags \
vim-nox \
terminator \
byobu \
ranger \
tmux=2.0-1~ppa1~t \
sublime-text-installer
# Docker install
wget -qO- https://get.docker.com/ | sh
## docker group
usermod -aG docker $USER


# install rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone git://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset
mkdir -p ~/.rbenv/plugins
git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# install Vundle plugin manager
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# copy setting
cp ./. ~/ -R
cp ./kglobalshortcutsrc ~/.kde/share/config/
exit 0

