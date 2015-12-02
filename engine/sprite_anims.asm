DoAnimFrame: ; 8d24b
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8d25b


.Jumptable: ; 8d25b (23:525b)
	dw .zero        ; town map
	dw .one         ; bouncing mon icons
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six         ; Game Freak logo
	dw .seven
	dw .eight
	dw .nine
	dw .ten
	dw .eleven
	dw .twelve      ; blinking cursor
	dw .thirteen
	dw .fourteen
	dw .fifteen
	dw .sixteen
	dw .seventeen
	dw .eighteen
	dw .nineteen    ; finish egg hatching animation
	dw .twenty
	dw .twentyone
	dw .twentytwo   ; flying sprite
	dw .twentythree ; flying leaves
	dw .twentyfour
	dw .twentyfive
	dw .twentysix
	dw .twentyseven
	dw .twentyeight
	dw .twentynine  ; intro suicune
	dw .thirty      ; intro pichu wooper
	dw .thirtyone
	dw .thirtytwo   ; intro unown
	dw .thirtythree ; intro unown F with suicune leaping up
	dw .thirtyfour  ; intro suicune facing away from us


.zero: ; 8d2a1 (23:52a1)
	ret

.one: ; 8d2a2 (23:52a2)
	ld a, [MenuSelection2]
	ld hl, 0
	add hl, bc
	cp [hl]
	jr z, .two
	ld hl, $4
	add hl, bc
	ld [hl], $10
	ld hl, $7
	add hl, bc
	ld [hl], $0
	ret

.two: ; 8d2b9 (23:52b9)
	ld hl, $4
	add hl, bc
	ld [hl], $18
	ld hl, $c
	add hl, bc
	ld a, [hl]
	ld d, a
	inc [hl]
	and $f
	ret nz
	ld hl, $d
	add hl, bc
	ld e, [hl]
	ld hl, $7
	add hl, bc
	ld a, d
	and $10 ; bit 4
	jr z, .asm_8d2df
	ld a, e
	and a
	jr z, .asm_8d2e6
	cp $1
	jr z, .asm_8d2e2
.asm_8d2df
	xor a
	ld [hl], a
	ret
.asm_8d2e2
	ld a, $ff
	ld [hl], a
	ret
.asm_8d2e6
	ld a, $fe
	ld [hl], a
	ret

.three: ; 8d2ea (23:52ea)
	ld a, [MenuSelection2]
	ld hl, 0
	add hl, bc
	cp [hl]
	jr z, .asm_8d2fb
	ld hl, $4
	add hl, bc
	ld [hl], $10
	ret
.asm_8d2fb
	ld hl, $4
	add hl, bc
	ld [hl], $18
	ret

.four: ; 8d302 (23:5302)
	call .anonymous_jumptable
	jp [hl]
; 8d306 (23:5306)

; Anonymous jumptable (see .anonymous_jumptable)
	dw .four_zero
	dw .four_one
; 8d30a

.four_zero: ; 8d30a
	call .asm_8d6d8
	ld hl, 0
	add hl, bc
	ld a, [hl]
	ld hl, $d
	add hl, bc
	and $3
	ld [hl], a
	inc [hl]
	swap a
	ld hl, $c
	add hl, bc
	ld [hl], a

.four_one: ; 8d321
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .asm_8d356
	ld hl, $d
	add hl, bc
	add $4
	ld hl, $4
	add hl, bc
	ld [hl], a
	ld hl, $5
	add hl, bc
	inc [hl]
	ld hl, $d
	add hl, bc
	ld a, [hl]
	sla a
	sla a
	ld d, $2
	ld hl, $c
	add hl, bc
	ld a, [hl]
	add $3
	ld [hl], a
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

.asm_8d356
	call Function8d036
	ret
; 8d35a

.twentyfive: ; 8d35a (23:535a)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, $2
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

.five: ; 8d36c (23:536c)
	callab Function11a3b
	ret

.twelve: ; 8d373 (23:5373)
	callab Function120c1
	ret

