import Foundation

class User_Word {
    
    let id: Int
    let user_id: Int
    let word_id: Int
    let added_by_user: Bool
    let box_number: Int
    let days_since_last_revision: Int
    
    init(id: Int, user_id: Int, word_id: Int, added_by_user: Bool, box_number: Int, days_since_last_revision: Int) {
        
        self.id = id
        self.user_id = user_id
        self.word_id = word_id
        self.added_by_user = added_by_user
        self.box_number = box_number
        self.days_since_last_revision = days_since_last_revision
    }
}
