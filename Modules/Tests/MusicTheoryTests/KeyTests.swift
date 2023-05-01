//
//  KeyTests.swift
//  
//
//  Created by Arman Arutiunov on 01/05/2023.
//

@testable import MusicTheory
import XCTest

final class KeyTests: XCTestCase {

    // MARK: - Notes

    func testC() {
        let key = Key(baseNote: .c())
        XCTAssertEqual(key.notes, [.c(), .d(), .e(), .f(), .g(), .a(), .b()])
    }

    func testCSharp() {
        let key = Key(baseNote: .c(.sharp))
        XCTAssertEqual(key.notes, [.c(.sharp), .d(.sharp), .e(.sharp), .f(.sharp), .g(.sharp), .a(.sharp), .b(.sharp)])
    }

    func testDFlat() {
        let key = Key(baseNote: .d(.flat))
        XCTAssertEqual(key.notes, [.d(.flat), .e(.flat), .f(), .g(.flat), .a(.flat), .b(.flat), .c()])
    }

    func testD() {
        let key = Key(baseNote: .d())
        XCTAssertEqual(key.notes, [.d(), .e(), .f(.sharp), .g(), .a(), .b(), .c(.sharp)])
    }

    func testEFlat() {
        let key = Key(baseNote: .e(.flat))
        XCTAssertEqual(key.notes, [.e(.flat), .f(), .g(), .a(.flat), .b(.flat), .c(), .d()])
    }

    func testE() {
        let key = Key(baseNote: .e())
        XCTAssertEqual(key.notes, [.e(), .f(.sharp), .g(.sharp), .a(), .b(), .c(.sharp), .d(.sharp)])
    }

    func testF() {
        let key = Key(baseNote: .f())
        XCTAssertEqual(key.notes, [.f(), .g(), .a(), .b(.flat), .c(), .d(), .e()])
    }

    func testFSharp() {
        let key = Key(baseNote: .f(.sharp))
        XCTAssertEqual(key.notes, [.f(.sharp), .g(.sharp), .a(.sharp), .b(), .c(.sharp), .d(.sharp), .e(.sharp)])
    }

    func testGFlat() {
        let key = Key(baseNote: .g(.flat))
        XCTAssertEqual(key.notes, [.g(.flat), .a(.flat), .b(.flat), .c(.flat), .d(.flat), .e(.flat), .f()])
    }

    func testG() {
        let key = Key(baseNote: .g())
        XCTAssertEqual(key.notes, [.g(), .a(), .b(), .c(), .d(), .e(), .f(.sharp)])
    }


    func testAFlat() {
        let key = Key(baseNote: .a(.flat))
        XCTAssertEqual(key.notes, [.a(.flat), .b(.flat), .c(), .d(.flat), .e(.flat), .f(), .g()])
    }

    func testA() {
        let key = Key(baseNote: .a())
        XCTAssertEqual(key.notes, [.a(), .b(), .c(.sharp), .d(), .e(), .f(.sharp), .g(.sharp)])
    }

    func testBFlat() {
        let key = Key(baseNote: .b(.flat))
        XCTAssertEqual(key.notes, [.b(.flat), .c(), .d(), .e(.flat), .f(), .g(), .a()])
    }

    func testB() {
        let key = Key(baseNote: .b())
        XCTAssertEqual(key.notes, [.b(), .c(.sharp), .d(.sharp), .e(), .f(.sharp), .g(.sharp), .a(.sharp)])
    }

    func testCFlat() {
        let key = Key(baseNote: .c(.flat))
        XCTAssertEqual(key.notes, [.c(.flat), .d(.flat), .e(.flat), .f(.flat), .g(.flat), .a(.flat), .b(.flat)])
    }
}
