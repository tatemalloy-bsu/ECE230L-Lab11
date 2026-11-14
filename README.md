# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Hayden Nguyen, Tate Malloy, Peter Kjaer

## Summary

In this lab, we made a ripple counter and a modulo counter and used btnC as the clock for both. The ripple counter is 3 T flip flops where each one is clocked by the last one, so each stage divides by 2. The modulo counter adds 1 with full adders, resets at 6, and flips its output every time it resets.

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
A Modulo Counter divides the clock by 2 times the count because it takes two full counting cycles to complete one full output cycle. The first count changes the output from 0 to 1, and the second count changes it back from 1 to 0.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
Each flip flop is clocked by the one before it on the rising edge. When the first one goes from 0 to 1, that's a rising edge for the next one, so it flips too, and so on down the chain!

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
It is 17 bits, with each stage dividing by 2, so 100 MHz / 2^17 is about 763 Hz, which is much closer to 1 kHz than 16 bits (about 1526 Hz).

