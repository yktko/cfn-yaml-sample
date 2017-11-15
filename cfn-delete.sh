#!/bin/sh
stack_name=$1; shift
mode=$1; shift
if [ -n "$stack_name" -a "${mode}" == "--delete" ]; then
  aws cloudformation delete-stack --stack-name ${stack_name}
else 
  echo USAGE: $0 stack-name --delete
  exit 1
fi
