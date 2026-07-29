import DegenerateParabolicEquationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DegenerateParabolicEquationsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DegenerateParabolicWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DegenerateParabolicEquationsCanonicalLaneLean
end HautevilleHouse