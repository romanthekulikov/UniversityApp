//
//  UniversityModel.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation
import ObjectMapper

struct UniversityModel : University, Mappable {
    init?(map: ObjectMapper.Map) { /** nothing */ }
    
    mutating func mapping(map: ObjectMapper.Map) {
        country <- map["country"]
        code <- map["alpha_two_code"]
        links <- map["web_pages"]
        name <- map["name"]
        domains <- map["domains"]
    }
    
    var country: String = ""
    var code: String = ""
    var links: [String] = []
    var name: String = ""
    var domains: [String] = []
    
    
}
