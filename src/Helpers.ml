let equality_from_gt ( > ) x y = not (x > y || y > x)

let raw_to_json _anything = [%raw {| _anything |}]

let flip f x y = f y x
