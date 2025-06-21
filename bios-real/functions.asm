[org 0x7c00]

mov di, HEX_BUF

print_hex:
  pusha
  mov cx, 0 ; same as int i = 0
  mov dx, 2346

; hex loop parameters
; dx = number to convert
; cx = loop counter
hex_loop:
  cmp cx, 4
  je output_hex

  ; convert the number to hex
  mov ax, dx ; ax as our temp register
  and ax, 0x000f ; get the last 4 bits
  add al, '0'
  cmp al, '9' ; check if it is greater than 9
  jle hex_save_to_buf
  add al, 7 ; add 7 to get the correct ascii value

hex_save_to_buf:
  mov bx, HEX_BUF+5
  sub bx, cx
  mov [bx], al
  ror dx, 4
  inc cx
  jmp hex_loop

output_hex:
  mov ah, 0x0e
  mov al, [di]
  inc di
  cmp al, 0
  je exit
  int 0x10
  jmp output_hex

exit:
  jmp $

HEX_BUF: db "0x0000", 0

times 510-($-$$) db 0
db 0x55, 0xaa