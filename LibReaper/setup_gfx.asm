;; LibReaper - a collection of helpful assembly scripts for DS programming
;; (c) FrameDroppers 2023

;; setup_gfx.asm

StartGFX:
	mov sp,#0x03000000
	mov r0, #0x4000000
	add r0, r0, #0x304
	mov r1, #0x8003
	str r1, [r0]
	mov r0, #0x04000000
	mov r1, #0x00020000
	str r1, [r0]
	mov r0, #0x04000000
	add r0, r0, #0x240
	mov r1, #0x80
	strb r1, [r0]
    mov r0, #0x04001000
	mov r1, #0x00010400
	add r1,r1,#5
	str r1, [r0]
	mov r0,#0x04001000	
	add r0,r0,#0xC
	mov r1,#0b0000000000000000
	strh r1, [r0]
	mov r2,#0x0100
	mov r1,#0
	mov r0, #0x04000000
	add r0, r0, #0x242
    mov r1, #0x84
	strb r1, [r0]

	bl cls
		