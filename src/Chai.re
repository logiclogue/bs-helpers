type assertion('a);

[@bs.module "chai"]
external expect: 'a => assertion('a) = "expect";
[@bs.send]
external toEqual: (assertion('a), 'a) => unit = "equal";
[@bs.send]
external equal: (assertion('a), 'a) => unit = "equal";
[@bs.send]
external equal_unsafe: (assertion('a), 'b) => unit = "equal";
[@bs.get]
external t: assertion('a) => assertion('a) = "to";
[@bs.get]
external deep: assertion('a) => assertion('a) = "deep";
