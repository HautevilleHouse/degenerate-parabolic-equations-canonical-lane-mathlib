import DegenerateParabolicEquationsCanonicalLaneLean.HarnackInequality

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure RegularityTheoryPackage {P : DegenerateParabolicPDEPackage} {X : DegenerateParabolicPDEEvidence P}
    {M : MaximumPrinciplePackage X} {H : MaximumPrincipleEvidence M}
    {K : HarnackInequalityPackage H} (R : HarnackInequalityEvidence K) where
  holderContinuity : Prop
  interiorRegularity : Prop
  boundaryRegularity : Prop

structure RegularityTheoryEvidence {P : DegenerateParabolicPDEPackage} {X : DegenerateParabolicPDEEvidence P}
    {M : MaximumPrinciplePackage X} {H : MaximumPrincipleEvidence M}
    {K : HarnackInequalityPackage H} {R : HarnackInequalityEvidence K}
    (S : RegularityTheoryPackage R) where
  holderContinuityClosed : S.holderContinuity
  interiorRegularityClosed : S.interiorRegularity
  boundaryRegularityClosed : S.boundaryRegularity

def RegularityTheoryClosed {P : DegenerateParabolicPDEPackage} {X : DegenerateParabolicPDEEvidence P}
    {M : MaximumPrinciplePackage X} {H : MaximumPrincipleEvidence M}
    {K : HarnackInequalityPackage H} {R : HarnackInequalityEvidence K}
    (S : RegularityTheoryPackage R) : Prop :=
  S.holderContinuity ∧ S.interiorRegularity ∧ S.boundaryRegularity

theorem regularity_theory_closed_from_evidence
    {P : DegenerateParabolicPDEPackage} {X : DegenerateParabolicPDEEvidence P}
    {M : MaximumPrinciplePackage X} {H : MaximumPrincipleEvidence M}
    {K : HarnackInequalityPackage H} {R : HarnackInequalityEvidence K}
    (S : RegularityTheoryPackage R) (E : RegularityTheoryEvidence S) :
    RegularityTheoryClosed S := by
  exact And.intro E.holderContinuityClosed
    (And.intro E.interiorRegularityClosed E.boundaryRegularityClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse