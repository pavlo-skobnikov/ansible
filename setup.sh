#!/usr/bin/env bash

# NOTE: Before running this script, the Github SSH key must be set up for the
# given device.

# This script is used to setup any MacOS machine as my development environment
#   w/ the help from Ansible.
#
# HINT: This script can be run w/o pulling the repository w/ the following
# command: bash <(curl -s https://raw.githubusercontent.com/pavlo-skobnikov/ansible/main/setup.sh)

# Firstly, let's install Homebrew to manage our packages.
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the current shell's path.
echo >> ~/.zprofile
echo "eval \"$(/opt/homebrew/bin/brew shellenv)\"" >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install ansible to actually run our playbooks.
brew install ansible

# Clone my ansible repository.
git clone git@github.com:pavlo-skobnikov/ansible.git

# Add the directory with the playbooks to the stack.
pushd ~/ansible || exit

# Run the setup playbook.
ansible-playbook ./setup.yml

# Clean up and finish the setup.
popd || exit
