#! /bin/bash
#
# формат расположения общего файла данных:
# <something>/WTF/Account/<AccountName>/SavedVariables/GatherMate.lua
#

set -e
# set -x

ts=$(date +'%Y%m%d%H%M%S')
this=$(dirname $(readlink -f "$0"))
src="$this/GatherMate.lua"
base=$(dirname "$this")

for dst in `find $base -depth -type f -name GatherMate.lua |
grep -e '.*/sirus_[^/]\+/WTF/Account/[^/]\+/SavedVariables/GatherMate\.lua' |
grep -v "$this"` ; do
  echo "$dst"
  bak="$(dirname $dst)/GatherMate.$ts.bak"
  [ -e "$dst" ] && mv "$dst" "$bak"
  cp "$src" "$dst"
done
