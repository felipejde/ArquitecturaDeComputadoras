.data

n: 	.word 	5
k: 	.word 	4
	.text

main: 	# Preambulo main
	subi	$sp, $sp, 24	# 1 Reservar memoria para el marco
	sw	$ra, 16($sp)	# 3 Guardar $ra
	sw	$fp, 20($sp)	# 4 Guardar $fp
	addi	$fp, $sp, 20	# 4 Establecer $fp
	# Tarea
	lw	$a0, n		# Pasar argumentos
	lw	$a1, k		# Pasar argumentos
	jal 	pascal		# Llama la función
	# Conlcusion
	lw	$ra, 16($sp)	# 3 Restaurar $ra
	lw	$fp, 20($sp)	# 4 Restaurar $fp
	j	finmain		# Final del programa

pascal:	# Preambulo
	subi	$sp, $sp, 40	# 1 Reservar memoria para el marco
	sw	$ra, 16($sp)	# 3 Guardar $ra
	sw	$fp, 20($sp)	# 4 Guardar $fp
	addi	$fp, $sp, 36	# 4 Establecer $fp
	
	beqz 	$a1, Base_1	# Salta a Base_1 si k = 0
	beqz 	$a0, Base_2	# Salta a Base_2 si n = 0
	
	sw	$a0, 4($sp)	# Guardar $a0
	sw	$a1, 8($sp)	# Guardar $a1
	subi	$a0, $a0, 1	
	subi	$a1, $a1, 1	
	jal	pascal
	sw	$v0, 12($sp)	# Guardar $v0
	lw	$a0, 4($sp)	# Cargar $a0
	lw	$a1, 8($sp)	# Cargar $a1
	subi	$a0, $a0, 1
	jal	pascal
	sw	$v0, 32($sp)	# Guardar $v0
	lw 	$t1, 12($sp)	# Cargar registro
	lw 	$t2, 32($sp)	# Cargar registro
	add	$v0, $t1, $t2	# Sumar registros $t1 y $t2
	j 	end
	
Base_1: li	$v0, 1		# =1
	j	end

Base_2: li	$v0, 0		# =0
	j	end
	
end:	# Conclusion mist_1
	lw	$ra, 16($sp)	# 2 Restaurar $ra
	lw	$fp, 20($sp)	# 2 Restaurar $fp
	addi	$sp, $sp, 40	# 3 Eliminar el marco 
	jr	$ra		# 4 Regresar control a rutina invocadora
	
finmain:nop			# Terminamos el programa.
	
	