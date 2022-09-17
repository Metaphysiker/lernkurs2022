#!/bin/bash
#rails assets:clobber
#RAILS_ENV=production rails assets:precompile
git add .
git commit -m "precompile"
git push origin main

ssh sandro@159.65.120.231 << EOF
  cd lernkurs2022
  git pull origin main
  bundle config set --local without 'development test'
  bundle install
  RAILS_ENV=production rails db:migrate
  RAILS_ENV=production rails assets:clobber
  RAILS_ENV=production rails assets:precompile
EOF

ssh root@159.65.120.231 << EOF
  cd /home/sandro/lernkurs2022/
  sudo service nginx restart
EOF
