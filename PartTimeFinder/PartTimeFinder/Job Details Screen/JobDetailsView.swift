import UIKit

class JobDetailsView: UIView {
    
    var jobImageView: UIImageView!
    var jobTitleLabel: UILabel!
    var companyNameLabel: UILabel!
    var locationLabel: UILabel!
    var descriptionTitleLabel: UILabel!
    var descriptionLabel: UILabel!
    var postingDateTitleLabel: UILabel!
    var postingDateLabel: UILabel!
    
    var actionStackView: UIStackView!
    var likeButton: UIButton!
    var likeCounterLabel: UILabel!
    var dislikeButton: UIButton!
    var dislikeCounterLabel: UILabel!
    var commentButton: UIButton!
    var commentCounterLabel: UILabel!
    var chatButton: UIButton!
    var chatLabel: UILabel!
    var directionsButton: UIButton!
    var directionsLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupJobImageView()
        setupJobDetails()
        setupDescriptionSection()
        setupPostingDate()
        setupActionButtons()
        initConstraints()
    }
    
    func setupJobImageView() {
        jobImageView = UIImageView()
        jobImageView.image = UIImage(systemName: "briefcase")
        jobImageView.contentMode = .scaleAspectFit
        jobImageView.tintColor = .darkGray
        jobImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jobImageView)
    }
    
    func setupJobDetails() {
        jobTitleLabel = UILabel()
        jobTitleLabel.text = "Software Engineer"
        jobTitleLabel.font = .boldSystemFont(ofSize: 18)
        jobTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jobTitleLabel)
        
        companyNameLabel = UILabel()
        companyNameLabel.text = "TechCorp Inc."
        companyNameLabel.font = .systemFont(ofSize: 16)
        companyNameLabel.textColor = .darkGray
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(companyNameLabel)
        
        locationLabel = UILabel()
        locationLabel.text = "San Francisco, CA"
        locationLabel.font = .systemFont(ofSize: 14)
        locationLabel.textColor = .lightGray
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(locationLabel)
    }
    
    func setupDescriptionSection() {
        descriptionTitleLabel = UILabel()
        descriptionTitleLabel.text = "Description"
        descriptionTitleLabel.font = .boldSystemFont(ofSize: 20)
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionTitleLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "This is a software engineering position focused on developing high-quality applications."
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionLabel)
    }
    
    func setupPostingDate() {
        postingDateTitleLabel = UILabel()
        postingDateTitleLabel.text = "Posted on"
        postingDateTitleLabel.font = .boldSystemFont(ofSize: 20)
        postingDateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(postingDateTitleLabel)
        
        postingDateLabel = UILabel()
        postingDateLabel.text = "15th November, 2024"
        postingDateLabel.font = .systemFont(ofSize: 16)
        postingDateLabel.numberOfLines = 0
        postingDateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(postingDateLabel)
    }
    
    func setupActionButtons() {
        let likeStack = setupLikeCounter()  // like stack
        let dislikeStack = setupDislikeCounter()   // dislike stack
        let commentStack = setupCommentCounter()   // comment stack
        let chatStack = setupChatButton() // chat stack
        let directionsStack = setupDirectionsButton() // directions button
        
        actionStackView = UIStackView(arrangedSubviews: [likeStack, dislikeStack, commentStack, chatStack, directionsStack])
        actionStackView.axis = .horizontal
        actionStackView.distribution = .equalSpacing
        actionStackView.spacing = 30
        actionStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(actionStackView)
    }
    
    func setupLikeCounter() -> UIStackView {
        likeButton = UIButton(type: .system)
        likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        likeButton.tintColor = .systemBlue
        
        likeCounterLabel = UILabel()
        likeCounterLabel.text = "0"
        likeCounterLabel.font = .systemFont(ofSize: 14)
        likeCounterLabel.textAlignment = .center
        likeCounterLabel.textColor = .darkGray
        likeCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let likeStack = UIStackView(arrangedSubviews: [likeButton, likeCounterLabel])
        likeStack.axis = .vertical
        likeStack.alignment = .center
        likeStack.spacing = 4
        likeStack.translatesAutoresizingMaskIntoConstraints = false
        return likeStack
    }
    
    func setupDislikeCounter() -> UIStackView {
        dislikeButton = UIButton(type: .system)
        dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        dislikeButton.tintColor = .systemBlue
        
        dislikeCounterLabel = UILabel()
        dislikeCounterLabel.text = "0"
        dislikeCounterLabel.font = .systemFont(ofSize: 14)
        dislikeCounterLabel.textAlignment = .center
        dislikeCounterLabel.textColor = .darkGray
        dislikeCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let dislikeStack = UIStackView(arrangedSubviews: [dislikeButton, dislikeCounterLabel])
        dislikeStack.axis = .vertical
        dislikeStack.alignment = .center
        dislikeStack.spacing = 4
        dislikeStack.translatesAutoresizingMaskIntoConstraints = false
        return dislikeStack
    }
    
    func setupCommentCounter() -> UIStackView {
        commentButton = UIButton(type: .system)
        commentButton.setImage(UIImage(systemName: "text.bubble"), for: .normal)
        commentButton.tintColor = .systemBlue
        
        commentCounterLabel = UILabel()
        commentCounterLabel.text = "0"
        commentCounterLabel.font = .systemFont(ofSize: 14)
        commentCounterLabel.textAlignment = .center
        commentCounterLabel.textColor = .darkGray
        commentCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let commentStack = UIStackView(arrangedSubviews: [commentButton, commentCounterLabel])
        commentStack.axis = .vertical
        commentStack.alignment = .center
        commentStack.spacing = 4
        commentStack.translatesAutoresizingMaskIntoConstraints = false
        return commentStack
    }
    
    func setupChatButton() -> UIStackView {
        chatButton = UIButton(type: .system)
        chatButton.setImage(UIImage(systemName: "message"), for: .normal)
        chatButton.tintColor = .systemBlue
        
        let chatLabel = UILabel()
        chatLabel.text = "Chat"
        chatLabel.font = .systemFont(ofSize: 14)
        chatLabel.textAlignment = .center
        chatLabel.textColor = .darkGray
        chatLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let chatStack = UIStackView(arrangedSubviews: [chatButton, chatLabel])
        chatStack.axis = .vertical
        chatStack.alignment = .center
        chatStack.spacing = 4
        chatStack.translatesAutoresizingMaskIntoConstraints = false
        return chatStack
    }
    
    func setupDirectionsButton() -> UIStackView {
        directionsButton = UIButton(type: .system)
        directionsButton.setImage(UIImage(systemName: "arrow.trianglehead.turn.up.right.diamond"), for: .normal)
        directionsButton.tintColor = .systemBlue
        
        let directionsLabel = UILabel()
        directionsLabel.text = "Directions"
        directionsLabel.font = .systemFont(ofSize: 14)
        directionsLabel.textAlignment = .center
        directionsLabel.textColor = .darkGray
        directionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let directionsStack = UIStackView(arrangedSubviews: [directionsButton, directionsLabel])
        directionsStack.axis = .vertical
        directionsStack.alignment = .center
        directionsStack.spacing = 4
        directionsStack.translatesAutoresizingMaskIntoConstraints = false
        return directionsStack
    }
    
    // MARK: - Setting Up Constraints
    func initConstraints() {
        NSLayoutConstraint.activate([
            jobImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            jobImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            jobImageView.widthAnchor.constraint(equalToConstant: 60),
            jobImageView.heightAnchor.constraint(equalToConstant: 60),
            
            jobTitleLabel.topAnchor.constraint(equalTo: jobImageView.topAnchor),
            jobTitleLabel.leadingAnchor.constraint(equalTo: jobImageView.trailingAnchor, constant: 20),
            
            companyNameLabel.topAnchor.constraint(equalTo: jobTitleLabel.bottomAnchor, constant: 4),
            companyNameLabel.leadingAnchor.constraint(equalTo: jobTitleLabel.leadingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 4),
            locationLabel.leadingAnchor.constraint(equalTo: jobTitleLabel.leadingAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: jobImageView.bottomAnchor, constant: 30),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            postingDateTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            postingDateTitleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            postingDateTitleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            postingDateLabel.topAnchor.constraint(equalTo: postingDateTitleLabel.bottomAnchor, constant: 10),
            postingDateLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            postingDateLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            actionStackView.topAnchor.constraint(equalTo: postingDateLabel.bottomAnchor, constant: 30),
            actionStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
