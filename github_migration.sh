#!/bin/bash

BASEDIR=$(basename "$PWD")
make down-remove
cd ../
mv $BASEDIR $BASEDIR-gitlab
git clone git@github.com:tenantcloud/home.tenantcloud.com.git
cp $BASEDIR-gitlab/.env home.tenantcloud.com
cp $BASEDIR-gitlab/backend/.env home.tenantcloud.com/backend
cd home.tenantcloud.com
make reset
cp -r devops/docs/installation/git-hooks/pre-commit .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
cp -r devops/docs/installation/git-hooks/commit-msg .git/hooks/commit-msg && chmod +x .git/hooks/commit-msg
