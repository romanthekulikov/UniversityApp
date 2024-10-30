//
//  AppInjector.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 25.09.2024.
//

import Foundation

class AppInjector : Injector {
    private static var injectorInstance: AppInjector?
    
    static var instance: Injector {
        if AppInjector.injectorInstance == nil {
            AppInjector.injectorInstance = AppInjector()
        }
        
        return injectorInstance!
    }
    
    var repository: Repository = RepositoryImpl()
}
