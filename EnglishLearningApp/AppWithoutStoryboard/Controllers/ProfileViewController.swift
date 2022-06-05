import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        
        view.addSubview(WordsFeedTable)
        
        WordsFeedTable.delegate = self
        WordsFeedTable.dataSource = self
        
        let headerView = HeaderProfileUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200))
        WordsFeedTable.tableHeaderView = headerView
        
    }
    
    @objc func pressEdit() {
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: EditProfileViewController())
        self.present(ac, animated: true, completion: nil)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        WordsFeedTable.frame = view.bounds
    }
    
    private let WordsFeedTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    } ()
    

    
}

extension ProfileViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hiii"
        cell.backgroundColor = .systemGray5
        return cell
    }
    
    
}
