import Foundation

class Page {
    
    let id: Int
    let question_ids: [Int]
    let text: NSString
    let task_type: String
    let picture: String 
    let max_time: Int
    let max_points: Int
    
    init(id: Int, question_ids: [Int], text: NSString, task_type: String = "", picture: String, max_time: Int = 0, max_points: Int = 0) {
        
        self.id = id
        self.question_ids = question_ids
        self.text = text
        self.task_type = task_type
        self.picture = picture
        self.max_time = max_time
        self.max_points = max_points
    }
}
