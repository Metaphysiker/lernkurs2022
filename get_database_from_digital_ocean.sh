#!/bin/bash
ssh sandro@159.65.120.231 << EOF
  cd lernkurs2022
  pg_dump --format=custom lernkurs2022_production > latest.dump
EOF

scp sandro@159.65.120.231:/home/sandro/lernkurs2022/latest.dump latest.dump

rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
rails db:create
rails db:migrate

pg_restore --verbose --clean --no-acl --no-owner -d lernkurs2022_development latest.dump

#psql lernkurs2022_development < latest.sql
