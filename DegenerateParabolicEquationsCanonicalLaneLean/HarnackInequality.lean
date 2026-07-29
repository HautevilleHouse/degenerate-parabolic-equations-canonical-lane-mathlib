import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure HarnackInequalityPackage where
  pde : DegenerateParabolicPDEPackage
  harnackEstimate : Prop
  exponentialDecay : Prop
  couplingParameter : Type

structure HarnackInequalityEvidence (H : HarnackInequalityPackage) where
  harnackEstimateClosed : H.harnackEstimate
  exponentialDecayClosed : H.exponentialDecay

def HarnackInequalityClosed (H : HarnackInequalityPackage) : Prop :=
  H.harnackEstimate ∧ H.exponentialDecay

theorem harnack_inequality_closed_from_evidence (H : HarnackInequalityPackage) (E : HarnackInequalityEvidence H) : HarnackInequalityClosed H := by
  exact And.intro E.harnackEstimateClosed E.exponentialDecayClosed

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse