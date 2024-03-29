EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Amplifier_Operational:TL072 U6
U 2 1 62833F92
P 6750 4000
AR Path="/628336F3/62833F92" Ref="U6"  Part="1" 
AR Path="/6287C7A2/62833F92" Ref="U?"  Part="1" 
AR Path="/629A6A5C/62833F92" Ref="U6"  Part="2" 
AR Path="/62A72D01/62833F92" Ref="U?"  Part="1" 
F 0 "U6" H 6750 4367 50  0000 C CNN
F 1 "TL072" H 6750 4276 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 6750 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6750 4000 50  0001 C CNN
	2    6750 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 62836D79
P 5900 3900
AR Path="/628336F3/62836D79" Ref="R16"  Part="1" 
AR Path="/6287C7A2/62836D79" Ref="R?"  Part="1" 
AR Path="/629A6A5C/62836D79" Ref="R19"  Part="1" 
AR Path="/62A72D01/62836D79" Ref="R?"  Part="1" 
F 0 "R19" V 5693 3900 50  0000 C CNN
F 1 "51K" V 5784 3900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5830 3900 50  0001 C CNN
F 3 "~" H 5900 3900 50  0001 C CNN
	1    5900 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 62837E6B
P 5350 3900
AR Path="/628336F3/62837E6B" Ref="R15"  Part="1" 
AR Path="/6287C7A2/62837E6B" Ref="R?"  Part="1" 
AR Path="/629A6A5C/62837E6B" Ref="R18"  Part="1" 
AR Path="/62A72D01/62837E6B" Ref="R?"  Part="1" 
F 0 "R18" V 5143 3900 50  0000 C CNN
F 1 "75K" V 5234 3900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5280 3900 50  0001 C CNN
F 3 "~" H 5350 3900 50  0001 C CNN
	1    5350 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 62838612
P 4850 3900
AR Path="/628336F3/62838612" Ref="R14"  Part="1" 
AR Path="/6287C7A2/62838612" Ref="R?"  Part="1" 
AR Path="/629A6A5C/62838612" Ref="R17"  Part="1" 
AR Path="/62A72D01/62838612" Ref="R?"  Part="1" 
F 0 "R17" V 4643 3900 50  0000 C CNN
F 1 "11k" V 4734 3900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4780 3900 50  0001 C CNN
F 3 "~" H 4850 3900 50  0001 C CNN
	1    4850 3900
	0    1    1    0   
$EndComp
Text Notes 2800 5350 0    50   ~ 0
5th order LPF (cascade 2nd sk + 1st passtive + 2nd sk)\nButterworth, Cutoff = 4477Hz\nFrom textbook, Q1=.618 Q2=1.620\nhttp://sim.okawa-denshi.jp/en/Sallen3tool.php\nhttp://sim.okawa-denshi.jp/en/OPstool.php
$Comp
L Device:C C6
U 1 1 62838D1A
P 6750 3300
AR Path="/628336F3/62838D1A" Ref="C6"  Part="1" 
AR Path="/6287C7A2/62838D1A" Ref="C?"  Part="1" 
AR Path="/629A6A5C/62838D1A" Ref="C9"  Part="1" 
AR Path="/62A72D01/62838D1A" Ref="C?"  Part="1" 
F 0 "C9" V 6498 3300 50  0000 C CNN
F 1 "2.2n" V 6589 3300 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 6788 3150 50  0001 C CNN
F 3 "~" H 6750 3300 50  0001 C CNN
	1    6750 3300
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 62839637
P 6200 4200
AR Path="/628336F3/62839637" Ref="C5"  Part="1" 
AR Path="/6287C7A2/62839637" Ref="C?"  Part="1" 
AR Path="/629A6A5C/62839637" Ref="C8"  Part="1" 
AR Path="/62A72D01/62839637" Ref="C?"  Part="1" 
F 0 "C8" H 6085 4154 50  0000 R CNN
F 1 "150p" H 6085 4245 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 6238 4050 50  0001 C CNN
F 3 "~" H 6200 4200 50  0001 C CNN
	1    6200 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:C C4
