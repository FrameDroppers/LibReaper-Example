;; LibReaper - a collection of helpful assembly scripts for DS programming
;; (c) FrameDroppers 2023

;; basic_gfx.asm

NewLine:
	STMFD sp!,{r0-r12, lr}
		mov r3,#CursorX
		mov r0,#0
		strB r0,[r3]	;X
		
		mov r3,#CursorY
		ldrB r0,[r3]	;Y
		add r0,r0,#1
		strB r0,[r3]	;Y
	LDMFD sp!,{r0-r12, pc}

PrintString:
	STMFD sp!,{r0-r12, lr}
PrintStringAgain:
		ldrB r0,[r1],#1
		cmps r0,#255
		beq PrintStringDone
		bl printchar 
		b PrintStringAgain
PrintStringDone:
	LDMFD sp!,{r0-r12, pc}
	

	
PrintChar:
	STMFD sp!,{r0-r12, lr}
		mov r3,#0x06800000 	;VRAM base
		
		mov r5,#CursorX
		ldrB r4,[r5]		;Xpos
		add r3,r3,r4, lsl #4;Xpos * 16
		
		mov r5,#CursorY
		ldrB r4,[r5]		;Ypos
		mov r5,#256*8*2		;Ypos * 8 lines
		mul r2,r5,r4
		add r3,r3,r2
				
				
		adr r4,BitmapFont 	;Font source
		sub r0,r0,#32		;First Char is 32 (Space)
		add r4,r4,r0,asl #3	;8 bytes per char
		
		
		
		mov r1,#8			;8 lines 
DrawLine:
		mov r7,#8 			;8 pixels per line
		ldrb r8,[r4],#1		;Load Letter
		mov r9,#0b100000000	;Mask

		;color is defined by a BGR15 value
		mov r2, #0b0111111111111111
DrawPixel:
		tst r8,r9			;Is bit 1?
		strneh r2,[r3]		;Yes? then fill pixel
		add r3,r3,#2
		mov r9,r9,ror #1	;Bitshift Mask
		subs r7,r7,#1
		bne DrawPixel		;Next Hpixel
		
		add r3,r3,#512-16	;Move Down a line
		subs r1,r1,#1
		bne DrawLine		;Next Vline
		
		mov r3,#CursorX
		ldrB r0,[r3]	
		add r0,r0,#1		;Move across screen
		strB r0,[r3]	
	LDMFD sp!,{r0-r12, pc}

GetScreenPos: ;R1,R2 = X,Y
	STMFD sp!,{r2}
		STMFD sp!,{r1}
			mov r10,#0x06800000   ;Upper Screen VRAM
			
			cmp r2,#192			  ;Line 192+ on lower screen
			movcs r10,#0x06200000 ;Lower Screen VRAM
			subcs r2,r2,#192
			
			mov r1,#512		;Ypos * 256*2 
			mul r2,r1,r2
		LDMFD sp!,{r1}	
		add r10,r10,r2 
		add r10,r10,r1		;Xpos * 2 (2 bytes per pixel)
		add r10,r10,r1
	LDMFD sp!,{r2}
	MOV pc,lr
	
GetNextLine:
	add r10,r10,#512		;256 pixels per line 
	MOV pc,lr

cls:
		mov r3,#CursorX
		mov r0,#0
		strB r0,[r3]	;X
		mov r3,#CursorY
		strB r0,[r3]	;Y

		mov r0, #0x06800000	;Top Screen
		mov r3, #0x06200000 ;Bottom screen
		mov r2, #256*192/2
		; the color is defined with a BGR15 value
		mov r1, #0b1000000000000000
		add r1,r1,#0x00000000
CLS_loop:
		str r1, [r0],#4	;Clear Top Screen
		str r1, [r3],#4	;Clear Bottom Screen
		subs r2, r2, #1
		bne CLS_loop
	MOV PC,LR


;import locations are always based on the location of the main file
.include "LibReaper/font.asm"

.equ CursorX,RamArea+0
.equ CursorY,RamArea+1