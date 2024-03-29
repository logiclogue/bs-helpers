let pad_with c n str =
    let length = n - String.length str in

    if length <= 0 then
        str
    else
        let cs     = String.make length c in

        String.concat "" [cs; str]

let lowercase_first_char =
    String.mapi (fun i c ->
        if i == 0 then
            Char.lowercase c
        else
            c
    )

let from_bool = function
    | true  -> "true"
    | false -> "false"

let to_list s =
    ListHelpers.init (String.length s) (String.get s)
