//
//  Pitch.swift
//  
//
//  Created by Arman Arutiunov on 01/05/2023.
//

import Foundation

public struct Pitch: Equatable {

    public let note: Note

    public let octave: Octave

    private let uniquePitches: [Pitch] = {
        var pitches = [Pitch]()

        for octave in Octave.allCases {
            for note in Note.allCases {
                guard !pitches.isEmpty else {
                    pitches.append(.init(note: note, octave: octave))
                    continue
                }

                guard let lastNote = pitches.last,
                      lastNote.note.id < note.id else {
                    continue
                }

                pitches.append(Pitch(note: note, octave: octave))
            }
        }
        return pitches
    }()

    public var frequency: Double {
        let a4Index = uniquePitches.firstIndex(where: { $0.note.id == Pitch(note: .a(), octave: .four).note.id })!
        let currentNoteIndex = uniquePitches.firstIndex(where: { $0.note.id == note.id })!
        let currentNoteIndexRelativeToA4 = currentNoteIndex - a4Index
        return 440 * pow(2, Double(currentNoteIndexRelativeToA4) / Double(uniquePitches.count))
    }

    // MARK: - Life Cycle

    public init(note: Note, octave: Octave) {
        self.note = note
        self.octave = octave
    }
}
