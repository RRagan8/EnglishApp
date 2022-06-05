import UIKit

class TextsCollectionViewTableViewCell: UITableViewCell {
    
    private var article: Article = Article()

    static let identifier = "CollectionViewTableViewCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 500)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        

    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with article: Article) {
        self.article = article
    }
    
}


extension TextsCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let articleAtIndexPath = self.article
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
        cell.backgroundColor = .white
        title.text = articleAtIndexPath.title
        title.font = UIFont(name: "AvenirNext-Bold", size: 13)
        title.textAlignment = .center
        cell.contentView.addSubview(title)
        
        let textPlace = UILabel(frame: CGRect(x: 50, y: 50, width: cell.bounds.size.width - 10, height: bounds.size.height - 50))
        
        let db_page = DBHelper_page()
        let page = db_page.readById(id: articleAtIndexPath.pages_ids[0])
        let textFileName = page.name_of_file
        
        if let textURL = Bundle.main.url(forResource: textFileName, withExtension: "txt") {
            print("final url = ", textURL)
            if let text = try? String(contentsOf: textURL) {
                textPlace.text = text
            }
        }
        
        textPlace.font = UIFont(name: "AvenirNext-Bold", size: 13)
        textPlace.textAlignment = .left
        textPlace.lineBreakMode = .byWordWrapping
        textPlace.numberOfLines = 0
        cell.contentView.addSubview(textPlace)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
}
