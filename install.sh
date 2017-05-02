#!/usr/bin/env bash

NOW=$(date +"%Y%m%d%H%M%S")

# Run from the home location of the script
DIR="$( cd "$( dirname "$0" )" && pwd )"
pushd ${DIR} > /dev/null

# Copies this package into home.  NO BACKUP
[ ! -d ~/.emacs.d ] && mkdir ~/.emacs.d
cp -R .emacs.d/* ~/.emacs.d

popd > /dev/null

