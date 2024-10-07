//
//  ReviewsViewController.swift
//  UniversityApp
//
//  Created by Roman Kulikov on 04.10.2024.
//

import UIKit

class ReviewsViewController: BaseViewController, NavigativeController, UITableViewDelegate, UITableViewDataSource {
    
    static var navigationName: String = "Reviews"
    var university: University? = nil
    private var repository: Repository? = nil
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    @IBOutlet weak var universityNameLabel: UILabel!
    
    private var commentList: [Comment]? = nil
    
    override func viewDidLoad() {
        //commentsTableView.register(CommentCell.nib, forCellReuseIdentifier: CommentCell.identifier)
        //commentsTableView.estimatedRowHeight = 100
        commentsTableView.rowHeight = UITableView.automaticDimension
        super.viewDidLoad()
        repository = injector.repository
        universityNameLabel.text = university?.name ?? ""
        
        if (university != nil) {
            repository?.getComments(university: university!).then { comments in
                self.commentList = comments
                
                self.commentsTableView.reloadData()
            }
        }
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        
    }

    @IBAction func onAddButtonClick(_ sender: Any) {
        navigateTo(CommentViewController.self) { controller in
            controller.university = university
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell
        
        try? cell.configure(commentList![indexPath.row])
        
        cell.onArrowClick = {
            self.commentsTableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
    }
}

class CommentCell: UITableViewCell {

    @IBOutlet weak var ratelabel: UILabel!
    
    @IBOutlet weak var arrowIcon: UIImageView!
    
    @IBOutlet weak var commentTextLabel: UILabel!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    var onArrowClick: (() -> ())!
    
    
    private var textShowed: Bool = false
    
    // Set the identifier for the custom cell
    static let identifier = "CommentCell"

    // Returning the xib file after instantiating it
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(arrowTapped(tapGestureRecognizer:)))
//
//        arrowIcon.addGestureRecognizer(tapGestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        textShowed = !textShowed
        commentTextView.isHidden = !textShowed
        onArrowClick()
    }
    
    func configure(_ comment: Comment) {
        ratelabel.text = String(comment.rate.rawValue)
        commentTextView.text = comment.text
        commentTextLabel.text = comment.text
        
    }
//    
//    @objc func arrowTapped(tapGestureRecognizer: UITapGestureRecognizer) {
//        textShowed = !textShowed
//        commentTextView.isHidden = !textShowed
//        onArrowClick()
//    }
    
    
}
