//
//  ReviewsViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 04.10.2024.
//

import UIKit

class ReviewsViewController: BaseViewController, NavigativeController {
    var navigationName: String = "Reviews"
    var university: University? = nil
    private var repository: Repository? = nil
    
    @IBOutlet weak var universityNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = injector.repository
        universityNameLabel.text = university?.name ?? ""
        
        if (university != nil) {
            repository?.getComments(university: university!).then { comments in
                
            }
        }
        
        
    }

    @IBAction func onAddButtonClick(_ sender: Any) {
    }
}
