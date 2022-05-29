import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Words of the day", "May be interesting", "Exercises", "Texts"]
    
    private let HomeFeedTable: UITableView = {
        let table = UITableView(frame:.zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray5
        view.addSubview(HomeFeedTable)
        
        HomeFeedTable.delegate = self
        HomeFeedTable.dataSource = self
        
        //InfoButton()
        //WordsButton()
        
        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        HomeFeedTable.tableHeaderView = headerView
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        HomeFeedTable.frame = view.bounds
    }
     /*
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Info", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4
        
        button.addTarget(self, action: #selector(self.pressInfo) , for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        
        self.view.addSubview(button)
        
        return button
       }()
    
    @objc func pressInfo() {
        /*let vc = UINavigationController(rootViewController: EditProfileViewController())
        self.navigationController?.pushViewController(vc, animated: true)*/
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: InfoPageProfileViewController())
        self.present(ac, animated: true, completion: nil)

    }
       
    private let playButton: UIButton = {
          
        let button = UIButton()
        button.setTitle("New words", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4
        return button
       }()
    
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
             
             NSLayoutConstraint.activate(playButtonConstraints)
             NSLayoutConstraint.activate(downloadButtonConstraints)
         }
      
    func InfoButton(){
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x:50, y:400, width: 120, height: 80)
        button1.backgroundColor = .white
        button1.setTitle( "Info", for: .normal)
        
        button1.addTarget(self, action: #selector(self.pressInfo) , for: .touchUpInside)
        button1.setTitleColor(.black, for: .normal)
        
        
        self.view.addSubview(button1)
    }
    
    @objc func pressInfo() {
        /*let vc = UINavigationController(rootViewController: EditProfileViewController())
        self.navigationController?.pushViewController(vc, animated: true)*/
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: InfoPageViewController())
        self.present(ac, animated: true, completion: nil)
    }
        
    func WordsButton(){
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x:190, y:400, width: 120, height: 80)
        button1.backgroundColor = .white
        button1.setTitle( "New Words", for: .normal)
            
        button1.addTarget(self, action: #selector(self.pressWords) , for: .touchUpInside)
        button1.setTitleColor(.black, for: .normal)
            
            
        self.view.addSubview(button1)
    }
        
    @objc func pressWords() {
        /*let vc = UINavigationController(rootViewController: EditProfileViewController())
        self.navigationController?.pushViewController(vc, animated: true)*/
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: InfoPageViewController())
        self.present(ac, animated: true, completion: nil)

    }
      */
    @objc func pressWord() {
        /*let vc = UINavigationController(rootViewController: EditProfileViewController())
        self.navigationController?.pushViewController(vc, animated: true)*/
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: WordsViewController())
        self.present(ac, animated: true, completion: nil)
    }
    
    @objc func pressInfo() {
        /*let vc = UINavigationController(rootViewController: EditProfileViewController())
        self.navigationController?.pushViewController(vc, animated: true)*/
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: InfoPageViewController())
        self.present(ac, animated: true, completion: nil)
    }
    
    @objc func pressSignupButton() {
        /*let vc = UINavigationController(rootViewController: EditProfileViewController())
        self.navigationController?.pushViewController(vc, animated: true)*/
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: WelcomeViewController())
        self.present(ac, animated: true, completion: nil)
    }
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sectionTitles[section]
        }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
}
