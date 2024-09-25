//
//  RepositoryImpl.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation


class RepositoryImpl : Repository {
    func getUniversity(country: String) -> [University] {
        return [UniversityModel()]
    }
    
    func getAvailableCountries() -> [AvailableCountry] {
        return AvailableCountry.allCases
    }
    
    func getComments(university: University) -> [Comment] {
        return [CommentModel()]
    }
    
    func createComment(comment: Comment) {
        // nothing
    }
    
    
}
