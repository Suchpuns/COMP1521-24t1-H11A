N_SIZE = 10
N_SIZE_M_1 = 9
N_SIZE_D_2 = 5

# $t0: i
# $t1: x
# $t2: y
# $t3: &numbers[i]
# $t4: &numbers[N_SIZE_M_1 - i]
# $t5: temporary register
# $t6: N_SIZE_M_1
main:
	li	$t0, 0	# i = 0;
while_cond:
	bge	$t0, N_SIZE_D_2, while_end
while_body:
	mul	$t5, $t0, 4	# $t0 = i * 4
	la	$t3, numbers	# $t3 = &numbers
	add	$t3, $t3, $t5	# $t3 = &numbers + i * 4 = &numbers[i]

	li	$t6, N_SIZE_M_1 # $t6 = N_SIZE_M_1
	sub	$t5, $t6, $t0	# $t5 = N_SIZE_M_1 - i
	mul	$t5, $t5, 4
	la	$t4, numbers	# $t4 = &numbers
	add	$t4, $t5, $t4	# $t4 = &numbers[N_SIZE_M_1 - i] = &numbers + (N_SIZE_M_1 - i) * 4

	lw	$t1, ($t3)	# $t1 = numbers[i]
	lw	$t2, ($t4)	# $t2 = numbers[N_SIZE_M_1 - i]

	sw	$t2, ($t3)	# numbers[i] = y;
	sw	$t1, ($t4)	# numbers[N_SIZE_M_1 - i] = x;

	add	$t0, $t0, 1
	b	while_cond
while_end:
	li	$v0, 1
	jr	$ra

	.data
numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9