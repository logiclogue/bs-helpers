let fold some none = function
    | Some x -> some x
    | None   -> none

let (>>=) x_opt f =
    match x_opt with
    | Some x -> f x
    | None   -> None

let bind f x_opt = x_opt >>= f

let map f op = op >>= (fun x -> Some (f x))

let get _x = [%raw {| _x |}]

let set_default default_value = function
    | Some value -> Some value
    | None       -> Some default_value

let opt_list_to_opt opt_list =
    let f = function
        | None   -> (fun _ -> None)
        | Some x -> (function
            | None    -> None
            | Some xs -> Some (x :: xs)) in
    let acc = Some [] in

    List.fold_right f opt_list acc

let fold_default default_value = function
    | Some value -> value
    | None       -> default_value

let compress x_opt_opt =
    match x_opt_opt with
    | Some (x_opt) -> (
        match x_opt with
        | Some x -> Some x
        | None   -> None
    )
    | None         -> None

let is_greater_than is_gt x_opt y_opt =
    match x_opt with
    | Some x -> (
        match y_opt with
        | Some y -> is_gt x y
        | None   -> true
    )
    | None -> false

let is_present opt =
    match opt with
    | Some _ -> true
    | None   -> false

let from_exception f x =
    try
        Some (f x)
    with _ ->
        None

let opt_opt_to_opt (x_opt, y_opt) =
    let inner_f x y = (x, y) in
    let outer_f x = map (inner_f x) y_opt in

    bind outer_f x_opt
