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
