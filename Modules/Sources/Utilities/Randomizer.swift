//
//  Randomizer.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 19/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

import Foundation

public protocol Weightable {
    var weight: UInt { get }
}

public struct Randomizer {

    public static func weightedRandomElement<T: Weightable>(items: [T]) -> T {

        let total = items
            .map { $0.weight }
            .reduce(0, +)

        precondition(total > 0, "The sum of the weights must be positive")

        let random = UInt(arc4random_uniform(UInt32(total)))

        var sum = UInt(0)

        for element in items {
            sum += element.weight
            if random < sum {
                return element
            }
        }

        fatalError("This should never be reached")
    }
}
