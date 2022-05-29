import Foundation
import SQLite3

class DBHelper_word: DBHelper {
    
    func insert(word: String, translation: String) {
        let insertStatementString = "INSERT INTO word (word, translation) VALUES (?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 1, (word as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (translation as NSString).utf8String, -1, nil)
                    
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
    
    func read() -> [Word] {
        let queryStatementString = "SELECT id, word, translation FROM word;"
        var queryStatement: OpaquePointer? = nil
        var words : [Word] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let word = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let translation = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                words.append(Word(id: Int(id), word: word, translation: translation))
                // print("Query Result:")
                // print("\(id) | \(word) | \(translation)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return words
    }

    func deleteByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM word WHERE id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    func fillInWords() {
        insert(word: "cat", translation:"кошка")
        insert(word: "cease", translation:"прекращать")
        insert(word: "caution", translation:"осторожность")
        insert(word: "aid", translation: "помощь")
        insert(word: "archaeologist", translation: "археолог")
        insert(word: "adviser",translation: "советник")
        insert(word: "capitalism", translation: "капитализм")
        insert(word: "cheerfulness", translation: "жизнерадостность")
        insert(word: "cliché", translation: "клише")
        insert(word: "bond", translation: "сближаться")
        insert(word: "under your breath,очень тихо", translation: "себе под нос")
        insert(word: "adolescent", translation: "подросток")
        insert(word: "carve", translation: "вырезать")
        insert(word: "bully", translation: "обидчик")
        insert(word: "charisma", translation: "харизма")
        insert(word: "appoint", translation: "назначать")
        insert(word: "bribe", translation: "взятка")
        insert(word: "acquaintance", translation: "знакомый")
        insert(word: "appliance", translation: "прибор, устройство, оборудование")
        insert(word: "alliance", translation: "альянс")
        insert(word: "audition", translation: "прослушивание")
        insert(word: "exclaim", translation: "воскликнуть")
        insert(word: "expenses", translation: "расходы")
        insert(word: "condemn", translation: "осуждать")
        insert(word: "fall flat", translation: "не иметь успеха")
    }
    
}
