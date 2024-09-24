//
//  Repository.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation

protocol Repository {
    func getUniversity(country: String) -> [University]
    func getAvailableCountries() -> [String]
    func getComments(university: University) -> [Comment]
    func createComment(comment: Comment)
    
}
