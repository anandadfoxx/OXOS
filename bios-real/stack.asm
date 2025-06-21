mov bp, 0x8200 ; Set up stack in memory
mov sp, bp ; Set stack pointer

push 'm'
push 'a'
push 'k'
push 'u'
push 't'
push 'a'
push 'b'
push 'm'
push 'A'

printloop:
  cmp bp, sp
  je exitloop

  pop bx
  mov ah, 0x0e
  mov al, bl

  int 0x10
  jmp printloop

exitloop:
  jmp exitloop

times 510-($-$$) db 0
db 0x55, 0xaa