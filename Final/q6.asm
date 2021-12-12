# q5.asm
#
# Caitlin Tan
# 12/9/21
# Takes characters polling and keeps on outputting them until 'q' is typed, 
# utilizing the interrupt


    .data
prompt: .asciiz "Type characters to print, or 'q' to quit: "
nl: .asciiz "\n"

    .text
    .globl main

li  $v0, 4                  # send out prompt
la  $a0, prompt             # load prompt address
syscall

mfc0 	$a0, $12     #   read from the status register     
ori     $a0,   0xff11     # enable all interrupts     
mtc0 	$a0, $12     # write back to the status register    
lui	$s0, 0xffff		        # load address of kernel $S0 IS KERNEL ADDRESS
ori $t0, $zero, 2           # set receiver control to interrupt ready
sw  $t0, 0($s0)             # load 0x10 to receiver control

inputloop:
lw	    $t0, 0($s0)		    # load receiver control
andi	$t0, $t0, 0x0001	# clear all except lowest bit
beqz	$t0, inputloop      # loop if not done yet
nop
lw      $s1, 4($s0)         # save input to $s1

printloop:                  # assumes $t0 is already set
lw      $t0, 8($s0)         # load transmitter control
andi    $t0, $t0, 0x0001    # select LSB
beqz    $t0, printloop      # wait till transmitter control is ready
nop

sw      $s1,  12($s0)       # write to transmitter data
b       inputloop           # loop back to input loop
nop

quit:
li      $v0, 10
syscall

# KERNEL text ******************

.ktext  0x80000180     # kernel code starts here  

mfc0 	$k0, $13     	#   Cause register     
srl     $a0, $k0, 2     #   Extract   ExcCode     Field     
andi    $a0, $a0, 0x1f  #   Get the exception code     
bne     $a0, $zero,   kdone     # Exception Code 0 is I/O. Only processing I/O here
nop

# implement quit in kernel
addi    $t1, $s1, -113      # char - 113 ('q')
beqz    $t1, quit           # if inputted char is 'q', quit
nop

kdone:
mtc0 	$0, $13     	#   Clear Cause register     
mfc0 	$k0, $12     	# Set Status register     
andi    $k0, 0xfffd  	# clear EXL bit d = 1101   
ori     $k0, 0x11     	#   Interrupts enabled     
mtc0 	$k0, $12     	#   write back to status     
eret    			 	# return to EPC    