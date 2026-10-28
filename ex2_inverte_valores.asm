.data
	p1: .asciiz "Insira o primeiro valor: "
	p2: .asciiz "Insira o segundo valor: "
	inv: .asciiz "Invertendo...\n\n"
	res1: .asciiz "O primeiro valor vale: "
	res2: .asciiz "\nO segundo valor vale: "
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
	la $a0, inv
	syscall

	move $t3, $t1
	move $t1, $t2
	move $t2, $t3
	
	la $a0, res1
	syscall
	
	li $v0, 1
	la $a0, ($t1)
	syscall

	li $v0, 4
	la $a0, res2
	syscall
	
	li $v0, 1
	la $a0, ($t2)
	syscall
	
	li $v0, 10
	syscall