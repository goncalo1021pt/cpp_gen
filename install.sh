#!/bin/bash

# Navigate to the root directory
cd ~

# Create a hidden directory named cpp_gen
if [ -d cpp_gen ]; then
     rm -rf cpp_gen
fi

git clone https://github.com/goncalo1021pt/cpp_gen.git cpp_gen

if [ -d ~/.local/bin ]; then
	mkdir -p ~/.local/bin
fi

if [ -f ~/.local/bin/cpp_gen.sh ]; then
	rm -f ~/.local/bin/cpp_gen.sh
fi

mv cpp_gen/cpp_gen.sh ~/.local/bin

rm -f cpp_gen/install.sh
rm -f cpp_gen/README.md