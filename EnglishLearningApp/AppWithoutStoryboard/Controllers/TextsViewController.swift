import UIKit

class TextsViewController: UIViewController {
    
    private let TextFeedTable: UITableView = {
        let table = UITableView(frame:.zero, style: .grouped)
        table.register(TextsCollectionViewTableViewCell.self, forCellReuseIdentifier: TextsCollectionViewTableViewCell.identifier)
        return table
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray5
        view.addSubview(TextFeedTable)
        
        TextFeedTable.delegate = self
        TextFeedTable.dataSource = self
        
        let headerView = HeaderTextUIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        TextFeedTable.tableHeaderView = headerView
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TextFeedTable.frame = view.bounds
    }
    
    @objc func pressSampTex() {
        dismiss(animated: true, completion: nil)
        let ac = UINavigationController(rootViewController: SampleTextViewController())
        self.present(ac, animated: true, completion: nil)
    }
    
    
}

extension TextsViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell
        else {
            return UITableViewCell()
        }
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
}
