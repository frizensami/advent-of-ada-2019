package body day1pkg 
with SPARK_Mode => On
is
   -- Input: Integer x
   -- Output: floor(x / 3) - 2
   function Mass_To_Fuel (mass: Integer) return Integer is
   begin
      return (mass / 3) - 2;
   end Mass_To_Fuel;
   
   -- Input: Array of Integers
   -- Output: Sum of all arrays vals through Mass_To_Fuel
   function Sum_Vec_Mass_To_Fuel (Int_Vec: Integer_Vector.Vector) return Integer 
     with
       SPARK_Mode => Off
   is
      Final_Sum : Integer := 0;
      Remaining_Fuel_Requirement : Integer := 0;
   begin
      -- For each module on the craft
      for E of Int_Vec loop
         -- Convert it to fuel for a start
         Remaining_Fuel_Requirement := Mass_To_Fuel(E);
         -- While this fuel amount is not 0, calculate amount of fuel required
         --   for the previous amount of fuel added, and add to total.
         while Remaining_Fuel_Requirement > 0 loop 
            Final_Sum := Final_Sum + Remaining_Fuel_Requirement;
            Remaining_Fuel_Requirement := Mass_To_Fuel(Remaining_Fuel_Requirement);
         end loop;
      end loop;
      return Final_Sum;
   end Sum_Vec_Mass_To_Fuel;

end day1pkg;
