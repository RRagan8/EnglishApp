import Foundation
import SQLite3
import UIKit


class DBHelper {
    
    let dbPath: String = "project_db.sqlite"
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
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("\ntable \(i) is already created.")
            } else {
                print("\ntable \(i) is not created.")
            }
          } else {
              print("\nCREATE TABLE statement for \(i) is not prepared.")
          }
            sqlite3_reset(createTableStatement)
        }
        sqlite3_finalize(createTableStatement)
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
                PRIMARY KEY(id AUTOINCREMENT)
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
                finished INTEGER NOT NULL DEFAULT 0,
                PRIMARY KEY(id AUTOINCREMENT)
                FOREIGN KEY (user_id)
                    REFERENCES user (id)
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
                PRIMARY KEY(id AUTOINCREMENT)
                FOREIGN KEY (user_id)
                    REFERENCES user (id)
                FOREIGN KEY (article_id)
                    REFERENCES article (id)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS user_word (
                id INTEGER NOT NULL UNIQUE,
                user_id INTEGER NOT NULL,
                word_id INTEGER NOT NULL,
                box_number INTEGER NOT NULL DEFAULT 1,
                days_since_revision INTEGER,
                PRIMARY KEY(id AUTOINCREMENT)
                FOREIGN KEY (user_id)
                    REFERENCES user (id)
                FOREIGN KEY (word_id)
                    REFERENCES word (id)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS article (
                id INTEGER NOT NULL UNIQUE,
                title TEXT,
                description TEXT,
                pages_ids TEXT NOT NULL,
                topic_tags TEXT,
                picture TEXT,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS test (
                id INTEGER NOT NULL UNIQUE,
                title TEXT,
                pages_ids TEXT NOT NULL,
                picture TEXT,
                time_to_finish INTEGER,
                type_tags TEXT,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS exercise (
                id INTEGER NOT NULL UNIQUE,
                title TEXT,
                pages_ids TEXT NOT NULL,
                type_tags TEXT,
                topic_tags TEXT,
                picture TEXT,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS page (
                id INTEGER NOT NULL UNIQUE,
                question_ids INTEGER NOT NULL,
                task_type TEXT,
                picture TEXT,
                path_to_text TEXT,
                time_to_finish INTEGER,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS question (
                id INTEGER NOT NULL UNIQUE,
                text TEXT NOT NULL,
                answer TEXT NOT NULL,
                type_of_answer_field INTEGER,
                PRIMARY KEY(id AUTOINCREMENT)
            );
            """,
            """
            CREATE TABLE IF NOT EXISTS "word" (
                "id" INTEGER NOT NULL UNIQUE,
                "word" TEXT NOT NULL,
                "picture" TEXT,
                "translation" TEXT NOT NULL,
                PRIMARY KEY("id" AUTOINCREMENT)
            );
            """]
    }
    
}
