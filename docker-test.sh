#!/bin/sh
set -e
cd /app
export RAILS_ENV=test
bundle exec rails db:migrate
bundle exec rails test
bundle exec rspec
