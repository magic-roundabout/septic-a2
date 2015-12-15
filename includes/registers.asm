; SYSTEM EQUATES
kbd_read	= $c000
kbd_strobe_clr	= $c010

rd_vbl_bar	= $c019


; Speaker toggle
speaker		= $c030


; Mode controllers
txtclr		= $c050		; select bitmap mode
txtset		= $c051		; select text mode
mixclr		= $c052		; full screen
mixset		= $c053		; split screen (last four lines are text)

txtpage1	= $c054		; select text buffer 1 ($0400)
txtpage2	= $c055		; select text buffer 2 ($0x00)

lores		= $c056		; display low res graphics
hires		= $c057		; display high res graphics