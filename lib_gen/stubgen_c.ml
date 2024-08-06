let c_headers = "#include <stdint.h>\n#include <stdlib.h>\n#include <libcmap.h>"

let () =
  Format.fprintf Format.std_formatter "%s@\n" c_headers;
  Cstubs.write_c ~errno:Cstubs.return_errno 
    ~prefix:"corosync_stubs_" Format.std_formatter (module Static.Bindings.Make)

  