#!/bin/bash

# Navigate to the root directory
cd ~

# Create a hidden directory named .cpp_gen
mkdir -p .cpp_gen

# Copy the Makefile and the script into .cpp_gen
cp path_to_your_repo/Makefile .cpp_gen/
cp path_to_your_repo/cpp_gen .cpp_gen/

# Add .cpp_gen to the PATH environment variable
echo 'export PATH=$PATH:$HOME/.cpp_gen' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/.cpp_gen' >> ~/.zshrc

# Source the .bashrc to reflect the changes
source ~/.bashrc