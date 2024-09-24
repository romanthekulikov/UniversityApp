//
//  Comment.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation

protocol Comment {
    var universityName: String { get }
    var rate: Rate { get }
    var text: String { get }
    
}
