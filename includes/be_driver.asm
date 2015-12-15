;
; BEEPER ENGINE MUSIC DRIVER
;


; Reset the music driver
be_track_reset	lda #$00
		sta be_pattn_cnt

; Fetch the next pattern to play from track data
be_pattn_fetch	ldx be_pattn_cnt
		lda be_track_00,x
		cmp #eod
		beq be_track_reset

		asl
		tax
		lda be_pattn_pos+$00,x
		sta be_pattn_read+$01
		lda be_pattn_pos+$01,x
		sta be_pattn_read+$02

		inc be_pattn_cnt

		rts


; Read the next byte of the pattern
be_pattn_read	lda be_pattn_00
		cmp #eod
		bne be_pattn_bump

		jsr be_pattn_fetch
		jmp be_pattn_read

be_pattn_bump	inc be_pattn_read+$01
		bne *+$05
		inc be_pattn_read+$02
		rts


; Fetch and play the next note
be_pattn_play	jsr be_pattn_read
		tax
		lda be_note_freqs,x
		sta be_snd_freq
		jsr be_pattn_read
		sta be_snd_dur

		cpx #off
		beq be_snd_off_play

; Zapac's tone generator
be_snd_on_play	lda speaker
		ldx be_snd_freq
be_snd_on_loop	dex
		beq be_snd_on_play
		nop
		nop
		dey
		bne be_snd_on_loop
		dec be_snd_dur
		bne be_snd_on_loop
		rts

; Dummy loop for "off" (so the timing is the same)
be_snd_off_play	nop
		nop
		ldx be_snd_freq
be_snd_off_loop	dex
		beq be_snd_off_play
		nop
		nop
		dey
		bne be_snd_off_loop
		dec be_snd_dur
		bne be_snd_off_loop
		rts


; Note frequency table
be_note_freqs	!byte $ff,$f1,$e3,$d6,$ca,$bf,$b4,$aa,$a1,$98,$8f,$87
		!byte $80,$79,$72,$6c,$66,$60,$5b,$55,$51,$4c,$48,$44
		!byte $40,$3c,$39,$36,$33,$30,$2d,$2b,$28,$26,$24,$22

; Note commands for the music data - x is a sharp
c_1		= $00
cx1		= $01
d_1		= $02
dx1		= $03
e_1		= $04
f_1		= $05
fx1		= $06
g_1		= $07
gx1		= $08
a_1		= $09
ax1		= $0a
b_1		= $0b

c_2		= $0c
cx2		= $0d
d_2		= $0e
dx2		= $0f
e_2		= $10
f_2		= $11
fx2		= $12
g_2		= $13
gx2		= $14
a_2		= $15
ax2		= $16
b_2		= $17

c_3		= $18
cx3		= $19
d_3		= $1a
dx3		= $1b
e_3		= $1c
f_3		= $1d
fx3		= $1e
g_3		= $1f
gx3		= $20
a_3		= $21
ax3		= $22
b_3		= $23

off		= $3f
eod		= $ff

; Duration commands for the music data
dur01		= $0e
dur02		= dur01*$02
dur03		= dur01*$03
dur04		= dur01*$04
dur05		= dur01*$05
dur06		= dur01*$06
dur07		= dur01*$07
dur08		= dur01*$08
dur09		= dur01*$09
dur0a		= dur01*$0a
dur0b		= dur01*$0b
dur0c		= dur01*$0c
dur0d		= dur01*$0d
dur0e		= dur01*$0e
dur0f		= dur01*$0f
dur10		= dur01*$10
