val return    : 'a -> 'a Js.Promise.t
val map       : ('a -> 'b) -> 'a Js.Promise.t -> 'b Js.Promise.t
val map_error : (Js.Promise.error -> 'a) -> 'a Js.Promise.t -> 'a Js.Promise.t
val fold      : ('a -> 'b)
        -> (Js.Promise.error -> 'b)
        -> 'a Js.Promise.t
        -> 'b Js.Promise.t
val until     : bool Js.Promise.t -> 'a Js.Promise.t -> 'a Js.Promise.t

