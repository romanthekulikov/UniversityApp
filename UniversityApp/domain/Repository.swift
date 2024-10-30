//
//  Repository.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation
import Promises

protocol Repository {
    func getUniversity(country: AvailableCountry) -> Promise<[University]?>
    func getAvailableCountries() -> [AvailableCountry]
    func getComments(university: University) -> Promise<[Comment]>
    func createComment(comment: CommentEntity)
    func getMiddleRateUniversity(university: University) -> Promise<Double>
    
}
