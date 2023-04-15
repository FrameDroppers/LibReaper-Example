;; LibReaper - a collection of helpful assembly scripts for DS programming
;; (c) FrameDroppers 2023

;; header.asm

	.org 0x02000000-0x8000
HeaderStart:
    .ascii "LibReaper :P"
	.ascii "0000"
	.ascii "00"
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0,0,0,0,0,0,0
	.byte 0x00
	.byte 0x00
	.byte 0x00
	.byte 0x04
	.long Arm9_Start-HeaderStart
	.long Arm9_Start
	.long Arm9_Start
	.long Arm9_End-Arm9_Start
	.long Arm7_Start-HeaderStart
	.long 0x03800000
	.long 0x03800000
	.long Arm7_End-Arm7_Start
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0x00586000
	.long 0x001808F8
	.long 0
	.byte 0,0
	.byte 0,0
	.long 0
	.long 0
	.byte 0,0,0,0,0,0,0,0
	.long 0
	.long 0x4000
	.byte 0x04,0x13,0x80,0xE5,0x00,0x20,0x80,0xE5
	.byte 0x40,0x32,0x80,0xE5,0x1A,0x05,0xA0,0xE3,0x1F,0x10,0xA0,0xE3,0x03,0x29,0xA0,0xE3
    .byte 0xB2,0x10,0xC0,0xE0,0x01,0x20,0x52,0xE2,0xFC,0xFF,0xFF,0x1A,0x50,0x41,0x53,0x53
	.byte 0xFE,0xFF,0xFF,0xEA,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte 0xC8,0x60,0x4F,0xE2,0x01,0x70,0x8F,0xE2,0x17,0xFF,0x2F,0xE1,0x12,0x4F,0x11,0x48
	.byte 0x12,0x4C,0x20,0x60,0x64,0x60,0x7C,0x62,0x30,0x1C,0x39,0x1C,0x10,0x4A,0x00,0xF0
    .byte 0x14,0xF8,0x30,0x6A,0x80,0x19,0xB1,0x6A,0xF2,0x6A,0x00,0xF0,0x0B,0xF8,0x30,0x6B
    .byte 0x80,0x19,0xB1,0x6B,0xF2,0x6B,0x00,0xF0,0x08,0xF8,0x70,0x6A,0x77,0x6B,0x07,0x4C
    .byte 0x60,0x60,0x38,0x47,0x07,0x4B,0xD2,0x18,0x9A,0x43,0x07,0x4B,0x92,0x08,0xD2,0x18
    .byte 0x0C,0xDF,0xF7,0x46,0x04,0xF0,0x1F,0xE5,0x00,0xFE,0x7F,0x02,0xF0,0xFF,0x7F,0x02
    .byte 0xF0,0x01,0x00,0x00,0xFF,0x01,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x00
    .byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
    .byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte 0x1A,0x9E
	.byte 0x7B,0xEB
	.long 0
	.long 0
	.long 0
	.long 0

	.space 0x90
	.space 0x7E00
	
	
.equ userram,0x02F10000	
.equ RamArea,0x02F00000
.equ MonitorWidth, 8