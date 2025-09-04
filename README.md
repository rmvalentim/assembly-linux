# Assembly Linux Projects

## Prerequisites
-   Linux Operating System
-   NASM
```
sudo apt update
sudo apt install nasm 
```

## Compiling and Linking
Use the following command:
```
nasm -f elf64 [filename].asm
ld -s -o [filename] [filename].o
``` 
Or use the makefile in each folder:
```
make
``` 

## Running
Run the compiled program:
```
./program
```