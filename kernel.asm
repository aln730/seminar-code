    bits 32                         ;nasm directive for 32 bit
    section .text
    ;mulitboot spec
    align 4
    dd 0x1BADB002               ;magic numbers
    dd 0x00                     ;flags
    dd - (0x01BADB002 + 0x00)   ;checksum

    global start                ;sets symbols from source code as global
    extern kmain                ;main function in C file

start:
    cli                         ;clear interrupts
    mov esp, stack_space        ;set stack pointersyy
    call kmain                  ;calls the main function from c file
    hlt                         ;halts the CPU

    section .bss
    resb 8192                   ;8KB memory reserved for the stack
stack_space:
