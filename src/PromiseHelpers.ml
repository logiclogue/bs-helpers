let return x = Js.Promise.make (fun ~resolve ~reject:_ ->
        resolve x [@bs]
    )

let map f = Js.Promise.then_ (fun x -> return (f x))

let map_error f = Js.Promise.catch (fun x -> return (f x))

let fold f g promise = promise
        |> map f
        |> Js.Promise.catch (fun err -> return (g err))

let rec until predicate_promise resolution_promise =
    predicate_promise
        |> Js.Promise.then_ (fun b ->
            match b with
            | true  -> resolution_promise
            | false -> until predicate_promise resolution_promise
        )
