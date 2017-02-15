#!/bin/bash
# Proper header for a Bash script.

sh pg-start.sh

echo '--------------'
echo 'bundle install'
bundle install

sh kill_spring.sh

echo '---------------------------'
echo 'bundle exec rake db:migrate'
bundle exec rake db:migrate

echo '-----------------'
echo 'sh kill_spring.sh'
sh kill_spring.sh

echo "\n\n\n\n\n\n\n\n\n\n"

echo '---------------------'
echo 'bundle exec rake test'
bundle exec rake test
