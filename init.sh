#!/bin/bash

for file in data/*/init.sh
do
  printf "\n\nPREPARING DATA $file...\n"
  sh "$file"
done

if [ ! -f fastText/fasttext ]; then
    printf "\n\nDOWNLOADING FASTTEXT...\n"
    cd fastText
    git pull
    printf "\n\nBUILDING FASTTEXT...\n"
    make
    cd ..
fi
