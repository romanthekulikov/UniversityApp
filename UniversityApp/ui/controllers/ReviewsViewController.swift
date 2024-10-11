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
        tableView.estimatedRowHeight = 80
        
        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell
        cell.configure(commentList![indexPath.item])
        cell.commentTextView.isHidden = !cell.commentTextView.isHidden
        
        return cell
    }
}

class CommentCell: UITableViewCell {

    @IBOutlet weak var ratelabel: UILabel!
    
    @IBOutlet weak var arrowIcon: UIImageView!
    
    @IBOutlet weak var commentTextLabel: UILabel!
    
    @IBOutlet weak var commentTextView: UITextView! {
        didSet {
            commentTextView.isHidden = true
        }
    }
    
    
    private var textShowed: Bool = false
    
    static let identifier = "CommentCell"

    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onArraowClick(tapGestureRecognizer:)))
        arrowIcon.isUserInteractionEnabled = true
        arrowIcon.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func onArraowClick(tapGestureRecognizer: UITapGestureRecognizer){
        textShowed = !textShowed
        self.commentTextView.isHidden = !self.textShowed

        arrowIcon.transform = !textShowed ? CGAffineTransform(rotationAngle: .pi / 2) : .identity
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    }
    
    
    
    func configure(_ comment: Comment) {
        ratelabel.text = String(comment.rate.rawValue)
        commentTextView.text = comment.text
        commentTextLabel.text = comment.text
        
    }
    
    
}
