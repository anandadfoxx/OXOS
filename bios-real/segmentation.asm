mov ah, 0x0e

mov al, texxt
int 0x10

mov bx, 0x7c0
mov ds, bx

mov al, [ds:texxt]
int 0x10

mov al, [texxt]
int 0x10

texxt:
  db "X"

times 510-($-$$) db 0
dw 0xaa55