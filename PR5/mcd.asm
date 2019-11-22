.data
a:	.word	21	#primera variable
b:	.word	14	#segunda variable
resid:	.word	0	#residuo

.text
	lw	$t0,a
	lw	$t1,b
	lw	$t2,res
loop:	beq	$t1,$zero,end	#comienza el ciclo para calcular el minimo comun divisor de los dos numeros
	move	$t2,$t1	
	div	$t0,$t1		#se divide a entre b
	mfhi 	$t1		#se especifica el residuo de la division como el b
	move	$t0,$t2		#se coloca a la variable a como el nuevo residuo
	j	loop
end:	move	$v0,$t2
