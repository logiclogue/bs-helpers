let map_left f (x, y) = (f x, y)

let map_right f (x, y) = (x, f y)

let out_opt_left (x_opt, y) =
    match x_opt with
    | Some x -> Some (x, y)
    | None   -> None

let out_opt_right (x, y_opt) =
    match y_opt with
    | Some y -> Some (x, y)
    | None   -> None
