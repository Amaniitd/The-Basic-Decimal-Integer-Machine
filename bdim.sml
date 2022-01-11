


val maxMemSize = 10
val mem = Array.tabulate(maxMemSize, fn c => 0)




(* Debugger functions *)

fun print1s(s) = ((print(Char.toString s ^" ");true))
fun printsl([]) = true
        | printsl(h::t) = print1s(h) andalso printsl(t)



fun isBool value = 
  if value = 1 orelse value = 0 then
    true
  else 
    false

fun numToBool value = 
  if value = 1 then
    true
  else
    false



fun isInt value = 
  let val valueCharList = explode value
  in 
    length (List.filter (Char.isDigit) valueCharList) = length valueCharList
  end;



fun read file=
    let val input=TextIO.openIn file
      val content=TextIO.inputAll input
      val lines = String.tokens (fn c => c = #"\n") content
    in 
      TextIO.closeIn input;
      Vector.fromList(lines)
    end;




fun lineParser line = 
  let val tmp1 = String.tokens (fn c => c = #",") line
      val tmp2 =  Vector.fromList(tmp1)
      val operator = String.substring(Vector.sub(tmp2, 0), 1, String.size(Vector.sub(tmp2, 0)) -1 )
      val opd1 = Vector.sub(tmp2, 1)
      val opd2 = Vector.sub(tmp2, 2)
      val tgt = String.substring(Vector.sub(tmp2, 3), 0, String.size(Vector.sub(tmp2, 3)) -1 )

  in
    Vector.fromList(operator::opd1::opd2::tgt::nil)
  end;




fun LastlineParser line = 
  let val tmp1 = String.tokens (fn c => c = #",") line
      val tmp2 =  Vector.fromList(tmp1)
      val operator = String.substring(Vector.sub(tmp2, 0), 1, String.size(Vector.sub(tmp2, 0)) -1 )
      val opd1 = Vector.sub(tmp2, 1)
      val opd2 = Vector.sub(tmp2, 2)
      val tgt = String.substring(Vector.sub(tmp2, 3), 0, String.size(Vector.sub(tmp2, 3)) -1 )

  in
    Vector.fromList(operator::opd1::opd2::tgt::nil)
  end;

fun operatorFunction (operator, opd1, opd2, tgt) = 
  if operator = "0" then
    ~2
  else 
  if operator = "1" then(
    Array.update(mem, valOf(Int.fromString(tgt)), valOf(Int.fromString(opd1)));
    ~1
  )
  else if operator = "2" then(
    Array.update(mem, valOf(Int.fromString(tgt)), Vector.sub(mem, valOf(Int.fromString(opd1))));
    ~1
  )
  else if operator = "3" then(
    ~1
  )
  else if operator = "4" then(

  )
  else if operator = "5" then(

  )
  else if operator = "6" then(
    Array.update(mem, valOf(Int.fromString(tgt)), Vector.sub(mem, valOf(Int.fromString(opd1))) + Vector.sub(mem, valOf(Int.fromString(opd2))));
    ~1
  )
  else if operator = "7" then(
    Array.update(mem, valOf(Int.fromString(tgt)), Vector.sub(mem, valOf(Int.fromString(opd1))) - Vector.sub(mem, valOf(Int.fromString(opd2))));
    ~1
  )
  else if operator = "8" then(
    Array.update(mem, valOf(Int.fromString(tgt)), Vector.sub(mem, valOf(Int.fromString(opd1))) * Vector.sub(mem, valOf(Int.fromString(opd2))));
    ~1
  )
  else if operator = "9" then(

  )
  else if operator = "10" then(

  )
  else if operator = "11" then(

  )
  else if operator = "12" then(

  )
  else if operator = "13" then(

  )
  else if operator = "14" then(

  )
  else if operator = "15" then(

  )
  else if operator = "16" then(

  )
  else
    ~1



  


fun interpret (filename) = 
    let val input = read filename
      val i = ref 0
      val inputSize = Vector.length(input)
      val s = ref ""
    in
      while !i < 1 do(
          s := Vector.sub(input, !i);
          lineParser(!s);
          i := !i + 1
        )
    end;

interpret("ap.bdim");
operatorFunction("1", "2", "2", "2");
Array.sub(mem, 2);