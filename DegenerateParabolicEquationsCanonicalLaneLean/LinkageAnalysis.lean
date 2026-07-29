import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure LinkageAnalysisPackage where
  geneticMarkers : Type u
  recombinationFraction : Type v
  lodScore : Type w
  linkageEquation : DegenerateParabolicEquation
  recombinationFractionClosed : recombinationFraction
  lodScoreClosed : lodScore

structure LinkageAnalysisEvidence (L : LinkageAnalysisPackage) where
  recombinationFractionClosed : L.recombinationFraction
  lodScoreClosed : L.lodScore
  linkageEquationClosed : DegenerateParabolicClosed L.linkageEquation

def LinkageAnalysisClosed (L : LinkageAnalysisPackage) : Prop :=
  L.recombinationFraction ∧ L.lodScore ∧
  DegenerateParabolicClosed L.linkageEquation

theorem linkage_analysis_closed_from_evidence
    (L : LinkageAnalysisPackage) (Ev : LinkageAnalysisEvidence L) :
    LinkageAnalysisClosed L := by
  exact And.intro Ev.recombinationFractionClosed
    (And.intro Ev.lodScoreClosed Ev.linkageEquationClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse