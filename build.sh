#!/usr/bin/env bash

NOW=$(date +"%Y%m%d%H%M%S")

# Run from the home location of the script
DIR="$( cd "$( dirname "$0" )" && pwd )"
pushd ${DIR} > /dev/null

# Copies this package into home.  NO BACKUP
[ ! -d ~/.emacs ] && mkdir ~/.emacs.d
cp -R .emacs.d/* ~/.emacs.d
[ -f ~/.emacs ] && rm ~/.emacs
cp .emacs ~/.

popd > /dev/null

