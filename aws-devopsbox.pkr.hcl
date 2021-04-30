packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "devopsbox" {
  ami_name      = "CloudTrain-DevOpsBox-1.5.0-${legacy_isotime("20060102")}.0.x86_64-hvm-eu-west-1-gp2-0"
  instance_type = "t3.micro"
  region        = "eu-west-1"
  source_ami    = "ami-0a3f5ff1cb905da33"
  ssh_username  = "ec2-user"
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
