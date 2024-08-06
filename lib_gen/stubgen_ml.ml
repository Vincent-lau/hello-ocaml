
let () = Cstubs.write_ml ~errno:Cstubs.return_errno 
  ~prefix:"corosync_stubs_" Format.std_formatter (module Static.Bindings.Make)
