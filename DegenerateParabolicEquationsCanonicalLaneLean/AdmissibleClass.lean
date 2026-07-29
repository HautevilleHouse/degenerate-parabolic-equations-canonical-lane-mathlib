import DegenerateParabolicEquationsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure AdmissibleClass where
  object : DegenerateParabolicAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DegenerateParabolicWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse