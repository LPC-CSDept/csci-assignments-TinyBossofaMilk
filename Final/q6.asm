# q5.asm
#
# Caitlin Tan
# 12/9/21
# Takes characters polling and keeps on 
# outputting them until 'q' is typed. 


    .data
prompt: .asciiz "Type characters to print, or 'q' to quit: "
nl: .asciiz "\n"

    .text
    .globl main

li  $v0, 4                  # send out prompt
la  $a0, prompt
syscall

lui	$t0, 0xffff		        # load address of kernel

input:
lw	    $t1, 0($t0)		    # load receiver control
andi	$t1, $t1, 0x0001	# clear all except lowest bit
beqz	$t1, input          # loop if not done yet
nop


print:
lui     $t0, 0xFFFF         # load t0 with address kernel

waitloop:
lw      $t1, 8($t0)         # load transmitter control
andi    $t1, $t1, 0x0001    # select LSB
bnez    $t1, waitloop       # wait till transmitter control is ready

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
 