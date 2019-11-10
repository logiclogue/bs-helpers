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
});
