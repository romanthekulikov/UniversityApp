//
//  UniversityViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 03.10.2024.
//

import UIKit

class UniversityViewController: BaseViewController, NavigativeController {
    var navigationName: String = "University"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var domainsLabel: UILabel!
    
    @IBOutlet weak var linkButton: UIButton!
    
    var university: University? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = university?.name ?? ""
        countryLabel.text = "Country: " + (university?.country ?? "")
        codeLabel.text = "Alpha code: " + (university?.code ?? "")
        domainsLabel.text = "Domains: " + (university?.domains.joined(separator: ", ") ?? "")
        if university?.links == nil || university!.links.isEmpty {
            linkButton.isHidden = true
        }
    }
    

    @IBAction func onReviewsButtonClick(_ sender: Any) {
        
    }
    
    @IBAction func onLinkClick(_ sender: Any) {
    }
    
    @IBAction func onShareButtonClick(_ sender: Any) {
    }
}
