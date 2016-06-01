

.data
        linea1:   .asciiz   "La palabra real es: "
        msg:      .asciiz   "Hola"
        linea2:   .asciiz   "\nLa palabra final: "
        msgNuevo: .space    100
        .extern foobar 4

        .text
        .globl main

main:
        la      $a0, linea1
        li      $v0, 4
        syscall

        la      $a0, msg
        syscall

        la      $a0, linea2
        syscall

        la $a0, msg
        la $a1, msgNuevo
        jal invierte

        la      $a0, msg
        syscall
        la      $a0, msgNuevo
        syscall


         li $v0, 10 
         syscall
        jr $ra          # retrun to caller

invierte:
        li $t1, 0   #Contador de la longitud
        bucle:
             lb $t0, ($a0)
             beqz $t0, desapila
             addi $sp, $sp, -1
             sb $t0, ($sp)
             addi $t1, $t1, 1
             addi $a0, $a0, 1
             j bucle
        desapila:
           lb $t0, ($sp)
           addi $sp, $sp, 1
           sb $t0, ($a1)
           addi $a1, $a1, 1
           addi $t1, $t1, -1
           bnez $t1, desapila
         sb $zero, ($a1)
         jr $ra
