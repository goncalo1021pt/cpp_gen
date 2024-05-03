#!/bin/bash

# Navigate to the root directory
cd ~

# Create a hidden directory named .cpp_gen
git clone https://github.com/goncalo1021pt/cpp_gen.git

# Add .cpp_gen to the PATH environment variable
echo 'export PATH=$PATH:$HOME/.cpp_gen' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/.cpp_gen' >> ~/.zshrc

rm -f .cpp_gen/install.sh

# Source the .bashrc to reflect the changes
source ~/.bashrc
source ~/.zshrc