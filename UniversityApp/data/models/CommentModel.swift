//
//  CommentModel.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation

struct CommentModel : Comment {
    var universityName: String = ""
    var rate: Rate = Rate.nothing
    var text: String = ""
    
}
