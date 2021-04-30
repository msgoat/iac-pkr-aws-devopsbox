# iac-aws-devopsbox-pkr: Building customs AMI with packer

Showcase to demonstrate how-to build custom AMIs with [Packer](https://www.packer.io/).

To keep things simple this showcase uses the `amazon-ebs` builder.
 
This showcase builds a custom AMI from an Amazon Linux 2 images running the following installation scripts
* Update all system packages
* Install and start Docker
