//
//  BaseViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 25.09.2024.
//

import UIKit

class BaseViewController: UIViewController {
    var injector: Injector = AppInjector.instance
    
    func navigate<T>(from: String, to: String, additional: (T) -> Void) where T: BaseViewController {
        let storyboard = UIStoryboard(name: from, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: to) as! T
        additional(vc)
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true)
    }
}
