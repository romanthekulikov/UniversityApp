//
//  DBAdapter.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 04.10.2024.
//

import Foundation


protocol DBAdapter<T> {
    associatedtype T : Any
    
    func toString() -> String
    func fromString(obj: String) -> T
}
