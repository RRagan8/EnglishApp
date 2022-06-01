import Foundation
import SQLite3


class DBHelper_article: DBHelper {
    
    func insert(pages_ids: [Int], title: String, topic_tags: [String], picture: String) {
        let insertStatementString = "INSERT INTO article (pages_ids, title, topic_tags, picture) VALUES (?, ?, ?, ?);"
        let pages_ids_String = convertIntsIntoString(ints: pages_ids)
        let topic_tags_String = convertArrayIntoString(array: topic_tags)
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 0, (pages_ids_String as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 1, (title as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (topic_tags_String as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (picture as NSString).utf8String, -1, nil)
                    
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
    
    func read() -> [Article] {
        let queryStatementString = "SELECT id, pages_ids, title, topic_tags, picture FROM article;"
        var queryStatement: OpaquePointer? = nil
        var articles : [Article] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let pages_ids_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let pages_ids_Array = convertStringToInts(str: pages_ids_String)
                let title = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let topic_tags_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let topic_tags_Array = convertStringIntoArray(str: topic_tags_String)
                let picture = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                articles.append(Article(id: Int(id), pages_ids: pages_ids_Array, title: title, topic_tags: topic_tags_Array, picture: picture))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return articles
    }
    
    func delete(id: Int) {
        deleteFromParent(name_of_field_in_parent_table: "pages_ids", name_of_parent_table: "article", id_of_parent: id, name_of_child_table: "page") 
        deleteById(name_of_table: "article", id: id)
    }
    
    func convertIntsIntoString(ints: [Int]) -> String {
        var result = ""
        for int in ints {
            result += String(int) + ","
        }
        if result != "" {
            result.removeLast()
        }
        return result
    }

    func convertStringToInts(str: String) -> [Int] {
        var result: [Int] = []
        let ints_string = str.split(separator: ",")
        for int_string in ints_string {
            result.append(Int(int_string)!)
        }
        return result
    }
    
    func convertArrayIntoString(array: [String]) -> String {
        var result = ""
        for str in array {
            result += str + ","
        }
        if result != "" {
            result.removeLast()
        }
        return result
    }
    
    func convertStringIntoArray(str: String) -> [String] {
        var result: [String] = []
        let str_array = str.split(separator: ",")
        for str in str_array {
            result.append(String(str))
        }
        return result
    }

}

