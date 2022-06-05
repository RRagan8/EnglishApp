import Foundation

class Page {
    
    var id: Int
    var question_ids: [Int]
    var name_of_file: String
    var task_type: String
    var picture: String
    var max_time: Int
    var max_points: Int
    
    init() {
        
        self.id = -1
        self.question_ids = []
        self.name_of_file = ""
        self.task_type = ""
        self.picture = ""
        self.max_time = -1
        self.max_points = -1
    }
    
    init(id: Int, question_ids: [Int], name_of_file: String, task_type: String = "", picture: String, max_time: Int = 0, max_points: Int = 0) {
        
        self.id = id
        self.question_ids = question_ids
        self.name_of_file = name_of_file
        self.task_type = task_type
        self.picture = picture
        self.max_time = max_time
        self.max_points = max_points
    }
}
