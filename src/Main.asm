;------------------------------------------------------------------------
;-
;-  Mandelbrot set for 65816 processor (SNES)
;-
;-  Andreas Zahnleiter <a.zahnleiter@gmx.d>
;-
;------------------------------------------------------------------------

;=== Include MemoryMap, VectorTable, HeaderInfo ===
.INCLUDE "inc/Main.inc"

;=== Include Library Routines & Macros ===
.INCLUDE "src/InitSNES.asm"
.INCLUDE "src/LoadGraphics.asm"
.INCLUDE "src/2Input.asm"
.INCLUDE "src/Strings.asm"
.INCLUDE "src/QuickSetup.asm"

;=== Global Variables ===

.ENUM $80
	var1	db
	var2	db
.ENDE

;==============================================================================
; main
;==============================================================================

.BANK 0 SLOT 0
.ORG 0
.SECTION "MainCode"

Main:
	InitializeSNES

	jsr QuickSetup	; set VRAM, the video mode, background and character pointers, 
					; and turn on the screen

	jsr JoyInit		;setup joypads and enable NMI

	PrintString "\n -= Mandelbrot set =-"
	PrintString "\n\n by Andreas Zahnleiter"
	PrintString "\n\n"

forever:
	wai	;wait for next frame

	;do whatever you feel like here	

	;let's print the current frame number
	SetCursorPos 20, 10
	ldy #FrameNum
	PrintString "Frame num = %d    "

	jmp forever

.ENDS
