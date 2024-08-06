open Ctypes

let leak () =
  let strchr =
    Foreign.foreign "strchr" (ptr char @-> char @-> returning (ptr char))
  in
  let p = CArray.of_string "abc" in
  (* Gc.finalise (fun _ -> print_endline "gc'd p") p; *)
  let q = strchr (CArray.start p) 'a' in
  let () = Gc.compact () in
  Printf.printf "%c\n" !@q

let leak_use () =
  let strchr =
    Foreign.foreign "strchr" (ptr char @-> char @-> returning (ptr char))
  in
  let p = CArray.of_string "abc" in
  (* Gc.finalise (fun _ -> print_endline "gc'd p") p; *)
  let q = strchr (CArray.start p) 'a' in
  let () = Gc.compact () in
  Printf.printf "%c\n" !@q;
  Ctypes_memory_stubs.use_value p

let not_leak () =
  let a = "abc" in
  Gc.finalise (fun _ -> print_endline "gc'd a") a;
  let b =
  if 3+10>0 then
    "123"
  else
    a
  in
  Gc.compact ();
  print_endline b


let () = _leak_use ()