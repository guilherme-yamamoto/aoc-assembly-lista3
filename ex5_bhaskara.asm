.data
	p1: .asciiz "Insira o coeficiente A: "
	p2: .asciiz "Insira o coeficiente B: "
	p3: .asciiz "Insira o coeficiente C: "
	delta: .asciiz "Delta vale: "
	d1: .asciiz "\nDUAS RAÍZES REAIS"
	d2: .asciiz "\nUMA RAIZ REAL"
	d3: .asciiz "\nNÃO EXISTEM RAÍZES REAIS"
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
	la $a0, p3
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0
	
	mul $s0, $t1, 4
	mul $s0, $s0, $t3
	mul $t4, $t2, $t2
	sub $s0, $t4, $s0
	
	li $v0, 4
	la $a0, delta
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	bgtz $s0, loop_maior 
	beqz $s0, loop_igual
	bltz $s0, loop_menor
	
loop_maior:
	li $v0, 4
	la $a0, d1
	syscall
	
	li $v0, 10
	syscall
	
loop_igual:
	li $v0, 4
	la $a0, d2
	syscall
	
	li $v0, 10
	syscall
	
loop_menor:
	li $v0, 4
	la $a0, d3
	syscall
	
	li $v0, 10
	syscall