.six: ; 8d37a (23:537a)
	callab GameFreakLogoJumper
	ret

.seven: ; 8d381 (23:5381)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d3ba
rept 2
	dec [hl]
endr
	ld d, a
	and $1f
	jr nz, .asm_8d395
	ld hl, $d
	add hl, bc
	dec [hl]
.asm_8d395
	ld hl, $b
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld hl, $b
	add hl, bc
	add [hl]
	ld [hl], a
	ret
.asm_8d3ba
	ld a, $1
	ld [wcf64], a
	call Function8d036
	ret

.eight: ; 8d3c3 (23:53c3)
	ld hl, $c
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_8d41e
	ld hl, $f
	add hl, bc
	ld d, [hl]
	ld hl, $b
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $e
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $e
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $c
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -$10
	add hl, de
	ld e, l
	ld d, h
	ld hl, $c
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $b
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a
	ret
.asm_8d41e
	call Function8d036
	ret

.nine: ; 8d422 (23:5422)
	callab Function9321d
	ret

.ten: ; 8d429 (23:5429)
	callab Function932ac
	ld hl, wcf64
	ld a, [hl]
	cp $2
	ret nz
	ld [hl], $3
	ld a, $f
	call Function8d120
	ret

.eleven: ; 8d43e (23:543e)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld e, a
	and $1
	jr z, .asm_8d462
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $78
	jr c, .asm_8d461
	call Function8d036
	ld a, $4
	ld [wcf64], a
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ret
.asm_8d461
	inc [hl]
.asm_8d462
	ld a, e
	ld d, $20
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

.thirteen: ; 8d46e (23:546e)
	callab ret_e00ed
	ret

.fifteen: ; 8d475 (23:5475)
	callab Function90d41
	ret

.fourteen: ; 8d47c (23:547c)
	callab Functione21a1
	ret

.sixteen: ; 8d483 (23:5483)
	call .anonymous_jumptable
	jp [hl]
; 8d487 (23:5487)

; Anonymous jumptable (see .anonymous_jumptable)
	dw .sixteen_zero
	dw .sixteen_one
	dw .sixteen_two
	dw .sixteen_three
	dw .sixteen_four
	dw .sixteen_five
; 8d493

.sixteen_zero: ; 8d493
	ld a, $14
	call Function8d120
	ld hl, $b
	add hl, bc
	ld [hl], $2
	ld hl, $c
	add hl, bc
	ld [hl], $20
	ret
; 8d4a5

.sixteen_two: ; 8d4a5
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d4af
	dec [hl]
	ret

.asm_8d4af
	call .asm_8d6d8
	ld hl, $c
	add hl, bc
	ld [hl], $40

.sixteen_three: ; 8d4b8
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_8d4cd
	dec [hl]
	ld d, $28
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

.asm_8d4cd
	ld de, SFX_GOT_SAFARI_BALLS
	call PlaySFX
	jr .sixteen_five
; 8d4d5

.sixteen_one: ; 8d4d5
	ld hl, $b
	add hl, bc
	ld [hl], $4
	ld hl, $c
	add hl, bc
	ld [hl], $30
	ld hl, $d
	add hl, bc
	ld [hl], $24
	ret
; 8d4e8

.sixteen_four: ; 8d4e8
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d51c
	ld d, a
	ld hl, $c
	add hl, bc
	ld a, [hl]
	call ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, $c
	add hl, bc
	ld [hl], $20
	ld hl, $d
	add hl, bc
	ld a, [hl]
	sub $c
	ld [hl], a
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	ret

.asm_8d51c
	xor a
	ld hl, $7
	add hl, bc
	ld [hl], a
	call .asm_8d6d8
	ret

.sixteen_five: ; 8d526
	call Function8d036
	ret
; 8d52a

.seventeen: ; 8d52a (23:552a)
	ld hl, $4
	add hl, bc
	ld a, [hl]
rept 2
	inc [hl]
endr
	cp $b0
	jr nc, .asm_8d53f
	and $3
	ret nz
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

