10 REM **********ZX CODE CLUB****************   
15 REM * Tic-Tac-Toe or Noughts and Crosses *   
20 REM *********** Gary Plowman *************   
30 INK 7: PAPER 6: BORDER 7: CLS : LET ply=1: LET win=0: DIM a(9,2): LET sq=0   
40 GO SUB 90   
50 GO TO 300   
60 REM *********** DRAW BOARD   
90 PRINT AT 2,10; INK 1;"Tic Tac Toe" 
110 PLOT INK 5;100,40: DRAW INK 5;0,100 
120 PLOT INK 5;150,40: DRAW INK 5;0,100 
130 PLOT INK 5;65,70: DRAW INK 5;120,0 
140 PLOT INK 5;65,110: DRAW INK 5;120,0 
160 REM State 1=player 1, 2=Player 2 
175 INK 5: PLOT 50,170: DRAW -40,-40: PLOT 10,170: DRAW 40,-40 
180 CIRCLE INK 4;220,150,20 
190 PRINT ; INK 0; PAPER 3;AT 14,0;"1 2 3";AT 15,0;"4 5 6";AT 16,0;"7 8 9" 
210 RETURN 
300 REM ******* Test Press 
310 PRINT AT 18,1; INK 7; PAPER 6-ply;"PLAYER ";ply;" Choose Square 1 - 9" 
320 LET i$=INKEY$() 
330 IF i$>="1" AND i$<="9" THEN LET square=VAL i$: GO SUB 1000 
340 IF i$="" THEN GOTO 320 
350 GO SUB 2000: REM ****** Test for Winning Conditions :)
355 IF sq=0 THEN LET win=-1 
360 IF win>0 THEN PRINT AT 18,1;"PLAYER ";win;" has WON!": BEEP .4,3: BEEP 2,10: GO TO 10 
370 IF win<0 THEN PRINT AT 18,1;"GAME DRAWN - RESTARTING": BEEP .4,3: BEEP 2,10: GO TO 10 
400 GO TO 300 
1000 REM ******* Check squares 
1010 IF a(square,1)=1 OR a(square,2)=1 THEN PRINT AT 18,1; INK 3;"Square Taken Already": BEEP .3,1: GO TO 1050 
1020 LET a(square,ply)=1: LET ply=ply+1: LET sq=sq+1 
1025 PRINT AT 18,1; INK 4;"Good move!": BEEP .4,12 
1030 IF ply=3 THEN LET ply=1 
1040 GO SUB 3000: REM ******* Draw Move 
1050 PRINT AT 18,1;"                     "
1090 RETURN
2000 REM ***** WINNING CONDITIONS CHECK
2010 FOR n=1 TO 2
2020 IF a(1,n)=1 AND a(2,n)=1 AND a(3,n)=1 THEN LET win=n 
2030 IF a(1,n)=1 AND a(4,n)=1 AND a(7,n)=1 THEN LET win=n 
2040 IF a(2,n)=1 AND a(5,n)=1 AND a(8,n)=1 THEN LET win=n
2050 IF a(3,n)=1 AND a(6,n)=1 AND a(9,n)=1 THEN LET win=n 
2060 IF a(3,n)=1 AND a(5,n)=1 AND a(7,n)=1 THEN LET win=n
2070 IF a(1,n)=1 AND a(5,n)=1 AND a(9,n)=1 THEN LET win=n 
2080 IF a(4,n)=1 AND a(5,n)=1 AND a(6,n)=1 THEN LET win=n 
2090 IF a(7,n)=1 AND a(8,n)=1 AND a(9,n)=1 THEN LET win=n
2100 NEXT n
2110 RETURN
3000 REM ******* DRAW MOVE 
3010 LET posx=80: LET posy=130: REM ***** where to draw 
3020 IF square=1 THEN LET posx=80: LET posy=130 
3030 IF square=2 THEN LET posx=130: LET posy=130 
3040 IF square=3 THEN LET posx=180: LET posy=130 
3050 IF square=4 THEN LET posx=80: LET posy=100 
3060 IF square=5 THEN LET posx=130: LET posy=100 
3070 IF square=6 THEN LET posx=180: LET posy=100 
3080 IF square=7 THEN LET posx=80: LET posy=70 
3090 IF square=8 THEN LET posx=130: LET posy=70 
3100 IF square=9 THEN LET posx=180: LET posy=70 
3300 IF ply=1 THEN CIRCLE INK 4;posx-10,posy-10,10 
3310 IF ply=2 THEN INK 5: PLOT posx,posy: DRAW -20,-20: PLOT posx-20,posy: DRAW 20,-20 
3350 RETURN