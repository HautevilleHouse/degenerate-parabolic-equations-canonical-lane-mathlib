import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure DegenerateParabolicEquation where
  spatialDomain : Type u
  timeDomain : Type v
  unknownFunction : Type w
  parabolicOperator : Type x
  degeneracyCondition : Prop
  weakFormulation : Prop
  boundaryCondition : Prop
  degeneracyConditionClosed : degeneracyCondition
  weakFormulationClosed : weakFormulation
  boundaryConditionClosed : boundaryCondition

structure DegenerateParabolicEvidence (E : DegenerateParabolicEquation) where
  degeneracyConditionClosed : E.degeneracyCondition
  weakFormulationClosed : E.weakFormulation
  boundaryConditionClosed : E.boundaryCondition

def DegenerateParabolicClosed (E : DegenerateParabolicEquation) : Prop :=
  E.degeneracyCondition ∧ E.weakFormulation ∧ E.boundaryCondition

theorem degenerate_parabolic_closed_from_evidence (E : DegenerateParabolicEquation)
    (Ev : DegenerateParabolicEvidence E) : DegenerateParabolicClosed E := by
  exact And.intro Ev.degeneracyConditionClosed
    (And.intro Ev.weakFormulationClosed Ev.boundaryConditionClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse