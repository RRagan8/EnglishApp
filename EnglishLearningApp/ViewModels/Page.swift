import Foundation

class Page {
    
    var id: Int
    var question_ids: [Int]
    var path_to_text: NSString
    var task_type: String
    var picture: String // or URL?
    var time_to_finish: Int
    
    init(id: Int, question_ids: [Int], path_to_text: NSString, task_type: String, picture: String, time_to_finish: Int) {
        
        self.id = id
        self.question_ids = question_ids
        self.path_to_text = path_to_text
        self.task_type = task_type
        self.picture = picture
        self.time_to_finish = time_to_finish
    }
}
