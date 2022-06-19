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

    @StateObject var viewModel = RandomizerViewModel()

    var labels: some View {
        VStack(alignment: .leading) {
            Text(viewModel.chord.description())
                .font(.system(size: 25))
        }.frame(minWidth: 300, maxWidth: 300, minHeight: 150, maxHeight: 150)
    }

    var buttons: some View {
        VStack {
            HStack {
                Button(action: viewModel.makeRandomTriad,
                       label: { Text("Random Triad") })
                Button(action: viewModel.makeRandomSeventhChord,
                       label: { Text("Random 7th Chord") })
            }
        }
    }

    var body: some View {
        VStack {
            Spacer()
            labels
            Spacer()
            buttons
            Spacer()
        }
        .frame(minWidth: 500, maxWidth: 500, minHeight: 300, maxHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RandomizerView()
    }
}
