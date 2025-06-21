[org 0x7c00]

mov bx, welcomestr ; save the pointer location on memory to reg
jmp loop

loop:
	mov ah, 0x0e ; set to tty mode
	mov al, [bx] ; prepare char on register for output
	inc bx ; goto next char

	cmp al, 0
	je exitloop

	int 0x10
	; mov al, bl
	; int 0x10

	jmp loop

welcomestr:
	db "Welcome to OXX Bootloader!", 0	

exitloop:
	jmp $

times 510-($-$$) db 0
dw 0xaa55
