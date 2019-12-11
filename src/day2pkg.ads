with Unbounded_Vector; use Unbounded_Vector;
with Ada.Containers; use Ada.Containers;
-- Have to turn off SPARK_Mode: exception handlers and things involving Vector can't be proved
package day2pkg
with SPARK_Mode => Off is
   function Execute_Opcode
     (Program_Vec: Integer_Vector.Vector; Noun: Integer; Verb: Integer)
      return Integer with
     Global => null,
     Depends => (Execute_Opcode'Result => (Program_Vec, Noun, Verb));
end day2pkg;
