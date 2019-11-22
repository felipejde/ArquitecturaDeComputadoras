.data
a:	.word	10
.text
	lw	$t0,a		
move:	add	$t1,$t0,$zero	#move hace que se copie el contenido de el registro t0 en el registro t1
