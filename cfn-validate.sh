#!/bin/sh
if [ $# -ne 1 ]; then
  echo $0 template-file-name
  exit 1
fi

aws cloudformation validate-template --template-body file://$1
