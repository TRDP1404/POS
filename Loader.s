.set MAGIC, 0x1bad002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .mb
    .long MAGIC
    .long FLAGS
    .long CHECKSUM
    

.section .text
.extern _kernel
.global _boot

_boot:
    mov $kernel_stack, %esp
    push %eax
    push %ebx
    call _kernel

_stop:
    cli
    hlt
    jmp _stop




.section .bss
.space 2*1024*1024 # 2 MIB
kernel_stack:
