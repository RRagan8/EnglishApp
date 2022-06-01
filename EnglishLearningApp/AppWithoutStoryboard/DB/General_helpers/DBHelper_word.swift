import Foundation
import SQLite3


class DBHelper_word: DBHelper {
    
    func insert(word: String, picture: String, translation: String) {
        let insertStatementString = "INSERT INTO word (word, picture, translation) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 1, (word as NSString).utf8String, -1, nil)
                print((picture as NSString).utf8String!)
                sqlite3_bind_text(insertStatement, 2, (picture as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (translation as NSString).utf8String, -1, nil)
                    
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
        let queryStatementString = "SELECT id, word, picture, translation FROM word;"
        var queryStatement: OpaquePointer? = nil
        var words : [Word] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let word = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                // Something does not work here! Fix it up, please!
                let picture = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let translation = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                words.append(Word(id: Int(id), word: word, picture: picture, translation: translation))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return words
    }
    
    func delete(id: Int) {
        deleteById(name_of_table: "word", id: id)
    }
    
    func fillInWords() {
        insert(word: "cat", picture: "", translation:"кошка")
        insert(word: "cease", picture: "", translation:"прекращать")
        insert(word: "caution", picture: "", translation:"осторожность")
        insert(word: "aid", picture: "", translation: "помощь")
        insert(word: "archaeologist", picture: "", translation: "археолог")
        insert(word: "adviser", picture: "", translation: "советник")
        insert(word: "capitalism", picture: "", translation: "капитализм")
        insert(word: "cheerfulness", picture: "", translation: "жизнерадостность")
        insert(word: "cliché", picture: "", translation: "клише")
        insert(word: "bond", picture: "", translation: "сближаться")
        insert(word: "under your breath,очень тихо", picture: "", translation: "себе под нос")
        insert(word: "adolescent", picture: "", translation: "подросток")
        insert(word: "carve", picture: "", translation: "вырезать")
        insert(word: "bully", picture: "", translation: "обидчик")
        insert(word: "charisma", picture: "", translation: "харизма")
        insert(word: "appoint", picture: "", translation: "назначать")
        insert(word: "bribe", picture: "", translation: "взятка")
        insert(word: "acquaintance", picture: "", translation: "знакомый")
        insert(word: "appliance", picture: "", translation: "прибор, устройство, оборудование")
        insert(word: "alliance", picture: "", translation: "альянс")
        insert(word: "audition", picture: "", translation: "прослушивание")
        insert(word: "exclaim", picture: "", translation: "воскликнуть")
        insert(word: "expenses", picture: "", translation: "расходы")
        insert(word: "condemn", picture: "", translation: "осуждать")
        insert(word: "fall flat", picture: "", translation: "не иметь успеха")
    }
    
}
