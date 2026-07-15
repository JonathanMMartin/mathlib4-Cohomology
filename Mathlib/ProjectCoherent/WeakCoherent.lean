module
public import Mathlib.AlgebraicGeometry.Noetherian
public import Mathlib.Algebra.Category.ModuleCat.Sheaf.Quasicoherent
public import Mathlib.AlgebraicGeometry.Modules.Presheaf

@[expose] public section

open AlgebraicGeometry

variable (X : Scheme) [IsLocallyNoetherian X]
  (M : SheafOfModules X.ringCatSheaf)

structure WeakCoherent : Prop where
  quasicoherent : M.IsQuasicoherent
  finitetype : M.IsFiniteType

class IsWeakCoherent (M : SheafOfModules X.ringCatSheaf) : Prop where
  quasicoherent : M.IsQuasicoherent
  finitetype : M.IsFiniteType
