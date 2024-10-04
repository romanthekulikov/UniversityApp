//
//  WebHelper.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 04.10.2024.
//

import Foundation
import UIKit


class WebHelper {
    
    func openLink(link: String) {
        guard let url = URL(string: link) else { return }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    
}
