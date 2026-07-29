import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

def ConstrainedDegenerateParabolicClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_degenerate_parabolic_endgame (A : AdmissibleClass) :
    ConstrainedDegenerateParabolicClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse