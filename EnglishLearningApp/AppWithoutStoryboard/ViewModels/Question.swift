import Foundation

class Question {
    
    let id: Int
    let text: String
    let answer: String
    let response_options: [String]
    let type_of_answer_field: Int
    let max_points: Int
    
    init() {
        
        self.id = -1
        self.text = ""
        self.answer = ""
        self.response_options = []
        self.type_of_answer_field = -1
        self.max_points = -1
    }
    
    init(id: Int, text: String, answer: String, response_options: [String], type_of_answer_field: Int = 0, max_points: Int = 0) {
        
        self.id = id
        self.text = text
        self.answer = answer
        self.response_options = response_options
        self.type_of_answer_field = type_of_answer_field
        self.max_points = max_points
    }
}
