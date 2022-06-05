import UIKit

class WordsViewController: UIViewController {
    
    private let WordsFeedTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    } ()
    
    private let sortedWords: [Word] = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let sortedWordsFromDB = appDelegate.words.sorted { (first, second) -> Bool in
            return first.word < second.word
        }
        return sortedWordsFromDB
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray5
        view.addSubview(WordsFeedTable)
        
        WordsFeedTable.delegate = self
        WordsFeedTable.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        WordsFeedTable.frame = view.bounds
    }
    
}

extension WordsViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = sortedWords[indexPath[1]].word
        cell.backgroundColor = .systemGray5
        return cell
    }
}
