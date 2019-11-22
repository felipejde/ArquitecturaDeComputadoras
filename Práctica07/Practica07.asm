	.data
cadena:	.asciiz	"Comandos:\nhelp\ncat\nrev\nexit\n"
cadena2	.asciiz	"Imprime información de los comandos disponibles y sus opciones. Si se llama sin argumentos, imprime una lista de los comandos disponibles.\n"
cadena3	.asciiz	"Concatena los archivos y los muestra en pantalla.\n"
cadena4	.asciiz	"Imprime la reversa de una cadena. Si no se especifica un archivo, se utiliza la entrada estandar (sólo una linea).\n"
cadena5	.asciiz	"Termina la ejecución del intérprete de comandos, terminando así la simulacion de MARS.\n"	
	.text
	
comparar:

loop:	lb	$t1, ($a0)	# Carga carcater, primer cadena
	lb	$t2, ($a1)	# Carga carater, segunda cadena
	bne	$t1, $t2, distint	# Si son distintas termina
	beq	$t1, $zero, iguales	# Si es caracter nulo, fin programa
	addi	$a1
	addi	$a1, 1
	j 	loop		


mainhelp:
	subi	$sp, $sp, 32	# 1 Reservar memoria para el marco
	sw	$ra, 16($sp)	# 3 Guardar $ra
	sw	$fp, 20($sp)	# 4 Guardar $fp
	addi	$fp, $sp, 28	# 4 Establecer $fp
	
	
		
	
help:	la	$a0, cadena
	li	$v0, 4
	syscall
	j	exit
	
help2:	beqz	$a0, deshelp
	beq	$a0, 1, descat
	beq	$a0, 2, desrev
	beq	$a0, 3, desexit
	
	
deshelp:
	li	$a0, cadena2
	li	$v0, 4
	syscall
	j	exit
	

	
descat:	li	$a0, cadena3
	li	$v0, 4
	syscall
	j	exit


desrev:	li	$a0, cadena4
	li	$v0, 4
	syscall
	j	exit


desexit:
	li	$a0, cadena5
	li	$v0, 4
	syscall
	j	exit
	
endhelp:
	move 	$v0, $t1 	# Se retorna el resultado en $v0
	lw	$ra, 16($sp)	# 2 Restaurar $ra
	lw	$fp, 20($sp)	# 2 Restaurar $fp
	addi	$sp, $sp, 32	# 3 Eliminar el marco 
	jr	$ra		# 4 Regresar control a rutina invocadora
# mist_0 recibe como argumentos $a0 y $a1

	

	
exit:	li 	$v0, 10
	syscall