//
//  Note.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 18/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import Foundation

public enum Note: CustomStringConvertible, CaseIterable, Identifiable, Equatable {

    // MARK: - Declarations

    public enum Accidental: String {
        case sharp = "♯"
        case flat  = "♭"
    }

    // MARK: - Cases

    case c(Accidental? = nil)
    case d(Accidental? = nil)
    case e(Accidental? = nil)
    case f(Accidental? = nil)
    case g(Accidental? = nil)
    case a(Accidental? = nil)
    case b(Accidental? = nil)

    // MARK: - Properties

    /// This array contains all notes.
    public static let allCases: [Note] = [
        c(),
        c(.sharp), d(.flat),
        d(),
        d(.sharp), e(.flat),
        e(),
        f(),
        f(.sharp), g(.flat),
        g(),
        g(.sharp), a(.flat),
        a(),
        a(.sharp), b(.flat),
        b(), c(.flat),
    ]

    public var id: Int {
        switch self {
        case .c(nil), .b(.sharp):
            return 0

        case .c(.sharp), .d(.flat):
            return 1

        case .d(nil):
            return 2

        case .d(.sharp), .e(.flat):
            return 3

        case .e(nil), .f(.flat):
            return 4

        case .e(.sharp), .f(nil):
            return 5

        case .f(.sharp), .g(.flat):
            return 6

        case .g(nil):
            return 7

        case .g(.sharp), .a(.flat):
            return 8

        case .a(nil):
            return 9

        case .a(.sharp), .b(.flat):
            return 10

        case .b(nil), .c(.flat):
            return 11
        }
    }

    /// This property is used in the User Interface to show the name of this note.
    public var description: String {
        let concat = { (letter: String, accidental: Accidental?) in
            return letter + (accidental != nil ? accidental!.rawValue : "")
        }

        switch self {
            case let .c(a):
                return concat("C", a)

            case let .d(a):
                return concat("D", a)

            case let .e(a):
                return concat("E", a)

            case let .f(a):
                return concat("F", a)

            case let .g(a):
                return concat("G", a)

            case let .a(a):
                return concat("A", a)

            case let .b(a):
                return concat("B", a)
        }
    }

    public var firstLetterDescription: String {
        "\(description.first!)"
    }

    // MARK: - Life Cycle

    public init?(name: String, accidental: Accidental? = nil) {
        switch (name, accidental) {
        case ("C", nil):
            self = .c()

        case ("C", .flat):
            self = .c(.flat)

        case ("C", .sharp):
            self = .c(.sharp)

        case ("D", nil):
            self = .d()

        case ("D", .flat):
            self = .d(.flat)

        case ("D", .sharp):
            self = .d(.sharp)

        case ("E", nil):
            self = .e()

        case ("E", .flat):
            self = .e(.flat)

        case ("E", .sharp):
            self = .e(.sharp)

        case ("F", nil):
            self = .f()

        case ("F", .flat):
            self = .f(.flat)

        case ("F", .sharp):
            self = .f(.sharp)

        case ("G", nil):
            self = .g()

        case ("G", .flat):
            self = .g(.flat)

        case ("G", .sharp):
            self = .g(.sharp)

        case ("A", nil):
            self = .a()

        case ("A", .flat):
            self = .a(.flat)

        case ("A", .sharp):
            self = .a(.sharp)

        case ("B", nil):
            self = .b()

        case ("B", .flat):
            self = .b(.flat)

        case ("B", .sharp):
            self = .b(.sharp)

        default:
            return nil
        }
    }

    static var random: Note {
        let randomIndex = Int(arc4random_uniform(UInt32(allCases.count)))
        return allCases[randomIndex]
    }

    // MARK: - Actions

    public func frequency(inOctave octave: Octave) -> Double {
        Pitch(note: self, octave: octave).frequency
    }
}
