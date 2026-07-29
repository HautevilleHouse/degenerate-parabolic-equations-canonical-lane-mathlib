import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure WellPosednessPackage where
  pde : DegenerateParabolicPDEPackage
  existence : Prop
  uniqueness : Prop
  stability : Prop
  regularizingEffect : Prop

structure WellPosednessEvidence (W : WellPosednessPackage) where
  existenceClosed : W.existence
  uniquenessClosed : W.uniqueness
  stabilityClosed : W.stability
  regularizingEffectClosed : W.regularizingEffect

def WellPosednessClosed (W : WellPosednessPackage) : Prop :=
  W.existence ∧ W.uniqueness ∧ W.stability ∧ W.regularizingEffect

theorem well_posedness_closed_from_evidence (W : WellPosednessPackage) (E : WellPosednessEvidence W) : WellPosednessClosed W := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed (And.intro E.stabilityClosed E.regularizingEffectClosed))

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse