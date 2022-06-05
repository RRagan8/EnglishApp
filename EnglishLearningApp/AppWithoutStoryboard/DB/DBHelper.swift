import Foundation
import SQLite3
import UIKit


class DBHelper {
    
    let dbPath: String = "db_from_sql.sqlite"
    var db: OpaquePointer? // Swift type for C pointers
    
    init() {
        db = openDatabase()
        createTables()
    }
    
    private func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    private func createTables() {
        let statementStrings = getStringStatements()
        var createTableStatement: OpaquePointer?
        for i in 0...statementStrings.count-1 {
            if sqlite3_prepare_v2(db, statementStrings[i], -1, &createTableStatement, nil) ==
                SQLITE_OK {
                if sqlite3_step(createTableStatement) == SQLITE_DONE{
                    print("\ntable \(i) is already created.")
            }
                else {
                print("\ntable \(i) is not created.")
            }
          } else {
              print("\nCREATE TABLE statement for \(i) is not prepared.")
          }
            sqlite3_reset(createTableStatement)
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func deleteById(name_of_table: String, id:Int) {
        let deleteStatementStirng = "DELETE FROM \(name_of_table) WHERE id = ?;"
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
    
    func deleteFromParent(name_of_field_in_parent_table: String, name_of_parent_table: String, id_of_parent: Int, name_of_child_table: String) {
        let queryStatementString = "SELECT \(name_of_field_in_parent_table) FROM \(name_of_parent_table) WHERE id = \(String(id_of_parent));"
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let children_ids_String = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))  // the ones to delete
                let children_ids = children_ids_String.split(separator: ",")
                var children_id_Ints: [Int] = []
                for id in children_ids {
                    children_id_Ints.append(Int(id)!)
                }
                for id in children_id_Ints {
                    deleteById(name_of_table: name_of_child_table, id: id)
                }
            }
        sqlite3_finalize(queryStatement)
        }
    }

 
    func getStringStatements() -> [String] {
        return [
            """
            CREATE TABLE IF NOT EXISTS user (
                id INTEGER NOT NULL UNIQUE,
                nickname TEXT,
                motivation_tag TEXT,
                motivation_specification TEXT,
                interests_tag TEXT,
                time_intervals INTEGER,
                telegram_notifications INTEGER,
                phone_notifications INTEGER,
                time_inactive INTEGER NOT NULL DEFAULT 0,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS user_question(
                id INTEGER NOT NULL UNIQUE,
                user_id INTEGER NOT NULL,
                question_id INTEGER NOT NULL,
                answer TEXT,
                PRIMARY KEY(id AUTOINCREMENT)),
                FOREIGN KEY (user_id)
                    REFERENCES user (id),
                FOREIGN KEY (question_id)
                    REFERENCES question (id)
            );
                                
            """,
            """
            CREATE TABLE IF NOT EXISTS user_exercise (
                id INTEGER NOT NULL UNIQUE,
                user_id INTEGER NOT NULL,
                exercise_id INTEGER NOT NULL,
                done INTEGER NOT NULL,
                PRIMARY KEY(id AUTOINCREMENT),
                FOREIGN KEY (user_id)
                    REFERENCES user (id),
                FOREIGN KEY (exercise_id)
                    REFERENCES exercise (id)
            );
            """, 
            """
            CREATE TABLE IF NOT EXISTS user_test (
                id INTEGER NOT NULL UNIQUE,
                user_id INTEGER NOT NULL,
                test_id INTEGER NOT NULL,
                done INTEGER NOT NULL DEFAULT 0,
                user_result INTEGER NOT NULL DEFAULT 0,
                time_left_to_finish INTEGER NOT NULL,
                PRIMARY KEY(id AUTOINCREMENT),
                FOREIGN KEY (user_id)
                    REFERENCES user (id),
                FOREIGN KEY (test_id)
                    REFERENCES test (id)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS user_article (
                id INTEGER NOT NULL UNIQUE,
                user_id INTEGER NOT NULL,
                article_id INTEGER NOT NULL,
                read INTEGER NOT NULL DEFAULT 0,
                PRIMARY KEY(id AUTOINCREMENT),
                FOREIGN KEY (user_id)
                    REFERENCES user (id),
                FOREIGN KEY (article_id)
                    REFERENCES article (id)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS user_word (
                id INTEGER NOT NULL UNIQUE,
                user_id INTEGER NOT NULL,
                word_id INTEGER NOT NULL,
                added_by_user INTEGER NOT NULL,
                box_number INTEGER NOT NULL DEFAULT 1,
                days_since_revision INTEGER,
                PRIMARY KEY(id AUTOINCREMENT),
                FOREIGN KEY (user_id)
                    REFERENCES user (id),
                FOREIGN KEY (word_id)
                    REFERENCES word (id)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS article (
                id INTEGER NOT NULL UNIQUE,
                pages_ids TEXT NOT NULL,
                title TEXT,
                topic_tags TEXT,
                description TEXT,
                picture TEXT,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS test (
                id INTEGER NOT NULL UNIQUE,
                pages_ids TEXT NOT NULL,
                title TEXT,
                picture TEXT,
                time_to_finish INTEGER,
                type_tags TEXT,
                max_result INTEGER,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS exercise (
                id INTEGER NOT NULL UNIQUE,
                pages_ids TEXT NOT NULL,
                title TEXT,
                description TEXT,
                topic_tags TEXT,
                type_tags TEXT,
                picture TEXT,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS page (
                id INTEGER NOT NULL UNIQUE,
                question_ids TEXT NOT NULL,
                name_of_file TEXT,
                task_type INTEGER,
                picture TEXT,
                max_time INTEGER,
                max_points INTEGER,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS question (
                id INTEGER NOT NULL UNIQUE,
                text TEXT NOT NULL,
                answer TEXT NOT NULL,
                response_options TEXT,
                type_of_answer_field INTEGER,
                max_points INTEGER,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS word (
                "id" INTEGER NOT NULL UNIQUE,
                "word" TEXT NOT NULL,
                "picture" TEXT,
                "translation" TEXT NOT NULL,
                PRIMARY KEY("id" AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS word_by_user (
                "id" INTEGER NOT NULL UNIQUE,
                "user_id" INTEGER NOT NULL,
                "user_word_id" INTEGER NOT NULL,
                "word" TEXT NOT NULL,
                "picture" TEXT,
                "translation" TEXT NOT NULL,
                PRIMARY KEY("id" AUTOINCREMENT),
                FOREIGN KEY (user_id)
                    REFERENCES user (id),
                FOREIGN KEY (user_word_id)
                    REFERENCES user_word (id)
            );
            """
        ]
    } 
}
