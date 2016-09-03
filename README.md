A brainfuck self-interpreter, primarily designed for small size. Supports non-negative address space, and provides a combined (code + memory) data space of about half the space provided to the self-interpreter.

At some point a design decision was made that decreased size, but resulted in a huge hit in performance; I decided to leave the faster version as interpreter\_fast.

The current size is 569 instructions.
