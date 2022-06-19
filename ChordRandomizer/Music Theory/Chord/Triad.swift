//
//  Triad.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 19/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import Foundation

struct Triad: Chord {

    enum TriadQuality: String, CaseIterable, Quality {
        case major = ""
        case minor = "-"
        case diminished = "b5"
        case augmented = "#5"

        static var random: Quality {
            let items: [(TriadQuality, UInt)] = allCases.map { ($0, $0.weight) }
            return Randomizer.weightedRandomElement(items: items)
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

        private var weight: UInt {
            switch self {
            case .major:
                return 30
            case .minor:
                return 30
            case .diminished:
                return 10
            case .augmented:
                return 5
            }
        }
    }

    let root: Note
    let quality: Quality

    static var random: Triad {
        Triad(root: Note.random, quality: TriadQuality.random)
    }
}
