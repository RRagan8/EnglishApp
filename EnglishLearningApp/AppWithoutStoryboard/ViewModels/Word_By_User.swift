//
//  Word_By_User.swift
//  English Learning App
//
//  Created by Алёна Яковлева on 01.06.2022.
//

import Foundation

class Word_By_User {
    var id: Int
    var user_id: Int
    var user_word_id: Int
    var word: String
    var picture: String
    var translation: String
    
    init(id: Int, user_id: Int, user_word_id: Int, word: String, picture: String, translation: String) {
        self.id = id
        self.user_id = user_id
        self.user_word_id = user_word_id
        self.word = word
        self.picture = picture
        self.translation = translation
    }
}
