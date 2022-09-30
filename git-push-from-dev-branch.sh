#!/bin/bash
git checkout main
git merge dev
./deploy-on-digital-ocean-from-main-branch.sh
git checkout dev
git merge main
echo "finished"
