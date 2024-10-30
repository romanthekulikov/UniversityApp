import UIKit


class CommentCell: UITableViewCell {

    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var ratelabel: UILabel!
    
    @IBOutlet weak var arrowIcon: UIImageView!
    
    @IBOutlet weak var commentTextLabel: UILabel!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    static let identifier = "CommentCell"
    
    var onClick: (() -> ()) = {}
    
    
    func configure(_ comment: (Comment, Bool)) {
        
        ratelabel.text = String(comment.0.rate.rawValue)
        commentTextView.text = comment.0.text
        commentTextLabel.text = comment.0.text
        
        commentView.isHidden = comment.1
        
    }
    
    
}
