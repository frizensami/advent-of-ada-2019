with Unbounded_Vector;
use Unbounded_Vector;

package day1pkg 
with SPARK_Mode => On
is
   function Mass_To_Fuel (mass: Integer) return Integer
     with
       Global => null,
       Depends => (Mass_To_Fuel'Result => mass),
     Pre => (mass / 3) - 2 < Integer'Last,
     Post => Mass_To_Fuel'Result = (mass / 3) - 2;
   
   
   function Sum_Vec_Mass_To_Fuel (Int_Vec: Integer_Vector.Vector) return Integer
     with
       SPARK_Mode => Off;
end day1pkg;
