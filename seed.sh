#!/bin/bash

sh pg-start.sh

echo '---------------------------------'
echo 'bundle exec rake db:migrate:reset'
bundle exec rake db:migrate:reset

echo '------------------------'
echo 'bundle exec rake db:seed'
bundle exec rake db:seed
