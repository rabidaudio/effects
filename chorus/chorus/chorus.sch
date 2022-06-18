EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
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
L Amplifier_Operational:TL074 U2
U 1 1 6245B212
P 3100 4550
F 0 "U2" H 3100 4183 50  0000 C CNN
F 1 "TL074" H 3100 4274 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3050 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 3150 4750 50  0001 C CNN
	1    3100 4550
	1    0    0    1   
$EndComp
$Comp
L Device:R_POT R_FLANGE1
U 1 1 624703E2
P 2350 4000
F 0 "R_FLANGE1" V 2143 4000 50  0000 C CNN
F 1 "1M" V 2234 4000 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09K_Single_Vertical" H 2350 4000 50  0001 C CNN
F 3 "~" H 2350 4000 50  0001 C CNN
	1    2350 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 4750 2700 4650
Wire Wire Line
	2700 4650 2800 4650
Wire Wire Line
	2800 4450 2750 4450
Wire Wire Line
	2750 4000 2750 4450
Connection ~ 2750 4450
Wire Wire Line
	2750 4450 2600 4450
$Comp
L Device:R R2
U 1 1 6247825B
P 3100 4000
F 0 "R2" V 2893 4000 50  0000 C CNN
F 1 "1M" V 2984 4000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3030 4000 50  0001 C CNN
F 3 "~" H 3100 4000 50  0001 C CNN
	1    3100 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 4000 2750 4000
Wire Wire Line
	3250 4000 3500 4000
Wire Wire Line
	3500 4000 3500 4550
Wire Wire Line
	3500 4550 3400 4550
Wire Wire Line
	2500 4000 2600 4000
Wire Wire Line
	2600 4000 2600 4450
Connection ~ 2600 4450
Wire Wire Line
	2600 4450 2500 4450
$Comp
L Device:R R1
U 1 1 6250F04B
P 2350 4450
F 0 "R1" V 2143 4450 50  0000 C CNN
F 1 "1M" V 2234 4450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2280 4450 50  0001 C CNN
F 3 "~" H 2350 4450 50  0001 C CNN
	1    2350 4450
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 628A293F
P 9550 1150
F 0 "D2" V 9589 1032 50  0000 R CNN
F 1 "LED" V 9498 1032 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 9550 1150 50  0001 C CNN
F 3 "~" H 9550 1150 50  0001 C CNN
	1    9550 1150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R13
U 1 1 628A2949
P 9550 1600
F 0 "R13" H 9620 1646 50  0000 L CNN
F 1 "220" H 9620 1555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 9480 1600 50  0001 C CNN
F 3 "~" H 9550 1600 50  0001 C CNN
	1    9550 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1450 9550 1300
Wire Wire Line
	9550 900  9550 1000
$Comp
L Regulator_Linear:LM7805_TO220 U5
U 1 1 628B410C
P 7350 1400
F 0 "U5" H 7350 1642 50  0000 C CNN
F 1 "LM7805" H 7350 1551 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7350 1625 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 7350 1350 50  0001 C CNN
	1    7350 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 628B7EFB
P 7350 1850
F 0 "#PWR0107" H 7350 1600 50  0001 C CNN
F 1 "GND" H 7355 1677 50  0000 C CNN
F 2 "" H 7350 1850 50  0001 C CNN
F 3 "" H 7350 1850 50  0001 C CNN
	1    7350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1850 7350 1700
$Comp
L power:+9V #PWR0108
U 1 1 628BD57E
P 6900 1300
F 0 "#PWR0108" H 6900 1150 50  0001 C CNN
F 1 "+9V" H 6915 1473 50  0000 C CNN
F 2 "" H 6900 1300 50  0001 C CNN
F 3 "" H 6900 1300 50  0001 C CNN
	1    6900 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1300 6900 1400
Wire Wire Line
	6900 1400 7050 1400
$Comp
L power:+5V #PWR0109
U 1 1 628C37CA
P 7800 1250
F 0 "#PWR0109" H 7800 1100 50  0001 C CNN
F 1 "+5V" H 7815 1423 50  0000 C CNN
F 2 "" H 7800 1250 50  0001 C CNN
F 3 "" H 7800 1250 50  0001 C CNN
	1    7800 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 1250 7800 1400
Wire Wire Line
	7800 1400 7650 1400
$Comp
L power:+5V #PWR0111
U 1 1 628D71CD
P 9550 900
F 0 "#PWR0111" H 9550 750 50  0001 C CNN
F 1 "+5V" H 9565 1073 50  0000 C CNN
F 2 "" H 9550 900 50  0001 C CNN
F 3 "" H 9550 900 50  0001 C CNN
	1    9550 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 628F1961
P 9550 1850
F 0 "#PWR0114" H 9550 1600 50  0001 C CNN
F 1 "GND" H 9555 1677 50  0000 C CNN
F 2 "" H 9550 1850 50  0001 C CNN
F 3 "" H 9550 1850 50  0001 C CNN
	1    9550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1850 9550 1750
Text Notes 9400 2200 0    50   ~ 0
pwr indicator
$Comp
L power:GND #PWR0115
U 1 1 629061AD
P 6000 1650
F 0 "#PWR0115" H 6000 1400 50  0001 C CNN
F 1 "GND" H 6005 1477 50  0000 C CNN
F 2 "" H 6000 1650 50  0001 C CNN
F 3 "" H 6000 1650 50  0001 C CNN
	1    6000 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0116
U 1 1 6290679C
P 6500 1150
F 0 "#PWR0116" H 6500 1000 50  0001 C CNN
F 1 "+9V" H 6515 1323 50  0000 C CNN
F 2 "" H 6500 1150 50  0001 C CNN
F 3 "" H 6500 1150 50  0001 C CNN
	1    6500 1150
	1    0    0    -1  
$EndComp
Text Notes 9100 2600 0    50   ~ 0
NOTE: offically TL07x require higher minimum VCC\nthan 9V but I tested them and they seem to work fine
Wire Wire Line
	2100 4000 2200 4000
Wire Wire Line
	6500 1150 6500 1250
Wire Wire Line
	6500 1250 6400 1250
NoConn ~ 6400 1450
$Comp
L power:GNDA #PWR0118
U 1 1 62B9ACE6
P 1400 5050
F 0 "#PWR0118" H 1400 4800 50  0001 C CNN
F 1 "GNDA" H 1405 4877 50  0000 C CNN
F 2 "" H 1400 5050 50  0001 C CNN
F 3 "" H 1400 5050 50  0001 C CNN
	1    1400 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0119
U 1 1 62BA19CE
P 10100 5850
F 0 "#PWR0119" H 10100 5600 50  0001 C CNN
F 1 "GNDA" H 10105 5677 50  0000 C CNN
F 2 "" H 10100 5850 50  0001 C CNN
F 3 "" H 10100 5850 50  0001 C CNN
	1    10100 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0120
U 1 1 62BAF894
P 2700 4750
F 0 "#PWR0120" H 2700 4500 50  0001 C CNN
F 1 "GNDA" H 2705 4577 50  0000 C CNN
F 2 "" H 2700 4750 50  0001 C CNN
F 3 "" H 2700 4750 50  0001 C CNN
	1    2700 4750
	1    0    0    -1  
$EndComp
Connection ~ 3500 4550
Text Notes 2200 5150 0    50   ~ 0
input buffer / feedback sum\n1M||1M = 500K input impedance
$Sheet
S 4850 4400 700  600 
U 628336F3
F0 "Anti-Aliasing Filter" 50
F1 "aafilter.sch" 50
F2 "IN" I L 4850 4550 50 
F3 "OUT" I R 5550 4550 50 
$EndSheet
$Comp
L Amplifier_Operational:TL072 U6
U 3 1 629D1A33
P 10400 1550
F 0 "U6" H 10358 1596 50  0000 L CNN
F 1 "TL072" H 10358 1505 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 10400 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 10400 1550 50  0001 C CNN
	3    10400 1550
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL074 U2
U 5 1 629D7F2C
P 10850 1550
F 0 "U2" H 10808 1596 50  0000 L CNN
F 1 "TL074" H 10808 1505 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10800 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 10900 1750 50  0001 C CNN
	5    10850 1550
	1    0    0    -1  
$EndComp
Text Notes 1900 7700 0    50   ~ 0
TODO: do we need to scale up and back down the signal\nto increase the dynamic range?\nTypical guitar signal is +/- 0.5V. Line level can be +/- 2V.\nOpamps should be able to handle +/- 3V without clipping.\nIf the delay is more efficient with higher signals, can scale up\nand back down on the summing stages
Text Notes 1950 7050 0    50   ~ 0
TODO: pots oriented correctly?
$Comp
L power:GND #PWR0133
U 1 1 62ADFC9B
P 10300 2050
F 0 "#PWR0133" H 10300 1800 50  0001 C CNN
F 1 "GND" H 10305 1877 50  0000 C CNN
F 2 "" H 10300 2050 50  0001 C CNN
F 3 "" H 10300 2050 50  0001 C CNN
	1    10300 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 62AE07B2
