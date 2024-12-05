import UIKit

class CommentsTableView: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelCommenterName: UILabel!
    var labelCommentContent: UILabel!
    var labelCommentTime: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelSenderName()
        setupLabelMsg()
        setupLabelTime()
        
        initConstraints()
    }

    func setupWrapperCellView() {
        wrapperCellView = UIView()
        
        // Set background color and styling for chat bubble
        wrapperCellView.backgroundColor = UIColor.systemGray5
        wrapperCellView.layer.cornerRadius = 16.0
        wrapperCellView.layer.masksToBounds = true
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(wrapperCellView)
    }
    
    func setupLabelSenderName() {
        labelCommenterName = UILabel()
        labelCommenterName.font = UIFont.systemFont(ofSize: 12)
        labelCommenterName.textColor = .gray
        labelCommenterName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelCommenterName)
    }
    
    func setupLabelMsg() {
        labelCommentContent = UILabel()
        labelCommentContent.font = UIFont.systemFont(ofSize: 16)
        labelCommentContent.numberOfLines = 0 // Allows multiline text
        labelCommentContent.textColor = .black
        labelCommentContent.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelCommentContent)
    }
    
    func setupLabelTime() {
        labelCommentTime = UILabel()
        labelCommentTime.font = UIFont.systemFont(ofSize: 10)
        labelCommentTime.textColor = .gray
        labelCommentTime.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelCommentTime)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            wrapperCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            labelCommenterName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelCommenterName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 12),
            labelCommenterName.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -12),
            
            labelCommentContent.topAnchor.constraint(equalTo: labelCommenterName.bottomAnchor, constant: 4),
            labelCommentContent.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 12),
            labelCommentContent.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -12),
            
            labelCommentTime.topAnchor.constraint(equalTo: labelCommentContent.bottomAnchor, constant: 4),
            labelCommentTime.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -12),
            labelCommentTime.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
