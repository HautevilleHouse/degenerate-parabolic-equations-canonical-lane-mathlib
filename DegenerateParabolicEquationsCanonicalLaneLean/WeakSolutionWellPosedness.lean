import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure WeakSolutionWellPosedness {A : DegenerateDiffusionOperator} (P : DegenerateParabolicPDE A) where
  existence : Prop
  uniqueness : Prop
  stability : Prop
  existenceClosed : existence
  uniquenessClosed : uniqueness
  stabilityClosed : stability

structure WeakSolutionEvidence {A : DegenerateDiffusionOperator} {P : DegenerateParabolicPDE A} (W : WeakSolutionWellPosedness P) where
  existenceClosed : W.existence
  uniquenessClosed : W.uniqueness
  stabilityClosed : W.stability

def WeakSolutionClosed {A : DegenerateDiffusionOperator} {P : DegenerateParabolicPDE A} (W : WeakSolutionWellPosedness P) : Prop :=
  W.existence ∧ W.uniqueness ∧ W.stability

theorem weak_solution_closed_from_evidence {A : DegenerateDiffusionOperator} {P : DegenerateParabolicPDE A}
    (W : WeakSolutionWellPosedness P) (E : WeakSolutionEvidence W) : WeakSolutionClosed W := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed E.stabilityClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse