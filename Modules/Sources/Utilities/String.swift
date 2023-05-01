//
//  String.swift
//  
//
//  Created by Arman Arutiunov on 01/05/2023.
//

extension String {

    public var nextNoteLetter: String? {

        // Check if string is build from exactly one Unicode scalar:
        guard let uniCode = UnicodeScalar(self) else {
            return nil
        }
        switch uniCode {
        case "A" ..< "G":
            return String(UnicodeScalar(uniCode.value + 1)!)
        default:
            return "A"
        }
    }
}
