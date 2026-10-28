.data
	p1: .asciiz "Insira o salário atual do funcionário: "
	p2: .asciiz "O salário com o aumento de 25% passa a ser: "
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
	
	move $t2, $t1
	mul $t2, $t1, 25
	div $t2, $t1, 10
	add $t1, $t1, $t2
	
	li $v0, 1
	la $a0, ($t1)	
	syscall
	
	li $v0, 10
	syscall