import Foundation

class Test {
    
    var id: Int
    var pages_ids: [Int]
    var title: String
    var picture: String
    var time_to_finish: Int
    var type_tags: [String]
    var max_result: Int
    
    init(id: Int, pages_ids: [Int], title: String, picture: String, time_to_finish: Int, type_tags: [String], max_result: Int) {
    
        self.id = id
        self.pages_ids = pages_ids
        self.title = title
        self.picture = picture
        self.time_to_finish = time_to_finish
        self.type_tags = type_tags
        self.max_result = max_result
    }
}
