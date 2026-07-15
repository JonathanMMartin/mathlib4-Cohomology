module

public import Mathlib.CategoryTheory.Sites.Over

@[expose] public section

open CategoryTheory

variable {C : Type*} [Category* C] {J : GrothendieckTopology C}

section

variable (A : Type*) [Category* A] {X : C} (f : Over X)

instance : (f.iteratedSliceEquiv.inverse.sheafPushforwardContinuous A
    (J.over f.left) ((J.over X).over f)).IsEquivalence :=
  inferInstanceAs (Equivalence.sheafCongr ((J.over X).over f) (J.over f.left)
    f.iteratedSliceEquiv A).functor.IsEquivalence

instance [HasWeakSheafify (J.over f.left) A] : HasWeakSheafify ((J.over X).over f) A :=
  Functor.IsDenseSubsite.hasWeakSheafify_of_isEquivalence
    (J.over f.left) ((J.over X).over f) f.iteratedSliceEquiv.inverse A

instance {FA : A → A → Type*} {CA : A → Type*} [∀ P Q, FunLike (FA P Q) (CA P) (CA Q)]
    [ConcreteCategory A FA] [(J.over f.left).WEqualsLocallyBijective A] :
    ((J.over X).over f).WEqualsLocallyBijective A :=
  GrothendieckTopology.WEqualsLocallyBijective.transport
    ((J.over X).over f) (J.over f.left) f.iteratedSliceEquiv.inverse
      (Functor.IsDenseSubsite.coverPreserving (J.over f.left) ((J.over X).over f)
        f.iteratedSliceEquiv.inverse)

end
