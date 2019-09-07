val find                : ('a -> bool) -> 'a list -> 'a option
val all                 : ('a -> bool) -> 'a list -> bool
val first               : 'a list -> 'a option
val sum                 : int list -> int
val mean                : int list -> int option
val update_where        : ('a -> 'a) -> ('a -> bool) -> 'a list -> 'a list
val max_by              : ('a -> 'b) -> 'a -> 'a -> 'a
val max_by_list         : ('a -> 'b) -> 'a -> 'a list -> 'a
val count_by            : ('a -> 'b) -> 'a list -> ('a * int) list
val most_common         : 'a list -> 'a option
val delete_where        : ('a -> bool) -> 'a list -> 'a list
val insert_if_not_exist : 'a -> 'a list -> 'a list
val to_unique_list      : 'a list -> 'a list
val remove              : 'a -> 'a list -> 'a list
val zip                 : 'a list -> 'b list -> ('a * 'b) list option
val take                : int -> 'a list -> 'a list
val drop                : int -> 'a list -> 'a list
val complete_zip        : ('a option -> 'b) -> 'a list * 'a list -> ('b * 'b) list
val unzip               : ('a * 'b) list -> 'a list * 'b list
val rotate              : 'a list -> 'a list
