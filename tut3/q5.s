N_SIZE = 10
# $t0 : int i;
# $t1 : &numbers[i]
# $t2 : temporary_register

main:
	li	$t0, 0
while_cond:
	bge	$t0, N_SIZE, while_end
while_body:
	li	$v0, 5
	syscall

	mul	$t2, $t0, 4 # $t2 = $t0 * 4
	la	$t1, numbers # $t1 = &numbers
	add	$t1, $t2, $t1 # $t1 = &numbers[i] = &numbers + i * 4

	sw	$v0, ($t1) # scanf("%d", &numbers[i]);
	
	add	$t0, $t0, 1

	b	while_cond
while_end:


	li	$t0, 0
print_while_cond:
	bge	$t0, N_SIZE, print_while_end
print_while_body:
	la	$t1, numbers	# $t1 = &numbers
	mul	$t2, $t0, 4	# $t2 = i * 4
	add	$t1, $t1, $t2 	# $t1 = &numbers[i]

	lw	$a0, ($t1)	# $a0 = numbers[i]
	li	$v0, 1
	syscall

	add	$t0, $t0, 1
	b	print_while_cond
print_while_end:



	li	$v0, 0
	jr	$ra		# return 0;

	.data
numbers:                                  
        .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 