-- Target behavior:
-- Input: file name, contains list of numbers separated by \n
-- Output: For each number x, floor(x / 3) - 2, return sum
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Unbounded_Vector; use Unbounded_Vector;
with day2pkg; use day2pkg;
procedure day2 is 
   -- Declarations
   File_Vec : String_Vector.Vector;
   Opcode_String : Unbounded_String;
   Program_Vec : Integer_Vector.Vector;
   
   File_Name : constant String := "day2.txt";
   subtype NounVerb is Integer range 0..99;
   Program_Result : Integer := 0;
   package SUIO renames Ada.Text_IO.Unbounded_IO;
begin   
   -- Read file and put it into an integer vector
   Read_File_To_Vec(File_Name, File_Vec);
   Opcode_String := File_Vec(0);
   -- Day2 specific -> convert the opcode string into a vector of integers split by comma
   Opcode_To_Int_Vec(Opcode_String, Program_Vec);
   
   -- Try all values of noun and verb to find which combination produces 19690720
   Main_Cycle:
   for noun in NounVerb'Range loop
      for verb in NounVerb'Range loop
         -- Copy required since we modify the program during this process
         -- Run the program on this combination of noun and verb
         Program_Result := Execute_Opcode(Program_Vec, noun, verb);
         -- Found the correct result
         if Program_Result = 19690720 then
            Put_Line("Noun: " & Noun'Image 
                     & " Verb: " & Verb'Image 
                     & " Result: " & Program_Result'Image
                    & " Answer: " & Integer'(100 * noun + verb)'Image);
            -- Breaking out of nested loops
            exit Main_Cycle;
         end if;
      end loop;
   end loop Main_Cycle;
end day2;
