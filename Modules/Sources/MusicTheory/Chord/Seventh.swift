//
//  SeventhChord.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 19/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import Foundation
import Utilities

public struct SeventhChord: Chord {

    // MARK: - Declarations

    enum SeventhQuality: String, CaseIterable, Quality {
        case major7 = "maj7"
        case dominant7 = "7"
        case minorMajor7 = "-maj7"
        case minor7 = "-7"
        case halfDiminished7 = "-7b5"
        case fullyDiminished7 = "7b5"
        case augmented7 = "7#5"

        static var random: SeventhQuality {
            Randomizer.weightedRandomElement(items: allCases) 
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

        var weight: UInt {
            switch self {
            case .major7:
                return 27

            case .dominant7:
                return 16

            case .minorMajor7:
                return 1

            case .minor7:
                return 36

            case .halfDiminished7:
                return 16

            case .fullyDiminished7:
                return 2

            case .augmented7:
                return 2
            }
        }
    }

    // MARK: - Properties

    public let root: Note

    public let quality: any Quality

    public static var random: SeventhChord {
        SeventhChord(root: Note.random, quality: SeventhQuality.random)
    }
}
