import UIKit

class ProfileView: UIView {

    var imageViewProfilePic: UIImageView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhoneNum: UILabel!
    var buttonLogout: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .white
        setupBackground()
        
        setupImageViewProfilePic()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhoneNum()
        setupButtonLogout()
        
        initConstraints()
    }
        
    func setupImageViewProfilePic() {
        imageViewProfilePic = UIImageView()
        imageViewProfilePic.image = UIImage(systemName: "person.circle.fill")
        imageViewProfilePic.contentMode = .scaleAspectFit
        imageViewProfilePic.layer.cornerRadius = 50
        imageViewProfilePic.clipsToBounds = true
        imageViewProfilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageViewProfilePic)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.text = "John Doe"
        labelName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelName.textAlignment = .center
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.text = "john.doe@example.com"
        labelEmail.font = UIFont.systemFont(ofSize: 16)
        labelEmail.textAlignment = .center
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupLabelPhoneNum() {
        labelPhoneNum = UILabel()
        labelPhoneNum.text = "+1 (123) 456-7890"
        labelPhoneNum.font = UIFont.systemFont(ofSize: 16)
        labelPhoneNum.textAlignment = .center
        labelPhoneNum.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoneNum)
    }
    
    func setupButtonLogout() {
        buttonLogout = UIButton(type: .system)
        buttonLogout.setTitle("Logout", for: .normal)
        buttonLogout.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonLogout.setTitleColor(.white, for: .normal)
        buttonLogout.backgroundColor = .systemRed
        buttonLogout.layer.cornerRadius = 8
        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogout)
    }
        
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageViewProfilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageViewProfilePic.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageViewProfilePic.widthAnchor.constraint(equalToConstant: 100),
            imageViewProfilePic.heightAnchor.constraint(equalToConstant: 100),
            
            labelName.topAnchor.constraint(equalTo: imageViewProfilePic.bottomAnchor, constant: 16),
            labelName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            labelPhoneNum.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 8),
            labelPhoneNum.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelPhoneNum.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonLogout.topAnchor.constraint(equalTo: labelPhoneNum.bottomAnchor, constant: 32),
            buttonLogout.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonLogout.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonLogout.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
