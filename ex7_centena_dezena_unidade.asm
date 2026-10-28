.data
	p1: .asciiz "Insira a centena: "
	p2: .asciiz "Insira a dezena: "
	p3: .asciiz "Insira a unidade: "
	res: .asciiz "Juntando dá "
	err: .asciiz "O valor inserido no total não ser inferior a 100, nem pode superar 1000. Reiniciando.\n\n"
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
	
	blez $t1, erro
	bgt $t1, 9, erro
	bgt $t2, 9, erro
	bgt $t3, 9, erro
	j fim
			
erro:	#Se abaixo de 100
	li $v0, 4
	la $a0, err
	syscall
	j main

fim:	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	la $a0, ($t2)
	syscall
	la $a0, ($t3)
	syscall
	
	li $v0, 10
	syscall