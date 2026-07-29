import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure DegenerateDiffusionOperator where
  domain : Type u
  functionSpace : Type v
  principalSymbol : Type w
  degeneracySet : Prop
  ellipticityCondition : Prop
  principalSymbolDegenerate : degeneracySet -> Prop
  degeneracySetClosed : degeneracySet
  ellipticityConditionClosed : ellipticityCondition

structure DegenerateDiffusionEvidence (A : DegenerateDiffusionOperator) where
  degeneracySetClosed : A.degeneracySet
  ellipticityConditionClosed : A.ellipticityCondition

def DegenerateDiffusionClosed (A : DegenerateDiffusionOperator) : Prop :=
  A.degeneracySet ∧ A.ellipticityCondition

theorem degenerate_diffusion_closed_from_evidence (A : DegenerateDiffusionOperator)
    (E : DegenerateDiffusionEvidence A) : DegenerateDiffusionClosed A := by
  exact And.intro E.degeneracySetClosed E.ellipticityConditionClosed

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse