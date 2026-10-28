.data
	p1: .asciiz "Insira o valor em REAL BRASILEIRO (R$): R$ "
	p2: .asciiz "O valor convertido em dólares estadunidenses (us$) é: "	
.text
.globl main

main:
	li $v0, 4
	la $a0, p1
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, p2
	syscall
	
	li $t2, 5
	mult $t0, $t2
	mflo $t1
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 10
	syscall