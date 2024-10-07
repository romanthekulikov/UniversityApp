//
//  CommentModel.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation
import RealmSwift

class CommentEntity : Object, Comment {
    @Persisted var universityName: String
    @Persisted var rate: Rate
    @Persisted var text: String
    
    
}
