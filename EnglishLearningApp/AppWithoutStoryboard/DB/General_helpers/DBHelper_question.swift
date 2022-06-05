import Foundation
import SQLite3

class DBHelper_question: DBHelper {
    
    func insert(text: String, answer: String, response_options: [String], type_of_answer_field: Int, max_points: Int) -> Int {
        let insertStatementString = "INSERT INTO question (text, answer, response_options, type_of_answer_field, max_points) VALUES (?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 0, (text as NSString).utf8String, -1, nil)
                print("QUESTION : ", (text as NSString).utf8String!)
                sqlite3_bind_text(insertStatement, 1, (answer as NSString).utf8String, -1, nil)
                let response_options_String = convertArrayIntoString(arr: response_options)
                sqlite3_bind_text(insertStatement, 2, (response_options_String as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 3, Int32(type_of_answer_field))
                sqlite3_bind_int(insertStatement, 4, Int32(max_points))
            
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted question.")
                }
                else {
                    print("Could not insert question.")
                }
                }
        else {
            print("INSERT statement could not be prepared for question.")
        }
        let id_inserted: Int = Int(sqlite3_last_insert_rowid(insertStatement))
        sqlite3_finalize(insertStatement)
        return id_inserted
    }
    
    func read() -> [Question] {
        let queryStatementString = "SELECT id, text, answer, response_options, type_of_answer_field, max_points FROM question;"
        var queryStatement: OpaquePointer? = nil
        var questions : [Question] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, -1)
                let text = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let answer = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let response_options_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let response_options_Array = convertStringIntoArray(str: response_options_String)
                let type_of_answer_field = sqlite3_column_int(queryStatement, 3)
                let max_points = sqlite3_column_int(queryStatement, 4)
                
                questions.append(Question(id: Int(id), text: text, answer: answer, response_options: response_options_Array, type_of_answer_field: Int(type_of_answer_field), max_points: Int(max_points)))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return questions
    }
    
    func readById(id: Int) -> Question {
        let queryStatementString = "SELECT id, text, answer, response_options, type_of_answer_field, max_points FROM question WHERE id = \(id);"
        var queryStatement: OpaquePointer? = nil
        var question : Question = Question()
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, -1)
                let text = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let answer = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let response_options_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let response_options_Array = convertStringIntoArray(str: response_options_String)
                let type_of_answer_field = sqlite3_column_int(queryStatement, 3)
                let max_points = sqlite3_column_int(queryStatement, 4)
                
                question = Question(id: Int(id), text: text, answer: answer, response_options: response_options_Array, type_of_answer_field: Int(type_of_answer_field), max_points: Int(max_points))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return question
    }
    
    func delete(id: Int) {
        deleteById(name_of_table: "question", id: id)
    }
    
}

func convertStringIntoArray(str: String) -> [String] {
    let arr = str.components(separatedBy: "///")
    return arr
}

func convertArrayIntoString(arr: [String]) -> String {
    let str = arr.joined(separator: "///")
    return str
}

func createQuestionAndReturnId(text: String, answer: String, response_options: [String], type_of_answer_field: Int, max_points: Int) -> Int {
    let db_question = DBHelper_question()
    let id_inserted = db_question.insert(text: text, answer: answer, response_options: response_options, type_of_answer_field: type_of_answer_field, max_points: max_points)
    return id_inserted
}
