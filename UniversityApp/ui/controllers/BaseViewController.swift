//
//  BaseViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 25.09.2024.
//

import UIKit
import Toast_Swift

class BaseViewController: UIViewController {
    
    var injector: Injector = AppInjector.instance
    
    func navigateTo<T: BaseViewController>(_ dump: T.Type, additional: (T) -> Void) where T: NavigativeController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: T.navigationName) as! T
        additional(vc)
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func finish() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showToast(message : String) {
        self.navigationController?.view.makeToast(message)
    }
    
}

protocol NavigativeController {
    static var navigationName: String { get set }
}
