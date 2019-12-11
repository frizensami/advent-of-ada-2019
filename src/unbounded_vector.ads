with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
With Ada.Text_IO.Unbounded_IO;
with Ada.Command_Line; use Ada.Command_Line;

-- Reference: https://zhu-qy.blogspot.com/2012/06/ada-unbounded-string-and-vector.html?m=1

-- Defines vectors of unbounded strings, and integers, plus file ops
package Unbounded_Vector is
   -- Declare a vector of unbounded strings
   package String_Vector is new Ada.Containers.Vectors 
     (Natural, Unbounded_String);
   use String_Vector;
   
   -- Declare a vector of just integers
   package Integer_Vector is new Ada.Containers.Vectors 
     (Natural, Integer);
   use Integer_Vector;
 
   -- Given a filename, reads strings line by line to vector
   procedure Read_File_To_Vec 
     (File_Name: String; File_Vector: in out String_Vector.Vector);
   
   -- Given a vector of unbounded strings, prints them all to screen
   procedure Print_Vec (File_Vector: String_Vector.Vector);
   
   -- Given a vector of unbounded strings, converts them to a vector of ints
   procedure File_Vec_To_Int_Vec 
     (File_Vector: String_Vector.Vector; Int_Vector: in out Integer_Vector.Vector);
   
   -- Converts an opcode string (day2) to a vector of integers
   procedure Opcode_To_Int_Vec
     (Opcode_String: Unbounded_String; Int_Vector: in out Integer_Vector.Vector);
end Unbounded_Vector;
