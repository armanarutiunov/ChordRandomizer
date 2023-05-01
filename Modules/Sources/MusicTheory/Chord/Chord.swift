//
//  Chord.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 13/05/2020.
//  Copyright © 2020 Arman Arutiunov. All rights reserved.
//

import Foundation

public protocol Chord {
    var root: Note { get }
    var quality: Quality { get }
}

extension Chord {

    public func description(isShort: Bool = true) -> String {
        let space = isShort ? "" : " "
        return root.description + space + quality.description(isShort: isShort)
    }
}
