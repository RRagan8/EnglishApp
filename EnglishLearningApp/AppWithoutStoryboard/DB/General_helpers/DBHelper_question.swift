import Foundation
import SQLite3

class DBHelper_question: DBHelper {
    
    func insert(id: Int, text: String, answer: String, type_of_answer_field: Int, max_points: Int) {
        let insertStatementString = "INSERT INTO question (text, answer, type_of_answer_field, max_points) VALUES (?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 0, (text as NSString).utf8String, -1, nil)
                print((text as NSString).utf8String!)
                sqlite3_bind_text(insertStatement, 1, (answer as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 2, Int32(type_of_answer_field))
                sqlite3_bind_int(insertStatement, 3, Int32(max_points))
            
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                }
                else {
                    print("Could not insert row.")
                }
                }
        else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func read() -> [Question] {
        let queryStatementString = "SELECT id, text, answer, type_of_answer_field, max_points FROM question;"
        var queryStatement: OpaquePointer? = nil
        var questions : [Question] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let text = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let answer = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let type_of_answer_field = sqlite3_column_int(queryStatement, 3)
                let max_points = sqlite3_column_int(queryStatement, 4)
                
                questions.append(Question(id: Int(id), text: text, answer: answer, type_of_answer_field: Int(type_of_answer_field), max_points: Int(max_points)))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return questions
    }
    
    func delete(id: Int) {
        deleteById(name_of_table: "question", id: id)
    }
    
}
