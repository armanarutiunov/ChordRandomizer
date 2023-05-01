//
//  File.swift
//  
//
//  Created by Arman Arutiunov on 01/05/2023.
//

import Foundation

public struct Key: Equatable {

    public let baseNote: Note

    private var sortedNotes: [Note] {
        var notes = [Note]()
        var endNotes = [Note]()

        for note in Note.allCases {
            if notes.isEmpty && note != baseNote {
                endNotes.append(note)
                continue
            }

            notes.append(note)
        }

        notes.append(contentsOf: endNotes)

        return notes
    }

    private var uniqueSortedNotes: [Note] {
        var uniqueNotes = [Note]()

        for note in sortedNotes {
            if !uniqueNotes.contains(where: { $0.id == note.id }) {
                uniqueNotes.append(note)
            }
        }

        return uniqueNotes
    }

    public var notes: [Note] {
        var notes = [Note]()
        var previousNote = baseNote

        for (index, note) in uniqueSortedNotes.enumerated() {
            guard [0,2,4,5,7,9,11].contains(index) else {
                continue
            }

            if notes.contains(where: { $0.id == note.id }) {
                continue
            }

            let correctedNote = correctedNote(note, previousNote: previousNote)
            notes.append(correctedNote)
            previousNote = correctedNote
        }

        return notes
    }

    public var triads: [Triad] {
        []
    }

    public var seventhChords: [SeventhChord] {
        []
    }

    public var description: String {
        "Key of \(baseNote.description) major: " + notes
            .map { $0.description }
            .joined(separator: " ")
    }

    public static var random: Key {
        let validBaseNotes: [Note] = [.c(), .c(.sharp), .d(.flat), .d(), .e(.flat), .e(), .f(), .f(.sharp), .g(.flat), .g(), .a(.flat), .a(), .b(.flat), .b(), .c(.flat)]
        let randomIndex = Int(arc4random_uniform(UInt32(validBaseNotes.count)))
        let randomBaseNote = validBaseNotes[randomIndex]
        return Key(baseNote: randomBaseNote)
    }

    // MARK: - Life Cycle

    public init(baseNote: Note) {
        self.baseNote = baseNote
    }

    // MARK: - Helpers

    private func correctedNote(_ note: Note, previousNote: Note) -> Note {
        if note == baseNote {
            return note
        } else if note.firstLetterDescription == previousNote.firstLetterDescription,
                  let nextNoteName = previousNote.firstLetterDescription.nextNoteLetter {
            let nextNoteFlat = Note(name: nextNoteName, accidental: .flat)!
            let nextNoteNatural = Note(name: nextNoteName)!
            return nextNoteFlat.id == note.id ? nextNoteFlat : nextNoteNatural
        } else if note.firstLetterDescription == previousNote.firstLetterDescription.nextNoteLetter?.nextNoteLetter,
                  let nextNoteName = previousNote.firstLetterDescription.nextNoteLetter,
                  let nextNote = Note(name: nextNoteName, accidental: .sharp) {
            return nextNote
        } else {
            return note
        }
    }
}
