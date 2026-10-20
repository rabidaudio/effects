# Buzz

> A Muff-style fuzz pedal with adjustable midrange


All components are standard and generic. Gerbers for PCB are in the repo [1](gerbers_main_revd.zip) [2](gerbers_switchboard_revd.zip), as well as [case graphics](case/graphics_rendered.pdf) and [drill locations](case/36177_125B_buzz.txt) which can be ordered on [Tayda](https://drill.taydakits.com/dashboard). Cost of components are around $40 per unit at small quantites.

## Assembly instructions

1. Solder silicon components (BJTs, diodes) *except* LED.
2. Solder capacitors *except* electrolytic.
3. Solder resistors.
4. Add leads for power. Keep them long, you can always make them shorter later.
5. Solder jacks, to the *back side* of the board (the opposite side from the components). Make sure they sit flush with the PCB.
6. Place the potentiometers in the PCB, but *don't solder them yet.* Note that one of the pots is linear (B100K) rather than log (A100K). Asbemble the PCB into the enclosure with the pots through their respective holes. Loosely screw the jacks and pots into place. Once everything is aligned nicely, solder the pots while the board is still in the enclosure.
7. Unscrew the jacks and pots and remove the PCB from the enclosure.
8. Test circuit. Clip power supply to power leads, and input signal to the exposed leg of R1 (the 33k resistor between where the jacks will go). Check for a signal on each of the test points (AC coupling will remove the normal DC offset from these signals).
9. Solder the stomp switch into the daughter board. Solder the ribbon cable to the main board and then the daughter board, ensuring the proper orientation (square pad to square pad). 4-6 inches of ribbon recommended.
10. Place the LED into place but *don't solder it or clip the legs yet* Place the PCB into the case and screw down pots, jacks, and stomp switch. Attach securely but don't over-tighten. Align the LED with the hole in the case, and solder in place.
11. Insert and screw down the DC jack. Attach the power leads to the DC jack, shortening the leads if necessary. Extra length will make future dissasembly easier and there's plenty of room in the case for extra cable.
12. Supply power and test the DC jack, stomp switch, and LED by ensuring the LED turns off and on with the switch.
