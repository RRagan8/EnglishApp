import Foundation

class Exercise {
    
    var id: Int
    var pages_ids: [Int]
    var title: String
    var description: String
    var topic_tags: [String]
    var type_tags: [String]
    var picture: String
    
    init() {
        
        self.id = -1
        self.pages_ids = []
        self.title = ""
        self.description = ""
        self.topic_tags = []
        self.type_tags = []
        self.picture = ""
    }
    
    init(id: Int, pages_ids: [Int], title: String, description: String, topic_tags: [String], type_tags: [String], picture: String) {
        
        self.id = id
        self.pages_ids = pages_ids
        self.title = title
        self.description = description
        self.topic_tags = topic_tags
        self.type_tags = type_tags
        self.picture = picture
    }
}

