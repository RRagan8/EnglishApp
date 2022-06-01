import Foundation

class User_Question {
    
    let id: Int
    let user_id: Int
    let question_id: Int
    let answer: String
    
    init(id: Int, user_id: Int, answer: String, question_id: Int) {
        
        self.id = id
        self.user_id = user_id
        self.question_id = question_id
        self.answer = answer
        
    }
}
