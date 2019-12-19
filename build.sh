#!/bin/sh
mkdir -p dist
mkdir -p dist/ui dist/lib
cp FTZ.rb ./dist
cp Gemfile ./dist
cp README.md ./dist
cp .env ./dist
cp .gitignore ./dist
cp ./ui/* ./dist/ui
cp ./lib/* ./dist/lib
gem install bundler
bundler install
