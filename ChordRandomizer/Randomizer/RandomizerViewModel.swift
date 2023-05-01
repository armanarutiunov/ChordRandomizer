//
//  RandomizerViewModel.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 19/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import SwiftUI
import Combine
import MusicTheory

final class RandomizerViewModel: ObservableObject {

    // MARK: - Properties

    @Published var key: Key = Key.random

    @Published var chord: Chord = Triad.random

    // MARK: - Actions

    func makeRandomTriad() {
        chord = Triad.random
    }

    func makeRandomSeventhChord() {
        chord = SeventhChord.random
    }

    func makeRandomKey() {
        let randomKey = Key.random
        if randomKey != key {
            key = randomKey
        } else {
            makeRandomKey()
        }
    }
}
