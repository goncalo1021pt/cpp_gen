#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "Usage: cpp_gen.sh <project_name> [class_name...]"
	exit 1
fi

if [ -d $1 ]; then
	echo "Error: Directory $1 already exists"
	exit 1
fi

PROJECT_NAME="$1"
mkdir "$PROJECT_NAME" && cd "$PROJECT_NAME"
cp ~/cpp_gen/Makefile .
sed -i "s/NAME =/NAME = $PROJECT_NAME/" Makefile
shift


mkdir includes srcs 

touch srcs/main.cpp
for CLASS_NAME in "$@"
do
	# Create .h file
	cat << EOF > includes/$CLASS_NAME.h
#ifndef ${CLASS_NAME}_H
# define ${CLASS_NAME}_H

# include "$CLASS_NAME.hpp"

#endif
EOF
	# Create .hpp file
	cat << EOF > includes/$CLASS_NAME.hpp
#ifndef ${CLASS_NAME}_HPP
# define ${CLASS_NAME}_HPP

# include <iostream>

typedef std::string t_string;

class $CLASS_NAME {
	private:

	public:
		$CLASS_NAME();
		~$CLASS_NAME();
		$CLASS_NAME(const $CLASS_NAME &other);
		$CLASS_NAME &operator=(const $CLASS_NAME &other);
};
#endif
EOF
	# Create .cpp file
	cat << EOF > srcs/$CLASS_NAME.cpp
#include "$CLASS_NAME.h"

$CLASS_NAME::$CLASS_NAME() {
	std::cout << "Default constructor called" << std::endl;
}

$CLASS_NAME::~$CLASS_NAME() {
	std::cout << "Destructor called" << std::endl;
}

$CLASS_NAME::$CLASS_NAME(const $CLASS_NAME &other) {
	*this = other;
}

$CLASS_NAME &$CLASS_NAME::operator=(const $CLASS_NAME &other) {
	(void)other;
	return *this;
}
EOF

	# Add includes to main.cpp
	echo "#include \"$CLASS_NAME.h\"" >> srcs/main.cpp
done

# Add main function to main.cpp
cat << EOF >> srcs/main.cpp

int main() {
	return 0;
}
EOF