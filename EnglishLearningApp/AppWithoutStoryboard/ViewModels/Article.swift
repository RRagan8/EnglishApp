import Foundation

class Article {
    
    let id: Int
    let pages_ids: [Int]
    let title: String
    let topic_tags: [String]
    let description: String
    let picture: String
    
    init() {
        
        self.id = -1
        self.pages_ids = []
        self.title = ""
        self.topic_tags = []
        self.description = ""
        self.picture = ""
    }
    
    init(id: Int, pages_ids: [Int], title: String, topic_tags: [String], description: String = "", picture: String = "") {
        
        self.id = id
        self.pages_ids = pages_ids
        self.title = title
        self.topic_tags = topic_tags
        self.description = description
        self.picture = picture
    }
}
