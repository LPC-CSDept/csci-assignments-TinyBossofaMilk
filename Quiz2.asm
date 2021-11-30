# Caitlin Tan
# CS21
# Quiz2.asm
# ax^2+bx+c


    .data
prompt: .asciiz     "Enter float x, a, b, c  to calculate ax^2+bx+c : "

    .text
    .globl main

li      $v0, 4          # print prompt
la      $a0, prompt
syscall

li      $v0, 6          # ss read float
syscall                 # retrieve x
mov.s   $f1, $f0        # f1 = x
syscall                 # retrieve a
mov.s   $f12, $f0       # f12 = a
syscall                 # retrieve b
mov.s   $f3, $f0        # f3 = bx
syscall                 # retrieve c
mov.s   $f4, $f0        # f4 = c

mul.s   $f12, $f12, $f1 # a * x
add.s   $f12, $f12, $f3 # ax + b
mul.s   $f12, $f12, $f1 # (ax + b)*x
add.s   $f12, $f12, $f4 # ax^2 + bx + c

li  $v0, 2
syscall
li $v0, 10
syscall
