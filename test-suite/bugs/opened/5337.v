Require Import Recdef.
Inductive bnat : Type := BD1 : bnat -> bnat.
Axiom bpairlen : bnat -> nat.
Function blesspair_easy (x:bnat) {measure bpairlen x} := 0 < 0.
Axiom admitted : False.
Function blesspair (x:bnat) {measure bpairlen x} : Prop :=
  match x with BD1 p => blesspair p end.
Proof. case admitted. Qed.
