#!/bin/sh
apt-get install ruby dev
gem install bundler
bundler install
echo 'Success - Running Feed The Zombies now.'
ruby FTZ.rb

