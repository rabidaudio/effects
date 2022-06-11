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
Wire Wire Line
	5150 3800 5150 4000
Wire Wire Line
	5150 4000 5800 4000
Wire Wire Line
	5800 4000 5800 3700
$Comp
L Amplifier_Operational:TL074 U?
U 2 1 632692A6
P 5450 3700
AR Path="/632692A6" Ref="U?"  Part="2" 
AR Path="/6325A0B8/632692A6" Ref="U2"  Part="2" 
F 0 "U2" H 5450 4067 50  0000 C CNN
F 1 "TL074" H 5450 3976 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5400 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5500 3900 50  0001 C CNN
	2    5450 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 632692AC
P 5300 4350
AR Path="/632692AC" Ref="R?"  Part="1" 
AR Path="/6325A0B8/632692AC" Ref="R24"  Part="1" 
F 0 "R24" V 5093 4350 50  0000 C CNN
F 1 "1K" V 5184 4350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5230 4350 50  0001 C CNN
F 3 "~" H 5300 4350 50  0001 C CNN
	1    5300 4350
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 632692B2
P 4800 3600
AR Path="/632692B2" Ref="C?"  Part="1" 
AR Path="/6325A0B8/632692B2" Ref="C12"  Part="1" 
F 0 "C12" V 4548 3600 50  0000 C CNN
F 1 "47n" V 4639 3600 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 4838 3450 50  0001 C CNN
F 3 "~" H 4800 3600 50  0001 C CNN
	1    4800 3600
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 632692B8
P 4300 3600
AR Path="/632692B8" Ref="C?"  Part="1" 
AR Path="/6325A0B8/632692B8" Ref="C11"  Part="1" 
F 0 "C11" V 4048 3600 50  0000 C CNN
F 1 "47n" V 4139 3600 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 4338 3450 50  0001 C CNN
F 3 "~" H 4300 3600 50  0001 C CNN
	1    4300 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT_Dual_Separate R_CUTOFF_?
U 2 1 632692BE
P 5850 3100
AR Path="/632692BE" Ref="R_CUTOFF_?"  Part="2" 
AR Path="/6325A0B8/632692BE" Ref="R_CUTOFF_1"  Part="2" 
F 0 "R_CUTOFF_1" V 5643 3100 50  0000 C CNN
F 1 "100K" V 5734 3100 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09L_Double_Vertical" H 5850 3100 50  0001 C CNN
F 3 "~" H 5850 3100 50  0001 C CNN
	2    5850 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT_Dual_Separate R_CUTOFF_?
U 1 1 632692C4
P 5750 4350
AR Path="/632692C4" Ref="R_CUTOFF_?"  Part="1" 
AR Path="/6325A0B8/632692C4" Ref="R_CUTOFF_1"  Part="1" 
F 0 "R_CUTOFF_1" V 5543 4350 50  0000 C CNN
F 1 "100K" V 5634 4350 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09L_Double_Vertical" H 5750 4350 50  0001 C CNN
F 3 "~" H 5750 4350 50  0001 C CNN
	1    5750 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 4500 5750 4550
Wire Wire Line
	5750 4550 5500 4550
Wire Wire Line
	5500 4550 5500 4350
Wire Wire Line
	5500 4350 5450 4350
Wire Wire Line
	5500 4350 5600 4350
Connection ~ 5500 4350
$Comp
L Device:R R?
U 1 1 632692D0
P 5350 3100
AR Path="/632692D0" Ref="R?"  Part="1" 
AR Path="/6325A0B8/632692D0" Ref="R25"  Part="1" 
F 0 "R25" V 5143 3100 50  0000 C CNN
F 1 "1K" V 5234 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 5280 3100 50  0001 C CNN
F 3 "~" H 5350 3100 50  0001 C CNN
	1    5350 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 3250 5850 3350
Wire Wire Line
	5850 3350 5650 3350
Wire Wire Line
	5650 3350 5650 3100
Wire Wire Line
	5650 3100 5700 3100
Wire Wire Line
	5650 3100 5500 3100
Connection ~ 5650 3100
Wire Wire Line
	5150 3600 5050 3600
Connection ~ 5050 3600
Wire Wire Line
	5050 3600 4950 3600
Wire Wire Line
	6000 3100 6100 3100
Wire Wire Line
	5750 3700 5800 3700
Connection ~ 5800 3700
Wire Wire Line
	5800 3700 6100 3700
Wire Wire Line
	5150 4350 5050 4350
$Comp
L power:GNDA #PWR?
U 1 1 632692E4
P 6000 4500
AR Path="/632692E4" Ref="#PWR?"  Part="1" 
AR Path="/6325A0B8/632692E4" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 6000 4250 50  0001 C CNN
F 1 "GNDA" H 6005 4327 50  0000 C CNN
F 2 "" H 6000 4500 50  0001 C CNN
F 3 "" H 6000 4500 50  0001 C CNN
	1    6000 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4500 6000 4350
Wire Wire Line
	6000 4350 5900 4350
Text Notes 5000 4800 0    50   ~ 0
2nd order HPF, Q=0.5\nCutoff: 50Hz - 5KHz
Wire Wire Line
	4450 3600 4550 3600
Wire Wire Line
	5050 4350 5050 3600
Wire Wire Line
	4550 3100 4550 3600
Wire Wire Line
	4550 3100 5200 3100
Connection ~ 4550 3600
Wire Wire Line
	4550 3600 4650 3600
Wire Wire Line
	6100 3100 6100 3700
Wire Wire Line
	6100 3700 6300 3700
Connection ~ 6100 3700
Text HLabel 4000 3600 0    50   Input ~ 0
IN
Wire Wire Line
	4000 3600 4100 3600
Text HLabel 6300 3700 2    50   Input ~ 0
HI_OUT
Text HLabel 7550 4350 2    50   Input ~ 0
LO_OUT
$Comp
L Amplifier_Operational:TL074 U?
U 2 1 62A49A72
P 7100 4350
AR Path="/62A49A72" Ref="U?"  Part="2" 
AR Path="/6325A0B8/62A49A72" Ref="U?"  Part="2" 
F 0 "U?" H 7100 4717 50  0000 C CNN
F 1 "TL074" H 7100 4626 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7050 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 7150 4550 50  0001 C CNN
	2    7100 4350
	1    0    0    1   
$EndComp
Text Notes 6900 4950 0    50   ~ 0
Diff amp, subtracting HP signal\nfrom original signal to get LP signal
$Comp
L Device:R R?
U 1 1 62A50D45
P 6450 4450
AR Path="/62A50D45" Ref="R?"  Part="1" 
AR Path="/6325A0B8/62A50D45" Ref="R?"  Part="1" 
F 0 "R?" V 6650 4450 50  0000 C CNN
F 1 "100K" V 6550 4450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6380 4450 50  0001 C CNN
F 3 "~" H 6450 4450 50  0001 C CNN
	1    6450 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 62A52C2B
P 6450 4250
AR Path="/62A52C2B" Ref="R?"  Part="1" 
AR Path="/6325A0B8/62A52C2B" Ref="R?"  Part="1" 
F 0 "R?" V 6243 4250 50  0000 C CNN
F 1 "100K" V 6334 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6380 4250 50  0001 C CNN
F 3 "~" H 6450 4250 50  0001 C CNN
	1    6450 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 62A53369
P 7150 4000
AR Path="/62A53369" Ref="R?"  Part="1" 
AR Path="/6325A0B8/62A53369" Ref="R?"  Part="1" 
F 0 "R?" V 6943 4000 50  0000 C CNN
F 1 "100K" V 7034 4000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 7080 4000 50  0001 C CNN
F 3 "~" H 7150 4000 50  0001 C CNN
	1    7150 4000
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 62A538EE
P 6700 4650
AR Path="/62A538EE" Ref="R?"  Part="1" 
AR Path="/6325A0B8/62A538EE" Ref="R?"  Part="1" 
F 0 "R?" V 6493 4650 50  0000 C CNN
F 1 "100K" V 6584 4650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6630 4650 50  0001 C CNN
F 3 "~" H 6700 4650 50  0001 C CNN
	1    6700 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 4450 6700 4450
Wire Wire Line
	6700 4500 6700 4450
Connection ~ 6700 4450
Wire Wire Line
	6700 4450 6800 4450
Wire Wire Line
	6600 4250 6700 4250
Wire Wire Line
	7000 4000 6700 4000
Wire Wire Line
	6700 4000 6700 4250
Connection ~ 6700 4250
Wire Wire Line
	6700 4250 6800 4250
Wire Wire Line
	7400 4350 7450 4350
Wire Wire Line
	7450 4350 7450 4000
Wire Wire Line
	7450 4000 7300 4000
Wire Wire Line
	7550 4350 7450 4350
Connection ~ 7450 4350
$Comp
L power:GNDA #PWR?
U 1 1 62A57D82
P 6700 4900
AR Path="/62A57D82" Ref="#PWR?"  Part="1" 
AR Path="/6325A0B8/62A57D82" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6700 4650 50  0001 C CNN
F 1 "GNDA" H 6705 4727 50  0000 C CNN
F 2 "" H 6700 4900 50  0001 C CNN
F 3 "" H 6700 4900 50  0001 C CNN
	1    6700 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 4900 6700 4800
Wire Wire Line
	6300 4450 6200 4450
Wire Wire Line
	6200 4450 6200 4900
Wire Wire Line
	6200 4900 4100 4900
Wire Wire Line
	4100 4900 4100 3600
Connection ~ 4100 3600
Wire Wire Line
	4100 3600 4150 3600
Wire Wire Line
	6300 4250 6100 4250
Wire Wire Line
	6100 4250 6100 3700
$EndSCHEMATC
