import Foundation
import SQLite3


class DBHelper_article: DBHelper {
    
    func insert(pages_ids: [Int], title: String, topic_tags: [String], picture: String) {
        let insertStatementString = "INSERT INTO article (pages_ids, title, topic_tags, picture) VALUES (?, ?, ?, ?);"
        let pages_ids_String = convertIntsIntoString(ints: pages_ids)
        let topic_tags_String = convertArrayIntoString(arr: topic_tags)
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
        let queryStatementString = "SELECT id, pages_ids, title, topic_tags, description, picture FROM article;"
        var queryStatement: OpaquePointer? = nil
        var articles : [Article] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, -1)
                let pages_ids_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let pages_ids_Array = convertStringToInts(str: pages_ids_String)
                let title = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let topic_tags_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let topic_tags_Array = convertStringIntoArray(str: topic_tags_String)
                let picture = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
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
    
    func createArticles() {
        let titles = ["0": "History of the Internet", "1": "A Beautiful Mind", "2": "American school system"]
        for i in 0...2 {
            let textFileName = "EnglishLearningAppText" + String(i)
            let page_id = createPageAndReturnId(question_ids: [], name_of_file: textFileName, task_type: "", picture: "", max_time: -1, max_points: -1)
            self.insert(pages_ids: [page_id], title: titles[String(i)] ?? "title", topic_tags: [], picture: "")
        }
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
    
    func convertStringIntoArray(str: String) -> [String] {
        let arr = str.components(separatedBy: "///")
        return arr
    }

    func convertArrayIntoString(arr: [String]) -> String {
        let str = arr.joined(separator: "///")
        return str
    }
    
}

