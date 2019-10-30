#!/usr/bin/env bash

set -o errexit -o nounset
cd $1

for file in *
do
    dir="${file%.*}"
    mkdir -p -- "$dir"
    mv -- "$file" "$dir"
done