# Assignmant: The Basic Decimal Integer Machine
The following table is the instruction set of a very Basic Decimal Integer Machine (BDIM) which may be used to
do simple integer computations. There are no other data types and no structured data types. An interpreter which 
reads in the instructions (one per line) from a program file <filename>.bdim.

  - We use positive integer op-codes. The special opcode 0 denotes a halt instruction. Programs halt on
  seeing this opcode.

  - Assume that code is a vector (read-only) of quadruples called three-address code. For each value c in the
  range of indices of the vector code[c] denotes the quadruple at index c. Each quadruple is an instruction
  of the BDIM machine.

  - Assume that memory is an array (with a fixed maximum size pre-defined by a value maxMemSize)
  mem[0..maxMemSize-1] of integers. The entire memory consists of registers. For each i in the range
  0 to maxMemSize-1, mem[i] denotes the value stored at index i

  - **Constant literals**. The operand v denotes a constant integer value (e.g. for reading input from the
  terminal). Inputs are read only one value at a time. So for each value a separate instruction needs
  to be written.

    **Constant internal**. Unlike input constant literals these are constant values required to be stored as part
      of the code of the program (e.g. initializations).

    **Memory access**. The operands i, j and k of any operation are indexes into mem.

    **Code access**. The operand c denotes an index into the code-segment code. Clearly if vector-bounds are
      not respected the program halts.

  - An underscore “_” (in the table below) denotes an inessential operand is a wild-card and could be any
  integer and is ignored for the purposes of that instruction. But in any actual program there needs to be
  an actual integer value, since all instructions are of type int*int*int*int.

  - Every operand that is not “_” is an essential operand and should have only non-negative values.

  - Assume that the maximum integer that can be read, stored or printed are limited by whatever your
  machne allows for the integer dataype (e.g. valOf(Int.maxInt)).
  
  
  ## OP CODES
  
  ![op codes](https://user-images.githubusercontent.com/58507582/149345102-6a0d6d67-ef55-420a-89b6-1dbf932f121b.png)
  
  ## Format of BDIM files:
  
    - Each instruction is a quadruple (op, opd1, opd2, tgt) of 4 non-negative integers representing respectively the operation op to be performed on operands opd1 and opd2 whose result is stored in tgt.
    - Boolean values are represented by 0 for false and 1 for true respectively.
    - each program has an output instruction to print the result of executing the program.
  
    - each line of the program file contains exactly one quadruple.
  
    - there are no blank lines (especially at the end of the file).
  
  ## Test Cases:
  
  ### abs.bdim
  > Finding the absolute value of an integer. Take an integer as input and produce it's absolute value as output.
  
  ### ap.bdim
  > Given inputs a, d, n, to compute the sum of the arithmetic progression of n integers starting from a with a common difference of d.
  
  ### fact.bdim 
  > Finding the factorial of a given non-negative integer.
  
  ### fib.bdim
  > Finding the value of the fibonacci number given that f ib(0) = 0 and f ib(1) = 1
### gcd.bdim
  > BDIM program to compute the gcd of two integers.
### reverse.bdim
  > BDIM program to compute the integer value obtained by reversing the digits of a given input non-negative integer.
### russian.bdim
  > The russion multiplication algorithm for multiplying two numbers defined by the following SML code.
  ```
    fun russianMult (x, y) =
      if ((x = 0) orelse (y = 0)) then 0
      else
        let val twox = 2*x
            val halfy = y div 2
        in if (y mod 2 = 0)
            then russianMult (twox, halfy)
           else x + russianMult (twox, halfy)
      end
  ```
  ### fib.bdim
  > Print first n fibonacci numbers.
  
