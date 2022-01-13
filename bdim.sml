(*---------------------------
Name: COL226 Assignment 1 : The Basic Decimal Integer Machine
File: Bdim.sml
-----------------------------
Author: Aman Kumar
Data:   13/1/2022, 4:07:54 pm
---------------------------- *)


(* Global variable for memory size and memory array *)
val maxMemSize = 100;
val mem = Array.tabulate(maxMemSize, fn c => 0);




(* To check if a given number belongs to {0, 1} or not *)
fun isBool value = 
  if value = 1 orelse value = 0 then
    true
  else 
    false;


(* Convert a number into bool *)
fun numToBool(0) = false 
        | numToBool(x) = true;
  

(* Convert a bool into number *)
fun boolToNum(true) = 1 
        | boolToNum(false) = 0;


(* Checks if a string can be converted into non-negative int or not *)
fun isWholeNumber value = 
  let val x = explode value
  in 
    length (List.filter (Char.isDigit) x) = length x
  end;


(* fun isIntHelper (#"~"::x) = length (List.filter (Char.isDigit) x) = length x 
          | isIntHelper(x) = length (List.filter (Char.isDigit) x) = length x;

fun isInt value = 
  let val x = explode value
  in 
    isIntHelper(x)
  end; *)


(* Or operation for bool *)
fun boolOr(a, b) = 
  if a + b = 2 then 
    1
  else 
    a + b;


(* And operation for bool  *)
fun boolAnd(a, b) = 
  if a + b = 2 then 
    1
  else 
    0;


(* reads the given file and output a Vector of containing each lines *)
fun read file=
    let val input=TextIO.openIn file
      val content=TextIO.inputAll input
      val lines = String.tokens (fn c => c = #"\n") content
    in 
      TextIO.closeIn input;
      Vector.fromList(lines)
    end;


(* Operate by checking operator and return ~3 for error, ~2 for halt, line number for goto, else ~1 *)
fun operatorFunction (operator, opd1, opd2, tgt) = 
  let val tmpStr = ref " "
      val tmpInt = ref 0
  in 
    if operator = 0 then(
      ~2
    )
    else if operator = 1 then(
      if tgt >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        print "input: ";
        tmpStr := valOf (TextIO.inputLine TextIO.stdIn);
        tmpInt := valOf (Int.fromString (!tmpStr));
        Array.update(mem, tgt, !tmpInt);
        ~1
      )
    )
    else if operator = 2 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        Array.update(mem, tgt, Array.sub(mem, opd1));
        ~1
      )
    )
    else if operator = 3 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else if isBool(Array.sub(mem, opd1)) then(
        Array.update(mem, tgt, 1 - Array.sub(mem, opd1));
        ~1
      )
      else(
        print("[Error] Type error: Value should be a boolean ");
        ~3
      )
    )
    else if operator = 4 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize orelse opd2 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else if isBool(Array.sub(mem, opd1)) andalso isBool(Array.sub(mem, opd2)) then(
        Array.update(mem, tgt, boolOr(Array.sub(mem, opd1), Array.sub(mem, opd2)));
        ~1
      )else(
        print("[Error] Type error: Value should be a boolean ");
        ~3
      )
    )
    else if operator = 5 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize orelse opd2 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else if isBool(Array.sub(mem, opd1)) andalso isBool(Array.sub(mem, opd2)) then(
        Array.update(mem, tgt, boolAnd(Array.sub(mem, opd1), Array.sub(mem, opd2)));
        ~1
      )else(
        print("[Error] Type error: Value should be a boolean ");
        ~3
      )
    )
    else if operator = 6 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize orelse opd2 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        Array.update(mem, tgt, Array.sub(mem, opd1) + Array.sub(mem, opd2));
        ~1
      )
    )
    else if operator = 7 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize orelse opd2 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        Array.update(mem, tgt, Array.sub(mem, opd1) - Array.sub(mem, opd2));
        ~1
      )
    )
    else if operator = 8 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize orelse opd2 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        Array.update(mem, tgt, Array.sub(mem, opd1) * Array.sub(mem, opd2));
        ~1
      )
    )
    else if operator = 9 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize orelse opd2 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        if Array.sub(mem, opd2) = 0 then(
          print("division by zero\n");
          ~3
        )else(
          Array.update(mem, tgt, Array.sub(mem, opd1) div Array.sub(mem, opd2));
          ~1
        )
      )
    )
    else if operator = 10 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize orelse opd2 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        if Array.sub(mem, opd2) = 0 then(
          print("division by zero\n");
          ~3
        )else(
          Array.update(mem, tgt, Array.sub(mem, opd1) mod Array.sub(mem, opd2));
          ~1
        )
      )
    )
    else if operator = 11 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize orelse opd2 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        Array.update(mem, tgt, boolToNum(Array.sub(mem, opd1) = Array.sub(mem, opd2)));
        ~1
      )
    )
    else if operator = 12 then(
      if tgt >= maxMemSize orelse opd1 >= maxMemSize orelse opd2 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        Array.update(mem, tgt, boolToNum(Array.sub(mem, opd1) > Array.sub(mem, opd2)));
        ~1
      )
    )
    else if operator = 13 then(
      if opd1 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else if Array.sub(mem, opd1) = 1 then(
        tgt
      )
      else if Array.sub(mem, opd1) = 0 then(
        ~1
      )
      else(
        print("[Error] Type error: Value should be a boolean ");
        ~3
      )
    )
    else if operator = 14 then(
      tgt
    )
    else if operator = 15 then(
      if opd1 >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        print(Int.toString(Array.sub(mem, opd1))^"\n");
        ~1
      )
    )
    else if operator = 16 then(
      if tgt >= maxMemSize then(
        print("[Error] Memory overflow ");
        ~3
      )
      else(
        Array.update(mem, tgt, opd1);
        ~1
      )
    )
    else(
      print("[Error] Operator Unidentified ");
      ~3
    )
  end; 


(* Parse the lines from the file and calls operatorFunction *)
fun lineParser line = 
  let val tmp1 = String.tokens (fn c => c = #",") line
      val tmp2 =  Vector.fromList(tmp1)
      val operator = String.substring(Vector.sub(tmp2, 0), 1, String.size(Vector.sub(tmp2, 0)) -1 )
      val opd1 = Vector.sub(tmp2, 1)
      val opd2 = Vector.sub(tmp2, 2)
      val tgt = String.substring(Vector.sub(tmp2, 3), 0, String.size(Vector.sub(tmp2, 3)) -1 )

  in
    if isWholeNumber(operator) andalso isWholeNumber(opd1) andalso isWholeNumber(opd2) andalso isWholeNumber(tgt) then(
      operatorFunction(valOf(Int.fromString(operator)), valOf(Int.fromString(opd1)), valOf(Int.fromString(opd2)), valOf(Int.fromString(tgt)))
    )
    else(
      print("[Error] Negative instructions found ");
      ~3
    )
  end;


fun interpret (filename) = 
    let val input = read filename
      val i = ref 0
      val inputSize = Vector.length(input)
      val s = ref ""
      val tmp = ref 0

    in
      while !i < inputSize do(
          s := Vector.sub(input, !i);
          tmp := lineParser(!s);
          if !tmp = ~2 then(
            i := inputSize
          )
          else if !tmp = ~1 then(
            i := !i + 1
          )
          else if !tmp = ~3 then(
            print("at line ");
            print(Int.toString(!i + 1)^"\n");
            i := inputSize
          )
          else(
            i := !tmp
          )
        )
    end;
