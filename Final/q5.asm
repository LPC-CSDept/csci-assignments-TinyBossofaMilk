# q5.asm
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

ori $s0, $s0, 3             # set s0 = 3, which will be counter.
or  $s1, $s1, $zero         # clear s1, which will be final value
ori $s2, $s2, 10            # set s2 as constant, which will be used in multiplication

lui	$t0, 0xffff		        # load address of kernel

input:
lw	$t1, 0($t0)		        # load receiver control
andi	$t1, $t1, 0x0001	# clear all except lowest bit
beqz	$t1, input          # loop if not done yet
nop

lw      $t3, 4($t0)             # take value of transmitter 
mult    $s1, $s1, $s2       # value *= 10
mflo    $s1                 # move value to 10
addu    $s1, $s1, $t3       # saved value + inputted value

