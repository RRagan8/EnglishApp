import Foundation

class User_Test {
    
    let id: Int
    let user_id: Int
    let test_id: Int
    let done: Int
    let let_left_to_finish: Int
    let user_result: Int
    
    init(id: Int, user_id: Int, test_id: Int, done: Int, user_result: Int, let_left_to_finish: Int) {
        
        self.id = id
        self.user_id = user_id
        self.test_id = test_id
        self.done = done
        self.user_result = user_result
        self.let_left_to_finish = let_left_to_finish
    }
}
