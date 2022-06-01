import UIKit

class TextsCollectionViewTableViewCell: UITableViewCell {

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
    
}


extension TextsCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
        cell.backgroundColor = .white
        title.text = ""
        title.font = UIFont(name: "AvenirNext-Bold", size: 13)
        title.textAlignment = .center
        cell.contentView.addSubview(title)
        let textPlace = UILabel(frame: CGRect(x: 50, y: 0, width: cell.bounds.size.width - 10, height: bounds.size.height - 50))
        textPlace.text = """
            From its very beginnings the Internet became a crucial part of each and any infrastructure. Similar to the discoveries of electricity, microorganisms or elementary particles, the creation of the Internet has turned a new page in the history of humanity.
            The history of the Internet has begun in the middle of the 20th century as a result of rapid development of computer science. Computers of that age were still relatively underperforming and needed constant maintenance. Some kind of an effective and automated method of time-sharing between users needed to be devised and implemented for them to work reliably.
            
            The first idea that had emerged from that necessity was a concept of multi-tasking. Nowadays we don’t pay much attention to the fact that our computers perform many tasks at once, and that with our computers we can, for example, work and listen to music at the same time. But in the 1950s this idea turned out to be revolutionary.
            
            The second idea would be a proposition to merge multiple computers into a single network. Each participant1 of such a network would be able to exchange data with the others. But the exact mechanism of implementation was still largely a mystery. Roughly for ten years the scientists were developing and discarding all kinds of ideas, one after another, preserving those that could be at least somewhat handy bit by bit. This is how the prototypes of packet exchange protocols (as well as the concept of a data packet itself) came to be.
            
            In 1969 a duo of American engineers, Robert Taylor and Lawrence Roberts, have made a presentation to the U. S. Department of Defence with a project dubbed2 ARPANET (which stands for Advanced Research Projects Agency Network) founded on the previous research. Even more advanced networks have started to develop based on this one, including what would be later known as ‘networks of networks’. These researches have culminated with the emergence3 of two main network protocols (TCP and IP), which are still used as of today with some modifications.
            
            A modern solution that eventually replaced ARPANET was called NSFNET, which was the National Science Foundation Network. This particular network has adopted the TCP/IP protocol as its main one, and also helped the emergence of the Domain Name System (DNS). And thus when the 1990s have arrived, the Internet architecture as we know it was largely in place.
            
            One should make a distinction between terms ‘the Internet’ and ‘the World Wide Web’. The first one relates to the network architecture in itself4. The second one is more of a modern development and constitutes an interface that allows the access to a network for a user. It emerged in 1990 courtesy of CERN scientists, Tim Berners-Lee in particular. He was the inventor of terms such as HTTP, HTML, and also of a web browser.
            
            In 2020 nearly 4,5 billion people are using the Internet both for work and communication. The Internet is a cornerstone of all modern banking, of the vital infrastructure automated systems, and also of many computer science branches. This promising technology still continues its development nowadays, and for now we can’t even fathom5 what new discoveries this further development can bring.
            """
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