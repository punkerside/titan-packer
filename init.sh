#!/bin/bash

# init ansible
rm -rf ansible/roles/common/ && rm -rf .ansible/roles/punkerside.ansible_ubuntu_common/
ansible-galaxy install punkerside.ansible_ubuntu_common --force
mv .ansible/roles/punkerside.ansible_ubuntu_common/ ansible/roles/common/

# init packer
packer init packer/config.pkr.hcl

packer build \
  -var 'project='${PROJECT}'' \
  -var 'env='${ENV}'' \
  -var 'service='${SERVICE}'' \
  -var 'subnet_id='${SUBNET_ID}'' \
packer/config.pkr.hcl