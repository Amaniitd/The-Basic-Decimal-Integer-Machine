# Assignmant: The Basic Decimal Integer Machine
The following table is the instruction set of a very Basic Decimal Integer Machine (BDIM) which may be used to
do simple integer computations. There are no other data types and no structured data types. You are supposed
to design an interpreter which reads in the instructions (one per line) from a program file <filename>.bdim.

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

  - Each instruction is a quadruple (op, opd1, opd2, tgt) of 4 non-negative integers representing respectively the operation op to be performed on operands opd1 and opd2 whose result is stored in tgt.

  - Boolean values are represented by 0 for false and 1 for true respectively.

  - An underscore “ ” (in the table below) denotes an inessential operand is a wild-card and could be any
  integer and is ignored for the purposes of that instruction. But in any actual program there needs to be
  an actual integer value, since all instructions are of type int*int*int*int.

  - Every operand that is not “ ” is an essential operand and should have only non-negative values.

  - Assume that the maximum integer that can be read, stored or printed are limited by whatever your
  machne allows for the integer dataype (e.g. valOf(Int.maxInt)).
  
  
  ## OP CODES
  
  ![op codes](https://user-images.githubusercontent.com/58507582/149345102-6a0d6d67-ef55-420a-89b6-1dbf932f121b.png)
