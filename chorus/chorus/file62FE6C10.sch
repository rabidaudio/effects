EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4250 2400 0    50   ~ 0
BBD clock frequency is half the RC frequency\nDelay range: 2.54ms to 51.2ms (1024/f/2)
Wire Wire Line
	4000 3000 4100 3000
NoConn ~ 4100 3400
NoConn ~ 4100 3200
$Comp
L power:+9V #PWR?
U 1 1 62FF72F4
P 4500 2650
AR Path="/62FF72F4" Ref="#PWR?"  Part="1" 
AR Path="/62FE6C11/62FF72F4" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 4500 2500 50  0001 C CNN
F 1 "+9V" H 4515 2823 50  0000 C CNN
F 2 "" H 4500 2650 50  0001 C CNN
F 3 "" H 4500 2650 50  0001 C CNN
	1    4500 2650
	1    0    0    -1  
$EndComp
Text Notes 4800 2650 0    50   ~ 0
simply 14/15 VDD\n3.3K 4.7K
Connection ~ 6300 3600
Wire Wire Line
	6800 3600 6300 3600
Wire Wire Line
	6300 3600 6150 3600
Wire Wire Line
	6300 3850 6300 3600
$Comp
L Device:R R?
U 1 1 62FF7300
P 6950 3600
AR Path="/62FF7300" Ref="R?"  Part="1" 
AR Path="/62FE6C11/62FF7300" Ref="R23"  Part="1" 
F 0 "R23" V 7150 3600 50  0000 C CNN
F 1 "5.6K" V 7050 3600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6880 3600 50  0001 C CNN
F 3 "~" H 6950 3600 50  0001 C CNN
	1    6950 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 62FF7306
P 6950 3400
AR Path="/62FF7306" Ref="R?"  Part="1" 
AR Path="/62FE6C11/62FF7306" Ref="R22"  Part="1" 
F 0 "R22" V 6743 3400 50  0000 C CNN
F 1 "5.6K" V 6834 3400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6880 3400 50  0001 C CNN
F 3 "~" H 6950 3400 50  0001 C CNN
	1    6950 3400
	0    1    1    0   
$EndComp
Connection ~ 5100 2750
Wire Wire Line
	5550 2750 5550 3000
Wire Wire Line
	5100 2750 5550 2750
Wire Wire Line
	4900 2750 5100 2750
Wire Wire Line
	4900 3200 4900 2750
$Comp
L power:GND #PWR?
U 1 1 62FF7311
P 5100 3050
AR Path="/62FF7311" Ref="#PWR?"  Part="1" 
AR Path="/62FE6C11/62FF7311" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 5100 2800 50  0001 C CNN
F 1 "GND" H 5105 2877 50  0000 C CNN
F 2 "" H 5100 3050 50  0001 C CNN
F 3 "" H 5100 3050 50  0001 C CNN
	1    5100 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 62FF7317
P 5100 2900
AR Path="/62FF7317" Ref="C?"  Part="1" 
AR Path="/62FE6C11/62FF7317" Ref="C10"  Part="1" 
F 0 "C10" H 4985 2854 50  0000 R CNN
F 1 "3.3u" H 4985 2945 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 5138 2750 50  0001 C CNN
F 3 "~" H 5100 2900 50  0001 C CNN
	1    5100 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5750 3000 5750 2750
Wire Wire Line
	4500 2800 4500 2650
$Comp
L power:+9V #PWR?
U 1 1 62FF731F
P 5750 2750
AR Path="/62FF731F" Ref="#PWR?"  Part="1" 
AR Path="/62FE6C11/62FF731F" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 5750 2600 50  0001 C CNN
F 1 "+9V" H 5765 2923 50  0000 C CNN
F 2 "" H 5750 2750 50  0001 C CNN
F 3 "" H 5750 2750 50  0001 C CNN
	1    5750 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3700 4500 3600
Wire Wire Line
	5150 3300 4900 3300
Wire Wire Line
	4900 3400 5150 3400
