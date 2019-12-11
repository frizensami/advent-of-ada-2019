with Unbounded_Vector; use Unbounded_Vector;

package day2pkg is
   function Execute_Opcode
     (Program_Vec: in out  Integer_Vector.Vector; Noun: Integer; Verb: Integer)
      return Integer;
end day2pkg;
