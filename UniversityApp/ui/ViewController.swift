//
//  ViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 23.09.2024.
//

import UIKit

class ViewController : BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var repository: Repository? = nil
    var availableCountries: [AvailableCountry]? = nil
    var selectedCountry: AvailableCountry? = nil
    
    @IBOutlet weak var countryPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = injector.repository
        availableCountries = repository?.getAvailableCountries()
        
        countryPicker.delegate = self
        countryPicker.dataSource = self
        
    }
    
    @IBAction func onSelectClick(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "UniversityList") as! UniversityListViewController
//        vc.modalPresentationStyle = .fullScreen
//        vc.title = selectedCountry?.rawValue
//        self.navigationController?.present(vc, animated: true)
        
        navigate<>(from: "", to: "", additional: {})
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableCountries?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return availableCountries?[row].rawValue ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = availableCountries?[row] ?? AvailableCountry.unitedKingdom
    }


}

