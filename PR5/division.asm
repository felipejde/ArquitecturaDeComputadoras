.data 
a:	.word	10 	#variable para el dividendo	
b:	.word	5	#variable para el divisor	
coci:	.word	0	#variable para el cociente
resid:	.word	0	#variable para el residuo	
temp:	.word	0	#valor temporal

.text
		lw	$t0,a
		lw	$t1,b
		lw	$t2,coci
		lw	$t3,resid
		lw	$t4,temp
loop:		ble	$t0,$t1,end	#aqui calculamos el cociente y residuo de una division
		sub	$t4,$t0,$t1	#aqui restamos el dividendo por el divisor
		move	$t0,$t4	
		addi	$t2,$t2,1	#aumenta el cociente en uno
		j	loop		
end:		move	$t3,$t0	
		move	$v0,$t2
		move	$v1,$t3	
