;; LibReaper Print Example
;; by W3SLAV

.include "LibReaper/header.asm"

Arm9_Start:
      
      ;start graphics
      bl StartGFX
      .include "LibReaper/setup_gfx.asm"
      
      ;load and print our message
      ldr r1,MessageAddress
      bl PrintString

InfLoop:
      b InfLoop

; the contents of our message
MessageAddress:
      .long Message
Message:
      .byte "Hello from LibReaper!!",255
      .align 4

.include "LibReaper/basic_gfx.asm"

Arm9_End:

; We Aren't going to use Arm7 so we will put it in a loop
Arm7_Start:
	b Arm7_Start
Arm7_End: