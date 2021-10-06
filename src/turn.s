.data
  .globl takeTurn
x: .asciiz "X"
o: .asciiz "O"
.text
# - Argumente -
# a0: erste Spielfeldadresse
# a1: ASCII Zeichen des aktuellen Spielers
# a2: ASCII Zeichen der Zeile
# a3: ASCII Zeichen der Spalte
# - Verhalten -
# Setzt das Zeichen des Spielers in $a1 auf die Position Zeile $a2, Spalte $a3, falls dies ein gueltiger Zug ist
# - Rueckgabe -
# Ist der eingegebene Zug ungueltig, wird 1 zurueckgegeben. Das Spielfeld bleibt unveraendert.
# Ist der Zug gueltig, wird 0 zurueckgegeben
#
takeTurn:
  # TODO
    #besetz or not besetz
  lb $t1 0($a0)
  lb $t2 1($a0)
  lb $t3 2($a0)
  lb $t4 3($a0)
  lb $t5 4($a0)
  lb $t6 5($a0)
  lb $t7 6($a0)
  lb $t8 7($a0)
  lb $t9 8($a0)

checkzeile:
bgt $a2 50 besetz
blt $a2 48 besetz
beq $a2 48 Z1
beq $a2 49 Z2
beq $a2 50 Z3
Z1:
bgt $a3 50 besetz
blt $a3 48 besetz
beq $a3 48 C11
beq $a3 49 C12
beq $a3 50 C13
Z2:
bgt $a3 50 besetz
blt $a3 48 besetz
beq $a3 48 C21
beq $a3 49 C22
beq $a3 50 C23
Z3:
bgt $a3 50 besetz
blt $a3 48 besetz
beq $a3 48 C31
beq $a3 49 C32
beq $a3 50 C33


Game:

   C11:
   beq $a1 88 playerX
   beq $a1 79 playerO
   playerX:
   bne $t1 32 besetz
   lb $a1 x
   sb $a1 0($a0)
   j return0
   playerO:
   bne $t1 32 besetz
   lb $a1 o
   sb $a1 0($a0)
   j return0


   C12:
   beq $a1 88 playerX2
   beq $a1 79 playerO2
   playerX2:
   bne $t2 32 besetz
   lb $a1 x
   sb $a1 1($a0)
   j return0
   playerO2:
   bne $t2 32 besetz
   lb $a1 o
   sb $a1 1($a0)
   j return0

   C13:
   beq $a1 88 playerX3
   beq $a1 79 playerO3
   playerX3:
   bne $t3 32 besetz
   lb $a1 x
   sb $a1 2($a0)
   j return0
   playerO3:
   bne $t3 32 besetz
   lb $a1 o
   sb $a1 2($a0)
   j return0

   C21:
   beq $a1 88 playerX4
   beq $a1 79 playerO4
   playerX4:
   bne $t4 32 besetz
   lb $a1 x
   sb $a1 3($a0)
   j return0
   playerO4:
   bne $t4 32 besetz
   lb $a1 o
   sb $a1 3($a0)
   j return0

   C22:
   beq $a1 88 playerX5
   beq $a1 79 playerO5
   playerX5:
   bne $t5 32 besetz
   lb $a1 x
   sb $a1 4($a0)
   j return0
   playerO5:
   bne $t5 32 besetz
   lb $a1 o
   sb $a1 4($a0)
   j return0

   C23:
   beq $a1 88 playerX6
   beq $a1 79 playerO6
   playerX6:
   bne $t6 32 besetz
   lb $a1 x
   sb $a1 5($a0)
   j return0
   playerO6:
   bne $t6 32 besetz
   lb $a1 o
   sb $a1 5($a0)
   j return0

   C31:
   beq $a1 88 playerX7
   beq $a1 79 playerO7
   playerX7:
   bne $t7 32 besetz
   lb $a1 x
   sb $a1 6($a0)
   j return0
   playerO7:
   bne $t7 32 besetz
   lb $a1 o
   sb $a1 6($a0)
   j return0


   C32:
   beq $a1 88 playerX8
   beq $a1 79 playerO8
   playerX8:
   bne $t8 32 besetz
   lb $a1 x
   sb $a1 7($a0)
   j return0
   playerO8:
   bne $t8 32 besetz
   lb $a1 o
   sb $a1 7($a0)
   j return0

   C33:
   beq $a1 88 playerX9
   beq $a1 79 playerO9
   playerX9:
   bne $t9 32 besetz
   lb $a1 x
   sb $a1 8($a0)
   j return0
   playerO9:
   bne $t9 32 besetz
   lb $a1 o
   sb $a1 8($a0)
   j return0

   return0:
   li $v0 0
   jr $ra
   besetz:
   li $v0 1
   jr    $ra


