EESchema Schematic File Version 4
LIBS:VAGTrip-cache
EELAYER 29 0
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
L Connector_Generic:Conn_01x04 J3
U 1 1 5D6A64C8
P 8600 3700
F 0 "J3" H 8680 3692 50  0000 L CNN
F 1 "Conn_01x04" H 8680 3601 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 8600 3700 50  0001 C CNN
F 3 "~" H 8600 3700 50  0001 C CNN
	1    8600 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 5D6A9DC2
P 8600 4350
F 0 "J4" H 8680 4342 50  0000 L CNN
F 1 "Conn_01x04" H 8680 4251 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 8600 4350 50  0001 C CNN
F 3 "~" H 8600 4350 50  0001 C CNN
	1    8600 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5D6AAC08
P 4600 2700
F 0 "C4" H 4715 2746 50  0000 L CNN
F 1 "C" H 4715 2655 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 4638 2550 50  0001 C CNN
F 3 "~" H 4600 2700 50  0001 C CNN
	1    4600 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5D6AB86E
P 4600 3100
F 0 "#PWR010" H 4600 2850 50  0001 C CNN
F 1 "GND" H 4605 2927 50  0000 C CNN
F 2 "" H 4600 3100 50  0001 C CNN
F 3 "" H 4600 3100 50  0001 C CNN
	1    4600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2400 4600 2400
Wire Wire Line
	4600 2400 4600 2550
Wire Wire Line
	4600 2850 4600 3100
$Comp
L power:+5V #PWR015
U 1 1 5D6ACEBD
P 5600 1700
F 0 "#PWR015" H 5600 1550 50  0001 C CNN
F 1 "+5V" H 5615 1873 50  0000 C CNN
F 2 "" H 5600 1700 50  0001 C CNN
F 3 "" H 5600 1700 50  0001 C CNN
	1    5600 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2100 5600 1950
Wire Wire Line
	5500 2100 5500 1950
Wire Wire Line
	5500 1950 5600 1950
Connection ~ 5600 1950
Wire Wire Line
	5600 1950 5600 1700
$Comp
L Device:Crystal Y1
U 1 1 5D6AE5D4
P 6600 3050
F 0 "Y1" V 6554 3181 50  0000 L CNN
F 1 "Crystal" V 6645 3181 50  0000 L CNN
F 2 "Crystals:Crystal_SMD_0603-2pin_6.0x3.5mm" H 6600 3050 50  0001 C CNN
F 3 "~" H 6600 3050 50  0001 C CNN
	1    6600 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	6100 3000 6400 3000
Wire Wire Line
	6400 3000 6400 2900
Wire Wire Line
	6400 2900 6600 2900
Wire Wire Line
	6100 3100 6400 3100
Wire Wire Line
	6400 3100 6400 3200
Wire Wire Line
	6400 3200 6600 3200
$Comp
L power:GND #PWR017
U 1 1 5D6B1A9A
P 7200 3050
F 0 "#PWR017" H 7200 2800 50  0001 C CNN
F 1 "GND" H 7205 2877 50  0000 C CNN
F 2 "" H 7200 3050 50  0001 C CNN
F 3 "" H 7200 3050 50  0001 C CNN
	1    7200 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 5D6B2E71
P 6800 3550
F 0 "#PWR016" H 6800 3400 50  0001 C CNN
F 1 "+5V" H 6815 3723 50  0000 C CNN
F 2 "" H 6800 3550 50  0001 C CNN
F 3 "" H 6800 3550 50  0001 C CNN
	1    6800 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5D6B4A25
P 6800 3750
F 0 "R4" V 6593 3750 50  0000 C CNN
F 1 "R" V 6684 3750 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 6730 3750 50  0001 C CNN
F 3 "~" H 6800 3750 50  0001 C CNN
	1    6800 3750
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5D6B677F
P 8200 3950
F 0 "#PWR019" H 8200 3700 50  0001 C CNN
F 1 "GND" H 8205 3777 50  0000 C CNN
F 2 "" H 8200 3950 50  0001 C CNN
F 3 "" H 8200 3950 50  0001 C CNN
	1    8200 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 5D6B71B6
P 8200 3550
F 0 "#PWR018" H 8200 3400 50  0001 C CNN
F 1 "+5V" H 8215 3723 50  0000 C CNN
F 2 "" H 8200 3550 50  0001 C CNN
F 3 "" H 8200 3550 50  0001 C CNN
	1    8200 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3600 8200 3600
