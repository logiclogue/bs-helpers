type 'a subscriber
type 'a observable
type 'a connected_observable
type scheduler

type ('a, 'b) operator_function     = 'a observable -> 'b observable
type 'a mono_type_operator_function = 'a observable -> 'a observable
type ('a, 'b) unary_function        = 'a -> 'b

external create_subscriber
    : 'a subscriber
    = "Subscriber"
    [@@bs.new] [@@bs.module "rxjs"]

external next
    : 'a -> unit
    = "next"
    [@@bs.send.pipe: 'a subscriber]

external complete
    : unit
    = "complete"
    [@@bs.send.pipe: 'a subscriber]

external create_observable
    : ('a subscriber -> unit) -> 'a observable
    = "Observable"
    [@@bs.new] [@@bs.module "rxjs"]

external subscribe
    : ('a -> unit) -> unit
    = "subscribe"
    [@@bs.send.pipe: 'a observable]

external animation_frame
    : scheduler
    = "animationFrame"
    [@@bs.val] [@@bs.module "rxjs"]

external interval
    : int -> scheduler -> int observable
    = "interval"
    [@@bs.val] [@@bs.module "rxjs"]

external create_of
    : 'a array -> 'a observable
    = "of"
    [@@bs.val] [@@bs.splice] [@@bs.module "rxjs"]

external of_value
    : 'a -> 'a observable
    = "of"
    [@@bs.val] [@@bs.module "rxjs"]

external combine_latest
    : ('a observable) array -> 'a observable
    = "combineLatest"
    [@@bs.val] [@@bs.splice]

let merge
    : ('a observable) array -> 'a observable
    = fun _streams -> [%bs.raw {| Rxjs.merge.apply({}, _streams) |}]

external from_event
    : 'a Event.t -> string -> 'a observable
    = "fromEvent"
    [@@bs.val] [@@bs.module "rxjs"]

external map
    : ('a -> 'b) -> ('a, 'b) operator_function
    = "map"
    [@@bs.module "rxjs/operators"]

external map_to
    : 'b -> ('a, 'b) operator_function
    = "mapTo"
    [@@bs.module "rxjs/operators"]

external merge_map
    : ('a -> 'b observable) -> ('a, 'b) operator_function
    = "mergeMap"
    [@@bs.module "rxjs/operators"]

external scan
    : ('b -> 'a -> int -> 'b) -> 'b -> ('a, 'b) operator_function
    = "scan"
    [@@bs.module "rxjs/operators"]

external filter
    : ('a -> bool) -> 'a mono_type_operator_function
    = "filter"
    [@@bs.module "rxjs/operators"]

external sample
    : 'a observable -> 'b mono_type_operator_function
    = "sample"
    [@@bs.module "rxjs/operators"]

external share
    : unit -> 'a mono_type_operator_function
    = "share"
    [@@bs.module "rxjs/operators"]

external share_replay
    : int -> 'a mono_type_operator_function
    = "shareReplay"
    [@@bs.module "rxjs/operators"]

external tap
    : ('a -> 'b) -> 'a mono_type_operator_function
    = "tap"
    [@@bs.module "rxjs/operators"]

external with_latest_from
    : 'b observable -> ('a, ('a * 'b)) operator_function
    = "withLatestFrom"
    [@@bs.module "rxjs/operators"]

external ref_count
    : unit -> ('a connected_observable, 'a observable) unary_function
    = "refCount"
    [@@bs.module "rxjs/operators"]

external publish_behavior
    : 'a -> ('a observable, 'a connected_observable) unary_function
    = "publishBehavior"
    [@@bs.module "rxjs/operators"]

external distinct_until_changed_full
    : ('a -> 'a -> bool) option -> ('a -> 'b) option
    -> 'a mono_type_operator_function
    = "distinctUntilChanged"
    [@@bs.module "rxjs/operators"]

external distinct_until_changed
    : unit -> 'a mono_type_operator_function
    = "distinctUntilChanged"
    [@@bs.module "rxjs/operators"]

external distinct
    : ('a -> 'b) -> 'a mono_type_operator_function
    = "distinct"
    [@@bs.module "rxjs/operators"]

let option_to_observable
    : 'a option -> 'a observable
    = fun value ->
        match value with
        | Some value -> create_of [|value|]
        | None       -> create_of [||]

let flat_filter_option
    : 'a option observable -> 'a observable
    = fun observable -> merge_map option_to_observable observable

let merge_list
    : ('a observable) list -> 'a observable
    = fun observable_list ->
        merge (Array.of_list observable_list)

let create_of_list
    : 'a list -> 'a observable
    = fun xs -> xs
        |> of_value
        |> map (List.map of_value)
        |> merge_map merge_list
