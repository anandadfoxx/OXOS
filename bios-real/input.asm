loop:
  call input_loop
  call output
  jmp loop

input_loop:
  mov ah, 0
  int 0x16
  ret

output:
  mov ah, 0x0e
  int 0x10
  ret

times 510-($-$$) db 0
db 0x55, 0xaa