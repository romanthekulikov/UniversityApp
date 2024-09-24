//
//  University.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import Foundation

protocol University {
    var country: String { get }
    var code: String { get }
    var links: [String] { get }
    var name: String { get }
    var domains: [String] { get }
    
}
