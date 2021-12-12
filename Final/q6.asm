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
la  $a0, prompt
syscall

lui	$s0, 0xffff		# load address of kernel $S0 IS KERNEL ADDRESS 

inputloop:
lw	    $t0, 0($s0)		    # load receiver control
andi	$t0, $t0, 0x0001	# clear all except lowest bit
beqz	$t0, inputloop      # loop if not done yet
nop
lw      $s1, 4($s0)         # save input to s1
j       check
nop

check:
addi    $t0, $s1, -113      # char - 113 ('q')
beqz    $t0, quit           # if inputted char is 'q', quit
nop

printloop:                  # assumes $t0 is already set
lw      $t0, 8($s0)         # load transmitter control
andi    $t0, $t0, 0x0001    # select LSB
bnez    $t0, printloop      # wait till transmitter control is ready
nop

sw      $s0,  12($s0)       # write to transmitter data
b       inputloop           # loop back to input loop
nop

quit:
li      $v0, 10
syscall







Make the assembly program with Interrupted I/O.

Take the user character and print it in a console until 'q' is typed.
Make the interrupt handler(Kernel text program)
 

Make the file in any editor that supports the Git and then commit/push to https://classroom.github.com/a/rz6NTjtc (Links to an external site.) 

You can use the browser version of VS code (https://vscode.dev (Links to an external site.)).

file name: q6.asm
You should commit and push your file every 5 min.
Attach the screen result to this Canvas.
Elaborate on your program source code.
how the interrupt could be enabled
What happened when the user type a character at the keyboard
how your program notice the interrupt occurs
how do we figure out the exception type
Before we return to the user program, what should the kernel program do?
 