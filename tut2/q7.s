# $t0: x

main:

print_loop_init:
	li	$t0, 24
print_loop_cond:
	bge	$t0, 42, print_loop_post	# for (int x = 24; x < 42; x += 3) {	

	li	$v0, 1
	move	$a0, $t0
	syscall	

	li	$v0, 11
	li	$a0, '\n'
	syscall					# 	printf("%d\n", x);
print_loop_step:
	addi	$t0, $t0, 3
	b	print_loop_cond
print_loop_post:				# }
	
	li	$v0, 0
	jr	$ra				# return 0;