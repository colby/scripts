#!/bin/bash

ssh git@github.com || echo "Your SSH key is not loaded."

for d in $(find $HOME/.vim/bundle -type d -d 1)
do
    echo ${d}:
    cd "$d" && git checkout master && git fetch origin && git pull && sleep 5 # NOTE: sleep for github connection limits
done