U 1 1 62839D06
P 5100 4200
AR Path="/628336F3/62839D06" Ref="C4"  Part="1" 
AR Path="/6287C7A2/62839D06" Ref="C?"  Part="1" 
AR Path="/629A6A5C/62839D06" Ref="C7"  Part="1" 
AR Path="/62A72D01/62839D06" Ref="C?"  Part="1" 
F 0 "C7" H 4985 4154 50  0000 R CNN
F 1 "3.3n" H 4985 4245 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 5138 4050 50  0001 C CNN
F 3 "~" H 5100 4200 50  0001 C CNN
	1    5100 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 3900 5100 3900
Wire Wire Line
	5500 3900 5600 3900
Wire Wire Line
	6050 3900 6200 3900
Wire Wire Line
	6200 4050 6200 3900
Connection ~ 6200 3900
Wire Wire Line
	6200 3900 6450 3900
Wire Wire Line
	5600 3900 5600 3300
Wire Wire Line
	5600 3300 6600 3300
Connection ~ 5600 3900
Wire Wire Line
	5600 3900 5750 3900
Wire Wire Line
	6900 3300 7200 3300
Wire Wire Line
	7200 3300 7200 4000
Wire Wire Line
	7200 4000 7050 4000
Wire Wire Line
	7300 4000 7200 4000
Connection ~ 7200 4000
Wire Wire Line
	6450 4100 6400 4100
Wire Wire Line
	6400 4100 6400 4350
Wire Wire Line
	6400 4350 7200 4350
Wire Wire Line
	7200 4350 7200 4000
Wire Wire Line
	5100 4050 5100 3900
Connection ~ 5100 3900
Wire Wire Line
	5100 3900 5200 3900
Wire Wire Line
	5100 4350 5100 4450
Wire Wire Line
	6200 4450 6200 4350
Text HLabel 2200 3800 0    50   Input ~ 0
IN
Text HLabel 7300 4000 2    50   Input ~ 0
OUT
$Comp
L power:GNDA #PWR?
U 1 1 630391FD
P 5100 4450
AR Path="/630391FD" Ref="#PWR?"  Part="1" 
AR Path="/628336F3/630391FD" Ref="#PWR0103"  Part="1" 
AR Path="/629A6A5C/630391FD" Ref="#PWR0110"  Part="1" 
AR Path="/62A72D01/630391FD" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 5100 4200 50  0001 C CNN
F 1 "GNDA" H 5105 4277 50  0000 C CNN
F 2 "" H 5100 4450 50  0001 C CNN
F 3 "" H 5100 4450 50  0001 C CNN
	1    5100 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 630399DB
P 6200 4450
AR Path="/630399DB" Ref="#PWR?"  Part="1" 
AR Path="/628336F3/630399DB" Ref="#PWR0106"  Part="1" 
AR Path="/629A6A5C/630399DB" Ref="#PWR0112"  Part="1" 
AR Path="/62A72D01/630399DB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 6200 4200 50  0001 C CNN
F 1 "GNDA" H 6205 4277 50  0000 C CNN
F 2 "" H 6200 4450 50  0001 C CNN
F 3 "" H 6200 4450 50  0001 C CNN
	1    6200 4450
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U?
U 2 1 62C92C44
P 3850 3900
AR Path="/628336F3/62C92C44" Ref="U?"  Part="1" 
AR Path="/6287C7A2/62C92C44" Ref="U?"  Part="1" 
AR Path="/629A6A5C/62C92C44" Ref="U?"  Part="2" 
AR Path="/62A72D01/62C92C44" Ref="U?"  Part="1" 
F 0 "U?" H 3850 4267 50  0000 C CNN
F 1 "TL072" H 3850 4176 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3850 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 3850 3900 50  0001 C CNN
	2    3850 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 62C92C4E
