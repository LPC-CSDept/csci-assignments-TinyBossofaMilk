# Harmonic Series
# TESTING COMMITTING PURPOSE ONLY


	.data
prompt:	.asciiz	"Enter number of terms in harmonic series:"
nl:	.asciiz	"\n"
	
	.text
	.globl	main
	
	li	$v0, 4		# << string
	la	$a0, prompt	# load address
	syscall

	li	$v0, 8		# syscall set >> int
	syscall			# 
	or	$s0, $v0, $zero	# move # of terms to s0

	li.s	$f0, 1.0	# f0 = 1

loop:	blez	$s0, exit	# branch to end if input <= 0
	nop
	add.s	$f1, $f0, $f1	# f1 = f0 + f1 (f1++)
	div.s	$f2, $f0, $f1	# f2 = f0/f1
	add.s	$f12, $f2, $f12	# f12 += harmonic term
	addi	$s0, $s0, -1	# counter -= 1
	b	loop
	nop
	
	
	
	
exit:	li	$v0, 2		# << float
	syscall	
	li	$v0, 10		# exit program
	syscall


## End of file