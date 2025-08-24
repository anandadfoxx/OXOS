load_kernel_to_mem:
  pusha

  mov dl, [BOOT_DRIVE]
  mov bx, KERNEL_SGMT
  call disk_load

  popa
  ret