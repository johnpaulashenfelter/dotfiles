#!/usr/bin/env bash

# count matched lines is easiest way to handle brew services output
pg11=`brew services list | grep @11 | grep -c stopped`
pg12=`brew services list | grep 'postgresql ' | grep -c stopped`


if [ "$pg11" -eq 1 ]; then
  echo "pg11 stopped"
else
  echo "pg11 running and needs stopped"
  brew services stop postgresql@11
fi

if [ "$pg12" -eq 1 ]; then
  echo "starting latest pg"
  brew services start postgresql
else
  echo "latest pg already running"
fi