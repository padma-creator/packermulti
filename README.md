# packermulti AMI
# packer-ubuntu and linux 
 NOTE: This is not an official Amazon or AWS provided image. This is community built and supported.
# This repository contains resources and configuration scripts for building a custom Amazon ubuntu AMI and linux2 AMI  using packer.
# prerequisties :
install packer version 1.7.4
Process Description :This process uses the HashiCorp tool  packer,Amazon ubuntu AMI Build Setup with HashiCorp Packer. 
  0. Install Packer
  0. Install AWS CLI
  0. Ensure your account has the appropriate policy and permissions as illustrated in the "AWS ImportImage Policies and Permissions" section below....
  0. AWS_ACCESS_KEY_ID,AWS_SECRET_ACCESS_KEY,AWS_DEFAULT_REGION
 # Input variables: 
  0. ami_name,source_ami,ssh_username,instance_type,vpc_id,subnet_id,security_group_id,type
 #  Amazon ubuntu AMI and linux2 AMI Build Specification:
 # Building the AMI:
This packer build contains the different provider you want to use to setup your AMI. An instance is launched and the Packer Shell Provisioner runs the instance and perform other necessary configuration tasks. Then, Packer creates an AMI from the instance and terminates the instance after the AMI is created.
# file:
# source:
This file contains every value you want to set to your build and to configure your aws AMI. You can create a "ami.pkr.hcl"if you want packer read it automatically.
#variable:
This file contains the packer builder ready to setup the build. All the information must be provided into a "variable.pkr.hcl" to define each required variable value.This file contains every variable defintion with the type and default value.
# Provisinoners:
This file use builtin and third-party software to install and configure the machine image after booting.Packer Shell Provisioner runs the JDK software on the instance and perform other necessary configuration tasks.
