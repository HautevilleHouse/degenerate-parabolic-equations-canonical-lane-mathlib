import DegenerateParabolicEquationsCanonicalLaneLean.TheoremStatement
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure DegenerateParabolicSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DegenerateParabolicAdmittedObject where
  space : DegenerateParabolicSpace
  degenerateParabolicEquation : Prop
  weakSolutionExists : Prop
  regularityProperty : Prop
  boundaryCondition : Prop
  conclusion : degenerateParabolicEquation ∧ weakSolutionExists ∧ regularityProperty ∧ boundaryCondition

structure DegenerateParabolicEndgameState where
  object : DegenerateParabolicAdmittedObject

def DegenerateParabolicWitnessClosed (O : DegenerateParabolicAdmittedObject) : Prop :=
  O.conclusion

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse