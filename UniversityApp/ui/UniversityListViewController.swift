//
//  UniversityListViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 24.09.2024.
//

import UIKit

class UniversityListViewController: BaseViewController, NavigativeController, UITableViewDelegate, UITableViewDataSource {
    var navigationName: String = "UniversityList"
    
    var selectedCountry: AvailableCountry? = nil
    var repository: Repository? = nil
    var university: [University]? = nil

    @IBOutlet weak var universityTableView: UITableView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository = injector.repository
        progressIndicator.startAnimating()
        
        repository?.getUniversity(country: selectedCountry!).then { university in
            self.progressIndicator.stopAnimating()
            self.progressIndicator.isHidden = true
            self.university = university
    
            self.universityTableView.reloadData()
        }
        
        self.universityTableView.delegate = self
        self.universityTableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return university?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "university", for: indexPath)
        cell.textLabel?.text = university?[indexPath.row].name ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(university?[indexPath.row].name ?? "")
        navigate(UniversityViewController.self, from: "Main", to: "University") { controller in
            controller.university = university?[indexPath.row]
        }
    }

}
