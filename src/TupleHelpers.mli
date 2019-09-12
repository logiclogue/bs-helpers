val map_left      : ('a -> 'c) -> ('a * 'b) -> ('c * 'b)
val map_right     : ('b -> 'c) -> ('a * 'b) -> ('a * 'c)
val out_opt_left  : ('a option * 'b) -> ('a * 'b) option
val out_opt_right : ('a * 'b option) -> ('a * 'b) option
val take_left     : ('a * 'b) -> 'a
val take_right    : ('a * 'b) -> 'b
