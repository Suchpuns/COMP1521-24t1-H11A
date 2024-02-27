# CONSTANT
SQUARE_MAX = 46340

# $t0 : x
# $t1 : y
main:
	li	$v0, 4
	la	$a0, enter_a_number
	syscall							# printf("Enter a number: ");

	li	$v0, 5
	syscall
	move	$t0, $v0					# scanf("%d", &x);

	ble	$t0, SQUARE_MAX, if_x_gt_square_max_false	# if (x > SQUARE_MAX)
if_x_gt_square_max_true:
	li	$v0, 4
	la	$a0, square_too_big
	b if_x_gt_square_max_post
if_x_gt_square_max_false:
	mul	$t1, $t0, $t0

	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall							# printf("%d\n", y);
if_x_gt_square_max_post:

	li	$v0, 0
	jr	$ra						# return 0;

	.data
enter_a_number:
	.asciiz	"Enter a number: "
square_too_big:
	.asciiz "square too big for 32 bits\n"