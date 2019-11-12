type 'a t = 'a list -> 'a list

let empty =
    (fun xs -> xs)

let single x =
    (fun xs -> x :: xs)

let append dlist_a dlist_b =
    (fun xs -> dlist_a (dlist_b xs))

let cons x dlist =
    append (single x) dlist

let flatten xss =
    (fun xs -> )

let to_list dlist =
    dlist []
