
open Ctypes
open Foreign


let cmap_handle_t = uint64_t
let cs_error_t = int

let cmap_get_int64 =
  foreign "cmap_get_string"
    (cmap_handle_t @-> string @-> string @-> returning cs_error_t)