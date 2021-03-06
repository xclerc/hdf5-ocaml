module Type : sig
  type t =
  | HARD
  | SOFT
  | EXTERNAL
  | MAX
end

module Info : sig
  type t = {
    type_        : Type.t;
    corder_valid : bool;
    corder       : int;
    cset         : H5t.Cset.t;
    address      : Hid.t option;
  }
end

module Iterate : sig
  type 'a t = Hid.t -> string -> Info.t -> 'a -> H5_raw.Iter.t
end

external create_hard : Hid.t -> string -> Hid.t -> ?lcpl:Hid.t -> ?lapl:Hid.t -> string
  -> unit = "hdf5_h5l_create_hard_bytecode" "hdf5_h5l_create_hard"
external create_soft : string -> Hid.t -> ?lcpl:Hid.t -> ?lapl:Hid.t -> string -> unit
  = "hdf5_h5l_create_soft"
external create_external : string -> string -> Hid.t -> ?lcpl:Hid.t -> ?lapl:Hid.t
  -> string -> unit = "hdf5_h5l_create_external_bytecode" "hdf5_h5l_create_external"
external exists : Hid.t -> ?lapl:Hid.t -> string -> bool = "hdf5_h5l_exists"
external move : Hid.t -> string -> Hid.t -> ?lcpl:Hid.t -> ?lapl:Hid.t -> string -> unit
  = "hdf5_h5l_move_bytecode" "hdf5_h5l_move"
external copy : Hid.t -> string -> Hid.t -> ?lcpl:Hid.t -> ?lapl:Hid.t -> string -> unit
  = "hdf5_h5l_copy_bytecode" "hdf5_h5l_copy"
external delete : Hid.t -> ?lapl:Hid.t -> string -> unit = "hdf5_h5l_delete"
external iterate : Hid.t -> H5_raw.Index.t -> H5_raw.Iter_order.t -> ?idx:int ref
  -> 'a Iterate.t -> 'a -> H5_raw.Iter.t = "hdf5_h5l_iterate_bytecode" "hdf5_h5l_iterate"
external iterate_by_name : Hid.t -> string -> H5_raw.Index.t -> H5_raw.Iter_order.t
  -> ?idx:int ref -> 'a Iterate.t -> ?lapl:Hid.t -> 'a -> H5_raw.Iter.t
  = "hdf5_h5l_iterate_by_name_bytecode" "hdf5_h5l_iterate_by_name"
external get_name_by_idx : Hid.t -> string -> H5_raw.Index.t -> H5_raw.Iter_order.t -> ?lapl: Hid.t
  -> int -> string = "hdf5_h5l_get_name_by_idx_bytecode" "hdf5_h5l_get_name_by_idx"
