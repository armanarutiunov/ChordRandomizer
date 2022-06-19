//
//  Chord.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 13/05/2020.
//  Copyright © 2020 Arman Arutiunov. All rights reserved.
//

import Foundation

protocol Chord {
    var root: Note { get }
    var quality: Quality { get }
}

extension Chord {
    func description(isShort: Bool = true) -> String {
        "\(root.description) \(quality.description(isShort: isShort))"
    }
}
