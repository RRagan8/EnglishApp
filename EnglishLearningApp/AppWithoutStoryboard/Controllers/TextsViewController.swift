import UIKit

class TextsViewController: UIViewController {
    
    private let TextFeedTable: UITableView = {
        let table = UITableView(frame:.zero, style: .grouped)
        table.register(TextsCollectionViewTableViewCell.self, forCellReuseIdentifier: TextsCollectionViewTableViewCell.identifier)
        return table
    } ()
    
    private let articles: [Article] = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let articlesFromDB = appDelegate.articles
        return articlesFromDB
    }()
    
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
        return articles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextsCollectionViewTableViewCell.identifier, for: indexPath) as? TextsCollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: articles[indexPath.section])
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height = 1.2*(getSizeOfText(article: articles[indexPath.section])) + 100
        print("height = ", height)
        
        return height
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection indexPath: IndexPath) -> CGFloat {
        return 400
    }
        
    func getSizeOfText(article: Article) -> CGFloat {
        let maxSize: CGSize = CGSize(width: view.bounds.width - 20, height: 99999)
        
        var height = CGFloat(2000)
        
        let db_page = DBHelper_page()
        let page = db_page.readById(id: article.pages_ids[0])
        let name_of_file = page.name_of_file
        
        if let textURL = Bundle.main.url(forResource: name_of_file, withExtension: "txt") {
            if let text = try? String(contentsOf: textURL) {
                height = rectForText(text: text, maxSize: maxSize).height
            }
        }
        return height
    }
}

func rectForText(text: String, maxSize: CGSize) -> CGSize {
    let attrString = NSAttributedString.init(string: text, attributes: [NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 13.0)!])
    let rect = attrString.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
    return rect.size
}

