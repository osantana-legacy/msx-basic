1000 '
1010 '
1020 '
1030 '
1040 '
1050 CLEAR 3000:POKE &HFCAB,255
1060 DEFINT A-Z
1070 MA=10
1080 SCREEN 0,0,0
1090 WIDTH 39
1100 COLOR 15,1,1
1110 CLS:N$="FALCON"
1120 KEY OFF
1140 PRINT"XWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWY"
1150 FOR T=1 TO 18
1160 PRINT"V                                    V"
1170 NEXT T
1175 PRINT"ZWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW["
1180 LOCATE 16,1:PRINT"Minhoca"
1190 LOCATE 1,18:PRINT"(C) Copyright 1992, Bit & Byte Soft."
1250 LOCATE 9,16:PRINT"Tecle qualquer tecla ";
1255 KM=1:KE=1
1258 IF INKEY$<>"" THEN 1258
1260 X$=INPUT$(1)
1265 IF X$=CHR$(24) THEN GOSUB 3000
1290 '
1300 '
1310 '
1320 GOSUB 1580
1330 INTERVAL OFF
1340 SOUND 7,255
1350 SCREEN 0:WIDTH 39:CLS:KEY OFF
1370 PRINT"XWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWY":FOR T=1 TO 18:PRINT"V                                    V":NEXT T:PRINT"ZWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW["
1375 LOCATE 16,1:PRINT"Minhoca"
1380 LOCATE 5,3
1390 PRINT "Voc� comeu ";
1400 PRINT VT;" vitaminas"
1410 LOCATE 5,5
1420 PRINT"o Record de ";N$;" � ";
1430 PRINT MA
1440 IF VT>MA THEN MA=VT
1450 IF MA>VT THEN 1250
1460 LOCATE 3,8
1470 PRINT"Parab�ns, voc� bateu o Record !!!"
1480 X$="t150l4"
1490 SOUND 7,248
1500 PLAY X$,X$,X$
1510 PLAY "o4B","o5d",""
1520 PLAY "o5c","o5e",""
1530 PLAY "o4b","o5d","o5g"
1540 PLAY "o4a","o5d","o5f#"
1550 PLAY "o3g","o4b","o5g"
1560 IF PLAY(1) THEN 1560
1565 GOSUB 4000
1570 GOTO 1250
1580 '
1590 '
1600 '
1610 SCREEN 3
1620 BD$="R255D176L250U176"
1630 PSET(0,0),3
1640 DRAW BD$
1650 FOR X=12 TO 243 STEP 4
1660     PSET(X,187),11
1670     SOUND 0,X-12
1680     SOUND 1,0
1690     SOUND 2,X
1700     SOUND 3,0
1710     SOUND 4,X+12
1720     SOUND 5,0
1730     SOUND 7,248
1740     SOUND 8,5
1750     SOUND 9,5
1760     SOUND 10,5
1770 NEXT X
1780 CT = 0
1790 XR = 20
1800 YR = 100
1810 XC = 24
1820 YC = 100
1830 XT = 243
1840 ON INTERVAL=10 GOSUB 2250
1850 INTERVAL ON
1860 PSET(XR,YR),4
1870 PSET(XC,YC),7
1880 ID$=CHR$(3)
1890 DR=3
1900 FOR I = 1 TO 9
1910     GOSUB 2160
1920 NEXT I
1930 VT=0
1940 PSET(XC,YC),4
1950 IF XT<12 THEN RETURN
1960 X$=INKEY$
1970 X=STICK(0)
1980 IF X<>0 THEN DR=X
1990 IF DR>1 AND DR<5 THEN XC=XC+4
2000 IF DR>5 AND DR<9 THEN XC=XC-4
2010 IF DR=8 OR DR=1 OR DR=2 THEN YC=YC-4
2020 IF DR>3 AND DR<7 THEN YC=YC+4
2030 IF POINT(XC,YC)=2 THEN GOSUB 2400
2040 IF POINT (XC,YC)<>1 AND KE=1 THEN RETURN
2050 PSET(XC,YC),7
2060 ID$=ID$+CHR$(DR)
2070 IF CT>0 THEN CT=CT-1:GOTO 1940
2080 PRESET(XR,YR)
2090 X=ASC(LEFT$(ID$,1))
2100 IF X>1 AND X<5 THEN XR=XR+4
2110 IF X>5 AND X<9 THEN XR=XR-4
2120 IF X=8 OR X=1 OR X=2 THEN YR=YR-4
2130 IF X>3 AND X<7 THEN YR=YR+4
2140 ID$=MID$(ID$,2)
2150 GOTO 1940
2160 '
2170 '
2180 '
2190 X=INT(220*RND(1))+12
2200 Y=INT(160*RND(1))+12
2210 IF POINT (X,Y)<>1 THEN GOTO 2190
2220 PSET(X,Y),2
2230 VT=VT+1
2240 RETURN
2250 '
2260 '
2270 '
2280 INTERVAL STOP
2290 SOUND 0,255
2300 SOUND 1,XT/16
2310 SOUND 7,254
2320 SOUND 8,16
2330 SOUND 11,0
2340 SOUND 12,5
2350 SOUND 13,0
2360 XT=XT-KM
2370 PSET(XT,187),1
2380 INTERVAL ON
2390 RETURN
2400 '
2410 '
2420 '
2430 INTERVAL STOP
2440 SOUND 2,0
2450 FOR X=15 TO 0 STEP -1
2460     SOUND 3,X
2470     SOUND 7,253
2480     SOUND 9,10
2490 NEXT X
2500 SOUND 7,255
2510 GOSUB 2160
2520 PRESET(XC,YC)
2530 IF LEN(ID$)<240 THEN CT=CT+10 ELSE CT=0
2540 FOR X=1 TO 4
2550     IF XT>240 THEN GOTO 2580
2560     PSET(XT,187),11
2570     XT=XT+4
2580 NEXT X
2590 INTERVAL ON
2600 RETURN
3000 PC=INP(&HAA) AND &HF0 OR &H6
3010 OUT &HAA,PC
3020 X=INP(&HA9) AND &B00000011
3030 IF X THEN RETURN
3040 Z$=INPUT$(10)
3060 IF Z$="IMORTALIZA" THEN KE=0
3070 IF Z$="SEM PERDA " THEN KM=0
3080 IF LEFT$(Z$,7)="RECNOVO" THEN MA=VAL(RIGHT$(Z$,2))
3090 RETURN
4000 ' Nome
4005 IF MA>VT THEN RETURN
4010 H=33:MA=VT:N$=""
4020 G=STICK(0):G$=INKEY$
4030 IF G=0 AND G$="" THEN 4020
4035 FOR T=1 TO 50:NEXT T
4040 IF G=3 THEN H=H+1
4050 IF G=7 THEN H=H-1
4055 IF G$=" " THEN N=N+1:N$=N$+CHR$(H)
4056 IF G$=CHR$(13) THEN N$=N$+CHR$(H):RETURN
4060 IF H>90 THEN H=33
4070 IF H<33 THEN H=90
4075 IF N>6 THEN RETURN
4080 LOCATE 5+N,12:PRINTCHR$(H)
4090 GOTO 4020
