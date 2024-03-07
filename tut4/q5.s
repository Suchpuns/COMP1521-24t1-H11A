
# $s0: result
main:

main__prologue:
	begin
	push	$s0
	push	$ra
main__body:
	li	$a0, 11
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4
	move	$s0, $v0 # $s0 = sum4(...)
	move	$a0, $s0
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

	li	$v0, 0
main__epilogue:
	pop	$ra
	pop	$s0
	end
	jr	$ra

sum4:
# $s0: a
# $s1: b
# $s2: c
# $s3: d
# $s4: res1
# $s5: res2
sum4__prologue:
	begin
	push	$s0
	push	$s1
	push	$s2
	push	$s3
	push	$s4
	push	$s5
	push	$ra

sum4__body:
	move	$s0, $a0
	move	$s1, $a1
	move	$s2, $a2
	move	$s3, $a3

	jal	sum2

	move	$s4, $v0

	move	$a0, $s2
	move	$a1, $s3
	jal	sum2

	move	$s5, $v0

	move	$a0, $s4
	move	$a1, $s5	

	jal	sum2


sum4__epilogue:
	pop	$ra
	pop	$s5
	pop	$s4
	pop	$s3
	pop	$s2
	pop	$s1
	pop	$s0
	end
	jr	$ra

sum2:

sum2__prologue:

sum2__body:
	add	$v0, $a0, $a1
	jr	$ra

sum2__epilogue: