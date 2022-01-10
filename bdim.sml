


val maxMemSize = 10
val mem = Array.tabulate(maxMemSize, fn c => 0)

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
  let val chars = explode line 
  in
    printsl(chars)
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