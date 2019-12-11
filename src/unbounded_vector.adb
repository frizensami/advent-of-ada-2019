package body Unbounded_Vector is
   
   -- Given a filename, reads strings line by line to vector
   procedure Read_File_To_Vec 
     (File_Name: String; File_Vector: in out String_Vector.Vector) is
      -- Declarations
      InputFile : File_Type;
      package SUIO renames Ada.Text_IO.Unbounded_IO;
   begin
      -- Open file, handle is called InputFile
      Open(File => InputFile,
           Mode => In_File,
           Name => File_Name);
      -- For each line, add it to the File_Vector
      loop
         File_Vector.Append(SUIO.Get_Line(InputFile));
      end loop;
      -- Catches exception from SUIO.Get_Line EOF
   exception
      when End_Error =>
         null;
   end Read_File_To_Vec;
   
   -- Given a vector of unbounded strings, prints them all to screen   
   procedure Print_Vec (File_Vector: String_Vector.Vector) is
      package SUIO renames Ada.Text_IO.Unbounded_IO;
   begin
      for E of File_Vector loop
         SUIO.Put_Line(E);
      end loop;
   end Print_Vec;

   -- Given a vector of unbounded strings, converts them to a vector of ints
   procedure File_Vec_To_Int_Vec 
     (File_Vector: String_Vector.Vector; Int_Vector: in out Integer_Vector.Vector) is
   begin 
      for E of File_Vector loop
         Int_Vector.Append(Integer'Value(To_String(E)));
      end loop;
   end File_Vec_To_Int_Vec;
   
   -- Converts an opcode string (day2) to a vector of integers
   procedure Opcode_To_Int_Vec
     (Opcode_String: Unbounded_String; Int_Vector: in out Integer_Vector.Vector) is
      Opcode : String := To_String(Opcode_String) & ",";
   Current : Integer := Opcode'First;
   begin
      for i in Opcode'Range loop
         if Opcode(i) = ',' or i = Opcode'last then
            Int_Vector.append(Integer'Value(Opcode(Current..i-1)));
            Current := i + 1;
         end if;                     
      end loop;
   -- To test print
   -- for s of Int_Vector loop put(s'Image & '.'); end loop;
   end Opcode_To_Int_Vec;
   
end Unbounded_Vector;
