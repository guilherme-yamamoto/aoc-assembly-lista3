.data
	p1: .asciiz "Insira o primeiro valor: "
	p2: .asciiz "Insira o segundo valor: "
	first: .asciiz "\nO maior valor é: "
	second: .asciiz "\nO menor valor é: "
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
	
	bgt $t2, $t1, loop_inverte
	j fim
					
loop_inverte:
	move $t3, $t1
	move $t1, $t2
	move $t2, $t3

fim:
	li $v0, 4
	la $a0, first
	syscall
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 4
	la $a0, second
	syscall
	
	li $v0, 1
	la $a0, ($t2)
	syscall
	
	li $v0, 10
	syscall