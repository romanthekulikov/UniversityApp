//
//  UniversityViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 03.10.2024.
//

import UIKit

class UniversityViewController: BaseViewController, NavigativeController {
    static var navigationName: String = "University"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var domainsLabel: UILabel!
    
    @IBOutlet weak var linkButton: UIButton!
    
    var university: University? = nil
    
    private let webHelper = WebHelper()
    
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
        navigateTo(ReviewsViewController.self) { controller in
            controller.university = self.university
        }
    }
    
    @IBAction func onLinkClick(_ sender: Any) {
        webHelper.openLink(link: university?.links[0] ?? "")
    }
    
    @IBAction func onShareButtonClick(_ sender: Any) {
        share()
    }
    
    private func share() {
        guard let links = university?.links else { return }
        if links.isEmpty { return }
        
        let text = ["Hello, check this university!\nName: \(university?.name ?? "")\nLink: \(links[0])"]
        
        let ac = UIActivityViewController(activityItems: text, applicationActivities: [])
        present(ac, animated: true)
    }
}
