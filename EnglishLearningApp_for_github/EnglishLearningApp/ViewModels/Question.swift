import Foundation

class Question {
    
    var id: Int
    var text: String
    var answer: String
    var type_of_answer_field: String
    
    init(id: Int, text: String, answer: String, type_of_answer_field: String) {
        
        self.id = id
        self.text = text
        self.answer = answer
        self.type_of_answer_field = type_of_answer_field
    }
}
