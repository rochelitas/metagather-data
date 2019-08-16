#! /bin/bash
base=$(dirname $(readlink -f $0))
cd $base
branch=$(git branch | awk '/^\* /{print gensub(/^../, "", $0);}')
git fetch --all
git pull origin $branch

cd $base/../metagather
python3.6 run-merge.py

cd $base
git commit -a -m "$(date +'%Y%m%d_%H%M%S')"
git push origin $branch
