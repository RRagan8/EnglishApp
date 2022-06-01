import Foundation

class Article {
    
    let id: Int
    let pages_ids: [Int]
    let title: String
    let description: String
    let topic_tags: [String]
    let picture: String  
    
    init(id: Int, pages_ids: [Int], title: String, description: String = "", topic_tags: [String], picture: String = "") {
        
        self.id = id
        self.pages_ids = pages_ids
        self.title = title
        self.description = description
        self.topic_tags = topic_tags
        self.picture = picture
    }
}
