//
//  CommentsViewTable.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 12/4/24.
//

import UIKit

class CommentsView: UIView {

    var tableViewComment: UITableView!
    
    //MARK: bottom view for adding a Contact...
    var bottomAddView:UIView!
    var textViewAddComment:UITextView!
    var buttonAdd:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .white
        setupBackground()
        
        setupTableViewContacts()
        setupBottomAddView()
        setupTextFieldAddNote()
        setupButtonAdd()
        
        initConstraints()
    }
    
    //MARK: the table view to show the list of contacts...
    func setupTableViewContacts(){
        tableViewComment = UITableView()
        tableViewComment.register(CommentsTableView.self, forCellReuseIdentifier: Configs.tableViewCommentsID)
        tableViewComment.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewComment)
    }
    
    func setupBottomAddView(){
        bottomAddView = UIView()
        bottomAddView.backgroundColor = .white
        bottomAddView.layer.cornerRadius = 6
        bottomAddView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomAddView.layer.shadowOffset = .zero
        bottomAddView.layer.shadowRadius = 4.0
        bottomAddView.layer.shadowOpacity = 0.7
        bottomAddView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomAddView)
    }
    
    func setupTextFieldAddNote(){
        textViewAddComment = UITextView()
        textViewAddComment.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textViewAddComment)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonAdd.setTitle("Send Message", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(buttonAdd)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([

            bottomAddView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            bottomAddView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            bottomAddView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            buttonAdd.bottomAnchor.constraint(equalTo: bottomAddView.bottomAnchor, constant: -8),
            buttonAdd.leadingAnchor.constraint(equalTo: bottomAddView.leadingAnchor, constant: 4),
            buttonAdd.trailingAnchor.constraint(equalTo: bottomAddView.trailingAnchor, constant: -4),
            
            textViewAddComment.bottomAnchor.constraint(equalTo: buttonAdd.topAnchor, constant: -8),
            textViewAddComment.leadingAnchor.constraint(equalTo: buttonAdd.leadingAnchor, constant: 4),
            textViewAddComment.trailingAnchor.constraint(equalTo: buttonAdd.trailingAnchor, constant: -4),
            textViewAddComment.heightAnchor.constraint(equalToConstant: 64),
            
            bottomAddView.topAnchor.constraint(equalTo: textViewAddComment.topAnchor, constant: -8),
            
            tableViewComment.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableViewComment.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewComment.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewComment.bottomAnchor.constraint(equalTo: bottomAddView.topAnchor, constant: -8),
            
            
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
