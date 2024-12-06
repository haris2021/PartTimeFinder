//
//  CommentsTableViewController.swift
//  PartTimeFinder
//
//  Created by Rahul Chandak on 12/4/24.
//

import Foundation
import UIKit

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewCommentsID, for: indexPath) as! CommentsTableView
        
        cell.labelCommenterName.text = commentList[indexPath.row].commenterName
        cell.labelCommentContent.text = commentList[indexPath.row].commentContent
        cell.labelCommentTime.text = commentList[indexPath.row].time
        return cell
    }
}
