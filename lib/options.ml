
(* $Id$ *)

let batch_mode = ref false

let debug = ref false

let print_emacs = ref false

let emacs_str s = if !print_emacs then s else "" 

(* Silent *)
let silent = ref false
let make_silent flag = silent := flag; ()
let is_silent () = !silent

let silently f x =
  let oldsilent = !silent in
  try 
    silent := true;
    let rslt = f x in
    silent := oldsilent; 
    rslt
  with e -> begin
    silent := oldsilent; raise e
  end

(* The number of printed hypothesis in a goal *)

let print_hyps_limit = ref (None : int option)
let set_print_hyps_limit n = print_hyps_limit := Some n
let unset_print_hyps_limit () = print_hyps_limit := None
let print_hyps_limit () = !print_hyps_limit

let mes_ambig = ref true
let make_mes_ambig flag = mes_ambig:=flag
let is_mes_ambig() = !mes_ambig

let without_mes_ambig f x =
  let old = is_mes_ambig() in
  try make_mes_ambig false;
      let rslt = f x in (make_mes_ambig old; rslt)
  with e -> (make_mes_ambig old; raise e)
