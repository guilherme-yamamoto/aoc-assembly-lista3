.data 
	p1: .asciiz "Insira o mês de nascimento: "
	p2: .asciiz "\nInsira o ano de nascimento: "
	res: .asciiz "\nA idade, em meses, é: "
.text
.globl main

main:
	li $v0, 4
	la $a0, p1
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	li $v0, 4
	la $a0, p2
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	li $v0, 4
	la $a0, res
	syscall
	
	#Curiosidade: O programa foi feito no dia 25, mês 10 (outubro), ano 2026, dia das eleições de segundo turno
	li $t3, 2026
	sub $t2, $t3, $t2
	mul $t2, $t2, 12
	add $t2, $t2, $t1
	
	li $v0, 1
	la $a0, ($t2)
	syscall
	
	li $v0, 10
	syscall