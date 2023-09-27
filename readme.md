# This project contains simple NASM programs for Linux

## Install nasm

```
sudo apt update
```
```
sudo apt install nasm
```

## Build

### 1. Assemble source file (on 32 and 64-bit Linux)

```
nasm -f elf filename.asm
```

### 2. Create executable file
on 32-bit Linux:
```
ld filename.o -o filename
```

on 64-bit Linux:
```
ld -m elf_i386 filename.o -o filename
```

## Run

```
./filename
```
