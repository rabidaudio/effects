EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Amplifier_Operational:TL074 U1
U 1 1 62D478AE
P 4400 3000
F 0 "U1" H 4400 2633 50  0000 C CNN
F 1 "TL074" H 4400 2724 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4350 3100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 4450 3200 50  0001 C CNN
	1    4400 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 62D4C254
P 2950 2900
F 0 "C1" V 2698 2900 50  0000 C CNN
F 1 "220n" V 2789 2900 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2988 2750 50  0001 C CNN
F 3 "~" H 2950 2900 50  0001 C CNN
	1    2950 2900
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 62D4CBED
P 3450 2900
F 0 "C2" V 3198 2900 50  0000 C CNN
F 1 "220n" V 3289 2900 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3488 2750 50  0001 C CNN
F 3 "~" H 3450 2900 50  0001 C CNN
	1    3450 2900
	0    1    1    0   
$EndComp
Text Notes 1750 4650 0    50   ~ 0
220n, 1K -> 7.2z, Q=0.5\n220n, 1001K -> 7.2KHz, Q=0.5\nNote: subtracting instead of creating separate LP and HP filters\ncreates an uneven split. However they will still sum to be even.\nCreating a true crossover would require VCOs, which would be\nexpensive.
$Comp
L Amplifier_Operational:TL074 U1
U 2 1 62D4D1DF
P 2300 2900
F 0 "U1" H 2300 3267 50  0000 C CNN
F 1 "TL074" H 2300 3176 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2250 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 2350 3100 50  0001 C CNN
	2    2300 2900
	1    0    0    1   
$EndComp
Wire Wire Line
	4100 3100 4000 3100
Wire Wire Line
	4000 3100 4000 3500
Wire Wire Line
	4000 3500 4750 3500
Wire Wire Line
	4750 3500 4750 3000
Wire Wire Line
	4750 3000 4700 3000
$Comp
L Device:R R2
U 1 1 62D50C4D
P 3800 3300
F 0 "R2" H 3730 3254 50  0000 R CNN
F 1 "1K" H 3730 3345 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3730 3300 50  0001 C CNN
F 3 "~" H 3800 3300 50  0001 C CNN
	1    3800 3300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 62D513D0
P 3400 2300
F 0 "R1" V 3193 2300 50  0000 C CNN
F 1 "1K" V 3284 2300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3330 2300 50  0001 C CNN
F 3 "~" H 3400 2300 50  0001 C CNN
	1    3400 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT_Dual_Separate RV1
U 2 1 62D5561C
P 3850 2300
F 0 "RV1" V 3735 2300 50  0000 C CNN
F 1 "A1M_DUAL_CUTOFF" V 3644 2300 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alpha_RD902F-40-00D_Dual_Vertical" H 3850 2300 50  0001 C CNN
F 3 "~" H 3850 2300 50  0001 C CNN
	2    3850 2300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_POT_Dual_Separate RV1
U 1 1 62D56A6B
P 3800 3700
F 0 "RV1" H 3730 3654 50  0000 R CNN
F 1 "A1M_DUAL_CUTOFF" H 3730 3745 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alpha_RD902F-40-00D_Dual_Vertical" H 3800 3700 50  0001 C CNN
F 3 "~" H 3800 3700 50  0001 C CNN
	1    3800 3700
	-1   0    0    -1  
$EndComp
Text Notes 6200 4150 0    50   ~ 0
TODO check pot orientation
$Comp
L power:GND #PWR02
U 1 1 62D57F04
P 3800 4000
F 0 "#PWR02" H 3800 3750 50  0001 C CNN
F 1 "GND" H 3805 3827 50  0000 C CNN
F 2 "" H 3800 4000 50  0001 C CNN
F 3 "" H 3800 4000 50  0001 C CNN
	1    3800 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3000 4750 2600
Connection ~ 4750 3000
Wire Wire Line
	3700 2300 3600 2300
Wire Wire Line
	3850 2150 3850 2050
Wire Wire Line
	3850 2050 3600 2050
Wire Wire Line
	3600 2050 3600 2300
Connection ~ 3600 2300
Wire Wire Line
	3600 2300 3550 2300
Wire Wire Line
	3100 2900 3200 2900
Wire Wire Line
	3600 2900 3800 2900
Wire Wire Line
	3800 3150 3800 2900
Connection ~ 3800 2900
Wire Wire Line
	3800 2900 4100 2900
Wire Wire Line
	3800 3450 3800 3500
Wire Wire Line
	3800 3500 3600 3500
Wire Wire Line
	3600 3500 3600 3700
Wire Wire Line
	3600 3700 3650 3700
Connection ~ 3800 3500
Wire Wire Line
	3800 3500 3800 3550
Wire Wire Line
	3800 3850 3800 4000
Wire Wire Line
	4000 2300 4750 2300
Wire Wire Line
	3250 2300 3200 2300
Wire Wire Line
	3200 2300 3200 2900
Connection ~ 3200 2900
Wire Wire Line
	3200 2900 3300 2900
Wire Wire Line
	2800 2900 2700 2900
Wire Wire Line
	2700 2900 2700 2600
Wire Wire Line
	2700 2600 1950 2600
Wire Wire Line
	1950 2600 1950 2800
Wire Wire Line
	1950 2800 2000 2800
Connection ~ 2700 2900
Wire Wire Line
	2700 2900 2600 2900
$Comp
L Amplifier_Operational:TL074 U1
U 3 1 62D6659B
P 5850 3100
F 0 "U1" H 5850 2733 50  0000 C CNN
F 1 "TL074" H 5850 2824 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5800 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5900 3300 50  0001 C CNN
	3    5850 3100
	1    0    0    1   
$EndComp
Text Label 1650 3000 2    50   ~ 0
IN
$Comp
L Device:R R4
U 1 1 62D6AED9
P 5150 3200
F 0 "R4" V 5350 3200 50  0000 C CNN
F 1 "1M" V 5250 3200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5080 3200 50  0001 C CNN
F 3 "~" H 5150 3200 50  0001 C CNN
	1    5150 3200
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 62D6BBBA
P 5400 3450
F 0 "R5" H 5330 3404 50  0000 R CNN
F 1 "1M" H 5330 3495 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5330 3450 50  0001 C CNN
F 3 "~" H 5400 3450 50  0001 C CNN
	1    5400 3450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 62D6C442
P 5150 3000
F 0 "R3" V 4943 3000 50  0000 C CNN
F 1 "1M" V 5034 3000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5080 3000 50  0001 C CNN
F 3 "~" H 5150 3000 50  0001 C CNN
	1    5150 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 62D6E4E1
P 5850 2600
F 0 "R6" V 5643 2600 50  0000 C CNN
F 1 "1M" V 5734 2600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5780 2600 50  0001 C CNN
F 3 "~" H 5850 2600 50  0001 C CNN
	1    5850 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 3000 5400 3000
Wire Wire Line
	5400 3300 5400 3200
Wire Wire Line
	5400 3200 5300 3200
Wire Wire Line
	5400 3200 5550 3200
Connection ~ 5400 3200
Wire Wire Line
	5000 3000 4750 3000
Wire Wire Line
	1650 3000 2000 3000
Text Label 4900 3200 2    50   ~ 0
IN
Wire Wire Line
	4900 3200 5000 3200
$Comp
L power:GND #PWR04
U 1 1 62D7280A
P 5400 3800
F 0 "#PWR04" H 5400 3550 50  0001 C CNN
F 1 "GND" H 5405 3627 50  0000 C CNN
F 2 "" H 5400 3800 50  0001 C CNN
F 3 "" H 5400 3800 50  0001 C CNN
	1    5400 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3800 5400 3600
Wire Wire Line
	5700 2600 5400 2600
Wire Wire Line
	5400 2600 5400 3000
Connection ~ 5400 3000
Wire Wire Line
	5400 3000 5300 3000
Wire Wire Line
	6000 2600 6250 2600
Wire Wire Line
	6250 2600 6250 2900
Wire Wire Line
	6250 3100 6150 3100
Text Label 4850 2600 0    50   ~ 0
HIGH
Wire Wire Line
	4850 2600 4750 2600
Connection ~ 4750 2600
Wire Wire Line
	4750 2600 4750 2300
Text Label 6400 2900 0    50   ~ 0
LOW
Wire Wire Line
	6400 2900 6250 2900
Connection ~ 6250 2900
Wire Wire Line
	6250 2900 6250 3100
