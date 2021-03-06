with Math.Matrices;
with math.Quaternions;
with math.Planes;
with math.Angles;
with math.Vectors;
with Navigation.Motion_Component;

package Simulator.Pid_Errors is

   type CPidErrors is tagged private;
   type pCPidErrors is access CPidErrors;
   type EMotionComponent is new Navigation.Motion_Component.EMotionComponent;
   type TPIDErrors is array (X .. DriftZ) of float;

   function pxCreate return pCPidErrors;
   procedure Free(pxPidErrors: in out pCPidErrors);
   procedure Update_Errors(this : in out CPidErrors ; xCurrentAbsolutePosition : math.Vectors.CVector ; xWantedAbsolutePosition : math.Vectors.CVector ; xVelocityVector : math.Vectors.CVector; xCurrentAbsoluteOrientation : math.Matrices.CMatrix; xWantedAbsoluteOrientation : math.Matrices.CMatrix);
   function fGet_PID_Error_For_Component(this : in CPidErrors; eErrorComponent : in EMotionComponent) return float;





private
   procedure Update_Current_Drift_Errors(this : in out simulator.Pid_Errors.CPidErrors; xWantedAbsolutePosition : math.Vectors.CVector; xCurrentAbsolutePosition : math.Vectors.CVector; xVelocityVector : math.Vectors.CVector; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) ;
   procedure Update_Current_Orientational_Errors(this : in out simulator.Pid_Errors.CPidErrors ; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix ; xWantedAbsoluteOrientation : math.Matrices.CMatrix);
   procedure Update_Current_Positional_Errors(this : in out simulator.Pid_Errors.CPidErrors ; xWantedAbsolutePosition : math.Vectors.CVector ; xCurrentAbsolutePosition : math.Vectors.CVector; xCurrentAbsoluteOrientationInverse : math.Matrices.CMatrix) ;


   type CPidErrors is tagged
      record
         tfPIDErrors : TPIDErrors := (others => 0.0);
      end record;


end Simulator.Pid_Errors;
