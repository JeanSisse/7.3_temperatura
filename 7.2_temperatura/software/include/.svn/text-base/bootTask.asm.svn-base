##------------------------------------------------------------------------------------------------
##
##  DISTRIBUTED HEMPS -  5.0
##
##  Research group: GAPH-PUCRS    -    contact   fernando.moraes@pucrs.br
##
##  Distribution:  Septmber 2013
##
##  Source name:  bootTask.asm
##
##  Brief description: Initializes the stack pointer and jumps to main(). Handles the syscall.
##
##------------------------------------------------------------------------------------------------

        .text
        .align  2
        .globl  entry
        .ent    entry
entry:
   .set noreorder

   li $sp,sp_addr # new initialization

   jal   main
   nop
   
   move $4,$0   
   syscall 
   nop
   
$L1:
   j $L1
   nop

        .end entry
  
###################################################

   .globl SystemCall
   .ent SystemCall
SystemCall:
   .set	noreorder
   
   syscall 
   nop
   jr	$31
   nop
   
   .set reorder
   .end SystemCall