$Comp
L Amplifier_Operational:TL074 U1
U 5 1 62D7681C
P 10450 1200
F 0 "U1" H 10408 1246 50  0000 L CNN
F 1 "TL074" H 10408 1155 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10400 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 10500 1400 50  0001 C CNN
	5    10450 1200
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL074 U1
U 4 1 62D7837B
P 9950 3650
F 0 "U1" H 9950 3283 50  0000 C CNN
F 1 "TL074" H 9950 3374 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9900 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 10000 3850 50  0001 C CNN
	4    9950 3650
	1    0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 62D7B481
P 9250 3550
F 0 "R8" V 9457 3550 50  0000 C CNN
F 1 "1M" V 9366 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9180 3550 50  0001 C CNN
F 3 "~" H 9250 3550 50  0001 C CNN
	1    9250 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 62D7C138
P 9250 3100
F 0 "R7" V 9457 3100 50  0000 C CNN
F 1 "1M" V 9366 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9180 3100 50  0001 C CNN
F 3 "~" H 9250 3100 50  0001 C CNN
	1    9250 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9400 3550 9550 3550
Connection ~ 9550 3550
Wire Wire Line
	9550 3550 9650 3550
$Comp
L Device:R_POT_Dual_Separate RV2
U 2 1 62D7EC04
P 8850 3550
F 0 "RV2" H 8780 3504 50  0000 R CNN
F 1 "A1M_DUAL_MIX" H 8780 3595 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alpha_RD902F-40-00D_Dual_Vertical" H 8850 3550 50  0001 C CNN
F 3 "~" H 8850 3550 50  0001 C CNN
	2    8850 3550
	1    0    0    1   
$EndComp
$Comp
L Device:R_POT_Dual_Separate RV2
U 1 1 62D7FACD
P 8850 3100
F 0 "RV2" H 8700 3050 50  0000 C CNN
F 1 "A1M_DUAL_MIX" H 8600 3150 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alpha_RD902F-40-00D_Dual_Vertical" H 8850 3100 50  0001 C CNN
F 3 "~" H 8850 3100 50  0001 C CNN
	1    8850 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 3100 9550 3100
Wire Wire Line
	9550 3100 9550 3350
Wire Wire Line
	9100 3550 9000 3550
Wire Wire Line
	9100 3100 9000 3100
$Comp
L power:GND #PWR07
U 1 1 62D865EB
P 8400 3350
F 0 "#PWR07" H 8400 3100 50  0001 C CNN
F 1 "GND" H 8405 3177 50  0000 C CNN
F 2 "" H 8400 3350 50  0001 C CNN
F 3 "" H 8400 3350 50  0001 C CNN
	1    8400 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3400 8850 3300
Wire Wire Line
	8400 3350 8400 3300
Wire Wire Line
	8400 3300 8850 3300
Connection ~ 8850 3300
Wire Wire Line
	8850 3300 8850 3250
$Comp
L power:GND #PWR010
U 1 1 62D897BA
P 9550 3900
F 0 "#PWR010" H 9550 3650 50  0001 C CNN
F 1 "GND" H 9555 3727 50  0000 C CNN
F 2 "" H 9550 3900 50  0001 C CNN
F 3 "" H 9550 3900 50  0001 C CNN
	1    9550 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3900 9550 3750
Wire Wire Line
	9550 3750 9650 3750
Wire Wire Line
	9550 3350 10300 3350
Wire Wire Line
	10300 3350 10300 3650
Wire Wire Line
	10300 3650 10250 3650
Connection ~ 9550 3350
Wire Wire Line
	9550 3350 9550 3550
$Comp
L Switch:SW_3PDT_x3 SW2
U 1 1 62D8D5D7
P 8000 1050
F 0 "SW2" H 8000 1335 50  0000 C CNN
F 1 "SW_POWER" H 8000 1244 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_3x03_P2.54mm_Vertical" H 8000 1050 50  0001 C CNN
F 3 "~" H 8000 1050 50  0001 C CNN
	1    8000 1050
	1    0    0    -1  
$EndComp
$Comp
L Reference_Voltage:TLE2426xLP U2
U 1 1 62D8EF13
P 9400 950
F 0 "U2" H 9400 1317 50  0000 C CNN
F 1 "TLE2426xLP" H 9400 1226 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9400 550 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tle2426.pdf" H 8000 1800 50  0001 C CIN
	1    9400 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 62D93038
P 9900 1050
F 0 "#PWR011" H 9900 800 50  0001 C CNN
F 1 "GND" H 9905 877 50  0000 C CNN
F 2 "" H 9900 1050 50  0001 C CNN
F 3 "" H 9900 1050 50  0001 C CNN
	1    9900 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 950  8850 950 
Wire Wire Line
	8850 950  8850 850 
Wire Wire Line
	9900 1050 9900 950 
Wire Wire Line
	9900 950  9800 950 
Wire Wire Line
	9400 1250 9400 1350
Wire Wire Line
	10350 1650 10350 1500
Wire Wire Line
	10350 800  10350 900 
Wire Wire Line
	7600 1050 7800 1050
Wire Wire Line
	8350 850  8350 950 
Wire Wire Line
	8350 950  8200 950 
Wire Wire Line
	7750 1300 7750 1250
Wire Wire Line
	7750 1250 7600 1250
Text Label 8650 3900 2    50   ~ 0
DRY_SIG
Text Label 8650 2800 2    50   ~ 0
RECV_T
Wire Wire Line
	8650 2800 8850 2800
Wire Wire Line
	8850 2800 8850 2950
Wire Wire Line
	8650 3900 8850 3900
Wire Wire Line
	8850 3900 8850 3700
Text Label 10400 3650 0    50   ~ 0
OUT
Wire Wire Line
	10400 3650 10300 3650
Connection ~ 10300 3650
Text Label 9000 5550 2    50   ~ 0
OUT
$Comp
L power:GND #PWR01
U 1 1 62DE637C
P 1450 6500
F 0 "#PWR01" H 1450 6250 50  0001 C CNN
F 1 "GND" H 1455 6327 50  0000 C CNN
F 2 "" H 1450 6500 50  0001 C CNN
F 3 "" H 1450 6500 50  0001 C CNN
	1    1450 6500
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack3_Switch J1
U 1 1 62DE7A7E
P 1150 6100
F 0 "J1" H 1132 6525 50  0000 C CNN
F 1 "JACKIN" H 1132 6434 50  0000 C CNN
F 2 "Connector_Audio:Jack_6.35mm_Neutrik_NMJ6HCD2_Horizontal" H 1150 6100 50  0001 C CNN
F 3 "~" H 1150 6100 50  0001 C CNN
	1    1150 6100
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack3_Switch J4
U 1 1 62DED55B
P 10450 5450
F 0 "J4" H 10500 5850 50  0000 R CNN
F 1 "JACKOUT" H 10550 5750 50  0000 R CNN
F 2 "Connector_Audio:Jack_6.35mm_Neutrik_NMJ6HCD2_Horizontal" H 10450 5450 50  0001 C CNN
F 3 "~" H 10450 5450 50  0001 C CNN
	1    10450 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1450 6500 1450 6400
Wire Wire Line
	1450 5900 1350 5900
Wire Wire Line
	1350 6000 1450 6000
Connection ~ 1450 6000
Wire Wire Line
	1450 6000 1450 5900
Wire Wire Line
	1350 6400 1450 6400
Connection ~ 1450 6400
Wire Wire Line
	1450 6400 1450 6200
Wire Wire Line
	1350 6200 1450 6200
Connection ~ 1450 6200
Wire Wire Line
	1450 6200 1450 6000
Text Label 2500 6200 0    50   ~ 0
IN
$Comp
L power:GND #PWR012
U 1 1 62E19717
P 10150 5850
F 0 "#PWR012" H 10150 5600 50  0001 C CNN
F 1 "GND" H 10155 5677 50  0000 C CNN
F 2 "" H 10150 5850 50  0001 C CNN
F 3 "" H 10150 5850 50  0001 C CNN
	1    10150 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5850 10150 5750
Wire Wire Line
	10150 5750 10250 5750
Wire Wire Line
	10250 5550 10150 5550
Wire Wire Line
	10150 5550 10150 5750
Connection ~ 10150 5750
Wire Wire Line
	10250 5250 10150 5250
Wire Wire Line
	10150 5250 10150 5350
Connection ~ 10150 5550
Wire Wire Line
	10250 5350 10150 5350
Connection ~ 10150 5350
Wire Wire Line
	10150 5350 10150 5550
$Comp
L Connector:AudioJack3_Switch J3
U 1 1 62E418CB
P 5900 6500
F 0 "J3" H 5882 6925 50  0000 C CNN
F 1 "JACKRCV" H 5882 6834 50  0000 C CNN
F 2 "Connector_Audio:Jack_6.35mm_Neutrik_NMJ6HCD2_Horizontal" H 5900 6500 50  0001 C CNN
F 3 "~" H 5900 6500 50  0001 C CNN
	1    5900 6500
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack3_Switch J2
U 1 1 62E46CBE
P 5000 6500
F 0 "J2" H 5050 6900 50  0000 R CNN
F 1 "JACKSEND" H 5100 6800 50  0000 R CNN
F 2 "Connector_Audio:Jack_6.35mm_Neutrik_NMJ6HCD2_Horizontal" H 5000 6500 50  0001 C CNN
F 3 "~" H 5000 6500 50  0001 C CNN
	1    5000 6500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1650 6100 1350 6100
Text Notes 4000 5950 0    50   ~ 0
ON: split low+high, send [select] out, (skip straight to rcv if disconnected), rcv in, sum -> out\nOFF: power off, send all to send, (skip straight to rcv if disconnected), rcv -> out
$Comp
L Switch:SW_3PDT_x3 SW2
U 3 1 62DC233B
P 2150 6300
F 0 "SW2" H 2150 6585 50  0000 C CNN
F 1 "SW_POWER" H 2150 6494 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_3x03_P2.54mm_Vertical" H 2150 6300 50  0001 C CNN
F 3 "~" H 2150 6300 50  0001 C CNN
	3    2150 6300
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_3PDT_x3 SW2
U 2 1 62DBDE03
P 9500 5650
F 0 "SW2" H 9500 5935 50  0000 C CNN
F 1 "SW_POWER" H 9500 5844 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_3x03_P2.54mm_Vertical" H 9500 5650 50  0001 C CNN
F 3 "~" H 9500 5650 50  0001 C CNN
	2    9500 5650
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_DPDT_x2 SW1
U 1 1 62E6E7E9
P 5550 4750
F 0 "SW1" H 5500 4600 50  0000 C CNN
F 1 "SW_HIGHLOW" H 5550 4500 50  0000 C CNN
F 2 "Button_Switch_THT:MTS-200_DPDT_6T" H 5550 4750 50  0001 C CNN
F 3 "~" H 5550 4750 50  0001 C CNN
	1    5550 4750
	-1   0    0    -1  
$EndComp
Text Label 5100 4850 2    50   ~ 0
LOW
Text Label 5100 4650 2    50   ~ 0
HIGH
Wire Wire Line
	5100 4650 5350 4650
Wire Wire Line
	5100 4850 5350 4850
$Comp
L power:GND #PWR03
U 1 1 62EB6464
P 4700 6900
F 0 "#PWR03" H 4700 6650 50  0001 C CNN
F 1 "GND" H 4705 6727 50  0000 C CNN
F 2 "" H 4700 6900 50  0001 C CNN
F 3 "" H 4700 6900 50  0001 C CNN
	1    4700 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 6300 4800 6300
Wire Wire Line
	4800 6400 4700 6400
Connection ~ 4700 6400
Wire Wire Line
	4700 6400 4700 6300
Wire Wire Line
	4700 6400 4700 6900
$Comp
L power:GND #PWR05
U 1 1 62ED43EC
P 6200 6900
F 0 "#PWR05" H 6200 6650 50  0001 C CNN
F 1 "GND" H 6205 6727 50  0000 C CNN
F 2 "" H 6200 6900 50  0001 C CNN
F 3 "" H 6200 6900 50  0001 C CNN
	1    6200 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 6300 6100 6300
Wire Wire Line
	6100 6400 6200 6400
Connection ~ 6200 6400
Wire Wire Line
	6200 6400 6200 6300
Wire Wire Line
	6200 6400 6200 6900
Text Label 4550 6700 2    50   ~ 0
SEND_T
Text Label 4550 6500 2    50   ~ 0
SEND_R
Text Label 6350 6600 0    50   ~ 0
SEND_R
Wire Wire Line
	6350 6600 6100 6600
Text Label 6350 6800 0    50   ~ 0
SEND_T
Wire Wire Line
	6350 6800 6100 6800
Wire Wire Line
	4800 6700 4550 6700
Wire Wire Line
	4550 6500 4800 6500
Text Label 6350 6500 0    50   ~ 0
RECV_R
Text Label 6350 6700 0    50   ~ 0
RECV_T
Wire Wire Line
	6350 6700 6100 6700
Wire Wire Line
	6350 6500 6100 6500
NoConn ~ 4800 6800
NoConn ~ 4800 6600
Text Label 1650 6100 0    50   ~ 0
SEND_R
Text Label 10000 5450 2    50   ~ 0
RECV_R
Wire Wire Line
	10000 5450 10250 5450
Text Label 5950 4750 0    50   ~ 0
SEND_T
$Comp
L Switch:SW_DPDT_x2 SW1
U 2 1 62E6FFB3
P 5550 5400
F 0 "SW1" H 5550 5685 50  0000 C CNN
F 1 "SW_HIGHLOW" H 5550 5594 50  0000 C CNN
F 2 "Button_Switch_THT:MTS-200_DPDT_6T" H 5550 5400 50  0001 C CNN
F 3 "~" H 5550 5400 50  0001 C CNN
	2    5550 5400
	-1   0    0    -1  
$EndComp
Text Label 5950 5400 0    50   ~ 0
DRY_SIG
Text Label 5100 5500 2    50   ~ 0
HIGH
Text Label 5100 5300 2    50   ~ 0
LOW
Wire Wire Line
	5100 5300 5350 5300
Wire Wire Line
	5100 5500 5350 5500
Wire Wire Line
	5950 4750 5750 4750
Wire Wire Line
	5950 5400 5750 5400
Wire Wire Line
	2500 6200 2350 6200
Wire Wire Line
	1350 6300 1950 6300
Text Label 2500 6400 0    50   ~ 0
SEND_T
Wire Wire Line
	2500 6400 2350 6400
Wire Wire Line
	9700 5650 10250 5650
Wire Wire Line
	9000 5550 9300 5550
Text Notes 1700 3600 0    50   ~ 0
2M input impedance\nop-amp output impedance (20mA @ 0.5V?)
Text Label 9000 5750 2    50   ~ 0
RECV_T
Wire Wire Line
	9000 5750 9300 5750
Text Notes 9000 1800 0    50   ~ 0
Ground case to GNDD
$Comp
L Device:C C3
U 1 1 630A3EFF
P 10900 1000
F 0 "C3" H 11015 1046 50  0000 L CNN
F 1 "10u" H 11015 955 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10938 850 50  0001 C CNN
F 3 "~" H 10900 1000 50  0001 C CNN
	1    10900 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 630A4536
P 10900 1450
F 0 "C4" H 11015 1496 50  0000 L CNN
F 1 "10u" H 11015 1405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10938 1300 50  0001 C CNN
F 3 "~" H 10900 1450 50  0001 C CNN
	1    10900 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 630A49E8
P 10700 1250
F 0 "#PWR018" H 10700 1000 50  0001 C CNN
F 1 "GND" H 10705 1077 50  0000 C CNN
F 2 "" H 10700 1250 50  0001 C CNN
F 3 "" H 10700 1250 50  0001 C CNN
	1    10700 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 850  10900 750 
Wire Wire Line
	10900 1700 10900 1600
Wire Wire Line
	10900 1150 10900 1200
Wire Wire Line
	10700 1250 10700 1200
Wire Wire Line
	10700 1200 10900 1200
Connection ~ 10900 1200
Wire Wire Line
	10900 1200 10900 1300
Text Notes 8350 4350 0    50   ~ 0
input impedance: 500K to 1M\nop-amp output impedance (20mA @ 0.5V?)
$Comp
L Device:LED D1
U 1 1 630C8C10
P 8550 1200
F 0 "D1" V 8589 1082 50  0000 R CNN
F 1 "LED" V 8498 1082 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 8550 1200 50  0001 C CNN
F 3 "~" H 8550 1200 50  0001 C CNN
	1    8550 1200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 630C9EA9
P 8550 1600
F 0 "R9" H 8620 1646 50  0000 L CNN
F 1 "220" H 8620 1555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8480 1600 50  0001 C CNN
F 3 "~" H 8550 1600 50  0001 C CNN
	1    8550 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 1850 8550 1750
Wire Wire Line
	8550 1450 8550 1350
Text Notes 10050 2050 0    50   ~ 0
power filter caps, close to IC
Text Notes 8450 2150 0    50   ~ 0
power led
Text Notes 6950 1750 0    50   ~ 0
9V ac/dc center negative\ncould also be 9V battery
NoConn ~ 8200 1150
$Comp
L power:+9V #PWR0101
U 1 1 6313967E
P 8350 850
F 0 "#PWR0101" H 8350 700 50  0001 C CNN
F 1 "+9V" H 8365 1023 50  0000 C CNN
F 2 "" H 8350 850 50  0001 C CNN
F 3 "" H 8350 850 50  0001 C CNN
	1    8350 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0102
U 1 1 6313A0AA
P 8550 850
F 0 "#PWR0102" H 8550 700 50  0001 C CNN
F 1 "+9V" H 8565 1023 50  0000 C CNN
F 2 "" H 8550 850 50  0001 C CNN
F 3 "" H 8550 850 50  0001 C CNN
	1    8550 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 850  8550 1050
$Comp
L power:+9V #PWR0103
U 1 1 6314E6F6
P 8850 850
F 0 "#PWR0103" H 8850 700 50  0001 C CNN
F 1 "+9V" H 8865 1023 50  0000 C CNN
F 2 "" H 8850 850 50  0001 C CNN
F 3 "" H 8850 850 50  0001 C CNN
	1    8850 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0104
U 1 1 6314E933
P 10350 800
F 0 "#PWR0104" H 10350 650 50  0001 C CNN
F 1 "+9V" H 10365 973 50  0000 C CNN
F 2 "" H 10350 800 50  0001 C CNN
F 3 "" H 10350 800 50  0001 C CNN
	1    10350 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0105
U 1 1 6314EF4B
P 10900 750
F 0 "#PWR0105" H 10900 600 50  0001 C CNN
F 1 "+9V" H 10915 923 50  0000 C CNN
F 2 "" H 10900 750 50  0001 C CNN
F 3 "" H 10900 750 50  0001 C CNN
	1    10900 750 
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0106
U 1 1 631526A9
P 7750 1300
F 0 "#PWR0106" H 7750 1050 50  0001 C CNN
F 1 "GNDD" H 7754 1145 50  0000 C CNN
F 2 "" H 7750 1300 50  0001 C CNN
F 3 "" H 7750 1300 50  0001 C CNN
	1    7750 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0107
U 1 1 6316CA60
P 8550 1850
F 0 "#PWR0107" H 8550 1600 50  0001 C CNN
F 1 "GNDD" H 8554 1695 50  0000 C CNN
F 2 "" H 8550 1850 50  0001 C CNN
F 3 "" H 8550 1850 50  0001 C CNN
	1    8550 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0108
U 1 1 6316CE55
P 9400 1350
F 0 "#PWR0108" H 9400 1100 50  0001 C CNN
F 1 "GNDD" H 9404 1195 50  0000 C CNN
F 2 "" H 9400 1350 50  0001 C CNN
F 3 "" H 9400 1350 50  0001 C CNN
	1    9400 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0109
U 1 1 6316D38A
P 10350 1650
F 0 "#PWR0109" H 10350 1400 50  0001 C CNN
F 1 "GNDD" H 10354 1495 50  0000 C CNN
F 2 "" H 10350 1650 50  0001 C CNN
F 3 "" H 10350 1650 50  0001 C CNN
	1    10350 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0110
U 1 1 6316D70D
P 10900 1700
F 0 "#PWR0110" H 10900 1450 50  0001 C CNN
F 1 "GNDD" H 10904 1545 50  0000 C CNN
F 2 "" H 10900 1700 50  0001 C CNN
F 3 "" H 10900 1700 50  0001 C CNN
	1    10900 1700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Jack-DC J5
U 1 1 6316EAAE
P 7300 1150
F 0 "J5" H 7357 1475 50  0000 C CNN
F 1 "Jack-DC" H 7357 1384 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 7350 1110 50  0001 C CNN
F 3 "~" H 7350 1110 50  0001 C CNN
	1    7300 1150
	1    0    0    -1  
$EndComp
$EndSCHEMATC