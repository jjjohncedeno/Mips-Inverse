

        .data
        linea1:   .asciiz   "La palabra real es: "
        msg:      .asciiz   "Hola"
        linea2:   .asciiz   "\nLa palabra final: "

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

        la      $a0, msg
        syscall
        la      $a0, msg
        syscall
        
        jr $ra          # retrun to caller
