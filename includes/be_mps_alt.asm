;
; MICRPROSE SOCCER (INDOOR) - TUNE 9
;


; Track data
be_track_00	!byte $00,$01,$00,$02,$00,$03,$00,$04
		!byte eod

; Pattern reference table
be_pattn_pos	!byte <be_pattn_00,>be_pattn_00
		!byte <be_pattn_01,>be_pattn_01
		!byte <be_pattn_02,>be_pattn_02
		!byte <be_pattn_03,>be_pattn_03
		!byte <be_pattn_04,>be_pattn_04

; Pattern data
be_pattn_00	!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte eod

be_pattn_01	!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur02
		!byte g_1,dur05
		!byte off,dur03
		!byte eod

be_pattn_02	!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte f_1,dur05
		!byte g_2,dur02
		!byte f_1,dur05
		!byte off,dur03
		!byte eod

be_pattn_03	!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte ax1,dur05
		!byte g_2,dur02
		!byte g_1,dur05
		!byte off,dur03
		!byte eod

be_pattn_04	!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte g_1,dur05
		!byte off,dur05
		!byte g_2,dur05
		!byte off,dur05
		!byte f_2,dur05
		!byte f_1,dur05
		!byte g_2,dur02
		!byte f_1,dur05
		!byte off,dur03
		!byte e_2,dur05
		!byte e_1,dur05
		!byte g_2,dur02
		!byte e_1,dur05
		!byte off,dur03
		!byte eod