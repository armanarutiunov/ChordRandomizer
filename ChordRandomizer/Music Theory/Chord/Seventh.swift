//
//  SeventhChord.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 19/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import Foundation

struct SeventhChord: Chord {

    enum SeventhQuality: String, CaseIterable, Quality {
        case major7 = "maj7"
        case dominant7 = "7"
        case minorMajor7 = "-maj7"
        case minor7 = "-7"
        case halfDiminished7 = "-7b5"
        case fullyDiminished7 = "7b5"
        case augmented7 = "7#5"

        static var random: SeventhQuality {
            let items: [(SeventhQuality, UInt)] = allCases.map { ($0, $0.weight) }
            return Randomizer.weightedRandomElement(items: items)
        }

        var shortDescription: String {
            rawValue
        }

        var fullDescription: String {
            switch self {
            case .major7:
                return "Major 7th"
            case .dominant7:
                return "Dominant 7th"
            case .minorMajor7:
                return "Minor-Major 7th"
            case .minor7:
                return "Minor 7th"
            case .halfDiminished7:
                return "Half Diminished 7th"
            case .fullyDiminished7:
                return "Fully Diminished 7th"
            case .augmented7:
                return "Augmented 7th"
            }
        }

        private var weight: UInt {
            switch self {
            case .major7:
                return 20
            case .dominant7:
                return 10
            case .minorMajor7:
                return 5
            case .minor7:
                return 30
            case .halfDiminished7:
                return 10
            case .fullyDiminished7:
                return 5
            case .augmented7:
                return 5
            }
        }
    }

    let root: Note
    let quality: Quality

    static var random: SeventhChord {
        SeventhChord(root: Note.random, quality: SeventhQuality.random)
    }
}