P 10750 2050
F 0 "#PWR0134" H 10750 1800 50  0001 C CNN
F 1 "GND" H 10755 1877 50  0000 C CNN
F 2 "" H 10750 2050 50  0001 C CNN
F 3 "" H 10750 2050 50  0001 C CNN
	1    10750 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0135
U 1 1 62AE0EB1
P 10300 1100
F 0 "#PWR0135" H 10300 950 50  0001 C CNN
F 1 "+9V" H 10315 1273 50  0000 C CNN
F 2 "" H 10300 1100 50  0001 C CNN
F 3 "" H 10300 1100 50  0001 C CNN
	1    10300 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0136
U 1 1 62AE1460
P 10750 1100
F 0 "#PWR0136" H 10750 950 50  0001 C CNN
F 1 "+9V" H 10765 1273 50  0000 C CNN
F 2 "" H 10750 1100 50  0001 C CNN
F 3 "" H 10750 1100 50  0001 C CNN
	1    10750 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 1850 10300 2050
Wire Wire Line
	10750 2050 10750 1850
Wire Wire Line
	10750 1250 10750 1100
Wire Wire Line
	10300 1100 10300 1250
$Comp
L Connector:Jack-DC J3
U 1 1 62B9E878
P 5650 1450
F 0 "J3" H 5707 1775 50  0000 C CNN
F 1 "Jack-DC" H 5707 1684 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x01_P2.54mm_Vertical" H 5700 1410 50  0001 C CNN
F 3 "~" H 5700 1410 50  0001 C CNN
	1    5650 1450
	1    0    0    -1  
$EndComp
Text Notes 5550 2200 0    50   ~ 0
TODO: proper orientation?
Wire Wire Line
	6000 1550 5950 1550
Wire Wire Line
	6000 1650 6000 1550
Wire Wire Line
	5950 1350 6000 1350
$Comp
L Connector:AudioJack3_Switch J1
U 1 1 62C8FDC8
P 1050 4750
F 0 "J1" H 771 4658 50  0000 R CNN
F 1 "IN" H 1300 5100 50  0000 R CNN
F 2 "Connector_Audio:Jack_6.35mm_Neutrik_NMJ6HCD2_Horizontal" H 1050 4750 50  0001 C CNN
F 3 "~" H 1050 4750 50  0001 C CNN
	1    1050 4750
	1    0    0    1   
$EndComp
$Comp
L Connector:AudioJack3_Switch J4
U 1 1 62C9DAFE
P 10450 5500
F 0 "J4" H 10170 5408 50  0000 R CNN
F 1 "OUT" H 10600 5900 50  0000 R CNN
F 2 "Connector_Audio:Jack_6.35mm_Neutrik_NMJ6HCD2_Horizontal" H 10450 5500 50  0001 C CNN
F 3 "~" H 10450 5500 50  0001 C CNN
	1    10450 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	10250 5500 10200 5500
Wire Wire Line
	10250 5400 10200 5400
Wire Wire Line
	1250 4550 1600 4550
Wire Wire Line
	1250 4750 1350 4750
Wire Wire Line
	1400 5050 1400 4950
Wire Wire Line
	1400 4450 1250 4450
Wire Wire Line
	1250 4850 1400 4850
Wire Wire Line
	1250 4950 1400 4950
Connection ~ 1400 4950
Wire Wire Line
	1400 4950 1400 4850
Wire Wire Line
	1400 4450 1400 4850
Connection ~ 1400 4850
Wire Wire Line
	1250 4650 1350 4650
Wire Wire Line
	1350 4650 1350 4750
Connection ~ 1350 4750
Wire Wire Line
	1350 4750 1800 4750
Wire Wire Line
	10100 5850 10100 5700
Wire Wire Line
	10100 5200 10250 5200
Wire Wire Line
	10100 5600 10250 5600
Connection ~ 10100 5600
Wire Wire Line
	10100 5600 10100 5200
Wire Wire Line
	10250 5700 10100 5700
Connection ~ 10100 5700
Wire Wire Line
	10100 5700 10100 5600
Wire Wire Line
	10200 5400 10200 5500
$Comp
L Switch:SW_3PDT_x3 SW1
U 1 1 62E854A9
P 1800 4550
F 0 "SW1" H 1800 4835 50  0000 C CNN
F 1 "SW_3PDT_x3" H 1800 4744 50  0000 C CNN
F 2 "Button_Switch_THT:Stompbox Switch" H 1800 4550 50  0001 C CNN
F 3 "~" H 1800 4550 50  0001 C CNN
	1    1800 4550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_3PDT_x3 SW1
U 3 1 62E91F53
P 9800 5300
F 0 "SW1" H 9800 5585 50  0000 C CNN
F 1 "SW_3PDT_x3" H 9800 5494 50  0000 C CNN
F 2 "Button_Switch_THT:Stompbox Switch" H 9800 5300 50  0001 C CNN
F 3 "~" H 9800 5300 50  0001 C CNN
	3    9800 5300
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_3PDT_x3 SW1
U 2 1 62EA1FFC
P 6200 1350
F 0 "SW1" H 6200 1635 50  0000 C CNN
F 1 "SW_3PDT_x3" H 6200 1544 50  0000 C CNN
F 2 "Button_Switch_THT:Stompbox Switch" H 6200 1350 50  0001 C CNN
F 3 "~" H 6200 1350 50  0001 C CNN
	2    6200 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 5300 10000 5300
Wire Wire Line
	10200 5500 9850 5500
Connection ~ 10200 5500
$Sheet
S 4500 3600 950  550 
U 62F7B2B4
F0 "Clock Generator" 50
F1 "file62F7B2B3.sch" 50
F2 "CLOCK" I R 5450 3900 50 
$EndSheet
$Sheet
S 5900 4250 1000 650 
U 62FE6C11
F0 "delay" 50
F1 "file62FE6C10.sch" 50
F2 "CLOCK" I L 5900 4350 50 
F3 "IN" I L 5900 4550 50 
F4 "OUT" I R 6900 4500 50 
$EndSheet
Wire Wire Line
	5550 4550 5900 4550
Wire Wire Line
	7100 4500 6900 4500
Wire Wire Line
	3500 4550 3650 4550
Wire Wire Line
	2200 4450 2100 4450
$Sheet
S 3650 4350 950  450 
U 6325A0B8
F0 "Tone Filter" 50
F1 "file6325A0B7.sch" 50
F2 "IN" I L 3650 4550 50 
F3 "WET_OUT" I R 4600 4550 50 
F4 "DRY_OUT" I R 4600 4700 50 
$EndSheet
Wire Wire Line
	4850 4550 4600 4550
Wire Wire Line
	5450 3900 5700 3900
Wire Wire Line
	5700 3900 5700 4350
Wire Wire Line
	5700 4350 5900 4350
$Comp
L Reference_Voltage:TLE2426xLP U8
U 1 1 6281967A
P 8600 1400
F 0 "U8" H 8600 1767 50  0000 C CNN
F 1 "TLE2426xLP" H 8600 1676 50  0000 C CNN
F 2 "" H 8600 1000 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tle2426.pdf" H 7200 2250 50  0001 C CIN
	1    8600 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0104
U 1 1 6281ACBB
P 8150 1300
F 0 "#PWR0104" H 8150 1150 50  0001 C CNN
F 1 "+9V" H 8165 1473 50  0000 C CNN
F 2 "" H 8150 1300 50  0001 C CNN
F 3 "" H 8150 1300 50  0001 C CNN
	1    8150 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 6281B2A9
P 8600 1850
F 0 "#PWR0105" H 8600 1600 50  0001 C CNN
F 1 "GND" H 8605 1677 50  0000 C CNN
F 2 "" H 8600 1850 50  0001 C CNN
F 3 "" H 8600 1850 50  0001 C CNN
	1    8600 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0117
U 1 1 6281B711
P 9100 1500
F 0 "#PWR0117" H 9100 1250 50  0001 C CNN
F 1 "GNDA" H 9105 1327 50  0000 C CNN
F 2 "" H 9100 1500 50  0001 C CNN
F 3 "" H 9100 1500 50  0001 C CNN
	1    9100 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1500 9100 1400
Wire Wire Line
	9100 1400 9000 1400
Wire Wire Line
	8600 1850 8600 1700
Wire Wire Line
	8200 1400 8150 1400
Wire Wire Line
	8150 1400 8150 1300
Text Notes 2150 3450 0    50   ~ 0
Limit maximum feedback amount to 50%
$Comp
L Amplifier_Operational:TL074 U?
U 1 1 6282D08A
P 8950 5200
F 0 "U?" H 8950 4833 50  0000 C CNN
F 1 "TL074" H 8950 4924 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8900 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 9000 5400 50  0001 C CNN
	1    8950 5200
	1    0    0    1   
$EndComp
Wire Wire Line
	8550 5400 8550 5300
Wire Wire Line
	8550 5300 8650 5300
Wire Wire Line
	8650 5100 8600 5100
Connection ~ 8600 5100
Wire Wire Line
	8600 5100 8450 5100
$Comp
L Device:R R?
U 1 1 6282D0A4
P 8950 4750
F 0 "R?" V 8743 4750 50  0000 C CNN
F 1 "500K" V 8834 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8880 4750 50  0001 C CNN
F 3 "~" H 8950 4750 50  0001 C CNN
	1    8950 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 5200 9250 5200
Wire Wire Line
	8350 4500 8450 4500
$Comp
L power:GNDA #PWR?
U 1 1 6282D0C0
P 8550 5400
F 0 "#PWR?" H 8550 5150 50  0001 C CNN
F 1 "GNDA" H 8555 5227 50  0000 C CNN
F 2 "" H 8550 5400 50  0001 C CNN
F 3 "" H 8550 5400 50  0001 C CNN
	1    8550 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 62843612
P 8200 4500
F 0 "R?" V 7993 4500 50  0000 C CNN
F 1 "1M" V 8084 4500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8130 4500 50  0001 C CNN
F 3 "~" H 8200 4500 50  0001 C CNN
	1    8200 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 5200 9350 4750
Connection ~ 2100 4450
Wire Wire Line
	2100 4450 2000 4450
$Sheet
S 7100 4350 700  600 
U 629A6A5C
F0 "Reconstruction Filter" 50
F1 "rfilter.sch" 50
F2 "IN" I L 7100 4500 50 
F3 "OUT" I R 7800 4500 50 
$EndSheet
$Comp
L Device:R R?
U 1 1 62A6A9A3
P 8200 5100
F 0 "R?" V 7993 5100 50  0000 C CNN
F 1 "1M" V 8084 5100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8130 5100 50  0001 C CNN
F 3 "~" H 8200 5100 50  0001 C CNN
	1    8200 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 5100 4700 4700
Wire Wire Line
	4700 4700 4600 4700
Wire Wire Line
	8350 5100 8450 5100
Connection ~ 8450 5100
Wire Wire Line
	7800 4500 8050 4500
Text Notes 1900 6850 0    50   ~ 0
TODO: fix op-amp count and pairings
Wire Wire Line
	2100 4450 2100 5400
$Comp
L Device:R R?
U 1 1 62C14D0E
P 2100 3600
F 0 "R?" V 1893 3600 50  0000 C CNN
F 1 "1M" V 1984 3600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2030 3600 50  0001 C CNN
F 3 "~" H 2100 3600 50  0001 C CNN
	1    2100 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2100 3750 2100 3800
Wire Wire Line
	2100 3450 2100 3350
Wire Wire Line
	2350 3850 2350 3800
Wire Wire Line
	2350 3800 2100 3800
Connection ~ 2100 3800
Wire Wire Line
	2100 3800 2100 4000
Wire Wire Line
	9450 5400 9600 5400
Wire Wire Line
	2000 4650 2000 6300
Wire Wire Line
	1800 6400 9850 6400
Wire Wire Line
	1800 4750 1800 6400
Wire Wire Line
	8450 4500 8450 5100
Wire Wire Line
	8800 4750 8600 4750
Wire Wire Line
	8600 4750 8600 5100
Wire Wire Line
	9100 4750 9350 4750
Wire Wire Line
	4700 5100 8050 5100
Wire Wire Line
	2100 3350 9450 3350
Text Notes 6200 4000 0    50   ~ 0
filter+delay stage are all non-inverting,\nso low + high are in phase\n\ninput sum is inverting, then tone recombination is\ninverting, so wet + dry are in phase
$Comp
L Device:R R?
U 1 1 62A76213
P 8200 5400
F 0 "R?" V 7993 5400 50  0000 C CNN
F 1 "1M" V 8084 5400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 8130 5400 50  0001 C CNN
F 3 "~" H 8200 5400 50  0001 C CNN
	1    8200 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 5200 9450 5200
Connection ~ 9350 5200
Wire Wire Line
	9850 5500 9850 6400
Wire Wire Line
	9450 5400 9450 6300
Wire Wire Line
	2000 6300 9450 6300
Wire Wire Line
	9450 5200 9450 3350
Connection ~ 9450 5200
Wire Wire Line
	9450 5200 9600 5200
Wire Wire Line
	8450 5100 8450 5400
Wire Wire Line
	8450 5400 8350 5400
Wire Wire Line
	8050 5400 2100 5400
Text Notes 7700 5700 0    50   ~ 0
sum half dry signal plus half wet signal
Text Notes 9600 4750 0    50   ~ 0
TODO: use other LM13700 buffer on output?
$EndSCHEMATC
