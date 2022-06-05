import Foundation

class User_Exercise {
    
    let id: Int
    let user_id: Int
    let exercise_id: Int
    let done: Int
    
    init(id: Int, user_id: Int, exercise_id: Int, done: Int) {
        
        self.id = id
        self.user_id = user_id
        self.exercise_id = exercise_id
        self.done = done
        
    }
}
