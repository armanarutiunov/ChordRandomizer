//
//  Quality.swift
//  ChordRandomizer
//
//  Created by Arman Arutiunov on 19/03/2021.
//  Copyright © 2021 Arman Arutiunov. All rights reserved.
//

protocol Quality {
    var shortDescription: String { get }
    var fullDescription: String { get }
}

extension Quality {
    func description(isShort: Bool) -> String {
        isShort ? shortDescription : fullDescription
    }
}
