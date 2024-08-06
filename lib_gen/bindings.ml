open Ctypes

module Make =
functor
  (S : Cstubs.FOREIGN)
  ->
  struct
    open S

    let cmap_handle_t = uint64_t
    let cs_error_t = int

    let cmap_initialize =
      foreign "cmap_initialize" (ptr cmap_handle_t @-> returning cs_error_t)

    let cmap_finalize =
      foreign "cmap_finalize" (cmap_handle_t @-> returning cs_error_t)

    let cmap_get_int64 =
      foreign "cmap_get_string"
        (cmap_handle_t @-> string @-> string @-> returning cs_error_t)
  end
