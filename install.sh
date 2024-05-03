#!/bin/bash

# Navigate to the root directory
cd ~

# Create a hidden directory named .cpp_gen
git clone https://github.com/goncalo1021pt/cpp_gen.git .cpp_gen

# Add .cpp_gen to the PATH environment variable
if [ -f ~/.bashrc ] && ! grep -q 'export PATH=$PATH:$HOME/.cpp_gen' ~/.bashrc; then
    echo 'export PATH=$PATH:$HOME/.cpp_gen' >> ~/.bashrc
fi

if [ -f ~/.zshrc ] && ! grep -q 'export PATH=$PATH:$HOME/.cpp_gen' ~/.zshrc; then
    echo 'export PATH=$PATH:$HOME/.cpp_gen' >> ~/.zshrc
fi

rm -f .cpp_gen/install.sh

# Source the .bashrc or .zshrc to reflect the changes
if [ "$SHELL" = "/bin/bash" ] && [ -f ~/.bashrc ]; then
    source ~/.bashrc
elif [ "$SHELL" = "/bin/zsh" ] && [ -f ~/.zshrc ]; then
    source ~/.zshrc
fi