//
//  Randomizer.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 19/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import Foundation

struct Randomizer {

    static func weightedRandomElement<T>(items: [(T, UInt)]) -> T {

        let total = items.map { $0.1 }.reduce(0, +)
        precondition(total > 0, "The sum of the weights must be positive")

        let rand = UInt(arc4random_uniform(UInt32(total)))

        var sum = UInt(0)
        for (element, weight) in items {
            sum += weight
            if rand < sum {
                return element
            }
        }

        fatalError("This should never be reached")
    }
}
