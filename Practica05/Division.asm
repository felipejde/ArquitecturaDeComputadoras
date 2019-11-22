.data
a:	.word	11
b:	.word	5
coci:	.word	0
resi:	.word	0
temp:	.word	0
.text
	lw	$t0,a
	lw	$t1,b
	lw	$t2,coci
	lw	$t3,resi
	lw	$t4,temp
loop:	ble	$t0,$t1,end
	sub	$t4,$t0,$t1
	move	$t0,$t4
	addi	$t2,$t2,1
	j	loop
end:	move	$t3,$t0
	move	$v0,$t2
	move	$v1,$t3
