#Programming Assignment 1 
#Input the size and the integers of list, output the list and maximum number and minimum number in the list
#CPSC 3615 Computer Architecture
#Jacqueline Eshriew 
#SPRING 2022

.text
main:

#input the list size
la $a0, prompt_input_size
li $v0, 4
syscall

li $v0, 5 #take list size
syscall

#copy size from $v0 to variable size 
la $t0, size #load address to t0
sw $v0, 0($t0) #store v0 to t0
move $a1, $v0 #copy size to a1

#input elements in list
li $s1, 0 #set to 0
la $t0, list #load address list to $t0
li $t2, 0 #t2 offset to 0

input_loop:
 addi $s1, $s1, 1 # increment by 1
 bgt $s1, $a1, end_input_loop #if greater than array size, end the loop

#printing elements prompt
la $a0, prompt_element_input #load in elements to a0
li $v0, 4 #load int and set v0 to 4
syscall

#get input
li $v0, 5 #input int
syscall


#checking for maximum
beq $s1, 1, maximum_int_check #set first int as max
lw $t4, maximum #load max value in array 
bgt $v0, $t4, maximum_int_check
j check_minimum

maximum_int_check:
la $t4, maximum
sw $v0, 0($t4) #store value as maximum

check_minimum:
#check for minimum
beq $s1, 1, minimum_int_check #set first int as min
lw $t5, minimum #load min value in array
blt $v0, $t5, minimum_int_check
j save

minimum_int_check:
la $t5, minimum
sw $v0, 0($t5) #store value as minimum


save:
#save input to array list
add $t3, $t0, $t2 #get address to store data
sw $v0, 0($t3) #save inputs
addi $t2, $t2, 4 #offset for next operation

j input_loop
end_input_loop:


#list and increment
li $s1, 0
la $t0, list
li $t2, 0

#output element size
la $a0, prompt_element_output
li $v0, 4
syscall

element_output:

#incement and check if greater 
addi $s1, $s1, 1
bgt $s1, $a1, end_output_loop

add $t3, $t0, $t2
lw $a0, 0($t3)

li $v0, 1 #set v0 to 1 
syscall

la $a0, space
li $v0, 4
syscall

addi $t2, $t2, 4
j element_output

end_output_loop:

#print max element
la $a0, max_element
li $v0, 4
syscall

lw $a0, maximum #load maximum element into the first
li $v0, 1 #print max int
syscall

#print min element
la $a0, min_element
li $v0, 4
syscall

lw $a0, minimum #load minimum element into the first
li $v0, 1 #print min int
syscall

li $v0, 10 #v0=10, exit function
syscall



.data
space: .asciiz " "
max_element: .asciiz "\n The maximum number in the list is: "
maximum: .word 0
min_element: .asciiz "\n The minimum number in the list is: "
minimum: .word 0
list: .space 100 #Max 100/4 = 25 elements
size: .word 4
dataflag1: .word 0x12345678 #Unused
charflag1: .ascii "abc" #Unused
dataflag4: .word 0x22227890 #Unused 
prompt_input_size: .asciiz "Please enter the size of the list (max 25): \n"
prompt_element_input: .asciiz "Please enter the next element: \n"
dataflag2: .word 0x88881111 #Unused 
Input: .space 20 #Unused
dataflag3: .word 0x99996666 #Unused 
prompt_element_output: .asciiz "The numbers currently in the list are: "




