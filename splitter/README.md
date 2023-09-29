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

## Advanced: configurable behaviors

By default, one portion is sent through the send-receive effects channel while the other remains dry. The wet and dry signals are then blended together. However, it's also possible to send both separated parts through separate send/receive channels. There's two ways to do this, covered below.

The jacks used are technically stereo jacks. Several behavior modes for controlling the stereo behavior of the jacks.

1. Single-send mono mode. In this mode, all signals are mono (just the tip). Right channel inputs/outputs are unused (grounded or not connected). Only the selected portion of the signal (high, full, low) is sent through send/receive chain while the other portion is left dry.
2. Single-send stereo pass-thru mode. Like mode 1, in this mode the selected portion of the signal is sent through the left channel of the send/receive chain. However, all 4 jacks are stereo. The right channel is fully switched between true bypass and the right channel of the send-receive, however no splitting is done on the right channel.
3. Dual-send mono mode. In this mode, there are two parallel send/receive channels, using 6 jacks instead of 4. The selected portion of the signal (high, full, low) is sent through one pair while the remaining portion (low, full, high) is sent through the opposite pair. All jacks are mono.
4. Dual-send stereo pass-thru mode. This mode behaves like mode 3 (6 jacks, second send/receive pair are mono), however the right channel behaves like mode 2 (full signal is switched between true bypass and through send/receive 1).
5. Dual-send stereo mode. In this mode, the behavior of mode 3 is done using 4 stereo jacks. The selected portion is sent through the left channel (tip) of the send/receive pair, while the remaining portion is sent through the right channel (sleeve). In and out jacks are mono.

This is some complex behavior which is unlikely to matter in most cases (since guitar effects are typically mono). If you're unsure, use mode 4 if you need parallel send/receive channels, and mode 2 otherwise. 

# Parts

<!-- TODO: link to bom -->
<!-- TODO: purchase electrolytic caps, 1.2M resistors -->

- 2x 1u electrolytic capacitors
- 2x 6.8n ceramic or mylar capacitors
- 6x 100n ceramic or mylar capacitors
- 2x 1K resistor
- 1x 10K resistor
- 4x 100K resistor
- 2x 1M resistor
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

1. Start with soldering the jumpers based on the selected mode [above](#advanced-configurable-behaviors):
   - Single-send mono: Solder JP1 closed, leave JP2 and JP3 unsoldered
   - Single-send stereo pass-thru mode: Solder JP1 closed, solder pins 1 to 2 of JP2 and JP3 (center pin to pin with arrow on it)
   - Dual-send mono: leave all jumpers unsoldered
   - Dual-send stereo pass-thru: leave JP1 open, solder pins 1 to 2 of JP2 and JP3 (center pin to pin with arrow on it)
   - Dual-send stereo: leave JP1 open, solder pins 2 to 3 of JP2 and JP3 (center pin to pin without arrow)
2. Place and solder resistors, capacitors, transistor, and IC holder. _Do not_ solder LED, pots, jacks, or slide switch yet. The electrolytic capacitors C9 and C10 are polarized, so make sure you orient them correctly. The LED resistor, R7, can be adjusted for consistent brightness depending on the color of the LED. For red and blue, use 10K. For yellow, 1K. For white and green, 33K.
3. Solder the female headers on the back of the board, and the male headers and stomp switch to secondary board. They should be on the same side. Solder lead wires for the power adapter to the board.

From here on, the order of operations is critical. Take a break here, and read the rest of the directions through before continuing.

4. Solder the jacks to the back side of the board. If you're using [modes 3 or 4](#advanced-configurable-behaviors), populate all 6 jacks. Otherwise populate only 4 jacks, leaving out the ones at the top of the board opposite the pots. Be sure to make them completely flush with the board. You may need to cut some of the component leads very close to the board in order to get them flush. The center pins opposite R5, R6, and C7 can be hard to access around the components; you can skip them if needed as they are both no-connect.
5. Cut the tabs off the bottom of the pots. Place the TL074 in the IC holder. Place the pots, slide switch, and LED into place but **don't solder them yet.** The LED is polarized, the longer leg (the anode) goes on the positive side. The LED needs to sit on top of the IC.
6. Place the board into the case. Ensure the pots, switch, and LED are seated correctly. The switch is shorter than the pots; you may want to push the switch up so that the pins are flush with the bottom of the board to maximize the amount of the switch sticking through the case. Loosely screw the jacks into place. Once you've confirmed the pots, switch, and LED are seated correctly, solder them in place.
7. Screw down the pots. Tighten the jacks. Attach the stomp switch board, ensure it's completely connected, and screw it down (solidly but not too tightly as it may bend the board).
8. Screw down the DC adapter and solder the power wires to it. If you're soldering the wires outside the case before screwing it down, be sure to put the wires through the nut and case before soldering.
9. Attach the knobs to the pots. Screw down the back case.


# Credits

Bacteria graphics from [free-vectors.net](https://free-vectors.net/healthcare/set-of-bacteria-and-virus-icon). Font: Trattatello
