#!/bin/sh -v
./cfn-update.sh update yaml-stack-r53  yaml-r53.yaml
./cfn-update.sh update yaml-stack-eip  yaml-eip.yaml         R53StackName=yaml-stack-r53

./cfn-update.sh update yaml-stack2     yaml-template.yaml
./cfn-update.sh update yaml-stack2-nw  yaml-sec.yaml         BaseStackName=yaml-stack2
./cfn-update.sh update yaml-stack2-db  yaml-rds.yaml         BaseStackName=yaml-stack2     SecStackName=yaml-stack2-nw

 ./cfn-update.sh create yaml-stack2-basion yaml-basion.yaml BaseStackName=yaml-stack2     SecStackName=yaml-stack2-nw EIPStackName=yaml-stack-eip OSImage=ami-47bf0821 BasionVolumeSnapshot=snap-00cdbf9a99c80eb05

./cfn-update.sh update yaml-stack-aurora yaml-aurora.yaml    SecStackName=yaml-stack2-nw BaseStackName=yaml-stack2 DBPassword=dbpassword DBUser=dbuser

./cfn-update.sh update yaml-stack-alb yaml-alb.yaml BaseStackName=yaml-stack2     SecStackName=yaml-stack2-nw

./cfn-update.sh update yaml-stack-asg yaml-autoscale.yaml BaseStackName=yaml-stack2     SecStackName=yaml-stack2-nw DBStackName=yaml-stack2-db ALBStackName=yaml-stack-alb





