


val maxMemSize = 10
val mem = Array.tabulate(maxMemSize, fn c => 0)




(* Debugger functions *)

fun print1s(s) = ((print(Char.toString s ^" ");true))
fun printsl([]) = true
        | printsl(h::t) = print1s(h) andalso printsl(t)





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
      val op = String.substring(Vector.sub(tmp2, 0), 1, 1)
      val s1 = Vector.sub(tmp2, 0)
      val s2 = Vector.sub(tmp2, 0)
      val s3 = String.substring(Vector.sub(tmp2, 0), 0, 1)


  in
    print(op)
  end;




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