$Comp
L Timer:MN3102 U?
U 1 1 62FF7328
P 4500 3200
AR Path="/62FF7328" Ref="U?"  Part="1" 
AR Path="/62FE6C11/62FF7328" Ref="U4"  Part="1" 
F 0 "U4" H 4650 2800 50  0000 C CNN
F 1 "MN3102" H 4750 2700 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4500 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 4600 3550 50  0001 C CNN
	1    4500 3200
	1    0    0    -1  
$EndComp
$Comp
L Audio:MN3207 U?
U 1 1 62FF732E
P 5650 3500
AR Path="/62FF732E" Ref="U?"  Part="1" 
AR Path="/62FE6C11/62FF732E" Ref="U7"  Part="1" 
F 0 "U7" H 5750 3000 50  0000 C CNN
F 1 "MN3207" H 5850 2900 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5250 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5350 3900 50  0001 C CNN
	1    5650 3500
	1    0    0    -1  
$EndComp
Text Notes 6600 3150 0    50   ~ 0
TODO: buffer here?
Wire Wire Line
	6150 3400 6600 3400
Wire Wire Line
	6800 3400 6600 3400
Connection ~ 6600 3400
Wire Wire Line
	6600 3400 6600 3850
$Comp
L power:GNDA #PWR?
U 1 1 63000844
P 6600 4250
AR Path="/63000844" Ref="#PWR?"  Part="1" 
AR Path="/62FE6C11/63000844" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 6600 4000 50  0001 C CNN
F 1 "GNDA" H 6605 4077 50  0000 C CNN
F 2 "" H 6600 4250 50  0001 C CNN
F 3 "" H 6600 4250 50  0001 C CNN
	1    6600 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 6300084A
P 6300 4250
AR Path="/6300084A" Ref="#PWR?"  Part="1" 
AR Path="/62FE6C11/6300084A" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 6300 4000 50  0001 C CNN
F 1 "GNDA" H 6305 4077 50  0000 C CNN
F 2 "" H 6300 4250 50  0001 C CNN
F 3 "" H 6300 4250 50  0001 C CNN
	1    6300 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4250 6300 4150
Wire Wire Line
	6600 4250 6600 4150
$Comp
L Device:R R?
U 1 1 63000852
P 6300 4000
AR Path="/63000852" Ref="R?"  Part="1" 
AR Path="/62FE6C11/63000852" Ref="R20"  Part="1" 
F 0 "R20" V 6500 4000 50  0000 C CNN
F 1 "100K" V 6400 4000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6230 4000 50  0001 C CNN
F 3 "~" H 6300 4000 50  0001 C CNN
	1    6300 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 4250 5650 4000
$Comp
L power:GND #PWR?
U 1 1 63000859
P 5650 4250
AR Path="/63000859" Ref="#PWR?"  Part="1" 
AR Path="/62FE6C11/63000859" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 5650 4000 50  0001 C CNN
F 1 "GND" H 5655 4077 50  0000 C CNN
F 2 "" H 5650 4250 50  0001 C CNN
F 3 "" H 5650 4250 50  0001 C CNN
	1    5650 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6300085F
P 6600 4000
AR Path="/6300085F" Ref="R?"  Part="1" 
AR Path="/62FE6C11/6300085F" Ref="R21"  Part="1" 
F 0 "R21" V 6800 4000 50  0000 C CNN
F 1 "100K" V 6700 4000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6530 4000 50  0001 C CNN
F 3 "~" H 6600 4000 50  0001 C CNN
	1    6600 4000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63009B30
P 4500 3700
AR Path="/63009B30" Ref="#PWR?"  Part="1" 
AR Path="/62FE6C11/63009B30" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 4500 3450 50  0001 C CNN
F 1 "GND" H 4505 3527 50  0000 C CNN
F 2 "" H 4500 3700 50  0001 C CNN
F 3 "" H 4500 3700 50  0001 C CNN
	1    4500 3700
	1    0    0    -1  
$EndComp
Text HLabel 4000 3000 0    50   Input ~ 0
CLOCK
Text HLabel 5050 3600 0    50   Input ~ 0
IN
Wire Wire Line
	5050 3600 5150 3600
Wire Wire Line
	7100 3400 7200 3400
Wire Wire Line
	7200 3400 7200 3600
Wire Wire Line
	7200 3600 7100 3600
Text HLabel 7200 3500 2    50   Input ~ 0
OUT
$EndSCHEMATC
