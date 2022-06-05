import Foundation

class User_Article {
    
    let id: Int
    let user_id: Int
    let article_id: Int
    let read: Int
    
    init(id: Int, user_id: Int, article_id: Int, read: Int) {
        
        self.id = id
        self.user_id = user_id
        self.article_id = article_id
        self.read = read
    }
}
