# This project contains simple NASM programs for Linux

## Build
nasm -f elf <filename>.asm
ld -m elf_i386 <filename>.o -o <filename>

## Run
./<filename>
