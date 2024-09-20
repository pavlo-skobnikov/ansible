#!/usr/bin/env bash

# This script is used to setup any MacOS machine as my development environment
#   w/ the help from Ansible.
#
# HINT: This script can be run w/o pulling the repository w/ the following
# command: bash <(curl -s https://raw.githubusercontent.com/pavlo-skobnikov/ansible/main/setup.sh)

# Firstly, let's install Homebrew to manage our packages.
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Then, install ansible to actually run our playbooks.
brew install ansible

# Lastly, pull down the Ansible playbook and run it.
ansible-pull -U https://github.com/pavlo-skobnikov/ansible.git --tags "configs-and-environment,tools-cli,tools-ui"
