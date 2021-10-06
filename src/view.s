.data
  .globl drawBoard
draw: .asciiz "   |   |\n   |   |  \n---|---|---\n   |   |   \n---|---|---\n   |   |   \n   |   |\n"
x:.asciiz "X"
o:.asciiz "O"
space: .asciiz " "
.text
# $a0  Spielfeldadresse
drawBoard:
  # TODO
    la $t5 draw

 checkByteArrayPos1:
  lb $t1 0($a0)
  beq $t1 88 insertX1
  j insertO1
  insertX1:
  lb $t2 x
  sb $t2 10($t5)
  j  checkByteArrayPos2
 insertO1:
   bne $t1 79 space1
   lb $t2 o
   sb $t2 10($t5)
   j  checkByteArrayPos2
  space1:
   lb $t2 space
   sb $t2 10($t5)
   j checkByteArrayPos2
#...... Pos2------
  checkByteArrayPos2:

  lb $t1 1($a0)
  beq $t1 88 insertX2
  j insertO2
  insertX2:
  lb $t2 x
  sb $t2 14($t5)
  j checkByteArrayPos3
  #j end
 insertO2:
   bne $t1 79 space2
   lb $t2 o
   sb $t2 14($t5)
   j checkByteArrayPos3
   j end
  space2:
   lb $t2 space
   sb $t2 14($t5)
   j checkByteArrayPos3
   #j end
#-----Pos3------
  checkByteArrayPos3:
  lb $t1 2($a0)
  beq $t1 88 insertX3
  j insertO3
  insertX3:
  lb $t2 x
  sb $t2 18($t5)
  j checkByteArrayPos4
  j end
 insertO3:
   bne $t1 79 space3
   lb $t2 o
   sb $t2 18($t5)
   j checkByteArrayPos4
   j end
  space3:
   lb $t2 space
   sb $t2 18($t5)
   j checkByteArrayPos4
#-----pos4-----
     checkByteArrayPos4:
  lb $t1 3($a0)
  beq $t1 88 insertX4
  j insertO4
  insertX4:
  lb $t2 x
  sb $t2 33($t5)
  j checkByteArrayPos5
  j end
 insertO4:
   bne $t1 79 space4
   lb $t2 o
   sb $t2 33($t5)
   j checkByteArrayPos5
   j end
  space4:
   lb $t2 space
   sb $t2 33($t5)
   j checkByteArrayPos5

 #-----pos5-----
     checkByteArrayPos5:
  lb $t1 4($a0)
  beq $t1 88 insertX5
  j insertO5
  insertX5:
  lb $t2 x
  sb $t2 37($t5)
  j checkByteArrayPos6
  j end
 insertO5:
   bne $t1 79 space5
   lb $t2 o
   sb $t2 37($t5)
   j checkByteArrayPos6
   j end
  space5:
   lb $t2 space
   sb $t2 37($t5)
   j checkByteArrayPos6
 #-----pos6-----
     checkByteArrayPos6:
  lb $t1 5($a0)
  beq $t1 88 insertX6
  j insertO6
  insertX6:
  lb $t2 x
  sb $t2 41($t5)
  j checkByteArrayPos7
  #j end
 insertO6:
   bne $t1 79 space6
   lb $t2 o
   sb $t2 41($t5)
   j checkByteArrayPos7
   #j end
  space6:
   lb $t2 space
   sb $t2 41($t5)
   j checkByteArrayPos7
 #-----pos7-----
     checkByteArrayPos7:
  lb $t1 6($a0)
  beq $t1 88 insertX7
  j insertO7
  insertX7:
  lb $t2 x
  sb $t2 57($t5)
  j checkByteArrayPos8
  #j end
 insertO7:
   bne $t1 79 space7
   lb $t2 o
   sb $t2 57($t5)
   j checkByteArrayPos8
   #j end
  space7:
   lb $t2 space
   sb $t2 57($t5)
   j checkByteArrayPos8

 #-----pos8-----
  checkByteArrayPos8:
  lb $t1 7($a0)
  beq $t1 88 insertX8
  j insertO8
  insertX8:
  lb $t2 x
  sb $t2 61($t5)
  j checkByteArrayPos9
  #j end
 insertO8:
   bne $t1 79 space8
   lb $t2 o
   sb $t2 61($t5)
   j checkByteArrayPos9
   #j end
  space8:
   lb $t2 space
   sb $t2 61($t5)
   j checkByteArrayPos9

  #-----pos9-----
  checkByteArrayPos9:
  lb $t1 8($a0)
  beq $t1 88 insertX9
  j insertO9
  insertX9:
  lb $t2 x
  sb $t2 65($t5)
  #j checkByteArrayPos7
  j end
 insertO9:
   bne $t1 79 space9
   lb $t2 o
   sb $t2 65($t5)
   #j checkByteArrayPos7
   j end
  space9:
   lb $t2 space
   sb $t2 65($t5)
   #j checkByteArrayPos7

 end:
  li $v0 4
  la $a0 draw
  syscall


  jr $ra