.asm_8d53f
	call Function8d036
	ret

.eighteen: ; 8d543 (23:5543)
	callab Function29676
	ret

.nineteen: ; 8d54a (23:554a)
	ld hl, SpriteAnim1Sprite0c - SpriteAnim1
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .finish_nineteen
	ld d, a
	add $8
	ld [hl], a
	ld hl, SpriteAnim1Sprite0b - SpriteAnim1
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a

	push af
	push de
	call .ApplyYOffset
	ld hl, SpriteAnim1YOffset - SpriteAnim1
	add hl, bc
	ld [hl], a

	pop de
	pop af
	call .ApplyXOffset
	ld hl, SpriteAnim1XOffset - SpriteAnim1
	add hl, bc
	ld [hl], a
	ret

.finish_nineteen
	call Function8d036
	ret

.twenty: ; 8d578 (23:5578)
	callab Function91640
	ret

.twentyone: ; 8d57f (23:557f)
	ld hl, $d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $80
	add hl, de
	ld e, l
	ld d, h
	ld hl, $d
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $c
	add hl, bc
	ld a, [hl]
rept 3
	inc [hl]
endr
	push af
	push de
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.twentytwo: ; 8d5b0 (23:55b0)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	ret c
	ld hl, $5
	add hl, bc
rept 2
	dec [hl]
endr
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $40
	jr nc, .asm_8d5d3
	add $8
	ld [hl], a
.asm_8d5d3
	ld hl, $e
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.twentythree: ; 8d5e2 (23:55e2)
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $b8
	jr nc, .asm_8d603
rept 2
	inc [hl]
endr
	ld hl, $5
	add hl, bc
	dec [hl]
	ld d, $40
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret
.asm_8d603
	call Function8d036
	ret

.twentyfour: ; 8d607 (23:5607)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	cp $54
	ret z
	ld hl, $5
	add hl, bc
rept 2
	inc [hl]
endr
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	jr z, .asm_8d621
	sub $2
	ld [hl], a
.asm_8d621
	ld hl, $e
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.twentyseven: ; 8d630 (23:5630)
	callba Function108bc7
	ret

.twentyeight: ; 8d637 (23:5637)
	callba Function108be0
	ret

.twentynine: ; 8d63e (23:563e)
	ld a, [wcf65]
	and a
	jr nz, .asm_8d645
	ret
.asm_8d645
	ld hl, $7
	add hl, bc
	ld [hl], $0
	ld hl, $d
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	xor $ff
	inc a
	ld d, $20
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ld a, $36
	call Function8d120
	ret

.thirty: ; 8d666 (23:5666)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $14
	jr nc, .asm_8d67f
	add $2
	ld [hl], a
	xor $ff
	inc a
	ld d, $20
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
.asm_8d67f
	ret

.thirtytwo: ; 8d680 (23:5680)
	ld hl, $b
	add hl, bc
	ld d, [hl]
rept 3
	inc [hl]
endr
	ld hl, $c
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.thirtythree: ; 8d6a2 (23:56a2)
	ld a, [wcf64]
	cp $40
	ret nz
	ld a, $3d
	call Function8d120
	ret

.thirtyfour: ; 8d6ae (23:56ae)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	add $10
	ld [hl], a
	ret

.twentysix: ; 8d6b7 (23:56b7)
	callba Function11d0b6
	ret

.thirtyone: ; 8d6be (23:56be)
	callba Function49aa2
	ret

.anonymous_jumptable: ; 8d6c5 (23:56c5)
	ld hl, [sp+$0]
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld hl, $b
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 8d6d8 (23:56d8)

.asm_8d6d8: ; 8d6d8
	ld hl, $b
	add hl, bc
	inc [hl]
	ret
; 8d6de

.ApplyYOffset: ; 8d6de (23:56de)
	call ApplyYOffset
	ret

.ApplyXOffset: ; 8d6e2 (23:56e2)
	call ApplyXOffset
	ret
; 8d6e6 (23:56e6)
