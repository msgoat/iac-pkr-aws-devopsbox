packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "devopsbox" {
  ami_name      = "CloudTrain-DevOpsBox-1.6.0-${legacy_isotime("20060102")}.0.x86_64-hvm-eu-west-1-gp2-0"
  instance_type = "t3.micro"
  region        = "eu-west-1"
  source_ami    = "ami-0069d66985b09d219"
#  source_ami_filter {
#    filters = {
#      architecture        = "x86_64"
#      name                = "amazon/amzn2-ami-*"
#      root-device-type    = "ebs"
#      virtualization-type = "hvm"
#    }
#    most_recent = true
#    owners      = ["amazon"] # Amazon
#  }
  ssh_username = "ec2-user"
  tags = {
    Base_AMI_Name = "{{ .SourceAMIName }}"
    Department    = "Automotive Academy"
    Extra         = "<no value>"
    Maintainer    = "Michael Theis (msg)"
    OS_Version    = "Amazon Linux 2"
    Organization  = "msg systems ag"
    Project       = "CloudTrain"
    Release       = "Latest"
  }
}

build {
  sources = ["source.amazon-ebs.devopsbox"]

  provisioner "shell" {
    scripts = ["./scripts/init.sh", "./scripts/install_docker.sh"]
  }

}