P 3000 3800
AR Path="/628336F3/62C92C4E" Ref="R?"  Part="1" 
AR Path="/6287C7A2/62C92C4E" Ref="R?"  Part="1" 
AR Path="/629A6A5C/62C92C4E" Ref="R?"  Part="1" 
AR Path="/62A72D01/62C92C4E" Ref="R?"  Part="1" 
F 0 "R?" V 2793 3800 50  0000 C CNN
F 1 "30K" V 2884 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2930 3800 50  0001 C CNN
F 3 "~" H 3000 3800 50  0001 C CNN
	1    3000 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 62C92C58
P 2450 3800
AR Path="/628336F3/62C92C58" Ref="R?"  Part="1" 
AR Path="/6287C7A2/62C92C58" Ref="R?"  Part="1" 
AR Path="/629A6A5C/62C92C58" Ref="R?"  Part="1" 
AR Path="/62A72D01/62C92C58" Ref="R?"  Part="1" 
F 0 "R?" V 2243 3800 50  0000 C CNN
F 1 "91K" V 2334 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2380 3800 50  0001 C CNN
F 3 "~" H 2450 3800 50  0001 C CNN
	1    2450 3800
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 62C92C76
P 3300 4100
AR Path="/628336F3/62C92C76" Ref="C?"  Part="1" 
AR Path="/6287C7A2/62C92C76" Ref="C?"  Part="1" 
AR Path="/629A6A5C/62C92C76" Ref="C?"  Part="1" 
AR Path="/62A72D01/62C92C76" Ref="C?"  Part="1" 
F 0 "C?" H 3185 4054 50  0000 R CNN
F 1 "470p" H 3185 4145 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 3338 3950 50  0001 C CNN
F 3 "~" H 3300 4100 50  0001 C CNN
	1    3300 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3150 3800 3300 3800
Wire Wire Line
	3300 3950 3300 3800
Connection ~ 3300 3800
Wire Wire Line
	3300 3800 3550 3800
Wire Wire Line
	4000 3200 4300 3200
Wire Wire Line
	4300 3200 4300 3900
Wire Wire Line
	4300 3900 4150 3900
Connection ~ 4300 3900
Wire Wire Line
	3550 4000 3500 4000
Wire Wire Line
	3500 4000 3500 4250
Wire Wire Line
	3500 4250 4300 4250
Wire Wire Line
	4300 4250 4300 3900
Wire Wire Line
	3300 4350 3300 4250
$Comp
L power:GNDA #PWR?
U 1 1 62C92CAE
P 3300 4350
AR Path="/62C92CAE" Ref="#PWR?"  Part="1" 
AR Path="/628336F3/62C92CAE" Ref="#PWR?"  Part="1" 
AR Path="/629A6A5C/62C92CAE" Ref="#PWR?"  Part="1" 
AR Path="/62A72D01/62C92CAE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3300 4100 50  0001 C CNN
F 1 "GNDA" H 3305 4177 50  0000 C CNN
F 2 "" H 3300 4350 50  0001 C CNN
F 3 "" H 3300 4350 50  0001 C CNN
	1    3300 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 62C92C6C
P 3850 3200
AR Path="/628336F3/62C92C6C" Ref="C?"  Part="1" 
AR Path="/6287C7A2/62C92C6C" Ref="C?"  Part="1" 
AR Path="/629A6A5C/62C92C6C" Ref="C?"  Part="1" 
AR Path="/62A72D01/62C92C6C" Ref="C?"  Part="1" 
F 0 "C?" V 3598 3200 50  0000 C CNN
F 1 "1n" V 3689 3200 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 3888 3050 50  0001 C CNN
F 3 "~" H 3850 3200 50  0001 C CNN
	1    3850 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 3800 2850 3800
Wire Wire Line
	2600 3800 2700 3800
Connection ~ 2700 3800
Wire Wire Line
	2700 3800 2700 3200
Wire Wire Line
	2700 3200 3700 3200
Wire Wire Line
	4300 3900 4700 3900
Wire Wire Line
	2200 3800 2300 3800
$EndSCHEMATC
