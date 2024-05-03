#!/bin/bash

# Navigate to the root directory
cd ~

# Create a hidden directory named .cpp_gen
git clone https://github.com/goncalo1021pt/cpp_gen.git .cpp_gen

# Add .cpp_gen to the PATH environment variable
if [ -f ~/.bashrc ]; then
	echo 'export PATH=$PATH:$HOME/.cpp_gen' >> ~/.bashrc
fi

if [ -f ~/.zshrc ]; then
	echo 'export PATH=$PATH:$HOME/.cpp_gen' >> ~/.zshrc
fi

rm -f .cpp_gen/install.sh

# Source the .bashrc to reflect the changes
source ~/.bashrc
source ~/.zshrc