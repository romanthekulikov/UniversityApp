//
//  Rate.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation
import RealmSwift


enum Rate : Int, PersistableEnum {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case nothing = -1

}
