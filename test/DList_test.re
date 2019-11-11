open Mocha;
open Chai;

describe("DList", () => {
    context("5 cons empty", () => {
        let dlist = DList.cons(5, DList.empty);

        context("to_list", () => {
            it("returns [5]", () => {
                expect(DList.to_list(dlist))->t->deep->equal([5]);
            });
        });
    });

    context("[1, 2] append [3, 4]", () => {
        let one_two = DList.cons(1, DList.cons(2, DList.empty));
        let three_four = DList.cons(3, DList.cons(4, DList.empty));

        let dlist = DList.append(one_two, three_four);

        context("to_list", () => {
            it("returns [1, 2, 3, 4]", () => {
                expect(DList.to_list(dlist))->t->deep->equal([1, 2, 3, 4]);
            });
        });
    });

    context("given [[1], [], [2, 3, 4]]", () => {
        let dlista = DList.cons(1, DList.empty);
        let dlistb = DList.empty;
        let dlistc = DList.cons(2, DList.cons(3, DList.cons(4, DList.empty)));

        let first_half = DList.cons(dlistb, DList.cons(dlistc, DList.empty));
        let dlist = DList.cons(dlista, first_half);

        context("flatten then to_list", () => {
            let result = DList.flatten(dlist)
                |> DList.to_list;

            it("returns [1, 2, 3, 4]", () => {
                expect(result)->t->deep->equal([1, 2, 3, 4]);
            });
        });
    });
});
