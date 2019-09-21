let find p self = try Some (List.find p self) with _ -> None

let all p self = List.map p self
    |> List.fold_left (fun b bs -> b && bs) true

let first self =
    match self with
    | []     -> None
    | x :: _ -> Some x

let sum = List.fold_left (fun x y -> x + y) 0

let mean numbers =
    let length = List.length numbers in

    IntHelpers.safe_div (sum numbers) length

let update_where update where_function =
    List.map (fun list_element ->
        if where_function list_element then
            update list_element
        else
            list_element
    )

let max_by f x y =
    if f x > f y then
        x
    else
        y

let max_by_list f =
    List.fold_left (max_by f)

let is_same_key f key_a (key_b, _value) =
    f key_a = f key_b

let rec count_by f xs =
    match xs with
    | []        -> []
    | (x :: xs) ->
        let rest = count_by f xs in
        let count_opt = find (is_same_key f x) rest in

        match count_opt with
        | None        -> (x, 1) :: rest
        | Some _count -> update_where
            (fun (key, value) -> (key, value + 1))
            (is_same_key f x)
            rest

let most_common xs = xs
    |> count_by (fun x -> x)
    |> List.map (fun x -> Some x)
    |> max_by_list (OptionHelpers.fold (fun (_key, count) -> count) 0) None
    |> OptionHelpers.map (fun (key, _value) -> key)

let delete_where where_f =
    List.filter (fun x -> not (where_f x))

let insert_if_not_exist x xs =
    if List.exists (fun y -> x = y) xs then
        xs
    else
        x :: xs

let to_unique_list xs =
    List.fold_right insert_if_not_exist xs []

let remove x = delete_where (fun y -> x = y)

let zip xs ys =
    try
        Some (List.map2 (fun x y -> (x, y)) xs ys)
    with
        _ -> None

let rec take n xs =
    if n <= 0 then
        []
    else
        match xs with
        | x :: xs -> x :: (take (n - 1) xs)
        | []      -> []

let rec drop n xs =
    if n <= 0 then
        xs
    else
        match xs with
        | _ :: xs -> drop (n - 1) xs
        | []      -> []

let rec complete_zip f (xs, ys) =
    match xs, ys with
    | [], []           -> []
    | x :: xs, []      -> (f (Some x), f None) :: complete_zip f (xs, [])
    | [],      y :: ys -> (f None, f (Some y)) :: complete_zip f ([], ys)
    | x :: xs, y :: ys -> (f (Some x), f (Some y)) :: complete_zip f (xs, ys)

let unzip xys =
    List.map fst xys, List.map snd xys

let rotate xs =
    match xs with
    | x :: xs -> List.append xs [x]
    | []      -> []

let filter_options xopts =
    List.fold_right (fun xopt xs ->
        match xopt with
        | None   -> xs
        | Some x -> x :: xs
    ) xopts []
