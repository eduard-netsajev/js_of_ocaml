
module Make (N : Set.OrderedType) : sig

  module NSet : Set.S with type elt = N.t
  module NMap : Map.S with type key = N.t

  type t =
    { domain : NSet.t;
      fold_children : 'a . (N.t -> 'a -> 'a) -> N.t -> 'a -> 'a }

  val invert : t -> t

  module type DOMAIN = sig type t val equal : t -> t -> bool val bot : t end

  module Solver (D : DOMAIN) : sig
    val f : t -> (D.t NMap.t -> N.t -> D.t) -> D.t NMap.t
  end

end
