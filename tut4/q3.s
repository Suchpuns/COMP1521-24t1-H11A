# Recursive maximum of array function


# $s0: first_element
# $s1: length
# $s2: max_so_far
# $s3: &array
# $t0: temporary register
# $t1: temporary register
	.text
max:
max__prologue:
	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2
	push	$s3

	move	$s1, $a1
	move	$s3, $a0
max__body:
	la	$t0, array
	lw	$s0, ($t0)
max__if_cond:
	bne	$t0, 1, max__if_false
	
max__if_true:
	move	$v0, $s0

	b	max__epilogue # return first_element
max__if_false:
	li	$t0, 4
	add	$t1, $s3, $t0 # $t1 = &array[1]

	move	$a0, $t1
	sub	$a1, $s1, 1
	jal	max

	move	$s2, $v0

max__if_largest_cond:
	blt	$s0, $s2, max__if_largest_false
max__if_largest_true:
	move	$s2, $s0
max__if_largest_false:
	move	$v0, $s2
	b	max__epilogue

max__if_end:

max__epilogue:
	
	pop	$s3
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

	jr	$ra			# return;
	


	
	# some simple test code which calls max
main:
main__prologue:
	push	$ra


main__body:
	la	$a0, array
	li	$a1, 10
	jal	max			# result = max(array, 10)

	move	$a0, $v0
	li	$v0, 1			# syscall 1: print_int
	syscall				# printf("%d", result)

	li	$a0, '\n'
	li	$v0, 11			# syscall 11: print_char
	syscall				# printf("%c", '\n');

	li	$v0, 0

main__epilogue:
	pop	$ra
	jr	$ra			# return 0;


.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1