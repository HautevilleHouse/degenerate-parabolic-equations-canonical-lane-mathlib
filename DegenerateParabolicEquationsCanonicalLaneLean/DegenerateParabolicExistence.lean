import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure DegenerateParabolicExistencePackage {A : DegenerateDiffusionOperator} {P : DegenerateParabolicPDE A}
    (W : WeakSolutionWellPosedness P) where
  maximalExistenceTime : Type u
  blowUpCriterion : Prop
  continuationAfterDegeneracy : Prop
  maximalExistenceTimeClosed : maximalExistenceTime
  blowUpCriterionClosed : blowUpCriterion
  continuationAfterDegeneracyClosed : continuationAfterDegeneracy

structure DegenerateParabolicExistenceEvidence {A : DegenerateDiffusionOperator}
    {P : DegenerateParabolicPDE A} {W : WeakSolutionWellPosedness P}
    (E : DegenerateParabolicExistencePackage W) where
  maximalExistenceTimeClosed : E.maximalExistenceTime
  blowUpCriterionClosed : E.blowUpCriterion
  continuationAfterDegeneracyClosed : E.continuationAfterDegeneracy

def DegenerateParabolicExistenceClosed {A : DegenerateDiffusionOperator}
    {P : DegenerateParabolicPDE A} {W : WeakSolutionWellPosedness P}
    (E : DegenerateParabolicExistencePackage W) : Prop :=
  E.maximalExistenceTime ∧ E.blowUpCriterion ∧ E.continuationAfterDegeneracy

theorem degenerate_parabolic_existence_closed_from_evidence {A : DegenerateDiffusionOperator}
    {P : DegenerateParabolicPDE A} {W : WeakSolutionWellPosedness P}
    (E : DegenerateParabolicExistencePackage W) (Ev : DegenerateParabolicExistenceEvidence E) :
    DegenerateParabolicExistenceClosed E := by
  exact And.intro Ev.maximalExistenceTimeClosed (And.intro Ev.blowUpCriterionClosed
    Ev.continuationAfterDegeneracyClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse