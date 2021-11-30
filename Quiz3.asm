# Quiz3.asm
# Newton's Method: approximation to find square root of any number
# (x + n/x)/2

    .data
prompt: .asciiz "Enter float n: "

    .text
    .globl main

li  $v0, 4              # print prompt string
la  $a0, prompt 
syscall

li  $v0, 6
syscall                 # take target float n into $f0

li.s   $f1, 1.0e-5       # loads comparison standard in f2
li.s   $f2, 2.0        # 2 divisor for calculations in f2
li.s   $f3, 1.0        # starts iteration with x = 1 in $f3. Will be overridden in comparison

loop:
div.s   $f4, $f0, $f3   # n/x (f4 will hold x')
add.s   $f4, $f4, $f3   # n/x + x
div.s   $f4, $f4, $f2   # (x+n/x)/2.0

####comparision########

sub.s   $f5, $f4, $f3   # x' - x, puts difference in f5
abs.s   $f5, $f5        # |x' - x|
c.lt.s  $f5, $f1        # compare |x' - x| < 1e-5
bc1t    end
nop
mov.s   $f3, $f4        # replaces x with x'
b       loop
nop

end:
mov.s   $f12, $f4       # moves x' -> f12 for printing
li      $v0, 2          # ss print float
syscall

li      $v0, 10
syscall