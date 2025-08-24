[org 0x7c00]
  mov [BOOT_DRIVE], dl ; save boot drive in memory
  mov bp, 0x9000 ; make the stack base pointer register go away
  mov sp, bp ; make it same with top stack pointer

  call load_kernel_to_mem
  jmp switch_to_pm
  jmp $

%include "./disk.asm"
%include "./gdt.asm"
%include "./load.asm"
%include "./pm_print.asm"
%include "./pm_switch.asm"

[bits 32]
main_pm:
  call KERNEL_SGMT
  jmp $

KERNEL_SGMT equ 0x1000
BOOT_DRIVE db 0

; magic number for boot sector
times 510-($-$$) db 0
dw 0xaa55