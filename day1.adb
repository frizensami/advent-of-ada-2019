-- Target behavior:
-- Input: file name, contains list of numbers separated by \n
-- Output: For each number x, floor(x / 3) - 2, return sum
with Ada.Text_IO; use Ada.Text_IO;
with Unbounded_Vector; use Unbounded_Vector;
with day1pkg; use day1pkg;
procedure day1 is 
   -- Declarations
   File_Vec : String_Vector.Vector;
   Int_Vec : Integer_Vector.Vector;
   File_Name : constant String := "day1.txt";
begin   
   -- Read file and put it into an integer vector
   Read_File_To_Vec(File_Name, File_Vec);
   -- Print_Vec(File_Vec);
   File_Vec_To_Int_Vec(File_Vec, Int_Vec);
   Put_Line(Sum_Vec_Mass_To_Fuel(Int_Vec)'Image);
end day1;
