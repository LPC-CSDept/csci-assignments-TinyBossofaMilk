    .data
#
# Caitlin Tan
# 12/9/21
# Takes three digits through MM I/O and outputs a three digit 
# num through syscall

    .data
prompt" .asciiz "Type three numbers:"

    .text
    .globl main

li  $v0, 4                  # send out prompt
la  $a0, prompt
syscall

or  $s0, $s0, $zero         # clear s0, which will be counter.
or  $s1, $s1, $zero         # clear s1, which will be final value
ori $s2, $s2, 10            # set s2 as constant, which will be 

input:
lui	$t0, 0xffff		        # load address of kernel
lw	$t1, 0($t0)		        # load receiver control
andi	$t1, $t1, 0x0001	# clear all except lowest bit
beqz	$t1, input          # loop if not done yet
nop

#
# Caitlin Tan
# 12/9/21
# Takes three digits through MM I/O and outputs a three digit 
# num through syscall

    .data
prompt" .asciiz "Type three numbers:"

    .text
    .globl main

li  $v0, 4                  # send out prompt
la  $a0, prompt
syscall

or  $s0, $s0, $zero         # clear s0, which will be counter.
or  $s1, $s1, $zero         # clear s1, which will be final value
ori $s2, $s2, 10            # set s2 as constant, which will be 

input:
lui	$t0, 0xffff		        # load address of kernel
lw	$t1, 0($t0)		        # load receiver control
andi	$t1, $t1, 0x0001	# clear all except lowest bit
beqz	$t1, input          # loop if not done yet
nop

