import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

structure SequenceAlignmentPackage where
  sequences : Type u
  scoringMatrix : Type v
  alignmentPath : Type w
  alignmentEquation : DegenerateParabolicEquation
  scoringMatrixClosed : scoringMatrix
  alignmentPathClosed : alignmentPath

structure SequenceAlignmentEvidence (S : SequenceAlignmentPackage) where
  scoringMatrixClosed : S.scoringMatrix
  alignmentPathClosed : S.alignmentPath
  alignmentEquationClosed : DegenerateParabolicClosed S.alignmentEquation

def SequenceAlignmentClosed (S : SequenceAlignmentPackage) : Prop :=
  S.scoringMatrix ∧ S.alignmentPath ∧
  DegenerateParabolicClosed S.alignmentEquation

theorem sequence_alignment_closed_from_evidence
    (S : SequenceAlignmentPackage) (Ev : SequenceAlignmentEvidence S) :
    SequenceAlignmentClosed S := by
  exact And.intro Ev.scoringMatrixClosed
    (And.intro Ev.alignmentPathClosed Ev.alignmentEquationClosed)

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse