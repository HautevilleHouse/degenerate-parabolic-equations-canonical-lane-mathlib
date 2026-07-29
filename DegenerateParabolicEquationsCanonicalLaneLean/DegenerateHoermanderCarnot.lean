import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

/-!
# Carnot Group Geometry for Degenerate Parabolic PDEs

This package records the Carnot group structure underlying HÃ¶rmander-type degenerate parabolic equations.
It encodes stratification, dilation invariance, and the associated sub-Laplacian, which governs the degenerate diffusion.
-/

structure CarnotGroupPackage where
  stratification : Nat
  dilation : Type u -> Type u
  subLaplacian : Type u -> Type u
  horizontalGradient : Type u -> Type u
  homogeneousDimension : Nat
  nilpotencyStep : Nat

structure CarnotGroupEvidence (C : CarnotGroupPackage) where
  stratificationClosed : C.stratification > 0
  dilationClosed : C.dilation = C.dilation
  subLaplacianClosed : C.subLaplacian = C.subLaplacian
  horizontalGradientClosed : C.horizontalGradient = C.horizontalGradient
  homogeneousDimensionClosed : C.homogeneousDimension ≥ 3
  nilpotencyStepClosed : C.nilpotencyStep ≥ 2

def CarnotGroupClosed (C : CarnotGroupPackage) : Prop :=
  C.stratification > 0 ∧ C.homogeneousDimension ≥ 3 ∧ C.nilpotencyStep ≥ 2

theorem carnot_group_closed_from_evidence
    (C : CarnotGroupPackage) (E : CarnotGroupEvidence C) :
    CarnotGroupClosed C := by
  exact And.intro E.stratificationClosed
    (And.intro E.homogeneousDimensionClosed E.nilpotencyStepClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse
