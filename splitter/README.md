# Splitter

Route certain frequencies through a different effects chain.

# Use

## Controls

1. Cutoff (7Hz to 7kHz)
2. Send mode switch (highs, all, lows)
3. Wet/Dry mix
4. Bypass switch


### Off

When bypassed (4), IN is connected to OUT (true bypass) and the device is powered off.

### Send mode (2) = center ("full")

This mode can be used to turn a separate parallel effects chain on and off. Mix (3) is a wet/dry blend.

IN is sent to SEND. IN and RECV are mixed and sent to OUT. Cutoff (1) has no effect.

### Send mode (2) = up ("high")

This mode can be used to apply effects only to the high frequencies while keeping the low frequencies clean. This is particularly useful for bass guitar to keep the low end clear and crisp when applying a fuzz effect for example.

This mode sends the high frequencies from IN to SEND (wet channel) and mixes (3) the RECV with the low frequencies from IN (dry channel). The cutoff controls the frequency separating low and high.

### Send mode (2) = down ("low")

Like above but the wet and dry are reversed. This mode can be used to apply effects only to the low frequencies while keeping the high frequencies clean. 

This mode sends the low frequencies from IN to SEND (wet channel) and mixes (3) the RECV with the high frequencies from IN (dry channel). The cutoff controls the frequency separating low and high.

# Design

<!-- TODO link to schematic -->

TLE2426 provides a signal ground between 0 and 9V, providing a dual-ended 4.5V power supply for the op-amp from a 9V battery or DC adapter. DC blocking caps C5, C6, C7, C8, C9, C10 are to separate external grounds (which are likely to be attached to the power supply ground) from the 4.5V virtual ground.

U1B is an input buffer. C1/C2/R1/R2/RV1/U1A act as a variable 2nd-order active high pass filter with a Q of 0.5 and a cutoff from 23Hz to 23kHz. U1D subtracts the high pass signal from the input to get a low pass signal. From there the signals are routed using the switches and jacks. Finally U1C/R7/R8/R11/R12/RV2/R9 mixes the wet and dry signals and buffers them to the output.

Rather than a true LR active crossover filter, this circuit simply subtracts the original signal from the filtered signal to get the opposite frequencies. This creates a comb filter with an uneven phase shift, which means this pedal will have a tonal effect. In addition, the mixer is not linear and will boost one side or the other in extreme settings. Both of these limitations are for cost savings and simplicity. A more robust circuit would use two LR VCFs and two VCAs but this would drastically increase cost and complexity.

A set of jumpers and test points allow reconfiguring the behavior of the circuit. An additional send + receive pair of jacks for the "dry" signal can be added using JP2/J6/J8, while the behavior of the stereo channel can be changed with JP1/J7 and JP3/J9, for example wiring them to a second PCB for stereo support.

# Parts

<!-- TODO: link to bom -->

- 2x 1u electrolytic capacitors
- 2x 6.8n ceramic or mylar capacitors
- 6x 100n ceramic or mylar capacitors
- 2x 1K resistor
- 1x 10K resistor
- 4x 100K resistor
- 4x 1M resistor
- 1x 1.2M resistor
- 1x 5mm LED
- 1x TLE2426 virtual ground IC [DigiKey](https://www.digikey.com/en/products/detail/texas-instruments/TLE2426CLPR/371935)
- 1x TL074 quad op-amp [DigiKey](https://www.digikey.com/en/products/detail/texas-instruments/TL074BCN/378416)
- 1x 14-pin DIP IC holder
- 1x 2x4 2.54mm pin header
- 1x 2x4 2.54mm pin socket
- 1x Alpha 9mm A1M Dual (dual gang audio-taper 1M) pot [Thonk](https://www.thonk.co.uk/shop/alpha-9mm-pots-vertical-t18/)
- 1x Alpha 9mm B10K (linear taper 10K) pot [Thonk](https://www.thonk.co.uk/shop/alpha-9mm-pots-vertical-t18/)
- 1x EG2301 DPDT switch [DigiKey](https://www.digikey.com/en/products/detail/e-switch/EG2301A/301966)
- 1x 3PDT stompbox footswitch [Amazon](https://www.amazon.com/gp/product/B012CF181K)
- 1x 2.1mm Barrel jack [Amazon](https://www.amazon.com/gp/product/B096XJWZJQ)
- 4-6x 1/4" jack 6 pin PCB mount [Amazon](https://www.amazon.com/gp/product/B097BDHV5Y)
- 1x. 125B Case (see below)

## Case

Any 125B case will work, but you can get drilled and decal'ed cases from [Tayda](https://www.taydaelectronics.com) for around $15 apiece. Use these design files:

- [Drill (main design)](https://drill.taydakits.com/box-designs/new?public_key=VWFDdHg0WjZtU0llTEgrNzh4ZnROUT09Cg==)
- [Drill (including second send/recv)](https://drill.taydakits.com/box-designs/new?public_key=U0xLeFEvaS9jQ1luY0pLTkMvenRyUT09Cg==)
- [UV printing](./graphics//drawing-rendered.pdf)

# Assembly instructions

1. Solder jumpers JP1, JP2, and JP3 closed
2. Solder resistors, capacitors, TLE2426, and IC holder
3. Solder 9 wires from PCB to SW2 and two wires to power supply pins, both coming out the back side of the board
4. Solder the jacks on the back side of the board
5. Insert TL074 into IC holder. Place SW1, the pots, and the LED in board but don't solder them yet. Align the parts with the case. Put the LED through the whole and hold it in place with a bit of electrical tape. Attach the pots and jacks to the case. When everything is aligned properly and flush, solder the LED, pots, and SW1
6. Attach DC jack to case and solder power wires

<!-- TODO document 3 modes and special instructions for each -->

No calibration required

# Credits

Bacteria graphics from [free-vectors.net](https://free-vectors.net/healthcare/set-of-bacteria-and-virus-icon). Font: Trattatello
