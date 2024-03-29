EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
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
U 1 1 62833F92
P 5400 3800
AR Path="/628336F3/62833F92" Ref="U6"  Part="1" 
AR Path="/6287C7A2/62833F92" Ref="U?"  Part="1" 
AR Path="/629A6A5C/62833F92" Ref="U6"  Part="2" 
F 0 "U6" H 5400 4167 50  0000 C CNN
F 1 "TL072" H 5400 4076 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5400 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5400 3800 50  0001 C CNN
	1    5400 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 62836D79
P 4550 3700
AR Path="/628336F3/62836D79" Ref="R16"  Part="1" 
AR Path="/6287C7A2/62836D79" Ref="R?"  Part="1" 
AR Path="/629A6A5C/62836D79" Ref="R19"  Part="1" 
F 0 "R16" V 4343 3700 50  0000 C CNN
F 1 "47k" V 4434 3700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4480 3700 50  0001 C CNN
F 3 "~" H 4550 3700 50  0001 C CNN
	1    4550 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 62837E6B
P 4000 3700
AR Path="/628336F3/62837E6B" Ref="R15"  Part="1" 
AR Path="/6287C7A2/62837E6B" Ref="R?"  Part="1" 
AR Path="/629A6A5C/62837E6B" Ref="R18"  Part="1" 
F 0 "R15" V 3793 3700 50  0000 C CNN
F 1 "150k" V 3884 3700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3930 3700 50  0001 C CNN
F 3 "~" H 4000 3700 50  0001 C CNN
	1    4000 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 62838612
P 3500 3700
AR Path="/628336F3/62838612" Ref="R14"  Part="1" 
AR Path="/6287C7A2/62838612" Ref="R?"  Part="1" 
AR Path="/629A6A5C/62838612" Ref="R17"  Part="1" 
F 0 "R14" V 3293 3700 50  0000 C CNN
F 1 "11k" V 3384 3700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3430 3700 50  0001 C CNN
F 3 "~" H 3500 3700 50  0001 C CNN
	1    3500 3700
	0    1    1    0   
$EndComp
Text Notes 3350 5500 0    50   ~ 0
3rd order sallen key LPF\nButterworth, Cutoff = 7KHz\nhttp://sim.okawa-denshi.jp/en/Sallen3tool.php
$Comp
L Device:C C6
U 1 1 62838D1A
P 5400 3100
AR Path="/628336F3/62838D1A" Ref="C6"  Part="1" 
AR Path="/6287C7A2/62838D1A" Ref="C?"  Part="1" 
AR Path="/629A6A5C/62838D1A" Ref="C9"  Part="1" 
F 0 "C6" V 5148 3100 50  0000 C CNN
F 1 "680p" V 5239 3100 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 5438 2950 50  0001 C CNN
F 3 "~" H 5400 3100 50  0001 C CNN
	1    5400 3100
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 62839637
P 4850 4000
AR Path="/628336F3/62839637" Ref="C5"  Part="1" 
AR Path="/6287C7A2/62839637" Ref="C?"  Part="1" 
AR Path="/629A6A5C/62839637" Ref="C8"  Part="1" 
F 0 "C5" H 4735 3954 50  0000 R CNN
F 1 "100p" H 4735 4045 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 4888 3850 50  0001 C CNN
F 3 "~" H 4850 4000 50  0001 C CNN
	1    4850 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:C C4
U 1 1 62839D06
P 3750 4000
AR Path="/628336F3/62839D06" Ref="C4"  Part="1" 
AR Path="/6287C7A2/62839D06" Ref="C?"  Part="1" 
AR Path="/629A6A5C/62839D06" Ref="C7"  Part="1" 
F 0 "C4" H 3635 3954 50  0000 R CNN
F 1 "2.2n" H 3635 4045 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 3788 3850 50  0001 C CNN
F 3 "~" H 3750 4000 50  0001 C CNN
	1    3750 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	3050 3700 3350 3700
Wire Wire Line
	3650 3700 3750 3700
Wire Wire Line
	4150 3700 4250 3700
Wire Wire Line
	4700 3700 4850 3700
Wire Wire Line
	4850 3850 4850 3700
Connection ~ 4850 3700
Wire Wire Line
	4850 3700 5100 3700
Wire Wire Line
	4250 3700 4250 3100
Wire Wire Line
	4250 3100 5250 3100
Connection ~ 4250 3700
Wire Wire Line
	4250 3700 4400 3700
Wire Wire Line
	5550 3100 5850 3100
Wire Wire Line
	5850 3100 5850 3800
Wire Wire Line
	5850 3800 5700 3800
Wire Wire Line
	5950 3800 5850 3800
Connection ~ 5850 3800
Wire Wire Line
	5100 3900 5050 3900
Wire Wire Line
	5050 3900 5050 4150
Wire Wire Line
	5050 4150 5850 4150
Wire Wire Line
	5850 4150 5850 3800
Wire Wire Line
	3750 3850 3750 3700
Connection ~ 3750 3700
Wire Wire Line
	3750 3700 3850 3700
Wire Wire Line
	3750 4150 3750 4250
Wire Wire Line
	4850 4250 4850 4150
Text HLabel 3050 3700 0    50   Input ~ 0
IN
Text HLabel 5950 3800 2    50   Input ~ 0
OUT
$Comp
L power:GNDA #PWR?
U 1 1 630391FD
P 3750 4250
AR Path="/630391FD" Ref="#PWR?"  Part="1" 
AR Path="/628336F3/630391FD" Ref="#PWR0103"  Part="1" 
AR Path="/629A6A5C/630391FD" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0103" H 3750 4000 50  0001 C CNN
F 1 "GNDA" H 3755 4077 50  0000 C CNN
F 2 "" H 3750 4250 50  0001 C CNN
F 3 "" H 3750 4250 50  0001 C CNN
	1    3750 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 630399DB
P 4850 4250
AR Path="/630399DB" Ref="#PWR?"  Part="1" 
AR Path="/628336F3/630399DB" Ref="#PWR0106"  Part="1" 
AR Path="/629A6A5C/630399DB" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0106" H 4850 4000 50  0001 C CNN
F 1 "GNDA" H 4855 4077 50  0000 C CNN
F 2 "" H 4850 4250 50  0001 C CNN
F 3 "" H 4850 4250 50  0001 C CNN
	1    4850 4250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
