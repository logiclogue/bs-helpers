val fold            : ('a -> 'b) -> 'b -> 'a option -> 'b
val (>>=)           : 'a option -> ('a -> 'b option) -> 'b option
val bind            : ('a -> 'b option) -> 'a option -> 'b option
val map             : ('a -> 'b) -> 'a option -> 'b option
val get             : 'a option -> 'a
val set_default     : 'a -> 'a option -> 'a option
val opt_list_to_opt : 'a option list -> 'a list option
val fold_default    : 'a -> 'a option -> 'a
val compress        : 'a option option -> 'a option
val is_greater_than : ('a -> 'a -> bool) -> 'a option -> 'a option -> bool
val is_present      : 'a option -> bool
val from_exception  : ('a -> 'b) -> 'a -> 'b option
