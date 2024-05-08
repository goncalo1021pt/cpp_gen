#!/bin/bash

# Navigate to the root directory
cd ~

# Create a hidden directory named cpp_gen
if [ -d cpp_gen ]; then
	echo "Directory cpp_gen already exists do you want to overwrite it? (y/n)"
	read answer
	if [ "$answer" == "y" ]; then
		rm -rf cpp_gen
	else
		exit 1
	fi
fi

git clone https://github.com/goncalo1021pt/cpp_gen.git cpp_gen

mv cpp_gen/cpp_gen.sh ~/.local/bin

rm -f cpp_gen/install.sh
rm -f README.md