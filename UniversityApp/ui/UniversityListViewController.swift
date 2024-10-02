//
//  UniversityListViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import UIKit

class UniversityListViewController: BaseViewController, NavigativeController {
    var navigationName: String = "UniversityList"
    
    var selectedCountry: AvailableCountry? = nil
    var repository: Repository? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        repository = injector.repository
        repository?.getUniversity(country: selectedCountry!).then { university in
            let t = 5
            let tt = t
        }

    }

}