Wire Wire Line
	8200 3600 8200 3550
Wire Wire Line
	8400 3900 8200 3900
Wire Wire Line
	8200 3900 8200 3950
$Comp
L power:GND #PWR020
U 1 1 5D6BB0F3
P 8250 4650
F 0 "#PWR020" H 8250 4400 50  0001 C CNN
F 1 "GND" H 8255 4477 50  0000 C CNN
F 2 "" H 8250 4650 50  0001 C CNN
F 3 "" H 8250 4650 50  0001 C CNN
	1    8250 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4550 8250 4550
Wire Wire Line
	8250 4550 8250 4650
$Comp
L Regulator_Linear:L7805 U1
U 1 1 5D6BF265
P 4300 1250
F 0 "U1" H 4300 1492 50  0000 C CNN
F 1 "L7805" H 4300 1401 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:TO-252-2" H 4325 1100 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 4300 1200 50  0001 C CNN
	1    4300 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5D6C19A6
P 4300 1750
F 0 "#PWR09" H 4300 1500 50  0001 C CNN
F 1 "GND" H 4305 1577 50  0000 C CNN
F 2 "" H 4300 1750 50  0001 C CNN
F 3 "" H 4300 1750 50  0001 C CNN
	1    4300 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1550 4300 1750
$Comp
L power:+5V #PWR013
U 1 1 5D6C28BA
P 5150 1050
F 0 "#PWR013" H 5150 900 50  0001 C CNN
F 1 "+5V" H 5165 1223 50  0000 C CNN
F 2 "" H 5150 1050 50  0001 C CNN
F 3 "" H 5150 1050 50  0001 C CNN
	1    5150 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1250 4650 1250
$Comp
L Device:C C3
U 1 1 5D6C38A2
P 3750 1400
F 0 "C3" H 3865 1446 50  0000 L CNN
F 1 "C" H 3865 1355 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3788 1250 50  0001 C CNN
F 3 "~" H 3750 1400 50  0001 C CNN
	1    3750 1400
	1    0    0    -1  
$EndComp
Connection ~ 3750 1250
Wire Wire Line
	3750 1250 3900 1250
$Comp
L Device:C C5
U 1 1 5D6C4235
P 4800 1400
F 0 "C5" H 4915 1446 50  0000 L CNN
F 1 "C" H 4915 1355 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 4838 1250 50  0001 C CNN
F 3 "~" H 4800 1400 50  0001 C CNN
	1    4800 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5D6C45C5
P 3750 1750
F 0 "#PWR08" H 3750 1500 50  0001 C CNN
F 1 "GND" H 3755 1577 50  0000 C CNN
F 2 "" H 3750 1750 50  0001 C CNN
F 3 "" H 3750 1750 50  0001 C CNN
	1    3750 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5D6C4832
P 4800 1700
F 0 "#PWR011" H 4800 1450 50  0001 C CNN
F 1 "GND" H 4805 1527 50  0000 C CNN
F 2 "" H 4800 1700 50  0001 C CNN
F 3 "" H 4800 1700 50  0001 C CNN
	1    4800 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1700 4800 1550
Wire Wire Line
	3750 1750 3750 1550
$Comp
L Diode:1N4001 D2
U 1 1 5D6D42A5
P 4300 900
F 0 "D2" H 4300 1116 50  0000 C CNN
F 1 "1N4001" H 4300 1025 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 4300 725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4300 900 50  0001 C CNN
	1    4300 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 1250 4650 900 
Wire Wire Line
	4650 900  4450 900 
Connection ~ 4650 1250
Wire Wire Line
	4650 1250 4800 1250
Wire Wire Line
	4150 900  3900 900 
Wire Wire Line
	3900 900  3900 1250
Connection ~ 3900 1250
Wire Wire Line
	3900 1250 4000 1250
$Comp
L Device:C_Small C7
U 1 1 5D6D7965
P 6800 2900
F 0 "C7" V 6571 2900 50  0000 C CNN
F 1 "C_Small" V 6662 2900 50  0000 C CNN
F 2 "Capacitors_SMD:C_1206" H 6800 2900 50  0001 C CNN
F 3 "~" H 6800 2900 50  0001 C CNN
	1    6800 2900
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5D6D9FE6
P 6800 3200
F 0 "C8" V 6571 3200 50  0000 C CNN
F 1 "C_Small" V 6662 3200 50  0000 C CNN
F 2 "Capacitors_SMD:C_1206" H 6800 3200 50  0001 C CNN
F 3 "~" H 6800 3200 50  0001 C CNN
	1    6800 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 2900 6600 2900
Connection ~ 6600 2900
Wire Wire Line
	6700 3200 6600 3200
Connection ~ 6600 3200
Wire Wire Line
	6900 2900 7050 2900
Wire Wire Line
	7050 2900 7050 3050
Wire Wire Line
	7050 3200 6900 3200
Wire Wire Line
	7050 3050 7200 3050
Connection ~ 7050 3050
Wire Wire Line
	7050 3050 7050 3200
$Comp
L power:GND #PWR014
U 1 1 5D6E3524
P 5500 5400
F 0 "#PWR014" H 5500 5150 50  0001 C CNN
F 1 "GND" H 5505 5227 50  0000 C CNN
F 2 "" H 5500 5400 50  0001 C CNN
F 3 "" H 5500 5400 50  0001 C CNN
	1    5500 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5100 5500 5400
$Comp
L Transistor_BJT:BC847 Q3
U 1 1 5D6E5EC4
P 9100 1750
F 0 "Q3" H 9291 1796 50  0000 L CNN
F 1 "BC847" H 9291 1705 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 9300 1675 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 9100 1750 50  0001 L CNN
	1    9100 1750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q4
U 1 1 5D6E7B8D
P 9550 1550
F 0 "Q4" H 9741 1596 50  0000 L CNN
F 1 "BC847" H 9741 1505 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 9750 1475 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 9550 1550 50  0001 L CNN
	1    9550 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5D6E9451
P 9200 2000
F 0 "#PWR022" H 9200 1750 50  0001 C CNN
F 1 "GND" H 9205 1827 50  0000 C CNN
F 2 "" H 9200 2000 50  0001 C CNN
F 3 "" H 9200 2000 50  0001 C CNN
	1    9200 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5D6EC006
P 9200 1100
F 0 "R5" H 9130 1054 50  0000 R CNN
F 1 "R" H 9130 1145 50  0000 R CNN
F 2 "Resistors_SMD:R_1206" V 9130 1100 50  0001 C CNN
F 3 "~" H 9200 1100 50  0001 C CNN
	1    9200 1100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 5D6EC9EF
P 9650 1100
F 0 "R6" H 9580 1054 50  0000 R CNN
F 1 "R" H 9580 1145 50  0000 R CNN
F 2 "Resistors_SMD:R_1206" V 9580 1100 50  0001 C CNN
F 3 "~" H 9650 1100 50  0001 C CNN
	1    9650 1100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R7
U 1 1 5D6ECE9B
P 10100 2050
F 0 "R7" H 10030 2004 50  0000 R CNN
F 1 "R" H 10030 2095 50  0000 R CNN
F 2 "Resistors_SMD:R_1206" V 10030 2050 50  0001 C CNN
F 3 "~" H 10100 2050 50  0001 C CNN
	1    10100 2050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 5D6ED59D
P 10100 2450
F 0 "R8" H 10030 2404 50  0000 R CNN
F 1 "R" H 10030 2495 50  0000 R CNN
F 2 "Resistors_SMD:R_1206" V 10030 2450 50  0001 C CNN
F 3 "~" H 10100 2450 50  0001 C CNN
	1    10100 2450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5D6EDB6A
P 10100 2750
F 0 "#PWR025" H 10100 2500 50  0001 C CNN
F 1 "GND" H 10105 2577 50  0000 C CNN
F 2 "" H 10100 2750 50  0001 C CNN
F 3 "" H 10100 2750 50  0001 C CNN
	1    10100 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 2750 10100 2600
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 5D6FD0C3
P 8600 3200
F 0 "J2" H 8680 3242 50  0000 L CNN
F 1 "Conn_01x01" H 8680 3151 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 8600 3200 50  0001 C CNN
F 3 "~" H 8600 3200 50  0001 C CNN
	1    8600 3200
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4001 D1
U 1 1 5D748787
P 2100 2150
F 0 "D1" H 2100 1934 50  0000 C CNN
F 1 "1N4001" H 2100 2025 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 2100 1975 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2100 2150 50  0001 C CNN
	1    2100 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	2250 2150 2700 2150
$Comp
L Device:Q_PMOS_DGS Q1
U 1 1 5D74DCA9
P 2100 2550
F 0 "Q1" V 2443 2550 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 2352 2550 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2300 2650 50  0001 C CNN
F 3 "~" H 2100 2550 50  0001 C CNN
	1    2100 2550
	0    1    -1   0   
$EndComp
Wire Wire Line
	1800 2450 1900 2450
Wire Wire Line
	2300 2450 2700 2450
Wire Wire Line
	3450 1250 3750 1250
$Comp
L Device:R R3
U 1 1 5D7588C6
P 1800 2700
F 0 "R3" H 1730 2654 50  0000 R CNN
F 1 "R" H 1730 2745 50  0000 R CNN
F 2 "Resistors_SMD:R_1206" V 1730 2700 50  0001 C CNN
F 3 "~" H 1800 2700 50  0001 C CNN
	1    1800 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	1800 2550 1800 2450
Wire Wire Line
	1800 2850 2100 2850
Wire Wire Line
	2100 2850 2100 2750
$Comp
L Transistor_BJT:BC847 Q2
U 1 1 5D75DCA8
P 2200 3100
F 0 "Q2" H 2391 3146 50  0000 L CNN
F 1 "BC847" H 2391 3055 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2400 3025 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 2200 3100 50  0001 L CNN
	1    2200 3100
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5D764256
P 2100 3350
F 0 "#PWR03" H 2100 3100 50  0001 C CNN
F 1 "GND" H 2105 3177 50  0000 C CNN
F 2 "" H 2100 3350 50  0001 C CNN
F 3 "" H 2100 3350 50  0001 C CNN
	1    2100 3350
	1    0    0    -1  
$EndComp
Text GLabel 2550 3100 2    50   Input ~ 0
POWER_EN
Wire Wire Line
	2400 3100 2550 3100
$Comp
L Device:R R2
U 1 1 5D778629
P 1600 3850
F 0 "R2" H 1530 3804 50  0000 R CNN
F 1 "R" H 1530 3895 50  0000 R CNN
F 2 "Resistors_SMD:R_1206" V 1530 3850 50  0001 C CNN
F 3 "~" H 1600 3850 50  0001 C CNN
	1    1600 3850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 5D778E1D
P 1600 3400
F 0 "R1" H 1530 3354 50  0000 R CNN
F 1 "R" H 1530 3445 50  0000 R CNN
F 2 "Resistors_SMD:R_1206" V 1530 3400 50  0001 C CNN
F 3 "~" H 1600 3400 50  0001 C CNN
	1    1600 3400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5D77E827
P 1600 4200
F 0 "#PWR02" H 1600 3950 50  0001 C CNN
F 1 "GND" H 1605 4027 50  0000 C CNN
F 2 "" H 1600 4200 50  0001 C CNN
F 3 "" H 1600 4200 50  0001 C CNN
	1    1600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4200 1600 4000
Text GLabel 2550 3650 2    50   Input ~ 0
SENSE
$Comp
L Device:C C1
U 1 1 5D7852D4
P 3200 4450
F 0 "C1" H 3315 4496 50  0000 L CNN
F 1 "C" H 3315 4405 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3238 4300 50  0001 C CNN
F 3 "~" H 3200 4450 50  0001 C CNN
	1    3200 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5D785FCC
P 3500 4450
F 0 "C2" H 3615 4496 50  0000 L CNN
F 1 "C" H 3615 4405 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 3538 4300 50  0001 C CNN
F 3 "~" H 3500 4450 50  0001 C CNN
	1    3500 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5D7861F2
P 3350 4150
F 0 "#PWR05" H 3350 4000 50  0001 C CNN
F 1 "+5V" H 3365 4323 50  0000 C CNN
F 2 "" H 3350 4150 50  0001 C CNN
F 3 "" H 3350 4150 50  0001 C CNN
	1    3350 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5D786CD0
P 3350 4800
F 0 "#PWR06" H 3350 4550 50  0001 C CNN
F 1 "GND" H 3355 4627 50  0000 C CNN
F 2 "" H 3350 4800 50  0001 C CNN
F 3 "" H 3350 4800 50  0001 C CNN
	1    3350 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4300 3200 4150
Wire Wire Line
	3200 4150 3350 4150
Wire Wire Line
	3500 4300 3500 4150
Wire Wire Line
	3500 4150 3350 4150
Connection ~ 3350 4150
Wire Wire Line
	3200 4600 3200 4800
Wire Wire Line
	3200 4800 3350 4800
Wire Wire Line
	3350 4800 3500 4800
Wire Wire Line
	3500 4800 3500 4600
Connection ~ 3350 4800
Wire Wire Line
	10100 2200 10100 2250
Text GLabel 6300 2400 2    50   Input ~ 0
KLINE_TX
Text GLabel 6300 2500 2    50   Input ~ 0
KLINE_RX
Wire Wire Line
	6100 2400 6300 2400
Wire Wire Line
	6300 2500 6100 2500
Wire Wire Line
	9350 1550 9200 1550
Wire Wire Line
	9650 1350 9650 1300
Wire Wire Line
	9650 950  9650 900 
Wire Wire Line
	9200 950  9200 900 
Wire Wire Line
	9200 1550 9200 1250
Connection ~ 9200 1550
Text GLabel 10200 1300 2    50   Input ~ 0
KLINE
Connection ~ 9650 1300
Wire Wire Line
	9650 1300 9650 1250
Wire Wire Line
	9200 2000 9200 1950
Text GLabel 8500 2250 0    50   Input ~ 0
KLINE_RX
Wire Wire Line
	9650 1300 10100 1300
Wire Wire Line
	10100 1900 10100 1300
Connection ~ 10100 1300
Wire Wire Line
	10100 1300 10200 1300
Wire Wire Line
	2700 2150 2700 2300
Wire Wire Line
	1800 2450 1350 2450
Connection ~ 1800 2450
Wire Wire Line
	2100 2900 2100 2850
Connection ~ 2100 2850
Wire Wire Line
	2100 3350 2100 3300
Wire Wire Line
	1350 2150 1600 2150
Wire Wire Line
	1600 3550 1600 3650
Wire Wire Line
	2550 3650 1600 3650
Connection ~ 1600 3650
Wire Wire Line
	1600 3650 1600 3700
Wire Wire Line
	1600 3250 1600 2150
Connection ~ 1600 2150
Wire Wire Line
	1600 2150 1950 2150
Wire Wire Line
	2700 2300 2900 2300
Connection ~ 2700 2300
Wire Wire Line
	2700 2300 2700 2450
Text GLabel 1350 2150 0    50   Input ~ 0
15
Text GLabel 1350 2450 0    50   Input ~ 0
30
$Comp
L power:+12V #PWR04
U 1 1 5D747636
P 2900 2300
F 0 "#PWR04" H 2900 2150 50  0001 C CNN
F 1 "+12V" H 2915 2473 50  0000 C CNN
F 2 "" H 2900 2300 50  0001 C CNN
F 3 "" H 2900 2300 50  0001 C CNN
	1    2900 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR07
U 1 1 5D748375
P 3450 1100
F 0 "#PWR07" H 3450 950 50  0001 C CNN
F 1 "+12V" H 3465 1273 50  0000 C CNN
F 2 "" H 3450 1100 50  0001 C CNN
F 3 "" H 3450 1100 50  0001 C CNN
	1    3450 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1250 3450 1100
$Comp
L power:+12V #PWR021
U 1 1 5D74F216
P 9200 900
F 0 "#PWR021" H 9200 750 50  0001 C CNN
F 1 "+12V" H 9215 1073 50  0000 C CNN
F 2 "" H 9200 900 50  0001 C CNN
F 3 "" H 9200 900 50  0001 C CNN
	1    9200 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR023
U 1 1 5D74FCBE
P 9650 900
F 0 "#PWR023" H 9650 750 50  0001 C CNN
F 1 "+12V" H 9665 1073 50  0000 C CNN
F 2 "" H 9650 900 50  0001 C CNN
F 3 "" H 9650 900 50  0001 C CNN
	1    9650 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 1800 9650 1750
$Comp
L power:GND #PWR024
U 1 1 5D6E9A39
P 9650 1800
F 0 "#PWR024" H 9650 1550 50  0001 C CNN
F 1 "GND" H 9655 1627 50  0000 C CNN
F 2 "" H 9650 1800 50  0001 C CNN
F 3 "" H 9650 1800 50  0001 C CNN
	1    9650 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1250 1400 1250
Wire Wire Line
	1550 1150 1400 1150
Text GLabel 1550 1250 2    50   Input ~ 0
30
Text GLabel 1550 1150 2    50   Input ~ 0
15
Wire Wire Line
	1550 1350 1400 1350
$Comp
L power:GND #PWR01
U 1 1 5D6BDDE9
P 1550 1350
F 0 "#PWR01" H 1550 1100 50  0001 C CNN
F 1 "GND" H 1555 1177 50  0000 C CNN
F 2 "" H 1550 1350 50  0001 C CNN
F 3 "" H 1550 1350 50  0001 C CNN
	1    1550 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5D6A7EDA
P 1200 1250
F 0 "J1" H 1118 1567 50  0000 C CNN
F 1 "Conn_01x03" H 1118 1476 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 1200 1250 50  0001 C CNN
F 3 "~" H 1200 1250 50  0001 C CNN
	1    1200 1250
	-1   0    0    -1  
$EndComp
Text GLabel 8350 3200 0    50   Input ~ 0
KLINE
Wire Wire Line
	8400 3200 8350 3200
Text GLabel 6200 3700 2    50   Input ~ 0
I2C_SDA
Text GLabel 6200 3800 2    50   Input ~ 0
I2C_SCL
Wire Wire Line
	6100 3700 6200 3700
Wire Wire Line
	6100 3800 6200 3800
Wire Wire Line
	6800 3600 6800 3550
Wire Wire Line
	6800 3900 6100 3900
Text GLabel 8350 3700 0    50   Input ~ 0
I2C_SDA
Text GLabel 8350 3800 0    50   Input ~ 0
I2C_SCL
Wire Wire Line
	8400 3800 8350 3800
Wire Wire Line
	8400 3700 8350 3700
Text GLabel 6200 4600 2    50   Input ~ 0
BUTTON_NEXT
Text GLabel 6200 4700 2    50   Input ~ 0
BUTTON_MODE
Text GLabel 6200 4800 2    50   Input ~ 0
BUTTON_RESET
Text GLabel 8350 4250 0    50   Input ~ 0
BUTTON_NEXT
Text GLabel 8350 4350 0    50   Input ~ 0
BUTTON_MODE
Text GLabel 8350 4450 0    50   Input ~ 0
BUTTON_RESET
Wire Wire Line
	8400 4250 8350 4250
Wire Wire Line
	8400 4350 8350 4350
Wire Wire Line
	8350 4450 8400 4450
Wire Wire Line
	6200 4600 6100 4600
Wire Wire Line
	6100 4700 6200 4700
Wire Wire Line
	6200 4800 6100 4800
$Comp
L Device:C C6
U 1 1 5D7AC226
P 5100 1400
F 0 "C6" H 5215 1446 50  0000 L CNN
F 1 "C" H 5215 1355 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 5138 1250 50  0001 C CNN
F 3 "~" H 5100 1400 50  0001 C CNN
	1    5100 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5D7AC230
P 5100 1700
F 0 "#PWR012" H 5100 1450 50  0001 C CNN
F 1 "GND" H 5105 1527 50  0000 C CNN
F 2 "" H 5100 1700 50  0001 C CNN
F 3 "" H 5100 1700 50  0001 C CNN
	1    5100 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1700 5100 1550
Wire Wire Line
	4800 1250 5100 1250
Connection ~ 4800 1250
Wire Wire Line
	5100 1250 5150 1250
Wire Wire Line
	5150 1250 5150 1050
Connection ~ 5100 1250
Text GLabel 6200 4300 2    50   Input ~ 0
POWER_EN
Text GLabel 6200 4400 2    50   Input ~ 0
SENSE
Wire Wire Line
	6200 4300 6100 4300
Wire Wire Line
	6100 4400 6200 4400
$Comp
L MCU_Microchip_ATmega:ATmega328P-AU U2
U 1 1 5D6BED3A
P 5500 3600
F 0 "U2" H 5150 5150 50  0000 C CNN
F 1 "ATmega328P-AU" H 5100 5050 50  0000 C CNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 5500 3600 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 5500 3600 50  0001 C CNN
	1    5500 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5D6C2976
P 8700 1750
F 0 "R9" V 8500 1850 50  0000 R CNN
F 1 "R" V 8600 1800 50  0000 R CNN
F 2 "Resistors_SMD:R_1206" V 8630 1750 50  0001 C CNN
F 3 "~" H 8700 1750 50  0001 C CNN
	1    8700 1750
	0    1    1    0   
$EndComp
Text GLabel 8500 1750 0    50   Input ~ 0
KLINE_TX
Wire Wire Line
	8900 1750 8850 1750
Wire Wire Line
	8550 1750 8500 1750
Wire Wire Line
	8500 2250 10100 2250
Connection ~ 10100 2250
Wire Wire Line
	10100 2250 10100 2300
$EndSCHEMATC
