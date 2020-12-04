#!/bin/bash -e

PREFIX="scripts:git-fetch"

{
   git checkout master
   git pull --tags
   git fetch --all
   git fetch -p
} || {
   echo "$PREFIX -> Error"
}

if [ -z "$1" ];
then
   echo "$PREFIX -> Not branch for delete";
else
   {
      git branch -D $1
      echo "$PREFIX -> The $1 branch was deleted"
   } || {
      echo "$PREFIX -> The $1 branch have was error to the delete"
   }
fi

