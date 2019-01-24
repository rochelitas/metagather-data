#! /bin/bash
cd $(dirname $(readlink -f $0))
git fetch --all
git pull

../metagather/run.sh

git commit -a -m "$(date +'%Y%m%d_%H%M%S')"
git push origin
