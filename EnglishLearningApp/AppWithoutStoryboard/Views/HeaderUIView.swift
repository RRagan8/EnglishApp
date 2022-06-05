import UIKit

class HeaderUIView: UIView {

    private let ImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "GladToSee")
            return imageView
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Info", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.addTarget(HomeViewController(), action: #selector(HomeViewController.pressInfo) , for: .touchUpInside)
        return button
        }()
    
    private let SignupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.addTarget(HomeViewController(), action: #selector(HomeViewController.pressSignupButton) , for: .touchUpInside)
        return button
        }()
        
    private let playButton: UIButton = {
           
        let button = UIButton()
        button.setTitle("New words", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        
        button.addTarget(HomeViewController(), action: #selector(HomeViewController.pressWord) , for: .touchUpInside)
        return button
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(ImageView)
        addSubview(playButton)
        addSubview(SignupButton)
        addSubview(downloadButton)
        applyConstraints()
       }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ImageView.frame = bounds
        }
    
    required init?(coder: NSCoder) {
        fatalError()
        }
    
    private func applyConstraints() {
            
            let playButtonConstraints = [
                playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
                playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
                playButton.widthAnchor.constraint(equalToConstant: 110)
            ]
            
            let downloadButtonConstraints = [
                downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
                downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
                downloadButton.widthAnchor.constraint(equalToConstant: 110)
            ]
        
            let SignupButtonConstraints = [
                downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
                downloadButton.widthAnchor.constraint(equalToConstant: 110)
            ]
            
            NSLayoutConstraint.activate(playButtonConstraints)
            NSLayoutConstraint.activate(downloadButtonConstraints)
            NSLayoutConstraint.activate(SignupButtonConstraints)
        }
    
}
