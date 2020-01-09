#!/bin/sh

gem install bundler
bundler install
echo 'Success - Running Feed The Zombies now.'
ruby FTZ.rb
