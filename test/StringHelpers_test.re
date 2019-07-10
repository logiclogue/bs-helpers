open Mocha;
open Chai;
open StringHelpers;

describe("StringHelpers", () => {
    describe(".pad_with()", () => {
        context("given an empty string to pad zero zeros", () => {
            let result = pad_with('0', 0, "");

            it("returns an empty string", () => {
                expect(result)->t->equal("");
            });
        });

        context("given A to pad 2 zeros", () => {
            let result = pad_with('0', 2, "A");

            it("returns 0A", () => {
                expect(result)->t->equal("0A");
            });
        });

        context("given empty to pad 2 zeros", () => {
            let result = pad_with('0', 2, "");

            it("returns 00", () => {
                expect(result)->t->equal("00");
            });
        });

        context("given AA to pad 2 zeros", () => {
            let result = pad_with('0', 2, "AA");

            it("returns AA", () => {
                expect(result)->t->equal("AA");
            });
        });

        context("given AAA to pad 2 zeros", () => {
            let result = pad_with('0', 2, "AAA");

            it("returns AAA", () => {
                expect(result)->t->equal("AAA");
            });
        });
    });
});
