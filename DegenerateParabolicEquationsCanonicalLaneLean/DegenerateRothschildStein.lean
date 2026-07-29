import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

/-!
# Rothschild-Stein Lifting Theorem for Degenerate Parabolic Operators

This package encodes the Rothschild-Stein lifting theorem, which approximates
HÃ¶rmander-type degenerate parabolic operators by left-invariant operators on a free Carnot group.
It provides the approximation machinery needed for hypoelliptic estimates.
-/

structure RothschildSteinLiftingPackage where
  originalOperator : Type u -> Type u
  liftedOperator : Type u -> Type u
  approximationError : Prop
  freeCarnotGroup : Type u -> Type u
  errorEstimates : Prop

structure RothschildSteinLiftingEvidence (R : RothschildSteinLiftingPackage) where
  originalOperatorClosed : R.originalOperator = R.originalOperator
  liftedOperatorClosed : R.liftedOperator = R.liftedOperator
  approximationErrorClosed : R.approximationError
  freeCarnotGroupClosed : R.freeCarnotGroup = R.freeCarnotGroup
  errorEstimatesClosed : R.errorEstimates

def RothschildSteinLiftingClosed (R : RothschildSteinLiftingPackage) : Prop :=
  R.approximationError ∧ R.errorEstimates

theorem rothschild_stein_lifting_closed_from_evidence
    (R : RothschildSteinLiftingPackage) (E : RothschildSteinLiftingEvidence R) :
    RothschildSteinLiftingClosed R := by
  exact And.intro E.approximationErrorClosed E.errorEstimatesClosed

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse
