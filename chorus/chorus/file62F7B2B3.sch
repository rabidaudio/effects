EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
L MCU_Microchip_ATtiny:ATtiny85-20PU U?
U 1 1 62F9D27C
P 1750 3600
AR Path="/62F9D27C" Ref="U?"  Part="1" 
AR Path="/62F7B2B4/62F9D27C" Ref="U3"  Part="1" 
F 0 "U3" H 1221 3646 50  0000 R CNN
F 1 "ATTINY85" H 1221 3555 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 1750 3600 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 1750 3600 50  0001 C CNN
	1    1750 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62F9D282
P 1750 4300
AR Path="/62F9D282" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D282" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 1750 4050 50  0001 C CNN
F 1 "GND" H 1755 4127 50  0000 C CNN
F 2 "" H 1750 4300 50  0001 C CNN
F 3 "" H 1750 4300 50  0001 C CNN
	1    1750 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4300 1750 4200
$Comp
L Device:R_POT R_DEPTH?
U 1 1 62F9D296
P 3100 4200
AR Path="/62F9D296" Ref="R_DEPTH?"  Part="1" 
AR Path="/62F7B2B4/62F9D296" Ref="R_DEPTH1"  Part="1" 
F 0 "R_DEPTH1" V 2893 4200 50  0000 C CNN
F 1 "100K" V 2984 4200 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09K_Single_Vertical" H 3100 4200 50  0001 C CNN
F 3 "~" H 3100 4200 50  0001 C CNN
	1    3100 4200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62F9D29C
P 3100 4450
AR Path="/62F9D29C" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D29C" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 3100 4200 50  0001 C CNN
F 1 "GND" H 3105 4277 50  0000 C CNN
F 2 "" H 3100 4450 50  0001 C CNN
F 3 "" H 3100 4450 50  0001 C CNN
	1    3100 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4450 3100 4350
Wire Wire Line
	1750 2850 1750 3000
Wire Wire Line
	3100 3950 3100 4050
$Comp
L Connector:AVR-ISP-6 J?
U 1 1 62F9D2A6
P 1650 6100
AR Path="/62F9D2A6" Ref="J?"  Part="1" 
AR Path="/62F7B2B4/62F9D2A6" Ref="J2"  Part="1" 
F 0 "J2" H 1321 6196 50  0000 R CNN
F 1 "ISP" H 1321 6105 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" V 1400 6150 50  0001 C CNN
F 3 " ~" H 375 5550 50  0001 C CNN
	1    1650 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5450 1550 5600
$Comp
L power:GND #PWR?
U 1 1 62F9D2AD
P 1550 6650
AR Path="/62F9D2AD" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D2AD" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 1550 6400 50  0001 C CNN
F 1 "GND" H 1555 6477 50  0000 C CNN
F 2 "" H 1550 6650 50  0001 C CNN
F 3 "" H 1550 6650 50  0001 C CNN
	1    1550 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6650 1550 6500
Text GLabel 2600 3300 2    50   Input ~ 0
MOSI
Text GLabel 2600 3400 2    50   Input ~ 0
MISO
Text GLabel 2600 3500 2    50   Input ~ 0
SCK
Text GLabel 2200 6100 2    50   Input ~ 0
SCK
Text GLabel 2200 5900 2    50   Input ~ 0
MISO
Text GLabel 2200 6000 2    50   Input ~ 0
MOSI
Wire Wire Line
	2200 6000 2050 6000
Wire Wire Line
	2050 5900 2200 5900
Wire Wire Line
	2200 6100 2050 6100
Text GLabel 2200 6200 2    50   Input ~ 0
~RST
Wire Wire Line
	2200 6200 2050 6200
Text GLabel 2600 3800 2    50   Input ~ 0
~RST
Wire Wire Line
	2950 4200 2900 4200
Wire Wire Line
	2900 4200 2900 3700
Text Notes 800  4800 0    50   ~ 0
uC generates a triangle LFO in much less space than analog
$Comp
L power:+5V #PWR?
U 1 1 62F9D2C5
P 1550 5450
AR Path="/62F9D2C5" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D2C5" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 1550 5300 50  0001 C CNN
F 1 "+5V" H 1565 5623 50  0000 C CNN
F 2 "" H 1550 5450 50  0001 C CNN
F 3 "" H 1550 5450 50  0001 C CNN
	1    1550 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62F9D2CB
P 1750 2850
AR Path="/62F9D2CB" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D2CB" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 1750 2700 50  0001 C CNN
F 1 "+5V" H 1765 3023 50  0000 C CNN
F 2 "" H 1750 2850 50  0001 C CNN
F 3 "" H 1750 2850 50  0001 C CNN
	1    1750 2850
	1    0    0    -1  
$EndComp
Text Notes 1100 6600 0    50   ~ 0
ISP pins in case of firmware update
$Comp
L power:+5V #PWR?
U 1 1 62F9D2D2
P 3100 3950
AR Path="/62F9D2D2" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D2D2" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 3100 3800 50  0001 C CNN
F 1 "+5V" H 3115 4123 50  0000 C CNN
F 2 "" H 3100 3950 50  0001 C CNN
F 3 "" H 3100 3950 50  0001 C CNN
	1    3100 3950
	1    0    0    -1  
$EndComp
Text Notes 7850 3700 0    50   ~ 0
Clock input must be at least VDD-1V\nTODO: how to adjust levels?
$Comp
L Amplifier_Operational:LM13700 U?
U 1 1 62F9D2DF
P 5200 3650
AR Path="/62F9D2DF" Ref="U?"  Part="1" 
AR Path="/62F7B2B4/62F9D2DF" Ref="U1"  Part="1" 
F 0 "U1" H 5200 4017 50  0000 C CNN
F 1 "LM13700" H 5200 3926 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 4900 3675 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm13700.pdf" H 4900 3675 50  0001 C CNN
	1    5200 3650
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM13700 U?
U 3 1 62F9D2E5
P 6650 3750
AR Path="/62F9D2E5" Ref="U?"  Part="3" 
AR Path="/62F7B2B4/62F9D2E5" Ref="U1"  Part="3" 
F 0 "U1" H 6650 4117 50  0000 C CNN
F 1 "LM13700" H 6650 4026 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6350 3775 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm13700.pdf" H 6350 3775 50  0001 C CNN
	3    6650 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 62F9D2EB
P 4700 3600
AR Path="/62F9D2EB" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D2EB" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 4700 3350 50  0001 C CNN
F 1 "GNDA" H 4705 3427 50  0000 C CNN
F 2 "" H 4700 3600 50  0001 C CNN
F 3 "" H 4700 3600 50  0001 C CNN
	1    4700 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 62F9D2F1
P 5850 3900
AR Path="/62F9D2F1" Ref="C?"  Part="1" 
AR Path="/62F7B2B4/62F9D2F1" Ref="C3"  Part="1" 
F 0 "C3" H 5965 3946 50  0000 L CNN
F 1 "470p" H 5965 3855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 5888 3750 50  0001 C CNN
F 3 "~" H 5850 3900 50  0001 C CNN
	1    5850 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 62F9D2F7
P 5850 4150
AR Path="/62F9D2F7" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D2F7" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 5850 3900 50  0001 C CNN
F 1 "GNDA" H 5855 3977 50  0000 C CNN
F 2 "" H 5850 4150 50  0001 C CNN
F 3 "" H 5850 4150 50  0001 C CNN
	1    5850 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3650 5850 3650
Wire Wire Line
	5850 3750 5850 3650
Connection ~ 5850 3650
Wire Wire Line
	5850 3650 5500 3650
Wire Wire Line
	5850 4050 5850 4150
Wire Wire Line
	4700 3600 4700 3550
Wire Wire Line
	4700 3550 4900 3550
Wire Wire Line
	4900 3750 4850 3750
Wire Wire Line
	4850 3750 4850 4450
Wire Wire Line
	4850 4450 6350 4450
$Comp
L Device:R R?
U 1 1 62F9D307
P 7150 4250
AR Path="/62F9D307" Ref="R?"  Part="1" 
AR Path="/62F7B2B4/62F9D307" Ref="R11"  Part="1" 
F 0 "R11" H 7220 4296 50  0000 L CNN
F 1 "2.2k" H 7220 4205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7080 4250 50  0001 C CNN
F 3 "~" H 7150 4250 50  0001 C CNN
	1    7150 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 62F9D30D
P 7150 4500
AR Path="/62F9D30D" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D30D" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 7150 4250 50  0001 C CNN
F 1 "GNDA" H 7155 4327 50  0000 C CNN
F 2 "" H 7150 4500 50  0001 C CNN
F 3 "" H 7150 4500 50  0001 C CNN
	1    7150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4400 7150 4500
$Comp
L Amplifier_Operational:LM13700 U?
U 4 1 62F9D314
P 7600 3750
AR Path="/62F9D314" Ref="U?"  Part="4" 
AR Path="/62F7B2B4/62F9D314" Ref="U1"  Part="4" 
F 0 "U1" H 7500 4098 50  0000 C CNN
F 1 "LM13700" H 7500 4007 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 7300 3775 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm13700.pdf" H 7300 3775 50  0001 C CNN
	4    7600 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 62F9D31A
P 7750 4150
AR Path="/62F9D31A" Ref="R?"  Part="1" 
AR Path="/62F7B2B4/62F9D31A" Ref="R12"  Part="1" 
F 0 "R12" H 7820 4196 50  0000 L CNN
F 1 "10k" H 7820 4105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7680 4150 50  0001 C CNN
F 3 "~" H 7750 4150 50  0001 C CNN
	1    7750 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62F9D320
P 7750 4500
AR Path="/62F9D320" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D320" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 7750 4250 50  0001 C CNN
F 1 "GND" H 7755 4327 50  0000 C CNN
F 2 "" H 7750 4500 50  0001 C CNN
F 3 "" H 7750 4500 50  0001 C CNN
	1    7750 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4500 7750 4300
Wire Wire Line
	7750 4000 7750 3850
$Comp
L Device:R R?
U 1 1 62F9D329
P 7050 3250
AR Path="/62F9D329" Ref="R?"  Part="1" 
AR Path="/62F7B2B4/62F9D329" Ref="R10"  Part="1" 
F 0 "R10" H 7120 3296 50  0000 L CNN
F 1 "2.7k" H 7120 3205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6980 3250 50  0001 C CNN
F 3 "~" H 7050 3250 50  0001 C CNN
	1    7050 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3400 7050 3850
Wire Wire Line
	7050 3850 6950 3850
Wire Wire Line
	7050 3000 7050 3100
Wire Wire Line
	6350 3850 6350 4050
Wire Wire Line
	7300 3750 7150 3750
Wire Wire Line
	7150 4100 7150 4050
Connection ~ 7150 3750
Wire Wire Line
	7150 3750 6950 3750
Wire Wire Line
	7150 4050 6350 4050
Connection ~ 7150 4050
Wire Wire Line
	7150 4050 7150 3750
Connection ~ 6350 4050
Wire Wire Line
	6350 4050 6350 4450
$Comp
L Device:R R?
U 1 1 62F9D356
P 5600 3300
AR Path="/62F9D356" Ref="R?"  Part="1" 
AR Path="/62F7B2B4/62F9D356" Ref="R9"  Part="1" 
F 0 "R9" H 5670 3346 50  0000 L CNN
F 1 "2.5k" H 5670 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5530 3300 50  0001 C CNN
F 3 "~" H 5600 3300 50  0001 C CNN
	1    5600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3450 5600 3750
Wire Wire Line
	5600 3750 5500 3750
Text Notes 5950 3100 0    50   ~ 0
square wave VCO\n0V-5V CV\n200KHz-10KHz output
Wire Wire Line
	2350 3500 2600 3500
Wire Wire Line
	2600 3800 2350 3800
Wire Wire Line
	2900 3700 2350 3700
Text HLabel 8250 3850 2    50   Input ~ 0
CLOCK
Wire Wire Line
	7700 3850 7750 3850
Connection ~ 7750 3850
Wire Wire Line
	7750 3850 8250 3850
$Comp
L Device:LED D?
U 1 1 631F8C21
P 3950 3350
AR Path="/631F8C21" Ref="D?"  Part="1" 
AR Path="/62F7B2B4/631F8C21" Ref="D1"  Part="1" 
F 0 "D1" V 3989 3232 50  0000 R CNN
F 1 "LED" V 3898 3232 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 3950 3350 50  0001 C CNN
F 3 "~" H 3950 3350 50  0001 C CNN
	1    3950 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 631F8C27
P 3950 3800
AR Path="/631F8C27" Ref="R?"  Part="1" 
AR Path="/62F7B2B4/631F8C27" Ref="R8"  Part="1" 
F 0 "R8" H 4020 3846 50  0000 L CNN
F 1 "240" H 4020 3755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3880 3800 50  0001 C CNN
F 3 "~" H 3950 3800 50  0001 C CNN
	1    3950 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3650 3950 3500
Text Notes 3300 6350 0    50   ~ 0
LFO indicator (optional)
$Comp
L power:+5V #PWR?
U 1 1 628463C1
P 7050 3000
AR Path="/628463C1" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/628463C1" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 7050 2850 50  0001 C CNN
F 1 "+5V" H 7065 3173 50  0000 C CNN
F 2 "" H 7050 3000 50  0001 C CNN
F 3 "" H 7050 3000 50  0001 C CNN
	1    7050 3000
	1    0    0    -1  
