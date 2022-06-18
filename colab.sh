#!/bin/bash

# parameters
tag=$1

# clone repo
git clone -q https://github.com/ramesaliyev/mltk.git

# use the correct version
if [ ! -z "$tag" ]
  then
    cd mltk
    git checkout -q tags/$tag
    echo 'MLTK v='$tag
fi