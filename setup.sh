#!/usr/bin/env bash

# This script is used to setup any MacOS machine as my development environment
#   w/ the help from Ansible.

# Firstly, let's install Homebrew to manage our packages.
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Then, install to actually run our playbooks.
brew install ansible

# Lastly, pull down the Ansible playbook and run it.
ansible-pull -U https://github.com/pavlo-skobnikov/ansible.git
