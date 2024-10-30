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
    
    private var commentList: [(Comment, Bool)] = []
    private var selectedIndex: IndexPath? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        repository = injector.repository
        
        universityNameLabel.text = university?.name ?? ""
        fillCommentTable()
        
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }

    @IBAction func onAddButtonClick(_ sender: Any) {
        navigateTo(CommentViewController.self) { controller in
            controller.university = university
        }
    }
    
    func fillCommentTable() {
        if (university != nil) {
            repository?.getComments(university: university!).then { comments in
                for comment in comments {
                    self.commentList.append((comment, true))
                }
                
                self.commentsTableView.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexesToRedraw = [indexPath]
        selectedIndex = indexPath
        commentList[indexPath.row].1 = !commentList[indexPath.row].1
        tableView.reloadRows(at: indexesToRedraw, with: .none)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell
        cell.configure(commentList[indexPath.row])
        
        
        return cell
    }
    
    
}


