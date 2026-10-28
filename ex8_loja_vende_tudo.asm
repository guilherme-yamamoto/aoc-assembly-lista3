.data
	preco: .asciiz "Insira o preço do produto (entre 1000 e 9999): R$"
	parc: .asciiz "Insira o valor a ser pago por parcela: R$"
	err: .asciiz "Erro. O preço não pode ser menor que R$1000 nem maior que R$999. Reiniciando.\n\n"
	res: .asciiz "\nA quantidade de parcelas a serem pagas é: "
.text
.globl main

main:
	li $v0, 4
	la $a0, preco
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	blt $t1, 1000, reenviar
	bgt $t1, 9999, reenviar
	j segue
	
reenviar:
	li $v0, 4
	la $a0, err
	syscall
	j main

segue:	
	li $v0, 4
	la $a0, parc
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	div $t0, $t1, $t2
	mfhi $t3
	bgtz $t3, adiciona_parcela
	j fim
	
adiciona_parcela:
	add $t0, $t0, 1
	j fim

fim: 	
	li $v0, 4
	la $a0, res
	syscall

	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 10
	syscall