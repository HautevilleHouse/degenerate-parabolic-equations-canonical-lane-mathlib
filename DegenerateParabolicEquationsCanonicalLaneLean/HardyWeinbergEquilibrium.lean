import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure HardyWeinbergEquilibriumPackage where
  population : Type u
  genotypeFrequencies : Type v
  alleleFrequencies : Type w
  equilibriumCondition : Prop
  randomMatingAssumption : Prop
  evolutionEquation : DegenerateParabolicEquation
  equilibriumConditionClosed : equilibriumCondition
  randomMatingAssumptionClosed : randomMatingAssumption

structure HardyWeinbergEquilibriumEvidence (H : HardyWeinbergEquilibriumPackage) where
  equilibriumConditionClosed : H.equilibriumCondition
  randomMatingAssumptionClosed : H.randomMatingAssumption
  evolutionEquationClosed : DegenerateParabolicClosed H.evolutionEquation

def HardyWeinbergEquilibriumClosed (H : HardyWeinbergEquilibriumPackage) : Prop :=
  H.equilibriumCondition ∧ H.randomMatingAssumption ∧
  DegenerateParabolicClosed H.evolutionEquation

theorem hardy_weinberg_equilibrium_closed_from_evidence
    (H : HardyWeinbergEquilibriumPackage)
    (Ev : HardyWeinbergEquilibriumEvidence H) : HardyWeinbergEquilibriumClosed H := by
  exact And.intro Ev.equilibriumConditionClosed
    (And.intro Ev.randomMatingAssumptionClosed Ev.evolutionEquationClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse