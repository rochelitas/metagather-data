#! /bin/bash
base=$(dirname $(readlink -f $0))
cd $base
git fetch --all
git pull

cd $base/../metagather
python3.6 run-merge.py

git commit -a -m "$(date +'%Y%m%d_%H%M%S')"
git push origin
