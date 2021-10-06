.data
   .globl testWin
.text

# a0: die Spielfeldadresse
# a1: welcher Spieler auf Sieg geprueft werden soll 'X' oder 'O'
# return: 0, falls kein Sief, 1: falls Sieg
testWin:
  # TODO

  li $t1 0
  li $t2 0
  li $t3 0
  li $t4 0
  li $t5 0
  li $t6 0
  li $t7 0
  li $t8 0
  li $t9 0


#colum1
checkC1:
  pos1:
  lb $a2 0($a0)
  bne $a2 32 fillC11
  j pos2
  fillC11:
  beq $a2 88 fillC11X
  j fillC11O
  fillC11X:
  li $t1 1
  j pos2
  fillC11O:
  li $t1 2

  pos2:
  lb $a2 3($a0)
  bne $a2 32 fillC12
  j pos3
  fillC12:
  beq $a2 88 fillC12X
  j fillC12O
  fillC12X:
  li $t4 1
  j pos3
  fillC12O:
  li $t4 2

  pos3:
  lb $a2 6($a0)
  bne $a2 32 fillC13
  j checkC2
  fillC13:
  beq $a2 88 fillC13X
  j fillC13O
  fillC13X:
  li $t7 1
  j checkWinC1
  fillC13O:
  li $t7 2
  j checkWinC1


#colum2
checkC2:
  pos21:
  lb $a2 1($a0)
  bne $a2 32 fill21
  j checkC3
  fill21:
  beq $a2 88 fillC21X
  j fillC21O
  fillC21X:
  li $t2 1
  j pos22
  fillC21O:
  li $t2 2

  pos22:
  lb $a2 4($a0)
  bne $a2 32 fill22
  j checkC3
  fill22:
  beq $a2 88 fillC22X
  j fillC22O
  fillC22X:
  li $t5 1
  j pos23
  fillC22O:
  li $t5 2

  pos23:
  lb $a2 7($a0)
  bne $a2 32 fill23
  j checkC3
  fill23:
  beq $a2 88 fillC23X
  j fillC23O
  fillC23X:
  li $t8 1
  j checkWinC2
  fillC23O:
  li $t8 2
  j checkWinC2

  #colum3
checkC3:
  pos31:
  lb $a2 2($a0)
  bne $a2 32 fill31
  j pos32
  fill31:
  beq $a2 88 fillC31X
  j fillC31O
  fillC31X:
  li $t3 1
  j pos32
  fillC31O:
  li $t3 2

  pos32:
  lb $a2 5($a0)
  bne $a2 32 fill32
  j pos33
  fill32:
  beq $a2 88 fillC32X
  j fillC32O
  fillC32X:
  li $t6 1
  j pos33
  fillC32O:
  li $t6 2

  pos33:
  lb $a2 8($a0)
  bne $a2 32 fill33
  j checkWinR1
  fill33:
  beq $a2 88 fillC33X
  j fillC33O
  fillC33X:
  li $t9 1
  j checkWinC3
  fillC33O:
  li $t9 2
  j checkWinC3

  checkWinC1:
  and $s7 $t1 $t4
  and $s7 $s7 $t7
  beq $s7 2 otherwon
  bnez $s7 won
  j checkC2
  checkWinC2:
  and $s7 $t2 $t5
  and $s7 $s7 $t8
  beq $s7 2 otherwon
  bnez $s7 won
  j checkC3
  checkWinC3:
  and $s7 $t3 $t6
  and $s7 $s7 $t9
  beq $s7 2 otherwon
  bnez $s7 won

  checkWinR1:
  and $s7 $t1 $t2
  and $s7 $s7 $t3
  beq $s7 2 otherwon
  bnez $s7 won

  checkWinR2:
  and $s7 $t4 $t5
  and $s7 $s7 $t6
  beq $s7 2 otherwon
  bnez $s7 won

  checkWinR3:
  and $s7 $t7 $t8
  and $s7 $s7 $t9
  beq $s7 2 otherwon
  bnez $s7 won

  checkWinD1:
  and $s7 $t1 $t5
  and $s7 $s7 $t9
  beq $s7 2 otherwon
  bnez $s7 won
  checkWinD2:
  and $s7 $t3 $t5
  and $s7 $s7 $t7
  beq $s7 2 otherwon
  bnez $s7 won

  j draw


  otherwon:
  beq $a1 88 draw
  li $v0 1
  jr $ra


  won:
  beq $a1 79 draw
  li  $v0 1
  jr     $ra

 draw:
  li $v0 0
  jr $ra


 
 
