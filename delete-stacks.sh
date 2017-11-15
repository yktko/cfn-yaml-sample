#!/bin/sh -v
aws cloudformation delete-stack --stack-name yaml-stack2
aws cloudformation delete-stack --stack-name yaml-stack2-nw
aws cloudformation delete-stack --stack-name yaml-stack2-db
aws cloudformation delete-stack --stack-name yaml-stack2-ec2
# aws cloudformation delete-stack --stack-name yaml-stack-eip
# aws cloudformation delete-stack --stack-name yaml-stack-r53
