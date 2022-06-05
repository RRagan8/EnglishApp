import Foundation
import SQLite3

class DBHelper_exercise: DBHelper {
    
    func insert(pages_ids: [Int], title: String, description: String, topic_tags: [String], type_tags: [String], picture: String) {
        let insertStatementString = "INSERT INTO exercise (pages_ids, title, description, topic_tags, type_tags, picture) VALUES (?, ?, ?, ?, ?, ?);"
        let pages_ids_String = convertIntsIntoString(ints: pages_ids)
        let topic_tags_String = convertArrayIntoString(arr: topic_tags)
        let type_tags_String = convertArrayIntoString(arr: type_tags)
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 0, (pages_ids_String as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 1, (title as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (description as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (topic_tags_String as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (type_tags_String as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (picture as NSString).utf8String, -1, nil)
                    
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
    
    func read() -> [Exercise] {
        let queryStatementString = "SELECT id, pages_ids, title, description, topic_tags, type_tags, picture FROM exercise;"
        var queryStatement: OpaquePointer? = nil
        var exercises : [Exercise] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, -1)
                let pages_ids_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let pages_ids_Array = convertStringToInts(str: pages_ids_String)
                let title = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let description = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let topic_tags_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let topic_tags_Array = convertStringIntoArray(str: topic_tags_String)
                let type_tags_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let type_tags_Array = convertStringToArray(str: type_tags_String)
                let picture = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                exercises.append(Exercise(id: Int(id), pages_ids: pages_ids_Array, title: title, description: description, topic_tags: topic_tags_Array, type_tags: type_tags_Array, picture: picture))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return exercises
    }
    
    func delete(id: Int) {
        deleteFromParent(name_of_field_in_parent_table: "pages_ids", name_of_parent_table: "exercise", id_of_parent: id, name_of_child_table: "page")
        deleteById(name_of_table: "exercise", id: id)
    }
    
    func createExercises() {
        let page_id = insertFirstPage()
        insert(pages_ids: [page_id], title: "Grammar exercise", description: "Hey! Here we are going to practise your grammar skills! In order to do that, you need to follow the instructions below. \nFor each question, choose which of the four possible answers fits the space best. Also think about why the other three answers are not possible.", topic_tags: [], type_tags: ["grammar"], picture: "")
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

    func convertStringToArray(str: String) -> [String] {
        let arr = str.components(separatedBy: "///")
        return arr
    }

    func convertArrayToString(arr: [String]) -> String {
        let str = arr.joined(separator: "///")
        return str
    }
    
}

func insertFirstPage() -> Int {
    let questions: [String] = ["The old house was ____ furnished and we had to buy almost everything new.",
                               "The main way into the building is via High Street but there is also a(n) ____ at the back used for deliveries.",
                               "I have been back to the doctor three times and he still hasn't ____ the reason for all the pain I have been suffering from recently.",
                               "You shouldn't have bought so many ____ presents on this holiday. You won't have any money left when you go back home.",
                               "It's a long walk tomorrow. We need to ____ as early as possible.",
                               "Sometimes, we don't appreciate the ____ pleasures of life such as a beautiful sky, a cup of coffee with a friend or seeing a good film at the cinema.",
                               "Even though she is 87, her mind is very ____ and she is very aware of everything going on around her.",
                               "The captain decided to ____ ship even though he thought there was no real danger of it sinking.",
                               "If you continue to ____ debts at this rate, you will have to declare bankruptcy eventually.",
                               "The accidental ____ of four listed buildings near the city centre caused a huge outcry and the manager of the building company was jailed for three months."]
    let answers: [String] = ["sparsely", "access", "pinpointed", "lavish", "set off", "simple", "alert", "abandon", "incur", "demolition"]
    let response_options = [["thinly", "sparsely", "mildly", "rarely"],
                            ["access", "way", "passage", "direction"],
                            ["indicated", "highlighted", "pinpointed", "looked up"],
                            ["rich", "lavish", "worthy", "invaluable"],
                            ["set up", "set in", "set off", "set about"],
                            ["sheer", "simple", "normal", "plain"],
                            ["alert", "lively", "demanding", "lifelike"],
                            ["abandon", "evacuate", "desert", "evict"],
                            ["save", "raise", "incur", "default"],
                            ["disruption", "demolition", "injuring", "squashing"]]
    var question_ids: [Int] = []
    for i in 0...9 {
        let q_id = createQuestionAndReturnId(text: questions[i], answer: answers[i], response_options: response_options[i], type_of_answer_field: 0, max_points: 0)
        question_ids.append(q_id)
    }
    let page_id = createPageAndReturnId(question_ids: question_ids, name_of_file: "", task_type: "grammar", picture: "", max_time: 0, max_points: 0)
    return page_id
}
    
