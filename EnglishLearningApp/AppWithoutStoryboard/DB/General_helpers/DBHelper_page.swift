import Foundation
import SQLite3

class DBHelper_page: DBHelper {
    
    func insert(question_ids: [Int], text: NSString, task_type: String, picture: String, max_time: Int, max_points: Int) {
        let insertStatementString = "INSERT INTO article (question_ids, path_to_text, task_type, picture, max_time, max_points) VALUES (?, ?, ?, ?, ?, ?);"
        let question_ids_String = convertIdsIntoString(q_ids: question_ids)
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 0, (question_ids_String as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 1, (text as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (task_type as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (picture as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 4, Int32(max_time))
            sqlite3_bind_int(insertStatement, 5, Int32(max_points))
                    
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
    
    func read() -> [Page] {
        let queryStatementString = "SELECT id, question_ids, text, task_type, picture, max_time, max_points FROM page;"
        var queryStatement: OpaquePointer? = nil
        var pages : [Page] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let question_ids = convertIdsToInts(str: String(describing: String(cString: sqlite3_column_text(queryStatement, 1))))
                let text = NSString(string: String(cString: sqlite3_column_text(queryStatement, 2)))
                let task_type = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let picture = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let max_time = sqlite3_column_int(queryStatement, 5)
                let max_points = sqlite3_column_int(queryStatement, 6)
                
                pages.append(Page(id: Int(id), question_ids: question_ids, text: text, task_type: task_type, picture: picture, max_time: Int(max_time), max_points: Int(max_points)))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return pages
    }
    
    func delete(id: Int) {
        deleteFromParent(name_of_field_in_parent_table: "question_ids", name_of_parent_table: "page", id_of_parent: id, name_of_child_table: "question")
        deleteById(name_of_table: "page", id: id)
    }
    
}
    
func convertIdsIntoString(q_ids: [Int]) -> String {
    var result = ""
    for id in q_ids {
        result += String(id) + ","
    }
    if result != "" {
        result.removeLast()
    }
    return result
}

func convertIdsToInts(str: String) -> [Int] {
    var result: [Int] = []
    let q_ids = str.split(separator: ",")
    for id in q_ids {
        result.append(Int(id)!)
    }
    
    return result
}
