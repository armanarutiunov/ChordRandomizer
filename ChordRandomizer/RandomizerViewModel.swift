//
//  RandomizerViewModel.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 19/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import SwiftUI
import Combine

final class RandomizerViewModel: ObservableObject {

    @Published var chord: Chord

    init() {
        chord = Triad.random
    }

    func makeRandomTriad() {
        chord = Triad.random
    }

    func makeRandomSeventhChord() {
        chord = SeventhChord.random
    }
}
