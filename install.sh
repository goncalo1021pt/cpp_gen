#!/bin/bash

# Navigate to the root directory
cd ~

# Create a hidden directory named cpp_gen
git clone https://github.com/goncalo1021pt/cpp_gen.git cpp_gen

mv cpp_gen/cpp_gen.sh .local/bin

rm -f cpp_gen/install.sh
rm -f README.md