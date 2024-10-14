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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell
        cell.configure(commentList![indexPath.row])
        cell.onClick = { tableView.reloadRows(at: [indexPath], with: .none) }
        
        return cell
    }
    
}

class CommentCell: UITableViewCell {

    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var ratelabel: UILabel!
    
    @IBOutlet weak var arrowIcon: UIImageView!
    
    @IBOutlet weak var commentTextLabel: UILabel!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    private var textShowed: Bool = false
    
    static let identifier = "CommentCell"
    
    var onClick: (() -> ()) = {}
    
    
    
    func configure(_ comment: Comment) {
        ratelabel.text = String(comment.rate.rawValue)
        commentTextView.text = comment.text
        commentTextLabel.text = comment.text
        
    }
    
    
}

extension CommentCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onArrowClick(tapGestureRecognizer:)))
        arrowIcon.isUserInteractionEnabled = true
        arrowIcon.addGestureRecognizer(tapGestureRecognizer)
        hideCommentView()
    }

    @objc func onArrowClick(tapGestureRecognizer: UITapGestureRecognizer) {
        if isCommentViewHidden {
            showCommentView()
        } else {
            hideCommentView()
        }
        onClick()
    }
    
    var isCommentViewHidden: Bool {
        return commentView.isHidden
    }
    
    func hideCommentView() {
        commentView.isHidden = true
    }
    
    func showCommentView() {
        commentView.isHidden = false
    }
}
