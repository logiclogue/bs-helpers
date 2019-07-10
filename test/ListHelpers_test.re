open Mocha;
open Chai;

describe("ListHelpers", () => {
    describe(".update_where()", () => {
        context("given [1, 2, 3], plus 1 function and where x = 2", () => {
            let myList = [1, 2, 3];
            let update = x => x + 1;
            let where_f = x => x == 2;

            let result = ListHelpers.update_where(update, where_f, myList);

            it("returns [1, 3, 3]", () => {
                expect(result)->t->deep->equal([1, 3, 3]);
            });
        });
    });
});
