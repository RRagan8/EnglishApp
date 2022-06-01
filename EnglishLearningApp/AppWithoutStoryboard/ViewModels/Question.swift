import Foundation

class Question {
    
    let id: Int
    let text: String
    let answer: String
    let type_of_answer_field: Int
    let max_points: Int
    
    init(id: Int, text: String, answer: String, type_of_answer_field: Int = 0, max_points: Int = 0) {
        
        self.id = id
        self.text = text
        self.answer = answer
        self.type_of_answer_field = type_of_answer_field
        self.max_points = max_points
    }
}
