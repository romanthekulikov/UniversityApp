//
//  MoyaUniversityClient.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 02.10.2024.
//

import Foundation
import Moya

enum MoyaUniversityClient {
    case getUniversity(country: AvailableCountry)
    
    
}

extension MoyaUniversityClient: TargetType {
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        return URL(string: "http://universities.hipolabs.com")!
    }
    
    var path: String {
        switch self {
        case .getUniversity(_):
            return "/search"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
            case .getUniversity(let country):
                return .requestParameters(parameters: ["country" : country.rawValue], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
