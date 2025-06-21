; go far of stack
mov bp, 0x8000
mov sp, bp

; prepare buffer location
mov bx, 0
mov es, bx
mov bx, 0x9000

; prepare parameters for us to read the disk on second and third sector
mov ah, 2
mov ch, 0
mov dh, 0
mov cl, 2
mov al, 1

; then read the disk now
int 0x13
jc disk_err_handle

; try to print the second sector
mov ah, 0x0e ; switch to tty mode
mov al, [0x9000]
int 0x10

jmp $

disk_err_handle:
  mov ah, 0x0e
  sub al, 0x93
  int 0x10
  jmp $

disk_err_msg:
  db "Error reading disk", 0

times 510-($-$$) db 0
dw 0xaa55

times 512 db 'A' ; sector 2
times 512 db 'B' ; sector 3
