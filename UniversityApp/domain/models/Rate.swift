//
//  Rate.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation


enum Rate : Int, DBAdapter {
    typealias T = Rate
    
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case nothing = -1
    
    
    func toString() -> String {
        switch self {
        case .one:
            return "one"
        case .two:
            return "two"
        case .three:
            return "three"
        case .four:
            return "four"
        case .five:
            return "five"
        case .nothing:
            return "nothing"
        }
    
    }
    
    func fromString(obj: String) -> Rate {
        switch obj {
        case "one":
            return .one
        case "two":
            return .two
        case "three":
            return .three
        case "four":
            return .four
        case "five":
            return .five
        default:
            return .nothing
        }
    }
}
