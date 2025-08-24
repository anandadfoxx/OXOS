disk_load:
  pusha

  mov al, 0x10 ; load bigger sector size for the kernel
  mov ch, 0x00
  mov cl, 0x02 ; 0x02 is the sector where the kernel code provides
  mov dh, 0x00
  mov ah, 0x02
  int 0x13

  popa
  ret