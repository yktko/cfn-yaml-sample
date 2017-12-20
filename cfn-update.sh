#!/bin/sh
mode=$1;       shift
stack_name=$1; shift
template=$1;   shift

if [ "$mode" != "create" -a "$mode" != "update" ]; then
  echo "$0 (create|update) stack-name template-name [param1=val2 param2=val2 ...]"
  exit 1
fi

params=$(echo $* | perl -np -e "s/([^= ]+)=([^ ]+)/ParameterKey=\1,ParameterValue=\2/g")

if [ "$params" != "" ]; then
  params="--parameters ${params}"
fi

cmd="aws cloudformation ${mode}-stack --stack-name ${stack_name} --template-body file://${template} --capabilities CAPABILITY_IAM $params"
eval ${cmd}
