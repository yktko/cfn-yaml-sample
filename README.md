# CloudFormation Sample with YAML
- https://www.slideshare.net/yktko/cloudformation-getting-started-with-yaml

# To create stacks
- Please refer to create-stacks-commands.txt

# helper scripts
* ./cfn-update.sh (create|update) stack-name template-name [param1=val2 param2=val2 ...]
  * create or update the stack
  * parameters are optional

* ./cfn-validate.sh template-file-name
  * validate template

* ./cfn-status.sh
  * Describe stack status
    * with no option: display the status of all stacks.
    * with stack-name: display the status of specified stack.
    * with stack-name -v: display all the events of specified stack.

* ./cfn-delete.sh stack-name --delete
  * with --delete option (for confirmation), delete specified stack

# Before create stack
- You should be better to add Database master user and master password in EC2 System Manager Parameter Store with encryption.
  - /CfnSmpl/DBUser
  - /CfnSmpl/DBPassword

- Prepare EBS snapshot for basion server's data disk, and specify the parameter BasionVolumeSnapshot.
