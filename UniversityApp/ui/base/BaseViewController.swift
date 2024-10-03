//
//  BaseViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 25.09.2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    var injector: Injector = AppInjector.instance
    
    func navigate<T: BaseViewController>(_ dump: T.Type, from: String, to: String, additional: (T) -> Void) where T: NavigativeController {
        
        // В планах брать имя сториборда для реализации перехода из контроллеров при помощи реализации ими протокола NavigativeController
        let storyboard = UIStoryboard(name: from, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: to) as! T
        additional(vc)
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

protocol NavigativeController {
    var navigationName: String { get set }
}
