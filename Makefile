ASM     = nasm #p
CC      = gcc
LD      = ld
ASFLAGS = -f elf32
CFLAGS  = -m32 -c -Wall -Wextra -ffreestanding -fno-pie -fno-stack-protector
LDFLAGS = -m elf_i386 -T link.ld

OBJS = kernasm.o kernc.o

all: kernel

kernel: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

kernasm.o: kernel.asm
	$(ASM) $(ASFLAGS) $< -o $@

kernc.o: kernel.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) kernel

run:
	qemu-system-i386 -kernel kernel


# My notes on Makefiles. (Because Makefiles are COOOL)
#
#targets : prerequisites
#	commands
#	....
#	....
#	....
# Variables are typically shown by :=, but = is also fine.
#
#
