

.data
        #linea1:   .asciiz   "La palabra real es: "
        msg:      .asciiz   "Hola"
        #linea2:   .asciiz   "\nLa palabra final: "
        msgNuevo: .space    100
        .extern   foobar    4

        .text
        .globl main

main:

        la        $a0, msg
        la        $a1, msgNuevo
        jal       invierte

        la        $a0, msgNuevo
        jal       cambia

        li        $v0, 10
        syscall
        jr        $ra  # retrun to caller

cambia:
        li $t1, 0   #Contador de la longitud
        bucle1:
             lb       $t0, ($a0)
             #li       $t1, $t0
             beqz     $t0, fin
             slt      $t2, $t0, 91
             #slt      $t3, 97, $t0
             beq      $t2, 1, tominuscula
             beq      $t2, 0, tomayuscula

        tominuscula:
             add      $t4, $t0, 32
             sb       $t4, ($a0)
             addi     $a0, $a0, 1
             j bucle1

        tomayuscula:
             sub      $t4, $t0, 32
             sb       $t4, ($a0)
             addi     $a0, $a0, 1
             j bucle1

        fin:
             jr $ra

invierte:
        li $t1, 0   #Contador de la longitud
        bucle:
             lb       $t0, ($a0)
             beqz     $t0, desapila
             addi     $sp, $sp, -1
             sb       $t0, ($sp)
             sb       $t0, ($a1)
             addi     $a1, $a1, 1
             addi     $t1, $t1, 1
             addi     $a0, $a0, 1
             j bucle
        desapila:
             lb       $t0, ($sp)
             addi     $sp, $sp, 1
             sb       $t0, ($a1)
             addi     $a1, $a1, 1
             addi     $t1, $t1, -1
             bnez     $t1, desapila
       sb $zero, ($a1)

       jr $ra
