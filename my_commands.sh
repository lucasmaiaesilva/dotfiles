#!/bin/zsh

PATH_TO_MY_SCRIPTS="$HOME/workspace/dotfiles"
source $PATH_TO_MY_SCRIPTS/variables.sh

function create-github-repo() {
  cd ~
  python3 $PATH_TO_MY_SCRIPTS/scripts/creategithubrepo.py $1 $GH_USERNAME $GH_PASSWORD
  mkdir $HOME/Developer/$1 && cd $_
  echo "# $1" >> README.md
  git init
  git add README.md
  git commit -m "first commit"
  git remote add origin git@github.com:lucasmaiaesilva/$1.git
  git push -u origin master
  git checkout -b surge
  echo $SURGE_DEPLOY_TEMPLATE >> .github/workflows/integration.yml
}

function timetracker() {
  python3 $PATH_TO_MY_SCRIPTS/scripts/timetrackerlaunch.py $1 $2 $TT_USERNAME $TT_PASSWORD
}

function mke() {
  mkdir $1
  cd $1
}

function gpush {
  local BRANCH=$(git branch | grep \* | cut -d' ' -f 2)
  git push origin $BRANCH
}

function gpull {
  local BRANCH=$(git branch | grep \* | cut -d' ' -f 2)
  git pull origin $BRANCH
}

function serve {
  python -m SimpleHTTPServer 8000
}
