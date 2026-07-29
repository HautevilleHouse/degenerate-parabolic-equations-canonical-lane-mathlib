import DegenerateParabolicEquationsCanonicalLaneLean.DegenerateParabolicPDE

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure MaximumPrinciplePackage {P : DegenerateParabolicPDEPackage} (X : DegenerateParabolicPDEEvidence P) where
  weakMaximumPrinciple : Prop
  strongMaximumPrinciple : Prop
  boundaryComparison : Prop

structure MaximumPrincipleEvidence {P : DegenerateParabolicPDEPackage} {X : DegenerateParabolicPDEEvidence P}
    (M : MaximumPrinciplePackage X) where
  weakMaximumPrincipleClosed : M.weakMaximumPrinciple
  strongMaximumPrincipleClosed : M.strongMaximumPrinciple
  boundaryComparisonClosed : M.boundaryComparison

def MaximumPrincipleClosed {P : DegenerateParabolicPDEPackage} {X : DegenerateParabolicPDEEvidence P}
    (M : MaximumPrinciplePackage X) : Prop :=
  M.weakMaximumPrinciple ∧ M.strongMaximumPrinciple ∧ M.boundaryComparison

theorem maximum_principle_closed_from_evidence
    {P : DegenerateParabolicPDEPackage} {X : DegenerateParabolicPDEEvidence P}
    (M : MaximumPrinciplePackage X) (E : MaximumPrincipleEvidence M) :
    MaximumPrincipleClosed M := by
  exact And.intro E.weakMaximumPrincipleClosed
    (And.intro E.strongMaximumPrincipleClosed E.boundaryComparisonClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse