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
    private let universityClient = MoyaProvider<MoyaUniversityClient>()
    
    func getUniversity(country: AvailableCountry) -> Promise<[University]?> {
        let promise = Promise<[University]?>() { fulfill, reject in
            self.universityClient.request(.getUniversity(country: country)) { result in
                switch result {
                    case .success(let response):
                        let universityJson = try? response.mapArray(UniversityModel.self)
                        fulfill(universityJson)

                    case .failure(let error):
                        reject(error)
                    
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
