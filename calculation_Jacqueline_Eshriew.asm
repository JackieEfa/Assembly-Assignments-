#Programming Assignment 2
#Integer Calculation
#Ask the user to input two integers and output the result of addition, subtraction, multiplication, and division
#CPSC 3615 Computer Architecture
#Jacqueline Eshriew 
#SPRING 2022

.text
main:

#user prompts first element input to calculate
la $a0, call_first
li $v0, 4
syscall

#take input for the first integer
li $v0, 5 
syscall

#copy v0 to first int
#load first int address to t0
la $t0, first_int 
#save to first in t0 (store byte = sb)
sb $v0, 0($t0)


#user prompts second element input to calculate
la $a0, call_second
li $v0, 4
syscall

#take input for the second integer
li $v0, 5
syscall

#copy v0 to second int
#load first int address to t1
la $t1, second_int
#save to first in t1 (store byte = sb)
sb $v0, 0($t1)




#Addition
#load both bytes (lb = load byte)
lb $t0, first_int 
lb $t1, second_int

# add t0 and t2 
add $s1, $t0, $t1

#get result 
la $a0, addition
li $v0, 4
syscall

move $a0, $s1
li $v0, 1
syscall

#new line formatting 
la $a0, newline
li $v0, 4
syscall

#Subtraction
sub $s1, $t0, $t1
		
#get result
la $a0, subtraction
li $v0, 4
syscall

move $a0, $s1
li $v0, 1
syscall

#new line formatting
la $a0, newline
li $v0, 4
syscall

#Multiplication mult
mult $t0, $t1 

#get result 
la $a0, multiplication
li $v0, 4
syscall

#mflo move from lo, to get multiplication result to a0
mflo $a0 
li $v0, 1
syscall

#new line formatting 
la $a0, newline
li $v0, 4
syscall

#Division
#div divides t0 and t1 
div $t0, $t1

#get result
la $a0, division
li $v0, 4
syscall

#mflo move from lo, to get division result to a0
mflo $a0
li $v0, 1
syscall

#remainder from division
la $a0, remainder
li $v0, 4
syscall

#get result of divide to a0
mfhi $a0 
li $v0, 1
syscall


#exit function 
li $v0, 10
syscall

.data
newline: .asciiz "\n"
call_first: .asciiz "Please enter the first integer: \n:"
call_second: .asciiz "Please enter the second integer: \n:"
first_int : .byte 0
second_int : .byte 0
addition: .asciiz "The addition of both integers is: "
subtraction: .asciiz "The subtraction of both integers is: "
multiplication: .asciiz "The multiplication of both integers is: "
division: .asciiz "The division of both integers is: "
remainder: .asciiz " remainder "
