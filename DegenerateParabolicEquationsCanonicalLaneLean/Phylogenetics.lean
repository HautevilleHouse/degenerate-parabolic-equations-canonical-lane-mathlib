import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure PhylogeneticsPackage where
  taxa : Type u
  treeTopology : Type v
  substitutionModel : Type w
  phylogeneticEquation : DegenerateParabolicEquation
  treeTopologyClosed : treeTopology
  substitutionModelClosed : substitutionModel

structure PhylogeneticsEvidence (P : PhylogeneticsPackage) where
  treeTopologyClosed : P.treeTopology
  substitutionModelClosed : P.substitutionModel
  phylogeneticEquationClosed : DegenerateParabolicClosed P.phylogeneticEquation

def PhylogeneticsClosed (P : PhylogeneticsPackage) : Prop :=
  P.treeTopology ∧ P.substitutionModel ∧
  DegenerateParabolicClosed P.phylogeneticEquation

theorem phylogenetics_closed_from_evidence
    (P : PhylogeneticsPackage) (Ev : PhylogeneticsEvidence P) :
    PhylogeneticsClosed P := by
  exact And.intro Ev.treeTopologyClosed
    (And.intro Ev.substitutionModelClosed Ev.phylogeneticEquationClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse