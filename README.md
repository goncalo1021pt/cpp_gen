# cpp_gen

`cpp_gen` is a 42 cpp project generator. It helps you to quickly set up a new cpp project with classes in orthodox canonical form.

## Installation

Follow these steps to install `cpp_gen`:

Run the following command in your terminal:
```bash
curl -sSL https://github.com/goncalo1021pt/cpp_gen/blob/main/install.sh | bash
```
After running the command, verify that the local bin directory is in your PATH. This is necessary so that you can run the cpp_gen.sh script from any directory. If it is not, add the following line to your .bashrc or .zshrc file:
```bash
export PATH=$PATH:$HOME/.local/bin
```
After the installation you can change the Makefile in the `~/cpp_gen` directory to your liking.
Just make sure to keep the NAME variable as it is, since it is used to generate the project name.

## Usage

After installation, you can use `cpp_gen.sh` to generate a new cpp project on your current directory. 
If the program only has 1 argument it will create the project. All other aguments will be classes of that program.
Here's an example:

```bash
cpp_gen.sh my_new_project optional_class1 optional_class2
```
