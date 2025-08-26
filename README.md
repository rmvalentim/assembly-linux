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
Or run the compile.sh script in each folder
```
./compile.sh
``` 

## Running
Run the compiled program:
```
./program
```