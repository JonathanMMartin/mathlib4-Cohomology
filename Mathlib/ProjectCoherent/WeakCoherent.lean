module

public import Mathlib.AlgebraicGeometry.Noetherian
public import Mathlib.Algebra.Category.ModuleCat.Sheaf.Quasicoherent
public import Mathlib.AlgebraicGeometry.Modules.Presheaf

@[expose] public section

open AlgebraicGeometry

variable (X : Scheme) [IsLocallyNoetherian X]
  (M : SheafOfModules X.ringCatSheaf)

--Weak definition of Coherent sheaf assuming X is a locally noetherian scheme

structure WeakCoherent : Prop where
  quasicoherent : M.IsQuasicoherent
  finitetype : M.IsFiniteType

class IsWeakCoherent (M : SheafOfModules X.ringCatSheaf) : Prop where
  quasicoherent : M.IsQuasicoherent
  finitetype : M.IsFiniteType

/- Next goal: showing the category of coherent sheaves is abelain.
We show (1) has a zero object (2) closed under kernels (3) closed under cokernels
(4) closed under finite products. -/

-- Lemma 1: finite type subsheaf of a coherent sheaf is coherent
theorem finitetypesubsheaf (h : SheafOfModules.IsCoherent M) (N : SheafOfModules.{u} R) {i : N ⟶ M}
  (hi : Mono i) (hN : N.IsFiniteType) : SheafOfModules.IsCoherent N := by
  constructor
  · exact hN
  intro σ h1 j
  let U := σ.X j
  -- have covers := σ.coversTop U
  obtain ⟨genN, fingenN⟩ := hN
  have kerfin := h.forall_localSectionData (σ.map i) (fun _ => ⟨(h1 _).1⟩) j
  have compi : SheafOfModules.Sections.π (N.over (σ.X j)) (σ.sections j) ≫ i.over U =
      SheafOfModules.Sections.π (M.over ((σ.map i).X j)) ((σ.map i).sections j) := by
    sorry
  rw [← compi] at kerfin
