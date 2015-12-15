;
; SEPTIC
;


; Code, graphics, wiring and music driver by T.M.R/Cosine
; Beeper code by Zapac
; Original music by Martin Galway

; Built around a simple, one channel music driver originally based on the
; code and frequncy tables from http://eightbitsoundandfury.ld8.org/
; which was then updated to use Zapac's tidier reworking of that code.


; This source code is formatted for the ACME cross assembler from
; http://sourceforge.net/projects/acme-crossass/


; Select an output filename
		!to "septic#060812",plain


; Standard A2 register declarations
		!src "includes/registers.asm"

; Beeper sound labels
be_snd_freq	= $03f0
be_snd_dur	= $03f1
be_pattn_cnt	= $03f2

; Demo labels
text_tmr	= $03f3

text_bmp	= $2000


; Yank in binary data
		* = $2000
		!binary "data/death.raw"

font_data	!binary "data/charset.raw"


; Set origin point (must be the same as the last four bytes of !to)
		* = $0812

; Code entry point
entry		jsr be_track_reset
		jsr reset

; Enable bitmapped graphics mode
		lda #$00
		sta txtclr
		sta hires


; The main loop of the demo
main_loop	jsr be_pattn_play

; Check to see if the pattern counter has gone up...
		lda be_pattn_cnt
		cmp text_tmr
		beq main_loop
		sta text_tmr

; ...and if so, update the message line
		ldx #$00
mread		lda scroll_text
		bne okay
		jsr reset
		jmp mread
okay		sta $0400,x
		inc mread+$01
		bne *+$05
		inc mread+$02
		inx
		cpx #$28
		bne mread

; Write the new text to bitmap
		ldx #$00
bmp_draw	ldy $0400,x
		lda font_data+$000,y
		sta text_bmp+$0000,x
		lda font_data+$040,y
		sta text_bmp+$0400,x
		lda font_data+$080,y
		sta text_bmp+$0800,x
		lda font_data+$0c0,y
		sta text_bmp+$0c00,x
		lda font_data+$100,y
		sta text_bmp+$1000,x
		lda font_data+$140,y
		sta text_bmp+$1400,x
		lda font_data+$180,y
		sta text_bmp+$1800,x
		lda font_data+$1c0,y
		sta text_bmp+$1c00,x

		lda font_data+$200,y
		sta text_bmp+$0080,x
		lda font_data+$240,y
		sta text_bmp+$0480,x
		lda font_data+$280,y
		sta text_bmp+$0880,x
		lda font_data+$2c0,y
		sta text_bmp+$0c80,x
		lda font_data+$300,y
		sta text_bmp+$1080,x
		lda font_data+$340,y
		sta text_bmp+$1480,x
		lda font_data+$380,y
		sta text_bmp+$1880,x
		lda font_data+$3c0,y
		sta text_bmp+$1c80,x
		inx
		cpx #$28
		bne bmp_draw

		jmp main_loop


; Reset the "scrolling" message
reset		lda #<scroll_text
		sta mread+$01
		lda #>scroll_text
		sta mread+$02
		rts


; Include the music driver and tune data
		!src "includes/be_driver.asm"
		!src "includes/be_mps.asm"


; The "scrolling" message text
scroll_text	!scr "       beep beep beepy beeeeep...       "
		!scr "welcome to  -=- septic -=-  from cosine!"
		!scr "                                        "

		!scr "okay, this release isn't much to look at"
		!scr "but playing even these simple notes will"
		!scr "tie up the cpu!   the source code can be"
		!scr " examined over at github for anyone who "
		!scr "fancies trying to improve on the driver."
		!scr "                                        "

		!scr "code, driver and cosmetics ....... t.m.r"
		!scr "tone playing routine ............. zapac"
		!scr "one voice tune ........... martin galway"
		!scr "nicked from microprose soccer on the c64"
		!scr "                                        "

		!scr " cosine's a-z greetings meander towards "
		!scr "abyss connection, arkanix labs, artstate"
		!scr " ate bit, booze design, camelot, chorus "
		!scr "   chrome, cncd, cpu, crescent, crest   "
		!scr "      covert bitops,  defence force     "
		!scr "dekadence, desire, dac, dmagic, dualcrew"
		!scr "  exclusive on, fairlight, fire, focus  "
		!scr "      french touch, funkscientist,      "
		!scr " genesis project, gheymaid inc., hitmen "
		!scr "     hokuto force, level64, m and m     "
		!scr " maniacs of noise, meanteam, metalvotze "
		!scr "   noname, nostalgia, nuance, offence   "
		!scr "  onslaught, orb, oxyron, padua, plush  "
		!scr "     psytronik, reptilia,  resource     "
		!scr "   rgcd, secure, shape, side b, slash   "
		!scr "   slipstream, success and trc, style   "
		!scr "  suicyco industries, taquart, tempest  "
		!scr "  tek, triad, trsi, viruz, vision, wow  "
		!scr "   wrath, xenon and anyone we forgot!   "
		!scr "                                        "

		!scr "don't forget to visit the cosine website"
		!scr "for 8-bit delights http://cosine.org.uk/"
		!scr "                                        "

		!scr "-=-  t.m.r signing off - 2015-12-15  -=-"
		!scr "                                        "

		!byte $00		; end of text
