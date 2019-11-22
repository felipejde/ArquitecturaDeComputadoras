	.data

a: 	.word 	5
b: 	.word 	4
	.text

main: 	# Preambulo main
	# Invocacion de mist_1
	# Retorno de mist_1
	# Conclusion main
	# mist_1 recibe como argumentos $a0 y $a1
	subi	$sp, $sp, 24	# 1 Reservar memoria para el marco
	sw	$ra, 16($sp)	# 3 Guardar $ra
	sw	$fp, 20($sp)	# 4 Guardar $fp
	addi	$fp, $sp, 20	# 4 Establecer $fp
	# Tarea
	lw	$a0, a		# Pasar argumentos
	lw	$a1, b		# Pasar argumentos
	jal 	mist_1		# Llama la función
	# Conlcusion
	lw	$ra, 16($sp)	# 3 Restaurar $ra
	lw	$fp, 20($sp)	# 4 Restaurar $fp
	j	finmain		# Final del programa

mist_1: # Preambulo mist_1
	subi	$sp, $sp, 32	# 1 Reservar memoria para el marco
	sw	$ra, 16($sp)	# 3 Guardar $ra
	sw	$fp, 20($sp)	# 4 Guardar $fp
	addi	$fp, $sp, 28	# 4 Establecer $fp
		
	move 	$s0, $a0
	move 	$t0, $a1
	li 	$t1, 1
	
loop_1: beqz 	$s0, end_1	#if($s0 == 0) salta a end_1, else(sigue con loop_1)
	# Invocación de mist_0
	move 	$a0, $t0 	# Se pasa el argumento $a0
	move 	$a1, $t1 	# Se pasa el argumento $a1
	sw	$t0, 28($sp)	# Guardar $t0
	sw	$t1, 12($sp)	# Guardar $t1
	jal	mist_0	
	# Retorno de mist_0
	lw	$t0, 28($sp)	# Restaurar $t0
	lw	$t1, 12($sp)	# Restaurar $t1
	lw	$ra, 16($sp)	# Restaurar $ra
	lw	$fp, 20($sp)	# Restaurar $ra
	move 	$t1, $v0
	subi 	$s0, $s0, 1
	j 	loop_1

end_1:	# Conclusion mist_1
	move 	$v0, $t1 	# Se retorna el resultado en $v0
	lw	$ra, 16($sp)	# 2 Restaurar $ra
	lw	$fp, 20($sp)	# 2 Restaurar $fp
	addi	$sp, $sp, 32	# 3 Eliminar el marco 
	jr	$ra		# 4 Regresar control a rutina invocadora
# mist_0 recibe como argumentos $a0 y $a1

mist_0: # Preambulo mist_0
	mult 	$a0, $a1
	# Conclusion mist_0
	mflo 	$v0 		# Se retorna el resultado en $v0
	jr	$ra		# 4 Regresar control a rutina invocadora
	
		
finmain:nop			# Terminamos el programa.
