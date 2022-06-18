#!/bin/bash

function write_version() {
  tag=$1
  echo "def version():\n  print('$tag')" > 'mltk/version.py'
}

function update_tag() {
  tag=$1

  # force create tag
  git tag -f $tag

  # remove tag on origin
  git push origin :refs/tags/$tag

  # push with tags
  git push origin $tag
}

function deploy_tag() {
  tag=$1

  if [ ! -z "$tag" ]
    then
      # write version file
      write_version $tag

      # commit version file
      git add mltk/version.py
      git commit --amend --no-edit
      git push -f

      # update tag
      update_tag $tag
  fi
}

function deploy_all() {
  tag=$1

  if [ ! -z "$tag" ]
    then
      # write version file
      write_version $tag

      # commit version file
      git add .
      git commit --amend --no-edit
      git push -f

      # update tag
      update_tag $tag
  fi
}

[[ $1 == "tag" ]] && deploy_tag $2
[[ $1 == "all" ]] && deploy_all $2