KERNEL_SGMT equ 0x1000

[org 0x7c00]
  mov bp, 0x9000 ; make the stack base pointer register go away
  mov sp, bp ; make it same with top stack pointer

  jmp switch_to_pm
  jmp $

%include "./print.asm"
%include "./gdt.asm"
%include "./protected_mode_switch.asm"

[bits 32]
main_pm:
  mov ebx, HELLO_WORLD
  call print_str_pm 
  jmp $

HELLO_WORLD db "Hello World from Protected Mode!", 0

times 510-($-$$) db 0
dw 0xaa55