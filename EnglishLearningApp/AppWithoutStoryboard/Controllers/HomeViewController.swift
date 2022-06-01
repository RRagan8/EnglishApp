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

        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        HomeFeedTable.tableHeaderView = headerView
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        HomeFeedTable.frame = view.bounds
    }

    @objc func pressWord() {
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: WordsViewController())
        self.present(ac, animated: true, completion: nil)
    }
    
    @objc func pressInfo() {
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: InfoPageViewController())
        self.present(ac, animated: true, completion: nil)
    }
    
    @objc func pressSignupButton() {
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
