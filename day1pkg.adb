package body day1pkg is
   -- Input: Integer x
   -- Output: floor(x / 3) - 2
   function Mass_To_Fuel (mass: Integer) return Integer is
   begin
      return (mass / 3) - 2;
   end Mass_To_Fuel;
   
   -- Input: Array of Integers
   -- Output: Sum of all arrays vals through Mass_To_Fuel
   function Sum_Vec_Mass_To_Fuel (Int_Vec: Integer_Vector.Vector) return Integer is
      Final_Sum : Integer := 0;
   begin
      for E of Int_Vec loop
         Final_Sum := Final_Sum + Mass_To_Fuel(E);
      end loop;
      return Final_Sum;
   end Sum_Vec_Mass_To_Fuel;

end day1pkg;
