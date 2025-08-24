gdt_start: ; first 8 bytes of GDT should be NULL
  dd 0x0
  dd 0x0

gdt_code:
  dw 0xffff ; limit low
  dw 0x0 ; base low
  db 0x0 ; base middle
  db 10011010b ; access
  db 11001111b ; flags (4 bits) + segment length, bits 16-19
  db 0x0       ; segment base, bits 24-31

gdt_data:
  dw 0xffff ; limit low
  dw 0x0 ; base low
  db 0x0 ; base middle
  db 10010010b ; access
  db 11001111b ; flags (4 bits) + segment length, bits 16-19
  db 0x0       ; segment base, bits 24-31

gdt_end:

gdt_desc:
  dw gdt_end - gdt_start - 1 ; limit
  dd gdt_start ; base

DATA_SEG equ gdt_data - gdt_start
CODE_SEG equ gdt_code - gdt_start