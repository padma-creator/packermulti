variable "ubuntu_ami_id" {
  type    = string
}

variable "linux_ami_id" {
  type    = string
}

variable "access_key" {
  type    = string
}

variable "secret_key" {
  type    = string
}

variable "region" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "linux_ssh_username" {
  type    = string
}

variable "ubuntu_ssh_username" {
  type    = string
}

variable "linux_ami_name" {
  type    = string
}

variable "ubuntu_ami_name" {
  type    = string
}

variable "vpc_id" {
  type    = string
}

variable "subnet_id" {
  type    = string
}

variable "security_group_id" {
  type    = string
}


source "amazon-ebs" "linux_ami" {
  ami_name      = "${var.linux_ami_name}"
  source_ami    = "${var.linux_ami_id}"
  ssh_username  = "${var.linux_ssh_username}"
  access_key =  "${var.access_key}"
  secret_key =  "${var.secret_key}"
  region =  "${var.region}"
  instance_type =  "${var.instance_type}"
  vpc_id =  "${var.vpc_id}"
  subnet_id =  "${var.subnet_id}"
  security_group_id =  "${var.security_group_id}"
}

source "amazon-ebs" "ubuntu_ami" {
  ami_name      = "${var.ubuntu_ami_name}"
  source_ami    = "${var.ubuntu_ami_id}"
  ssh_username  = "${var.ubuntu_ssh_username}"
  access_key =  "${var.access_key}"
  secret_key =  "${var.secret_key}"
  region =  "${var.region}"
  instance_type =  "${var.instance_type}"
  vpc_id =  "${var.vpc_id}"
  subnet_id =  "${var.subnet_id}"
  security_group_id =  "${var.security_group_id}"
}

build {
  sources = [
    "source.amazon-ebs.linux_ami",
    "source.amazon-ebs.ubuntu_ami",
  ]
  provisioner "shell" {
    # This provisioner only runs for the 'linux_ami' source.
    only = ["amazon-ebs.linux_ami"]

    inline = [
      "sleep 30",
      "sudo yum update -y",
      "sudo yum install -y java-1.8.0"
    ]
  }
  provisioner "shell" {
    # This provisioner only runs for the 'ubuntu_ami' source.
    only = ["amazon-ebs.ubuntu_ami"]
    inline = [
      "sleep 30",
      "sudo apt-get update -y",
      "sudo apt install default-jre -y"
      ]
  }
}

