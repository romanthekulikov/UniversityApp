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
import RealmSwift


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
    
    func getComments(university: University) -> Promise<[Comment]> {
        return Promise<[Comment]>() { fulfill, reject in
            let realm = try! Realm()
            let predicate = NSPredicate(format: "universityName = %@", university.name)
            let comments = realm.objects(CommentEntity.self).filter(predicate).shuffled()
            fulfill(comments)
            
        }
    }
    
    func createComment(comment: CommentEntity) {
        let realm = try! Realm()
        try? realm.write {
            realm.add(comment)
        }
    }
    
    
    func getMiddleRateUniversity(university: University) -> Promises.Promise<Double> {
        return Promise<Double>() { fulfill, reject in
            let realm = try! Realm()
            let predicate = NSPredicate(format: "universityName = %@", university.name)
            let comments = realm.objects(CommentEntity.self).filter(predicate).shuffled()
            var rateSum = 0.0
            for comment in comments {
                rateSum += Double(comment.rate.rawValue)
            }
            let count = Double(comments.count)
            if count != 0 {
                fulfill(Double(rateSum / count))
            } else {
                fulfill(0)
            }
            
        }
    }
    
}
