let uncurry f (x, y) = f x y

let rec reapply f n x =
    if (n <= 0) then
        x
    else
        reapply f (n - 1) (f x)
