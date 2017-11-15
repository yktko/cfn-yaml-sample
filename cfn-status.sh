#!/bin/sh
stack_name=$1; shift
if [ "$stack_name" == "" ]; then
  aws cloudformation describe-stacks
  exit
fi

mode=$1; shift
if [ "${mode}" == "-v" ]; then
  aws cloudformation describe-stack-events --stack-name ${stack_name} --query 'reverse(StackEvents[])'
  exit
fi

aws cloudformation describe-stacks --stack-name ${stack_name}
