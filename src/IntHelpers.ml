let from_string = OptionHelpers.from_exception int_of_string

let safe_div x y =
    if y == 0 then
        None
    else
        Some (x / y)
