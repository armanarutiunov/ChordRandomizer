//
//  Note.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 18/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import Foundation

public enum Note: CustomStringConvertible, CaseIterable {

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
        c(nil),   c(.sharp),
        d(nil),
        e(.flat), e(nil),
        f(nil),   f(.sharp),
        g(nil),
        a(.flat), a(nil),
        b(.flat), b(nil)
    ]

    /// This function returns the frequency of this note in the 4th octave.
    private var frequency: Double {
        let index = Note.allCases.firstIndex(where: { $0 == self })! -
                    Note.allCases.firstIndex(where: { $0 == Note.a(nil) })!

        return 440 * pow(2, Double(index) / 12.0)
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

    static var random: Note {
        let randomIndex = Int(arc4random_uniform(UInt32(allCases.count)))
        return allCases[randomIndex]
    }
}

/// We override the equality operator so we can use `indexOf` on the static array
/// of all notes. Using the `description` property isn't the most idiomatic way
/// to do this but it does the job.
func ==(a: Note, b: Note) -> Bool {
    return a.description == b.description
}
