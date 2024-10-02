//
//  RepositoryImpl.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper
import Promises


class RepositoryImpl : Repository {
    func getUniversity(country: AvailableCountry) -> Promise<[University]?> {
        let promise = Promise<[University]?>() { fulfill, reject in
            let provider = MoyaProvider<MoyaUniversityClient>()
            provider.request(.getUniversity(country: country)) { result in
                switch result {
                    case .success(let response):
                        let universityJson = try! response.mapArray(UniversityModel.self)
                        fulfill(universityJson)
                    
                    case .failure(_):
                        fulfill(nil)
                }
            }
        }

        return promise
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
