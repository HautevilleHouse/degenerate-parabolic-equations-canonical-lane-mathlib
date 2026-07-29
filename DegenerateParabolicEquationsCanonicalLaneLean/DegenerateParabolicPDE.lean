import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure DegenerateParabolicPDE (A : DegenerateDiffusionOperator) where
  timeVariable : Type u
  solution : Type v
  diffusionTerm : A.principalSymbol -> Prop
  lowerOrderTerms : Prop
  initialCondition : Prop
  boundaryCondition : Prop
  diffusionTermClosed : diffusionTerm
  lowerOrderTermsClosed : lowerOrderTerms
  initialConditionClosed : initialCondition
  boundaryConditionClosed : boundaryCondition

structure DegenerateParabolicEvidence {A : DegenerateDiffusionOperator} (P : DegenerateParabolicPDE A) where
  diffusionTermClosed : P.diffusionTerm
  lowerOrderTermsClosed : P.lowerOrderTerms
  initialConditionClosed : P.initialCondition
  boundaryConditionClosed : P.boundaryCondition

def DegenerateParabolicClosed {A : DegenerateDiffusionOperator} (P : DegenerateParabolicPDE A) : Prop :=
  P.diffusionTerm ∧ P.lowerOrderTerms ∧ P.initialCondition ∧ P.boundaryCondition

theorem degenerate_parabolic_closed_from_evidence {A : DegenerateDiffusionOperator}
    (P : DegenerateParabolicPDE A) (E : DegenerateParabolicEvidence P) : DegenerateParabolicClosed P := by
  exact And.intro E.diffusionTermClosed (And.intro E.lowerOrderTermsClosed
    (And.intro E.initialConditionClosed E.boundaryConditionClosed))

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse