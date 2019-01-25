#! /bin/bash
set -e
set -x

base=$(dirname $(readlink -f $0))
vars=$(readlink -f $base/../wow-sirus-shared/SavedVariables)

if [[ ! -d "$vars" ]]; then
  echo "directory SavedVariables hasn't found." 1>&2
  exit 1
fi

src=$base/GatherMate.lua
dst=$vars/GatherMate.lua

bak=$vars/GatherMate.$(date +'%Y%m%d%H%M%S').bak

[ -e $dst ] &&  mv $dst $bak
cp $src $dst
