//
//  CommentModel.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation
import RealmSwift

class CommentEntity : Object, Comment {
    
    @objc dynamic var universityName: String = ""
    @objc dynamic internal var _rate: String {
        get {
            return rate.toString()
        }
    }
    @objc dynamic var text: String = ""
    
    var rate: Rate {
        get {
            return self.rate.fromString(obj: _rate)
        }
    }
    
    override static func ignoredProperties() -> [String] {
            return ["rate"]
    }
    
}
