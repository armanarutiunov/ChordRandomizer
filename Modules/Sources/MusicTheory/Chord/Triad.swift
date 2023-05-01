//
//  Triad.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 19/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import Foundation
import Utilities

public struct Triad: Chord {

    // MARK: - Declarations

    enum TriadQuality: String, CaseIterable, Quality {
        case major = ""
        case minor = "-"
        case diminished = "b5"
        case augmented = "#5"

        static var random: Quality {
            return Randomizer.weightedRandomElement(items: allCases)
        }

        var shortDescription: String {
            rawValue
        }

        var fullDescription: String {
            switch self {
            case .major:
                return "Major"
            case .minor:
                return "Minor"
            case .diminished:
                return "Diminished"
            case .augmented:
                return "Augmented"
            }
        }

        var weight: UInt {
            switch self {
            case .major:
                return 39

            case .minor:
                return 39

            case .diminished:
                return 19

            case .augmented:
                return 3
            }
        }
    }

    // MARK: - Properties

    public let root: Note

    public let quality: Quality

    public static var random: Triad {
        Triad(root: Note.random, quality: TriadQuality.random)
    }
}
