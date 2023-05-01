//
//  RandomizerView.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 13/05/2020.
//  Copyright © 2020 Arman Arutiunov. All rights reserved.
//

import SwiftUI
import Combine

struct RandomizerView: View {

    // MARK: - Properties

    @StateObject var viewModel = RandomizerViewModel()

    // MARK: - Body

    var body: some View {
        VStack {
            Spacer()
            labels
            Spacer()
            buttons
            Spacer()
        }
    }

    private var labels: some View {
        VStack(spacing: 25) {
            Text(viewModel.key.description)
                .font(.title)
            Text(viewModel.chord.description())
                .font(.largeTitle)
        }
    }

    private var buttons: some View {
        VStack {
            HStack {
                Button(action: viewModel.makeRandomTriad,
                       label: { Text("Random Triad") })

                Button(action: viewModel.makeRandomSeventhChord,
                       label: { Text("Random 7th Chord") })

                Button(action: viewModel.makeRandomKey,
                       label: { Text("Random Key") })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RandomizerView()
    }
}
