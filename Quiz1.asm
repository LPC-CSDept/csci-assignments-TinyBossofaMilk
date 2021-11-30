# Caitlin Tan
# CS21
# Quiz1
# Farenheit to Celsius
# celsius = (Fahrenheit-32.0) ×5.0 ⁄ 9.0
    
    .data
prompt: .asciiz "Please enter in Farenheit (int): "

    .text  
    .globl main

li      $v0, 4                  # syscall print string
la      $a0, prompt             # load prompt address
syscall

li      $v0, 5                  # syscall read int
syscall

mtc1    $v0, $f12           	# move input from a0 -> f12
cvt.s.w $f12, $f12          	# convert int -> float

li.s	$f1, 32.0		# f1 = 32
li.s	$f2, 5.0		# f2 = 5
li.s	$f3, 9.0		# f3 = 9
add.s   $f12, $f12, $f1    	# F + 32
mul.s   $f12, $f12, $f2     	# * 5.0
div.s   $f12, $f12, $f3     	# / 9.0

li      $v0, 2              	# print float
syscall
li      $v0, 10
syscall