$EndComp
Text Notes 7000 2600 0    50   ~ 0
By using 5V as the max for both IABC,\nthe circuit can safely operate at higher VCCs\nwith a consistent current and\nwithout risking overloading the LM13700
Text Notes 4250 3550 3    50   ~ 0
LFO indicator (optional)
Wire Wire Line
	4450 3300 4450 3200
Wire Wire Line
	4450 2900 4450 2850
Wire Wire Line
	4350 2850 4450 2850
$Comp
L power:GND #PWR?
U 1 1 62F9D34E
P 4450 3300
AR Path="/62F9D34E" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D34E" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 4450 3050 50  0001 C CNN
F 1 "GND" H 4455 3127 50  0000 C CNN
F 2 "" H 4450 3300 50  0001 C CNN
F 3 "" H 4450 3300 50  0001 C CNN
	1    4450 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 62F9D348
P 4200 2850
AR Path="/62F9D348" Ref="R?"  Part="1" 
AR Path="/62F7B2B4/62F9D348" Ref="R5"  Part="1" 
F 0 "R5" V 3993 2850 50  0000 C CNN
F 1 "100" V 4084 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4130 2850 50  0001 C CNN
F 3 "~" H 4200 2850 50  0001 C CNN
	1    4200 2850
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 62F9D342
P 4450 3050
AR Path="/62F9D342" Ref="C?"  Part="1" 
AR Path="/62F7B2B4/62F9D342" Ref="C2"  Part="1" 
F 0 "C2" H 4335 3004 50  0000 R CNN
F 1 "220u" H 4335 3095 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 4488 2900 50  0001 C CNN
F 3 "~" H 4450 3050 50  0001 C CNN
	1    4450 3050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT R_RATE?
U 1 1 62F9D289
P 3650 4200
AR Path="/62F9D289" Ref="R_RATE?"  Part="1" 
AR Path="/62F7B2B4/62F9D289" Ref="R_RATE1"  Part="1" 
F 0 "R_RATE1" V 3443 4200 50  0000 C CNN
F 1 "100K" V 3534 4200 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09K_Single_Vertical" H 3650 4200 50  0001 C CNN
F 3 "~" H 3650 4200 50  0001 C CNN
	1    3650 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 3950 3650 4050
Wire Wire Line
	3650 4450 3650 4350
$Comp
L power:GND #PWR?
U 1 1 62F9D28F
P 3650 4450
AR Path="/62F9D28F" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D28F" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 3650 4200 50  0001 C CNN
F 1 "GND" H 3655 4277 50  0000 C CNN
F 2 "" H 3650 4450 50  0001 C CNN
F 3 "" H 3650 4450 50  0001 C CNN
	1    3650 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62F9D2D8
P 3650 3950
AR Path="/62F9D2D8" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/62F9D2D8" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 3650 3800 50  0001 C CNN
F 1 "+5V" H 3665 4123 50  0000 C CNN
F 2 "" H 3650 3950 50  0001 C CNN
F 3 "" H 3650 3950 50  0001 C CNN
	1    3650 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3600 2350 3600
Wire Wire Line
	3500 4200 3450 4200
Wire Wire Line
	3450 4200 3450 3600
Wire Wire Line
	2350 3300 2450 3300
Wire Wire Line
	2600 3400 2350 3400
Connection ~ 2450 3300
Wire Wire Line
	2450 3300 2600 3300
Wire Wire Line
	4450 2850 5600 2850
Wire Wire Line
	5600 2850 5600 3150
Connection ~ 4450 2850
Wire Wire Line
	4050 2850 3950 2850
Wire Wire Line
	2450 2850 2450 3300
Wire Wire Line
	3950 2850 3950 3200
Connection ~ 3950 2850
Wire Wire Line
	3950 2850 2450 2850
$Comp
L power:GND #PWR?
U 1 1 6289B125
P 3950 4050
AR Path="/6289B125" Ref="#PWR?"  Part="1" 
AR Path="/62F7B2B4/6289B125" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 3950 3800 50  0001 C CNN
F 1 "GND" H 3955 3877 50  0000 C CNN
F 2 "" H 3950 4050 50  0001 C CNN
F 3 "" H 3950 4050 50  0001 C CNN
	1    3950 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4050 3950 3950
Text Notes 3900 2600 0    50   ~ 0
LPF to filter PWM to smooth triangle wave\nR needs to be aggressively low to avoid voltage\ndivider with current limiter
$EndSCHEMATC
