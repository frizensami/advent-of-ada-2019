with Ada.Text_IO;

package body day2pkg is
   function Execute_Opcode
     (Program_Vec: in out  Integer_Vector.Vector; Noun: Integer; Verb: Integer)
      return Integer is
      Opcode_Index : Natural := 0;
      Opcode : Integer := Program_Vec(Opcode_Index);
   begin
      -- As required: replace position 1 with the value 12
      --   and replace position 2 with the value 2
      Program_Vec(1) := Noun;
      Program_Vec(2) := Verb;

      -- Execute opcode until end opcode (99) is found
      while Opcode /= 99 loop
         declare
            Operand1_Location : Integer := Program_Vec(Opcode_Index + 1);
            Operand2_Location : Integer := Program_Vec(Opcode_Index + 2);
            Store_Location : Integer := Program_Vec(Opcode_Index + 3);
            Operand1 : Integer := Program_Vec(Operand1_Location);
            Operand2 : Integer := Program_Vec(Operand2_Location);
         begin
            case Opcode is
               when 1 => Program_Vec(Store_Location) := Operand1 + Operand2;
               when 2 => Program_Vec(Store_Location) := Operand1 * Operand2;
               when others => null;
            end case;
            -- Move to next opcode (4 down)
            Opcode_Index := Opcode_Index + 4;
            Opcode := Program_Vec(Opcode_Index);
         end;
      end loop;

      -- Print first element
      declare
         First_Element : Integer := Program_Vec(0);
      begin
         -- Ada.Text_IO.Put_Line("Position 0 contains: " & First_Element'Image);
         return First_Element;
      end;
   -- Constraint error occurs with an invalid program - indicate failure
   exception
      when Constraint_Error =>
         return -1;
   end Execute_Opcode;
end day2pkg;
