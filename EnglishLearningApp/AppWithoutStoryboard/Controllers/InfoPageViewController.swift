//
//  InfoPageViewController.swift
//  English Learning App
//
//  Created by Алёна Яковлева on 28.05.2022.
//

import UIKit

class InfoPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ImageView)
        
        view.backgroundColor = .systemGray5

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ImageView.frame = view.bounds
    }
    
    
    private let ImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "AlenaMarina")
            return imageView
    }()

}
