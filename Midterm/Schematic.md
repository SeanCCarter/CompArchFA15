## Schematic

These are the breakdowns of each component used in the creation of the LED controller.

# Input Conditioner

The most abstract version of the input conditioner actually looks like this:

![Input Conditioner Schematic](./images/Input-Conditioner.png)

This system is a 6 bit counter, that only starts counting when its internal enable signal is high. Since the output to the conditioner is XORed with the input to create the enable signal, this system doesn't start counting untill the input is different from its output - and since the counter is wired to the clock on a flip-flop that holds the output state, its output only changes once the debouncing period is over (when the system counts to 100000b).

- Input: IN (a noisy signal), CLK
- Output: OUT (a no-noisy signal)


Each of those counters is a small self contained module:

![Input Conditioner Schematic](./images/Conditioner-Counter.png)

The counter counts up if its input is high, outtputs high if its own internal state is high, and if the state of its input is high. Q is just its own state. In practice, this allows then to be wired in series, where each one will only count up if all of the previous ones are also high. They also reset to 0 if enable is not true.

-Inputs: In, Enable, CLK
-Outputs: Out, Q


Finally, the bottom of the input conditioner is a J-K flip-flop:

![Input Conditioner Schematic](./images/JK-Flip-Flop.png)

The J-K flip-flop holds state untill the clock goes high. Once it does, if both inputs are high, it flips its state. If J is high, it sets to 1, and if K is high, is resets to 0. This is why they are used in the counter - they are easy to reset, and changing one input switches them from a reset state to a usable state.

-Inputs: J, K, CLK
-Outputs: Q

# Blinker