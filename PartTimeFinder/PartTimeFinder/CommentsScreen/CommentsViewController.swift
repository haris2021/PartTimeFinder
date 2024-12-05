//
//  CommentsViewController.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 12/4/24.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class CommentsViewController: UIViewController {
    
    let commentsView = CommentsView()
    var jobID: String?
    let database = Firestore.firestore()
    var commenterName: String?
    var commentList = [Comment]()
    
    override func loadView() {
        view = commentsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments on "
        commentsView.tableViewComment.separatorStyle = .none
        
        commentsView.buttonAdd
            .addTarget(self, action: #selector(onButtonAddCommentTapped), for: .touchUpInside)
        
        commentsView.tableViewComment.delegate = self
        commentsView.tableViewComment.dataSource = self
        
        fetchComments()
        
    }
    
    @objc func onButtonAddCommentTapped() {
        
        if let comment = commentsView.textViewAddComment.text?.trimmingCharacters(in: .whitespacesAndNewlines),
           !comment.isEmpty {
            
            if let jID = jobID {
                let collectionComments = database
                    .collection("jobs")
                    .document(jID)
                    .collection("comments")
                
                do{
                    let momentInTime = Date()
                    let formatter = DateFormatter()
                    formatter.timeZone = TimeZone.current  // Set to the current timezone
                    formatter.dateStyle = .medium
                    formatter.timeStyle = .medium
                    
                    let dateString = formatter.string(from: momentInTime)
                    print("Current date and time in local timezone: \(dateString)")
                    
                    let comment = Comment(commenterName: commenterName ?? "",
                                          commentContent: commentsView.textViewAddComment.text,
                                          time: dateString
                    )
                    try collectionComments.addDocument(from: comment, completion: {(error) in
                        if error == nil{
                            self.commentList.append(comment)
                            self.commentsView.tableViewComment.reloadData()
                            
                            let indexPath = IndexPath(row: self.commentList.count - 1, section: 0)
                            self.commentsView.tableViewComment.scrollToRow(at: indexPath, at: .bottom, animated: true)
                        }
                    })
                }catch{
                    print("Error adding document!")
                }
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Msg is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        commentsView.textViewAddComment.text = ""
    }
    
    func fetchComments() {
        print("Here")
        if let jID = jobID {
            self.database.collection("jobs")
                .document(jID)
                .collection("comments")
                .getDocuments { querySnapshot, error in
                    if let error = error {
                        print("Error fetching comments: \(error.localizedDescription)")
                        return
                    }
                    if let documents = querySnapshot?.documents {
                        self.commentList.removeAll()
                        for document in documents {
                            do {
                                let comment = try document.data(as: Comment.self)
                                self.commentList.append(comment)
                            } catch {
                                print("Error decoding friend data: \(error)")
                            }
                        }
                        
                        self.commentList.sort(by: { $0.time < $1.time })
                        self.commentsView.tableViewComment.reloadData()
                        let indexPath = IndexPath(row: self.commentList.count - 1, section: 0)
                        if !self.commentList.isEmpty {
                            let indexPath = IndexPath(row: self.commentList.count - 1, section: 0)
                            self.commentsView.tableViewComment.scrollToRow(at: indexPath, at: .bottom, animated: true)
                        }
                    }
                }
        }
    }
}
