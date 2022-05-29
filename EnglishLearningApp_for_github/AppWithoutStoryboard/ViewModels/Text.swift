import Foundation

class Article {
    
    var id: Int
    var pages_ids: [Int]
    var title: String
    var description: String
    var topic_tags: [String]
    var picture: String  // or URL
    
    init(id: Int, pages_ids: [Int], title: String, description: String = "", topic_tags: [String], picture: String = "") {
        
        self.id = id
        self.pages_ids = pages_ids
        self.title = title
        self.description = description
        self.topic_tags = topic_tags
        self.picture = picture
    }
}
