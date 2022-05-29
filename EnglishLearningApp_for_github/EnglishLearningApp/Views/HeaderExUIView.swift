import UIKit

class HeaderExUIView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private let ImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "Exercise_picture")
            return imageView
    }()
        
    private let playButton: UIButton = {
           
        let button = UIButton()
        button.setTitle("Sample task", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.borderWidth = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        
        button.addTarget(ExercisesViewController(), action: #selector(ExercisesViewController.pressSampEx) , for: .touchUpInside)
        return button
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(ImageView)
        addSubview(playButton)
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
                playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 135),
                playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
                playButton.widthAnchor.constraint(equalToConstant: 110)
            ]
            
            NSLayoutConstraint.activate(playButtonConstraints)
        }
    
}
