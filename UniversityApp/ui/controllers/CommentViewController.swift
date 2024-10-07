//
//  CommentViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 07.10.2024.
//

import UIKit

class CommentViewController: BaseViewController, NavigativeController {
    
    static var navigationName: String = "CommentVC"
    

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var commentTextView: UITextView!
    
    var repository: Repository? = nil
    
    var university: University? = nil
    
    @IBOutlet weak var rateLabel: UILabel!
    var rate: Rate = Rate.three
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = injector.repository
        
    }

    @IBAction func rateSlider(_ sender: Any) {
        let value = slider.value
        if (value < 0.20) {
            rate = Rate.one
        } else if (value < 0.40 && value >= 0.20) {
            rate = Rate.two
        } else if (value < 0.60 && value >= 0.40) {
            rate = Rate.three
        } else if (value < 0.80 && value >= 0.60) {
            rate = Rate.four
        } else if (value >= 0.80) {
            rate = Rate.five
        }
        rateLabel.text = String(rate.rawValue)
    }
    
    @IBAction func onDoneClick(_ sender: Any) {
        let comment = CommentEntity()
        comment.rate = rate
        comment.text = commentTextView.text
        comment.universityName = university?.name ?? ""
        
        
        repository?.createComment(comment: comment)
        showToast(message: "Success add")
        finish()
    }
    
}
